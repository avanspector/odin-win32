package windows_d3dcompiler

foreign import d3dcompiler "system:d3dcompiler.lib"

@(default_calling_convention="system")
foreign d3dcompiler {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dcompile ]]
	@(link_name="D3DCompile")
	Compile :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		pSourceName: PSTR,
		pDefines: ^d3d.SHADER_MACRO,
		pInclude: ^d3d.IInclude,
		pEntrypoint: PSTR,
		pTarget: PSTR,
		Flags1: u32,
		Flags2: u32,
		ppCode: ^^d3d.IBlob,
		ppErrorMsgs: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dcompile2 ]]
	@(link_name="D3DCompile2")
	Compile2 :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		pSourceName: PSTR,
		pDefines: ^d3d.SHADER_MACRO,
		pInclude: ^d3d.IInclude,
		pEntrypoint: PSTR,
		pTarget: PSTR,
		Flags1: u32,
		Flags2: u32,
		SecondaryDataFlags: u32,
		pSecondaryData: rawptr,
		SecondaryDataSize: uintptr,
		ppCode: ^^d3d.IBlob,
		ppErrorMsgs: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dcompilefromfile ]]
	@(link_name="D3DCompileFromFile")
	CompileFromFile :: proc(
		pFileName: PWSTR,
		pDefines: ^d3d.SHADER_MACRO,
		pInclude: ^d3d.IInclude,
		pEntrypoint: PSTR,
		pTarget: PSTR,
		Flags1: u32,
		Flags2: u32,
		ppCode: ^^d3d.IBlob,
		ppErrorMsgs: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dcompressshaders ]]
	@(link_name="D3DCompressShaders")
	CompressShaders :: proc(
		uNumShaders: u32,
		pShaderData: [^]SHADER_DATA,
		uFlags: u32,
		ppCompressedData: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dcreateblob ]]
	@(link_name="D3DCreateBlob")
	CreateBlob :: proc(Size: uintptr, ppBlob: ^^d3d.IBlob) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dcreatefunctionlinkinggraph ]]
	@(link_name="D3DCreateFunctionLinkingGraph")
	CreateFunctionLinkingGraph :: proc(uFlags: u32, ppFunctionLinkingGraph: ^^d3d11.IFunctionLinkingGraph) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dcreatelinker ]]
	@(link_name="D3DCreateLinker")
	CreateLinker :: proc(ppLinker: ^^d3d11.ILinker) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3ddecompressshaders ]]
	@(link_name="D3DDecompressShaders")
	DecompressShaders :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		uNumShaders: u32,
		uStartIndex: u32,
		pIndices: [^]u32,
		uFlags: u32,
		ppShaders: [^]^d3d.IBlob,
		pTotalShaders: ^u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3ddisassemble ]]
	@(link_name="D3DDisassemble")
	Disassemble :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		Flags: u32,
		szComments: PSTR,
		ppDisassembly: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3ddisassembleregion ]]
	@(link_name="D3DDisassembleRegion")
	DisassembleRegion :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		Flags: u32,
		szComments: PSTR,
		StartByteOffset: uintptr,
		NumInsts: uintptr,
		pFinishByteOffset: ^uintptr,
		ppDisassembly: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dgetblobpart ]]
	@(link_name="D3DGetBlobPart")
	GetBlobPart :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		Part: BLOB_PART,
		Flags: u32,
		ppPart: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dgetdebuginfo ]]
	@(link_name="D3DGetDebugInfo")
	GetDebugInfo :: proc(pSrcData: rawptr, SrcDataSize: uintptr, ppDebugInfo: ^^d3d.IBlob) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dgetinputandoutputsignatureblob ]]
	@(link_name="D3DGetInputAndOutputSignatureBlob")
	GetInputAndOutputSignatureBlob :: proc(pSrcData: rawptr, SrcDataSize: uintptr, ppSignatureBlob: ^^d3d.IBlob) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dgetinputsignatureblob ]]
	@(link_name="D3DGetInputSignatureBlob")
	GetInputSignatureBlob :: proc(pSrcData: rawptr, SrcDataSize: uintptr, ppSignatureBlob: ^^d3d.IBlob) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dgetoutputsignatureblob ]]
	@(link_name="D3DGetOutputSignatureBlob")
	GetOutputSignatureBlob :: proc(pSrcData: rawptr, SrcDataSize: uintptr, ppSignatureBlob: ^^d3d.IBlob) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dgettraceinstructionoffsets ]]
	@(link_name="D3DGetTraceInstructionOffsets")
	GetTraceInstructionOffsets :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		Flags: u32,
		StartInstIndex: uintptr,
		NumInsts: uintptr,
		pOffsets: [^]uintptr,
		pTotalInsts: ^uintptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dloadmodule ]]
	@(link_name="D3DLoadModule")
	LoadModule :: proc(pSrcData: rawptr, cbSrcDataSize: uintptr, ppModule: ^^d3d11.IModule) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dpreprocess ]]
	@(link_name="D3DPreprocess")
	Preprocess :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		pSourceName: PSTR,
		pDefines: ^d3d.SHADER_MACRO,
		pInclude: ^d3d.IInclude,
		ppCodeText: ^^d3d.IBlob,
		ppErrorMsgs: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dreadfiletoblob ]]
	@(link_name="D3DReadFileToBlob")
	ReadFileToBlob :: proc(pFileName: PWSTR, ppContents: ^^d3d.IBlob) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dreflect ]]
	@(link_name="D3DReflect")
	Reflect :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		#by_ptr pInterface: GUID,
		ppReflector: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dreflectlibrary ]]
	@(link_name="D3DReflectLibrary")
	ReflectLibrary :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		#by_ptr riid: GUID,
		ppReflector: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dsetblobpart ]]
	@(link_name="D3DSetBlobPart")
	SetBlobPart :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		Part: BLOB_PART,
		Flags: u32,
		pPart: rawptr,
		PartSize: uintptr,
		ppNewShader: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dstripshader ]]
	@(link_name="D3DStripShader")
	StripShader :: proc(
		pShaderBytecode: rawptr,
		BytecodeLength: uintptr,
		uStripFlags: u32,
		ppStrippedBlob: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/nf-d3dcompiler-d3dwriteblobtofile ]]
	@(link_name="D3DWriteBlobToFile")
	WriteBlobToFile :: proc(pBlob: ^d3d.IBlob, pFileName: PWSTR, bOverwrite: BOOL) -> HRESULT ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/ne-d3dcompiler-d3d_blob_part ]]
