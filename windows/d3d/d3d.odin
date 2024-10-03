package windows_d3d

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_cbuffer_type ]]
CBUFFER_TYPE :: enum i32 {
	CBUFFER = 0,
	TBUFFER = 1,
	INTERFACE_POINTERS = 2,
	RESOURCE_BIND_INFO = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_driver_type ]]
DRIVER_TYPE :: enum i32 {
	UNKNOWN = 0,
	HARDWARE = 1,
	REFERENCE = 2,
	NULL = 3,
	SOFTWARE = 4,
	WARP = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_feature_level ]]
FEATURE_LEVEL :: enum i32 {
	_1_0_GENERIC = 256,
	_1_0_CORE = 4096,
	_9_1 = 37120,
	_9_2 = 37376,
	_9_3 = 37632,
	_10_0 = 40960,
	_10_1 = 41216,
	_11_0 = 45056,
	_11_1 = 45312,
	_12_0 = 49152,
	_12_1 = 49408,
	_12_2 = 49664,
}

FORMAT_COMPONENT_INTERPRETATION :: enum i32 {
	TYPELESS = 0,
	FLOAT = -4,
	SNORM = -3,
	UNORM = -2,
	SINT = -1,
	UINT = 1,
	UNORM_SRGB = 2,
	BIASED_FIXED_2_8 = 3,
}

FORMAT_COMPONENT_NAME :: enum i32 {
	R = -4,
	G = -3,
	B = -2,
	A = -1,
	D = 0,
	S = 1,
	X = 2,
}

FORMAT_LAYOUT :: enum i32 {
	STANDARD = 0,
	CUSTOM = -1,
}

FORMAT_TYPE_LEVEL :: enum i32 {
	NO_TYPE = 0,
	PARTIAL_TYPE = -2,
	FULL_TYPE = -1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_include_type ]]
INCLUDE_TYPE :: enum i32 {
	LOCAL = 0,
	SYSTEM = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_interpolation_mode ]]
INTERPOLATION_MODE :: enum i32 {
	UNDEFINED = 0,
	CONSTANT = 1,
	LINEAR = 2,
	LINEAR_CENTROID = 3,
	LINEAR_NOPERSPECTIVE = 4,
	LINEAR_NOPERSPECTIVE_CENTROID = 5,
	LINEAR_SAMPLE = 6,
	LINEAR_NOPERSPECTIVE_SAMPLE = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_min_precision ]]
MIN_PRECISION :: enum i32 {
	DEFAULT = 0,
	FLOAT_16 = 1,
	FLOAT_2_8 = 2,
	RESERVED = 3,
	SINT_16 = 4,
	UINT_16 = 5,
	ANY_16 = 240,
	ANY_10 = 241,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_name ]]
NAME :: enum i32 {
	UNDEFINED = 0,
	POSITION = 1,
	CLIP_DISTANCE = 2,
	CULL_DISTANCE = 3,
	RENDER_TARGET_ARRAY_INDEX = 4,
	VIEWPORT_ARRAY_INDEX = 5,
	VERTEX_ID = 6,
	PRIMITIVE_ID = 7,
	INSTANCE_ID = 8,
	IS_FRONT_FACE = 9,
	SAMPLE_INDEX = 10,
	FINAL_QUAD_EDGE_TESSFACTOR = 11,
	FINAL_QUAD_INSIDE_TESSFACTOR = 12,
	FINAL_TRI_EDGE_TESSFACTOR = 13,
	FINAL_TRI_INSIDE_TESSFACTOR = 14,
	FINAL_LINE_DETAIL_TESSFACTOR = 15,
	FINAL_LINE_DENSITY_TESSFACTOR = 16,
	BARYCENTRICS = 23,
	SHADINGRATE = 24,
	CULLPRIMITIVE = 25,
	TARGET = 64,
	DEPTH = 65,
	COVERAGE = 66,
	DEPTH_GREATER_EQUAL = 67,
	DEPTH_LESS_EQUAL = 68,
	STENCIL_REF = 69,
	INNER_COVERAGE = 70,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_parameter_flags ]]
