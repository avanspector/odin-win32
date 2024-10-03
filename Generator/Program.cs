using Mono.Cecil;
using System.Diagnostics;
using System.IO.Compression;
using System.Numerics;
using System.Text;
using static System.Reflection.Assembly;

using var mem = new MemoryStream();
using var res = GetExecutingAssembly().GetManifestResourceStream("Generator.Windows.Win32.winmd.gz");
using var gz = new GZipStream(res!, CompressionMode.Decompress);
gz.CopyTo(mem);
mem.Seek(0, SeekOrigin.Begin);
using var metadata = ModuleDefinition.ReadModule(mem);

var windowsDir = $"{Directory.GetCurrentDirectory()}/windows";
Directory.CreateDirectory(windowsDir);

var currPkg = "";
var functions = new List<MethodDefinition>();
var types = new List<TypeDefinition>();
var constants = new List<FieldDefinition>();
var aliases = new HashSet<string>();
var imports = new HashSet<string>();

var dependencies = new Dictionary<string, HashSet<TypeDefinition>>();
var exceptions = new HashSet<string>
{
	"D3DDisassemble10Effect",
	"InitializeSListHead",
	"InterlockedFlushSList",
	"InterlockedPopEntrySList",
	"InterlockedPushEntrySList",
	"InterlockedPushListSListEx",
	"QueryDepthSList",
};

var namespaces = new HashSet<string>
{
	"Windows.Win32.Foundation",
	"Windows.Win32.Globalization",
	"Windows.Win32.Graphics.Direct3D",
	"Windows.Win32.Graphics.Direct3D.Fxc",
	"Windows.Win32.Graphics.Direct3D11",
	"Windows.Win32.Graphics.Direct3D11on12",
	"Windows.Win32.Graphics.Direct3D12",
	"Windows.Win32.Graphics.Dxgi",
	"Windows.Win32.Graphics.Dxgi.Common",
	"Windows.Win32.Security",
	"Windows.Win32.Storage.FileSystem",
	"Windows.Win32.System.Console",
	"Windows.Win32.System.IO",
	"Windows.Win32.System.Memory",
	"Windows.Win32.System.Performance",
	"Windows.Win32.System.SystemInformation",
	"Windows.Win32.System.Threading",
};

var packageAliases = new Dictionary<string, HashSet<string>>
{
	{ "d3d", new HashSet<string>{ "win32" } },
	{ "d3d11", new HashSet<string>{ "win32" } },
	{ "d3d12", new HashSet<string>{ "win32" } },
	{ "d3dcompiler", new HashSet<string>{ "win32" } },
	{ "dxgi", new HashSet<string>{ "win32" } },
};

string MapNamespaceToPackage(string ns)
{
	return ns switch
	{
		"Windows.Win32.Graphics.Direct3D" => "d3d",

		"Windows.Win32.Graphics.Direct3D11" or
		"Windows.Win32.Graphics.Direct3D11on12" => "d3d11",

		"Windows.Win32.Graphics.Direct3D12" => "d3d12",

		"Windows.Win32.Graphics.Direct3D.Fxc" => "d3dcompiler",

		"Windows.Win32.Graphics.Dxgi" or
		"Windows.Win32.Graphics.Dxgi.Common" => "dxgi",

		"Windows.Win32.Foundation" or
		"Windows.Win32.Globalization" or
		"Windows.Win32.Graphics.Gdi" or
		"Windows.Win32.Security" or
		"Windows.Win32.Security.Cryptography" or
		"Windows.Win32.Storage.FileSystem" or
		"Windows.Win32.System.Com" or
		"Windows.Win32.System.Console" or
		"Windows.Win32.System.IO" or
		"Windows.Win32.System.Kernel" or
		"Windows.Win32.System.Memory" or
		"Windows.Win32.System.Ole" or
		"Windows.Win32.System.Performance" or
		"Windows.Win32.System.SystemInformation" or
		"Windows.Win32.System.SystemServices" or
		"Windows.Win32.System.Threading" or
		"Windows.Win32.System.Variant" => "win32",
		_ => "",
	};
};

foreach (var (pkg, _) in packageAliases)
{
	currPkg = pkg;

	foreach (var t in metadata.GetTypes().Where(t =>
		!t.IsNested && MapNamespaceToPackage(t.Namespace) == pkg &&
		namespaces.Contains(t.Namespace) && !exceptions.Contains(t.Name)))
	{
		AddDecl(t);
	}

	Directory.CreateDirectory($"{windowsDir}/{pkg}");
	var file = $"{windowsDir}/{pkg}/{pkg}.odin";
	using var fs = File.CreateText(file);

	fs.WriteLine($"package windows_{pkg}\n");

	WriteFunctions(fs);
	WriteTypes(fs);
	WriteConstants(fs);
	WriteAliasesAndImports(fs);

	fs.Flush();

	functions.Clear();
	types.Clear();
	constants.Clear();
	aliases.Clear();
	imports.Clear();
}