BLOB_PART :: enum i32 {
	INPUT_SIGNATURE_BLOB = 0,
	OUTPUT_SIGNATURE_BLOB = 1,
	INPUT_AND_OUTPUT_SIGNATURE_BLOB = 2,
	PATCH_CONSTANT_SIGNATURE_BLOB = 3,
	ALL_SIGNATURE_BLOB = 4,
	DEBUG_INFO = 5,
	LEGACY_SHADER = 6,
	XNA_PREPASS_SHADER = 7,
	XNA_SHADER = 8,
	PDB = 9,
	PRIVATE_DATA = 10,
	ROOT_SIGNATURE = 11,
	DEBUG_NAME = 12,
	TEST_ALTERNATE_SHADER = 32768,
	TEST_COMPILE_DETAILS = 32769,
	TEST_COMPILE_PERF = 32770,
	TEST_COMPILE_REPORT = 32771,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/ns-d3dcompiler-d3d_shader_data ]]
SHADER_DATA :: struct {
	pBytecode: rawptr,
	BytecodeLength: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcompiler/ne-d3dcompiler-d3dcompiler_strip_flags ]]
STRIP_FLAGS :: enum i32 {
	REFLECTION_DATA = 1,
	DEBUG_INFO = 2,
	TEST_BLOBS = 4,
	PRIVATE_DATA = 8,
	ROOT_SIGNATURE = 16,
}

pD3DCompile :: #type proc "system" (
	pSrcData: rawptr,
	SrcDataSize: uintptr,
	pFileName: PSTR,
	#by_ptr pDefines: d3d.SHADER_MACRO,
	pInclude: ^d3d.IInclude,
	pEntrypoint: PSTR,
	pTarget: PSTR,
	Flags1: u32,
	Flags2: u32,
	ppCode: ^^d3d.IBlob,
	ppErrorMsgs: ^^d3d.IBlob,
) -> HRESULT