PARAMETER_FLAGS :: enum i32 {
	NONE = 0,
	IN = 1,
	OUT = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive ]]
PRIMITIVE :: enum i32 {
	UNDEFINED = 0,
	POINT = 1,
	LINE = 2,
	TRIANGLE = 3,
	LINE_ADJ = 6,
	TRIANGLE_ADJ = 7,
	_1_CONTROL_POINT_PATCH = 8,
	_2_CONTROL_POINT_PATCH = 9,
	_3_CONTROL_POINT_PATCH = 10,
	_4_CONTROL_POINT_PATCH = 11,
	_5_CONTROL_POINT_PATCH = 12,
	_6_CONTROL_POINT_PATCH = 13,
	_7_CONTROL_POINT_PATCH = 14,
	_8_CONTROL_POINT_PATCH = 15,
	_9_CONTROL_POINT_PATCH = 16,
	_10_CONTROL_POINT_PATCH = 17,
	_11_CONTROL_POINT_PATCH = 18,
	_12_CONTROL_POINT_PATCH = 19,
	_13_CONTROL_POINT_PATCH = 20,
	_14_CONTROL_POINT_PATCH = 21,
	_15_CONTROL_POINT_PATCH = 22,
	_16_CONTROL_POINT_PATCH = 23,
	_17_CONTROL_POINT_PATCH = 24,
	_18_CONTROL_POINT_PATCH = 25,
	_19_CONTROL_POINT_PATCH = 26,
	_20_CONTROL_POINT_PATCH = 27,
	_21_CONTROL_POINT_PATCH = 28,
	_22_CONTROL_POINT_PATCH = 29,
	_23_CONTROL_POINT_PATCH = 30,
	_24_CONTROL_POINT_PATCH = 31,
	_25_CONTROL_POINT_PATCH = 32,
	_26_CONTROL_POINT_PATCH = 33,
	_27_CONTROL_POINT_PATCH = 34,
	_28_CONTROL_POINT_PATCH = 35,
	_29_CONTROL_POINT_PATCH = 36,
	_30_CONTROL_POINT_PATCH = 37,
	_31_CONTROL_POINT_PATCH = 38,
	_32_CONTROL_POINT_PATCH = 39,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_primitive_topology ]]
PRIMITIVE_TOPOLOGY :: enum i32 {
	UNDEFINED = 0,
	POINTLIST = 1,
	LINELIST = 2,
	LINESTRIP = 3,
	TRIANGLELIST = 4,
	TRIANGLESTRIP = 5,
	TRIANGLEFAN = 6,
	LINELIST_ADJ = 10,
	LINESTRIP_ADJ = 11,
	TRIANGLELIST_ADJ = 12,
	TRIANGLESTRIP_ADJ = 13,
	_1_CONTROL_POINT_PATCHLIST = 33,
	_2_CONTROL_POINT_PATCHLIST = 34,
	_3_CONTROL_POINT_PATCHLIST = 35,
	_4_CONTROL_POINT_PATCHLIST = 36,
	_5_CONTROL_POINT_PATCHLIST = 37,
	_6_CONTROL_POINT_PATCHLIST = 38,
	_7_CONTROL_POINT_PATCHLIST = 39,
	_8_CONTROL_POINT_PATCHLIST = 40,
	_9_CONTROL_POINT_PATCHLIST = 41,
	_10_CONTROL_POINT_PATCHLIST = 42,
	_11_CONTROL_POINT_PATCHLIST = 43,
	_12_CONTROL_POINT_PATCHLIST = 44,
	_13_CONTROL_POINT_PATCHLIST = 45,
	_14_CONTROL_POINT_PATCHLIST = 46,
	_15_CONTROL_POINT_PATCHLIST = 47,
	_16_CONTROL_POINT_PATCHLIST = 48,
	_17_CONTROL_POINT_PATCHLIST = 49,
	_18_CONTROL_POINT_PATCHLIST = 50,
	_19_CONTROL_POINT_PATCHLIST = 51,
	_20_CONTROL_POINT_PATCHLIST = 52,
	_21_CONTROL_POINT_PATCHLIST = 53,
	_22_CONTROL_POINT_PATCHLIST = 54,
	_23_CONTROL_POINT_PATCHLIST = 55,
	_24_CONTROL_POINT_PATCHLIST = 56,
	_25_CONTROL_POINT_PATCHLIST = 57,
	_26_CONTROL_POINT_PATCHLIST = 58,
	_27_CONTROL_POINT_PATCHLIST = 59,
	_28_CONTROL_POINT_PATCHLIST = 60,
	_29_CONTROL_POINT_PATCHLIST = 61,
	_30_CONTROL_POINT_PATCHLIST = 62,
	_31_CONTROL_POINT_PATCHLIST = 63,
	_32_CONTROL_POINT_PATCHLIST = 64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_register_component_type ]]