foreach (var ns in namespaces)
{
	currPkg = MapNamespaceToPackage(ns);
	if (currPkg != "win32") continue;

	foreach (var t in metadata.GetTypes().Where(t =>
		!t.IsNested && t.Namespace == ns && !exceptions.Contains(t.Name)))
	{
		AddDecl(t);
	}

	var lastPeriod = ns.LastIndexOf('.');
	if (ns.EndsWith(".Common"))
	{
		lastPeriod = ns.Substring(0, lastPeriod).LastIndexOf('.');
	}
	var file = ns.Substring(ns.LastIndexOf('.') + 1).ToLower().Replace('.', '_');
	file = $"{windowsDir}/{file}.odin";
	using var fs = File.CreateText(file);

	fs.WriteLine("package windows\n");

	WriteFunctions(fs);
	WriteTypes(fs);

	if (ns == "Windows.Win32.Foundation")
	{
		fs.WriteLine("""
			GUID :: struct {
				Data1: u32,
				Data2: u16,
				Data3: u16,
				Data4: [8]u8,
			}
			""" + "\n");
	}

	WriteConstants(fs);

	fs.Flush();

	functions.Clear();
	types.Clear();
	constants.Clear();
	aliases.Clear();
	imports.Clear();
}

for (var i = 0; i < 5; i++)
{
	foreach (var (ns, ts) in dependencies)
	{
		currPkg = MapNamespaceToPackage(ns);
		Debug.Assert(currPkg != "");

		types.AddRange(ts);

		if (currPkg == "win32")
		{
			var lastPeriod = ns.LastIndexOf('.');
			if (ns.EndsWith(".Common"))
			{
				lastPeriod = ns.Substring(0, lastPeriod).LastIndexOf('.');
			}
			var file = ns.Substring(ns.LastIndexOf('.') + 1).ToLower().Replace('.', '_');
			file = $"{windowsDir}/{file}.odin";
			using var fs = File.CreateText(file);

			fs.WriteLine("package windows\n");
			WriteTypes(fs);
			fs.Flush();
		}
		else
		{
			Directory.CreateDirectory($"{windowsDir}/{currPkg}");
			var file = $"{windowsDir}/{currPkg}/{currPkg}.odin";
			using var fs = File.CreateText(file);

			fs.WriteLine($"package windows_{currPkg}\n");
			WriteTypes(fs);
			WriteAliasesAndImports(fs);
			fs.Flush();
		}

		functions.Clear();
		types.Clear();
		constants.Clear();
		aliases.Clear();
		imports.Clear();
	}
}

string DeclName(string name, string pkg)
{
	switch (pkg)
	{
		case "d3d":
			if (name.StartsWith("D3D_")) name = name.Remove(0, "D3D_".Length);
			else if (name.StartsWith("D3D")) name = name.Remove(0, "D3D".Length);
			else if (name.StartsWith("ID3D")) name = name.Remove(1, "D3D".Length);
			break;

		// FIXME: "D3DX11", "D3D", "ID3DX11", "ID3D"?
		case "d3d11":
			if (name.StartsWith("D3D_")) name = name.Remove(0, "D3D_".Length);
			else if (name.StartsWith("D3D11_")) name = name.Remove(0, "D3D11_".Length);
			else if (name.StartsWith("D3D11")) name = name.Remove(0, "D3D11".Length);
			else if (name.StartsWith("ID3D11")) name = name.Remove(1, "D3D11".Length);
			break;

		case "d3d12":
			if (name.StartsWith("D3D_")) name = name.Remove(0, "D3D_".Length);
			else if (name.StartsWith("D3D12_")) name = name.Remove(0, "D3D12_".Length);
			else if (name.StartsWith("D3D12")) name = name.Remove(0, "D3D12".Length);
			else if (name.StartsWith("ID3D12")) name = name.Remove(1, "D3D12".Length);
			break;

		case "d3dcompiler":
			if (name.StartsWith("D3D_")) name = name.Remove(0, "D3D_".Length);
			else if (name.StartsWith("D3DCOMPILER_")) name = name.Remove(0, "D3DCOMPILER_".Length);
			else if (name.StartsWith("D3D")) name = name.Remove(0, "D3D".Length);
			break;

		case "dxgi":
			if (name.StartsWith("DXGI_")) name = name.Remove(0, "DXGI_".Length);
			else if (name.StartsWith("DXGI")) name = name.Remove(0, "DXGI".Length);
			else if (name.StartsWith("IDXGI")) name = name.Remove(1, "DXGI".Length);
			break;

		case "win32":
			break;

		default:
			throw new ApplicationException("Unknown package.");
	}

	if (name[0] == '_' && !char.IsAsciiDigit(name[1]))
	{
		name = name.Substring(1);
	}
	else if (char.IsAsciiDigit(name[0]))
	{
		name = "_" + name;
	}

	return name;
}