pD3DDisassemble :: #type proc "system" (
	pSrcData: rawptr,
	SrcDataSize: uintptr,
	Flags: u32,
	szComments: PSTR,
	ppDisassembly: ^^d3d.IBlob,
) -> HRESULT

pD3DPreprocess :: #type proc "system" (
	pSrcData: rawptr,
	SrcDataSize: uintptr,
	pFileName: PSTR,
	#by_ptr pDefines: d3d.SHADER_MACRO,
	pInclude: ^d3d.IInclude,
	ppCodeText: ^^d3d.IBlob,
	ppErrorMsgs: ^^d3d.IBlob,
) -> HRESULT

COMPILER_VERSION :: 47
COMPRESS_SHADER_KEEP_ALL_PARTS :: 1
DISASM_DISABLE_DEBUG_INFO :: 16
DISASM_ENABLE_COLOR_CODE :: 1
DISASM_ENABLE_DEFAULT_VALUE_PRINTS :: 2
DISASM_ENABLE_INSTRUCTION_CYCLE :: 8
DISASM_ENABLE_INSTRUCTION_NUMBERING :: 4
DISASM_ENABLE_INSTRUCTION_OFFSET :: 32
DISASM_INSTRUCTION_ONLY :: 64
DISASM_PRINT_HEX_LITERALS :: 128
GET_INST_OFFSETS_INCLUDE_NON_EXECUTABLE :: 1
COMPILE_ALL_RESOURCES_BOUND :: 2097152
COMPILE_AVOID_FLOW_CONTROL :: 512
COMPILE_DEBUG :: 1
COMPILE_DEBUG_NAME_FOR_BINARY :: 8388608
COMPILE_DEBUG_NAME_FOR_SOURCE :: 4194304
COMPILE_EFFECT_ALLOW_SLOW_OPS :: 2
COMPILE_EFFECT_CHILD_EFFECT :: 1
COMPILE_ENABLE_BACKWARDS_COMPATIBILITY :: 4096
COMPILE_ENABLE_STRICTNESS :: 2048
COMPILE_ENABLE_UNBOUNDED_DESCRIPTOR_TABLES :: 1048576
COMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_0 :: 16
COMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_1_1 :: 32
COMPILE_FLAGS2_FORCE_ROOT_SIGNATURE_LATEST :: 0
COMPILE_FORCE_PS_SOFTWARE_NO_OPT :: 128
COMPILE_FORCE_VS_SOFTWARE_NO_OPT :: 64
COMPILE_IEEE_STRICTNESS :: 8192
COMPILE_NO_PRESHADER :: 256
COMPILE_OPTIMIZATION_LEVEL0 :: 16384
COMPILE_OPTIMIZATION_LEVEL1 :: 0
COMPILE_OPTIMIZATION_LEVEL3 :: 32768
COMPILE_PACK_MATRIX_COLUMN_MAJOR :: 16
COMPILE_PACK_MATRIX_ROW_MAJOR :: 8
COMPILE_PARTIAL_PRECISION :: 32
COMPILE_PREFER_FLOW_CONTROL :: 1024
COMPILE_RESERVED16 :: 65536
COMPILE_RESERVED17 :: 131072
COMPILE_RESOURCES_MAY_ALIAS :: 524288
COMPILE_SECDATA_MERGE_UAV_SLOTS :: 1
COMPILE_SECDATA_PRESERVE_TEMPLATE_SLOTS :: 2
COMPILE_SECDATA_REQUIRE_TEMPLATE_MATCH :: 4
COMPILE_SKIP_OPTIMIZATION :: 4
COMPILE_SKIP_VALIDATION :: 2
COMPILE_WARNINGS_ARE_ERRORS :: 262144
DLL_A :: "d3dcompiler_47.dll"
DLL_W :: "d3dcompiler_47.dll"

BOOL :: win32.BOOL
GUID :: win32.GUID
HRESULT :: win32.HRESULT
PSTR :: win32.PSTR
PWSTR :: win32.PWSTR

import "../d3d"
import "../d3d11"
import win32 ".."