REGISTER_COMPONENT_TYPE :: enum i32 {
	UNKNOWN = 0,
	UINT32 = 1,
	SINT32 = 2,
	FLOAT32 = 3,
	UINT16 = 4,
	SINT16 = 5,
	FLOAT16 = 6,
	UINT64 = 7,
	SINT64 = 8,
	FLOAT64 = 9,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_resource_return_type ]]
RESOURCE_RETURN_TYPE :: enum i32 {
	UNORM = 1,
	SNORM = 2,
	SINT = 3,
	UINT = 4,
	FLOAT = 5,
	MIXED = 6,
	DOUBLE = 7,
	CONTINUED = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_cbuffer_flags ]]
SHADER_CBUFFER_FLAGS :: enum i32 {
	CBF_USERPACKED = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_input_flags ]]
SHADER_INPUT_FLAGS :: enum i32 {
	USERPACKED = 1,
	COMPARISON_SAMPLER = 2,
	TEXTURE_COMPONENT_0 = 4,
	TEXTURE_COMPONENT_1 = 8,
	TEXTURE_COMPONENTS = 12,
	UNUSED = 16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_input_type ]]
SHADER_INPUT_TYPE :: enum i32 {
	CBUFFER = 0,
	TBUFFER = 1,
	TEXTURE = 2,
	SAMPLER = 3,
	UAV_RWTYPED = 4,
	STRUCTURED = 5,
	UAV_RWSTRUCTURED = 6,
	BYTEADDRESS = 7,
	UAV_RWBYTEADDRESS = 8,
	UAV_APPEND_STRUCTURED = 9,
	UAV_CONSUME_STRUCTURED = 10,
	UAV_RWSTRUCTURED_WITH_COUNTER = 11,
	RTACCELERATIONSTRUCTURE = 12,
	UAV_FEEDBACKTEXTURE = 13,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ns-d3dcommon-d3d_shader_macro ]]
SHADER_MACRO :: struct {
	Name: PSTR,
	Definition: PSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_class ]]
SHADER_VARIABLE_CLASS :: enum i32 {
	SCALAR = 0,
	VECTOR = 1,
	MATRIX_ROWS = 2,
	MATRIX_COLUMNS = 3,
	OBJECT = 4,
	STRUCT = 5,
	INTERFACE_CLASS = 6,
	INTERFACE_POINTER = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_flags ]]
SHADER_VARIABLE_FLAGS :: enum i32 {
	USERPACKED = 1,
	USED = 2,
	INTERFACE_POINTER = 4,
	INTERFACE_PARAMETER = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_shader_variable_type ]]