string TypeName(TypeDefinition t)
{
	var typePkg = "";
	var typeName = "";

	if (t.Name == "Guid")
	{
		typePkg = "win32";
		typeName = "GUID";
	}
	else
	{
		typePkg = MapNamespaceToPackage(t.Namespace);
		typeName = DeclName(t.Name, typePkg);

		if (!namespaces.Contains(t.Namespace))
		{
			dependencies.TryAdd(t.Namespace, new());
			dependencies[t.Namespace].Add(t);

			var arch = Attr.SupportedArch(t);
			if (arch != "" && !arch.Contains("amd64"))
			{
				foreach (var type in metadata.GetTypes().Where(type =>
					type.Namespace == t.Namespace && type.Name == t.Name))
				{
					if (Attr.SupportedArch(type).Contains("arm64")) continue;
					dependencies[t.Namespace].Add(type);
				}
			}
		}
	}

	if (typePkg == currPkg)
	{
		return typeName;
	}

	imports.Add(typePkg);

	var str = $"{typePkg}.{typeName}";

	if (packageAliases[currPkg].Contains(typePkg))
	{
		aliases.Add($"{typeName} :: {str}");
		return typeName;
	}

	return str;
}

string Field(TypeReference t)
{
	if (t.IsPointer)
	{
		var elemType = t.GetElementType();
		var str = "^" + Field(elemType);
		if (str == "^void") str = "rawptr";
		return str;
	}
	else if (t.IsArray)
	{
		var arrayType = (ArrayType)t;
		var elemType = arrayType.ElementType;
		var str = $"[{arrayType.Dimensions[0].UpperBound + 1}]" + Field(elemType);
		return str;
	}
	else if (t.MetadataType == MetadataType.Void)
	{
		return "void";
	}
	else if (t.IsPrimitive)
	{
		return t.MetadataType switch
		{
			MetadataType.SByte => "i8",
			MetadataType.Byte => "u8",
			MetadataType.Int16 => "i16",
			MetadataType.UInt16 => "u16",
			MetadataType.Int32 => "i32",
			MetadataType.UInt32 => "u32",
			MetadataType.Int64 => "i64",
			MetadataType.UInt64 => "u64",
			MetadataType.Single => "f32",
			MetadataType.Double => "f64",
			MetadataType.IntPtr => "int",
			MetadataType.UIntPtr => "uintptr",
			MetadataType.Char => "u16",
			_ => throw new ApplicationException("Unknown primitive type."),
		};
	}
	else if (t.Resolve() == null)
	{
		// FIXME: !!!
		Debug.Assert(false);
	}
	else if (t.Resolve().IsInterface)
	{
		return "^" + TypeName(t.Resolve());
	}
	else if (t.IsNested)
	{
		return StructDecl(t.Resolve());
	}

	return TypeName(t.Resolve());
}

string StructDecl(TypeDefinition t)
{
	var sb = new StringBuilder();
	
	var isUnion = t.IsExplicitLayout;
	var isPacked = t.PackingSize == 1;
	var isMaxAlign = t.PackingSize != -1 && t.PackingSize != 1;
	Debug.Assert(!isPacked || !isMaxAlign);

	if (t.Fields.Count == 0)
	{
		Console.WriteLine($"Empty struct: {t.FullName}");
	}

	sb.Append("struct " +
		(isUnion ? "#raw_union " : "") +
		(isPacked ? "#packed " : "") +
		(isMaxAlign ? $"#max_field_align({t.PackingSize}) " : "") +
		"{\n");
	
	{
		using var _ = new Indent();
		foreach (var f in t.Fields)
		{
			var bitfields = Attr.NativeBitfield(f);
			if (bitfields != null)
			{
				var name = "using _";
				var fieldType = Field(f.FieldType);
				Debug.Assert(f.FieldType.IsPrimitive);

				sb.Append($"{Indent.String}{name}: bit_field {fieldType} {{\n");
				{
					using var __ = new Indent();
					var str = string.Join("\n", bitfields.Select(b =>
						$"{Indent.String}{b.Name}: {fieldType} | {b.Length},"));
					sb.Append($"{str}\n");
				}
				sb.Append($"{Indent.String}}},\n");
			}
			else
			{
				var name = f.Name.StartsWith("Anonymous") ? "using _" : Fix.KeywordCollision(f.Name);
				var assoc = Attr.AssociatedEnum(f);
				Debug.Assert(assoc == "" || f.FieldType.IsPrimitive);

				var field = assoc != "" ? DeclName(assoc, currPkg) : Field(f.FieldType);

				if (assoc != "" && !namespaces.Contains(t.Namespace))
				{
					dependencies[t.Namespace].Add(metadata.GetType(t.Namespace, assoc));
				}
			
				sb.Append($"{Indent.String}{name}: {field},\n");
			}

		}
	}

	sb.Append($"{Indent.String}}}");
	return sb.ToString();
}

string EnumDecl(TypeDefinition t)
{
	static string CommonBeginningString(IEnumerable<string> strings, bool ignoreUnderscore)
	{
		if (strings.Count() < 2) return "";

		var shortest = strings.MinBy(str => str.Length);
		Debug.Assert(shortest != null);

		var len = 0;
		if (ignoreUnderscore)
		{
			len = shortest.Length;
		}
		else
		{
			var underscoreIdx = shortest.LastIndexOf('_');
			len = underscoreIdx > -1 ? underscoreIdx + 1 : shortest.Length;
		}
		Debug.Assert(len > 0);

		for (/**/; len > 0; len--)
		{
			var substr = shortest.Substring(0, len);
			if (strings.All(str => str.StartsWith(substr)))
			{
				return substr;
			}
		}

		return "";
	}

	static uint GetUInt(object o) => o switch
	{
		uint u32 => u32,
		ushort u16 => u16,
		byte u8 => u8,
		int i32 => (uint)i32,
		short i16 => (uint)i16,
		_ => throw new NotSupportedException(),
	};

	static string FormatUInt(object o, uint value) => o switch
	{
		uint u32 => $"0x{value:X8}",
		ushort u16 => $"0x{value:X4}",
		byte u8 => $"0x{value:X2}",
		int i32 => $"{i32}",
		short i16 => $"{i16}",
		_ => throw new NotSupportedException(),
	};

	var sb = new StringBuilder();

	var enumName = TypeName(t);
	var backingType = Field(t.Fields[0].FieldType);
	var isFlags = Attr.IsFlags(t);

	(int Skip, int Take) range = t.Name switch
	{
		"D3D_CBUFFER_TYPE" => (0, 4),
		"D3D_INCLUDE_TYPE" => (0, 2),
		"D3D_NAME" => (0, 27),
		"D3D_PRIMITIVE" => (0, 38),
		"D3D_PRIMITIVE_TOPOLOGY" => (0, 43),
		"D3D_REGISTER_COMPONENT_TYPE" => (0, 10),
		"D3D_RESOURCE_RETURN_TYPE" => (0, 8),
		"D3D_SHADER_CBUFFER_FLAGS" => (0, 1),
		"D3D_SHADER_INPUT_FLAGS" => (0, 6),
		"D3D_SHADER_INPUT_TYPE" => (0, 14),
		"D3D_SHADER_VARIABLE_CLASS" => (0, 8),
		"D3D_SHADER_VARIABLE_FLAGS" => (0, 4),
		"D3D_SHADER_VARIABLE_TYPE" => (0, 63),
		"D3D_SRV_DIMENSION" => (0, 12),
		"D3D_TESSELLATOR_DOMAIN" => (0, 4),
		"D3D_TESSELLATOR_OUTPUT_PRIMITIVE" => (0, 5),
		"D3D_TESSELLATOR_PARTITIONING" => (0, 5),
		_ => (0, 0),
	};

	var fields = t.Fields.Skip(1 + range.Skip);
	if (range.Take != 0) fields = fields.Take(range.Take);

	var fieldNames = fields.Select(f => f.Name).ToArray();

	if (enumName != "WIN32_ERROR")
	{
		var prefix = CommonBeginningString(fieldNames, false);

		Debug.Assert(fields.Count() > 0);

		for (var i = 0; i < fieldNames.Length; i++)
		{
			if (fieldNames.Length < 2)
			{
				prefix = CommonBeginningString(new string[] { fieldNames[0], t.Name }, true);
			}

			var str = fieldNames[i].Remove(0, prefix.Length);
			if (str[0] == '_' && !char.IsAsciiDigit(str[1]))
			{
				str = str.Substring(1);
			}
			else if (char.IsAsciiDigit(str[0]))
			{
				str = "_" + str;
			}

			fieldNames[i] = str;
		}
	}

	var validFields = new List<string>();
	var deferredconstants = new List<string>();

	for (var i = 0; i < fieldNames.Length; i++)
	{
		using var _ = new Indent();

		var c = fields.ElementAt(i).Constant;
		var value = GetUInt(c);

		if (isFlags)
		{
			if (BitOperations.IsPow2(value))
			{
				validFields.Add($"{Indent.String}{fieldNames[i]} = {BitOperations.Log2(value)}");
			}
			else
			{
				deferredconstants.Add($"{(enumName + "_" + fieldNames[i]).Replace("__", "_")} :: " +
					$"transmute({enumName}){backingType}({FormatUInt(c, value)})");
			}
		}
		else
		{
			validFields.Add($"{Indent.String}{fieldNames[i]} = {FormatUInt(c, value)}");
		}
	}

	if (isFlags)
	{
		using var _ = new Indent();

		sb.Append($"{enumName} :: distinct bit_set[enum {{");

		if (validFields.Count > 0)
		{
			sb.Append($"\n{string.Join(",\n", validFields)},\n");
		}

		sb.Append($"}}; {backingType}]");

		if (deferredconstants.Count > 0)
		{
			sb.Append($"\n{string.Join("\n", deferredconstants)}");
		}
	}
	else
	{
		Debug.Assert(deferredconstants.Count == 0);

		sb.Append($"{enumName} :: enum {backingType} {{");
		if (enumName == "WIN32_ERROR")
		{
			sb.Append("\n");
			foreach (var f in validFields)
			{
				if (f.Contains("ERROR_DS_NAME_ERROR_"))
				{
					sb.Append($"\t{f.Substring("ERROR_".Length + 1)},\n");
				}
				else
				{
					sb.Append($"{f.Replace("_ERROR_", "_").Replace("ERROR_", "")},\n");
				}
			}
			sb.Append("\n");
		}
		else
		{
			sb.Append($"\n{string.Join(",\n", validFields)},\n");
		}
		sb.Append("}");
	}

	return sb.ToString();
}