SHADER_VARIABLE_TYPE :: enum i32 {
	VOID = 0,
	BOOL = 1,
	INT = 2,
	FLOAT = 3,
	STRING = 4,
	TEXTURE = 5,
	TEXTURE1D = 6,
	TEXTURE2D = 7,
	TEXTURE3D = 8,
	TEXTURECUBE = 9,
	SAMPLER = 10,
	SAMPLER1D = 11,
	SAMPLER2D = 12,
	SAMPLER3D = 13,
	SAMPLERCUBE = 14,
	PIXELSHADER = 15,
	VERTEXSHADER = 16,
	PIXELFRAGMENT = 17,
	VERTEXFRAGMENT = 18,
	UINT = 19,
	UINT8 = 20,
	GEOMETRYSHADER = 21,
	RASTERIZER = 22,
	DEPTHSTENCIL = 23,
	BLEND = 24,
	BUFFER = 25,
	CBUFFER = 26,
	TBUFFER = 27,
	TEXTURE1DARRAY = 28,
	TEXTURE2DARRAY = 29,
	RENDERTARGETVIEW = 30,
	DEPTHSTENCILVIEW = 31,
	TEXTURE2DMS = 32,
	TEXTURE2DMSARRAY = 33,
	TEXTURECUBEARRAY = 34,
	HULLSHADER = 35,
	DOMAINSHADER = 36,
	INTERFACE_POINTER = 37,
	COMPUTESHADER = 38,
	DOUBLE = 39,
	RWTEXTURE1D = 40,
	RWTEXTURE1DARRAY = 41,
	RWTEXTURE2D = 42,
	RWTEXTURE2DARRAY = 43,
	RWTEXTURE3D = 44,
	RWBUFFER = 45,
	BYTEADDRESS_BUFFER = 46,
	RWBYTEADDRESS_BUFFER = 47,
	STRUCTURED_BUFFER = 48,
	RWSTRUCTURED_BUFFER = 49,
	APPEND_STRUCTURED_BUFFER = 50,
	CONSUME_STRUCTURED_BUFFER = 51,
	MIN8FLOAT = 52,
	MIN10FLOAT = 53,
	MIN16FLOAT = 54,
	MIN12INT = 55,
	MIN16INT = 56,
	MIN16UINT = 57,
	INT16 = 58,
	UINT16 = 59,
	FLOAT16 = 60,
	INT64 = 61,
	UINT64 = 62,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_srv_dimension ]]
SRV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	BUFFER = 1,
	TEXTURE1D = 2,
	TEXTURE1DARRAY = 3,
	TEXTURE2D = 4,
	TEXTURE2DARRAY = 5,
	TEXTURE2DMS = 6,
	TEXTURE2DMSARRAY = 7,
	TEXTURE3D = 8,
	TEXTURECUBE = 9,
	TEXTURECUBEARRAY = 10,
	BUFFEREX = 11,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_tessellator_domain ]]
TESSELLATOR_DOMAIN :: enum i32 {
	UNDEFINED = 0,
	ISOLINE = 1,
	TRI = 2,
	QUAD = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_tessellator_output_primitive ]]
TESSELLATOR_OUTPUT_PRIMITIVE :: enum i32 {
	UNDEFINED = 0,
	POINT = 1,
	LINE = 2,
	TRIANGLE_CW = 3,
	TRIANGLE_CCW = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_tessellator_partitioning ]]
TESSELLATOR_PARTITIONING :: enum i32 {
	UNDEFINED = 0,
	INTEGER = 1,
	POW2 = 2,
	FRACTIONAL_ODD = 3,
	FRACTIONAL_EVEN = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3d10/d3d10-d3dmatrix ]]
MATRIX :: struct {
	using _: struct #raw_union {
		using _: struct {
			_11: f32,
			_12: f32,
			_13: f32,
			_14: f32,
			_21: f32,
			_22: f32,
			_23: f32,
			_24: f32,
			_31: f32,
			_32: f32,
			_33: f32,
			_34: f32,
			_41: f32,
			_42: f32,
			_43: f32,
			_44: f32,
		},
		m: [16]f32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3d10/d3d10-d3dvector ]]
VECTOR :: struct {
	x: f32,
	y: f32,
	z: f32,
}

IBlob :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBlob_Vtbl,
}
IBlob_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetBufferPointer: proc "system" (this: ^IBlob) -> rawptr,
	GetBufferSize: proc "system" (this: ^IBlob) -> uintptr,
}
IID_ID3DBlob :: GUID{0x8BA5FB08, 0x5195, 0x40E2, {0xAC, 0x58, 0x0D, 0x98, 0x9C, 0x3A, 0x01, 0x02}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/nn-d3dcommon-id3ddestructionotifier ]]
IDestructionNotifier :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDestructionNotifier_Vtbl,
}
IDestructionNotifier_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RegisterDestructionCallback: proc "system" (
		this: ^IDestructionNotifier,
		callbackFn: PFN_DESTRUCTION_CALLBACK,
		pData: rawptr,
		pCallbackID: ^u32,
	) -> HRESULT,
	UnregisterDestructionCallback: proc "system" (this: ^IDestructionNotifier, callbackID: u32) -> HRESULT,
}
IID_ID3DDestructionNotifier :: GUID{0xA06EB39A, 0x50DA, 0x425B, {0x8C, 0x31, 0x4E, 0xEC, 0xD6, 0xC2, 0x70, 0xF3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcommon/nn-d3dcommon-id3dinclude ]]
IInclude :: struct #raw_union {
	using Vtbl: ^IInclude_Vtbl,
}
IInclude_Vtbl :: struct {
	Open: proc "system" (
		this: ^IInclude,
		IncludeType: INCLUDE_TYPE,
		pFileName: PSTR,
		pParentData: rawptr,
		ppData: rawptr,
		pBytes: ^u32,
	) -> HRESULT,
	Close: proc "system" (this: ^IInclude, pData: rawptr) -> HRESULT,
}

PFN_DESTRUCTION_CALLBACK :: #type proc "system" (pData: rawptr)