string FunctionDecl(MethodDefinition m)
{
	var sb = new StringBuilder();

	var len = m.DeclaringType.IsInterface ? m.Parameters.Count + 1 : m.Parameters.Count;
	var off = m.DeclaringType.IsInterface ? 1 : 0;
	var paramNames = new string[len];
	var paramTypes = new string[len];

	if (m.DeclaringType.IsInterface)
	{
		paramNames[0] = "this";
		paramTypes[0] = "^" + TypeName(m.DeclaringType);
	}

	sb.Append("(");

	for (var i = 0; i < m.Parameters.Count; i++)
	{
		var assoc = Attr.AssociatedEnum(m.Parameters[i]);
		Debug.Assert(assoc == "" || m.Parameters[i].ParameterType.GetElementType().IsPrimitive);
		
		var paramName = Fix.KeywordCollision(m.Parameters[i].Name);
		var paramType = assoc != "" ? DeclName(assoc, currPkg) : Field(m.Parameters[i].ParameterType);

		if (assoc != "" && !namespaces.Contains(m.DeclaringType.Namespace))
		{
			dependencies[m.DeclaringType.Namespace].Add(metadata.GetType(m.DeclaringType.Namespace, assoc));
		}

		if (currPkg == "d3d11" && paramName == "ClearFlags" && m.Name == "ClearDepthStencilView")
		{
			paramType = "CLEAR_FLAG";
		}
		else if (paramType != "PWSTR" && paramType != "PSTR" && paramType != "rawptr")
		{
			var arrayCount = Attr.NativeArrayCount(m.Parameters[i]);

			if (arrayCount != null)
			{
				Debug.Assert(paramType[0] == '^' && m.Parameters[i].ParameterType.IsPointer);
				paramType = (arrayCount != 0 ? $"^[{arrayCount}]" : "[^]") + paramType.Substring(1);
			}
			else if (Attr.IsConst(m.Parameters[i]) &&
				m.Parameters[i].ParameterType.IsPointer &&
				!m.Parameters[i].ParameterType.GetElementType().IsPrimitive &&
				(m.Parameters[i].Attributes & ParameterAttributes.Optional) == 0)
			{
				Debug.Assert(paramType[0] == '^' && m.Parameters[i].ParameterType.IsPointer);
				paramType = paramType.Substring(1);
				paramName = "#by_ptr " + paramName;
			}
		}

		paramNames[i + off] = paramName;
		paramTypes[i + off] = paramType;
	}

	if (Indent.Tabs * 8 + sb.Length + paramNames.Sum(p => p.Length) +
		paramTypes.Sum(p => p.Length) + m.ReturnType.Name.Length > 80)
	{
		var str = "";
		{
			using var _ = new Indent();
			str = string.Join(",\n", paramNames.Select((name, i) => $"{Indent.String}{name}: {paramTypes[i]}"));
		}
		sb.Append($"\n{str},\n{Indent.String})");
	}
	else
	{
		var str = string.Join(", ", paramNames.Select((name, i) => $"{name}: {paramTypes[i]}"));
		sb.Append($"{str})");
	}

	var ret = Field(m.ReturnType);
	if (ret != "void") 
	{
		sb.Append($" -> {ret}");
	}
	else if (Attr.DoesNotReturn(m))
	{
		sb.Append(" -> !");
	}

	return sb.ToString();
}

string InterfaceDecl(TypeDefinition t)
{
	var sb = new StringBuilder();

	var name = TypeName(t);
	var vtbl = name + "_Vtbl";

	var baseTypeName = t.Interfaces.Count > 0
		? TypeName(t.Interfaces[0].InterfaceType.Resolve())
		: "";
	var baseTypeVtbl = baseTypeName != "" ? baseTypeName + "_Vtbl" : "";

	var baseName = baseTypeName;
	var baseVtbl = baseTypeVtbl;

	var periodIdx = baseName.IndexOf('.');
	if (periodIdx > -1)
	{
		baseName = baseName.Substring(periodIdx + 1);
		baseVtbl = baseVtbl.Substring(periodIdx + 1);
	}
	else if (baseName != "")
	{
		var basePkg = MapNamespaceToPackage(t.Interfaces[0].InterfaceType.Namespace);
		if (basePkg != currPkg)
		{
			aliases.Add($"{baseVtbl} :: {basePkg}.{baseTypeVtbl}");
		}
	}

	sb.Append($"{name} :: struct #raw_union {{\n");
	{
		using var _ = new Indent();
		if (baseName != "")
		{
			sb.Append($"{Indent.String}#subtype {baseName}: {baseTypeName},\n");
		}
		sb.Append($"{Indent.String}using Vtbl: ^{vtbl},\n");
	}
	sb.Append($"{Indent.String}}}\n");

	sb.Append($"{vtbl} :: struct {{\n");
	{
		using var _ = new Indent();
		if (baseName != "")
		{
			sb.Append($"{Indent.String}using {baseVtbl}: {baseVtbl},\n");
		}

		if (t.Methods.Count != 0)
		{
			sb.Append(string.Join(",\n", t.Methods.Select(m =>
				$"{Indent.String}{m.Name}: proc \"system\" {FunctionDecl(m)}")));
			sb.Append(",\n");
		}
	}
	sb.Append($"{Indent.String}}}");

	var guid = Attr.GUID(t);
	if (guid != "")
	{
		sb.Append($"\nIID_{t.Name} :: GUID{guid}");
		aliases.Add("GUID :: win32.GUID");
	}

	return sb.ToString();
}