COMPONENT_MASK_W :: 8
COMPONENT_MASK_X :: 1
COMPONENT_MASK_Y :: 2
COMPONENT_MASK_Z :: 4
FL9_1_DEFAULT_MAX_ANISOTROPY :: 2
FL9_1_IA_PRIMITIVE_MAX_COUNT :: 65535
FL9_1_MAX_TEXTURE_REPEAT :: 128
FL9_1_REQ_TEXTURE1D_U_DIMENSION :: 2048
FL9_1_REQ_TEXTURE2D_U_OR_V_DIMENSION :: 2048
FL9_1_REQ_TEXTURE3D_U_V_OR_W_DIMENSION :: 256
FL9_1_REQ_TEXTURECUBE_DIMENSION :: 512
FL9_1_SIMULTANEOUS_RENDER_TARGET_COUNT :: 1
FL9_2_IA_PRIMITIVE_MAX_COUNT :: 1048575
FL9_2_MAX_TEXTURE_REPEAT :: 2048
FL9_3_MAX_TEXTURE_REPEAT :: 8192
FL9_3_REQ_TEXTURE1D_U_DIMENSION :: 4096
FL9_3_REQ_TEXTURE2D_U_OR_V_DIMENSION :: 4096
FL9_3_REQ_TEXTURECUBE_DIMENSION :: 4096
FL9_3_SIMULTANEOUS_RENDER_TARGET_COUNT :: 4
SHADER_FEATURE_11_1_DOUBLE_EXTENSIONS :: 32
SHADER_FEATURE_11_1_SHADER_EXTENSIONS :: 64
SHADER_FEATURE_64_UAVS :: 8
SHADER_FEATURE_ADVANCED_TEXTURE_OPS :: 536870912
SHADER_FEATURE_ATOMIC_INT64_ON_DESCRIPTOR_HEAP_RESOURCE :: 268435456
SHADER_FEATURE_ATOMIC_INT64_ON_GROUP_SHARED :: 8388608
SHADER_FEATURE_ATOMIC_INT64_ON_TYPED_RESOURCE :: 4194304
SHADER_FEATURE_BARYCENTRICS :: 131072
SHADER_FEATURE_COMPUTE_SHADERS_PLUS_RAW_AND_STRUCTURED_BUFFERS_VIA_SHADER_4_X :: 2
SHADER_FEATURE_DERIVATIVES_IN_MESH_AND_AMPLIFICATION_SHADERS :: 16777216
SHADER_FEATURE_DOUBLES :: 1
SHADER_FEATURE_INNER_COVERAGE :: 1024
SHADER_FEATURE_INT64_OPS :: 32768
SHADER_FEATURE_LEVEL_9_COMPARISON_FILTERING :: 128
SHADER_FEATURE_MINIMUM_PRECISION :: 16
SHADER_FEATURE_NATIVE_16BIT_OPS :: 262144
SHADER_FEATURE_RAYTRACING_TIER_1_1 :: 1048576
SHADER_FEATURE_RESOURCE_DESCRIPTOR_HEAP_INDEXING :: 33554432
SHADER_FEATURE_ROVS :: 4096
SHADER_FEATURE_SAMPLE_CMP_GRADIENT_OR_BIAS :: 2147483648
SHADER_FEATURE_SAMPLER_DESCRIPTOR_HEAP_INDEXING :: 67108864
SHADER_FEATURE_SAMPLER_FEEDBACK :: 2097152
SHADER_FEATURE_SHADING_RATE :: 524288
SHADER_FEATURE_STENCIL_REF :: 512
SHADER_FEATURE_TILED_RESOURCES :: 256
SHADER_FEATURE_TYPED_UAV_LOAD_ADDITIONAL_FORMATS :: 2048
SHADER_FEATURE_UAVS_AT_EVERY_STAGE :: 4
SHADER_FEATURE_VIEW_ID :: 65536
SHADER_FEATURE_VIEWPORT_AND_RT_ARRAY_INDEX_FROM_ANY_SHADER_FEEDING_RASTERIZER :: 8192
SHADER_FEATURE_WAVE_MMA :: 134217728
SHADER_FEATURE_WAVE_OPS :: 16384
SHADER_FEATURE_WRITEABLE_MSAA_TEXTURES :: 1073741824
TEXTURE_LAYOUT_64KB_STANDARD_SWIZZLE :: GUID{0x4C0F29E3, 0x3F5F, 0x4D35, {0x84, 0xC9, 0xBC, 0x09, 0x83, 0xB6, 0x2C, 0x28}}
TEXTURE_LAYOUT_ROW_MAJOR :: GUID{0xB5DC234F, 0x72BB, 0x4BEC, {0x97, 0x05, 0x8C, 0xF2, 0x58, 0xDF, 0x6B, 0x6C}}
WKPDID_CommentStringW :: GUID{0xD0149DC0, 0x90E8, 0x4EC8, {0x81, 0x44, 0xE9, 0x00, 0xAD, 0x26, 0x6B, 0xB2}}
WKPDID_D3D12UniqueObjectId :: GUID{0x1B39DE15, 0xEC04, 0x4BAE, {0xBA, 0x4D, 0x8C, 0xEF, 0x79, 0xFC, 0x04, 0xC1}}
WKPDID_D3DDebugObjectName :: GUID{0x429B8C22, 0x9188, 0x4B0C, {0x87, 0x42, 0xAC, 0xB0, 0xBF, 0x85, 0xC2, 0x00}}
WKPDID_D3DDebugObjectNameW :: GUID{0x4CCA5FD8, 0x921F, 0x42C8, {0x85, 0x66, 0x70, 0xCA, 0xF2, 0xA9, 0xB7, 0x41}}

GUID :: win32.GUID
HRESULT :: win32.HRESULT
IUnknown :: win32.IUnknown
IUnknown_Vtbl :: win32.IUnknown_Vtbl
PSTR :: win32.PSTR

import win32 ".."