void WriteFunctions(StreamWriter s)
{
	if (functions.Count == 0) return;

	var dllMap = new Dictionary<string, List<MethodDefinition>>();
	var forceInlines = new List<MethodDefinition>();

	foreach (var func in functions)
	{
		var dll = func.PInvokeInfo.Module.Name;
		if (dll == "FORCEINLINE")
		{
			forceInlines.Add(func);
		}
		else
		{
			dll = Fix.Dll(dll);
			if (dll == "__BRUH__") continue;
			dllMap.TryAdd(dll, new());
			dllMap[dll].Add(func);
		}
	}

	if (forceInlines.Count != 0)
	{
		Console.WriteLine($"forceInlines count: {forceInlines.Count}");
	}

	foreach (var (dll, _) in dllMap.OrderBy(pair => pair.Key))
	{
		var lib = dll.Substring(0, dll.Length - 4);
		s.WriteLine($"foreign import {lib} \"system:{dll}\"");
	}

	s.WriteLine();

	foreach (var (dll, dllFuncs) in dllMap.OrderBy(pair => pair.Key))
	{
		var lib = dll.Replace(".lib", "");
		s.WriteLine("@(default_calling_convention=\"system\")");
		s.WriteLine($"foreign {lib} {{");

		using var _ = new Indent();
		var funcs = dllFuncs.OrderBy(f => f.Name).ToArray();

		for (var i = 0; i < funcs.Count(); i++)
		{
			var func = funcs[i];
			
			Indent __;
			var arch = Attr.SupportedArch(func);
			if (arch != "")
			{
				s.WriteLine($"when {arch} {{");
				__ = new Indent();
			}

			var documentation = Attr.Documentation(func);
			if (documentation != "")
			{
				s.WriteLine($"{Indent.String}// [[ Documentation; {documentation} ]]");
			}

			var name = DeclName(func.Name, currPkg);
			if (name != func.Name)
			{
				s.WriteLine($"{Indent.String}@(link_name=\"{func.Name}\")");
			}

			s.WriteLine($"{Indent.String}{name} :: proc{FunctionDecl(func)} ---");

			if (i < funcs.Count() - 1) s.WriteLine();

			if (arch != "")
			{
				__.Dispose();
				s.WriteLine("}");
			}
		}

		s.WriteLine("}\n");
	}

	foreach (var func in forceInlines)
	{
		var name = DeclName(func.Name, currPkg);
		var ret = Field(func.ReturnType);

		s.WriteLine($"{name} :: #force_inline proc \"system\" () -> {ret} {{");
		s.WriteLine($"\treturn {ret}(transmute(uintptr)(int({Attr.Constant(func)})))");
		s.WriteLine("}\n");
	}
}

void WriteTypes(StreamWriter s)
{
	foreach (var t in types.OrderBy(t => t.Name))
	{
		Indent _;
		var arch = Attr.SupportedArch(t);
		if (arch != "")
		{
			s.WriteLine($"when {arch} {{");
			_ = new Indent();
		}

		var documentation = Attr.Documentation(t);
		if (documentation != "")
		{
			s.WriteLine($"{Indent.String}// [[ Documentation; {documentation} ]]");
		}

		if (t.IsEnum)
		{
			s.WriteLine($"{Indent.String}{EnumDecl(t)}");
		}
		else if (t.IsInterface)
		{
			s.WriteLine($"{Indent.String}{InterfaceDecl(t)}");
		}
		else if (t.BaseType.FullName == "System.MulticastDelegate")
		{
			var name = TypeName(t);
			s.WriteLine($"{Indent.String}{name} :: " +
				$"#type proc \"{Attr.FuncPtrCallConv(t)}\" {FunctionDecl(t.Methods.First(m => m.Name == "Invoke"))}");
		}
		else if (Attr.IsNativeTypedef(t))
		{
			var name = TypeName(t);

			if (name == "PSTR")
			{
				s.WriteLine($"{Indent.String}{name} :: cstring");
			}
			else if (name == "PWSTR" || name == "BSTR")
			{
				s.WriteLine($"{Indent.String}{name} :: [^]u16");
			}
			else if (name == "BOOL")
			{
				s.WriteLine($"{Indent.String}{name} :: b32");
			}
			else if (name == "BOOLEAN")
			{
				s.WriteLine($"{Indent.String}{name} :: bool");
			}
			else
			{
				s.WriteLine($"{Indent.String}{name} :: {Field(t.Fields[0].FieldType)}");
			}
		}
		else
		{
			var name = TypeName(t);
			s.WriteLine($"{Indent.String}{name} :: {StructDecl(t)}");

			var guid = Attr.GUID(t);
			if (guid != "")
			{
				// FIXME: Or use the Odin equivalent?
				s.WriteLine($"IID_{t.Name} :: GUID{guid}");
				aliases.Add("GUID :: win32.GUID");
			}
		}

		if (arch != "")
		{
			_.Dispose();
			s.WriteLine("}");
		}

		s.WriteLine();
	}
}

void WriteConstants(StreamWriter s)
{
	if (constants.Count == 0) return;

	foreach (var c in constants.OrderBy(c => c.Name))
	{
		if (c.Name == "INVALID_HANDLE_VALUE")
		{
			s.WriteLine("INVALID_HANDLE_VALUE :: HANDLE(transmute(uintptr)int(-1))");
			continue;
		}

		var documentation = Attr.Documentation(c);
		if (documentation != "")
		{
			s.WriteLine($"{Indent.String}// [[ Documentation; {documentation} ]]");
		}

		var name = DeclName(c.Name, currPkg);
		var type = "";
		var value = "";

		if (c.HasConstant)
		{
			value = c.Constant is string ? $"\"{Fix.StringLiteral((string)c.Constant)}\"" : $"{c.Constant}";
		}
		else
		{
			type = TypeName(c.FieldType.Resolve());

			var guid = Attr.GUID(c);
			var constant = Attr.Constant(c);
			Debug.Assert((guid == "") != (constant == ""));

			value = guid != "" ? guid : $"{{{constant}}}";
			if (value == "{0}") value = "{}";
		}
		Debug.Assert(value != "");

		s.WriteLine(name.Length + type.Length + value.Length > 120
			? $"{name} ::\n\t{type}{value}"
			: $"{name} :: {type}{value}");
	}

	s.WriteLine();
}

void WriteAliasesAndImports(StreamWriter s)
{
	foreach (var a in aliases.Order())
	{
		s.WriteLine(a);
	}

	s.WriteLine();

	foreach (var i in imports.Order())
	{
		s.WriteLine(i == "win32" ? "import win32 \"..\"" : $"import \"../{i}\"");
	}
}

void AddDecl(TypeDefinition t)
{
	if (t.Name == "Apis")
	{
		functions.AddRange(t.Methods.Where(f => !exceptions.Contains(f.Name)));
		constants.AddRange(t.Fields.Where(c => !exceptions.Contains(c.Name)));
	}
	else
	{
		types.Add(t);
	}
}

static class Attr
{
	[Flags]
	enum Architecture
	{
		None = 0,
		X86 = 1,
		X64 = 2,
		Arm64 = 4,
		All = 7
	}

	enum CallingConvention
	{
		Winapi = 1,
		Cdecl,
		StdCall,
		ThisCall,
		FastCall,
	};

	public static string AssociatedEnum(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.AssociatedEnumAttribute");

		if (attr == null) return "";

		var ca = attr.ConstructorArguments;
		return (string)ca[0].Value;
	}

	public static string Constant(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.ConstantAttribute");

		if (attr == null) return "";

		var ca = attr.ConstructorArguments;
		return (string)ca[0].Value;
	}

	public static string Documentation(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.DocumentationAttribute");

		if (attr == null) return "";

		var ca = attr.ConstructorArguments;
		return (string)ca[0].Value;
	}

	public static bool DoesNotReturn(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "System.Diagnostics.CodeAnalysis.DoesNotReturnAttribute");

		return attr != null;
	}

	public static string FuncPtrCallConv(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "System.Runtime.InteropServices.UnmanagedFunctionPointerAttribute");

		if (attr == null) return "";

		var ca = attr.ConstructorArguments;
		var callConv = (CallingConvention)ca[0].Value;

		return callConv switch
		{
			CallingConvention.Winapi => "system",
			CallingConvention.Cdecl => "c",
			CallingConvention.StdCall => "stdcall",
			_ => throw new ApplicationException($"Unknown calling convention."),
		};
	}

	public static string GUID(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.GuidAttribute");

		if (attr == null) return "";

		var ca = attr.ConstructorArguments;
		return $"{{0x{ca[0].Value:X8}, 0x{ca[1].Value:X4}, 0x{ca[2].Value:X4}, " +
			$"{{{string.Join(", ", ca.Skip(3).Select(x => $"0x{x.Value:X2}"))}}}}}";
	}

	public static bool IsConst(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.ConstAttribute");
		return attr != null;
	}

	public static bool IsFlags(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "System.FlagsAttribute");
		return attr != null;
	}

	public static bool IsNativeTypedef(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.NativeTypedefAttribute");
		return attr != null;
	}

	public static int? NativeArrayCount(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.NativeArrayInfoAttribute");

		if (attr == null) return null;

		var f = attr.Fields[0];
		return f.Name == "CountConst" ? (int)f.Argument.Value : 0;
	}

	public static (string Name, long Length)[]? NativeBitfield(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.Where(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.NativeBitfieldAttribute");

		if (attr.Count() == 0) return null;

		var bitfields = attr.Select(a =>
			((string)a.ConstructorArguments[0].Value, (long)a.ConstructorArguments[2].Value)).ToArray();
		return bitfields;
	}

	public static string SupportedArch(ICustomAttributeProvider p)
	{
		var attr = p.CustomAttributes.FirstOrDefault(attr =>
			attr.AttributeType.FullName == "Windows.Win32.Foundation.Metadata.SupportedArchitectureAttribute");

		if (attr == null) return "";

		var ca = attr.ConstructorArguments;
		var arch = (Architecture)ca[0].Value;
		return arch switch
		{
			Architecture.X86 => "ODIN_ARCH == .i386",
			Architecture.X64 => "ODIN_ARCH == .amd64",
			Architecture.Arm64 => "ODIN_ARCH == .arm64",
			Architecture.X64 | Architecture.Arm64 => "ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64",
			_ => throw new ApplicationException(),
		};
	}
}

static class Fix
{
	public static string Dll(string dll)
	{
		dll = dll.ToLower();
		return dll switch
		{
			"api-ms-win-core-file-fromapp-l1-1-0.dll" => "onecoreuap_apiset.lib",
			"api-ms-win-core-handle-l1-1-0.dll" => "kernelbase.lib",
			"api-ms-win-core-ioring-l1-1-0.dll" => "__BRUH__",
			"api-ms-win-core-memory-l1-1-3.dll" => "windowsapp.lib",
			"api-ms-win-core-memory-l1-1-4.dll" => "onecore.lib",
			"api-ms-win-core-memory-l1-1-5.dll" => "onecore.lib",
			"api-ms-win-core-memory-l1-1-6.dll" => "onecore.lib",
			"api-ms-win-core-memory-l1-1-7.dll" => "onecore.lib",
			"api-ms-win-core-memory-l1-1-8.dll" => "onecore.lib",
			"api-ms-win-core-synch-l1-2-0.dll" => "synchronization.lib",
			"api-ms-win-core-sysinfo-l1-2-0.dll" => "onecore.lib",
			"api-ms-win-core-sysinfo-l1-2-3.dll" => "onecore.lib",
			"api-ms-win-core-sysinfo-l1-2-4.dll" => "mincore.lib",
			"api-ms-win-core-sysinfo-l1-2-6.dll" => "onecore.lib",
			"api-ms-win-core-wow64-l1-1-1.dll" => "onecore.lib",
			"api-ms-win-security-base-l1-2-2.dll" => "advapi32.lib",
			"d3dcompiler_47.dll" => "d3dcompiler.lib",
			"icuin.dll" or
			"icuuc.dll" => "icu.lib",
			_ => dll.Replace(".dll", ".lib"),
		};
	}

	public static string KeywordCollision(string str)
	{
		return str switch
		{
			"context" or
			"map" or
			"proc" => '_' + str,
			_ => str,
		};
	}

	public static string StringLiteral(string str)
	{
		var builder = new StringBuilder();
		foreach (var c in str)
		{
			builder.Append(c switch
			{
				'\x00' => "\\u0000", '\x01' => "\\u0001", '\x02' => "\\u0002", '\x03' => "\\u0003",
				'\x04' => "\\u0004", '\x05' => "\\u0005", '\x06' => "\\u0006", '\x07' => "\\u0007",
				'\x08' => "\\b",     '\x09' => "\\t",     '\x0a' => "\\n",     '\x0b' => "\\u00",
				'\x0c' => "\\f",     '\x0d' => "\\r",     '\x0e' => "\\u000e", '\x0f' => "\\u000f",
				'\x10' => "\\u0010", '\x11' => "\\u0011", '\x12' => "\\u0012", '\x13' => "\\u0013",
				'\x14' => "\\u0014", '\x15' => "\\u0015", '\x16' => "\\u0016", '\x17' => "\\u0017",
				'\x18' => "\\u0018", '\x19' => "\\u0019", '\x1a' => "\\u001a", '\x1b' => "\\u001b",
				'\x1c' => "\\u001c", '\x1d' => "\\u001d", '\x1e' => "\\u001e", '\x1f' => "\\u001f",
				   '"' => "\\\"",      '\\' => "\\\\",         _ => c,
			});
		}
		return builder.ToString();
	}
}

readonly struct Indent : IDisposable
{
	public static int Tabs;
	public static string String
	{
		get
		{
			var str = "";
			for (int i = 0; i < Tabs; i++) str += '\t';
			return str;
		}
	}

	public Indent()
	{
		Debug.Assert(Tabs >= 0);
		Tabs++;
	}

	public void Dispose()
	{
		Debug.Assert(Tabs > 0);
		Tabs--;
	}
}
