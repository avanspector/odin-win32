package windows_d3d12

foreign import d3d12 "system:d3d12.lib"

@(default_calling_convention="system")
foreign d3d12 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createdevice ]]
	@(link_name="D3D12CreateDevice")
	CreateDevice :: proc(
		pAdapter: ^IUnknown,
		MinimumFeatureLevel: d3d.FEATURE_LEVEL,
		#by_ptr riid: GUID,
		ppDevice: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createrootsignaturedeserializer ]]
	@(link_name="D3D12CreateRootSignatureDeserializer")
	CreateRootSignatureDeserializer :: proc(
		pSrcData: rawptr,
		SrcDataSizeInBytes: uintptr,
		#by_ptr pRootSignatureDeserializerInterface: GUID,
		ppRootSignatureDeserializer: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12createversionedrootsignaturedeserializer ]]
	@(link_name="D3D12CreateVersionedRootSignatureDeserializer")
	CreateVersionedRootSignatureDeserializer :: proc(
		pSrcData: rawptr,
		SrcDataSizeInBytes: uintptr,
		#by_ptr pRootSignatureDeserializerInterface: GUID,
		ppRootSignatureDeserializer: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12enableexperimentalfeatures ]]
	@(link_name="D3D12EnableExperimentalFeatures")
	EnableExperimentalFeatures :: proc(
		NumFeatures: u32,
		pIIDs: [^]GUID,
		pConfigurationStructs: rawptr,
		pConfigurationStructSizes: [^]u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12getdebuginterface ]]
	@(link_name="D3D12GetDebugInterface")
	GetDebugInterface :: proc(#by_ptr riid: GUID, ppvDebug: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12getinterface ]]
	@(link_name="D3D12GetInterface")
	GetInterface :: proc(#by_ptr rclsid: GUID, #by_ptr riid: GUID, ppvDebug: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12serializerootsignature ]]
	@(link_name="D3D12SerializeRootSignature")
	SerializeRootSignature :: proc(
		#by_ptr pRootSignature: ROOT_SIGNATURE_DESC,
		Version: ROOT_SIGNATURE_VERSION,
		ppBlob: ^^d3d.IBlob,
		ppErrorBlob: ^^d3d.IBlob,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-d3d12serializeversionedrootsignature ]]
	@(link_name="D3D12SerializeVersionedRootSignature")
	SerializeVersionedRootSignature :: proc(
		#by_ptr pRootSignature: VERSIONED_ROOT_SIGNATURE_DESC,
		ppBlob: ^^d3d.IBlob,
		ppErrorBlob: ^^d3d.IBlob,
	) -> HRESULT ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d_root_signature_version ]]
ROOT_SIGNATURE_VERSION :: enum i32 {
	_1 = 1,
	_1_0 = 1,
	_1_1 = 2,
	_1_2 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d_shader_model ]]
SHADER_MODEL :: enum i32 {
	SHADER_MODEL_NONE = 0,
	SHADER_MODEL_5_1 = 81,
	SHADER_MODEL_6_0 = 96,
	SHADER_MODEL_6_1 = 97,
	SHADER_MODEL_6_2 = 98,
	SHADER_MODEL_6_3 = 99,
	SHADER_MODEL_6_4 = 100,
	SHADER_MODEL_6_5 = 101,
	SHADER_MODEL_6_6 = 102,
	SHADER_MODEL_6_7 = 103,
	SHADER_MODEL_6_8 = 104,
	SHADER_MODEL_6_9 = 105,
	HIGHEST_SHADER_MODEL = 105,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_auto_breadcrumb_node ]]
AUTO_BREADCRUMB_NODE :: struct {
	pCommandListDebugNameA: ^u8,
	pCommandListDebugNameW: PWSTR,
	pCommandQueueDebugNameA: ^u8,
	pCommandQueueDebugNameW: PWSTR,
	pCommandList: ^IGraphicsCommandList,
	pCommandQueue: ^ICommandQueue,
	BreadcrumbCount: u32,
	pLastBreadcrumbValue: ^u32,
	pCommandHistory: ^AUTO_BREADCRUMB_OP,
	pNext: ^AUTO_BREADCRUMB_NODE,
}

AUTO_BREADCRUMB_NODE1 :: struct {
	pCommandListDebugNameA: ^u8,
	pCommandListDebugNameW: PWSTR,
	pCommandQueueDebugNameA: ^u8,
	pCommandQueueDebugNameW: PWSTR,
	pCommandList: ^IGraphicsCommandList,
	pCommandQueue: ^ICommandQueue,
	BreadcrumbCount: u32,
	pLastBreadcrumbValue: ^u32,
	pCommandHistory: ^AUTO_BREADCRUMB_OP,
	pNext: ^AUTO_BREADCRUMB_NODE1,
	BreadcrumbContextsCount: u32,
	pBreadcrumbContexts: ^DRED_BREADCRUMB_CONTEXT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_auto_breadcrumb_op ]]
AUTO_BREADCRUMB_OP :: enum i32 {
	SETMARKER = 0,
	BEGINEVENT = 1,
	ENDEVENT = 2,
	DRAWINSTANCED = 3,
	DRAWINDEXEDINSTANCED = 4,
	EXECUTEINDIRECT = 5,
	DISPATCH = 6,
	COPYBUFFERREGION = 7,
	COPYTEXTUREREGION = 8,
	COPYRESOURCE = 9,
	COPYTILES = 10,
	RESOLVESUBRESOURCE = 11,
	CLEARRENDERTARGETVIEW = 12,
	CLEARUNORDEREDACCESSVIEW = 13,
	CLEARDEPTHSTENCILVIEW = 14,
	RESOURCEBARRIER = 15,
	EXECUTEBUNDLE = 16,
	PRESENT = 17,
	RESOLVEQUERYDATA = 18,
	BEGINSUBMISSION = 19,
	ENDSUBMISSION = 20,
	DECODEFRAME = 21,
	PROCESSFRAMES = 22,
	ATOMICCOPYBUFFERUINT = 23,
	ATOMICCOPYBUFFERUINT64 = 24,
	RESOLVESUBRESOURCEREGION = 25,
	WRITEBUFFERIMMEDIATE = 26,
	DECODEFRAME1 = 27,
	SETPROTECTEDRESOURCESESSION = 28,
	DECODEFRAME2 = 29,
	PROCESSFRAMES1 = 30,
	BUILDRAYTRACINGACCELERATIONSTRUCTURE = 31,
	EMITRAYTRACINGACCELERATIONSTRUCTUREPOSTBUILDINFO = 32,
	COPYRAYTRACINGACCELERATIONSTRUCTURE = 33,
	DISPATCHRAYS = 34,
	INITIALIZEMETACOMMAND = 35,
	EXECUTEMETACOMMAND = 36,
	ESTIMATEMOTION = 37,
	RESOLVEMOTIONVECTORHEAP = 38,
	SETPIPELINESTATE1 = 39,
	INITIALIZEEXTENSIONCOMMAND = 40,
	EXECUTEEXTENSIONCOMMAND = 41,
	DISPATCHMESH = 42,
	ENCODEFRAME = 43,
	RESOLVEENCODEROUTPUTMETADATA = 44,
	BARRIER = 45,
	BEGIN_COMMAND_LIST = 46,
	DISPATCHGRAPH = 47,
	SETPROGRAM = 48,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_axis_shading_rate ]]
AXIS_SHADING_RATE :: enum i32 {
	_1X = 0,
	_2X = 1,
	_4X = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_background_processing_mode ]]
BACKGROUND_PROCESSING_MODE :: enum i32 {
	ALLOWED = 0,
	ALLOW_INTRUSIVE_MEASUREMENTS = 1,
	DISABLE_BACKGROUND_WORK = 2,
	DISABLE_PROFILING_BY_SYSTEM = 3,
}

BARRIER_ACCESS :: distinct bit_set[enum {
	VERTEX_BUFFER = 0,
	CONSTANT_BUFFER = 1,
	INDEX_BUFFER = 2,
	RENDER_TARGET = 3,
	UNORDERED_ACCESS = 4,
	DEPTH_STENCIL_WRITE = 5,
	DEPTH_STENCIL_READ = 6,
	SHADER_RESOURCE = 7,
	STREAM_OUTPUT = 8,
	INDIRECT_ARGUMENT = 9,
	PREDICATION = 9,
	COPY_DEST = 10,
	COPY_SOURCE = 11,
	RESOLVE_DEST = 12,
	RESOLVE_SOURCE = 13,
	RAYTRACING_ACCELERATION_STRUCTURE_READ = 14,
	RAYTRACING_ACCELERATION_STRUCTURE_WRITE = 15,
	SHADING_RATE_SOURCE = 16,
	VIDEO_DECODE_READ = 17,
	VIDEO_DECODE_WRITE = 18,
	VIDEO_PROCESS_READ = 19,
	VIDEO_PROCESS_WRITE = 20,
	VIDEO_ENCODE_READ = 21,
	VIDEO_ENCODE_WRITE = 22,
	NO_ACCESS = 31,
}; i32]
BARRIER_ACCESS_COMMON :: transmute(BARRIER_ACCESS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_barrier_group ]]
BARRIER_GROUP :: struct {
	Type: BARRIER_TYPE,
	NumBarriers: u32,
	using _: struct #raw_union {
		pGlobalBarriers: ^GLOBAL_BARRIER,
		pTextureBarriers: ^TEXTURE_BARRIER,
		pBufferBarriers: ^BUFFER_BARRIER,
	},
}

BARRIER_LAYOUT :: enum i32 {
	UNDEFINED = -1,
	COMMON = 0,
	PRESENT = 0,
	GENERIC_READ = 1,
	RENDER_TARGET = 2,
	UNORDERED_ACCESS = 3,
	DEPTH_STENCIL_WRITE = 4,
	DEPTH_STENCIL_READ = 5,
	SHADER_RESOURCE = 6,
	COPY_SOURCE = 7,
	COPY_DEST = 8,
	RESOLVE_SOURCE = 9,
	RESOLVE_DEST = 10,
	SHADING_RATE_SOURCE = 11,
	VIDEO_DECODE_READ = 12,
	VIDEO_DECODE_WRITE = 13,
	VIDEO_PROCESS_READ = 14,
	VIDEO_PROCESS_WRITE = 15,
	VIDEO_ENCODE_READ = 16,
	VIDEO_ENCODE_WRITE = 17,
	DIRECT_QUEUE_COMMON = 18,
	DIRECT_QUEUE_GENERIC_READ = 19,
	DIRECT_QUEUE_UNORDERED_ACCESS = 20,
	DIRECT_QUEUE_SHADER_RESOURCE = 21,
	DIRECT_QUEUE_COPY_SOURCE = 22,
	DIRECT_QUEUE_COPY_DEST = 23,
	COMPUTE_QUEUE_COMMON = 24,
	COMPUTE_QUEUE_GENERIC_READ = 25,
	COMPUTE_QUEUE_UNORDERED_ACCESS = 26,
	COMPUTE_QUEUE_SHADER_RESOURCE = 27,
	COMPUTE_QUEUE_COPY_SOURCE = 28,
	COMPUTE_QUEUE_COPY_DEST = 29,
	VIDEO_QUEUE_COMMON = 30,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_barrier_subresource_range ]]
BARRIER_SUBRESOURCE_RANGE :: struct {
	IndexOrFirstMipLevel: u32,
	NumMipLevels: u32,
	FirstArraySlice: u32,
	NumArraySlices: u32,
	FirstPlane: u32,
	NumPlanes: u32,
}

BARRIER_SYNC :: distinct bit_set[enum {
	ALL = 0,
	DRAW = 1,
	INDEX_INPUT = 2,
	VERTEX_SHADING = 3,
	PIXEL_SHADING = 4,
	DEPTH_STENCIL = 5,
	RENDER_TARGET = 6,
	COMPUTE_SHADING = 7,
	RAYTRACING = 8,
	COPY = 9,
	RESOLVE = 10,
	EXECUTE_INDIRECT = 11,
	PREDICATION = 11,
	ALL_SHADING = 12,
	NON_PIXEL_SHADING = 13,
	EMIT_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO = 14,
	CLEAR_UNORDERED_ACCESS_VIEW = 15,
	VIDEO_DECODE = 20,
	VIDEO_PROCESS = 21,
	VIDEO_ENCODE = 22,
	BUILD_RAYTRACING_ACCELERATION_STRUCTURE = 23,
	COPY_RAYTRACING_ACCELERATION_STRUCTURE = 24,
	SPLIT = 31,
}; i32]
BARRIER_SYNC_NONE :: transmute(BARRIER_SYNC)i32(0)

BARRIER_TYPE :: enum i32 {
	GLOBAL = 0,
	TEXTURE = 1,
	BUFFER = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_blend ]]
BLEND :: enum i32 {
	ZERO = 1,
	ONE = 2,
	SRC_COLOR = 3,
	INV_SRC_COLOR = 4,
	SRC_ALPHA = 5,
	INV_SRC_ALPHA = 6,
	DEST_ALPHA = 7,
	INV_DEST_ALPHA = 8,
	DEST_COLOR = 9,
	INV_DEST_COLOR = 10,
	SRC_ALPHA_SAT = 11,
	BLEND_FACTOR = 14,
	INV_BLEND_FACTOR = 15,
	SRC1_COLOR = 16,
	INV_SRC1_COLOR = 17,
	SRC1_ALPHA = 18,
	INV_SRC1_ALPHA = 19,
	ALPHA_FACTOR = 20,
	INV_ALPHA_FACTOR = 21,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_blend_desc ]]
BLEND_DESC :: struct {
	AlphaToCoverageEnable: BOOL,
	IndependentBlendEnable: BOOL,
	RenderTarget: [8]RENDER_TARGET_BLEND_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_blend_op ]]
BLEND_OP :: enum i32 {
	ADD = 1,
	SUBTRACT = 2,
	REV_SUBTRACT = 3,
	MIN = 4,
	MAX = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_box ]]
BOX :: struct {
	left: u32,
	top: u32,
	front: u32,
	right: u32,
	bottom: u32,
	back: u32,
}

BROADCASTING_LAUNCH_OVERRIDES :: struct {
	pLocalRootArgumentsTableIndex: ^u32,
	pProgramEntry: ^BOOL,
	pNewName: ^NODE_ID,
	pShareInputOf: ^NODE_ID,
	pDispatchGrid: ^u32,
	pMaxDispatchGrid: ^u32,
	NumOutputOverrides: u32,
	pOutputOverrides: ^NODE_OUTPUT_OVERRIDES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_barrier ]]
BUFFER_BARRIER :: struct {
	SyncBefore: BARRIER_SYNC,
	SyncAfter: BARRIER_SYNC,
	AccessBefore: BARRIER_ACCESS,
	AccessAfter: BARRIER_ACCESS,
	pResource: ^IResource,
	Offset: u64,
	Size: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_rtv ]]
BUFFER_RTV :: struct {
	FirstElement: u64,
	NumElements: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_srv ]]
BUFFER_SRV :: struct {
	FirstElement: u64,
	NumElements: u32,
	StructureByteStride: u32,
	Flags: BUFFER_SRV_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_buffer_srv_flags ]]
BUFFER_SRV_FLAGS :: distinct bit_set[enum {
	RAW = 0,
}; i32]
BUFFER_SRV_FLAGS_NONE :: transmute(BUFFER_SRV_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_buffer_uav ]]
BUFFER_UAV :: struct {
	FirstElement: u64,
	NumElements: u32,
	StructureByteStride: u32,
	CounterOffsetInBytes: u64,
	Flags: BUFFER_UAV_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_buffer_uav_flags ]]
BUFFER_UAV_FLAGS :: distinct bit_set[enum {
	RAW = 0,
}; i32]
BUFFER_UAV_FLAGS_NONE :: transmute(BUFFER_UAV_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_desc ]]
BUILD_RAYTRACING_ACCELERATION_STRUCTURE_DESC :: struct {
	DestAccelerationStructureData: u64,
	Inputs: BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS,
	SourceAccelerationStructureData: u64,
	ScratchAccelerationStructureData: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_inputs ]]
BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS :: struct {
	Type: RAYTRACING_ACCELERATION_STRUCTURE_TYPE,
	Flags: RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS,
	NumDescs: u32,
	DescsLayout: ELEMENTS_LAYOUT,
	using _: struct #raw_union {
		InstanceDescs: u64,
		pGeometryDescs: ^RAYTRACING_GEOMETRY_DESC,
		ppGeometryDescs: ^RAYTRACING_GEOMETRY_DESC,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_tools_visualization_header ]]
BUILD_RAYTRACING_ACCELERATION_STRUCTURE_TOOLS_VISUALIZATION_HEADER :: struct {
	Type: RAYTRACING_ACCELERATION_STRUCTURE_TYPE,
	NumDescs: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_cached_pipeline_state ]]
CACHED_PIPELINE_STATE :: struct {
	pCachedBlob: rawptr,
	CachedBlobSizeInBytes: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_clear_flags ]]
CLEAR_FLAGS :: distinct bit_set[enum {
	DEPTH = 0,
	STENCIL = 1,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_clear_value ]]
CLEAR_VALUE :: struct {
	Format: dxgi.FORMAT,
	using _: struct #raw_union {
		Color: [4]f32,
		DepthStencil: DEPTH_STENCIL_VALUE,
	},
}

COALESCING_LAUNCH_OVERRIDES :: struct {
	pLocalRootArgumentsTableIndex: ^u32,
	pProgramEntry: ^BOOL,
	pNewName: ^NODE_ID,
	pShareInputOf: ^NODE_ID,
	NumOutputOverrides: u32,
	pOutputOverrides: ^NODE_OUTPUT_OVERRIDES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_color_write_enable ]]
COLOR_WRITE_ENABLE :: enum i32 {
	RED = 1,
	GREEN = 2,
	BLUE = 4,
	ALPHA = 8,
	ALL = 15,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_list_flags ]]
COMMAND_LIST_FLAGS :: distinct bit_set[enum {}; i32]
COMMAND_LIST_FLAGS_NONE :: transmute(COMMAND_LIST_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_list_support_flags ]]
COMMAND_LIST_SUPPORT_FLAGS :: distinct bit_set[enum {
	DIRECT = 0,
	BUNDLE = 1,
	COMPUTE = 2,
	COPY = 3,
	VIDEO_DECODE = 4,
	VIDEO_PROCESS = 5,
	VIDEO_ENCODE = 6,
}; i32]
COMMAND_LIST_SUPPORT_FLAGS_NONE :: transmute(COMMAND_LIST_SUPPORT_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_list_type ]]
COMMAND_LIST_TYPE :: enum i32 {
	DIRECT = 0,
	BUNDLE = 1,
	COMPUTE = 2,
	COPY = 3,
	VIDEO_DECODE = 4,
	VIDEO_PROCESS = 5,
	VIDEO_ENCODE = 6,
	NONE = -1,
}

COMMAND_POOL_FLAGS :: distinct bit_set[enum {}; i32]
COMMAND_POOL_FLAGS_NONE :: transmute(COMMAND_POOL_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_command_queue_desc ]]
COMMAND_QUEUE_DESC :: struct {
	Type: COMMAND_LIST_TYPE,
	Priority: i32,
	Flags: COMMAND_QUEUE_FLAGS,
	NodeMask: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_queue_flags ]]
COMMAND_QUEUE_FLAGS :: distinct bit_set[enum {
	DISABLE_GPU_TIMEOUT = 0,
}; i32]
COMMAND_QUEUE_FLAGS_NONE :: transmute(COMMAND_QUEUE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_queue_priority ]]
COMMAND_QUEUE_PRIORITY :: enum i32 {
	NORMAL = 0,
	HIGH = 100,
	GLOBAL_REALTIME = 10000,
}

COMMAND_RECORDER_FLAGS :: distinct bit_set[enum {}; i32]
COMMAND_RECORDER_FLAGS_NONE :: transmute(COMMAND_RECORDER_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_command_signature_desc ]]
COMMAND_SIGNATURE_DESC :: struct {
	ByteStride: u32,
	NumArgumentDescs: u32,
	pArgumentDescs: ^INDIRECT_ARGUMENT_DESC,
	NodeMask: u32,
}

COMMON_COMPUTE_NODE_OVERRIDES :: struct {
	pLocalRootArgumentsTableIndex: ^u32,
	pProgramEntry: ^BOOL,
	pNewName: ^NODE_ID,
	pShareInputOf: ^NODE_ID,
	NumOutputOverrides: u32,
	pOutputOverrides: ^NODE_OUTPUT_OVERRIDES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_comparison_func ]]
COMPARISON_FUNC :: enum i32 {
	NONE = 0,
	NEVER = 1,
	LESS = 2,
	EQUAL = 3,
	LESS_EQUAL = 4,
	GREATER = 5,
	NOT_EQUAL = 6,
	GREATER_EQUAL = 7,
	ALWAYS = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_compute_pipeline_state_desc ]]
COMPUTE_PIPELINE_STATE_DESC :: struct {
	pRootSignature: ^IRootSignature,
	CS: SHADER_BYTECODE,
	NodeMask: u32,
	CachedPSO: CACHED_PIPELINE_STATE,
	Flags: PIPELINE_STATE_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_conservative_rasterization_mode ]]
CONSERVATIVE_RASTERIZATION_MODE :: enum i32 {
	OFF = 0,
	ON = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_conservative_rasterization_tier ]]
CONSERVATIVE_RASTERIZATION_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1 = 1,
	_2 = 2,
	_3 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_constant_buffer_view_desc ]]
CONSTANT_BUFFER_VIEW_DESC :: struct {
	BufferLocation: u64,
	SizeInBytes: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle ]]
CPU_DESCRIPTOR_HANDLE :: struct {
	ptr: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cpu_page_property ]]
CPU_PAGE_PROPERTY :: enum i32 {
	UNKNOWN = 0,
	NOT_AVAILABLE = 1,
	WRITE_COMBINE = 2,
	WRITE_BACK = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cross_node_sharing_tier ]]
CROSS_NODE_SHARING_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1_EMULATED = 1,
	_1 = 2,
	_2 = 3,
	_3 = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_cull_mode ]]
CULL_MODE :: enum i32 {
	NONE = 1,
	FRONT = 2,
	BACK = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_command_list_gpu_based_validation_settings ]]
DEBUG_COMMAND_LIST_GPU_BASED_VALIDATION_SETTINGS :: struct {
	ShaderPatchMode: GPU_BASED_VALIDATION_SHADER_PATCH_MODE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_command_list_parameter_type ]]
DEBUG_COMMAND_LIST_PARAMETER_TYPE :: enum i32 {
	GPU_BASED_VALIDATION_SETTINGS = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_based_validation_settings ]]
DEBUG_DEVICE_GPU_BASED_VALIDATION_SETTINGS :: struct {
	MaxMessagesPerCommandList: u32,
	DefaultShaderPatchMode: GPU_BASED_VALIDATION_SHADER_PATCH_MODE,
	PipelineStateCreateFlags: GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_debug_device_gpu_slowdown_performance_factor ]]
DEBUG_DEVICE_GPU_SLOWDOWN_PERFORMANCE_FACTOR :: struct {
	SlowdownFactor: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type ]]
DEBUG_DEVICE_PARAMETER_TYPE :: enum i32 {
	FEATURE_FLAGS = 0,
	GPU_BASED_VALIDATION_SETTINGS = 1,
	GPU_SLOWDOWN_PERFORMANCE_FACTOR = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature ]]
DEBUG_FEATURE :: distinct bit_set[enum {
	ALLOW_BEHAVIOR_CHANGING_DEBUG_AIDS = 0,
	CONSERVATIVE_RESOURCE_STATE_TRACKING = 1,
	DISABLE_VIRTUALIZED_BUNDLES_VALIDATION = 2,
	EMULATE_WINDOWS7 = 3,
}; i32]
DEBUG_FEATURE_NONE :: transmute(DEBUG_FEATURE)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc ]]
DEPTH_STENCIL_DESC :: struct {
	DepthEnable: BOOL,
	DepthWriteMask: DEPTH_WRITE_MASK,
	DepthFunc: COMPARISON_FUNC,
	StencilEnable: BOOL,
	StencilReadMask: u8,
	StencilWriteMask: u8,
	FrontFace: DEPTH_STENCILOP_DESC,
	BackFace: DEPTH_STENCILOP_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_desc1 ]]
DEPTH_STENCIL_DESC1 :: struct {
	DepthEnable: BOOL,
	DepthWriteMask: DEPTH_WRITE_MASK,
	DepthFunc: COMPARISON_FUNC,
	StencilEnable: BOOL,
	StencilReadMask: u8,
	StencilWriteMask: u8,
	FrontFace: DEPTH_STENCILOP_DESC,
	BackFace: DEPTH_STENCILOP_DESC,
	DepthBoundsTestEnable: BOOL,
}

DEPTH_STENCIL_DESC2 :: struct {
	DepthEnable: BOOL,
	DepthWriteMask: DEPTH_WRITE_MASK,
	DepthFunc: COMPARISON_FUNC,
	StencilEnable: BOOL,
	FrontFace: DEPTH_STENCILOP_DESC1,
	BackFace: DEPTH_STENCILOP_DESC1,
	DepthBoundsTestEnable: BOOL,
}

DEPTH_STENCIL_FORMAT :: struct {
	DepthStencilFormat: dxgi.FORMAT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_value ]]
DEPTH_STENCIL_VALUE :: struct {
	Depth: f32,
	Stencil: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencil_view_desc ]]
DEPTH_STENCIL_VIEW_DESC :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: DSV_DIMENSION,
	Flags: DSV_FLAGS,
	using _: struct #raw_union {
		Texture1D: TEX1D_DSV,
		Texture1DArray: TEX1D_ARRAY_DSV,
		Texture2D: TEX2D_DSV,
		Texture2DArray: TEX2D_ARRAY_DSV,
		Texture2DMS: TEX2DMS_DSV,
		Texture2DMSArray: TEX2DMS_ARRAY_DSV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_depth_stencilop_desc ]]
DEPTH_STENCILOP_DESC :: struct {
	StencilFailOp: STENCIL_OP,
	StencilDepthFailOp: STENCIL_OP,
	StencilPassOp: STENCIL_OP,
	StencilFunc: COMPARISON_FUNC,
}

DEPTH_STENCILOP_DESC1 :: struct {
	StencilFailOp: STENCIL_OP,
	StencilDepthFailOp: STENCIL_OP,
	StencilPassOp: STENCIL_OP,
	StencilFunc: COMPARISON_FUNC,
	StencilReadMask: u8,
	StencilWriteMask: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_depth_write_mask ]]
DEPTH_WRITE_MASK :: enum i32 {
	ZERO = 0,
	ALL = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_descriptor_heap_desc ]]
DESCRIPTOR_HEAP_DESC :: struct {
	Type: DESCRIPTOR_HEAP_TYPE,
	NumDescriptors: u32,
	Flags: DESCRIPTOR_HEAP_FLAGS,
	NodeMask: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_flags ]]
DESCRIPTOR_HEAP_FLAGS :: distinct bit_set[enum {
	SHADER_VISIBLE = 0,
}; i32]
DESCRIPTOR_HEAP_FLAGS_NONE :: transmute(DESCRIPTOR_HEAP_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_heap_type ]]
DESCRIPTOR_HEAP_TYPE :: enum i32 {
	CBV_SRV_UAV = 0,
	SAMPLER = 1,
	RTV = 2,
	DSV = 3,
	NUM_TYPES = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_descriptor_range ]]
DESCRIPTOR_RANGE :: struct {
	RangeType: DESCRIPTOR_RANGE_TYPE,
	NumDescriptors: u32,
	BaseShaderRegister: u32,
	RegisterSpace: u32,
	OffsetInDescriptorsFromTableStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_range_flags ]]
DESCRIPTOR_RANGE_FLAGS :: distinct bit_set[enum {
	DESCRIPTORS_VOLATILE = 0,
	DATA_VOLATILE = 1,
	DATA_STATIC_WHILE_SET_AT_EXECUTE = 2,
	DATA_STATIC = 3,
	DESCRIPTORS_STATIC_KEEPING_BUFFER_BOUNDS_CHECKS = 16,
}; i32]
DESCRIPTOR_RANGE_FLAGS_NONE :: transmute(DESCRIPTOR_RANGE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_descriptor_range_type ]]
DESCRIPTOR_RANGE_TYPE :: enum i32 {
	SRV = 0,
	UAV = 1,
	CBV = 2,
	SAMPLER = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_descriptor_range1 ]]
DESCRIPTOR_RANGE1 :: struct {
	RangeType: DESCRIPTOR_RANGE_TYPE,
	NumDescriptors: u32,
	BaseShaderRegister: u32,
	RegisterSpace: u32,
	Flags: DESCRIPTOR_RANGE_FLAGS,
	OffsetInDescriptorsFromTableStart: u32,
}

DEVICE_CONFIGURATION_DESC :: struct {
	Flags: DEVICE_FLAGS,
	GpuBasedValidationFlags: u32,
	SDKVersion: u32,
	NumEnabledExperimentalFeatures: u32,
}

DEVICE_FACTORY_FLAGS :: distinct bit_set[enum {
	ALLOW_RETURNING_EXISTING_DEVICE = 0,
	ALLOW_RETURNING_INCOMPATIBLE_EXISTING_DEVICE = 1,
	DISALLOW_STORING_NEW_DEVICE_AS_SINGLETON = 2,
}; i32]
DEVICE_FACTORY_FLAGS_NONE :: transmute(DEVICE_FACTORY_FLAGS)i32(0)

DEVICE_FLAGS :: distinct bit_set[enum {
	DEBUG_LAYER_ENABLED = 0,
	GPU_BASED_VALIDATION_ENABLED = 1,
	SYNCHRONIZED_COMMAND_QUEUE_VALIDATION_DISABLED = 2,
	DRED_AUTO_BREADCRUMBS_ENABLED = 3,
	DRED_PAGE_FAULT_REPORTING_ENABLED = 4,
	DRED_WATSON_REPORTING_ENABLED = 5,
	DRED_BREADCRUMB_CONTEXT_ENABLED = 6,
	DRED_USE_MARKERS_ONLY_BREADCRUMBS = 7,
	SHADER_INSTRUMENTATION_ENABLED = 8,
	AUTO_DEBUG_NAME_ENABLED = 9,
	FORCE_LEGACY_STATE_VALIDATION = 10,
}; i32]
DEVICE_FLAGS_NONE :: transmute(DEVICE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_device_removed_extended_data ]]
DEVICE_REMOVED_EXTENDED_DATA :: struct {
	Flags: DRED_FLAGS,
	pHeadAutoBreadcrumbNode: ^AUTO_BREADCRUMB_NODE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_device_removed_extended_data1 ]]
DEVICE_REMOVED_EXTENDED_DATA1 :: struct {
	DeviceRemovedReason: HRESULT,
	AutoBreadcrumbsOutput: DRED_AUTO_BREADCRUMBS_OUTPUT,
	PageFaultOutput: DRED_PAGE_FAULT_OUTPUT,
}

DEVICE_REMOVED_EXTENDED_DATA2 :: struct {
	DeviceRemovedReason: HRESULT,
	AutoBreadcrumbsOutput: DRED_AUTO_BREADCRUMBS_OUTPUT1,
	PageFaultOutput: DRED_PAGE_FAULT_OUTPUT1,
}

DEVICE_REMOVED_EXTENDED_DATA3 :: struct {
	DeviceRemovedReason: HRESULT,
	AutoBreadcrumbsOutput: DRED_AUTO_BREADCRUMBS_OUTPUT1,
	PageFaultOutput: DRED_PAGE_FAULT_OUTPUT2,
	DeviceState: DRED_DEVICE_STATE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_discard_region ]]
DISCARD_REGION :: struct {
	NumRects: u32,
	pRects: ^RECT,
	FirstSubresource: u32,
	NumSubresources: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dispatch_arguments ]]
DISPATCH_ARGUMENTS :: struct {
	ThreadGroupCountX: u32,
	ThreadGroupCountY: u32,
	ThreadGroupCountZ: u32,
}

DISPATCH_GRAPH_DESC :: struct {
	Mode: DISPATCH_MODE,
	using _: struct #raw_union {
		NodeCPUInput: NODE_CPU_INPUT,
		NodeGPUInput: u64,
		MultiNodeCPUInput: MULTI_NODE_CPU_INPUT,
		MultiNodeGPUInput: u64,
	},
}

DISPATCH_MESH_ARGUMENTS :: struct {
	ThreadGroupCountX: u32,
	ThreadGroupCountY: u32,
	ThreadGroupCountZ: u32,
}

DISPATCH_MODE :: enum i32 {
	NODE_CPU_INPUT = 0,
	NODE_GPU_INPUT = 1,
	MULTI_NODE_CPU_INPUT = 2,
	MULTI_NODE_GPU_INPUT = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dispatch_rays_desc ]]
DISPATCH_RAYS_DESC :: struct {
	RayGenerationShaderRecord: GPU_VIRTUAL_ADDRESS_RANGE,
	MissShaderTable: GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE,
	HitGroupTable: GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE,
	CallableShaderTable: GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE,
	Width: u32,
	Height: u32,
	Depth: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_draw_arguments ]]
DRAW_ARGUMENTS :: struct {
	VertexCountPerInstance: u32,
	InstanceCount: u32,
	StartVertexLocation: u32,
	StartInstanceLocation: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_draw_indexed_arguments ]]
DRAW_INDEXED_ARGUMENTS :: struct {
	IndexCountPerInstance: u32,
	InstanceCount: u32,
	StartIndexLocation: u32,
	BaseVertexLocation: i32,
	StartInstanceLocation: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dred_allocation_node ]]
DRED_ALLOCATION_NODE :: struct {
	ObjectNameA: ^u8,
	ObjectNameW: PWSTR,
	AllocationType: DRED_ALLOCATION_TYPE,
	pNext: ^DRED_ALLOCATION_NODE,
}

DRED_ALLOCATION_NODE1 :: struct {
	ObjectNameA: ^u8,
	ObjectNameW: PWSTR,
	AllocationType: DRED_ALLOCATION_TYPE,
	pNext: ^DRED_ALLOCATION_NODE1,
	pObject: ^IUnknown,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dred_allocation_type ]]
DRED_ALLOCATION_TYPE :: enum i32 {
	COMMAND_QUEUE = 19,
	COMMAND_ALLOCATOR = 20,
	PIPELINE_STATE = 21,
	COMMAND_LIST = 22,
	FENCE = 23,
	DESCRIPTOR_HEAP = 24,
	HEAP = 25,
	QUERY_HEAP = 27,
	COMMAND_SIGNATURE = 28,
	PIPELINE_LIBRARY = 29,
	VIDEO_DECODER = 30,
	VIDEO_PROCESSOR = 32,
	RESOURCE = 34,
	PASS = 35,
	CRYPTOSESSION = 36,
	CRYPTOSESSIONPOLICY = 37,
	PROTECTEDRESOURCESESSION = 38,
	VIDEO_DECODER_HEAP = 39,
	COMMAND_POOL = 40,
	COMMAND_RECORDER = 41,
	STATE_OBJECT = 42,
	METACOMMAND = 43,
	SCHEDULINGGROUP = 44,
	VIDEO_MOTION_ESTIMATOR = 45,
	VIDEO_MOTION_VECTOR_HEAP = 46,
	VIDEO_EXTENSION_COMMAND = 47,
	VIDEO_ENCODER = 48,
	VIDEO_ENCODER_HEAP = 49,
	INVALID = -1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dred_auto_breadcrumbs_output ]]
DRED_AUTO_BREADCRUMBS_OUTPUT :: struct {
	pHeadAutoBreadcrumbNode: ^AUTO_BREADCRUMB_NODE,
}

DRED_AUTO_BREADCRUMBS_OUTPUT1 :: struct {
	pHeadAutoBreadcrumbNode: ^AUTO_BREADCRUMB_NODE1,
}

DRED_BREADCRUMB_CONTEXT :: struct {
	BreadcrumbIndex: u32,
	pContextString: PWSTR,
}

DRED_DEVICE_STATE :: enum i32 {
	UNKNOWN = 0,
	HUNG = 3,
	FAULT = 6,
	PAGEFAULT = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dred_enablement ]]
DRED_ENABLEMENT :: enum i32 {
	SYSTEM_CONTROLLED = 0,
	FORCED_OFF = 1,
	FORCED_ON = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dred_flags ]]
DRED_FLAGS :: distinct bit_set[enum {
	FORCE_ENABLE = 0,
	DISABLE_AUTOBREADCRUMBS = 1,
}; i32]
DRED_FLAGS_NONE :: transmute(DRED_FLAGS)i32(0)

DRED_PAGE_FAULT_FLAGS :: distinct bit_set[enum {}; i32]
DRED_PAGE_FAULT_FLAGS_NONE :: transmute(DRED_PAGE_FAULT_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dred_page_fault_output ]]
DRED_PAGE_FAULT_OUTPUT :: struct {
	PageFaultVA: u64,
	pHeadExistingAllocationNode: ^DRED_ALLOCATION_NODE,
	pHeadRecentFreedAllocationNode: ^DRED_ALLOCATION_NODE,
}

DRED_PAGE_FAULT_OUTPUT1 :: struct {
	PageFaultVA: u64,
	pHeadExistingAllocationNode: ^DRED_ALLOCATION_NODE1,
	pHeadRecentFreedAllocationNode: ^DRED_ALLOCATION_NODE1,
}

DRED_PAGE_FAULT_OUTPUT2 :: struct {
	PageFaultVA: u64,
	pHeadExistingAllocationNode: ^DRED_ALLOCATION_NODE1,
	pHeadRecentFreedAllocationNode: ^DRED_ALLOCATION_NODE1,
	PageFaultFlags: DRED_PAGE_FAULT_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dred_version ]]
DRED_VERSION :: enum i32 {
	_0 = 1,
	_1 = 2,
	_2 = 3,
	_3 = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_driver_matching_identifier_status ]]
DRIVER_MATCHING_IDENTIFIER_STATUS :: enum i32 {
	COMPATIBLE_WITH_DEVICE = 0,
	UNSUPPORTED_TYPE = 1,
	UNRECOGNIZED = 2,
	INCOMPATIBLE_VERSION = 3,
	INCOMPATIBLE_TYPE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dsv_dimension ]]
DSV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	TEXTURE1D = 1,
	TEXTURE1DARRAY = 2,
	TEXTURE2D = 3,
	TEXTURE2DARRAY = 4,
	TEXTURE2DMS = 5,
	TEXTURE2DMSARRAY = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_dsv_flags ]]
DSV_FLAGS :: distinct bit_set[enum {
	READ_ONLY_DEPTH = 0,
	READ_ONLY_STENCIL = 1,
}; i32]
DSV_FLAGS_NONE :: transmute(DSV_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dxil_library_desc ]]
DXIL_LIBRARY_DESC :: struct {
	DXILLibrary: SHADER_BYTECODE,
	NumExports: u32,
	pExports: ^EXPORT_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_dxil_subobject_to_exports_association ]]
DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION :: struct {
	SubobjectToAssociate: PWSTR,
	NumExports: u32,
	pExports: ^PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_elements_layout ]]
ELEMENTS_LAYOUT :: enum i32 {
	ARRAY = 0,
	ARRAY_OF_POINTERS = 1,
}

EXECUTE_INDIRECT_TIER :: enum i32 {
	_0 = 10,
	_1 = 11,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_existing_collection_desc ]]
EXISTING_COLLECTION_DESC :: struct {
	pExistingCollection: ^IStateObject,
	NumExports: u32,
	pExports: ^EXPORT_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_export_desc ]]
EXPORT_DESC :: struct {
	Name: PWSTR,
	ExportToRename: PWSTR,
	Flags: EXPORT_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_export_flags ]]
EXPORT_FLAGS :: distinct bit_set[enum {}; i32]
EXPORT_FLAGS_NONE :: transmute(EXPORT_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_feature ]]
FEATURE :: enum i32 {
	D3D12_OPTIONS = 0,
	ARCHITECTURE = 1,
	FEATURE_LEVELS = 2,
	FORMAT_SUPPORT = 3,
	MULTISAMPLE_QUALITY_LEVELS = 4,
	FORMAT_INFO = 5,
	GPU_VIRTUAL_ADDRESS_SUPPORT = 6,
	SHADER_MODEL = 7,
	D3D12_OPTIONS1 = 8,
	PROTECTED_RESOURCE_SESSION_SUPPORT = 10,
	ROOT_SIGNATURE = 12,
	ARCHITECTURE1 = 16,
	D3D12_OPTIONS2 = 18,
	SHADER_CACHE = 19,
	COMMAND_QUEUE_PRIORITY = 20,
	D3D12_OPTIONS3 = 21,
	EXISTING_HEAPS = 22,
	D3D12_OPTIONS4 = 23,
	SERIALIZATION = 24,
	CROSS_NODE = 25,
	D3D12_OPTIONS5 = 27,
	DISPLAYABLE = 28,
	D3D12_OPTIONS6 = 30,
	QUERY_META_COMMAND = 31,
	D3D12_OPTIONS7 = 32,
	PROTECTED_RESOURCE_SESSION_TYPE_COUNT = 33,
	PROTECTED_RESOURCE_SESSION_TYPES = 34,
	D3D12_OPTIONS8 = 36,
	D3D12_OPTIONS9 = 37,
	D3D12_OPTIONS10 = 39,
	D3D12_OPTIONS11 = 40,
	D3D12_OPTIONS12 = 41,
	D3D12_OPTIONS13 = 42,
	D3D12_OPTIONS14 = 43,
	D3D12_OPTIONS15 = 44,
	D3D12_OPTIONS16 = 45,
	D3D12_OPTIONS17 = 46,
	D3D12_OPTIONS18 = 47,
	D3D12_OPTIONS19 = 48,
	D3D12_OPTIONS20 = 49,
	PREDICATION = 50,
	PLACED_RESOURCE_SUPPORT_INFO = 51,
	HARDWARE_COPY = 52,
	D3D12_OPTIONS21 = 53,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_architecture ]]
FEATURE_DATA_ARCHITECTURE :: struct {
	NodeIndex: u32,
	TileBasedRenderer: BOOL,
	UMA: BOOL,
	CacheCoherentUMA: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_architecture1 ]]
FEATURE_DATA_ARCHITECTURE1 :: struct {
	NodeIndex: u32,
	TileBasedRenderer: BOOL,
	UMA: BOOL,
	CacheCoherentUMA: BOOL,
	IsolatedMMU: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_command_queue_priority ]]
FEATURE_DATA_COMMAND_QUEUE_PRIORITY :: struct {
	CommandListType: COMMAND_LIST_TYPE,
	Priority: u32,
	PriorityForTypeIsSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_cross_node ]]
FEATURE_DATA_CROSS_NODE :: struct {
	SharingTier: CROSS_NODE_SHARING_TIER,
	AtomicShaderInstructions: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options ]]
FEATURE_DATA_D3D12_OPTIONS :: struct {
	DoublePrecisionFloatShaderOps: BOOL,
	OutputMergerLogicOp: BOOL,
	MinPrecisionSupport: SHADER_MIN_PRECISION_SUPPORT,
	TiledResourcesTier: TILED_RESOURCES_TIER,
	ResourceBindingTier: RESOURCE_BINDING_TIER,
	PSSpecifiedStencilRefSupported: BOOL,
	TypedUAVLoadAdditionalFormats: BOOL,
	ROVsSupported: BOOL,
	ConservativeRasterizationTier: CONSERVATIVE_RASTERIZATION_TIER,
	MaxGPUVirtualAddressBitsPerResource: u32,
	StandardSwizzle64KBSupported: BOOL,
	CrossNodeSharingTier: CROSS_NODE_SHARING_TIER,
	CrossAdapterRowMajorTextureSupported: BOOL,
	VPAndRTArrayIndexFromAnyShaderFeedingRasterizerSupportedWithoutGSEmulation: BOOL,
	ResourceHeapTier: RESOURCE_HEAP_TIER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options1 ]]
FEATURE_DATA_D3D12_OPTIONS1 :: struct {
	WaveOps: BOOL,
	WaveLaneCountMin: u32,
	WaveLaneCountMax: u32,
	TotalLaneCount: u32,
	ExpandedComputeResourceStates: BOOL,
	Int64ShaderOps: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options10 ]]
FEATURE_DATA_D3D12_OPTIONS10 :: struct {
	VariableRateShadingSumCombinerSupported: BOOL,
	MeshShaderPerPrimitiveShadingRateSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options11 ]]
FEATURE_DATA_D3D12_OPTIONS11 :: struct {
	AtomicInt64OnDescriptorHeapResourceSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options12 ]]
FEATURE_DATA_D3D12_OPTIONS12 :: struct {
	MSPrimitivesPipelineStatisticIncludesCulledPrimitives: TRI_STATE,
	EnhancedBarriersSupported: BOOL,
	RelaxedFormatCastingSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options13 ]]
FEATURE_DATA_D3D12_OPTIONS13 :: struct {
	UnrestrictedBufferTextureCopyPitchSupported: BOOL,
	UnrestrictedVertexElementAlignmentSupported: BOOL,
	InvertedViewportHeightFlipsYSupported: BOOL,
	InvertedViewportDepthFlipsZSupported: BOOL,
	TextureCopyBetweenDimensionsSupported: BOOL,
	AlphaBlendFactorSupported: BOOL,
}

FEATURE_DATA_D3D12_OPTIONS14 :: struct {
	AdvancedTextureOpsSupported: BOOL,
	WriteableMSAATexturesSupported: BOOL,
	IndependentFrontAndBackStencilRefMaskSupported: BOOL,
}

FEATURE_DATA_D3D12_OPTIONS15 :: struct {
	TriangleFanSupported: BOOL,
	DynamicIndexBufferStripCutSupported: BOOL,
}

FEATURE_DATA_D3D12_OPTIONS16 :: struct {
	DynamicDepthBiasSupported: BOOL,
	GPUUploadHeapSupported: BOOL,
}

FEATURE_DATA_D3D12_OPTIONS17 :: struct {
	NonNormalizedCoordinateSamplersSupported: BOOL,
	ManualWriteTrackingResourceSupported: BOOL,
}

FEATURE_DATA_D3D12_OPTIONS18 :: struct {
	RenderPassesValid: BOOL,
}

FEATURE_DATA_D3D12_OPTIONS19 :: struct {
	MismatchingOutputDimensionsSupported: BOOL,
	SupportedSampleCountsWithNoOutputs: u32,
	PointSamplingAddressesNeverRoundUp: BOOL,
	RasterizerDesc2Supported: BOOL,
	NarrowQuadrilateralLinesSupported: BOOL,
	AnisoFilterWithPointMipSupported: BOOL,
	MaxSamplerDescriptorHeapSize: u32,
	MaxSamplerDescriptorHeapSizeWithStaticSamplers: u32,
	MaxViewDescriptorHeapSize: u32,
	ComputeOnlyCustomHeapSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options2 ]]
FEATURE_DATA_D3D12_OPTIONS2 :: struct {
	DepthBoundsTestSupported: BOOL,
	ProgrammableSamplePositionsTier: PROGRAMMABLE_SAMPLE_POSITIONS_TIER,
}

FEATURE_DATA_D3D12_OPTIONS20 :: struct {
	ComputeOnlyWriteWatchSupported: BOOL,
	RecreateAtTier: RECREATE_AT_TIER,
}

FEATURE_DATA_D3D12_OPTIONS21 :: struct {
	WorkGraphsTier: WORK_GRAPHS_TIER,
	ExecuteIndirectTier: EXECUTE_INDIRECT_TIER,
	SampleCmpGradientAndBiasSupported: BOOL,
	ExtendedCommandInfoSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options3 ]]
FEATURE_DATA_D3D12_OPTIONS3 :: struct {
	CopyQueueTimestampQueriesSupported: BOOL,
	CastingFullyTypedFormatSupported: BOOL,
	WriteBufferImmediateSupportFlags: COMMAND_LIST_SUPPORT_FLAGS,
	ViewInstancingTier: VIEW_INSTANCING_TIER,
	BarycentricsSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options4 ]]
FEATURE_DATA_D3D12_OPTIONS4 :: struct {
	MSAA64KBAlignedTextureSupported: BOOL,
	SharedResourceCompatibilityTier: SHARED_RESOURCE_COMPATIBILITY_TIER,
	Native16BitShaderOpsSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options5 ]]
FEATURE_DATA_D3D12_OPTIONS5 :: struct {
	SRVOnlyTiledResourceTier3: BOOL,
	RenderPassesTier: RENDER_PASS_TIER,
	RaytracingTier: RAYTRACING_TIER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options6 ]]
FEATURE_DATA_D3D12_OPTIONS6 :: struct {
	AdditionalShadingRatesSupported: BOOL,
	PerPrimitiveShadingRateSupportedWithViewportIndexing: BOOL,
	VariableShadingRateTier: VARIABLE_SHADING_RATE_TIER,
	ShadingRateImageTileSize: u32,
	BackgroundProcessingSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options7 ]]
FEATURE_DATA_D3D12_OPTIONS7 :: struct {
	MeshShaderTier: MESH_SHADER_TIER,
	SamplerFeedbackTier: SAMPLER_FEEDBACK_TIER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options8 ]]
FEATURE_DATA_D3D12_OPTIONS8 :: struct {
	UnalignedBlockTexturesSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_d3d12_options9 ]]
FEATURE_DATA_D3D12_OPTIONS9 :: struct {
	MeshShaderPipelineStatsSupported: BOOL,
	MeshShaderSupportsFullRangeRenderTargetArrayIndex: BOOL,
	AtomicInt64OnTypedResourceSupported: BOOL,
	AtomicInt64OnGroupSharedSupported: BOOL,
	DerivativesInMeshAndAmplificationShadersSupported: BOOL,
	WaveMMATier: WAVE_MMA_TIER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_displayable ]]
FEATURE_DATA_DISPLAYABLE :: struct {
	DisplayableTexture: BOOL,
	SharedResourceCompatibilityTier: SHARED_RESOURCE_COMPATIBILITY_TIER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_existing_heaps ]]
FEATURE_DATA_EXISTING_HEAPS :: struct {
	Supported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_feature_levels ]]
FEATURE_DATA_FEATURE_LEVELS :: struct {
	NumFeatureLevels: u32,
	pFeatureLevelsRequested: ^d3d.FEATURE_LEVEL,
	MaxSupportedFeatureLevel: d3d.FEATURE_LEVEL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_format_info ]]
FEATURE_DATA_FORMAT_INFO :: struct {
	Format: dxgi.FORMAT,
	PlaneCount: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_format_support ]]
FEATURE_DATA_FORMAT_SUPPORT :: struct {
	Format: dxgi.FORMAT,
	Support1: FORMAT_SUPPORT1,
	Support2: FORMAT_SUPPORT2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_gpu_virtual_address_support ]]
FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT :: struct {
	MaxGPUVirtualAddressBitsPerResource: u32,
	MaxGPUVirtualAddressBitsPerProcess: u32,
}

FEATURE_DATA_HARDWARE_COPY :: struct {
	Supported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_multisample_quality_levels ]]
FEATURE_DATA_MULTISAMPLE_QUALITY_LEVELS :: struct {
	Format: dxgi.FORMAT,
	SampleCount: u32,
	Flags: MULTISAMPLE_QUALITY_LEVEL_FLAGS,
	NumQualityLevels: u32,
}

FEATURE_DATA_PLACED_RESOURCE_SUPPORT_INFO :: struct {
	Format: dxgi.FORMAT,
	Dimension: RESOURCE_DIMENSION,
	DestHeapProperties: HEAP_PROPERTIES,
	Supported: BOOL,
}

FEATURE_DATA_PREDICATION :: struct {
	Supported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_support ]]
FEATURE_DATA_PROTECTED_RESOURCE_SESSION_SUPPORT :: struct {
	NodeIndex: u32,
	Support: PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_type_count ]]
FEATURE_DATA_PROTECTED_RESOURCE_SESSION_TYPE_COUNT :: struct {
	NodeIndex: u32,
	Count: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_protected_resource_session_types ]]
FEATURE_DATA_PROTECTED_RESOURCE_SESSION_TYPES :: struct {
	NodeIndex: u32,
	Count: u32,
	pTypes: ^GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_query_meta_command ]]
FEATURE_DATA_QUERY_META_COMMAND :: struct {
	CommandId: GUID,
	NodeMask: u32,
	pQueryInputData: rawptr,
	QueryInputDataSizeInBytes: uintptr,
	pQueryOutputData: rawptr,
	QueryOutputDataSizeInBytes: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_root_signature ]]
FEATURE_DATA_ROOT_SIGNATURE :: struct {
	HighestVersion: ROOT_SIGNATURE_VERSION,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_serialization ]]
FEATURE_DATA_SERIALIZATION :: struct {
	NodeIndex: u32,
	HeapSerializationTier: HEAP_SERIALIZATION_TIER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_shader_cache ]]
FEATURE_DATA_SHADER_CACHE :: struct {
	SupportFlags: SHADER_CACHE_SUPPORT_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_feature_data_shader_model ]]
FEATURE_DATA_SHADER_MODEL :: struct {
	HighestShaderModel: SHADER_MODEL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_fence_flags ]]
FENCE_FLAGS :: distinct bit_set[enum {
	SHARED = 0,
	SHARED_CROSS_ADAPTER = 1,
	NON_MONITORED = 2,
}; i32]
FENCE_FLAGS_NONE :: transmute(FENCE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_fill_mode ]]
FILL_MODE :: enum i32 {
	WIREFRAME = 2,
	SOLID = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_filter ]]
FILTER :: enum i32 {
	MIN_MAG_MIP_POINT = 0,
	MIN_MAG_POINT_MIP_LINEAR = 1,
	MIN_POINT_MAG_LINEAR_MIP_POINT = 4,
	MIN_POINT_MAG_MIP_LINEAR = 5,
	MIN_LINEAR_MAG_MIP_POINT = 16,
	MIN_LINEAR_MAG_POINT_MIP_LINEAR = 17,
	MIN_MAG_LINEAR_MIP_POINT = 20,
	MIN_MAG_MIP_LINEAR = 21,
	MIN_MAG_ANISOTROPIC_MIP_POINT = 84,
	ANISOTROPIC = 85,
	COMPARISON_MIN_MAG_MIP_POINT = 128,
	COMPARISON_MIN_MAG_POINT_MIP_LINEAR = 129,
	COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT = 132,
	COMPARISON_MIN_POINT_MAG_MIP_LINEAR = 133,
	COMPARISON_MIN_LINEAR_MAG_MIP_POINT = 144,
	COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 145,
	COMPARISON_MIN_MAG_LINEAR_MIP_POINT = 148,
	COMPARISON_MIN_MAG_MIP_LINEAR = 149,
	COMPARISON_MIN_MAG_ANISOTROPIC_MIP_POINT = 212,
	COMPARISON_ANISOTROPIC = 213,
	MINIMUM_MIN_MAG_MIP_POINT = 256,
	MINIMUM_MIN_MAG_POINT_MIP_LINEAR = 257,
	MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT = 260,
	MINIMUM_MIN_POINT_MAG_MIP_LINEAR = 261,
	MINIMUM_MIN_LINEAR_MAG_MIP_POINT = 272,
	MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 273,
	MINIMUM_MIN_MAG_LINEAR_MIP_POINT = 276,
	MINIMUM_MIN_MAG_MIP_LINEAR = 277,
	MINIMUM_MIN_MAG_ANISOTROPIC_MIP_POINT = 340,
	MINIMUM_ANISOTROPIC = 341,
	MAXIMUM_MIN_MAG_MIP_POINT = 384,
	MAXIMUM_MIN_MAG_POINT_MIP_LINEAR = 385,
	MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT = 388,
	MAXIMUM_MIN_POINT_MAG_MIP_LINEAR = 389,
	MAXIMUM_MIN_LINEAR_MAG_MIP_POINT = 400,
	MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 401,
	MAXIMUM_MIN_MAG_LINEAR_MIP_POINT = 404,
	MAXIMUM_MIN_MAG_MIP_LINEAR = 405,
	MAXIMUM_MIN_MAG_ANISOTROPIC_MIP_POINT = 468,
	MAXIMUM_ANISOTROPIC = 469,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_filter_reduction_type ]]
FILTER_REDUCTION_TYPE :: enum i32 {
	STANDARD = 0,
	COMPARISON = 1,
	MINIMUM = 2,
	MAXIMUM = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_filter_type ]]
FILTER_TYPE :: enum i32 {
	POINT = 0,
	LINEAR = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_format_support1 ]]
FORMAT_SUPPORT1 :: distinct bit_set[enum {
	BUFFER = 0,
	IA_VERTEX_BUFFER = 1,
	IA_INDEX_BUFFER = 2,
	SO_BUFFER = 3,
	TEXTURE1D = 4,
	TEXTURE2D = 5,
	TEXTURE3D = 6,
	TEXTURECUBE = 7,
	SHADER_LOAD = 8,
	SHADER_SAMPLE = 9,
	SHADER_SAMPLE_COMPARISON = 10,
	SHADER_SAMPLE_MONO_TEXT = 11,
	MIP = 12,
	RENDER_TARGET = 14,
	BLENDABLE = 15,
	DEPTH_STENCIL = 16,
	MULTISAMPLE_RESOLVE = 18,
	DISPLAY = 19,
	CAST_WITHIN_BIT_LAYOUT = 20,
	MULTISAMPLE_RENDERTARGET = 21,
	MULTISAMPLE_LOAD = 22,
	SHADER_GATHER = 23,
	BACK_BUFFER_CAST = 24,
	TYPED_UNORDERED_ACCESS_VIEW = 25,
	SHADER_GATHER_COMPARISON = 26,
	DECODER_OUTPUT = 27,
	VIDEO_PROCESSOR_OUTPUT = 28,
	VIDEO_PROCESSOR_INPUT = 29,
	VIDEO_ENCODER = 30,
}; i32]
FORMAT_SUPPORT1_NONE :: transmute(FORMAT_SUPPORT1)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_format_support2 ]]
FORMAT_SUPPORT2 :: distinct bit_set[enum {
	UAV_ATOMIC_ADD = 0,
	UAV_ATOMIC_BITWISE_OPS = 1,
	UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE = 2,
	UAV_ATOMIC_EXCHANGE = 3,
	UAV_ATOMIC_SIGNED_MIN_OR_MAX = 4,
	UAV_ATOMIC_UNSIGNED_MIN_OR_MAX = 5,
	UAV_TYPED_LOAD = 6,
	UAV_TYPED_STORE = 7,
	OUTPUT_MERGER_LOGIC_OP = 8,
	TILED = 9,
	MULTIPLANE_OVERLAY = 14,
	SAMPLER_FEEDBACK = 15,
}; i32]
FORMAT_SUPPORT2_NONE :: transmute(FORMAT_SUPPORT2)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_function_desc ]]
FUNCTION_DESC :: struct {
	Version: u32,
	Creator: PSTR,
	Flags: u32,
	ConstantBuffers: u32,
	BoundResources: u32,
	InstructionCount: u32,
	TempRegisterCount: u32,
	TempArrayCount: u32,
	DefCount: u32,
	DclCount: u32,
	TextureNormalInstructions: u32,
	TextureLoadInstructions: u32,
	TextureCompInstructions: u32,
	TextureBiasInstructions: u32,
	TextureGradientInstructions: u32,
	FloatInstructionCount: u32,
	IntInstructionCount: u32,
	UintInstructionCount: u32,
	StaticFlowControlCount: u32,
	DynamicFlowControlCount: u32,
	MacroInstructionCount: u32,
	ArrayInstructionCount: u32,
	MovInstructionCount: u32,
	MovcInstructionCount: u32,
	ConversionInstructionCount: u32,
	BitwiseInstructionCount: u32,
	MinFeatureLevel: d3d.FEATURE_LEVEL,
	RequiredFeatureFlags: u64,
	Name: PSTR,
	FunctionParameterCount: i32,
	HasReturn: BOOL,
	Has10Level9VertexShader: BOOL,
	Has10Level9PixelShader: BOOL,
}

GENERIC_PROGRAM_DESC :: struct {
	ProgramName: PWSTR,
	NumExports: u32,
	pExports: ^PWSTR,
	NumSubobjects: u32,
	ppSubobjects: ^STATE_SUBOBJECT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_global_barrier ]]
GLOBAL_BARRIER :: struct {
	SyncBefore: BARRIER_SYNC,
	SyncAfter: BARRIER_SYNC,
	AccessBefore: BARRIER_ACCESS,
	AccessAfter: BARRIER_ACCESS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_global_root_signature ]]
GLOBAL_ROOT_SIGNATURE :: struct {
	pGlobalRootSignature: ^IRootSignature,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_flags ]]
GPU_BASED_VALIDATION_FLAGS :: distinct bit_set[enum {
	DISABLE_STATE_TRACKING = 0,
}; i32]
GPU_BASED_VALIDATION_FLAGS_NONE :: transmute(GPU_BASED_VALIDATION_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_pipeline_state_create_flags ]]
GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS :: distinct bit_set[enum {
	FRONT_LOAD_CREATE_TRACKING_ONLY_SHADERS = 0,
	FRONT_LOAD_CREATE_UNGUARDED_VALIDATION_SHADERS = 1,
	FRONT_LOAD_CREATE_GUARDED_VALIDATION_SHADERS = 2,
}; i32]
GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS_NONE :: transmute(GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS)i32(0)
GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS_S_VALID_MASK :: transmute(GPU_BASED_VALIDATION_PIPELINE_STATE_CREATE_FLAGS)i32(7)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_gpu_based_validation_shader_patch_mode ]]
GPU_BASED_VALIDATION_SHADER_PATCH_MODE :: enum i32 {
	D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_NONE = 0,
	D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_STATE_TRACKING_ONLY = 1,
	D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_UNGUARDED_VALIDATION = 2,
	D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODE_GUARDED_VALIDATION = 3,
	NUM_D3D12_GPU_BASED_VALIDATION_SHADER_PATCH_MODES = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_descriptor_handle ]]
GPU_DESCRIPTOR_HANDLE :: struct {
	ptr: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_virtual_address_and_stride ]]
GPU_VIRTUAL_ADDRESS_AND_STRIDE :: struct {
	StartAddress: u64,
	StrideInBytes: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_virtual_address_range ]]
GPU_VIRTUAL_ADDRESS_RANGE :: struct {
	StartAddress: u64,
	SizeInBytes: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_virtual_address_range_and_stride ]]
GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE :: struct {
	StartAddress: u64,
	SizeInBytes: u64,
	StrideInBytes: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_graphics_pipeline_state_desc ]]
GRAPHICS_PIPELINE_STATE_DESC :: struct {
	pRootSignature: ^IRootSignature,
	VS: SHADER_BYTECODE,
	PS: SHADER_BYTECODE,
	DS: SHADER_BYTECODE,
	HS: SHADER_BYTECODE,
	GS: SHADER_BYTECODE,
	StreamOutput: STREAM_OUTPUT_DESC,
	BlendState: BLEND_DESC,
	SampleMask: u32,
	RasterizerState: RASTERIZER_DESC,
	DepthStencilState: DEPTH_STENCIL_DESC,
	InputLayout: INPUT_LAYOUT_DESC,
	IBStripCutValue: INDEX_BUFFER_STRIP_CUT_VALUE,
	PrimitiveTopologyType: PRIMITIVE_TOPOLOGY_TYPE,
	NumRenderTargets: u32,
	RTVFormats: [8]dxgi.FORMAT,
	DSVFormat: dxgi.FORMAT,
	SampleDesc: dxgi.SAMPLE_DESC,
	NodeMask: u32,
	CachedPSO: CACHED_PIPELINE_STATE,
	Flags: PIPELINE_STATE_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_graphics_states ]]
GRAPHICS_STATES :: distinct bit_set[enum {
	IA_VERTEX_BUFFERS = 0,
	IA_INDEX_BUFFER = 1,
	IA_PRIMITIVE_TOPOLOGY = 2,
	DESCRIPTOR_HEAP = 3,
	GRAPHICS_ROOT_SIGNATURE = 4,
	COMPUTE_ROOT_SIGNATURE = 5,
	RS_VIEWPORTS = 6,
	RS_SCISSOR_RECTS = 7,
	PREDICATION = 8,
	OM_RENDER_TARGETS = 9,
	OM_STENCIL_REF = 10,
	OM_BLEND_FACTOR = 11,
	PIPELINE_STATE = 12,
	SO_TARGETS = 13,
	OM_DEPTH_BOUNDS = 14,
	SAMPLE_POSITIONS = 15,
	VIEW_INSTANCE_MASK = 16,
}; i32]
GRAPHICS_STATES_NONE :: transmute(GRAPHICS_STATES)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_heap_desc ]]
HEAP_DESC :: struct {
	SizeInBytes: u64,
	Properties: HEAP_PROPERTIES,
	Alignment: u64,
	Flags: HEAP_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_flags ]]
HEAP_FLAGS :: distinct bit_set[enum {
	SHARED = 0,
	DENY_BUFFERS = 2,
	ALLOW_DISPLAY = 3,
	SHARED_CROSS_ADAPTER = 5,
	DENY_RT_DS_TEXTURES = 6,
	DENY_NON_RT_DS_TEXTURES = 7,
	HARDWARE_PROTECTED = 8,
	ALLOW_WRITE_WATCH = 9,
	ALLOW_SHADER_ATOMICS = 10,
	CREATE_NOT_RESIDENT = 11,
	CREATE_NOT_ZEROED = 12,
	TOOLS_USE_MANUAL_WRITE_TRACKING = 13,
}; i32]
HEAP_FLAGS_NONE :: transmute(HEAP_FLAGS)i32(0)
HEAP_FLAGS_ALLOW_ALL_BUFFERS_AND_TEXTURES :: transmute(HEAP_FLAGS)i32(0)
HEAP_FLAGS_ALLOW_ONLY_BUFFERS :: transmute(HEAP_FLAGS)i32(192)
HEAP_FLAGS_ALLOW_ONLY_NON_RT_DS_TEXTURES :: transmute(HEAP_FLAGS)i32(68)
HEAP_FLAGS_ALLOW_ONLY_RT_DS_TEXTURES :: transmute(HEAP_FLAGS)i32(132)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_heap_properties ]]
HEAP_PROPERTIES :: struct {
	Type: HEAP_TYPE,
	CPUPageProperty: CPU_PAGE_PROPERTY,
	MemoryPoolPreference: MEMORY_POOL,
	CreationNodeMask: u32,
	VisibleNodeMask: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_serialization_tier ]]
HEAP_SERIALIZATION_TIER :: enum i32 {
	_0 = 0,
	_10 = 10,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_heap_type ]]
HEAP_TYPE :: enum i32 {
	DEFAULT = 1,
	UPLOAD = 2,
	READBACK = 3,
	CUSTOM = 4,
	GPU_UPLOAD = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_hit_group_desc ]]
HIT_GROUP_DESC :: struct {
	HitGroupExport: PWSTR,
	Type: HIT_GROUP_TYPE,
	AnyHitShaderImport: PWSTR,
	ClosestHitShaderImport: PWSTR,
	IntersectionShaderImport: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_hit_group_type ]]
HIT_GROUP_TYPE :: enum i32 {
	TRIANGLES = 0,
	PROCEDURAL_PRIMITIVE = 1,
}

HIT_KIND :: enum i32 {
	FRONT_FACE = 254,
	BACK_FACE = 255,
}

IB_STRIP_CUT_VALUE :: struct {
	IndexBufferStripCutValue: INDEX_BUFFER_STRIP_CUT_VALUE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_index_buffer_strip_cut_value ]]
INDEX_BUFFER_STRIP_CUT_VALUE :: enum i32 {
	DISABLED = 0,
	_0xFFFF = 1,
	_0xFFFFFFFF = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_index_buffer_view ]]
INDEX_BUFFER_VIEW :: struct {
	BufferLocation: u64,
	SizeInBytes: u32,
	Format: dxgi.FORMAT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_indirect_argument_desc ]]
INDIRECT_ARGUMENT_DESC :: struct {
	Type: INDIRECT_ARGUMENT_TYPE,
	using _: struct #raw_union {
		VertexBuffer: struct {
			Slot: u32,
		},
		Constant: struct {
			RootParameterIndex: u32,
			DestOffsetIn32BitValues: u32,
			Num32BitValuesToSet: u32,
		},
		ConstantBufferView: struct {
			RootParameterIndex: u32,
		},
		ShaderResourceView: struct {
			RootParameterIndex: u32,
		},
		UnorderedAccessView: struct {
			RootParameterIndex: u32,
		},
		IncrementingConstant: struct {
			RootParameterIndex: u32,
			DestOffsetIn32BitValues: u32,
		},
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_indirect_argument_type ]]
INDIRECT_ARGUMENT_TYPE :: enum i32 {
	DRAW = 0,
	DRAW_INDEXED = 1,
	DISPATCH = 2,
	VERTEX_BUFFER_VIEW = 3,
	INDEX_BUFFER_VIEW = 4,
	CONSTANT = 5,
	CONSTANT_BUFFER_VIEW = 6,
	SHADER_RESOURCE_VIEW = 7,
	UNORDERED_ACCESS_VIEW = 8,
	DISPATCH_RAYS = 9,
	DISPATCH_MESH = 10,
	INCREMENTING_CONSTANT = 11,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter ]]
INFO_QUEUE_FILTER :: struct {
	AllowList: INFO_QUEUE_FILTER_DESC,
	DenyList: INFO_QUEUE_FILTER_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_info_queue_filter_desc ]]
INFO_QUEUE_FILTER_DESC :: struct {
	NumCategories: u32,
	pCategoryList: ^MESSAGE_CATEGORY,
	NumSeverities: u32,
	pSeverityList: ^MESSAGE_SEVERITY,
	NumIDs: u32,
	pIDList: ^MESSAGE_ID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_input_classification ]]
INPUT_CLASSIFICATION :: enum i32 {
	VERTEX_DATA = 0,
	INSTANCE_DATA = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_input_element_desc ]]
INPUT_ELEMENT_DESC :: struct {
	SemanticName: PSTR,
	SemanticIndex: u32,
	Format: dxgi.FORMAT,
	InputSlot: u32,
	AlignedByteOffset: u32,
	InputSlotClass: INPUT_CLASSIFICATION,
	InstanceDataStepRate: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_input_layout_desc ]]
INPUT_LAYOUT_DESC :: struct {
	pInputElementDescs: ^INPUT_ELEMENT_DESC,
	NumElements: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_library_desc ]]
LIBRARY_DESC :: struct {
	Creator: PSTR,
	Flags: u32,
	FunctionCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_lifetime_state ]]
LIFETIME_STATE :: enum i32 {
	IN_USE = 0,
	NOT_IN_USE = 1,
}

LINE_RASTERIZATION_MODE :: enum i32 {
	ALIASED = 0,
	ALPHA_ANTIALIASED = 1,
	QUADRILATERAL_WIDE = 2,
	QUADRILATERAL_NARROW = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_local_root_signature ]]
LOCAL_ROOT_SIGNATURE :: struct {
	pLocalRootSignature: ^IRootSignature,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_logic_op ]]
LOGIC_OP :: enum i32 {
	CLEAR = 0,
	SET = 1,
	COPY = 2,
	COPY_INVERTED = 3,
	NOOP = 4,
	INVERT = 5,
	AND = 6,
	NAND = 7,
	OR = 8,
	NOR = 9,
	XOR = 10,
	EQUIV = 11,
	AND_REVERSE = 12,
	AND_INVERTED = 13,
	OR_REVERSE = 14,
	OR_INVERTED = 15,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_measurements_action ]]
MEASUREMENTS_ACTION :: enum i32 {
	KEEP_ALL = 0,
	COMMIT_RESULTS = 1,
	COMMIT_RESULTS_HIGH_PRIORITY = 2,
	DISCARD_PREVIOUS = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_memcpy_dest ]]
MEMCPY_DEST :: struct {
	pData: rawptr,
	RowPitch: uintptr,
	SlicePitch: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_memory_pool ]]
MEMORY_POOL :: enum i32 {
	UNKNOWN = 0,
	L0 = 1,
	L1 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_mesh_shader_tier ]]
MESH_SHADER_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1 = 10,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ns-d3d12sdklayers-d3d12_message ]]
MESSAGE :: struct {
	Category: MESSAGE_CATEGORY,
	Severity: MESSAGE_SEVERITY,
	ID: MESSAGE_ID,
	pDescription: ^u8,
	DescriptionByteLength: uintptr,
}

MESSAGE_CALLBACK_FLAGS :: distinct bit_set[enum {
	IGNORE_FILTERS = 0,
}; i32]
MESSAGE_CALLBACK_FLAGS_FLAG_NONE :: transmute(MESSAGE_CALLBACK_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_category ]]
MESSAGE_CATEGORY :: enum i32 {
	APPLICATION_DEFINED = 0,
	MISCELLANEOUS = 1,
	INITIALIZATION = 2,
	CLEANUP = 3,
	COMPILATION = 4,
	STATE_CREATION = 5,
	STATE_SETTING = 6,
	STATE_GETTING = 7,
	RESOURCE_MANIPULATION = 8,
	EXECUTION = 9,
	SHADER = 10,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_id ]]
MESSAGE_ID :: enum i32 {
	UNKNOWN = 0,
	STRING_FROM_APPLICATION = 1,
	CORRUPTED_THIS = 2,
	CORRUPTED_PARAMETER1 = 3,
	CORRUPTED_PARAMETER2 = 4,
	CORRUPTED_PARAMETER3 = 5,
	CORRUPTED_PARAMETER4 = 6,
	CORRUPTED_PARAMETER5 = 7,
	CORRUPTED_PARAMETER6 = 8,
	CORRUPTED_PARAMETER7 = 9,
	CORRUPTED_PARAMETER8 = 10,
	CORRUPTED_PARAMETER9 = 11,
	CORRUPTED_PARAMETER10 = 12,
	CORRUPTED_PARAMETER11 = 13,
	CORRUPTED_PARAMETER12 = 14,
	CORRUPTED_PARAMETER13 = 15,
	CORRUPTED_PARAMETER14 = 16,
	CORRUPTED_PARAMETER15 = 17,
	CORRUPTED_MULTITHREADING = 18,
	MESSAGE_REPORTING_OUTOFMEMORY = 19,
	GETPRIVATEDATA_MOREDATA = 20,
	SETPRIVATEDATA_INVALIDFREEDATA = 21,
	SETPRIVATEDATA_CHANGINGPARAMS = 24,
	SETPRIVATEDATA_OUTOFMEMORY = 25,
	CREATESHADERRESOURCEVIEW_UNRECOGNIZEDFORMAT = 26,
	CREATESHADERRESOURCEVIEW_INVALIDDESC = 27,
	CREATESHADERRESOURCEVIEW_INVALIDFORMAT = 28,
	CREATESHADERRESOURCEVIEW_INVALIDVIDEOPLANESLICE = 29,
	CREATESHADERRESOURCEVIEW_INVALIDPLANESLICE = 30,
	CREATESHADERRESOURCEVIEW_INVALIDDIMENSIONS = 31,
	CREATESHADERRESOURCEVIEW_INVALIDRESOURCE = 32,
	CREATERENDERTARGETVIEW_UNRECOGNIZEDFORMAT = 35,
	CREATERENDERTARGETVIEW_UNSUPPORTEDFORMAT = 36,
	CREATERENDERTARGETVIEW_INVALIDDESC = 37,
	CREATERENDERTARGETVIEW_INVALIDFORMAT = 38,
	CREATERENDERTARGETVIEW_INVALIDVIDEOPLANESLICE = 39,
	CREATERENDERTARGETVIEW_INVALIDPLANESLICE = 40,
	CREATERENDERTARGETVIEW_INVALIDDIMENSIONS = 41,
	CREATERENDERTARGETVIEW_INVALIDRESOURCE = 42,
	CREATEDEPTHSTENCILVIEW_UNRECOGNIZEDFORMAT = 45,
	CREATEDEPTHSTENCILVIEW_INVALIDDESC = 46,
	CREATEDEPTHSTENCILVIEW_INVALIDFORMAT = 47,
	CREATEDEPTHSTENCILVIEW_INVALIDDIMENSIONS = 48,
	CREATEDEPTHSTENCILVIEW_INVALIDRESOURCE = 49,
	CREATEINPUTLAYOUT_OUTOFMEMORY = 52,
	CREATEINPUTLAYOUT_TOOMANYELEMENTS = 53,
	CREATEINPUTLAYOUT_INVALIDFORMAT = 54,
	CREATEINPUTLAYOUT_INCOMPATIBLEFORMAT = 55,
	CREATEINPUTLAYOUT_INVALIDSLOT = 56,
	CREATEINPUTLAYOUT_INVALIDINPUTSLOTCLASS = 57,
	CREATEINPUTLAYOUT_STEPRATESLOTCLASSMISMATCH = 58,
	CREATEINPUTLAYOUT_INVALIDSLOTCLASSCHANGE = 59,
	CREATEINPUTLAYOUT_INVALIDSTEPRATECHANGE = 60,
	CREATEINPUTLAYOUT_INVALIDALIGNMENT = 61,
	CREATEINPUTLAYOUT_DUPLICATESEMANTIC = 62,
	CREATEINPUTLAYOUT_UNPARSEABLEINPUTSIGNATURE = 63,
	CREATEINPUTLAYOUT_NULLSEMANTIC = 64,
	CREATEINPUTLAYOUT_MISSINGELEMENT = 65,
	CREATEVERTEXSHADER_OUTOFMEMORY = 66,
	CREATEVERTEXSHADER_INVALIDSHADERBYTECODE = 67,
	CREATEVERTEXSHADER_INVALIDSHADERTYPE = 68,
	CREATEGEOMETRYSHADER_OUTOFMEMORY = 69,
	CREATEGEOMETRYSHADER_INVALIDSHADERBYTECODE = 70,
	CREATEGEOMETRYSHADER_INVALIDSHADERTYPE = 71,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTOFMEMORY = 72,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERBYTECODE = 73,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE = 74,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMENTRIES = 75,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSTREAMSTRIDEUNUSED = 76,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSLOT0EXPECTED = 79,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSLOT = 80,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_ONLYONEELEMENTPERSLOT = 81,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDCOMPONENTCOUNT = 82,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTARTCOMPONENTANDCOMPONENTCOUNT = 83,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDGAPDEFINITION = 84,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_REPEATEDOUTPUT = 85,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSTREAMSTRIDE = 86,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGSEMANTIC = 87,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MASKMISMATCH = 88,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_CANTHAVEONLYGAPS = 89,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DECLTOOCOMPLEX = 90,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGOUTPUTSIGNATURE = 91,
	CREATEPIXELSHADER_OUTOFMEMORY = 92,
	CREATEPIXELSHADER_INVALIDSHADERBYTECODE = 93,
	CREATEPIXELSHADER_INVALIDSHADERTYPE = 94,
	CREATERASTERIZERSTATE_INVALIDFILLMODE = 95,
	CREATERASTERIZERSTATE_INVALIDCULLMODE = 96,
	CREATERASTERIZERSTATE_INVALIDDEPTHBIASCLAMP = 97,
	CREATERASTERIZERSTATE_INVALIDSLOPESCALEDDEPTHBIAS = 98,
	CREATEDEPTHSTENCILSTATE_INVALIDDEPTHWRITEMASK = 100,
	CREATEDEPTHSTENCILSTATE_INVALIDDEPTHFUNC = 101,
	CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFAILOP = 102,
	CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILZFAILOP = 103,
	CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILPASSOP = 104,
	CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFUNC = 105,
	CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFAILOP = 106,
	CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILZFAILOP = 107,
	CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILPASSOP = 108,
	CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFUNC = 109,
	CREATEBLENDSTATE_INVALIDSRCBLEND = 111,
	CREATEBLENDSTATE_INVALIDDESTBLEND = 112,
	CREATEBLENDSTATE_INVALIDBLENDOP = 113,
	CREATEBLENDSTATE_INVALIDSRCBLENDALPHA = 114,
	CREATEBLENDSTATE_INVALIDDESTBLENDALPHA = 115,
	CREATEBLENDSTATE_INVALIDBLENDOPALPHA = 116,
	CREATEBLENDSTATE_INVALIDRENDERTARGETWRITEMASK = 117,
	GET_PROGRAM_IDENTIFIER_ERROR = 118,
	GET_WORK_GRAPH_PROPERTIES_ERROR = 119,
	SET_PROGRAM_ERROR = 120,
	CLEARDEPTHSTENCILVIEW_INVALID = 135,
	COMMAND_LIST_DRAW_ROOT_SIGNATURE_NOT_SET = 200,
	COMMAND_LIST_DRAW_ROOT_SIGNATURE_MISMATCH = 201,
	COMMAND_LIST_DRAW_VERTEX_BUFFER_NOT_SET = 202,
	COMMAND_LIST_DRAW_VERTEX_BUFFER_STRIDE_TOO_SMALL = 209,
	COMMAND_LIST_DRAW_VERTEX_BUFFER_TOO_SMALL = 210,
	COMMAND_LIST_DRAW_INDEX_BUFFER_NOT_SET = 211,
	COMMAND_LIST_DRAW_INDEX_BUFFER_FORMAT_INVALID = 212,
	COMMAND_LIST_DRAW_INDEX_BUFFER_TOO_SMALL = 213,
	COMMAND_LIST_DRAW_INVALID_PRIMITIVETOPOLOGY = 219,
	COMMAND_LIST_DRAW_VERTEX_STRIDE_UNALIGNED = 221,
	COMMAND_LIST_DRAW_INDEX_OFFSET_UNALIGNED = 222,
	DEVICE_REMOVAL_PROCESS_AT_FAULT = 232,
	DEVICE_REMOVAL_PROCESS_POSSIBLY_AT_FAULT = 233,
	DEVICE_REMOVAL_PROCESS_NOT_AT_FAULT = 234,
	CREATEINPUTLAYOUT_TRAILING_DIGIT_IN_SEMANTIC = 239,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_TRAILING_DIGIT_IN_SEMANTIC = 240,
	CREATEINPUTLAYOUT_TYPE_MISMATCH = 245,
	CREATEINPUTLAYOUT_EMPTY_LAYOUT = 253,
	LIVE_OBJECT_SUMMARY = 255,
	LIVE_DEVICE = 274,
	LIVE_SWAPCHAIN = 275,
	CREATEDEPTHSTENCILVIEW_INVALIDFLAGS = 276,
	CREATEVERTEXSHADER_INVALIDCLASSLINKAGE = 277,
	CREATEGEOMETRYSHADER_INVALIDCLASSLINKAGE = 278,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAMTORASTERIZER = 280,
	CREATEPIXELSHADER_INVALIDCLASSLINKAGE = 283,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAM = 284,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDENTRIES = 285,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDSTRIDES = 286,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMSTRIDES = 287,
	CREATEHULLSHADER_OUTOFMEMORY = 289,
	CREATEHULLSHADER_INVALIDSHADERBYTECODE = 290,
	CREATEHULLSHADER_INVALIDSHADERTYPE = 291,
	CREATEHULLSHADER_INVALIDCLASSLINKAGE = 292,
	CREATEDOMAINSHADER_OUTOFMEMORY = 294,
	CREATEDOMAINSHADER_INVALIDSHADERBYTECODE = 295,
	CREATEDOMAINSHADER_INVALIDSHADERTYPE = 296,
	CREATEDOMAINSHADER_INVALIDCLASSLINKAGE = 297,
	RESOURCE_UNMAP_NOTMAPPED = 310,
	DEVICE_CHECKFEATURESUPPORT_MISMATCHED_DATA_SIZE = 318,
	CREATECOMPUTESHADER_OUTOFMEMORY = 321,
	CREATECOMPUTESHADER_INVALIDSHADERBYTECODE = 322,
	CREATECOMPUTESHADER_INVALIDCLASSLINKAGE = 323,
	DEVICE_CREATEVERTEXSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 331,
	DEVICE_CREATEHULLSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 332,
	DEVICE_CREATEDOMAINSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 333,
	DEVICE_CREATEGEOMETRYSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 334,
	DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEFLOATOPSNOTSUPPORTED = 335,
	DEVICE_CREATEPIXELSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 336,
	DEVICE_CREATECOMPUTESHADER_DOUBLEFLOATOPSNOTSUPPORTED = 337,
	CREATEUNORDEREDACCESSVIEW_INVALIDRESOURCE = 340,
	CREATEUNORDEREDACCESSVIEW_INVALIDDESC = 341,
	CREATEUNORDEREDACCESSVIEW_INVALIDFORMAT = 342,
	CREATEUNORDEREDACCESSVIEW_INVALIDVIDEOPLANESLICE = 343,
	CREATEUNORDEREDACCESSVIEW_INVALIDPLANESLICE = 344,
	CREATEUNORDEREDACCESSVIEW_INVALIDDIMENSIONS = 345,
	CREATEUNORDEREDACCESSVIEW_UNRECOGNIZEDFORMAT = 346,
	CREATEUNORDEREDACCESSVIEW_INVALIDFLAGS = 354,
	CREATERASTERIZERSTATE_INVALIDFORCEDSAMPLECOUNT = 401,
	CREATEBLENDSTATE_INVALIDLOGICOPS = 403,
	DEVICE_CREATEVERTEXSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 410,
	DEVICE_CREATEHULLSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 412,
	DEVICE_CREATEDOMAINSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 414,
	DEVICE_CREATEGEOMETRYSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 416,
	DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEEXTENSIONSNOTSUPPORTED = 418,
	DEVICE_CREATEPIXELSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 420,
	DEVICE_CREATECOMPUTESHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 422,
	DEVICE_CREATEVERTEXSHADER_UAVSNOTSUPPORTED = 425,
	DEVICE_CREATEHULLSHADER_UAVSNOTSUPPORTED = 426,
	DEVICE_CREATEDOMAINSHADER_UAVSNOTSUPPORTED = 427,
	DEVICE_CREATEGEOMETRYSHADER_UAVSNOTSUPPORTED = 428,
	DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UAVSNOTSUPPORTED = 429,
	DEVICE_CREATEPIXELSHADER_UAVSNOTSUPPORTED = 430,
	DEVICE_CREATECOMPUTESHADER_UAVSNOTSUPPORTED = 431,
	DEVICE_CLEARVIEW_INVALIDSOURCERECT = 447,
	DEVICE_CLEARVIEW_EMPTYRECT = 448,
	UPDATETILEMAPPINGS_INVALID_PARAMETER = 493,
	COPYTILEMAPPINGS_INVALID_PARAMETER = 494,
	CREATEDEVICE_INVALIDARGS = 506,
	CREATEDEVICE_WARNING = 507,
	RESOURCE_BARRIER_INVALID_TYPE = 519,
	RESOURCE_BARRIER_NULL_POINTER = 520,
	RESOURCE_BARRIER_INVALID_SUBRESOURCE = 521,
	RESOURCE_BARRIER_RESERVED_BITS = 522,
	RESOURCE_BARRIER_MISSING_BIND_FLAGS = 523,
	RESOURCE_BARRIER_MISMATCHING_MISC_FLAGS = 524,
	RESOURCE_BARRIER_MATCHING_STATES = 525,
	RESOURCE_BARRIER_INVALID_COMBINATION = 526,
	RESOURCE_BARRIER_BEFORE_AFTER_MISMATCH = 527,
	RESOURCE_BARRIER_INVALID_RESOURCE = 528,
	RESOURCE_BARRIER_SAMPLE_COUNT = 529,
	RESOURCE_BARRIER_INVALID_FLAGS = 530,
	RESOURCE_BARRIER_INVALID_COMBINED_FLAGS = 531,
	RESOURCE_BARRIER_INVALID_FLAGS_FOR_FORMAT = 532,
	RESOURCE_BARRIER_INVALID_SPLIT_BARRIER = 533,
	RESOURCE_BARRIER_UNMATCHED_END = 534,
	RESOURCE_BARRIER_UNMATCHED_BEGIN = 535,
	RESOURCE_BARRIER_INVALID_FLAG = 536,
	RESOURCE_BARRIER_INVALID_COMMAND_LIST_TYPE = 537,
	INVALID_SUBRESOURCE_STATE = 538,
	COMMAND_ALLOCATOR_CONTENTION = 540,
	COMMAND_ALLOCATOR_RESET = 541,
	COMMAND_ALLOCATOR_RESET_BUNDLE = 542,
	COMMAND_ALLOCATOR_CANNOT_RESET = 543,
	COMMAND_LIST_OPEN = 544,
	INVALID_BUNDLE_API = 546,
	COMMAND_LIST_CLOSED = 547,
	WRONG_COMMAND_ALLOCATOR_TYPE = 549,
	COMMAND_ALLOCATOR_SYNC = 552,
	COMMAND_LIST_SYNC = 553,
	SET_DESCRIPTOR_HEAP_INVALID = 554,
	CREATE_COMMANDQUEUE = 557,
	CREATE_COMMANDALLOCATOR = 558,
	CREATE_PIPELINESTATE = 559,
	CREATE_COMMANDLIST12 = 560,
	CREATE_RESOURCE = 562,
	CREATE_DESCRIPTORHEAP = 563,
	CREATE_ROOTSIGNATURE = 564,
	CREATE_LIBRARY = 565,
	CREATE_HEAP = 566,
	CREATE_MONITOREDFENCE = 567,
	CREATE_QUERYHEAP = 568,
	CREATE_COMMANDSIGNATURE = 569,
	LIVE_COMMANDQUEUE = 570,
	LIVE_COMMANDALLOCATOR = 571,
	LIVE_PIPELINESTATE = 572,
	LIVE_COMMANDLIST12 = 573,
	LIVE_RESOURCE = 575,
	LIVE_DESCRIPTORHEAP = 576,
	LIVE_ROOTSIGNATURE = 577,
	LIVE_LIBRARY = 578,
	LIVE_HEAP = 579,
	LIVE_MONITOREDFENCE = 580,
	LIVE_QUERYHEAP = 581,
	LIVE_COMMANDSIGNATURE = 582,
	DESTROY_COMMANDQUEUE = 583,
	DESTROY_COMMANDALLOCATOR = 584,
	DESTROY_PIPELINESTATE = 585,
	DESTROY_COMMANDLIST12 = 586,
	DESTROY_RESOURCE = 588,
	DESTROY_DESCRIPTORHEAP = 589,
	DESTROY_ROOTSIGNATURE = 590,
	DESTROY_LIBRARY = 591,
	DESTROY_HEAP = 592,
	DESTROY_MONITOREDFENCE = 593,
	DESTROY_QUERYHEAP = 594,
	DESTROY_COMMANDSIGNATURE = 595,
	CREATERESOURCE_INVALIDDIMENSIONS = 597,
	CREATERESOURCE_INVALIDMISCFLAGS = 599,
	CREATERESOURCE_INVALIDARG_RETURN = 602,
	CREATERESOURCE_OUTOFMEMORY_RETURN = 603,
	CREATERESOURCE_INVALIDDESC = 604,
	POSSIBLY_INVALID_SUBRESOURCE_STATE = 607,
	INVALID_USE_OF_NON_RESIDENT_RESOURCE = 608,
	POSSIBLE_INVALID_USE_OF_NON_RESIDENT_RESOURCE = 609,
	BUNDLE_PIPELINE_STATE_MISMATCH = 610,
	PRIMITIVE_TOPOLOGY_MISMATCH_PIPELINE_STATE = 611,
	RENDER_TARGET_FORMAT_MISMATCH_PIPELINE_STATE = 613,
	RENDER_TARGET_SAMPLE_DESC_MISMATCH_PIPELINE_STATE = 614,
	DEPTH_STENCIL_FORMAT_MISMATCH_PIPELINE_STATE = 615,
	DEPTH_STENCIL_SAMPLE_DESC_MISMATCH_PIPELINE_STATE = 616,
	CREATESHADER_INVALIDBYTECODE = 622,
	CREATEHEAP_NULLDESC = 623,
	CREATEHEAP_INVALIDSIZE = 624,
	CREATEHEAP_UNRECOGNIZEDHEAPTYPE = 625,
	CREATEHEAP_UNRECOGNIZEDCPUPAGEPROPERTIES = 626,
	CREATEHEAP_UNRECOGNIZEDMEMORYPOOL = 627,
	CREATEHEAP_INVALIDPROPERTIES = 628,
	CREATEHEAP_INVALIDALIGNMENT = 629,
	CREATEHEAP_UNRECOGNIZEDMISCFLAGS = 630,
	CREATEHEAP_INVALIDMISCFLAGS = 631,
	CREATEHEAP_INVALIDARG_RETURN = 632,
	CREATEHEAP_OUTOFMEMORY_RETURN = 633,
	CREATERESOURCEANDHEAP_NULLHEAPPROPERTIES = 634,
	CREATERESOURCEANDHEAP_UNRECOGNIZEDHEAPTYPE = 635,
	CREATERESOURCEANDHEAP_UNRECOGNIZEDCPUPAGEPROPERTIES = 636,
	CREATERESOURCEANDHEAP_UNRECOGNIZEDMEMORYPOOL = 637,
	CREATERESOURCEANDHEAP_INVALIDHEAPPROPERTIES = 638,
	CREATERESOURCEANDHEAP_UNRECOGNIZEDHEAPMISCFLAGS = 639,
	CREATERESOURCEANDHEAP_INVALIDHEAPMISCFLAGS = 640,
	CREATERESOURCEANDHEAP_INVALIDARG_RETURN = 641,
	CREATERESOURCEANDHEAP_OUTOFMEMORY_RETURN = 642,
	GETCUSTOMHEAPPROPERTIES_UNRECOGNIZEDHEAPTYPE = 643,
	GETCUSTOMHEAPPROPERTIES_INVALIDHEAPTYPE = 644,
	CREATE_DESCRIPTOR_HEAP_INVALID_DESC = 645,
	INVALID_DESCRIPTOR_HANDLE = 646,
	CREATERASTERIZERSTATE_INVALID_CONSERVATIVERASTERMODE = 647,
	CREATE_CONSTANT_BUFFER_VIEW_INVALID_RESOURCE = 649,
	CREATE_CONSTANT_BUFFER_VIEW_INVALID_DESC = 650,
	CREATE_UNORDEREDACCESS_VIEW_INVALID_COUNTER_USAGE = 652,
	COPY_DESCRIPTORS_INVALID_RANGES = 653,
	COPY_DESCRIPTORS_WRITE_ONLY_DESCRIPTOR = 654,
	CREATEGRAPHICSPIPELINESTATE_RTV_FORMAT_NOT_UNKNOWN = 655,
	CREATEGRAPHICSPIPELINESTATE_INVALID_RENDER_TARGET_COUNT = 656,
	CREATEGRAPHICSPIPELINESTATE_VERTEX_SHADER_NOT_SET = 657,
	CREATEGRAPHICSPIPELINESTATE_INPUTLAYOUT_NOT_SET = 658,
	CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_HS_DS_SIGNATURE_MISMATCH = 659,
	CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_REGISTERINDEX = 660,
	CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_COMPONENTTYPE = 661,
	CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_REGISTERMASK = 662,
	CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_SYSTEMVALUE = 663,
	CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_NEVERWRITTEN_ALWAYSREADS = 664,
	CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_MINPRECISION = 665,
	CREATEGRAPHICSPIPELINESTATE_SHADER_LINKAGE_SEMANTICNAME_NOT_FOUND = 666,
	CREATEGRAPHICSPIPELINESTATE_HS_XOR_DS_MISMATCH = 667,
	CREATEGRAPHICSPIPELINESTATE_HULL_SHADER_INPUT_TOPOLOGY_MISMATCH = 668,
	CREATEGRAPHICSPIPELINESTATE_HS_DS_CONTROL_POINT_COUNT_MISMATCH = 669,
	CREATEGRAPHICSPIPELINESTATE_HS_DS_TESSELLATOR_DOMAIN_MISMATCH = 670,
	CREATEGRAPHICSPIPELINESTATE_INVALID_USE_OF_CENTER_MULTISAMPLE_PATTERN = 671,
	CREATEGRAPHICSPIPELINESTATE_INVALID_USE_OF_FORCED_SAMPLE_COUNT = 672,
	CREATEGRAPHICSPIPELINESTATE_INVALID_PRIMITIVETOPOLOGY = 673,
	CREATEGRAPHICSPIPELINESTATE_INVALID_SYSTEMVALUE = 674,
	CREATEGRAPHICSPIPELINESTATE_OM_DUAL_SOURCE_BLENDING_CAN_ONLY_HAVE_RENDER_TARGET_0 = 675,
	CREATEGRAPHICSPIPELINESTATE_OM_RENDER_TARGET_DOES_NOT_SUPPORT_BLENDING = 676,
	CREATEGRAPHICSPIPELINESTATE_PS_OUTPUT_TYPE_MISMATCH = 677,
	CREATEGRAPHICSPIPELINESTATE_OM_RENDER_TARGET_DOES_NOT_SUPPORT_LOGIC_OPS = 678,
	CREATEGRAPHICSPIPELINESTATE_RENDERTARGETVIEW_NOT_SET = 679,
	CREATEGRAPHICSPIPELINESTATE_DEPTHSTENCILVIEW_NOT_SET = 680,
	CREATEGRAPHICSPIPELINESTATE_GS_INPUT_PRIMITIVE_MISMATCH = 681,
	CREATEGRAPHICSPIPELINESTATE_POSITION_NOT_PRESENT = 682,
	CREATEGRAPHICSPIPELINESTATE_MISSING_ROOT_SIGNATURE_FLAGS = 683,
	CREATEGRAPHICSPIPELINESTATE_INVALID_INDEX_BUFFER_PROPERTIES = 684,
	CREATEGRAPHICSPIPELINESTATE_INVALID_SAMPLE_DESC = 685,
	CREATEGRAPHICSPIPELINESTATE_HS_ROOT_SIGNATURE_MISMATCH = 686,
	CREATEGRAPHICSPIPELINESTATE_DS_ROOT_SIGNATURE_MISMATCH = 687,
	CREATEGRAPHICSPIPELINESTATE_VS_ROOT_SIGNATURE_MISMATCH = 688,
	CREATEGRAPHICSPIPELINESTATE_GS_ROOT_SIGNATURE_MISMATCH = 689,
	CREATEGRAPHICSPIPELINESTATE_PS_ROOT_SIGNATURE_MISMATCH = 690,
	CREATEGRAPHICSPIPELINESTATE_MISSING_ROOT_SIGNATURE = 691,
	EXECUTE_BUNDLE_OPEN_BUNDLE = 692,
	EXECUTE_BUNDLE_DESCRIPTOR_HEAP_MISMATCH = 693,
	EXECUTE_BUNDLE_TYPE = 694,
	DRAW_EMPTY_SCISSOR_RECTANGLE = 695,
	CREATE_ROOT_SIGNATURE_BLOB_NOT_FOUND = 696,
	CREATE_ROOT_SIGNATURE_DESERIALIZE_FAILED = 697,
	CREATE_ROOT_SIGNATURE_INVALID_CONFIGURATION = 698,
	CREATE_ROOT_SIGNATURE_NOT_SUPPORTED_ON_DEVICE = 699,
	CREATERESOURCEANDHEAP_NULLRESOURCEPROPERTIES = 700,
	CREATERESOURCEANDHEAP_NULLHEAP = 701,
	GETRESOURCEALLOCATIONINFO_INVALIDRDESCS = 702,
	MAKERESIDENT_NULLOBJECTARRAY = 703,
	EVICT_NULLOBJECTARRAY = 705,
	SET_DESCRIPTOR_TABLE_INVALID = 708,
	SET_ROOT_CONSTANT_INVALID = 709,
	SET_ROOT_CONSTANT_BUFFER_VIEW_INVALID = 710,
	SET_ROOT_SHADER_RESOURCE_VIEW_INVALID = 711,
	SET_ROOT_UNORDERED_ACCESS_VIEW_INVALID = 712,
	SET_VERTEX_BUFFERS_INVALID_DESC = 713,
	SET_INDEX_BUFFER_INVALID_DESC = 715,
	SET_STREAM_OUTPUT_BUFFERS_INVALID_DESC = 717,
	CREATERESOURCE_UNRECOGNIZEDDIMENSIONALITY = 718,
	CREATERESOURCE_UNRECOGNIZEDLAYOUT = 719,
	CREATERESOURCE_INVALIDDIMENSIONALITY = 720,
	CREATERESOURCE_INVALIDALIGNMENT = 721,
	CREATERESOURCE_INVALIDMIPLEVELS = 722,
	CREATERESOURCE_INVALIDSAMPLEDESC = 723,
	CREATERESOURCE_INVALIDLAYOUT = 724,
	SET_INDEX_BUFFER_INVALID = 725,
	SET_VERTEX_BUFFERS_INVALID = 726,
	SET_STREAM_OUTPUT_BUFFERS_INVALID = 727,
	SET_RENDER_TARGETS_INVALID = 728,
	CREATEQUERY_HEAP_INVALID_PARAMETERS = 729,
	BEGIN_END_QUERY_INVALID_PARAMETERS = 731,
	CLOSE_COMMAND_LIST_OPEN_QUERY = 732,
	RESOLVE_QUERY_DATA_INVALID_PARAMETERS = 733,
	SET_PREDICATION_INVALID_PARAMETERS = 734,
	TIMESTAMPS_NOT_SUPPORTED = 735,
	CREATERESOURCE_UNRECOGNIZEDFORMAT = 737,
	CREATERESOURCE_INVALIDFORMAT = 738,
	GETCOPYABLEFOOTPRINTS_INVALIDSUBRESOURCERANGE = 739,
	GETCOPYABLEFOOTPRINTS_INVALIDBASEOFFSET = 740,
	GETCOPYABLELAYOUT_INVALIDSUBRESOURCERANGE = 739,
	GETCOPYABLELAYOUT_INVALIDBASEOFFSET = 740,
	RESOURCE_BARRIER_INVALID_HEAP = 741,
	CREATE_SAMPLER_INVALID = 742,
	CREATECOMMANDSIGNATURE_INVALID = 743,
	EXECUTE_INDIRECT_INVALID_PARAMETERS = 744,
	GETGPUVIRTUALADDRESS_INVALID_RESOURCE_DIMENSION = 745,
	CREATERESOURCE_INVALIDCLEARVALUE = 815,
	CREATERESOURCE_UNRECOGNIZEDCLEARVALUEFORMAT = 816,
	CREATERESOURCE_INVALIDCLEARVALUEFORMAT = 817,
	CREATERESOURCE_CLEARVALUEDENORMFLUSH = 818,
	CLEARRENDERTARGETVIEW_MISMATCHINGCLEARVALUE = 820,
	CLEARDEPTHSTENCILVIEW_MISMATCHINGCLEARVALUE = 821,
	MAP_INVALIDHEAP = 822,
	UNMAP_INVALIDHEAP = 823,
	MAP_INVALIDRESOURCE = 824,
	UNMAP_INVALIDRESOURCE = 825,
	MAP_INVALIDSUBRESOURCE = 826,
	UNMAP_INVALIDSUBRESOURCE = 827,
	MAP_INVALIDRANGE = 828,
	UNMAP_INVALIDRANGE = 829,
	MAP_INVALIDDATAPOINTER = 832,
	MAP_INVALIDARG_RETURN = 833,
	MAP_OUTOFMEMORY_RETURN = 834,
	EXECUTECOMMANDLISTS_BUNDLENOTSUPPORTED = 835,
	EXECUTECOMMANDLISTS_COMMANDLISTMISMATCH = 836,
	EXECUTECOMMANDLISTS_OPENCOMMANDLIST = 837,
	EXECUTECOMMANDLISTS_FAILEDCOMMANDLIST = 838,
	COPYBUFFERREGION_NULLDST = 839,
	COPYBUFFERREGION_INVALIDDSTRESOURCEDIMENSION = 840,
	COPYBUFFERREGION_DSTRANGEOUTOFBOUNDS = 841,
	COPYBUFFERREGION_NULLSRC = 842,
	COPYBUFFERREGION_INVALIDSRCRESOURCEDIMENSION = 843,
	COPYBUFFERREGION_SRCRANGEOUTOFBOUNDS = 844,
	COPYBUFFERREGION_INVALIDCOPYFLAGS = 845,
	COPYTEXTUREREGION_NULLDST = 846,
	COPYTEXTUREREGION_UNRECOGNIZEDDSTTYPE = 847,
	COPYTEXTUREREGION_INVALIDDSTRESOURCEDIMENSION = 848,
	COPYTEXTUREREGION_INVALIDDSTRESOURCE = 849,
	COPYTEXTUREREGION_INVALIDDSTSUBRESOURCE = 850,
	COPYTEXTUREREGION_INVALIDDSTOFFSET = 851,
	COPYTEXTUREREGION_UNRECOGNIZEDDSTFORMAT = 852,
	COPYTEXTUREREGION_INVALIDDSTFORMAT = 853,
	COPYTEXTUREREGION_INVALIDDSTDIMENSIONS = 854,
	COPYTEXTUREREGION_INVALIDDSTROWPITCH = 855,
	COPYTEXTUREREGION_INVALIDDSTPLACEMENT = 856,
	COPYTEXTUREREGION_INVALIDDSTDSPLACEDFOOTPRINTFORMAT = 857,
	COPYTEXTUREREGION_DSTREGIONOUTOFBOUNDS = 858,
	COPYTEXTUREREGION_NULLSRC = 859,
	COPYTEXTUREREGION_UNRECOGNIZEDSRCTYPE = 860,
	COPYTEXTUREREGION_INVALIDSRCRESOURCEDIMENSION = 861,
	COPYTEXTUREREGION_INVALIDSRCRESOURCE = 862,
	COPYTEXTUREREGION_INVALIDSRCSUBRESOURCE = 863,
	COPYTEXTUREREGION_INVALIDSRCOFFSET = 864,
	COPYTEXTUREREGION_UNRECOGNIZEDSRCFORMAT = 865,
	COPYTEXTUREREGION_INVALIDSRCFORMAT = 866,
	COPYTEXTUREREGION_INVALIDSRCDIMENSIONS = 867,
	COPYTEXTUREREGION_INVALIDSRCROWPITCH = 868,
	COPYTEXTUREREGION_INVALIDSRCPLACEMENT = 869,
	COPYTEXTUREREGION_INVALIDSRCDSPLACEDFOOTPRINTFORMAT = 870,
	COPYTEXTUREREGION_SRCREGIONOUTOFBOUNDS = 871,
	COPYTEXTUREREGION_INVALIDDSTCOORDINATES = 872,
	COPYTEXTUREREGION_INVALIDSRCBOX = 873,
	COPYTEXTUREREGION_FORMATMISMATCH = 874,
	COPYTEXTUREREGION_EMPTYBOX = 875,
	COPYTEXTUREREGION_INVALIDCOPYFLAGS = 876,
	RESOLVESUBRESOURCE_INVALID_SUBRESOURCE_INDEX = 877,
	RESOLVESUBRESOURCE_INVALID_FORMAT = 878,
	RESOLVESUBRESOURCE_RESOURCE_MISMATCH = 879,
	RESOLVESUBRESOURCE_INVALID_SAMPLE_COUNT = 880,
	CREATECOMPUTEPIPELINESTATE_INVALID_SHADER = 881,
	CREATECOMPUTEPIPELINESTATE_CS_ROOT_SIGNATURE_MISMATCH = 882,
	CREATECOMPUTEPIPELINESTATE_MISSING_ROOT_SIGNATURE = 883,
	CREATEPIPELINESTATE_INVALIDCACHEDBLOB = 884,
	CREATEPIPELINESTATE_CACHEDBLOBADAPTERMISMATCH = 885,
	CREATEPIPELINESTATE_CACHEDBLOBDRIVERVERSIONMISMATCH = 886,
	CREATEPIPELINESTATE_CACHEDBLOBDESCMISMATCH = 887,
	CREATEPIPELINESTATE_CACHEDBLOBIGNORED = 888,
	WRITETOSUBRESOURCE_INVALIDHEAP = 889,
	WRITETOSUBRESOURCE_INVALIDRESOURCE = 890,
	WRITETOSUBRESOURCE_INVALIDBOX = 891,
	WRITETOSUBRESOURCE_INVALIDSUBRESOURCE = 892,
	WRITETOSUBRESOURCE_EMPTYBOX = 893,
	READFROMSUBRESOURCE_INVALIDHEAP = 894,
	READFROMSUBRESOURCE_INVALIDRESOURCE = 895,
	READFROMSUBRESOURCE_INVALIDBOX = 896,
	READFROMSUBRESOURCE_INVALIDSUBRESOURCE = 897,
	READFROMSUBRESOURCE_EMPTYBOX = 898,
	TOO_MANY_NODES_SPECIFIED = 899,
	INVALID_NODE_INDEX = 900,
	GETHEAPPROPERTIES_INVALIDRESOURCE = 901,
	NODE_MASK_MISMATCH = 902,
	COMMAND_LIST_OUTOFMEMORY = 903,
	COMMAND_LIST_MULTIPLE_SWAPCHAIN_BUFFER_REFERENCES = 904,
	COMMAND_LIST_TOO_MANY_SWAPCHAIN_REFERENCES = 905,
	COMMAND_QUEUE_TOO_MANY_SWAPCHAIN_REFERENCES = 906,
	EXECUTECOMMANDLISTS_WRONGSWAPCHAINBUFFERREFERENCE = 907,
	COMMAND_LIST_SETRENDERTARGETS_INVALIDNUMRENDERTARGETS = 908,
	CREATE_QUEUE_INVALID_TYPE = 909,
	CREATE_QUEUE_INVALID_FLAGS = 910,
	CREATESHAREDRESOURCE_INVALIDFLAGS = 911,
	CREATESHAREDRESOURCE_INVALIDFORMAT = 912,
	CREATESHAREDHEAP_INVALIDFLAGS = 913,
	REFLECTSHAREDPROPERTIES_UNRECOGNIZEDPROPERTIES = 914,
	REFLECTSHAREDPROPERTIES_INVALIDSIZE = 915,
	REFLECTSHAREDPROPERTIES_INVALIDOBJECT = 916,
	KEYEDMUTEX_INVALIDOBJECT = 917,
	KEYEDMUTEX_INVALIDKEY = 918,
	KEYEDMUTEX_WRONGSTATE = 919,
	CREATE_QUEUE_INVALID_PRIORITY = 920,
	OBJECT_DELETED_WHILE_STILL_IN_USE = 921,
	CREATEPIPELINESTATE_INVALID_FLAGS = 922,
	HEAP_ADDRESS_RANGE_HAS_NO_RESOURCE = 923,
	COMMAND_LIST_DRAW_RENDER_TARGET_DELETED = 924,
	CREATEGRAPHICSPIPELINESTATE_ALL_RENDER_TARGETS_HAVE_UNKNOWN_FORMAT = 925,
	HEAP_ADDRESS_RANGE_INTERSECTS_MULTIPLE_BUFFERS = 926,
	EXECUTECOMMANDLISTS_GPU_WRITTEN_READBACK_RESOURCE_MAPPED = 927,
	UNMAP_RANGE_NOT_EMPTY = 929,
	MAP_INVALID_NULLRANGE = 930,
	UNMAP_INVALID_NULLRANGE = 931,
	NO_GRAPHICS_API_SUPPORT = 932,
	NO_COMPUTE_API_SUPPORT = 933,
	RESOLVESUBRESOURCE_RESOURCE_FLAGS_NOT_SUPPORTED = 934,
	GPU_BASED_VALIDATION_ROOT_ARGUMENT_UNINITIALIZED = 935,
	GPU_BASED_VALIDATION_DESCRIPTOR_HEAP_INDEX_OUT_OF_BOUNDS = 936,
	GPU_BASED_VALIDATION_DESCRIPTOR_TABLE_REGISTER_INDEX_OUT_OF_BOUNDS = 937,
	GPU_BASED_VALIDATION_DESCRIPTOR_UNINITIALIZED = 938,
	GPU_BASED_VALIDATION_DESCRIPTOR_TYPE_MISMATCH = 939,
	GPU_BASED_VALIDATION_SRV_RESOURCE_DIMENSION_MISMATCH = 940,
	GPU_BASED_VALIDATION_UAV_RESOURCE_DIMENSION_MISMATCH = 941,
	GPU_BASED_VALIDATION_INCOMPATIBLE_RESOURCE_STATE = 942,
	COPYRESOURCE_NULLDST = 943,
	COPYRESOURCE_INVALIDDSTRESOURCE = 944,
	COPYRESOURCE_NULLSRC = 945,
	COPYRESOURCE_INVALIDSRCRESOURCE = 946,
	RESOLVESUBRESOURCE_NULLDST = 947,
	RESOLVESUBRESOURCE_INVALIDDSTRESOURCE = 948,
	RESOLVESUBRESOURCE_NULLSRC = 949,
	RESOLVESUBRESOURCE_INVALIDSRCRESOURCE = 950,
	PIPELINE_STATE_TYPE_MISMATCH = 951,
	COMMAND_LIST_DISPATCH_ROOT_SIGNATURE_NOT_SET = 952,
	COMMAND_LIST_DISPATCH_ROOT_SIGNATURE_MISMATCH = 953,
	RESOURCE_BARRIER_ZERO_BARRIERS = 954,
	BEGIN_END_EVENT_MISMATCH = 955,
	RESOURCE_BARRIER_POSSIBLE_BEFORE_AFTER_MISMATCH = 956,
	RESOURCE_BARRIER_MISMATCHING_BEGIN_END = 957,
	GPU_BASED_VALIDATION_INVALID_RESOURCE = 958,
	USE_OF_ZERO_REFCOUNT_OBJECT = 959,
	OBJECT_EVICTED_WHILE_STILL_IN_USE = 960,
	GPU_BASED_VALIDATION_ROOT_DESCRIPTOR_ACCESS_OUT_OF_BOUNDS = 961,
	CREATEPIPELINELIBRARY_INVALIDLIBRARYBLOB = 962,
	CREATEPIPELINELIBRARY_DRIVERVERSIONMISMATCH = 963,
	CREATEPIPELINELIBRARY_ADAPTERVERSIONMISMATCH = 964,
	CREATEPIPELINELIBRARY_UNSUPPORTED = 965,
	CREATE_PIPELINELIBRARY = 966,
	LIVE_PIPELINELIBRARY = 967,
	DESTROY_PIPELINELIBRARY = 968,
	STOREPIPELINE_NONAME = 969,
	STOREPIPELINE_DUPLICATENAME = 970,
	LOADPIPELINE_NAMENOTFOUND = 971,
	LOADPIPELINE_INVALIDDESC = 972,
	PIPELINELIBRARY_SERIALIZE_NOTENOUGHMEMORY = 973,
	CREATEGRAPHICSPIPELINESTATE_PS_OUTPUT_RT_OUTPUT_MISMATCH = 974,
	SETEVENTONMULTIPLEFENCECOMPLETION_INVALIDFLAGS = 975,
	CREATE_QUEUE_VIDEO_NOT_SUPPORTED = 976,
	CREATE_COMMAND_ALLOCATOR_VIDEO_NOT_SUPPORTED = 977,
	CREATEQUERY_HEAP_VIDEO_DECODE_STATISTICS_NOT_SUPPORTED = 978,
	CREATE_VIDEODECODECOMMANDLIST = 979,
	CREATE_VIDEODECODER = 980,
	CREATE_VIDEODECODESTREAM = 981,
	LIVE_VIDEODECODECOMMANDLIST = 982,
	LIVE_VIDEODECODER = 983,
	LIVE_VIDEODECODESTREAM = 984,
	DESTROY_VIDEODECODECOMMANDLIST = 985,
	DESTROY_VIDEODECODER = 986,
	DESTROY_VIDEODECODESTREAM = 987,
	DECODE_FRAME_INVALID_PARAMETERS = 988,
	DEPRECATED_API = 989,
	RESOURCE_BARRIER_MISMATCHING_COMMAND_LIST_TYPE = 990,
	COMMAND_LIST_DESCRIPTOR_TABLE_NOT_SET = 991,
	COMMAND_LIST_ROOT_CONSTANT_BUFFER_VIEW_NOT_SET = 992,
	COMMAND_LIST_ROOT_SHADER_RESOURCE_VIEW_NOT_SET = 993,
	COMMAND_LIST_ROOT_UNORDERED_ACCESS_VIEW_NOT_SET = 994,
	DISCARD_INVALID_SUBRESOURCE_RANGE = 995,
	DISCARD_ONE_SUBRESOURCE_FOR_MIPS_WITH_RECTS = 996,
	DISCARD_NO_RECTS_FOR_NON_TEXTURE2D = 997,
	COPY_ON_SAME_SUBRESOURCE = 998,
	SETRESIDENCYPRIORITY_INVALID_PAGEABLE = 999,
	GPU_BASED_VALIDATION_UNSUPPORTED = 1000,
	STATIC_DESCRIPTOR_INVALID_DESCRIPTOR_CHANGE = 1001,
	DATA_STATIC_DESCRIPTOR_INVALID_DATA_CHANGE = 1002,
	DATA_STATIC_WHILE_SET_AT_EXECUTE_DESCRIPTOR_INVALID_DATA_CHANGE = 1003,
	EXECUTE_BUNDLE_STATIC_DESCRIPTOR_DATA_STATIC_NOT_SET = 1004,
	GPU_BASED_VALIDATION_RESOURCE_ACCESS_OUT_OF_BOUNDS = 1005,
	GPU_BASED_VALIDATION_SAMPLER_MODE_MISMATCH = 1006,
	CREATE_FENCE_INVALID_FLAGS = 1007,
	RESOURCE_BARRIER_DUPLICATE_SUBRESOURCE_TRANSITIONS = 1008,
	SETRESIDENCYPRIORITY_INVALID_PRIORITY = 1009,
	CREATE_DESCRIPTOR_HEAP_LARGE_NUM_DESCRIPTORS = 1013,
	BEGIN_EVENT = 1014,
	END_EVENT = 1015,
	CREATEDEVICE_DEBUG_LAYER_STARTUP_OPTIONS = 1016,
	CREATEDEPTHSTENCILSTATE_DEPTHBOUNDSTEST_UNSUPPORTED = 1017,
	CREATEPIPELINESTATE_DUPLICATE_SUBOBJECT = 1018,
	CREATEPIPELINESTATE_UNKNOWN_SUBOBJECT = 1019,
	CREATEPIPELINESTATE_ZERO_SIZE_STREAM = 1020,
	CREATEPIPELINESTATE_INVALID_STREAM = 1021,
	CREATEPIPELINESTATE_CANNOT_DEDUCE_TYPE = 1022,
	COMMAND_LIST_STATIC_DESCRIPTOR_RESOURCE_DIMENSION_MISMATCH = 1023,
	CREATE_COMMAND_QUEUE_INSUFFICIENT_PRIVILEGE_FOR_GLOBAL_REALTIME = 1024,
	CREATE_COMMAND_QUEUE_INSUFFICIENT_HARDWARE_SUPPORT_FOR_GLOBAL_REALTIME = 1025,
	ATOMICCOPYBUFFER_INVALID_ARCHITECTURE = 1026,
	ATOMICCOPYBUFFER_NULL_DST = 1027,
	ATOMICCOPYBUFFER_INVALID_DST_RESOURCE_DIMENSION = 1028,
	ATOMICCOPYBUFFER_DST_RANGE_OUT_OF_BOUNDS = 1029,
	ATOMICCOPYBUFFER_NULL_SRC = 1030,
	ATOMICCOPYBUFFER_INVALID_SRC_RESOURCE_DIMENSION = 1031,
	ATOMICCOPYBUFFER_SRC_RANGE_OUT_OF_BOUNDS = 1032,
	ATOMICCOPYBUFFER_INVALID_OFFSET_ALIGNMENT = 1033,
	ATOMICCOPYBUFFER_NULL_DEPENDENT_RESOURCES = 1034,
	ATOMICCOPYBUFFER_NULL_DEPENDENT_SUBRESOURCE_RANGES = 1035,
	ATOMICCOPYBUFFER_INVALID_DEPENDENT_RESOURCE = 1036,
	ATOMICCOPYBUFFER_INVALID_DEPENDENT_SUBRESOURCE_RANGE = 1037,
	ATOMICCOPYBUFFER_DEPENDENT_SUBRESOURCE_OUT_OF_BOUNDS = 1038,
	ATOMICCOPYBUFFER_DEPENDENT_RANGE_OUT_OF_BOUNDS = 1039,
	ATOMICCOPYBUFFER_ZERO_DEPENDENCIES = 1040,
	DEVICE_CREATE_SHARED_HANDLE_INVALIDARG = 1041,
	DESCRIPTOR_HANDLE_WITH_INVALID_RESOURCE = 1042,
	SETDEPTHBOUNDS_INVALIDARGS = 1043,
	GPU_BASED_VALIDATION_RESOURCE_STATE_IMPRECISE = 1044,
	COMMAND_LIST_PIPELINE_STATE_NOT_SET = 1045,
	CREATEGRAPHICSPIPELINESTATE_SHADER_MODEL_MISMATCH = 1046,
	OBJECT_ACCESSED_WHILE_STILL_IN_USE = 1047,
	PROGRAMMABLE_MSAA_UNSUPPORTED = 1048,
	SETSAMPLEPOSITIONS_INVALIDARGS = 1049,
	RESOLVESUBRESOURCEREGION_INVALID_RECT = 1050,
	CREATE_VIDEODECODECOMMANDQUEUE = 1051,
	CREATE_VIDEOPROCESSCOMMANDLIST = 1052,
	CREATE_VIDEOPROCESSCOMMANDQUEUE = 1053,
	LIVE_VIDEODECODECOMMANDQUEUE = 1054,
	LIVE_VIDEOPROCESSCOMMANDLIST = 1055,
	LIVE_VIDEOPROCESSCOMMANDQUEUE = 1056,
	DESTROY_VIDEODECODECOMMANDQUEUE = 1057,
	DESTROY_VIDEOPROCESSCOMMANDLIST = 1058,
	DESTROY_VIDEOPROCESSCOMMANDQUEUE = 1059,
	CREATE_VIDEOPROCESSOR = 1060,
	CREATE_VIDEOPROCESSSTREAM = 1061,
	LIVE_VIDEOPROCESSOR = 1062,
	LIVE_VIDEOPROCESSSTREAM = 1063,
	DESTROY_VIDEOPROCESSOR = 1064,
	DESTROY_VIDEOPROCESSSTREAM = 1065,
	PROCESS_FRAME_INVALID_PARAMETERS = 1066,
	COPY_INVALIDLAYOUT = 1067,
	CREATE_CRYPTO_SESSION = 1068,
	CREATE_CRYPTO_SESSION_POLICY = 1069,
	CREATE_PROTECTED_RESOURCE_SESSION = 1070,
	LIVE_CRYPTO_SESSION = 1071,
	LIVE_CRYPTO_SESSION_POLICY = 1072,
	LIVE_PROTECTED_RESOURCE_SESSION = 1073,
	DESTROY_CRYPTO_SESSION = 1074,
	DESTROY_CRYPTO_SESSION_POLICY = 1075,
	DESTROY_PROTECTED_RESOURCE_SESSION = 1076,
	PROTECTED_RESOURCE_SESSION_UNSUPPORTED = 1077,
	FENCE_INVALIDOPERATION = 1078,
	CREATEQUERY_HEAP_COPY_QUEUE_TIMESTAMPS_NOT_SUPPORTED = 1079,
	SAMPLEPOSITIONS_MISMATCH_DEFERRED = 1080,
	SAMPLEPOSITIONS_MISMATCH_RECORDTIME_ASSUMEDFROMFIRSTUSE = 1081,
	SAMPLEPOSITIONS_MISMATCH_RECORDTIME_ASSUMEDFROMCLEAR = 1082,
	CREATE_VIDEODECODERHEAP = 1083,
	LIVE_VIDEODECODERHEAP = 1084,
	DESTROY_VIDEODECODERHEAP = 1085,
	OPENEXISTINGHEAP_INVALIDARG_RETURN = 1086,
	OPENEXISTINGHEAP_OUTOFMEMORY_RETURN = 1087,
	OPENEXISTINGHEAP_INVALIDADDRESS = 1088,
	OPENEXISTINGHEAP_INVALIDHANDLE = 1089,
	WRITEBUFFERIMMEDIATE_INVALID_DEST = 1090,
	WRITEBUFFERIMMEDIATE_INVALID_MODE = 1091,
	WRITEBUFFERIMMEDIATE_INVALID_ALIGNMENT = 1092,
	WRITEBUFFERIMMEDIATE_NOT_SUPPORTED = 1093,
	SETVIEWINSTANCEMASK_INVALIDARGS = 1094,
	VIEW_INSTANCING_UNSUPPORTED = 1095,
	VIEW_INSTANCING_INVALIDARGS = 1096,
	COPYTEXTUREREGION_MISMATCH_DECODE_REFERENCE_ONLY_FLAG = 1097,
	COPYRESOURCE_MISMATCH_DECODE_REFERENCE_ONLY_FLAG = 1098,
	CREATE_VIDEO_DECODE_HEAP_CAPS_FAILURE = 1099,
	CREATE_VIDEO_DECODE_HEAP_CAPS_UNSUPPORTED = 1100,
	VIDEO_DECODE_SUPPORT_INVALID_INPUT = 1101,
	CREATE_VIDEO_DECODER_UNSUPPORTED = 1102,
	CREATEGRAPHICSPIPELINESTATE_METADATA_ERROR = 1103,
	CREATEGRAPHICSPIPELINESTATE_VIEW_INSTANCING_VERTEX_SIZE_EXCEEDED = 1104,
	CREATEGRAPHICSPIPELINESTATE_RUNTIME_INTERNAL_ERROR = 1105,
	NO_VIDEO_API_SUPPORT = 1106,
	VIDEO_PROCESS_SUPPORT_INVALID_INPUT = 1107,
	CREATE_VIDEO_PROCESSOR_CAPS_FAILURE = 1108,
	VIDEO_PROCESS_SUPPORT_UNSUPPORTED_FORMAT = 1109,
	VIDEO_DECODE_FRAME_INVALID_ARGUMENT = 1110,
	ENQUEUE_MAKE_RESIDENT_INVALID_FLAGS = 1111,
	OPENEXISTINGHEAP_UNSUPPORTED = 1112,
	VIDEO_PROCESS_FRAMES_INVALID_ARGUMENT = 1113,
	VIDEO_DECODE_SUPPORT_UNSUPPORTED = 1114,
	CREATE_COMMANDRECORDER = 1115,
	LIVE_COMMANDRECORDER = 1116,
	DESTROY_COMMANDRECORDER = 1117,
	CREATE_COMMAND_RECORDER_VIDEO_NOT_SUPPORTED = 1118,
	CREATE_COMMAND_RECORDER_INVALID_SUPPORT_FLAGS = 1119,
	CREATE_COMMAND_RECORDER_INVALID_FLAGS = 1120,
	CREATE_COMMAND_RECORDER_MORE_RECORDERS_THAN_LOGICAL_PROCESSORS = 1121,
	CREATE_COMMANDPOOL = 1122,
	LIVE_COMMANDPOOL = 1123,
	DESTROY_COMMANDPOOL = 1124,
	CREATE_COMMAND_POOL_INVALID_FLAGS = 1125,
	CREATE_COMMAND_LIST_VIDEO_NOT_SUPPORTED = 1126,
	COMMAND_RECORDER_SUPPORT_FLAGS_MISMATCH = 1127,
	COMMAND_RECORDER_CONTENTION = 1128,
	COMMAND_RECORDER_USAGE_WITH_CREATECOMMANDLIST_COMMAND_LIST = 1129,
	COMMAND_ALLOCATOR_USAGE_WITH_CREATECOMMANDLIST1_COMMAND_LIST = 1130,
	CANNOT_EXECUTE_EMPTY_COMMAND_LIST = 1131,
	CANNOT_RESET_COMMAND_POOL_WITH_OPEN_COMMAND_LISTS = 1132,
	CANNOT_USE_COMMAND_RECORDER_WITHOUT_CURRENT_TARGET = 1133,
	CANNOT_CHANGE_COMMAND_RECORDER_TARGET_WHILE_RECORDING = 1134,
	COMMAND_POOL_SYNC = 1135,
	EVICT_UNDERFLOW = 1136,
	CREATE_META_COMMAND = 1137,
	LIVE_META_COMMAND = 1138,
	DESTROY_META_COMMAND = 1139,
	COPYBUFFERREGION_INVALID_DST_RESOURCE = 1140,
	COPYBUFFERREGION_INVALID_SRC_RESOURCE = 1141,
	ATOMICCOPYBUFFER_INVALID_DST_RESOURCE = 1142,
	ATOMICCOPYBUFFER_INVALID_SRC_RESOURCE = 1143,
	CREATEPLACEDRESOURCEONBUFFER_NULL_BUFFER = 1144,
	CREATEPLACEDRESOURCEONBUFFER_NULL_RESOURCE_DESC = 1145,
	CREATEPLACEDRESOURCEONBUFFER_UNSUPPORTED = 1146,
	CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_DIMENSION = 1147,
	CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_FLAGS = 1148,
	CREATEPLACEDRESOURCEONBUFFER_INVALID_BUFFER_OFFSET = 1149,
	CREATEPLACEDRESOURCEONBUFFER_INVALID_RESOURCE_DIMENSION = 1150,
	CREATEPLACEDRESOURCEONBUFFER_INVALID_RESOURCE_FLAGS = 1151,
	CREATEPLACEDRESOURCEONBUFFER_OUTOFMEMORY_RETURN = 1152,
	CANNOT_CREATE_GRAPHICS_AND_VIDEO_COMMAND_RECORDER = 1153,
	UPDATETILEMAPPINGS_POSSIBLY_MISMATCHING_PROPERTIES = 1154,
	CREATE_COMMAND_LIST_INVALID_COMMAND_LIST_TYPE = 1155,
	CLEARUNORDEREDACCESSVIEW_INCOMPATIBLE_WITH_STRUCTURED_BUFFERS = 1156,
	COMPUTE_ONLY_DEVICE_OPERATION_UNSUPPORTED = 1157,
	BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INVALID = 1158,
	EMIT_RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_INVALID = 1159,
	COPY_RAYTRACING_ACCELERATION_STRUCTURE_INVALID = 1160,
	DISPATCH_RAYS_INVALID = 1161,
	GET_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO_INVALID = 1162,
	CREATE_LIFETIMETRACKER = 1163,
	LIVE_LIFETIMETRACKER = 1164,
	DESTROY_LIFETIMETRACKER = 1165,
	DESTROYOWNEDOBJECT_OBJECTNOTOWNED = 1166,
	CREATE_TRACKEDWORKLOAD = 1167,
	LIVE_TRACKEDWORKLOAD = 1168,
	DESTROY_TRACKEDWORKLOAD = 1169,
	RENDER_PASS_ERROR = 1170,
	META_COMMAND_ID_INVALID = 1171,
	META_COMMAND_UNSUPPORTED_PARAMS = 1172,
	META_COMMAND_FAILED_ENUMERATION = 1173,
	META_COMMAND_PARAMETER_SIZE_MISMATCH = 1174,
	UNINITIALIZED_META_COMMAND = 1175,
	META_COMMAND_INVALID_GPU_VIRTUAL_ADDRESS = 1176,
	CREATE_VIDEOENCODECOMMANDLIST = 1177,
	LIVE_VIDEOENCODECOMMANDLIST = 1178,
	DESTROY_VIDEOENCODECOMMANDLIST = 1179,
	CREATE_VIDEOENCODECOMMANDQUEUE = 1180,
	LIVE_VIDEOENCODECOMMANDQUEUE = 1181,
	DESTROY_VIDEOENCODECOMMANDQUEUE = 1182,
	CREATE_VIDEOMOTIONESTIMATOR = 1183,
	LIVE_VIDEOMOTIONESTIMATOR = 1184,
	DESTROY_VIDEOMOTIONESTIMATOR = 1185,
	CREATE_VIDEOMOTIONVECTORHEAP = 1186,
	LIVE_VIDEOMOTIONVECTORHEAP = 1187,
	DESTROY_VIDEOMOTIONVECTORHEAP = 1188,
	MULTIPLE_TRACKED_WORKLOADS = 1189,
	MULTIPLE_TRACKED_WORKLOAD_PAIRS = 1190,
	OUT_OF_ORDER_TRACKED_WORKLOAD_PAIR = 1191,
	CANNOT_ADD_TRACKED_WORKLOAD = 1192,
	INCOMPLETE_TRACKED_WORKLOAD_PAIR = 1193,
	CREATE_STATE_OBJECT_ERROR = 1194,
	GET_SHADER_IDENTIFIER_ERROR = 1195,
	GET_SHADER_STACK_SIZE_ERROR = 1196,
	GET_PIPELINE_STACK_SIZE_ERROR = 1197,
	SET_PIPELINE_STACK_SIZE_ERROR = 1198,
	GET_SHADER_IDENTIFIER_SIZE_INVALID = 1199,
	CHECK_DRIVER_MATCHING_IDENTIFIER_INVALID = 1200,
	CHECK_DRIVER_MATCHING_IDENTIFIER_DRIVER_REPORTED_ISSUE = 1201,
	RENDER_PASS_INVALID_RESOURCE_BARRIER = 1202,
	RENDER_PASS_DISALLOWED_API_CALLED = 1203,
	RENDER_PASS_CANNOT_NEST_RENDER_PASSES = 1204,
	RENDER_PASS_CANNOT_END_WITHOUT_BEGIN = 1205,
	RENDER_PASS_CANNOT_CLOSE_COMMAND_LIST = 1206,
	RENDER_PASS_GPU_WORK_WHILE_SUSPENDED = 1207,
	RENDER_PASS_MISMATCHING_SUSPEND_RESUME = 1208,
	RENDER_PASS_NO_PRIOR_SUSPEND_WITHIN_EXECUTECOMMANDLISTS = 1209,
	RENDER_PASS_NO_SUBSEQUENT_RESUME_WITHIN_EXECUTECOMMANDLISTS = 1210,
	TRACKED_WORKLOAD_COMMAND_QUEUE_MISMATCH = 1211,
	TRACKED_WORKLOAD_NOT_SUPPORTED = 1212,
	RENDER_PASS_MISMATCHING_NO_ACCESS = 1213,
	RENDER_PASS_UNSUPPORTED_RESOLVE = 1214,
	CLEARUNORDEREDACCESSVIEW_INVALID_RESOURCE_PTR = 1215,
	WINDOWS7_FENCE_OUTOFORDER_SIGNAL = 1216,
	WINDOWS7_FENCE_OUTOFORDER_WAIT = 1217,
	VIDEO_CREATE_MOTION_ESTIMATOR_INVALID_ARGUMENT = 1218,
	VIDEO_CREATE_MOTION_VECTOR_HEAP_INVALID_ARGUMENT = 1219,
	ESTIMATE_MOTION_INVALID_ARGUMENT = 1220,
	RESOLVE_MOTION_VECTOR_HEAP_INVALID_ARGUMENT = 1221,
	GETGPUVIRTUALADDRESS_INVALID_HEAP_TYPE = 1222,
	SET_BACKGROUND_PROCESSING_MODE_INVALID_ARGUMENT = 1223,
	CREATE_COMMAND_LIST_INVALID_COMMAND_LIST_TYPE_FOR_FEATURE_LEVEL = 1224,
	CREATE_VIDEOEXTENSIONCOMMAND = 1225,
	LIVE_VIDEOEXTENSIONCOMMAND = 1226,
	DESTROY_VIDEOEXTENSIONCOMMAND = 1227,
	INVALID_VIDEO_EXTENSION_COMMAND_ID = 1228,
	VIDEO_EXTENSION_COMMAND_INVALID_ARGUMENT = 1229,
	CREATE_ROOT_SIGNATURE_NOT_UNIQUE_IN_DXIL_LIBRARY = 1230,
	VARIABLE_SHADING_RATE_NOT_ALLOWED_WITH_TIR = 1231,
	GEOMETRY_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE = 1232,
	RSSETSHADING_RATE_INVALID_SHADING_RATE = 1233,
	RSSETSHADING_RATE_SHADING_RATE_NOT_PERMITTED_BY_CAP = 1234,
	RSSETSHADING_RATE_INVALID_COMBINER = 1235,
	RSSETSHADINGRATEIMAGE_REQUIRES_TIER_2 = 1236,
	RSSETSHADINGRATE_REQUIRES_TIER_1 = 1237,
	SHADING_RATE_IMAGE_INCORRECT_FORMAT = 1238,
	SHADING_RATE_IMAGE_INCORRECT_ARRAY_SIZE = 1239,
	SHADING_RATE_IMAGE_INCORRECT_MIP_LEVEL = 1240,
	SHADING_RATE_IMAGE_INCORRECT_SAMPLE_COUNT = 1241,
	SHADING_RATE_IMAGE_INCORRECT_SAMPLE_QUALITY = 1242,
	NON_RETAIL_SHADER_MODEL_WONT_VALIDATE = 1243,
	CREATEGRAPHICSPIPELINESTATE_AS_ROOT_SIGNATURE_MISMATCH = 1244,
	CREATEGRAPHICSPIPELINESTATE_MS_ROOT_SIGNATURE_MISMATCH = 1245,
	ADD_TO_STATE_OBJECT_ERROR = 1246,
	CREATE_PROTECTED_RESOURCE_SESSION_INVALID_ARGUMENT = 1247,
	CREATEGRAPHICSPIPELINESTATE_MS_PSO_DESC_MISMATCH = 1248,
	CREATEPIPELINESTATE_MS_INCOMPLETE_TYPE = 1249,
	CREATEGRAPHICSPIPELINESTATE_AS_NOT_MS_MISMATCH = 1250,
	CREATEGRAPHICSPIPELINESTATE_MS_NOT_PS_MISMATCH = 1251,
	NONZERO_SAMPLER_FEEDBACK_MIP_REGION_WITH_INCOMPATIBLE_FORMAT = 1252,
	CREATEGRAPHICSPIPELINESTATE_INPUTLAYOUT_SHADER_MISMATCH = 1253,
	EMPTY_DISPATCH = 1254,
	RESOURCE_FORMAT_REQUIRES_SAMPLER_FEEDBACK_CAPABILITY = 1255,
	SAMPLER_FEEDBACK_MAP_INVALID_MIP_REGION = 1256,
	SAMPLER_FEEDBACK_MAP_INVALID_DIMENSION = 1257,
	SAMPLER_FEEDBACK_MAP_INVALID_SAMPLE_COUNT = 1258,
	SAMPLER_FEEDBACK_MAP_INVALID_SAMPLE_QUALITY = 1259,
	SAMPLER_FEEDBACK_MAP_INVALID_LAYOUT = 1260,
	SAMPLER_FEEDBACK_MAP_REQUIRES_UNORDERED_ACCESS_FLAG = 1261,
	SAMPLER_FEEDBACK_CREATE_UAV_NULL_ARGUMENTS = 1262,
	SAMPLER_FEEDBACK_UAV_REQUIRES_SAMPLER_FEEDBACK_CAPABILITY = 1263,
	SAMPLER_FEEDBACK_CREATE_UAV_REQUIRES_FEEDBACK_MAP_FORMAT = 1264,
	CREATEMESHSHADER_INVALIDSHADERBYTECODE = 1265,
	CREATEMESHSHADER_OUTOFMEMORY = 1266,
	CREATEMESHSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE = 1267,
	RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_TRANSCODE_INVALID_FORMAT = 1268,
	RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_INVALID_MIP_LEVEL_COUNT = 1269,
	RESOLVESUBRESOURCE_SAMPLER_FEEDBACK_TRANSCODE_ARRAY_SIZE_MISMATCH = 1270,
	SAMPLER_FEEDBACK_CREATE_UAV_MISMATCHING_TARGETED_RESOURCE = 1271,
	CREATEMESHSHADER_OUTPUTEXCEEDSMAXSIZE = 1272,
	CREATEMESHSHADER_GROUPSHAREDEXCEEDSMAXSIZE = 1273,
	VERTEX_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE = 1274,
	MESH_SHADER_OUTPUTTING_BOTH_VIEWPORT_ARRAY_INDEX_AND_SHADING_RATE_NOT_SUPPORTED_ON_DEVICE = 1275,
	CREATEMESHSHADER_MISMATCHEDASMSPAYLOADSIZE = 1276,
	CREATE_ROOT_SIGNATURE_UNBOUNDED_STATIC_DESCRIPTORS = 1277,
	CREATEAMPLIFICATIONSHADER_INVALIDSHADERBYTECODE = 1278,
	CREATEAMPLIFICATIONSHADER_OUTOFMEMORY = 1279,
	CREATE_SHADERCACHESESSION = 1280,
	LIVE_SHADERCACHESESSION = 1281,
	DESTROY_SHADERCACHESESSION = 1282,
	CREATESHADERCACHESESSION_INVALIDARGS = 1283,
	CREATESHADERCACHESESSION_DISABLED = 1284,
	CREATESHADERCACHESESSION_ALREADYOPEN = 1285,
	SHADERCACHECONTROL_DEVELOPERMODE = 1286,
	SHADERCACHECONTROL_INVALIDFLAGS = 1287,
	SHADERCACHECONTROL_STATEALREADYSET = 1288,
	SHADERCACHECONTROL_IGNOREDFLAG = 1289,
	SHADERCACHESESSION_STOREVALUE_ALREADYPRESENT = 1290,
	SHADERCACHESESSION_STOREVALUE_HASHCOLLISION = 1291,
	SHADERCACHESESSION_STOREVALUE_CACHEFULL = 1292,
	SHADERCACHESESSION_FINDVALUE_NOTFOUND = 1293,
	SHADERCACHESESSION_CORRUPT = 1294,
	SHADERCACHESESSION_DISABLED = 1295,
	OVERSIZED_DISPATCH = 1296,
	CREATE_VIDEOENCODER = 1297,
	LIVE_VIDEOENCODER = 1298,
	DESTROY_VIDEOENCODER = 1299,
	CREATE_VIDEOENCODERHEAP = 1300,
	LIVE_VIDEOENCODERHEAP = 1301,
	DESTROY_VIDEOENCODERHEAP = 1302,
	COPYTEXTUREREGION_MISMATCH_ENCODE_REFERENCE_ONLY_FLAG = 1303,
	COPYRESOURCE_MISMATCH_ENCODE_REFERENCE_ONLY_FLAG = 1304,
	ENCODE_FRAME_INVALID_PARAMETERS = 1305,
	ENCODE_FRAME_UNSUPPORTED_PARAMETERS = 1306,
	RESOLVE_ENCODER_OUTPUT_METADATA_INVALID_PARAMETERS = 1307,
	RESOLVE_ENCODER_OUTPUT_METADATA_UNSUPPORTED_PARAMETERS = 1308,
	CREATE_VIDEO_ENCODER_INVALID_PARAMETERS = 1309,
	CREATE_VIDEO_ENCODER_UNSUPPORTED_PARAMETERS = 1310,
	CREATE_VIDEO_ENCODER_HEAP_INVALID_PARAMETERS = 1311,
	CREATE_VIDEO_ENCODER_HEAP_UNSUPPORTED_PARAMETERS = 1312,
	CREATECOMMANDLIST_NULL_COMMANDALLOCATOR = 1313,
	CLEAR_UNORDERED_ACCESS_VIEW_INVALID_DESCRIPTOR_HANDLE = 1314,
	DESCRIPTOR_HEAP_NOT_SHADER_VISIBLE = 1315,
	CREATEBLENDSTATE_BLENDOP_WARNING = 1316,
	CREATEBLENDSTATE_BLENDOPALPHA_WARNING = 1317,
	WRITE_COMBINE_PERFORMANCE_WARNING = 1318,
	RESOLVE_QUERY_INVALID_QUERY_STATE = 1319,
	SETPRIVATEDATA_NO_ACCESS = 1320,
	COMMAND_LIST_STATIC_DESCRIPTOR_SAMPLER_MODE_MISMATCH = 1321,
	GETCOPYABLEFOOTPRINTS_UNSUPPORTED_BUFFER_WIDTH = 1322,
	CREATEMESHSHADER_TOPOLOGY_MISMATCH = 1323,
	VRS_SUM_COMBINER_REQUIRES_CAPABILITY = 1324,
	SETTING_SHADING_RATE_FROM_MS_REQUIRES_CAPABILITY = 1325,
	SHADERCACHESESSION_SHADERCACHEDELETE_NOTSUPPORTED = 1326,
	SHADERCACHECONTROL_SHADERCACHECLEAR_NOTSUPPORTED = 1327,
	CREATERESOURCE_STATE_IGNORED = 1328,
	UNUSED_CROSS_EXECUTE_SPLIT_BARRIER = 1329,
	DEVICE_OPEN_SHARED_HANDLE_ACCESS_DENIED = 1330,
	INCOMPATIBLE_BARRIER_VALUES = 1331,
	INCOMPATIBLE_BARRIER_ACCESS = 1332,
	INCOMPATIBLE_BARRIER_SYNC = 1333,
	INCOMPATIBLE_BARRIER_LAYOUT = 1334,
	INCOMPATIBLE_BARRIER_TYPE = 1335,
	OUT_OF_BOUNDS_BARRIER_SUBRESOURCE_RANGE = 1336,
	INCOMPATIBLE_BARRIER_RESOURCE_DIMENSION = 1337,
	SET_SCISSOR_RECTS_INVALID_RECT = 1338,
	SHADING_RATE_SOURCE_REQUIRES_DIMENSION_TEXTURE2D = 1339,
	BUFFER_BARRIER_SUBREGION_OUT_OF_BOUNDS = 1340,
	UNSUPPORTED_BARRIER_LAYOUT = 1341,
	CREATERESOURCEANDHEAP_INVALID_PARAMETERS = 1342,
	ENHANCED_BARRIERS_NOT_SUPPORTED = 1343,
	LEGACY_BARRIER_VALIDATION_FORCED_ON = 1346,
	EMPTY_ROOT_DESCRIPTOR_TABLE = 1347,
	COMMAND_LIST_DRAW_ELEMENT_OFFSET_UNALIGNED = 1348,
	ALPHA_BLEND_FACTOR_NOT_SUPPORTED = 1349,
	BARRIER_INTEROP_INVALID_LAYOUT = 1350,
	BARRIER_INTEROP_INVALID_STATE = 1351,
	GRAPHICS_PIPELINE_STATE_DESC_ZERO_SAMPLE_MASK = 1352,
	INDEPENDENT_STENCIL_REF_NOT_SUPPORTED = 1353,
	CREATEDEPTHSTENCILSTATE_INDEPENDENT_MASKS_UNSUPPORTED = 1354,
	TEXTURE_BARRIER_SUBRESOURCES_OUT_OF_BOUNDS = 1355,
	NON_OPTIMAL_BARRIER_ONLY_EXECUTE_COMMAND_LISTS = 1356,
	EXECUTE_INDIRECT_ZERO_COMMAND_COUNT = 1357,
	GPU_BASED_VALIDATION_INCOMPATIBLE_TEXTURE_LAYOUT = 1358,
	DYNAMIC_INDEX_BUFFER_STRIP_CUT_NOT_SUPPORTED = 1359,
	PRIMITIVE_TOPOLOGY_TRIANGLE_FANS_NOT_SUPPORTED = 1360,
	CREATE_SAMPLER_COMPARISON_FUNC_IGNORED = 1361,
	CREATEHEAP_INVALIDHEAPTYPE = 1362,
	CREATERESOURCEANDHEAP_INVALIDHEAPTYPE = 1363,
	DYNAMIC_DEPTH_BIAS_NOT_SUPPORTED = 1364,
	CREATERASTERIZERSTATE_NON_WHOLE_DYNAMIC_DEPTH_BIAS = 1365,
	DYNAMIC_DEPTH_BIAS_FLAG_MISSING = 1366,
	DYNAMIC_DEPTH_BIAS_NO_PIPELINE = 1367,
	DYNAMIC_INDEX_BUFFER_STRIP_CUT_FLAG_MISSING = 1368,
	DYNAMIC_INDEX_BUFFER_STRIP_CUT_NO_PIPELINE = 1369,
	NONNORMALIZED_COORDINATE_SAMPLING_NOT_SUPPORTED = 1370,
	INVALID_CAST_TARGET = 1371,
	RENDER_PASS_COMMANDLIST_INVALID_END_STATE = 1372,
	RENDER_PASS_COMMANDLIST_INVALID_START_STATE = 1373,
	RENDER_PASS_MISMATCHING_ACCESS = 1374,
	RENDER_PASS_MISMATCHING_LOCAL_PRESERVE_PARAMETERS = 1375,
	RENDER_PASS_LOCAL_PRESERVE_RENDER_PARAMETERS_ERROR = 1376,
	RENDER_PASS_LOCAL_DEPTH_STENCIL_ERROR = 1377,
	DRAW_POTENTIALLY_OUTSIDE_OF_VALID_RENDER_AREA = 1378,
	CREATERASTERIZERSTATE_INVALID_LINERASTERIZATIONMODE = 1379,
	CREATERESOURCE_INVALIDALIGNMENT_SMALLRESOURCE = 1380,
	GENERIC_DEVICE_OPERATION_UNSUPPORTED = 1381,
	CREATEGRAPHICSPIPELINESTATE_RENDER_TARGET_WRONG_WRITE_MASK = 1382,
	PROBABLE_PIX_EVENT_LEAK = 1383,
	PIX_EVENT_UNDERFLOW = 1384,
	RECREATEAT_INVALID_TARGET = 1385,
	RECREATEAT_INSUFFICIENT_SUPPORT = 1386,
	GPU_BASED_VALIDATION_STRUCTURED_BUFFER_STRIDE_MISMATCH = 1387,
	DISPATCH_GRAPH_INVALID = 1388,
	DIRECTSR_SUPERRES_TARGET_FORMAT_INVALID = 1389,
	DIRECTSR_SUPERRES_TARGET_DIMENSION_INVALID = 1390,
	DIRECTSR_SUPERRES_SOURCE_COLOR_FORMAT_INVALID = 1391,
	DIRECTSR_SUPERRES_SOURCE_DEPTH_FORMAT_INVALID = 1392,
	DIRECTSR_SUPERRES_EXPOSURE_SCALE_FORMAT_INVALID = 1393,
	DIRECTSR_SUPERRES_ENGINE_CREATE_FLAGS_INVALID = 1394,
	DIRECTSR_SUPERRES_EXTENSION_INTERNAL_LOAD_FAILURE = 1395,
	DIRECTSR_SUPERRES_EXTENSION_INTERNAL_ENGINE_CREATION_ERROR = 1396,
	DIRECTSR_SUPERRES_EXTENSION_INTERNAL_UPSCALER_CREATION_ERROR = 1397,
	DIRECTSR_SUPERRES_EXTENSION_INTERNAL_UPSCALER_EXECUTION_ERROR = 1398,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_REGION_INVALID = 1399,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_TIME_DELTA_INVALID = 1400,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_REQUIRED_TEXTURE_IS_NULL = 1401,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_MOTION_VECTORS_FORMAT_INVALID = 1402,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_FLAGS_INVALID = 1403,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_FORMAT_INVALID = 1404,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_EXPOSURE_SCALE_TEXTURE_SIZE_INVALID = 1405,
	DIRECTSR_SUPERRES_VARIANT_INDEX_OUT_OF_BOUNDS = 1406,
	DIRECTSR_SUPERRES_VARIANT_ID_NOT_FOUND = 1407,
	DIRECTSR_SUPERRES_DUPLICATE_VARIANT_ID = 1408,
	DIRECTSR_OUT_OF_MEMORY = 1409,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_UNEXPECTED_TEXTURE_IS_IGNORED = 1410,
	DIRECTSR_SUPERRES_UPSCALER_EVICT_UNDERFLOW = 1411,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_OPTIONAL_TEXTURE_IS_NULL = 1412,
	DIRECTSR_SUPERRES_UPSCALER_EXECUTE_INVALID_CAMERA_JITTER = 1413,
	CREATE_STATE_OBJECT_WARNING = 1414,
	GUID_TEXTURE_LAYOUT_UNSUPPORTED = 1415,
	RESOLVE_ENCODER_INPUT_PARAM_LAYOUT_INVALID_PARAMETERS = 1416,
	INVALID_BARRIER_ACCESS = 1417,
	COMMAND_LIST_DRAW_INSTANCE_COUNT_ZERO = 1418,
	DESCRIPTOR_HEAP_NOT_SET_BEFORE_ROOT_SIGNATURE_WITH_DIRECTLY_INDEXED_FLAG = 1419,
	DIFFERENT_DESCRIPTOR_HEAP_SET_AFTER_ROOT_SIGNATURE_WITH_DIRECTLY_INDEXED_FLAG = 1420,
	D3D12_MESSAGES_END = 1421,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_message_severity ]]
MESSAGE_SEVERITY :: enum i32 {
	CORRUPTION = 0,
	ERROR = 1,
	WARNING = 2,
	INFO = 3,
	MESSAGE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_meta_command_desc ]]
META_COMMAND_DESC :: struct {
	Id: GUID,
	Name: PWSTR,
	InitializationDirtyState: GRAPHICS_STATES,
	ExecutionDirtyState: GRAPHICS_STATES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_meta_command_parameter_desc ]]
META_COMMAND_PARAMETER_DESC :: struct {
	Name: PWSTR,
	Type: META_COMMAND_PARAMETER_TYPE,
	Flags: META_COMMAND_PARAMETER_FLAGS,
	RequiredResourceState: RESOURCE_STATES,
	StructureOffset: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_flags ]]
META_COMMAND_PARAMETER_FLAGS :: distinct bit_set[enum {
	INPUT = 0,
	OUTPUT = 1,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_stage ]]
META_COMMAND_PARAMETER_STAGE :: enum i32 {
	CREATION = 0,
	INITIALIZATION = 1,
	EXECUTION = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_type ]]
META_COMMAND_PARAMETER_TYPE :: enum i32 {
	FLOAT = 0,
	UINT64 = 1,
	GPU_VIRTUAL_ADDRESS = 2,
	CPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV = 3,
	GPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_mip_region ]]
MIP_REGION :: struct {
	Width: u32,
	Height: u32,
	Depth: u32,
}

MULTI_NODE_CPU_INPUT :: struct {
	NumNodeInputs: u32,
	pNodeInputs: ^NODE_CPU_INPUT,
	NodeInputStrideInBytes: u64,
}

MULTI_NODE_GPU_INPUT :: struct {
	NumNodeInputs: u32,
	NodeInputs: GPU_VIRTUAL_ADDRESS_AND_STRIDE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_multiple_fence_wait_flags ]]
MULTIPLE_FENCE_WAIT_FLAGS :: distinct bit_set[enum {
	ANY = 0,
}; i32]
MULTIPLE_FENCE_WAIT_FLAGS_NONE :: transmute(MULTIPLE_FENCE_WAIT_FLAGS)i32(0)
MULTIPLE_FENCE_WAIT_FLAGS_ALL :: transmute(MULTIPLE_FENCE_WAIT_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_multisample_quality_level_flags ]]
MULTISAMPLE_QUALITY_LEVEL_FLAGS :: distinct bit_set[enum {
	TILED_RESOURCE = 0,
}; i32]
MULTISAMPLE_QUALITY_LEVEL_FLAGS_NONE :: transmute(MULTISAMPLE_QUALITY_LEVEL_FLAGS)i32(0)

NODE :: struct {
	NodeType: NODE_TYPE,
	using _: struct #raw_union {
		Shader: SHADER_NODE,
	},
}

NODE_CPU_INPUT :: struct {
	EntrypointIndex: u32,
	NumRecords: u32,
	pRecords: rawptr,
	RecordStrideInBytes: u64,
}

NODE_GPU_INPUT :: struct {
	EntrypointIndex: u32,
	NumRecords: u32,
	Records: GPU_VIRTUAL_ADDRESS_AND_STRIDE,
}

NODE_ID :: struct {
	Name: PWSTR,
	ArrayIndex: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_node_mask ]]
NODE_MASK :: struct {
	NodeMask: u32,
}

NODE_OUTPUT_OVERRIDES :: struct {
	OutputIndex: u32,
	pNewName: ^NODE_ID,
	pAllowSparseNodes: ^BOOL,
	pMaxRecords: ^u32,
	pMaxRecordsSharedWithOutputIndex: ^u32,
}

NODE_OVERRIDES_TYPE :: enum i32 {
	NONE = 0,
	BROADCASTING_LAUNCH = 1,
	COALESCING_LAUNCH = 2,
	THREAD_LAUNCH = 3,
	COMMON_COMPUTE = 4,
}

NODE_TYPE :: enum i32 {
	SHADER = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_packed_mip_info ]]
PACKED_MIP_INFO :: struct {
	NumStandardMips: u8,
	NumPackedMips: u8,
	NumTilesForPackedMips: u32,
	StartTileIndexInOverallResource: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_parameter_desc ]]
PARAMETER_DESC :: struct {
	Name: PSTR,
	SemanticName: PSTR,
	Type: d3d.SHADER_VARIABLE_TYPE,
	Class: d3d.SHADER_VARIABLE_CLASS,
	Rows: u32,
	Columns: u32,
	InterpolationMode: d3d.INTERPOLATION_MODE,
	Flags: d3d.PARAMETER_FLAGS,
	FirstInRegister: u32,
	FirstInComponent: u32,
	FirstOutRegister: u32,
	FirstOutComponent: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_pipeline_state_flags ]]
PIPELINE_STATE_FLAGS :: distinct bit_set[enum {
	TOOL_DEBUG = 0,
	DYNAMIC_DEPTH_BIAS = 2,
	DYNAMIC_INDEX_BUFFER_STRIP_CUT = 3,
}; i32]
PIPELINE_STATE_FLAGS_NONE :: transmute(PIPELINE_STATE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_pipeline_state_stream_desc ]]
PIPELINE_STATE_STREAM_DESC :: struct {
	SizeInBytes: uintptr,
	pPipelineStateSubobjectStream: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_pipeline_state_subobject_type ]]
PIPELINE_STATE_SUBOBJECT_TYPE :: enum i32 {
	ROOT_SIGNATURE = 0,
	VS = 1,
	PS = 2,
	DS = 3,
	HS = 4,
	GS = 5,
	CS = 6,
	STREAM_OUTPUT = 7,
	BLEND = 8,
	SAMPLE_MASK = 9,
	RASTERIZER = 10,
	DEPTH_STENCIL = 11,
	INPUT_LAYOUT = 12,
	IB_STRIP_CUT_VALUE = 13,
	PRIMITIVE_TOPOLOGY = 14,
	RENDER_TARGET_FORMATS = 15,
	DEPTH_STENCIL_FORMAT = 16,
	SAMPLE_DESC = 17,
	NODE_MASK = 18,
	CACHED_PSO = 19,
	FLAGS = 20,
	DEPTH_STENCIL1 = 21,
	VIEW_INSTANCING = 22,
	AS = 24,
	MS = 25,
	DEPTH_STENCIL2 = 26,
	RASTERIZER1 = 27,
	RASTERIZER2 = 28,
	MAX_VALID = 29,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_placed_subresource_footprint ]]
PLACED_SUBRESOURCE_FOOTPRINT :: struct {
	Offset: u64,
	Footprint: SUBRESOURCE_FOOTPRINT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_predication_op ]]
PREDICATION_OP :: enum i32 {
	EQUAL_ZERO = 0,
	NOT_EQUAL_ZERO = 1,
}

PRIMITIVE_TOPOLOGY_DESC :: struct {
	PrimitiveTopology: PRIMITIVE_TOPOLOGY_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_primitive_topology_type ]]
PRIMITIVE_TOPOLOGY_TYPE :: enum i32 {
	UNDEFINED = 0,
	POINT = 1,
	LINE = 2,
	TRIANGLE = 3,
	PATCH = 4,
}

PROGRAM_IDENTIFIER :: struct {
	OpaqueData: [4]u64,
}

PROGRAM_TYPE :: enum i32 {
	GENERIC_PIPELINE = 1,
	RAYTRACING_PIPELINE = 4,
	WORK_GRAPH = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_programmable_sample_positions_tier ]]
PROGRAMMABLE_SAMPLE_POSITIONS_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1 = 1,
	_2 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_protected_resource_session_desc ]]
PROTECTED_RESOURCE_SESSION_DESC :: struct {
	NodeMask: u32,
	Flags: PROTECTED_RESOURCE_SESSION_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_protected_resource_session_desc1 ]]
PROTECTED_RESOURCE_SESSION_DESC1 :: struct {
	NodeMask: u32,
	Flags: PROTECTED_RESOURCE_SESSION_FLAGS,
	ProtectionType: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_protected_resource_session_flags ]]
PROTECTED_RESOURCE_SESSION_FLAGS :: distinct bit_set[enum {}; i32]
PROTECTED_RESOURCE_SESSION_FLAGS_NONE :: transmute(PROTECTED_RESOURCE_SESSION_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_protected_resource_session_support_flags ]]
PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS :: distinct bit_set[enum {
	SUPPORTED = 0,
}; i32]
PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS_NONE :: transmute(PROTECTED_RESOURCE_SESSION_SUPPORT_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_protected_session_status ]]
PROTECTED_SESSION_STATUS :: enum i32 {
	OK = 0,
	INVALID = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_query_data_pipeline_statistics ]]
QUERY_DATA_PIPELINE_STATISTICS :: struct {
	IAVertices: u64,
	IAPrimitives: u64,
	VSInvocations: u64,
	GSInvocations: u64,
	GSPrimitives: u64,
	CInvocations: u64,
	CPrimitives: u64,
	PSInvocations: u64,
	HSInvocations: u64,
	DSInvocations: u64,
	CSInvocations: u64,
}

QUERY_DATA_PIPELINE_STATISTICS1 :: struct {
	IAVertices: u64,
	IAPrimitives: u64,
	VSInvocations: u64,
	GSInvocations: u64,
	GSPrimitives: u64,
	CInvocations: u64,
	CPrimitives: u64,
	PSInvocations: u64,
	HSInvocations: u64,
	DSInvocations: u64,
	CSInvocations: u64,
	ASInvocations: u64,
	MSInvocations: u64,
	MSPrimitives: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_query_data_so_statistics ]]
QUERY_DATA_SO_STATISTICS :: struct {
	NumPrimitivesWritten: u64,
	PrimitivesStorageNeeded: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_query_heap_desc ]]
QUERY_HEAP_DESC :: struct {
	Type: QUERY_HEAP_TYPE,
	Count: u32,
	NodeMask: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_query_heap_type ]]
QUERY_HEAP_TYPE :: enum i32 {
	OCCLUSION = 0,
	TIMESTAMP = 1,
	PIPELINE_STATISTICS = 2,
	SO_STATISTICS = 3,
	VIDEO_DECODE_STATISTICS = 4,
	COPY_QUEUE_TIMESTAMP = 5,
	PIPELINE_STATISTICS1 = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_query_type ]]
QUERY_TYPE :: enum i32 {
	OCCLUSION = 0,
	BINARY_OCCLUSION = 1,
	TIMESTAMP = 2,
	PIPELINE_STATISTICS = 3,
	SO_STATISTICS_STREAM0 = 4,
	SO_STATISTICS_STREAM1 = 5,
	SO_STATISTICS_STREAM2 = 6,
	SO_STATISTICS_STREAM3 = 7,
	VIDEO_DECODE_STATISTICS = 8,
	PIPELINE_STATISTICS1 = 10,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_range ]]
RANGE :: struct {
	Begin: uintptr,
	End: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_range_uint64 ]]
RANGE_UINT64 :: struct {
	Begin: u64,
	End: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_rasterizer_desc ]]
RASTERIZER_DESC :: struct {
	FillMode: FILL_MODE,
	CullMode: CULL_MODE,
	FrontCounterClockwise: BOOL,
	DepthBias: i32,
	DepthBiasClamp: f32,
	SlopeScaledDepthBias: f32,
	DepthClipEnable: BOOL,
	MultisampleEnable: BOOL,
	AntialiasedLineEnable: BOOL,
	ForcedSampleCount: u32,
	ConservativeRaster: CONSERVATIVE_RASTERIZATION_MODE,
}

RASTERIZER_DESC1 :: struct {
	FillMode: FILL_MODE,
	CullMode: CULL_MODE,
	FrontCounterClockwise: BOOL,
	DepthBias: f32,
	DepthBiasClamp: f32,
	SlopeScaledDepthBias: f32,
	DepthClipEnable: BOOL,
	MultisampleEnable: BOOL,
	AntialiasedLineEnable: BOOL,
	ForcedSampleCount: u32,
	ConservativeRaster: CONSERVATIVE_RASTERIZATION_MODE,
}

RASTERIZER_DESC2 :: struct {
	FillMode: FILL_MODE,
	CullMode: CULL_MODE,
	FrontCounterClockwise: BOOL,
	DepthBias: f32,
	DepthBiasClamp: f32,
	SlopeScaledDepthBias: f32,
	DepthClipEnable: BOOL,
	LineRasterizationMode: LINE_RASTERIZATION_MODE,
	ForcedSampleCount: u32,
	ConservativeRaster: CONSERVATIVE_RASTERIZATION_MODE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_ray_flags ]]
RAY_FLAGS :: distinct bit_set[enum {
	FORCE_OPAQUE = 0,
	FORCE_NON_OPAQUE = 1,
	ACCEPT_FIRST_HIT_AND_END_SEARCH = 2,
	SKIP_CLOSEST_HIT_SHADER = 3,
	CULL_BACK_FACING_TRIANGLES = 4,
	CULL_FRONT_FACING_TRIANGLES = 5,
	CULL_OPAQUE = 6,
	CULL_NON_OPAQUE = 7,
	SKIP_TRIANGLES = 8,
	SKIP_PROCEDURAL_PRIMITIVES = 9,
}; i32]
RAY_FLAGS_NONE :: transmute(RAY_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_aabb ]]
RAYTRACING_AABB :: struct {
	MinX: f32,
	MinY: f32,
	MinZ: f32,
	MaxX: f32,
	MaxY: f32,
	MaxZ: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_build_flags ]]
RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS :: distinct bit_set[enum {
	ALLOW_UPDATE = 0,
	ALLOW_COMPACTION = 1,
	PREFER_FAST_TRACE = 2,
	PREFER_FAST_BUILD = 3,
	MINIMIZE_MEMORY = 4,
	PERFORM_UPDATE = 5,
}; i32]
RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS_NONE :: transmute(RAYTRACING_ACCELERATION_STRUCTURE_BUILD_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_copy_mode ]]
RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE :: enum i32 {
	CLONE = 0,
	COMPACT = 1,
	VISUALIZATION_DECODE_FOR_TOOLS = 2,
	SERIALIZE = 3,
	DESERIALIZE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_compacted_size_desc ]]
RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_COMPACTED_SIZE_DESC :: struct {
	CompactedSizeInBytes: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_current_size_desc ]]
RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_CURRENT_SIZE_DESC :: struct {
	CurrentSizeInBytes: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_desc ]]
RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_DESC :: struct {
	DestBuffer: u64,
	InfoType: RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_serialization_desc ]]
RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_SERIALIZATION_DESC :: struct {
	SerializedSizeInBytes: u64,
	NumBottomLevelAccelerationStructurePointers: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_tools_visualization_desc ]]
RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TOOLS_VISUALIZATION_DESC :: struct {
	DecodedSizeInBytes: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_postbuild_info_type ]]
RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_TYPE :: enum i32 {
	COMPACTED_SIZE = 0,
	TOOLS_VISUALIZATION = 1,
	SERIALIZATION = 2,
	CURRENT_SIZE = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_prebuild_info ]]
RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO :: struct {
	ResultDataMaxSizeInBytes: u64,
	ScratchDataSizeInBytes: u64,
	UpdateScratchDataSizeInBytes: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_acceleration_structure_srv ]]
RAYTRACING_ACCELERATION_STRUCTURE_SRV :: struct {
	Location: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_acceleration_structure_type ]]
RAYTRACING_ACCELERATION_STRUCTURE_TYPE :: enum i32 {
	TOP_LEVEL = 0,
	BOTTOM_LEVEL = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_aabbs_desc ]]
RAYTRACING_GEOMETRY_AABBS_DESC :: struct {
	AABBCount: u64,
	AABBs: GPU_VIRTUAL_ADDRESS_AND_STRIDE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_desc ]]
RAYTRACING_GEOMETRY_DESC :: struct {
	Type: RAYTRACING_GEOMETRY_TYPE,
	Flags: RAYTRACING_GEOMETRY_FLAGS,
	using _: struct #raw_union {
		Triangles: RAYTRACING_GEOMETRY_TRIANGLES_DESC,
		AABBs: RAYTRACING_GEOMETRY_AABBS_DESC,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_geometry_flags ]]
RAYTRACING_GEOMETRY_FLAGS :: distinct bit_set[enum {
	OPAQUE = 0,
	NO_DUPLICATE_ANYHIT_INVOCATION = 1,
}; i32]
RAYTRACING_GEOMETRY_FLAGS_NONE :: transmute(RAYTRACING_GEOMETRY_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_triangles_desc ]]
RAYTRACING_GEOMETRY_TRIANGLES_DESC :: struct {
	Transform3x4: u64,
	IndexFormat: dxgi.FORMAT,
	VertexFormat: dxgi.FORMAT,
	IndexCount: u32,
	VertexCount: u32,
	IndexBuffer: u64,
	VertexBuffer: GPU_VIRTUAL_ADDRESS_AND_STRIDE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_geometry_type ]]
RAYTRACING_GEOMETRY_TYPE :: enum i32 {
	TRIANGLES = 0,
	PROCEDURAL_PRIMITIVE_AABBS = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_instance_desc ]]
RAYTRACING_INSTANCE_DESC :: struct {
	Transform: [12]f32,
	using _: bit_field u32 {
		InstanceID: u32 | 24,
		InstanceMask: u32 | 8,
	},
	using _: bit_field u32 {
		InstanceContributionToHitGroupIndex: u32 | 24,
		Flags: u32 | 8,
	},
	AccelerationStructure: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_instance_flags ]]
RAYTRACING_INSTANCE_FLAGS :: distinct bit_set[enum {
	TRIANGLE_CULL_DISABLE = 0,
	TRIANGLE_FRONT_COUNTERCLOCKWISE = 1,
	FORCE_OPAQUE = 2,
	FORCE_NON_OPAQUE = 3,
}; i32]
RAYTRACING_INSTANCE_FLAGS_NONE :: transmute(RAYTRACING_INSTANCE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_pipeline_config ]]
RAYTRACING_PIPELINE_CONFIG :: struct {
	MaxTraceRecursionDepth: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_pipeline_config1 ]]
RAYTRACING_PIPELINE_CONFIG1 :: struct {
	MaxTraceRecursionDepth: u32,
	Flags: RAYTRACING_PIPELINE_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_pipeline_flags ]]
RAYTRACING_PIPELINE_FLAGS :: distinct bit_set[enum {
	SKIP_TRIANGLES = 8,
	SKIP_PROCEDURAL_PRIMITIVES = 9,
}; i32]
RAYTRACING_PIPELINE_FLAGS_NONE :: transmute(RAYTRACING_PIPELINE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_raytracing_shader_config ]]
RAYTRACING_SHADER_CONFIG :: struct {
	MaxPayloadSizeInBytes: u32,
	MaxAttributeSizeInBytes: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_raytracing_tier ]]
RAYTRACING_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1_0 = 10,
	_1_1 = 11,
}

RECREATE_AT_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1 = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access ]]
RENDER_PASS_BEGINNING_ACCESS :: struct {
	Type: RENDER_PASS_BEGINNING_ACCESS_TYPE,
	using _: struct #raw_union {
		Clear: RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS,
		PreserveLocal: RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_beginning_access_clear_parameters ]]
RENDER_PASS_BEGINNING_ACCESS_CLEAR_PARAMETERS :: struct {
	ClearValue: CLEAR_VALUE,
}

RENDER_PASS_BEGINNING_ACCESS_PRESERVE_LOCAL_PARAMETERS :: struct {
	AdditionalWidth: u32,
	AdditionalHeight: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_beginning_access_type ]]
RENDER_PASS_BEGINNING_ACCESS_TYPE :: enum i32 {
	DISCARD = 0,
	PRESERVE = 1,
	CLEAR = 2,
	NO_ACCESS = 3,
	PRESERVE_LOCAL_RENDER = 4,
	PRESERVE_LOCAL_SRV = 5,
	PRESERVE_LOCAL_UAV = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_depth_stencil_desc ]]
RENDER_PASS_DEPTH_STENCIL_DESC :: struct {
	cpuDescriptor: CPU_DESCRIPTOR_HANDLE,
	DepthBeginningAccess: RENDER_PASS_BEGINNING_ACCESS,
	StencilBeginningAccess: RENDER_PASS_BEGINNING_ACCESS,
	DepthEndingAccess: RENDER_PASS_ENDING_ACCESS,
	StencilEndingAccess: RENDER_PASS_ENDING_ACCESS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access ]]
RENDER_PASS_ENDING_ACCESS :: struct {
	Type: RENDER_PASS_ENDING_ACCESS_TYPE,
	using _: struct #raw_union {
		Resolve: RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS,
		PreserveLocal: RENDER_PASS_ENDING_ACCESS_PRESERVE_LOCAL_PARAMETERS,
	},
}

RENDER_PASS_ENDING_ACCESS_PRESERVE_LOCAL_PARAMETERS :: struct {
	AdditionalWidth: u32,
	AdditionalHeight: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access_resolve_parameters ]]
RENDER_PASS_ENDING_ACCESS_RESOLVE_PARAMETERS :: struct {
	pSrcResource: ^IResource,
	pDstResource: ^IResource,
	SubresourceCount: u32,
	pSubresourceParameters: ^RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS,
	Format: dxgi.FORMAT,
	ResolveMode: RESOLVE_MODE,
	PreserveResolveSource: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_ending_access_resolve_subresource_parameters ]]
RENDER_PASS_ENDING_ACCESS_RESOLVE_SUBRESOURCE_PARAMETERS :: struct {
	SrcSubresource: u32,
	DstSubresource: u32,
	DstX: u32,
	DstY: u32,
	SrcRect: RECT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_ending_access_type ]]
RENDER_PASS_ENDING_ACCESS_TYPE :: enum i32 {
	DISCARD = 0,
	PRESERVE = 1,
	RESOLVE = 2,
	NO_ACCESS = 3,
	PRESERVE_LOCAL_RENDER = 4,
	PRESERVE_LOCAL_SRV = 5,
	PRESERVE_LOCAL_UAV = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_flags ]]
RENDER_PASS_FLAGS :: distinct bit_set[enum {
	ALLOW_UAV_WRITES = 0,
	SUSPENDING_PASS = 1,
	RESUMING_PASS = 2,
	BIND_READ_ONLY_DEPTH = 3,
	BIND_READ_ONLY_STENCIL = 4,
}; i32]
RENDER_PASS_FLAGS_NONE :: transmute(RENDER_PASS_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_pass_render_target_desc ]]
RENDER_PASS_RENDER_TARGET_DESC :: struct {
	cpuDescriptor: CPU_DESCRIPTOR_HANDLE,
	BeginningAccess: RENDER_PASS_BEGINNING_ACCESS,
	EndingAccess: RENDER_PASS_ENDING_ACCESS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_render_pass_tier ]]
RENDER_PASS_TIER :: enum i32 {
	_0 = 0,
	_1 = 1,
	_2 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_target_blend_desc ]]
RENDER_TARGET_BLEND_DESC :: struct {
	BlendEnable: BOOL,
	LogicOpEnable: BOOL,
	SrcBlend: BLEND,
	DestBlend: BLEND,
	BlendOp: BLEND_OP,
	SrcBlendAlpha: BLEND,
	DestBlendAlpha: BLEND,
	BlendOpAlpha: BLEND_OP,
	LogicOp: LOGIC_OP,
	RenderTargetWriteMask: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_render_target_view_desc ]]
RENDER_TARGET_VIEW_DESC :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: RTV_DIMENSION,
	using _: struct #raw_union {
		Buffer: BUFFER_RTV,
		Texture1D: TEX1D_RTV,
		Texture1DArray: TEX1D_ARRAY_RTV,
		Texture2D: TEX2D_RTV,
		Texture2DArray: TEX2D_ARRAY_RTV,
		Texture2DMS: TEX2DMS_RTV,
		Texture2DMSArray: TEX2DMS_ARRAY_RTV,
		Texture3D: TEX3D_RTV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_residency_flags ]]
RESIDENCY_FLAGS :: distinct bit_set[enum {
	DENY_OVERBUDGET = 0,
}; i32]
RESIDENCY_FLAGS_NONE :: transmute(RESIDENCY_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_residency_priority ]]
RESIDENCY_PRIORITY :: enum i32 {
	MINIMUM = 671088640,
	LOW = 1342177280,
	NORMAL = 2013265920,
	HIGH = -1610547200,
	MAXIMUM = -939524096,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resolve_mode ]]
RESOLVE_MODE :: enum i32 {
	DECOMPRESS = 0,
	MIN = 1,
	MAX = 2,
	AVERAGE = 3,
	ENCODE_SAMPLER_FEEDBACK = 4,
	DECODE_SAMPLER_FEEDBACK = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_aliasing_barrier ]]
RESOURCE_ALIASING_BARRIER :: struct {
	pResourceBefore: ^IResource,
	pResourceAfter: ^IResource,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_allocation_info ]]
RESOURCE_ALLOCATION_INFO :: struct {
	SizeInBytes: u64,
	Alignment: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_allocation_info1 ]]
RESOURCE_ALLOCATION_INFO1 :: struct {
	Offset: u64,
	Alignment: u64,
	SizeInBytes: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_barrier ]]
RESOURCE_BARRIER :: struct {
	Type: RESOURCE_BARRIER_TYPE,
	Flags: RESOURCE_BARRIER_FLAGS,
	using _: struct #raw_union {
		Transition: RESOURCE_TRANSITION_BARRIER,
		Aliasing: RESOURCE_ALIASING_BARRIER,
		UAV: RESOURCE_UAV_BARRIER,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_barrier_flags ]]
RESOURCE_BARRIER_FLAGS :: distinct bit_set[enum {
	BEGIN_ONLY = 0,
	END_ONLY = 1,
}; i32]
RESOURCE_BARRIER_FLAGS_NONE :: transmute(RESOURCE_BARRIER_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_barrier_type ]]
RESOURCE_BARRIER_TYPE :: enum i32 {
	TRANSITION = 0,
	ALIASING = 1,
	UAV = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_binding_tier ]]
RESOURCE_BINDING_TIER :: enum i32 {
	_1 = 1,
	_2 = 2,
	_3 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc ]]
RESOURCE_DESC :: struct {
	Dimension: RESOURCE_DIMENSION,
	Alignment: u64,
	Width: u64,
	Height: u32,
	DepthOrArraySize: u16,
	MipLevels: u16,
	Format: dxgi.FORMAT,
	SampleDesc: dxgi.SAMPLE_DESC,
	Layout: TEXTURE_LAYOUT,
	Flags: RESOURCE_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_desc1 ]]
RESOURCE_DESC1 :: struct {
	Dimension: RESOURCE_DIMENSION,
	Alignment: u64,
	Width: u64,
	Height: u32,
	DepthOrArraySize: u16,
	MipLevels: u16,
	Format: dxgi.FORMAT,
	SampleDesc: dxgi.SAMPLE_DESC,
	Layout: TEXTURE_LAYOUT,
	Flags: RESOURCE_FLAGS,
	SamplerFeedbackMipRegion: MIP_REGION,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_dimension ]]
RESOURCE_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	BUFFER = 1,
	TEXTURE1D = 2,
	TEXTURE2D = 3,
	TEXTURE3D = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_flags ]]
RESOURCE_FLAGS :: distinct bit_set[enum {
	ALLOW_RENDER_TARGET = 0,
	ALLOW_DEPTH_STENCIL = 1,
	ALLOW_UNORDERED_ACCESS = 2,
	DENY_SHADER_RESOURCE = 3,
	ALLOW_CROSS_ADAPTER = 4,
	ALLOW_SIMULTANEOUS_ACCESS = 5,
	VIDEO_DECODE_REFERENCE_ONLY = 6,
	VIDEO_ENCODE_REFERENCE_ONLY = 7,
	RAYTRACING_ACCELERATION_STRUCTURE = 8,
}; i32]
RESOURCE_FLAGS_NONE :: transmute(RESOURCE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_heap_tier ]]
RESOURCE_HEAP_TIER :: enum i32 {
	_1 = 1,
	_2 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_resource_states ]]
RESOURCE_STATES :: distinct bit_set[enum {
	VERTEX_AND_CONSTANT_BUFFER = 0,
	INDEX_BUFFER = 1,
	RENDER_TARGET = 2,
	UNORDERED_ACCESS = 3,
	DEPTH_WRITE = 4,
	DEPTH_READ = 5,
	NON_PIXEL_SHADER_RESOURCE = 6,
	PIXEL_SHADER_RESOURCE = 7,
	STREAM_OUT = 8,
	INDIRECT_ARGUMENT = 9,
	COPY_DEST = 10,
	COPY_SOURCE = 11,
	RESOLVE_DEST = 12,
	RESOLVE_SOURCE = 13,
	RAYTRACING_ACCELERATION_STRUCTURE = 22,
	SHADING_RATE_SOURCE = 24,
	RESERVED_INTERNAL_8000 = 15,
	RESERVED_INTERNAL_4000 = 14,
	RESERVED_INTERNAL_100000 = 20,
	RESERVED_INTERNAL_40000000 = 30,
	RESERVED_INTERNAL_80000000 = 31,
	PREDICATION = 9,
	VIDEO_DECODE_READ = 16,
	VIDEO_DECODE_WRITE = 17,
	VIDEO_PROCESS_READ = 18,
	VIDEO_PROCESS_WRITE = 19,
	VIDEO_ENCODE_READ = 21,
	VIDEO_ENCODE_WRITE = 23,
}; i32]
RESOURCE_STATES_COMMON :: transmute(RESOURCE_STATES)i32(0)
RESOURCE_STATES_GENERIC_READ :: transmute(RESOURCE_STATES)i32(2755)
RESOURCE_STATES_ALL_SHADER_RESOURCE :: transmute(RESOURCE_STATES)i32(192)
RESOURCE_STATES_PRESENT :: transmute(RESOURCE_STATES)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_transition_barrier ]]
RESOURCE_TRANSITION_BARRIER :: struct {
	pResource: ^IResource,
	Subresource: u32,
	StateBefore: RESOURCE_STATES,
	StateAfter: RESOURCE_STATES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_resource_uav_barrier ]]
RESOURCE_UAV_BARRIER :: struct {
	pResource: ^IResource,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags ]]
RLDO_FLAGS :: distinct bit_set[enum {
	SUMMARY = 0,
	DETAIL = 1,
	IGNORE_INTERNAL = 2,
}; i32]
RLDO_FLAGS_NONE :: transmute(RLDO_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_constants ]]
ROOT_CONSTANTS :: struct {
	ShaderRegister: u32,
	RegisterSpace: u32,
	Num32BitValues: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_descriptor ]]
ROOT_DESCRIPTOR :: struct {
	ShaderRegister: u32,
	RegisterSpace: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_root_descriptor_flags ]]
ROOT_DESCRIPTOR_FLAGS :: distinct bit_set[enum {
	DATA_VOLATILE = 1,
	DATA_STATIC_WHILE_SET_AT_EXECUTE = 2,
	DATA_STATIC = 3,
}; i32]
ROOT_DESCRIPTOR_FLAGS_NONE :: transmute(ROOT_DESCRIPTOR_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_descriptor_table ]]
ROOT_DESCRIPTOR_TABLE :: struct {
	NumDescriptorRanges: u32,
	pDescriptorRanges: ^DESCRIPTOR_RANGE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_descriptor_table1 ]]
ROOT_DESCRIPTOR_TABLE1 :: struct {
	NumDescriptorRanges: u32,
	pDescriptorRanges: ^DESCRIPTOR_RANGE1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_descriptor1 ]]
ROOT_DESCRIPTOR1 :: struct {
	ShaderRegister: u32,
	RegisterSpace: u32,
	Flags: ROOT_DESCRIPTOR_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_parameter ]]
ROOT_PARAMETER :: struct {
	ParameterType: ROOT_PARAMETER_TYPE,
	using _: struct #raw_union {
		DescriptorTable: ROOT_DESCRIPTOR_TABLE,
		Constants: ROOT_CONSTANTS,
		Descriptor: ROOT_DESCRIPTOR,
	},
	ShaderVisibility: SHADER_VISIBILITY,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_root_parameter_type ]]
ROOT_PARAMETER_TYPE :: enum i32 {
	DESCRIPTOR_TABLE = 0,
	_32BIT_CONSTANTS = 1,
	CBV = 2,
	SRV = 3,
	UAV = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_parameter1 ]]
ROOT_PARAMETER1 :: struct {
	ParameterType: ROOT_PARAMETER_TYPE,
	using _: struct #raw_union {
		DescriptorTable: ROOT_DESCRIPTOR_TABLE1,
		Constants: ROOT_CONSTANTS,
		Descriptor: ROOT_DESCRIPTOR1,
	},
	ShaderVisibility: SHADER_VISIBILITY,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_signature_desc ]]
ROOT_SIGNATURE_DESC :: struct {
	NumParameters: u32,
	pParameters: ^ROOT_PARAMETER,
	NumStaticSamplers: u32,
	pStaticSamplers: ^STATIC_SAMPLER_DESC,
	Flags: ROOT_SIGNATURE_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_root_signature_desc1 ]]
ROOT_SIGNATURE_DESC1 :: struct {
	NumParameters: u32,
	pParameters: ^ROOT_PARAMETER1,
	NumStaticSamplers: u32,
	pStaticSamplers: ^STATIC_SAMPLER_DESC,
	Flags: ROOT_SIGNATURE_FLAGS,
}

ROOT_SIGNATURE_DESC2 :: struct {
	NumParameters: u32,
	pParameters: ^ROOT_PARAMETER1,
	NumStaticSamplers: u32,
	pStaticSamplers: ^STATIC_SAMPLER_DESC1,
	Flags: ROOT_SIGNATURE_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_root_signature_flags ]]
ROOT_SIGNATURE_FLAGS :: distinct bit_set[enum {
	ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT = 0,
	DENY_VERTEX_SHADER_ROOT_ACCESS = 1,
	DENY_HULL_SHADER_ROOT_ACCESS = 2,
	DENY_DOMAIN_SHADER_ROOT_ACCESS = 3,
	DENY_GEOMETRY_SHADER_ROOT_ACCESS = 4,
	DENY_PIXEL_SHADER_ROOT_ACCESS = 5,
	ALLOW_STREAM_OUTPUT = 6,
	LOCAL_ROOT_SIGNATURE = 7,
	DENY_AMPLIFICATION_SHADER_ROOT_ACCESS = 8,
	DENY_MESH_SHADER_ROOT_ACCESS = 9,
	CBV_SRV_UAV_HEAP_DIRECTLY_INDEXED = 10,
	SAMPLER_HEAP_DIRECTLY_INDEXED = 11,
}; i32]
ROOT_SIGNATURE_FLAGS_NONE :: transmute(ROOT_SIGNATURE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_rt_format_array ]]
RT_FORMAT_ARRAY :: struct {
	RTFormats: [8]dxgi.FORMAT,
	NumRenderTargets: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_rtv_dimension ]]
RTV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	BUFFER = 1,
	TEXTURE1D = 2,
	TEXTURE1DARRAY = 3,
	TEXTURE2D = 4,
	TEXTURE2DARRAY = 5,
	TEXTURE2DMS = 6,
	TEXTURE2DMSARRAY = 7,
	TEXTURE3D = 8,
}

SAMPLE_MASK :: struct {
	SampleMask: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_sample_position ]]
SAMPLE_POSITION :: struct {
	X: i8,
	Y: i8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_sampler_desc ]]
SAMPLER_DESC :: struct {
	Filter: FILTER,
	AddressU: TEXTURE_ADDRESS_MODE,
	AddressV: TEXTURE_ADDRESS_MODE,
	AddressW: TEXTURE_ADDRESS_MODE,
	MipLODBias: f32,
	MaxAnisotropy: u32,
	ComparisonFunc: COMPARISON_FUNC,
	BorderColor: [4]f32,
	MinLOD: f32,
	MaxLOD: f32,
}

SAMPLER_DESC2 :: struct {
	Filter: FILTER,
	AddressU: TEXTURE_ADDRESS_MODE,
	AddressV: TEXTURE_ADDRESS_MODE,
	AddressW: TEXTURE_ADDRESS_MODE,
	MipLODBias: f32,
	MaxAnisotropy: u32,
	ComparisonFunc: COMPARISON_FUNC,
	using _: struct #raw_union {
		FloatBorderColor: [4]f32,
		UintBorderColor: [4]u32,
	},
	MinLOD: f32,
	MaxLOD: f32,
	Flags: SAMPLER_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_sampler_feedback_tier ]]
SAMPLER_FEEDBACK_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_0_9 = 90,
	_1_0 = 100,
}

SAMPLER_FLAGS :: distinct bit_set[enum {
	UINT_BORDER_COLOR = 0,
	NON_NORMALIZED_COORDINATES = 1,
}; i32]
SAMPLER_FLAGS_NONE :: transmute(SAMPLER_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_serialized_data_driver_matching_identifier ]]
SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER :: struct {
	DriverOpaqueGUID: GUID,
	DriverOpaqueVersioningData: [16]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_serialized_data_type ]]
SERIALIZED_DATA_TYPE :: enum i32 {
	RAYTRACING_ACCELERATION_STRUCTURE = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_serialized_raytracing_acceleration_structure_header ]]
SERIALIZED_RAYTRACING_ACCELERATION_STRUCTURE_HEADER :: struct {
	DriverMatchingIdentifier: SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER,
	SerializedSizeInBytesIncludingHeader: u64,
	DeserializedSizeInBytes: u64,
	NumBottomLevelAccelerationStructurePointersAfterHeader: u64,
}

SET_GENERIC_PIPELINE_DESC :: struct {
	ProgramIdentifier: PROGRAM_IDENTIFIER,
}

SET_PROGRAM_DESC :: struct {
	Type: PROGRAM_TYPE,
	using _: struct #raw_union {
		GenericPipeline: SET_GENERIC_PIPELINE_DESC,
		RaytracingPipeline: SET_RAYTRACING_PIPELINE_DESC,
		WorkGraph: SET_WORK_GRAPH_DESC,
	},
}

SET_RAYTRACING_PIPELINE_DESC :: struct {
	ProgramIdentifier: PROGRAM_IDENTIFIER,
}

SET_WORK_GRAPH_DESC :: struct {
	ProgramIdentifier: PROGRAM_IDENTIFIER,
	Flags: SET_WORK_GRAPH_FLAGS,
	BackingMemory: GPU_VIRTUAL_ADDRESS_RANGE,
	NodeLocalRootArgumentsTable: GPU_VIRTUAL_ADDRESS_RANGE_AND_STRIDE,
}

SET_WORK_GRAPH_FLAGS :: distinct bit_set[enum {
	INITIALIZE = 0,
}; i32]
SET_WORK_GRAPH_FLAGS_NONE :: transmute(SET_WORK_GRAPH_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_buffer_desc ]]
SHADER_BUFFER_DESC :: struct {
	Name: PSTR,
	Type: d3d.CBUFFER_TYPE,
	Variables: u32,
	Size: u32,
	uFlags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_bytecode ]]
SHADER_BYTECODE :: struct {
	pShaderBytecode: rawptr,
	BytecodeLength: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_control_flags ]]
SHADER_CACHE_CONTROL_FLAGS :: distinct bit_set[enum {
	DISABLE = 0,
	ENABLE = 1,
	CLEAR = 2,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_flags ]]
SHADER_CACHE_FLAGS :: distinct bit_set[enum {
	DRIVER_VERSIONED = 0,
	USE_WORKING_DIR = 1,
}; i32]
SHADER_CACHE_FLAGS_NONE :: transmute(SHADER_CACHE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_kind_flags ]]
SHADER_CACHE_KIND_FLAGS :: distinct bit_set[enum {
	IMPLICIT_D3D_CACHE_FOR_DRIVER = 0,
	IMPLICIT_D3D_CONVERSIONS = 1,
	IMPLICIT_DRIVER_MANAGED = 2,
	APPLICATION_MANAGED = 3,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_mode ]]
SHADER_CACHE_MODE :: enum i32 {
	MEMORY = 0,
	DISK = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_cache_session_desc ]]
SHADER_CACHE_SESSION_DESC :: struct {
	Identifier: GUID,
	Mode: SHADER_CACHE_MODE,
	Flags: SHADER_CACHE_FLAGS,
	MaximumInMemoryCacheSizeBytes: u32,
	MaximumInMemoryCacheEntries: u32,
	MaximumValueFileSizeBytes: u32,
	Version: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_cache_support_flags ]]
SHADER_CACHE_SUPPORT_FLAGS :: distinct bit_set[enum {
	SINGLE_PSO = 0,
	LIBRARY = 1,
	AUTOMATIC_INPROC_CACHE = 2,
	AUTOMATIC_DISK_CACHE = 3,
	DRIVER_MANAGED_CACHE = 4,
	SHADER_CONTROL_CLEAR = 5,
	SHADER_SESSION_DELETE = 6,
}; i32]
SHADER_CACHE_SUPPORT_FLAGS_NONE :: transmute(SHADER_CACHE_SUPPORT_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_component_mapping ]]
SHADER_COMPONENT_MAPPING :: enum i32 {
	ROM_MEMORY_COMPONENT_0 = 0,
	ROM_MEMORY_COMPONENT_1 = 1,
	ROM_MEMORY_COMPONENT_2 = 2,
	ROM_MEMORY_COMPONENT_3 = 3,
	ORCE_VALUE_0 = 4,
	ORCE_VALUE_1 = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_desc ]]
SHADER_DESC :: struct {
	Version: u32,
	Creator: PSTR,
	Flags: u32,
	ConstantBuffers: u32,
	BoundResources: u32,
	InputParameters: u32,
	OutputParameters: u32,
	InstructionCount: u32,
	TempRegisterCount: u32,
	TempArrayCount: u32,
	DefCount: u32,
	DclCount: u32,
	TextureNormalInstructions: u32,
	TextureLoadInstructions: u32,
	TextureCompInstructions: u32,
	TextureBiasInstructions: u32,
	TextureGradientInstructions: u32,
	FloatInstructionCount: u32,
	IntInstructionCount: u32,
	UintInstructionCount: u32,
	StaticFlowControlCount: u32,
	DynamicFlowControlCount: u32,
	MacroInstructionCount: u32,
	ArrayInstructionCount: u32,
	CutInstructionCount: u32,
	EmitInstructionCount: u32,
	GSOutputTopology: d3d.PRIMITIVE_TOPOLOGY,
	GSMaxOutputVertexCount: u32,
	InputPrimitive: d3d.PRIMITIVE,
	PatchConstantParameters: u32,
	cGSInstanceCount: u32,
	cControlPoints: u32,
	HSOutputPrimitive: d3d.TESSELLATOR_OUTPUT_PRIMITIVE,
	HSPartitioning: d3d.TESSELLATOR_PARTITIONING,
	TessellatorDomain: d3d.TESSELLATOR_DOMAIN,
	cBarrierInstructions: u32,
	cInterlockedInstructions: u32,
	cTextureStoreInstructions: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_input_bind_desc ]]
SHADER_INPUT_BIND_DESC :: struct {
	Name: PSTR,
	Type: d3d.SHADER_INPUT_TYPE,
	BindPoint: u32,
	BindCount: u32,
	uFlags: u32,
	ReturnType: d3d.RESOURCE_RETURN_TYPE,
	Dimension: d3d.SRV_DIMENSION,
	NumSamples: u32,
	Space: u32,
	uID: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_min_precision_support ]]
SHADER_MIN_PRECISION_SUPPORT :: distinct bit_set[enum {
	_10_BIT = 0,
	_16_BIT = 1,
}; i32]
SHADER_MIN_PRECISION_SUPPORT_NONE :: transmute(SHADER_MIN_PRECISION_SUPPORT)i32(0)

SHADER_NODE :: struct {
	Shader: PWSTR,
	OverridesType: NODE_OVERRIDES_TYPE,
	using _: struct #raw_union {
		pBroadcastingLaunchOverrides: ^BROADCASTING_LAUNCH_OVERRIDES,
		pCoalescingLaunchOverrides: ^COALESCING_LAUNCH_OVERRIDES,
		pThreadLaunchOverrides: ^THREAD_LAUNCH_OVERRIDES,
		pCommonComputeNodeOverrides: ^COMMON_COMPUTE_NODE_OVERRIDES,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_shader_resource_view_desc ]]
SHADER_RESOURCE_VIEW_DESC :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: SRV_DIMENSION,
	Shader4ComponentMapping: u32,
	using _: struct #raw_union {
		Buffer: BUFFER_SRV,
		Texture1D: TEX1D_SRV,
		Texture1DArray: TEX1D_ARRAY_SRV,
		Texture2D: TEX2D_SRV,
		Texture2DArray: TEX2D_ARRAY_SRV,
		Texture2DMS: TEX2DMS_SRV,
		Texture2DMSArray: TEX2DMS_ARRAY_SRV,
		Texture3D: TEX3D_SRV,
		TextureCube: TEXCUBE_SRV,
		TextureCubeArray: TEXCUBE_ARRAY_SRV,
		RaytracingAccelerationStructure: RAYTRACING_ACCELERATION_STRUCTURE_SRV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_type_desc ]]
SHADER_TYPE_DESC :: struct {
	Class: d3d.SHADER_VARIABLE_CLASS,
	Type: d3d.SHADER_VARIABLE_TYPE,
	Rows: u32,
	Columns: u32,
	Elements: u32,
	Members: u32,
	Offset: u32,
	Name: PSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_shader_variable_desc ]]
SHADER_VARIABLE_DESC :: struct {
	Name: PSTR,
	StartOffset: u32,
	Size: u32,
	uFlags: u32,
	DefaultValue: rawptr,
	StartTexture: u32,
	TextureSize: u32,
	StartSampler: u32,
	SamplerSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ne-d3d12shader-d3d12_shader_version_type ]]
SHADER_VERSION_TYPE :: enum i32 {
	PIXEL_SHADER = 0,
	VERTEX_SHADER = 1,
	GEOMETRY_SHADER = 2,
	HULL_SHADER = 3,
	DOMAIN_SHADER = 4,
	COMPUTE_SHADER = 5,
	LIBRARY = 6,
	RAY_GENERATION_SHADER = 7,
	INTERSECTION_SHADER = 8,
	ANY_HIT_SHADER = 9,
	CLOSEST_HIT_SHADER = 10,
	MISS_SHADER = 11,
	CALLABLE_SHADER = 12,
	MESH_SHADER = 13,
	AMPLIFICATION_SHADER = 14,
	NODE_SHADER = 15,
	RESERVED0 = 65520,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shader_visibility ]]
SHADER_VISIBILITY :: enum i32 {
	ALL = 0,
	VERTEX = 1,
	HULL = 2,
	DOMAIN = 3,
	GEOMETRY = 4,
	PIXEL = 5,
	AMPLIFICATION = 6,
	MESH = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shading_rate ]]
SHADING_RATE :: enum i32 {
	_1X1 = 0,
	_1X2 = 1,
	_2X1 = 4,
	_2X2 = 5,
	_2X4 = 6,
	_4X2 = 9,
	_4X4 = 10,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shading_rate_combiner ]]
SHADING_RATE_COMBINER :: enum i32 {
	PASSTHROUGH = 0,
	OVERRIDE = 1,
	MIN = 2,
	MAX = 3,
	SUM = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_shared_resource_compatibility_tier ]]
SHARED_RESOURCE_COMPATIBILITY_TIER :: enum i32 {
	_0 = 0,
	_1 = 1,
	_2 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/ns-d3d12shader-d3d12_signature_parameter_desc ]]
SIGNATURE_PARAMETER_DESC :: struct {
	SemanticName: PSTR,
	SemanticIndex: u32,
	Register: u32,
	SystemValueType: d3d.NAME,
	ComponentType: d3d.REGISTER_COMPONENT_TYPE,
	Mask: u8,
	ReadWriteMask: u8,
	Stream: u32,
	MinPrecision: d3d.MIN_PRECISION,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_so_declaration_entry ]]
SO_DECLARATION_ENTRY :: struct {
	Stream: u32,
	SemanticName: PSTR,
	SemanticIndex: u32,
	StartComponent: u8,
	ComponentCount: u8,
	OutputSlot: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_srv_dimension ]]
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
	RAYTRACING_ACCELERATION_STRUCTURE = 11,
}

STANDARD_MULTISAMPLE_QUALITY_LEVELS :: enum i32 {
	STANDARD_MULTISAMPLE_PATTERN = -1,
	CENTER_MULTISAMPLE_PATTERN = -2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_state_object_config ]]
STATE_OBJECT_CONFIG :: struct {
	Flags: STATE_OBJECT_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_state_object_desc ]]
STATE_OBJECT_DESC :: struct {
	Type: STATE_OBJECT_TYPE,
	NumSubobjects: u32,
	pSubobjects: ^STATE_SUBOBJECT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_state_object_flags ]]
STATE_OBJECT_FLAGS :: distinct bit_set[enum {
	ALLOW_LOCAL_DEPENDENCIES_ON_EXTERNAL_DEFINITIONS = 0,
	ALLOW_EXTERNAL_DEPENDENCIES_ON_LOCAL_DEFINITIONS = 1,
	ALLOW_STATE_OBJECT_ADDITIONS = 2,
}; i32]
STATE_OBJECT_FLAGS_NONE :: transmute(STATE_OBJECT_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_state_object_type ]]
STATE_OBJECT_TYPE :: enum i32 {
	COLLECTION = 0,
	RAYTRACING_PIPELINE = 3,
	EXECUTABLE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_state_subobject ]]
STATE_SUBOBJECT :: struct {
	Type: STATE_SUBOBJECT_TYPE,
	pDesc: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_state_subobject_type ]]
STATE_SUBOBJECT_TYPE :: enum i32 {
	STATE_OBJECT_CONFIG = 0,
	GLOBAL_ROOT_SIGNATURE = 1,
	LOCAL_ROOT_SIGNATURE = 2,
	NODE_MASK = 3,
	DXIL_LIBRARY = 5,
	EXISTING_COLLECTION = 6,
	SUBOBJECT_TO_EXPORTS_ASSOCIATION = 7,
	DXIL_SUBOBJECT_TO_EXPORTS_ASSOCIATION = 8,
	RAYTRACING_SHADER_CONFIG = 9,
	RAYTRACING_PIPELINE_CONFIG = 10,
	HIT_GROUP = 11,
	RAYTRACING_PIPELINE_CONFIG1 = 12,
	WORK_GRAPH = 13,
	STREAM_OUTPUT = 14,
	BLEND = 15,
	SAMPLE_MASK = 16,
	RASTERIZER = 17,
	DEPTH_STENCIL = 18,
	INPUT_LAYOUT = 19,
	IB_STRIP_CUT_VALUE = 20,
	PRIMITIVE_TOPOLOGY = 21,
	RENDER_TARGET_FORMATS = 22,
	DEPTH_STENCIL_FORMAT = 23,
	SAMPLE_DESC = 24,
	FLAGS = 26,
	DEPTH_STENCIL1 = 27,
	VIEW_INSTANCING = 28,
	GENERIC_PROGRAM = 29,
	DEPTH_STENCIL2 = 30,
	MAX_VALID = 31,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_static_border_color ]]
STATIC_BORDER_COLOR :: enum i32 {
	TRANSPARENT_BLACK = 0,
	OPAQUE_BLACK = 1,
	OPAQUE_WHITE = 2,
	OPAQUE_BLACK_UINT = 3,
	OPAQUE_WHITE_UINT = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_static_sampler_desc ]]
STATIC_SAMPLER_DESC :: struct {
	Filter: FILTER,
	AddressU: TEXTURE_ADDRESS_MODE,
	AddressV: TEXTURE_ADDRESS_MODE,
	AddressW: TEXTURE_ADDRESS_MODE,
	MipLODBias: f32,
	MaxAnisotropy: u32,
	ComparisonFunc: COMPARISON_FUNC,
	BorderColor: STATIC_BORDER_COLOR,
	MinLOD: f32,
	MaxLOD: f32,
	ShaderRegister: u32,
	RegisterSpace: u32,
	ShaderVisibility: SHADER_VISIBILITY,
}

STATIC_SAMPLER_DESC1 :: struct {
	Filter: FILTER,
	AddressU: TEXTURE_ADDRESS_MODE,
	AddressV: TEXTURE_ADDRESS_MODE,
	AddressW: TEXTURE_ADDRESS_MODE,
	MipLODBias: f32,
	MaxAnisotropy: u32,
	ComparisonFunc: COMPARISON_FUNC,
	BorderColor: STATIC_BORDER_COLOR,
	MinLOD: f32,
	MaxLOD: f32,
	ShaderRegister: u32,
	RegisterSpace: u32,
	ShaderVisibility: SHADER_VISIBILITY,
	Flags: SAMPLER_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_stencil_op ]]
STENCIL_OP :: enum i32 {
	KEEP = 1,
	ZERO = 2,
	REPLACE = 3,
	INCR_SAT = 4,
	DECR_SAT = 5,
	INVERT = 6,
	INCR = 7,
	DECR = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_stream_output_buffer_view ]]
STREAM_OUTPUT_BUFFER_VIEW :: struct {
	BufferLocation: u64,
	SizeInBytes: u64,
	BufferFilledSizeLocation: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_stream_output_desc ]]
STREAM_OUTPUT_DESC :: struct {
	pSODeclaration: ^SO_DECLARATION_ENTRY,
	NumEntries: u32,
	pBufferStrides: ^u32,
	NumStrides: u32,
	RasterizedStream: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subobject_to_exports_association ]]
SUBOBJECT_TO_EXPORTS_ASSOCIATION :: struct {
	pSubobjectToAssociate: ^STATE_SUBOBJECT,
	NumExports: u32,
	pExports: ^PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_data ]]
SUBRESOURCE_DATA :: struct {
	pData: rawptr,
	RowPitch: int,
	SlicePitch: int,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_footprint ]]
SUBRESOURCE_FOOTPRINT :: struct {
	Format: dxgi.FORMAT,
	Width: u32,
	Height: u32,
	Depth: u32,
	RowPitch: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_info ]]
SUBRESOURCE_INFO :: struct {
	Offset: u64,
	RowPitch: u32,
	DepthPitch: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_range_uint64 ]]
SUBRESOURCE_RANGE_UINT64 :: struct {
	Subresource: u32,
	Range: RANGE_UINT64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_subresource_tiling ]]
SUBRESOURCE_TILING :: struct {
	WidthInTiles: u32,
	HeightInTiles: u16,
	DepthInTiles: u16,
	StartTileIndexInOverallResource: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_array_dsv ]]
TEX1D_ARRAY_DSV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_array_rtv ]]
TEX1D_ARRAY_RTV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_array_srv ]]
TEX1D_ARRAY_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
	ResourceMinLODClamp: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_array_uav ]]
TEX1D_ARRAY_UAV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_dsv ]]
TEX1D_DSV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_rtv ]]
TEX1D_RTV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_srv ]]
TEX1D_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	ResourceMinLODClamp: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex1d_uav ]]
TEX1D_UAV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_array_dsv ]]
TEX2D_ARRAY_DSV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_array_rtv ]]
TEX2D_ARRAY_RTV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_array_srv ]]
TEX2D_ARRAY_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
	PlaneSlice: u32,
	ResourceMinLODClamp: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_array_uav ]]
TEX2D_ARRAY_UAV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_dsv ]]
TEX2D_DSV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_rtv ]]
TEX2D_RTV :: struct {
	MipSlice: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_srv ]]
TEX2D_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	PlaneSlice: u32,
	ResourceMinLODClamp: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2d_uav ]]
TEX2D_UAV :: struct {
	MipSlice: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_array_dsv ]]
TEX2DMS_ARRAY_DSV :: struct {
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_array_rtv ]]
TEX2DMS_ARRAY_RTV :: struct {
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_array_srv ]]
TEX2DMS_ARRAY_SRV :: struct {
	FirstArraySlice: u32,
	ArraySize: u32,
}

TEX2DMS_ARRAY_UAV :: struct {
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_dsv ]]
TEX2DMS_DSV :: struct {
	UnusedField_NothingToDefine: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_rtv ]]
TEX2DMS_RTV :: struct {
	UnusedField_NothingToDefine: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex2dms_srv ]]
TEX2DMS_SRV :: struct {
	UnusedField_NothingToDefine: u32,
}

TEX2DMS_UAV :: struct {
	UnusedField_NothingToDefine: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex3d_rtv ]]
TEX3D_RTV :: struct {
	MipSlice: u32,
	FirstWSlice: u32,
	WSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex3d_srv ]]
TEX3D_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	ResourceMinLODClamp: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tex3d_uav ]]
TEX3D_UAV :: struct {
	MipSlice: u32,
	FirstWSlice: u32,
	WSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_texcube_array_srv ]]
TEXCUBE_ARRAY_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	First2DArrayFace: u32,
	NumCubes: u32,
	ResourceMinLODClamp: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_texcube_srv ]]
TEXCUBE_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	ResourceMinLODClamp: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_address_mode ]]
TEXTURE_ADDRESS_MODE :: enum i32 {
	WRAP = 1,
	MIRROR = 2,
	CLAMP = 3,
	BORDER = 4,
	MIRROR_ONCE = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_texture_barrier ]]
TEXTURE_BARRIER :: struct {
	SyncBefore: BARRIER_SYNC,
	SyncAfter: BARRIER_SYNC,
	AccessBefore: BARRIER_ACCESS,
	AccessAfter: BARRIER_ACCESS,
	LayoutBefore: BARRIER_LAYOUT,
	LayoutAfter: BARRIER_LAYOUT,
	pResource: ^IResource,
	Subresources: BARRIER_SUBRESOURCE_RANGE,
	Flags: TEXTURE_BARRIER_FLAGS,
}

TEXTURE_BARRIER_FLAGS :: distinct bit_set[enum {
	DISCARD = 0,
}; i32]
TEXTURE_BARRIER_FLAGS_NONE :: transmute(TEXTURE_BARRIER_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_texture_copy_location ]]
TEXTURE_COPY_LOCATION :: struct {
	pResource: ^IResource,
	Type: TEXTURE_COPY_TYPE,
	using _: struct #raw_union {
		PlacedFootprint: PLACED_SUBRESOURCE_FOOTPRINT,
		SubresourceIndex: u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_copy_type ]]
TEXTURE_COPY_TYPE :: enum i32 {
	SUBRESOURCE_INDEX = 0,
	PLACED_FOOTPRINT = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_texture_layout ]]
TEXTURE_LAYOUT :: enum i32 {
	UNKNOWN = 0,
	ROW_MAJOR = 1,
	_64KB_UNDEFINED_SWIZZLE = 2,
	_64KB_STANDARD_SWIZZLE = 3,
}

THREAD_LAUNCH_OVERRIDES :: struct {
	pLocalRootArgumentsTableIndex: ^u32,
	pProgramEntry: ^BOOL,
	pNewName: ^NODE_ID,
	pShareInputOf: ^NODE_ID,
	NumOutputOverrides: u32,
	pOutputOverrides: ^NODE_OUTPUT_OVERRIDES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tile_copy_flags ]]
TILE_COPY_FLAGS :: distinct bit_set[enum {
	NO_HAZARD = 0,
	LINEAR_BUFFER_TO_SWIZZLED_TILED_RESOURCE = 1,
	SWIZZLED_TILED_RESOURCE_TO_LINEAR_BUFFER = 2,
}; i32]
TILE_COPY_FLAGS_NONE :: transmute(TILE_COPY_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tile_mapping_flags ]]
TILE_MAPPING_FLAGS :: distinct bit_set[enum {
	NO_HAZARD = 0,
}; i32]
TILE_MAPPING_FLAGS_NONE :: transmute(TILE_MAPPING_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tile_range_flags ]]
TILE_RANGE_FLAGS :: enum i32 {
	NONE = 0,
	NULL = 1,
	SKIP = 2,
	REUSE_SINGLE_TILE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tile_region_size ]]
TILE_REGION_SIZE :: struct {
	NumTiles: u32,
	UseBox: BOOL,
	Width: u32,
	Height: u16,
	Depth: u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tile_shape ]]
TILE_SHAPE :: struct {
	WidthInTexels: u32,
	HeightInTexels: u32,
	DepthInTexels: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_tiled_resource_coordinate ]]
TILED_RESOURCE_COORDINATE :: struct {
	X: u32,
	Y: u32,
	Z: u32,
	Subresource: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tiled_resources_tier ]]
TILED_RESOURCES_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1 = 1,
	_2 = 2,
	_3 = 3,
	_4 = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_tri_state ]]
TRI_STATE :: enum i32 {
	UNKNOWN = -1,
	FALSE = 0,
	TRUE = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_uav_dimension ]]
UAV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	BUFFER = 1,
	TEXTURE1D = 2,
	TEXTURE1DARRAY = 3,
	TEXTURE2D = 4,
	TEXTURE2DARRAY = 5,
	TEXTURE2DMS = 6,
	TEXTURE2DMSARRAY = 7,
	TEXTURE3D = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_unordered_access_view_desc ]]
UNORDERED_ACCESS_VIEW_DESC :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: UAV_DIMENSION,
	using _: struct #raw_union {
		Buffer: BUFFER_UAV,
		Texture1D: TEX1D_UAV,
		Texture1DArray: TEX1D_ARRAY_UAV,
		Texture2D: TEX2D_UAV,
		Texture2DArray: TEX2D_ARRAY_UAV,
		Texture2DMS: TEX2DMS_UAV,
		Texture2DMSArray: TEX2DMS_ARRAY_UAV,
		Texture3D: TEX3D_UAV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_variable_shading_rate_tier ]]
VARIABLE_SHADING_RATE_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1 = 1,
	_2 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_versioned_device_removed_extended_data ]]
VERSIONED_DEVICE_REMOVED_EXTENDED_DATA :: struct {
	Version: DRED_VERSION,
	using _: struct #raw_union {
		Dred_1_0: DEVICE_REMOVED_EXTENDED_DATA,
		Dred_1_1: DEVICE_REMOVED_EXTENDED_DATA1,
		Dred_1_2: DEVICE_REMOVED_EXTENDED_DATA2,
		Dred_1_3: DEVICE_REMOVED_EXTENDED_DATA3,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_versioned_root_signature_desc ]]
VERSIONED_ROOT_SIGNATURE_DESC :: struct {
	Version: ROOT_SIGNATURE_VERSION,
	using _: struct #raw_union {
		Desc_1_0: ROOT_SIGNATURE_DESC,
		Desc_1_1: ROOT_SIGNATURE_DESC1,
		Desc_1_2: ROOT_SIGNATURE_DESC2,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_vertex_buffer_view ]]
VERTEX_BUFFER_VIEW :: struct {
	BufferLocation: u64,
	SizeInBytes: u32,
	StrideInBytes: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_view_instance_location ]]
VIEW_INSTANCE_LOCATION :: struct {
	ViewportArrayIndex: u32,
	RenderTargetArrayIndex: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_view_instancing_desc ]]
VIEW_INSTANCING_DESC :: struct {
	ViewInstanceCount: u32,
	pViewInstanceLocations: ^VIEW_INSTANCE_LOCATION,
	Flags: VIEW_INSTANCING_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_view_instancing_flags ]]
VIEW_INSTANCING_FLAGS :: distinct bit_set[enum {
	ENABLE_VIEW_INSTANCE_MASKING = 0,
}; i32]
VIEW_INSTANCING_FLAGS_NONE :: transmute(VIEW_INSTANCING_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_view_instancing_tier ]]
VIEW_INSTANCING_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1 = 1,
	_2 = 2,
	_3 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_viewport ]]
VIEWPORT :: struct {
	TopLeftX: f32,
	TopLeftY: f32,
	Width: f32,
	Height: f32,
	MinDepth: f32,
	MaxDepth: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_wave_mma_tier ]]
WAVE_MMA_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1_0 = 10,
}

WORK_GRAPH_DESC :: struct {
	ProgramName: PWSTR,
	Flags: WORK_GRAPH_FLAGS,
	NumEntrypoints: u32,
	pEntrypoints: ^NODE_ID,
	NumExplicitlyDefinedNodes: u32,
	pExplicitlyDefinedNodes: ^NODE,
}

WORK_GRAPH_FLAGS :: distinct bit_set[enum {
	INCLUDE_ALL_AVAILABLE_NODES = 0,
}; i32]
WORK_GRAPH_FLAGS_NONE :: transmute(WORK_GRAPH_FLAGS)i32(0)

WORK_GRAPH_MEMORY_REQUIREMENTS :: struct {
	MinSizeInBytes: u64,
	MaxSizeInBytes: u64,
	SizeGranularityInBytes: u32,
}

WORK_GRAPHS_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	_1_0 = 10,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_writebufferimmediate_mode ]]
WRITEBUFFERIMMEDIATE_MODE :: enum i32 {
	DEFAULT = 0,
	MARKER_IN = 1,
	MARKER_OUT = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_writebufferimmediate_parameter ]]
WRITEBUFFERIMMEDIATE_PARAMETER :: struct {
	Dest: u64,
	Value: u32,
}

MessageFunc :: #type proc "system" (
	Category: MESSAGE_CATEGORY,
	Severity: MESSAGE_SEVERITY,
	ID: MESSAGE_ID,
	pDescription: PSTR,
	pContext: rawptr,
)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandallocator ]]
ICommandAllocator :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^ICommandAllocator_Vtbl,
}
ICommandAllocator_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
	Reset: proc "system" (this: ^ICommandAllocator) -> HRESULT,
}
IID_ID3D12CommandAllocator :: GUID{0x6102DEE4, 0xAF59, 0x4B09, {0xB9, 0x99, 0xB4, 0x4D, 0x73, 0xF0, 0x9B, 0x24}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandlist ]]
ICommandList :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^ICommandList_Vtbl,
}
ICommandList_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetType: proc "system" (this: ^ICommandList) -> COMMAND_LIST_TYPE,
}
IID_ID3D12CommandList :: GUID{0x7116D91C, 0xE7E4, 0x47CE, {0xB8, 0xC6, 0xEC, 0x81, 0x68, 0xF4, 0x37, 0xE5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandqueue ]]
ICommandQueue :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^ICommandQueue_Vtbl,
}
ICommandQueue_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
	UpdateTileMappings: proc "system" (
		this: ^ICommandQueue,
		pResource: ^IResource,
		NumResourceRegions: u32,
		pResourceRegionStartCoordinates: [^]TILED_RESOURCE_COORDINATE,
		pResourceRegionSizes: [^]TILE_REGION_SIZE,
		pHeap: ^IHeap,
		NumRanges: u32,
		pRangeFlags: [^]TILE_RANGE_FLAGS,
		pHeapRangeStartOffsets: [^]u32,
		pRangeTileCounts: [^]u32,
		Flags: TILE_MAPPING_FLAGS,
	),
	CopyTileMappings: proc "system" (
		this: ^ICommandQueue,
		pDstResource: ^IResource,
		#by_ptr pDstRegionStartCoordinate: TILED_RESOURCE_COORDINATE,
		pSrcResource: ^IResource,
		#by_ptr pSrcRegionStartCoordinate: TILED_RESOURCE_COORDINATE,
		#by_ptr pRegionSize: TILE_REGION_SIZE,
		Flags: TILE_MAPPING_FLAGS,
	),
	ExecuteCommandLists: proc "system" (this: ^ICommandQueue, NumCommandLists: u32, ppCommandLists: [^]^ICommandList),
	SetMarker: proc "system" (this: ^ICommandQueue, Metadata: u32, pData: rawptr, Size: u32),
	BeginEvent: proc "system" (this: ^ICommandQueue, Metadata: u32, pData: rawptr, Size: u32),
	EndEvent: proc "system" (this: ^ICommandQueue),
	Signal: proc "system" (this: ^ICommandQueue, pFence: ^IFence, Value: u64) -> HRESULT,
	Wait: proc "system" (this: ^ICommandQueue, pFence: ^IFence, Value: u64) -> HRESULT,
	GetTimestampFrequency: proc "system" (this: ^ICommandQueue, pFrequency: ^u64) -> HRESULT,
	GetClockCalibration: proc "system" (this: ^ICommandQueue, pGpuTimestamp: ^u64, pCpuTimestamp: ^u64) -> HRESULT,
	GetDesc: proc "system" (this: ^ICommandQueue) -> COMMAND_QUEUE_DESC,
}
IID_ID3D12CommandQueue :: GUID{0x0EC870A6, 0x5D7E, 0x4C22, {0x8C, 0xFC, 0x5B, 0xAA, 0xE0, 0x76, 0x16, 0xED}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12commandsignature ]]
ICommandSignature :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^ICommandSignature_Vtbl,
}
ICommandSignature_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
}
IID_ID3D12CommandSignature :: GUID{0xC36A797C, 0xEC80, 0x4F0A, {0x89, 0x85, 0xA7, 0xB2, 0x47, 0x50, 0x82, 0xD1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug ]]
IDebug :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebug_Vtbl,
}
IDebug_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnableDebugLayer: proc "system" (this: ^IDebug),
}
IID_ID3D12Debug :: GUID{0x344488B7, 0x6846, 0x474B, {0xB9, 0x89, 0xF0, 0x27, 0x44, 0x82, 0x45, 0xE0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug1 ]]
IDebug1 :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebug1_Vtbl,
}
IDebug1_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnableDebugLayer: proc "system" (this: ^IDebug1),
	SetEnableGPUBasedValidation: proc "system" (this: ^IDebug1, Enable: BOOL),
	SetEnableSynchronizedCommandQueueValidation: proc "system" (this: ^IDebug1, Enable: BOOL),
}
IID_ID3D12Debug1 :: GUID{0xAFFAA4CA, 0x63FE, 0x4D8E, {0xB8, 0xAD, 0x15, 0x90, 0x00, 0xAF, 0x43, 0x04}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug2 ]]
IDebug2 :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebug2_Vtbl,
}
IDebug2_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetGPUBasedValidationFlags: proc "system" (this: ^IDebug2, Flags: GPU_BASED_VALIDATION_FLAGS),
}
IID_ID3D12Debug2 :: GUID{0x93A665C4, 0xA3B2, 0x4E5D, {0xB6, 0x92, 0xA2, 0x6A, 0xE1, 0x4E, 0x33, 0x74}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug3 ]]
IDebug3 :: struct #raw_union {
	#subtype IDebug: IDebug,
	using Vtbl: ^IDebug3_Vtbl,
}
IDebug3_Vtbl :: struct {
	using IDebug_Vtbl: IDebug_Vtbl,
	SetEnableGPUBasedValidation: proc "system" (this: ^IDebug3, Enable: BOOL),
	SetEnableSynchronizedCommandQueueValidation: proc "system" (this: ^IDebug3, Enable: BOOL),
	SetGPUBasedValidationFlags: proc "system" (this: ^IDebug3, Flags: GPU_BASED_VALIDATION_FLAGS),
}
IID_ID3D12Debug3 :: GUID{0x5CF4E58F, 0xF671, 0x4FF1, {0xA5, 0x42, 0x36, 0x86, 0xE3, 0xD1, 0x53, 0xD1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug4 ]]
IDebug4 :: struct #raw_union {
	#subtype IDebug3: IDebug3,
	using Vtbl: ^IDebug4_Vtbl,
}
IDebug4_Vtbl :: struct {
	using IDebug3_Vtbl: IDebug3_Vtbl,
	DisableDebugLayer: proc "system" (this: ^IDebug4),
}
IID_ID3D12Debug4 :: GUID{0x014B816E, 0x9EC5, 0x4A2F, {0xA8, 0x45, 0xFF, 0xBE, 0x44, 0x1C, 0xE1, 0x3A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug5 ]]
IDebug5 :: struct #raw_union {
	#subtype IDebug4: IDebug4,
	using Vtbl: ^IDebug5_Vtbl,
}
IDebug5_Vtbl :: struct {
	using IDebug4_Vtbl: IDebug4_Vtbl,
	SetEnableAutoName: proc "system" (this: ^IDebug5, Enable: BOOL),
}
IID_ID3D12Debug5 :: GUID{0x548D6B12, 0x09FA, 0x40E0, {0x90, 0x69, 0x5D, 0xCD, 0x58, 0x9A, 0x52, 0xC9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debug6 ]]
IDebug6 :: struct #raw_union {
	#subtype IDebug5: IDebug5,
	using Vtbl: ^IDebug6_Vtbl,
}
IDebug6_Vtbl :: struct {
	using IDebug5_Vtbl: IDebug5_Vtbl,
	SetForceLegacyBarrierValidation: proc "system" (this: ^IDebug6, Enable: BOOL),
}
IID_ID3D12Debug6 :: GUID{0x82A816D6, 0x5D01, 0x4157, {0x97, 0xD0, 0x49, 0x75, 0x46, 0x3F, 0xD1, 0xED}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandlist ]]
IDebugCommandList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebugCommandList_Vtbl,
}
IDebugCommandList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AssertResourceState: proc "system" (this: ^IDebugCommandList, pResource: ^IResource, Subresource: u32, State: u32) -> BOOL,
	SetFeatureMask: proc "system" (this: ^IDebugCommandList, Mask: DEBUG_FEATURE) -> HRESULT,
	GetFeatureMask: proc "system" (this: ^IDebugCommandList) -> DEBUG_FEATURE,
}
IID_ID3D12DebugCommandList :: GUID{0x09E0BF36, 0x54AC, 0x484F, {0x88, 0x47, 0x4B, 0xAE, 0xEA, 0xB6, 0x05, 0x3F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandlist1 ]]
IDebugCommandList1 :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebugCommandList1_Vtbl,
}
IDebugCommandList1_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AssertResourceState: proc "system" (this: ^IDebugCommandList1, pResource: ^IResource, Subresource: u32, State: u32) -> BOOL,
	SetDebugParameter: proc "system" (
		this: ^IDebugCommandList1,
		Type: DEBUG_COMMAND_LIST_PARAMETER_TYPE,
		pData: rawptr,
		DataSize: u32,
	) -> HRESULT,
	GetDebugParameter: proc "system" (
		this: ^IDebugCommandList1,
		Type: DEBUG_COMMAND_LIST_PARAMETER_TYPE,
		pData: rawptr,
		DataSize: u32,
	) -> HRESULT,
}
IID_ID3D12DebugCommandList1 :: GUID{0x102CA951, 0x311B, 0x4B01, {0xB1, 0x1F, 0xEC, 0xB8, 0x3E, 0x06, 0x1B, 0x37}}

IDebugCommandList2 :: struct #raw_union {
	#subtype IDebugCommandList: IDebugCommandList,
	using Vtbl: ^IDebugCommandList2_Vtbl,
}
IDebugCommandList2_Vtbl :: struct {
	using IDebugCommandList_Vtbl: IDebugCommandList_Vtbl,
	SetDebugParameter: proc "system" (
		this: ^IDebugCommandList2,
		Type: DEBUG_COMMAND_LIST_PARAMETER_TYPE,
		pData: rawptr,
		DataSize: u32,
	) -> HRESULT,
	GetDebugParameter: proc "system" (
		this: ^IDebugCommandList2,
		Type: DEBUG_COMMAND_LIST_PARAMETER_TYPE,
		pData: rawptr,
		DataSize: u32,
	) -> HRESULT,
}
IID_ID3D12DebugCommandList2 :: GUID{0xAEB575CF, 0x4E06, 0x48BE, {0xBA, 0x3B, 0xC4, 0x50, 0xFC, 0x96, 0x65, 0x2E}}

IDebugCommandList3 :: struct #raw_union {
	#subtype IDebugCommandList2: IDebugCommandList2,
	using Vtbl: ^IDebugCommandList3_Vtbl,
}
IDebugCommandList3_Vtbl :: struct {
	using IDebugCommandList2_Vtbl: IDebugCommandList2_Vtbl,
	AssertResourceAccess: proc "system" (
		this: ^IDebugCommandList3,
		pResource: ^IResource,
		Subresource: u32,
		Access: BARRIER_ACCESS,
	),
	AssertTextureLayout: proc "system" (
		this: ^IDebugCommandList3,
		pResource: ^IResource,
		Subresource: u32,
		Layout: BARRIER_LAYOUT,
	),
}
IID_ID3D12DebugCommandList3 :: GUID{0x197D5E15, 0x4D37, 0x4D34, {0xAF, 0x78, 0x72, 0x4C, 0xD7, 0x0F, 0xDB, 0x1F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugcommandqueue ]]
IDebugCommandQueue :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebugCommandQueue_Vtbl,
}
IDebugCommandQueue_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AssertResourceState: proc "system" (this: ^IDebugCommandQueue, pResource: ^IResource, Subresource: u32, State: u32) -> BOOL,
}
IID_ID3D12DebugCommandQueue :: GUID{0x09E0BF36, 0x54AC, 0x484F, {0x88, 0x47, 0x4B, 0xAE, 0xEA, 0xB6, 0x05, 0x3A}}

IDebugCommandQueue1 :: struct #raw_union {
	#subtype IDebugCommandQueue: IDebugCommandQueue,
	using Vtbl: ^IDebugCommandQueue1_Vtbl,
}
IDebugCommandQueue1_Vtbl :: struct {
	using IDebugCommandQueue_Vtbl: IDebugCommandQueue_Vtbl,
	AssertResourceAccess: proc "system" (
		this: ^IDebugCommandQueue1,
		pResource: ^IResource,
		Subresource: u32,
		Access: BARRIER_ACCESS,
	),
	AssertTextureLayout: proc "system" (
		this: ^IDebugCommandQueue1,
		pResource: ^IResource,
		Subresource: u32,
		Layout: BARRIER_LAYOUT,
	),
}
IID_ID3D12DebugCommandQueue1 :: GUID{0x16BE35A2, 0xBFD6, 0x49F2, {0xBC, 0xAE, 0xEA, 0xAE, 0x4A, 0xFF, 0x86, 0x2D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice ]]
IDebugDevice :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebugDevice_Vtbl,
}
IDebugDevice_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetFeatureMask: proc "system" (this: ^IDebugDevice, Mask: DEBUG_FEATURE) -> HRESULT,
	GetFeatureMask: proc "system" (this: ^IDebugDevice) -> DEBUG_FEATURE,
	ReportLiveDeviceObjects: proc "system" (this: ^IDebugDevice, Flags: RLDO_FLAGS) -> HRESULT,
}
IID_ID3D12DebugDevice :: GUID{0x3FEBD6DD, 0x4973, 0x4787, {0x81, 0x94, 0xE4, 0x5F, 0x9E, 0x28, 0x92, 0x3E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice1 ]]
IDebugDevice1 :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebugDevice1_Vtbl,
}
IDebugDevice1_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetDebugParameter: proc "system" (
		this: ^IDebugDevice1,
		Type: DEBUG_DEVICE_PARAMETER_TYPE,
		pData: rawptr,
		DataSize: u32,
	) -> HRESULT,
	GetDebugParameter: proc "system" (
		this: ^IDebugDevice1,
		Type: DEBUG_DEVICE_PARAMETER_TYPE,
		pData: rawptr,
		DataSize: u32,
	) -> HRESULT,
	ReportLiveDeviceObjects: proc "system" (this: ^IDebugDevice1, Flags: RLDO_FLAGS) -> HRESULT,
}
IID_ID3D12DebugDevice1 :: GUID{0xA9B71770, 0xD099, 0x4A65, {0xA6, 0x98, 0x3D, 0xEE, 0x10, 0x02, 0x0F, 0x88}}

IDebugDevice2 :: struct #raw_union {
	#subtype IDebugDevice: IDebugDevice,
	using Vtbl: ^IDebugDevice2_Vtbl,
}
IDebugDevice2_Vtbl :: struct {
	using IDebugDevice_Vtbl: IDebugDevice_Vtbl,
	SetDebugParameter: proc "system" (
		this: ^IDebugDevice2,
		Type: DEBUG_DEVICE_PARAMETER_TYPE,
		pData: rawptr,
		DataSize: u32,
	) -> HRESULT,
	GetDebugParameter: proc "system" (
		this: ^IDebugDevice2,
		Type: DEBUG_DEVICE_PARAMETER_TYPE,
		pData: rawptr,
		DataSize: u32,
	) -> HRESULT,
}
IID_ID3D12DebugDevice2 :: GUID{0x60ECCBC1, 0x378D, 0x4DF1, {0x89, 0x4C, 0xF8, 0xAC, 0x5C, 0xE4, 0xD7, 0xDD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12descriptorheap ]]
IDescriptorHeap :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^IDescriptorHeap_Vtbl,
}
IDescriptorHeap_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
	GetDesc: proc "system" (this: ^IDescriptorHeap) -> DESCRIPTOR_HEAP_DESC,
	GetCPUDescriptorHandleForHeapStart: proc "system" (this: ^IDescriptorHeap) -> CPU_DESCRIPTOR_HANDLE,
	GetGPUDescriptorHandleForHeapStart: proc "system" (this: ^IDescriptorHeap) -> GPU_DESCRIPTOR_HANDLE,
}
IID_ID3D12DescriptorHeap :: GUID{0x8EFB471D, 0x616C, 0x4F49, {0x90, 0xF7, 0x12, 0x7B, 0xB7, 0x63, 0xFA, 0x51}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device ]]
IDevice :: struct #raw_union {
	#subtype IObject: IObject,
	using Vtbl: ^IDevice_Vtbl,
}
IDevice_Vtbl :: struct {
	using IObject_Vtbl: IObject_Vtbl,
	GetNodeCount: proc "system" (this: ^IDevice) -> u32,
	CreateCommandQueue: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: COMMAND_QUEUE_DESC,
		#by_ptr riid: GUID,
		ppCommandQueue: rawptr,
	) -> HRESULT,
	CreateCommandAllocator: proc "system" (
		this: ^IDevice,
		type: COMMAND_LIST_TYPE,
		#by_ptr riid: GUID,
		ppCommandAllocator: rawptr,
	) -> HRESULT,
	CreateGraphicsPipelineState: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: GRAPHICS_PIPELINE_STATE_DESC,
		#by_ptr riid: GUID,
		ppPipelineState: rawptr,
	) -> HRESULT,
	CreateComputePipelineState: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: COMPUTE_PIPELINE_STATE_DESC,
		#by_ptr riid: GUID,
		ppPipelineState: rawptr,
	) -> HRESULT,
	CreateCommandList: proc "system" (
		this: ^IDevice,
		nodeMask: u32,
		type: COMMAND_LIST_TYPE,
		pCommandAllocator: ^ICommandAllocator,
		pInitialState: ^IPipelineState,
		#by_ptr riid: GUID,
		ppCommandList: rawptr,
	) -> HRESULT,
	CheckFeatureSupport: proc "system" (
		this: ^IDevice,
		Feature: FEATURE,
		pFeatureSupportData: rawptr,
		FeatureSupportDataSize: u32,
	) -> HRESULT,
	CreateDescriptorHeap: proc "system" (
		this: ^IDevice,
		#by_ptr pDescriptorHeapDesc: DESCRIPTOR_HEAP_DESC,
		#by_ptr riid: GUID,
		ppvHeap: rawptr,
	) -> HRESULT,
	GetDescriptorHandleIncrementSize: proc "system" (this: ^IDevice, DescriptorHeapType: DESCRIPTOR_HEAP_TYPE) -> u32,
	CreateRootSignature: proc "system" (
		this: ^IDevice,
		nodeMask: u32,
		pBlobWithRootSignature: rawptr,
		blobLengthInBytes: uintptr,
		#by_ptr riid: GUID,
		ppvRootSignature: rawptr,
	) -> HRESULT,
	CreateConstantBufferView: proc "system" (
		this: ^IDevice,
		pDesc: ^CONSTANT_BUFFER_VIEW_DESC,
		DestDescriptor: CPU_DESCRIPTOR_HANDLE,
	),
	CreateShaderResourceView: proc "system" (
		this: ^IDevice,
		pResource: ^IResource,
		pDesc: ^SHADER_RESOURCE_VIEW_DESC,
		DestDescriptor: CPU_DESCRIPTOR_HANDLE,
	),
	CreateUnorderedAccessView: proc "system" (
		this: ^IDevice,
		pResource: ^IResource,
		pCounterResource: ^IResource,
		pDesc: ^UNORDERED_ACCESS_VIEW_DESC,
		DestDescriptor: CPU_DESCRIPTOR_HANDLE,
	),
	CreateRenderTargetView: proc "system" (
		this: ^IDevice,
		pResource: ^IResource,
		pDesc: ^RENDER_TARGET_VIEW_DESC,
		DestDescriptor: CPU_DESCRIPTOR_HANDLE,
	),
	CreateDepthStencilView: proc "system" (
		this: ^IDevice,
		pResource: ^IResource,
		pDesc: ^DEPTH_STENCIL_VIEW_DESC,
		DestDescriptor: CPU_DESCRIPTOR_HANDLE,
	),
	CreateSampler: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: SAMPLER_DESC,
		DestDescriptor: CPU_DESCRIPTOR_HANDLE,
	),
	CopyDescriptors: proc "system" (
		this: ^IDevice,
		NumDestDescriptorRanges: u32,
		pDestDescriptorRangeStarts: [^]CPU_DESCRIPTOR_HANDLE,
		pDestDescriptorRangeSizes: [^]u32,
		NumSrcDescriptorRanges: u32,
		pSrcDescriptorRangeStarts: [^]CPU_DESCRIPTOR_HANDLE,
		pSrcDescriptorRangeSizes: [^]u32,
		DescriptorHeapsType: DESCRIPTOR_HEAP_TYPE,
	),
	CopyDescriptorsSimple: proc "system" (
		this: ^IDevice,
		NumDescriptors: u32,
		DestDescriptorRangeStart: CPU_DESCRIPTOR_HANDLE,
		SrcDescriptorRangeStart: CPU_DESCRIPTOR_HANDLE,
		DescriptorHeapsType: DESCRIPTOR_HEAP_TYPE,
	),
	GetResourceAllocationInfo: proc "system" (
		this: ^IDevice,
		visibleMask: u32,
		numResourceDescs: u32,
		pResourceDescs: [^]RESOURCE_DESC,
	) -> RESOURCE_ALLOCATION_INFO,
	GetCustomHeapProperties: proc "system" (this: ^IDevice, nodeMask: u32, heapType: HEAP_TYPE) -> HEAP_PROPERTIES,
	CreateCommittedResource: proc "system" (
		this: ^IDevice,
		#by_ptr pHeapProperties: HEAP_PROPERTIES,
		HeapFlags: HEAP_FLAGS,
		#by_ptr pDesc: RESOURCE_DESC,
		InitialResourceState: RESOURCE_STATES,
		pOptimizedClearValue: ^CLEAR_VALUE,
		#by_ptr riidResource: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	CreateHeap: proc "system" (this: ^IDevice, #by_ptr pDesc: HEAP_DESC, #by_ptr riid: GUID, ppvHeap: rawptr) -> HRESULT,
	CreatePlacedResource: proc "system" (
		this: ^IDevice,
		pHeap: ^IHeap,
		HeapOffset: u64,
		#by_ptr pDesc: RESOURCE_DESC,
		InitialState: RESOURCE_STATES,
		pOptimizedClearValue: ^CLEAR_VALUE,
		#by_ptr riid: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	CreateReservedResource: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: RESOURCE_DESC,
		InitialState: RESOURCE_STATES,
		pOptimizedClearValue: ^CLEAR_VALUE,
		#by_ptr riid: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	CreateSharedHandle: proc "system" (
		this: ^IDevice,
		pObject: ^IDeviceChild,
		pAttributes: ^SECURITY_ATTRIBUTES,
		Access: u32,
		Name: PWSTR,
		pHandle: ^HANDLE,
	) -> HRESULT,
	OpenSharedHandle: proc "system" (this: ^IDevice, NTHandle: HANDLE, #by_ptr riid: GUID, ppvObj: rawptr) -> HRESULT,
	OpenSharedHandleByName: proc "system" (this: ^IDevice, Name: PWSTR, Access: u32, pNTHandle: ^HANDLE) -> HRESULT,
	MakeResident: proc "system" (this: ^IDevice, NumObjects: u32, ppObjects: [^]^IPageable) -> HRESULT,
	Evict: proc "system" (this: ^IDevice, NumObjects: u32, ppObjects: [^]^IPageable) -> HRESULT,
	CreateFence: proc "system" (
		this: ^IDevice,
		InitialValue: u64,
		Flags: FENCE_FLAGS,
		#by_ptr riid: GUID,
		ppFence: rawptr,
	) -> HRESULT,
	GetDeviceRemovedReason: proc "system" (this: ^IDevice) -> HRESULT,
	GetCopyableFootprints: proc "system" (
		this: ^IDevice,
		#by_ptr pResourceDesc: RESOURCE_DESC,
		FirstSubresource: u32,
		NumSubresources: u32,
		BaseOffset: u64,
		pLayouts: [^]PLACED_SUBRESOURCE_FOOTPRINT,
		pNumRows: [^]u32,
		pRowSizeInBytes: [^]u64,
		pTotalBytes: ^u64,
	),
	CreateQueryHeap: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: QUERY_HEAP_DESC,
		#by_ptr riid: GUID,
		ppvHeap: rawptr,
	) -> HRESULT,
	SetStablePowerState: proc "system" (this: ^IDevice, Enable: BOOL) -> HRESULT,
	CreateCommandSignature: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: COMMAND_SIGNATURE_DESC,
		pRootSignature: ^IRootSignature,
		#by_ptr riid: GUID,
		ppvCommandSignature: rawptr,
	) -> HRESULT,
	GetResourceTiling: proc "system" (
		this: ^IDevice,
		pTiledResource: ^IResource,
		pNumTilesForEntireResource: ^u32,
		pPackedMipDesc: ^PACKED_MIP_INFO,
		pStandardTileShapeForNonPackedMips: ^TILE_SHAPE,
		pNumSubresourceTilings: ^u32,
		FirstSubresourceTilingToGet: u32,
		pSubresourceTilingsForNonPackedMips: [^]SUBRESOURCE_TILING,
	),
	GetAdapterLuid: proc "system" (this: ^IDevice) -> LUID,
}
IID_ID3D12Device :: GUID{0x189819F1, 0x1DB6, 0x4B57, {0xBE, 0x54, 0x18, 0x21, 0x33, 0x9B, 0x85, 0xF7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device1 ]]
IDevice1 :: struct #raw_union {
	#subtype IDevice: IDevice,
	using Vtbl: ^IDevice1_Vtbl,
}
IDevice1_Vtbl :: struct {
	using IDevice_Vtbl: IDevice_Vtbl,
	CreatePipelineLibrary: proc "system" (
		this: ^IDevice1,
		pLibraryBlob: rawptr,
		BlobLength: uintptr,
		#by_ptr riid: GUID,
		ppPipelineLibrary: rawptr,
	) -> HRESULT,
	SetEventOnMultipleFenceCompletion: proc "system" (
		this: ^IDevice1,
		ppFences: [^]^IFence,
		pFenceValues: [^]u64,
		NumFences: u32,
		Flags: MULTIPLE_FENCE_WAIT_FLAGS,
		hEvent: HANDLE,
	) -> HRESULT,
	SetResidencyPriority: proc "system" (
		this: ^IDevice1,
		NumObjects: u32,
		ppObjects: [^]^IPageable,
		pPriorities: [^]RESIDENCY_PRIORITY,
	) -> HRESULT,
}
IID_ID3D12Device1 :: GUID{0x77ACCE80, 0x638E, 0x4E65, {0x88, 0x95, 0xC1, 0xF2, 0x33, 0x86, 0x86, 0x3E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device10 ]]
IDevice10 :: struct #raw_union {
	#subtype IDevice9: IDevice9,
	using Vtbl: ^IDevice10_Vtbl,
}
IDevice10_Vtbl :: struct {
	using IDevice9_Vtbl: IDevice9_Vtbl,
	CreateCommittedResource3: proc "system" (
		this: ^IDevice10,
		#by_ptr pHeapProperties: HEAP_PROPERTIES,
		HeapFlags: HEAP_FLAGS,
		#by_ptr pDesc: RESOURCE_DESC1,
		InitialLayout: BARRIER_LAYOUT,
		pOptimizedClearValue: ^CLEAR_VALUE,
		pProtectedSession: ^IProtectedResourceSession,
		NumCastableFormats: u32,
		pCastableFormats: [^]dxgi.FORMAT,
		#by_ptr riidResource: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	CreatePlacedResource2: proc "system" (
		this: ^IDevice10,
		pHeap: ^IHeap,
		HeapOffset: u64,
		#by_ptr pDesc: RESOURCE_DESC1,
		InitialLayout: BARRIER_LAYOUT,
		pOptimizedClearValue: ^CLEAR_VALUE,
		NumCastableFormats: u32,
		pCastableFormats: [^]dxgi.FORMAT,
		#by_ptr riid: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	CreateReservedResource2: proc "system" (
		this: ^IDevice10,
		#by_ptr pDesc: RESOURCE_DESC,
		InitialLayout: BARRIER_LAYOUT,
		pOptimizedClearValue: ^CLEAR_VALUE,
		pProtectedSession: ^IProtectedResourceSession,
		NumCastableFormats: u32,
		pCastableFormats: [^]dxgi.FORMAT,
		#by_ptr riid: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
}
IID_ID3D12Device10 :: GUID{0x517F8718, 0xAA66, 0x49F9, {0xB0, 0x2B, 0xA7, 0xAB, 0x89, 0xC0, 0x60, 0x31}}

IDevice11 :: struct #raw_union {
	#subtype IDevice10: IDevice10,
	using Vtbl: ^IDevice11_Vtbl,
}
IDevice11_Vtbl :: struct {
	using IDevice10_Vtbl: IDevice10_Vtbl,
	CreateSampler2: proc "system" (
		this: ^IDevice11,
		#by_ptr pDesc: SAMPLER_DESC2,
		DestDescriptor: CPU_DESCRIPTOR_HANDLE,
	),
}
IID_ID3D12Device11 :: GUID{0x5405C344, 0xD457, 0x444E, {0xB4, 0xDD, 0x23, 0x66, 0xE4, 0x5A, 0xEE, 0x39}}

IDevice12 :: struct #raw_union {
	#subtype IDevice11: IDevice11,
	using Vtbl: ^IDevice12_Vtbl,
}
IDevice12_Vtbl :: struct {
	using IDevice11_Vtbl: IDevice11_Vtbl,
	GetResourceAllocationInfo3: proc "system" (
		this: ^IDevice12,
		visibleMask: u32,
		numResourceDescs: u32,
		pResourceDescs: [^]RESOURCE_DESC1,
		pNumCastableFormats: [^]u32,
		ppCastableFormats: [^]dxgi.FORMAT,
		pResourceAllocationInfo1: [^]RESOURCE_ALLOCATION_INFO1,
	) -> RESOURCE_ALLOCATION_INFO,
}
IID_ID3D12Device12 :: GUID{0x5AF5C532, 0x4C91, 0x4CD0, {0xB5, 0x41, 0x15, 0xA4, 0x05, 0x39, 0x5F, 0xC5}}

IDevice13 :: struct #raw_union {
	#subtype IDevice12: IDevice12,
	using Vtbl: ^IDevice13_Vtbl,
}
IDevice13_Vtbl :: struct {
	using IDevice12_Vtbl: IDevice12_Vtbl,
	OpenExistingHeapFromAddress1: proc "system" (
		this: ^IDevice13,
		pAddress: rawptr,
		size: uintptr,
		#by_ptr riid: GUID,
		ppvHeap: rawptr,
	) -> HRESULT,
}
IID_ID3D12Device13 :: GUID{0x14EECFFC, 0x4DF8, 0x40F7, {0xA1, 0x18, 0x5C, 0x81, 0x6F, 0x45, 0x69, 0x5E}}

IDevice14 :: struct #raw_union {
	#subtype IDevice13: IDevice13,
	using Vtbl: ^IDevice14_Vtbl,
}
IDevice14_Vtbl :: struct {
	using IDevice13_Vtbl: IDevice13_Vtbl,
	CreateRootSignatureFromSubobjectInLibrary: proc "system" (
		this: ^IDevice14,
		nodeMask: u32,
		pLibraryBlob: rawptr,
		blobLengthInBytes: uintptr,
		subobjectName: PWSTR,
		#by_ptr riid: GUID,
		ppvRootSignature: rawptr,
	) -> HRESULT,
}
IID_ID3D12Device14 :: GUID{0x5F6E592D, 0xD895, 0x44C2, {0x8E, 0x4A, 0x88, 0xAD, 0x49, 0x26, 0xD3, 0x23}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device2 ]]
IDevice2 :: struct #raw_union {
	#subtype IDevice1: IDevice1,
	using Vtbl: ^IDevice2_Vtbl,
}
IDevice2_Vtbl :: struct {
	using IDevice1_Vtbl: IDevice1_Vtbl,
	CreatePipelineState: proc "system" (
		this: ^IDevice2,
		#by_ptr pDesc: PIPELINE_STATE_STREAM_DESC,
		#by_ptr riid: GUID,
		ppPipelineState: rawptr,
	) -> HRESULT,
}
IID_ID3D12Device2 :: GUID{0x30BAA41E, 0xB15B, 0x475C, {0xA0, 0xBB, 0x1A, 0xF5, 0xC5, 0xB6, 0x43, 0x28}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device3 ]]
IDevice3 :: struct #raw_union {
	#subtype IDevice2: IDevice2,
	using Vtbl: ^IDevice3_Vtbl,
}
IDevice3_Vtbl :: struct {
	using IDevice2_Vtbl: IDevice2_Vtbl,
	OpenExistingHeapFromAddress: proc "system" (this: ^IDevice3, pAddress: rawptr, #by_ptr riid: GUID, ppvHeap: rawptr) -> HRESULT,
	OpenExistingHeapFromFileMapping: proc "system" (this: ^IDevice3, hFileMapping: HANDLE, #by_ptr riid: GUID, ppvHeap: rawptr) -> HRESULT,
	EnqueueMakeResident: proc "system" (
		this: ^IDevice3,
		Flags: RESIDENCY_FLAGS,
		NumObjects: u32,
		ppObjects: [^]^IPageable,
		pFenceToSignal: ^IFence,
		FenceValueToSignal: u64,
	) -> HRESULT,
}
IID_ID3D12Device3 :: GUID{0x81DADC15, 0x2BAD, 0x4392, {0x93, 0xC5, 0x10, 0x13, 0x45, 0xC4, 0xAA, 0x98}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device4 ]]
IDevice4 :: struct #raw_union {
	#subtype IDevice3: IDevice3,
	using Vtbl: ^IDevice4_Vtbl,
}
IDevice4_Vtbl :: struct {
	using IDevice3_Vtbl: IDevice3_Vtbl,
	CreateCommandList1: proc "system" (
		this: ^IDevice4,
		nodeMask: u32,
		type: COMMAND_LIST_TYPE,
		flags: COMMAND_LIST_FLAGS,
		#by_ptr riid: GUID,
		ppCommandList: rawptr,
	) -> HRESULT,
	CreateProtectedResourceSession: proc "system" (
		this: ^IDevice4,
		#by_ptr pDesc: PROTECTED_RESOURCE_SESSION_DESC,
		#by_ptr riid: GUID,
		ppSession: rawptr,
	) -> HRESULT,
	CreateCommittedResource1: proc "system" (
		this: ^IDevice4,
		#by_ptr pHeapProperties: HEAP_PROPERTIES,
		HeapFlags: HEAP_FLAGS,
		#by_ptr pDesc: RESOURCE_DESC,
		InitialResourceState: RESOURCE_STATES,
		pOptimizedClearValue: ^CLEAR_VALUE,
		pProtectedSession: ^IProtectedResourceSession,
		#by_ptr riidResource: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	CreateHeap1: proc "system" (
		this: ^IDevice4,
		#by_ptr pDesc: HEAP_DESC,
		pProtectedSession: ^IProtectedResourceSession,
		#by_ptr riid: GUID,
		ppvHeap: rawptr,
	) -> HRESULT,
	CreateReservedResource1: proc "system" (
		this: ^IDevice4,
		#by_ptr pDesc: RESOURCE_DESC,
		InitialState: RESOURCE_STATES,
		pOptimizedClearValue: ^CLEAR_VALUE,
		pProtectedSession: ^IProtectedResourceSession,
		#by_ptr riid: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	GetResourceAllocationInfo1: proc "system" (
		this: ^IDevice4,
		visibleMask: u32,
		numResourceDescs: u32,
		pResourceDescs: [^]RESOURCE_DESC,
		pResourceAllocationInfo1: [^]RESOURCE_ALLOCATION_INFO1,
	) -> RESOURCE_ALLOCATION_INFO,
}
IID_ID3D12Device4 :: GUID{0xE865DF17, 0xA9EE, 0x46F9, {0xA4, 0x63, 0x30, 0x98, 0x31, 0x5A, 0xA2, 0xE5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device5 ]]
IDevice5 :: struct #raw_union {
	#subtype IDevice4: IDevice4,
	using Vtbl: ^IDevice5_Vtbl,
}
IDevice5_Vtbl :: struct {
	using IDevice4_Vtbl: IDevice4_Vtbl,
	CreateLifetimeTracker: proc "system" (
		this: ^IDevice5,
		pOwner: ^ILifetimeOwner,
		#by_ptr riid: GUID,
		ppvTracker: rawptr,
	) -> HRESULT,
	RemoveDevice: proc "system" (this: ^IDevice5),
	EnumerateMetaCommands: proc "system" (this: ^IDevice5, pNumMetaCommands: ^u32, pDescs: [^]META_COMMAND_DESC) -> HRESULT,
	EnumerateMetaCommandParameters: proc "system" (
		this: ^IDevice5,
		#by_ptr CommandId: GUID,
		Stage: META_COMMAND_PARAMETER_STAGE,
		pTotalStructureSizeInBytes: ^u32,
		pParameterCount: ^u32,
		pParameterDescs: [^]META_COMMAND_PARAMETER_DESC,
	) -> HRESULT,
	CreateMetaCommand: proc "system" (
		this: ^IDevice5,
		#by_ptr CommandId: GUID,
		NodeMask: u32,
		pCreationParametersData: rawptr,
		CreationParametersDataSizeInBytes: uintptr,
		#by_ptr riid: GUID,
		ppMetaCommand: rawptr,
	) -> HRESULT,
	CreateStateObject: proc "system" (
		this: ^IDevice5,
		#by_ptr pDesc: STATE_OBJECT_DESC,
		#by_ptr riid: GUID,
		ppStateObject: rawptr,
	) -> HRESULT,
	GetRaytracingAccelerationStructurePrebuildInfo: proc "system" (
		this: ^IDevice5,
		#by_ptr pDesc: BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS,
		pInfo: ^RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO,
	),
	CheckDriverMatchingIdentifier: proc "system" (
		this: ^IDevice5,
		SerializedDataType: SERIALIZED_DATA_TYPE,
		#by_ptr pIdentifierToCheck: SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER,
	) -> DRIVER_MATCHING_IDENTIFIER_STATUS,
}
IID_ID3D12Device5 :: GUID{0x8B4F173B, 0x2FEA, 0x4B80, {0x8F, 0x58, 0x43, 0x07, 0x19, 0x1A, 0xB9, 0x5D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device6 ]]
IDevice6 :: struct #raw_union {
	#subtype IDevice5: IDevice5,
	using Vtbl: ^IDevice6_Vtbl,
}
IDevice6_Vtbl :: struct {
	using IDevice5_Vtbl: IDevice5_Vtbl,
	SetBackgroundProcessingMode: proc "system" (
		this: ^IDevice6,
		Mode: BACKGROUND_PROCESSING_MODE,
		MeasurementsAction: MEASUREMENTS_ACTION,
		hEventToSignalUponCompletion: HANDLE,
		pbFurtherMeasurementsDesired: ^BOOL,
	) -> HRESULT,
}
IID_ID3D12Device6 :: GUID{0xC70B221B, 0x40E4, 0x4A17, {0x89, 0xAF, 0x02, 0x5A, 0x07, 0x27, 0xA6, 0xDC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device7 ]]
IDevice7 :: struct #raw_union {
	#subtype IDevice6: IDevice6,
	using Vtbl: ^IDevice7_Vtbl,
}
IDevice7_Vtbl :: struct {
	using IDevice6_Vtbl: IDevice6_Vtbl,
	AddToStateObject: proc "system" (
		this: ^IDevice7,
		#by_ptr pAddition: STATE_OBJECT_DESC,
		pStateObjectToGrowFrom: ^IStateObject,
		#by_ptr riid: GUID,
		ppNewStateObject: rawptr,
	) -> HRESULT,
	CreateProtectedResourceSession1: proc "system" (
		this: ^IDevice7,
		#by_ptr pDesc: PROTECTED_RESOURCE_SESSION_DESC1,
		#by_ptr riid: GUID,
		ppSession: rawptr,
	) -> HRESULT,
}
IID_ID3D12Device7 :: GUID{0x5C014B53, 0x68A1, 0x4B9B, {0x8B, 0xD1, 0xDD, 0x60, 0x46, 0xB9, 0x35, 0x8B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device8 ]]
IDevice8 :: struct #raw_union {
	#subtype IDevice7: IDevice7,
	using Vtbl: ^IDevice8_Vtbl,
}
IDevice8_Vtbl :: struct {
	using IDevice7_Vtbl: IDevice7_Vtbl,
	GetResourceAllocationInfo2: proc "system" (
		this: ^IDevice8,
		visibleMask: u32,
		numResourceDescs: u32,
		pResourceDescs: [^]RESOURCE_DESC1,
		pResourceAllocationInfo1: [^]RESOURCE_ALLOCATION_INFO1,
	) -> RESOURCE_ALLOCATION_INFO,
	CreateCommittedResource2: proc "system" (
		this: ^IDevice8,
		#by_ptr pHeapProperties: HEAP_PROPERTIES,
		HeapFlags: HEAP_FLAGS,
		#by_ptr pDesc: RESOURCE_DESC1,
		InitialResourceState: RESOURCE_STATES,
		pOptimizedClearValue: ^CLEAR_VALUE,
		pProtectedSession: ^IProtectedResourceSession,
		#by_ptr riidResource: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	CreatePlacedResource1: proc "system" (
		this: ^IDevice8,
		pHeap: ^IHeap,
		HeapOffset: u64,
		#by_ptr pDesc: RESOURCE_DESC1,
		InitialState: RESOURCE_STATES,
		pOptimizedClearValue: ^CLEAR_VALUE,
		#by_ptr riid: GUID,
		ppvResource: rawptr,
	) -> HRESULT,
	CreateSamplerFeedbackUnorderedAccessView: proc "system" (
		this: ^IDevice8,
		pTargetedResource: ^IResource,
		pFeedbackResource: ^IResource,
		DestDescriptor: CPU_DESCRIPTOR_HANDLE,
	),
	GetCopyableFootprints1: proc "system" (
		this: ^IDevice8,
		#by_ptr pResourceDesc: RESOURCE_DESC1,
		FirstSubresource: u32,
		NumSubresources: u32,
		BaseOffset: u64,
		pLayouts: [^]PLACED_SUBRESOURCE_FOOTPRINT,
		pNumRows: [^]u32,
		pRowSizeInBytes: [^]u64,
		pTotalBytes: ^u64,
	),
}
IID_ID3D12Device8 :: GUID{0x9218E6BB, 0xF944, 0x4F7E, {0xA7, 0x5C, 0xB1, 0xB2, 0xC7, 0xB7, 0x01, 0xF3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device9 ]]
IDevice9 :: struct #raw_union {
	#subtype IDevice8: IDevice8,
	using Vtbl: ^IDevice9_Vtbl,
}
IDevice9_Vtbl :: struct {
	using IDevice8_Vtbl: IDevice8_Vtbl,
	CreateShaderCacheSession: proc "system" (
		this: ^IDevice9,
		#by_ptr pDesc: SHADER_CACHE_SESSION_DESC,
		#by_ptr riid: GUID,
		ppvSession: rawptr,
	) -> HRESULT,
	ShaderCacheControl: proc "system" (
		this: ^IDevice9,
		Kinds: SHADER_CACHE_KIND_FLAGS,
		Control: SHADER_CACHE_CONTROL_FLAGS,
	) -> HRESULT,
	CreateCommandQueue1: proc "system" (
		this: ^IDevice9,
		#by_ptr pDesc: COMMAND_QUEUE_DESC,
		#by_ptr CreatorID: GUID,
		#by_ptr riid: GUID,
		ppCommandQueue: rawptr,
	) -> HRESULT,
}
IID_ID3D12Device9 :: GUID{0x4C80E962, 0xF032, 0x4F60, {0xBC, 0x9E, 0xEB, 0xC2, 0xCF, 0xA1, 0xD8, 0x3C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12devicechild ]]
IDeviceChild :: struct #raw_union {
	#subtype IObject: IObject,
	using Vtbl: ^IDeviceChild_Vtbl,
}
IDeviceChild_Vtbl :: struct {
	using IObject_Vtbl: IObject_Vtbl,
	GetDevice: proc "system" (this: ^IDeviceChild, #by_ptr riid: GUID, ppvDevice: rawptr) -> HRESULT,
}
IID_ID3D12DeviceChild :: GUID{0x905DB94B, 0xA00C, 0x4140, {0x9D, 0xF5, 0x2B, 0x64, 0xCA, 0x9E, 0xA3, 0x57}}

IDeviceConfiguration :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDeviceConfiguration_Vtbl,
}
IDeviceConfiguration_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDesc: proc "system" (this: ^IDeviceConfiguration) -> DEVICE_CONFIGURATION_DESC,
	GetEnabledExperimentalFeatures: proc "system" (this: ^IDeviceConfiguration, pGuids: [^]GUID, NumGuids: u32) -> HRESULT,
	SerializeVersionedRootSignature: proc "system" (
		this: ^IDeviceConfiguration,
		#by_ptr pDesc: VERSIONED_ROOT_SIGNATURE_DESC,
		ppResult: ^^d3d.IBlob,
		ppError: ^^d3d.IBlob,
	) -> HRESULT,
	CreateVersionedRootSignatureDeserializer: proc "system" (
		this: ^IDeviceConfiguration,
		pBlob: rawptr,
		Size: uintptr,
		#by_ptr riid: GUID,
		ppvDeserializer: rawptr,
	) -> HRESULT,
}
IID_ID3D12DeviceConfiguration :: GUID{0x78DBF87B, 0xF766, 0x422B, {0xA6, 0x1C, 0xC8, 0xC4, 0x46, 0xBD, 0xB9, 0xAD}}

IDeviceConfiguration1 :: struct #raw_union {
	#subtype IDeviceConfiguration: IDeviceConfiguration,
	using Vtbl: ^IDeviceConfiguration1_Vtbl,
}
IDeviceConfiguration1_Vtbl :: struct {
	using IDeviceConfiguration_Vtbl: IDeviceConfiguration_Vtbl,
	CreateVersionedRootSignatureDeserializerFromSubobjectInLibrary: proc "system" (
		this: ^IDeviceConfiguration1,
		pLibraryBlob: rawptr,
		Size: uintptr,
		RootSignatureSubobjectName: PWSTR,
		#by_ptr riid: GUID,
		ppvDeserializer: rawptr,
	) -> HRESULT,
}
IID_ID3D12DeviceConfiguration1 :: GUID{0xED342442, 0x6343, 0x4E16, {0xBB, 0x82, 0xA3, 0xA5, 0x77, 0x87, 0x4E, 0x56}}

IDeviceFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDeviceFactory_Vtbl,
}
IDeviceFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	InitializeFromGlobalState: proc "system" (this: ^IDeviceFactory) -> HRESULT,
	ApplyToGlobalState: proc "system" (this: ^IDeviceFactory) -> HRESULT,
	SetFlags: proc "system" (this: ^IDeviceFactory, flags: DEVICE_FACTORY_FLAGS) -> HRESULT,
	GetFlags: proc "system" (this: ^IDeviceFactory) -> DEVICE_FACTORY_FLAGS,
	GetConfigurationInterface: proc "system" (this: ^IDeviceFactory, #by_ptr clsid: GUID, #by_ptr iid: GUID, ppv: rawptr) -> HRESULT,
	EnableExperimentalFeatures: proc "system" (
		this: ^IDeviceFactory,
		NumFeatures: u32,
		pIIDs: [^]GUID,
		pConfigurationStructs: rawptr,
		pConfigurationStructSizes: [^]u32,
	) -> HRESULT,
	CreateDevice: proc "system" (
		this: ^IDeviceFactory,
		adapter: ^IUnknown,
		FeatureLevel: d3d.FEATURE_LEVEL,
		#by_ptr riid: GUID,
		ppvDevice: rawptr,
	) -> HRESULT,
}
IID_ID3D12DeviceFactory :: GUID{0x61F307D3, 0xD34E, 0x4E7C, {0x83, 0x74, 0x3B, 0xA4, 0xDE, 0x23, 0xCC, 0xCB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddata ]]
IDeviceRemovedExtendedData :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDeviceRemovedExtendedData_Vtbl,
}
IDeviceRemovedExtendedData_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetAutoBreadcrumbsOutput: proc "system" (
		this: ^IDeviceRemovedExtendedData,
		pOutput: ^DRED_AUTO_BREADCRUMBS_OUTPUT,
	) -> HRESULT,
	GetPageFaultAllocationOutput: proc "system" (this: ^IDeviceRemovedExtendedData, pOutput: ^DRED_PAGE_FAULT_OUTPUT) -> HRESULT,
}
IID_ID3D12DeviceRemovedExtendedData :: GUID{0x98931D33, 0x5AE8, 0x4791, {0xAA, 0x3C, 0x1A, 0x73, 0xA2, 0x93, 0x4E, 0x71}}

IDeviceRemovedExtendedData1 :: struct #raw_union {
	#subtype IDeviceRemovedExtendedData: IDeviceRemovedExtendedData,
	using Vtbl: ^IDeviceRemovedExtendedData1_Vtbl,
}
IDeviceRemovedExtendedData1_Vtbl :: struct {
	using IDeviceRemovedExtendedData_Vtbl: IDeviceRemovedExtendedData_Vtbl,
	GetAutoBreadcrumbsOutput1: proc "system" (
		this: ^IDeviceRemovedExtendedData1,
		pOutput: ^DRED_AUTO_BREADCRUMBS_OUTPUT1,
	) -> HRESULT,
	GetPageFaultAllocationOutput1: proc "system" (this: ^IDeviceRemovedExtendedData1, pOutput: ^DRED_PAGE_FAULT_OUTPUT1) -> HRESULT,
}
IID_ID3D12DeviceRemovedExtendedData1 :: GUID{0x9727A022, 0xCF1D, 0x4DDA, {0x9E, 0xBA, 0xEF, 0xFA, 0x65, 0x3F, 0xC5, 0x06}}

IDeviceRemovedExtendedData2 :: struct #raw_union {
	#subtype IDeviceRemovedExtendedData1: IDeviceRemovedExtendedData1,
	using Vtbl: ^IDeviceRemovedExtendedData2_Vtbl,
}
IDeviceRemovedExtendedData2_Vtbl :: struct {
	using IDeviceRemovedExtendedData1_Vtbl: IDeviceRemovedExtendedData1_Vtbl,
	GetPageFaultAllocationOutput2: proc "system" (this: ^IDeviceRemovedExtendedData2, pOutput: ^DRED_PAGE_FAULT_OUTPUT2) -> HRESULT,
	GetDeviceState: proc "system" (this: ^IDeviceRemovedExtendedData2) -> DRED_DEVICE_STATE,
}
IID_ID3D12DeviceRemovedExtendedData2 :: GUID{0x67FC5816, 0xE4CA, 0x4915, {0xBF, 0x18, 0x42, 0x54, 0x12, 0x72, 0xDA, 0x54}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddatasettings ]]
IDeviceRemovedExtendedDataSettings :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDeviceRemovedExtendedDataSettings_Vtbl,
}
IDeviceRemovedExtendedDataSettings_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAutoBreadcrumbsEnablement: proc "system" (this: ^IDeviceRemovedExtendedDataSettings, Enablement: DRED_ENABLEMENT),
	SetPageFaultEnablement: proc "system" (this: ^IDeviceRemovedExtendedDataSettings, Enablement: DRED_ENABLEMENT),
	SetWatsonDumpEnablement: proc "system" (this: ^IDeviceRemovedExtendedDataSettings, Enablement: DRED_ENABLEMENT),
}
IID_ID3D12DeviceRemovedExtendedDataSettings :: GUID{0x82BC481C, 0x6B9B, 0x4030, {0xAE, 0xDB, 0x7E, 0xE3, 0xD1, 0xDF, 0x1E, 0x63}}

IDeviceRemovedExtendedDataSettings1 :: struct #raw_union {
	#subtype IDeviceRemovedExtendedDataSettings: IDeviceRemovedExtendedDataSettings,
	using Vtbl: ^IDeviceRemovedExtendedDataSettings1_Vtbl,
}
IDeviceRemovedExtendedDataSettings1_Vtbl :: struct {
	using IDeviceRemovedExtendedDataSettings_Vtbl: IDeviceRemovedExtendedDataSettings_Vtbl,
	SetBreadcrumbContextEnablement: proc "system" (this: ^IDeviceRemovedExtendedDataSettings1, Enablement: DRED_ENABLEMENT),
}
IID_ID3D12DeviceRemovedExtendedDataSettings1 :: GUID{0xDBD5AE51, 0x3317, 0x4F0A, {0xAD, 0xF9, 0x1D, 0x7C, 0xED, 0xCA, 0xAE, 0x0B}}

IDeviceRemovedExtendedDataSettings2 :: struct #raw_union {
	#subtype IDeviceRemovedExtendedDataSettings1: IDeviceRemovedExtendedDataSettings1,
	using Vtbl: ^IDeviceRemovedExtendedDataSettings2_Vtbl,
}
IDeviceRemovedExtendedDataSettings2_Vtbl :: struct {
	using IDeviceRemovedExtendedDataSettings1_Vtbl: IDeviceRemovedExtendedDataSettings1_Vtbl,
	UseMarkersOnlyAutoBreadcrumbs: proc "system" (this: ^IDeviceRemovedExtendedDataSettings2, MarkersOnly: BOOL),
}
IID_ID3D12DeviceRemovedExtendedDataSettings2 :: GUID{0x61552388, 0x01AB, 0x4008, {0xA4, 0x36, 0x83, 0xDB, 0x18, 0x95, 0x66, 0xEA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence ]]
IFence :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^IFence_Vtbl,
}
IFence_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
	GetCompletedValue: proc "system" (this: ^IFence) -> u64,
	SetEventOnCompletion: proc "system" (this: ^IFence, Value: u64, hEvent: HANDLE) -> HRESULT,
	Signal: proc "system" (this: ^IFence, Value: u64) -> HRESULT,
}
IID_ID3D12Fence :: GUID{0x0A753DCF, 0xC4D8, 0x4B91, {0xAD, 0xF6, 0xBE, 0x5A, 0x60, 0xD9, 0x5A, 0x76}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12fence1 ]]
IFence1 :: struct #raw_union {
	#subtype IFence: IFence,
	using Vtbl: ^IFence1_Vtbl,
}
IFence1_Vtbl :: struct {
	using IFence_Vtbl: IFence_Vtbl,
	GetCreationFlags: proc "system" (this: ^IFence1) -> FENCE_FLAGS,
}
IID_ID3D12Fence1 :: GUID{0x433685FE, 0xE22B, 0x4CA0, {0xA8, 0xDB, 0xB5, 0xB4, 0xF4, 0xDD, 0x0E, 0x4A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12functionparameterreflection ]]
IFunctionParameterReflection :: struct #raw_union {
	using Vtbl: ^IFunctionParameterReflection_Vtbl,
}
IFunctionParameterReflection_Vtbl :: struct {
	GetDesc: proc "system" (this: ^IFunctionParameterReflection, pDesc: ^PARAMETER_DESC) -> HRESULT,
}
IID_ID3D12FunctionParameterReflection :: GUID{0xEC25F42D, 0x7006, 0x4F2B, {0xB3, 0x3E, 0x02, 0xCC, 0x33, 0x75, 0x73, 0x3F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12functionreflection ]]
IFunctionReflection :: struct #raw_union {
	using Vtbl: ^IFunctionReflection_Vtbl,
}
IFunctionReflection_Vtbl :: struct {
	GetDesc: proc "system" (this: ^IFunctionReflection, pDesc: ^FUNCTION_DESC) -> HRESULT,
	GetConstantBufferByIndex: proc "system" (
		this: ^IFunctionReflection,
		BufferIndex: u32,
	) -> ^IShaderReflectionConstantBuffer,
	GetConstantBufferByName: proc "system" (this: ^IFunctionReflection, Name: PSTR) -> ^IShaderReflectionConstantBuffer,
	GetResourceBindingDesc: proc "system" (
		this: ^IFunctionReflection,
		ResourceIndex: u32,
		pDesc: ^SHADER_INPUT_BIND_DESC,
	) -> HRESULT,
	GetVariableByName: proc "system" (this: ^IFunctionReflection, Name: PSTR) -> ^IShaderReflectionVariable,
	GetResourceBindingDescByName: proc "system" (this: ^IFunctionReflection, Name: PSTR, pDesc: ^SHADER_INPUT_BIND_DESC) -> HRESULT,
	GetFunctionParameter: proc "system" (
		this: ^IFunctionReflection,
		ParameterIndex: i32,
	) -> ^IFunctionParameterReflection,
}
IID_ID3D12FunctionReflection :: GUID{0x1108795C, 0x2772, 0x4BA9, {0xB2, 0xA8, 0xD4, 0x64, 0xDC, 0x7E, 0x27, 0x99}}

IGBVDiagnostics :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IGBVDiagnostics_Vtbl,
}
IGBVDiagnostics_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetGBVEntireSubresourceStatesData: proc "system" (this: ^IGBVDiagnostics, pResource: ^IResource, pData: ^i32, DataSize: u32) -> HRESULT,
	GetGBVSubresourceState: proc "system" (this: ^IGBVDiagnostics, pResource: ^IResource, Subresource: u32, pData: ^i32) -> HRESULT,
	GetGBVResourceUniformState: proc "system" (this: ^IGBVDiagnostics, pResource: ^IResource, pData: ^i32) -> HRESULT,
	GetGBVResourceInfo: proc "system" (
		this: ^IGBVDiagnostics,
		pResource: ^IResource,
		pResourceDesc: ^RESOURCE_DESC,
		pResourceHash: ^u32,
		pSubresourceStatesByteOffset: ^u32,
	) -> HRESULT,
	GBVReserved0: proc "system" (this: ^IGBVDiagnostics),
	GBVReserved1: proc "system" (this: ^IGBVDiagnostics),
}
IID_ID3D12GBVDiagnostics :: GUID{0x597985AB, 0x9B75, 0x4DBB, {0xBE, 0x23, 0x07, 0x61, 0x19, 0x5B, 0xEB, 0xEE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist ]]
IGraphicsCommandList :: struct #raw_union {
	#subtype ICommandList: ICommandList,
	using Vtbl: ^IGraphicsCommandList_Vtbl,
}
IGraphicsCommandList_Vtbl :: struct {
	using ICommandList_Vtbl: ICommandList_Vtbl,
	Close: proc "system" (this: ^IGraphicsCommandList) -> HRESULT,
	Reset: proc "system" (
		this: ^IGraphicsCommandList,
		pAllocator: ^ICommandAllocator,
		pInitialState: ^IPipelineState,
	) -> HRESULT,
	ClearState: proc "system" (this: ^IGraphicsCommandList, pPipelineState: ^IPipelineState),
	DrawInstanced: proc "system" (
		this: ^IGraphicsCommandList,
		VertexCountPerInstance: u32,
		InstanceCount: u32,
		StartVertexLocation: u32,
		StartInstanceLocation: u32,
	),
	DrawIndexedInstanced: proc "system" (
		this: ^IGraphicsCommandList,
		IndexCountPerInstance: u32,
		InstanceCount: u32,
		StartIndexLocation: u32,
		BaseVertexLocation: i32,
		StartInstanceLocation: u32,
	),
	Dispatch: proc "system" (
		this: ^IGraphicsCommandList,
		ThreadGroupCountX: u32,
		ThreadGroupCountY: u32,
		ThreadGroupCountZ: u32,
	),
	CopyBufferRegion: proc "system" (
		this: ^IGraphicsCommandList,
		pDstBuffer: ^IResource,
		DstOffset: u64,
		pSrcBuffer: ^IResource,
		SrcOffset: u64,
		NumBytes: u64,
	),
	CopyTextureRegion: proc "system" (
		this: ^IGraphicsCommandList,
		#by_ptr pDst: TEXTURE_COPY_LOCATION,
		DstX: u32,
		DstY: u32,
		DstZ: u32,
		#by_ptr pSrc: TEXTURE_COPY_LOCATION,
		pSrcBox: ^BOX,
	),
	CopyResource: proc "system" (
		this: ^IGraphicsCommandList,
		pDstResource: ^IResource,
		pSrcResource: ^IResource,
	),
	CopyTiles: proc "system" (
		this: ^IGraphicsCommandList,
		pTiledResource: ^IResource,
		#by_ptr pTileRegionStartCoordinate: TILED_RESOURCE_COORDINATE,
		#by_ptr pTileRegionSize: TILE_REGION_SIZE,
		pBuffer: ^IResource,
		BufferStartOffsetInBytes: u64,
		Flags: TILE_COPY_FLAGS,
	),
	ResolveSubresource: proc "system" (
		this: ^IGraphicsCommandList,
		pDstResource: ^IResource,
		DstSubresource: u32,
		pSrcResource: ^IResource,
		SrcSubresource: u32,
		Format: dxgi.FORMAT,
	),
	IASetPrimitiveTopology: proc "system" (this: ^IGraphicsCommandList, PrimitiveTopology: d3d.PRIMITIVE_TOPOLOGY),
	RSSetViewports: proc "system" (this: ^IGraphicsCommandList, NumViewports: u32, pViewports: [^]VIEWPORT),
	RSSetScissorRects: proc "system" (this: ^IGraphicsCommandList, NumRects: u32, pRects: [^]RECT),
	OMSetBlendFactor: proc "system" (this: ^IGraphicsCommandList, BlendFactor: ^[4]f32),
	OMSetStencilRef: proc "system" (this: ^IGraphicsCommandList, StencilRef: u32),
	SetPipelineState: proc "system" (this: ^IGraphicsCommandList, pPipelineState: ^IPipelineState),
	ResourceBarrier: proc "system" (this: ^IGraphicsCommandList, NumBarriers: u32, pBarriers: [^]RESOURCE_BARRIER),
	ExecuteBundle: proc "system" (this: ^IGraphicsCommandList, pCommandList: ^IGraphicsCommandList),
	SetDescriptorHeaps: proc "system" (
		this: ^IGraphicsCommandList,
		NumDescriptorHeaps: u32,
		ppDescriptorHeaps: [^]^IDescriptorHeap,
	),
	SetComputeRootSignature: proc "system" (this: ^IGraphicsCommandList, pRootSignature: ^IRootSignature),
	SetGraphicsRootSignature: proc "system" (this: ^IGraphicsCommandList, pRootSignature: ^IRootSignature),
	SetComputeRootDescriptorTable: proc "system" (
		this: ^IGraphicsCommandList,
		RootParameterIndex: u32,
		BaseDescriptor: GPU_DESCRIPTOR_HANDLE,
	),
	SetGraphicsRootDescriptorTable: proc "system" (
		this: ^IGraphicsCommandList,
		RootParameterIndex: u32,
		BaseDescriptor: GPU_DESCRIPTOR_HANDLE,
	),
	SetComputeRoot32BitConstant: proc "system" (
		this: ^IGraphicsCommandList,
		RootParameterIndex: u32,
		SrcData: u32,
		DestOffsetIn32BitValues: u32,
	),
	SetGraphicsRoot32BitConstant: proc "system" (
		this: ^IGraphicsCommandList,
		RootParameterIndex: u32,
		SrcData: u32,
		DestOffsetIn32BitValues: u32,
	),
	SetComputeRoot32BitConstants: proc "system" (
		this: ^IGraphicsCommandList,
		RootParameterIndex: u32,
		Num32BitValuesToSet: u32,
		pSrcData: rawptr,
		DestOffsetIn32BitValues: u32,
	),
	SetGraphicsRoot32BitConstants: proc "system" (
		this: ^IGraphicsCommandList,
		RootParameterIndex: u32,
		Num32BitValuesToSet: u32,
		pSrcData: rawptr,
		DestOffsetIn32BitValues: u32,
	),
	SetComputeRootConstantBufferView: proc "system" (this: ^IGraphicsCommandList, RootParameterIndex: u32, BufferLocation: u64),
	SetGraphicsRootConstantBufferView: proc "system" (this: ^IGraphicsCommandList, RootParameterIndex: u32, BufferLocation: u64),
	SetComputeRootShaderResourceView: proc "system" (this: ^IGraphicsCommandList, RootParameterIndex: u32, BufferLocation: u64),
	SetGraphicsRootShaderResourceView: proc "system" (this: ^IGraphicsCommandList, RootParameterIndex: u32, BufferLocation: u64),
	SetComputeRootUnorderedAccessView: proc "system" (this: ^IGraphicsCommandList, RootParameterIndex: u32, BufferLocation: u64),
	SetGraphicsRootUnorderedAccessView: proc "system" (this: ^IGraphicsCommandList, RootParameterIndex: u32, BufferLocation: u64),
	IASetIndexBuffer: proc "system" (this: ^IGraphicsCommandList, pView: ^INDEX_BUFFER_VIEW),
	IASetVertexBuffers: proc "system" (
		this: ^IGraphicsCommandList,
		StartSlot: u32,
		NumViews: u32,
		pViews: [^]VERTEX_BUFFER_VIEW,
	),
	SOSetTargets: proc "system" (
		this: ^IGraphicsCommandList,
		StartSlot: u32,
		NumViews: u32,
		pViews: [^]STREAM_OUTPUT_BUFFER_VIEW,
	),
	OMSetRenderTargets: proc "system" (
		this: ^IGraphicsCommandList,
		NumRenderTargetDescriptors: u32,
		pRenderTargetDescriptors: ^CPU_DESCRIPTOR_HANDLE,
		RTsSingleHandleToDescriptorRange: BOOL,
		pDepthStencilDescriptor: ^CPU_DESCRIPTOR_HANDLE,
	),
	ClearDepthStencilView: proc "system" (
		this: ^IGraphicsCommandList,
		DepthStencilView: CPU_DESCRIPTOR_HANDLE,
		ClearFlags: CLEAR_FLAGS,
		Depth: f32,
		Stencil: u8,
		NumRects: u32,
		pRects: [^]RECT,
	),
	ClearRenderTargetView: proc "system" (
		this: ^IGraphicsCommandList,
		RenderTargetView: CPU_DESCRIPTOR_HANDLE,
		ColorRGBA: ^[4]f32,
		NumRects: u32,
		pRects: [^]RECT,
	),
	ClearUnorderedAccessViewUint: proc "system" (
		this: ^IGraphicsCommandList,
		ViewGPUHandleInCurrentHeap: GPU_DESCRIPTOR_HANDLE,
		ViewCPUHandle: CPU_DESCRIPTOR_HANDLE,
		pResource: ^IResource,
		Values: ^[4]u32,
		NumRects: u32,
		pRects: [^]RECT,
	),
	ClearUnorderedAccessViewFloat: proc "system" (
		this: ^IGraphicsCommandList,
		ViewGPUHandleInCurrentHeap: GPU_DESCRIPTOR_HANDLE,
		ViewCPUHandle: CPU_DESCRIPTOR_HANDLE,
		pResource: ^IResource,
		Values: ^[4]f32,
		NumRects: u32,
		pRects: [^]RECT,
	),
	DiscardResource: proc "system" (this: ^IGraphicsCommandList, pResource: ^IResource, pRegion: ^DISCARD_REGION),
	BeginQuery: proc "system" (
		this: ^IGraphicsCommandList,
		pQueryHeap: ^IQueryHeap,
		Type: QUERY_TYPE,
		Index: u32,
	),
	EndQuery: proc "system" (
		this: ^IGraphicsCommandList,
		pQueryHeap: ^IQueryHeap,
		Type: QUERY_TYPE,
		Index: u32,
	),
	ResolveQueryData: proc "system" (
		this: ^IGraphicsCommandList,
		pQueryHeap: ^IQueryHeap,
		Type: QUERY_TYPE,
		StartIndex: u32,
		NumQueries: u32,
		pDestinationBuffer: ^IResource,
		AlignedDestinationBufferOffset: u64,
	),
	SetPredication: proc "system" (
		this: ^IGraphicsCommandList,
		pBuffer: ^IResource,
		AlignedBufferOffset: u64,
		Operation: PREDICATION_OP,
	),
	SetMarker: proc "system" (this: ^IGraphicsCommandList, Metadata: u32, pData: rawptr, Size: u32),
	BeginEvent: proc "system" (this: ^IGraphicsCommandList, Metadata: u32, pData: rawptr, Size: u32),
	EndEvent: proc "system" (this: ^IGraphicsCommandList),
	ExecuteIndirect: proc "system" (
		this: ^IGraphicsCommandList,
		pCommandSignature: ^ICommandSignature,
		MaxCommandCount: u32,
		pArgumentBuffer: ^IResource,
		ArgumentBufferOffset: u64,
		pCountBuffer: ^IResource,
		CountBufferOffset: u64,
	),
}
IID_ID3D12GraphicsCommandList :: GUID{0x5B160D0F, 0xAC1B, 0x4185, {0x8B, 0xA8, 0xB3, 0xAE, 0x42, 0xA5, 0xA4, 0x55}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist1 ]]
IGraphicsCommandList1 :: struct #raw_union {
	#subtype IGraphicsCommandList: IGraphicsCommandList,
	using Vtbl: ^IGraphicsCommandList1_Vtbl,
}
IGraphicsCommandList1_Vtbl :: struct {
	using IGraphicsCommandList_Vtbl: IGraphicsCommandList_Vtbl,
	AtomicCopyBufferUINT: proc "system" (
		this: ^IGraphicsCommandList1,
		pDstBuffer: ^IResource,
		DstOffset: u64,
		pSrcBuffer: ^IResource,
		SrcOffset: u64,
		Dependencies: u32,
		ppDependentResources: [^]^IResource,
		pDependentSubresourceRanges: [^]SUBRESOURCE_RANGE_UINT64,
	),
	AtomicCopyBufferUINT64: proc "system" (
		this: ^IGraphicsCommandList1,
		pDstBuffer: ^IResource,
		DstOffset: u64,
		pSrcBuffer: ^IResource,
		SrcOffset: u64,
		Dependencies: u32,
		ppDependentResources: [^]^IResource,
		pDependentSubresourceRanges: [^]SUBRESOURCE_RANGE_UINT64,
	),
	OMSetDepthBounds: proc "system" (this: ^IGraphicsCommandList1, Min: f32, Max: f32),
	SetSamplePositions: proc "system" (
		this: ^IGraphicsCommandList1,
		NumSamplesPerPixel: u32,
		NumPixels: u32,
		pSamplePositions: ^SAMPLE_POSITION,
	),
	ResolveSubresourceRegion: proc "system" (
		this: ^IGraphicsCommandList1,
		pDstResource: ^IResource,
		DstSubresource: u32,
		DstX: u32,
		DstY: u32,
		pSrcResource: ^IResource,
		SrcSubresource: u32,
		pSrcRect: ^RECT,
		Format: dxgi.FORMAT,
		ResolveMode: RESOLVE_MODE,
	),
	SetViewInstanceMask: proc "system" (this: ^IGraphicsCommandList1, Mask: u32),
}
IID_ID3D12GraphicsCommandList1 :: GUID{0x553103FB, 0x1FE7, 0x4557, {0xBB, 0x38, 0x94, 0x6D, 0x7D, 0x0E, 0x7C, 0xA7}}

IGraphicsCommandList10 :: struct #raw_union {
	#subtype IGraphicsCommandList9: IGraphicsCommandList9,
	using Vtbl: ^IGraphicsCommandList10_Vtbl,
}
IGraphicsCommandList10_Vtbl :: struct {
	using IGraphicsCommandList9_Vtbl: IGraphicsCommandList9_Vtbl,
	SetProgram: proc "system" (this: ^IGraphicsCommandList10, #by_ptr pDesc: SET_PROGRAM_DESC),
	DispatchGraph: proc "system" (this: ^IGraphicsCommandList10, #by_ptr pDesc: DISPATCH_GRAPH_DESC),
}
IID_ID3D12GraphicsCommandList10 :: GUID{0x7013C015, 0xD161, 0x4B63, {0xA0, 0x8C, 0x23, 0x85, 0x52, 0xDD, 0x8A, 0xCC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist2 ]]
IGraphicsCommandList2 :: struct #raw_union {
	#subtype IGraphicsCommandList1: IGraphicsCommandList1,
	using Vtbl: ^IGraphicsCommandList2_Vtbl,
}
IGraphicsCommandList2_Vtbl :: struct {
	using IGraphicsCommandList1_Vtbl: IGraphicsCommandList1_Vtbl,
	WriteBufferImmediate: proc "system" (
		this: ^IGraphicsCommandList2,
		Count: u32,
		pParams: [^]WRITEBUFFERIMMEDIATE_PARAMETER,
		pModes: [^]WRITEBUFFERIMMEDIATE_MODE,
	),
}
IID_ID3D12GraphicsCommandList2 :: GUID{0x38C3E585, 0xFF17, 0x412C, {0x91, 0x50, 0x4F, 0xC6, 0xF9, 0xD7, 0x2A, 0x28}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist3 ]]
IGraphicsCommandList3 :: struct #raw_union {
	#subtype IGraphicsCommandList2: IGraphicsCommandList2,
	using Vtbl: ^IGraphicsCommandList3_Vtbl,
}
IGraphicsCommandList3_Vtbl :: struct {
	using IGraphicsCommandList2_Vtbl: IGraphicsCommandList2_Vtbl,
	SetProtectedResourceSession: proc "system" (
		this: ^IGraphicsCommandList3,
		pProtectedResourceSession: ^IProtectedResourceSession,
	),
}
IID_ID3D12GraphicsCommandList3 :: GUID{0x6FDA83A7, 0xB84C, 0x4E38, {0x9A, 0xC8, 0xC7, 0xBD, 0x22, 0x01, 0x6B, 0x3D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist4 ]]
IGraphicsCommandList4 :: struct #raw_union {
	#subtype IGraphicsCommandList3: IGraphicsCommandList3,
	using Vtbl: ^IGraphicsCommandList4_Vtbl,
}
IGraphicsCommandList4_Vtbl :: struct {
	using IGraphicsCommandList3_Vtbl: IGraphicsCommandList3_Vtbl,
	BeginRenderPass: proc "system" (
		this: ^IGraphicsCommandList4,
		NumRenderTargets: u32,
		pRenderTargets: [^]RENDER_PASS_RENDER_TARGET_DESC,
		pDepthStencil: ^RENDER_PASS_DEPTH_STENCIL_DESC,
		Flags: RENDER_PASS_FLAGS,
	),
	EndRenderPass: proc "system" (this: ^IGraphicsCommandList4),
	InitializeMetaCommand: proc "system" (
		this: ^IGraphicsCommandList4,
		pMetaCommand: ^IMetaCommand,
		pInitializationParametersData: rawptr,
		InitializationParametersDataSizeInBytes: uintptr,
	),
	ExecuteMetaCommand: proc "system" (
		this: ^IGraphicsCommandList4,
		pMetaCommand: ^IMetaCommand,
		pExecutionParametersData: rawptr,
		ExecutionParametersDataSizeInBytes: uintptr,
	),
	BuildRaytracingAccelerationStructure: proc "system" (
		this: ^IGraphicsCommandList4,
		#by_ptr pDesc: BUILD_RAYTRACING_ACCELERATION_STRUCTURE_DESC,
		NumPostbuildInfoDescs: u32,
		pPostbuildInfoDescs: [^]RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_DESC,
	),
	EmitRaytracingAccelerationStructurePostbuildInfo: proc "system" (
		this: ^IGraphicsCommandList4,
		#by_ptr pDesc: RAYTRACING_ACCELERATION_STRUCTURE_POSTBUILD_INFO_DESC,
		NumSourceAccelerationStructures: u32,
		pSourceAccelerationStructureData: [^]u64,
	),
	CopyRaytracingAccelerationStructure: proc "system" (
		this: ^IGraphicsCommandList4,
		DestAccelerationStructureData: u64,
		SourceAccelerationStructureData: u64,
		Mode: RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE,
	),
	SetPipelineState1: proc "system" (this: ^IGraphicsCommandList4, pStateObject: ^IStateObject),
	DispatchRays: proc "system" (this: ^IGraphicsCommandList4, #by_ptr pDesc: DISPATCH_RAYS_DESC),
}
IID_ID3D12GraphicsCommandList4 :: GUID{0x8754318E, 0xD3A9, 0x4541, {0x98, 0xCF, 0x64, 0x5B, 0x50, 0xDC, 0x48, 0x74}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist5 ]]
IGraphicsCommandList5 :: struct #raw_union {
	#subtype IGraphicsCommandList4: IGraphicsCommandList4,
	using Vtbl: ^IGraphicsCommandList5_Vtbl,
}
IGraphicsCommandList5_Vtbl :: struct {
	using IGraphicsCommandList4_Vtbl: IGraphicsCommandList4_Vtbl,
	RSSetShadingRate: proc "system" (
		this: ^IGraphicsCommandList5,
		baseShadingRate: SHADING_RATE,
		combiners: ^SHADING_RATE_COMBINER,
	),
	RSSetShadingRateImage: proc "system" (this: ^IGraphicsCommandList5, shadingRateImage: ^IResource),
}
IID_ID3D12GraphicsCommandList5 :: GUID{0x55050859, 0x4024, 0x474C, {0x87, 0xF5, 0x64, 0x72, 0xEA, 0xEE, 0x44, 0xEA}}

IGraphicsCommandList6 :: struct #raw_union {
	#subtype IGraphicsCommandList5: IGraphicsCommandList5,
	using Vtbl: ^IGraphicsCommandList6_Vtbl,
}
IGraphicsCommandList6_Vtbl :: struct {
	using IGraphicsCommandList5_Vtbl: IGraphicsCommandList5_Vtbl,
	DispatchMesh: proc "system" (
		this: ^IGraphicsCommandList6,
		ThreadGroupCountX: u32,
		ThreadGroupCountY: u32,
		ThreadGroupCountZ: u32,
	),
}
IID_ID3D12GraphicsCommandList6 :: GUID{0xC3827890, 0xE548, 0x4CFA, {0x96, 0xCF, 0x56, 0x89, 0xA9, 0x37, 0x0F, 0x80}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12graphicscommandlist7 ]]
IGraphicsCommandList7 :: struct #raw_union {
	#subtype IGraphicsCommandList6: IGraphicsCommandList6,
	using Vtbl: ^IGraphicsCommandList7_Vtbl,
}
IGraphicsCommandList7_Vtbl :: struct {
	using IGraphicsCommandList6_Vtbl: IGraphicsCommandList6_Vtbl,
	Barrier: proc "system" (
		this: ^IGraphicsCommandList7,
		NumBarrierGroups: u32,
		pBarrierGroups: [^]BARRIER_GROUP,
	),
}
IID_ID3D12GraphicsCommandList7 :: GUID{0xDD171223, 0x8B61, 0x4769, {0x90, 0xE3, 0x16, 0x0C, 0xCD, 0xE4, 0xE2, 0xC1}}

IGraphicsCommandList8 :: struct #raw_union {
	#subtype IGraphicsCommandList7: IGraphicsCommandList7,
	using Vtbl: ^IGraphicsCommandList8_Vtbl,
}
IGraphicsCommandList8_Vtbl :: struct {
	using IGraphicsCommandList7_Vtbl: IGraphicsCommandList7_Vtbl,
	OMSetFrontAndBackStencilRef: proc "system" (this: ^IGraphicsCommandList8, FrontStencilRef: u32, BackStencilRef: u32),
}
IID_ID3D12GraphicsCommandList8 :: GUID{0xEE936EF9, 0x599D, 0x4D28, {0x93, 0x8E, 0x23, 0xC4, 0xAD, 0x05, 0xCE, 0x51}}

IGraphicsCommandList9 :: struct #raw_union {
	#subtype IGraphicsCommandList8: IGraphicsCommandList8,
	using Vtbl: ^IGraphicsCommandList9_Vtbl,
}
IGraphicsCommandList9_Vtbl :: struct {
	using IGraphicsCommandList8_Vtbl: IGraphicsCommandList8_Vtbl,
	RSSetDepthBias: proc "system" (
		this: ^IGraphicsCommandList9,
		DepthBias: f32,
		DepthBiasClamp: f32,
		SlopeScaledDepthBias: f32,
	),
	IASetIndexBufferStripCutValue: proc "system" (
		this: ^IGraphicsCommandList9,
		IBStripCutValue: INDEX_BUFFER_STRIP_CUT_VALUE,
	),
}
IID_ID3D12GraphicsCommandList9 :: GUID{0x34ED2808, 0xFFE6, 0x4C2B, {0xB1, 0x1A, 0xCA, 0xBD, 0x2B, 0x0C, 0x59, 0xE1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12heap ]]
IHeap :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^IHeap_Vtbl,
}
IHeap_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
	GetDesc: proc "system" (this: ^IHeap) -> HEAP_DESC,
}
IID_ID3D12Heap :: GUID{0x6B3B2502, 0x6E51, 0x45B3, {0x90, 0xEE, 0x98, 0x84, 0x26, 0x5E, 0x8D, 0xF3}}

IHeap1 :: struct #raw_union {
	#subtype IHeap: IHeap,
	using Vtbl: ^IHeap1_Vtbl,
}
IHeap1_Vtbl :: struct {
	using IHeap_Vtbl: IHeap_Vtbl,
	GetProtectedResourceSession: proc "system" (this: ^IHeap1, #by_ptr riid: GUID, ppProtectedSession: rawptr) -> HRESULT,
}
IID_ID3D12Heap1 :: GUID{0x572F7389, 0x2168, 0x49E3, {0x96, 0x93, 0xD6, 0xDF, 0x58, 0x71, 0xBF, 0x6D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12infoqueue ]]
IInfoQueue :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInfoQueue_Vtbl,
}
IInfoQueue_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetMessageCountLimit: proc "system" (this: ^IInfoQueue, MessageCountLimit: u64) -> HRESULT,
	ClearStoredMessages: proc "system" (this: ^IInfoQueue),
	GetMessage: proc "system" (
		this: ^IInfoQueue,
		MessageIndex: u64,
		pMessage: ^MESSAGE,
		pMessageByteLength: ^uintptr,
	) -> HRESULT,
	GetNumMessagesAllowedByStorageFilter: proc "system" (this: ^IInfoQueue) -> u64,
	GetNumMessagesDeniedByStorageFilter: proc "system" (this: ^IInfoQueue) -> u64,
	GetNumStoredMessages: proc "system" (this: ^IInfoQueue) -> u64,
	GetNumStoredMessagesAllowedByRetrievalFilter: proc "system" (this: ^IInfoQueue) -> u64,
	GetNumMessagesDiscardedByMessageCountLimit: proc "system" (this: ^IInfoQueue) -> u64,
	GetMessageCountLimit: proc "system" (this: ^IInfoQueue) -> u64,
	AddStorageFilterEntries: proc "system" (this: ^IInfoQueue, pFilter: ^INFO_QUEUE_FILTER) -> HRESULT,
	GetStorageFilter: proc "system" (
		this: ^IInfoQueue,
		pFilter: ^INFO_QUEUE_FILTER,
		pFilterByteLength: ^uintptr,
	) -> HRESULT,
	ClearStorageFilter: proc "system" (this: ^IInfoQueue),
	PushEmptyStorageFilter: proc "system" (this: ^IInfoQueue) -> HRESULT,
	PushCopyOfStorageFilter: proc "system" (this: ^IInfoQueue) -> HRESULT,
	PushStorageFilter: proc "system" (this: ^IInfoQueue, pFilter: ^INFO_QUEUE_FILTER) -> HRESULT,
	PopStorageFilter: proc "system" (this: ^IInfoQueue),
	GetStorageFilterStackSize: proc "system" (this: ^IInfoQueue) -> u32,
	AddRetrievalFilterEntries: proc "system" (this: ^IInfoQueue, pFilter: ^INFO_QUEUE_FILTER) -> HRESULT,
	GetRetrievalFilter: proc "system" (
		this: ^IInfoQueue,
		pFilter: ^INFO_QUEUE_FILTER,
		pFilterByteLength: ^uintptr,
	) -> HRESULT,
	ClearRetrievalFilter: proc "system" (this: ^IInfoQueue),
	PushEmptyRetrievalFilter: proc "system" (this: ^IInfoQueue) -> HRESULT,
	PushCopyOfRetrievalFilter: proc "system" (this: ^IInfoQueue) -> HRESULT,
	PushRetrievalFilter: proc "system" (this: ^IInfoQueue, pFilter: ^INFO_QUEUE_FILTER) -> HRESULT,
	PopRetrievalFilter: proc "system" (this: ^IInfoQueue),
	GetRetrievalFilterStackSize: proc "system" (this: ^IInfoQueue) -> u32,
	AddMessage: proc "system" (
		this: ^IInfoQueue,
		Category: MESSAGE_CATEGORY,
		Severity: MESSAGE_SEVERITY,
		ID: MESSAGE_ID,
		pDescription: PSTR,
	) -> HRESULT,
	AddApplicationMessage: proc "system" (this: ^IInfoQueue, Severity: MESSAGE_SEVERITY, pDescription: PSTR) -> HRESULT,
	SetBreakOnCategory: proc "system" (this: ^IInfoQueue, Category: MESSAGE_CATEGORY, bEnable: BOOL) -> HRESULT,
	SetBreakOnSeverity: proc "system" (this: ^IInfoQueue, Severity: MESSAGE_SEVERITY, bEnable: BOOL) -> HRESULT,
	SetBreakOnID: proc "system" (this: ^IInfoQueue, ID: MESSAGE_ID, bEnable: BOOL) -> HRESULT,
	GetBreakOnCategory: proc "system" (this: ^IInfoQueue, Category: MESSAGE_CATEGORY) -> BOOL,
	GetBreakOnSeverity: proc "system" (this: ^IInfoQueue, Severity: MESSAGE_SEVERITY) -> BOOL,
	GetBreakOnID: proc "system" (this: ^IInfoQueue, ID: MESSAGE_ID) -> BOOL,
	SetMuteDebugOutput: proc "system" (this: ^IInfoQueue, bMute: BOOL),
	GetMuteDebugOutput: proc "system" (this: ^IInfoQueue) -> BOOL,
}
IID_ID3D12InfoQueue :: GUID{0x0742A90B, 0xC387, 0x483F, {0xB9, 0x46, 0x30, 0xA7, 0xE4, 0xE6, 0x14, 0x58}}

IInfoQueue1 :: struct #raw_union {
	#subtype IInfoQueue: IInfoQueue,
	using Vtbl: ^IInfoQueue1_Vtbl,
}
IInfoQueue1_Vtbl :: struct {
	using IInfoQueue_Vtbl: IInfoQueue_Vtbl,
	RegisterMessageCallback: proc "system" (
		this: ^IInfoQueue1,
		CallbackFunc: MessageFunc,
		CallbackFilterFlags: MESSAGE_CALLBACK_FLAGS,
		pContext: rawptr,
		pCallbackCookie: ^u32,
	) -> HRESULT,
	UnregisterMessageCallback: proc "system" (this: ^IInfoQueue1, CallbackCookie: u32) -> HRESULT,
}
IID_ID3D12InfoQueue1 :: GUID{0x2852DD88, 0xB484, 0x4C0C, {0xB6, 0xB1, 0x67, 0x16, 0x85, 0x00, 0xE6, 0x00}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12libraryreflection ]]
ILibraryReflection :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILibraryReflection_Vtbl,
}
ILibraryReflection_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDesc: proc "system" (this: ^ILibraryReflection, pDesc: ^LIBRARY_DESC) -> HRESULT,
	GetFunctionByIndex: proc "system" (this: ^ILibraryReflection, FunctionIndex: i32) -> ^IFunctionReflection,
}
IID_ID3D12LibraryReflection :: GUID{0x8E349D19, 0x54DB, 0x4A56, {0x9D, 0xC9, 0x11, 0x9D, 0x87, 0xBD, 0xB8, 0x04}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12lifetimeowner ]]
ILifetimeOwner :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILifetimeOwner_Vtbl,
}
ILifetimeOwner_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	LifetimeStateUpdated: proc "system" (this: ^ILifetimeOwner, NewState: LIFETIME_STATE),
}
IID_ID3D12LifetimeOwner :: GUID{0xE667AF9F, 0xCD56, 0x4F46, {0x83, 0xCE, 0x03, 0x2E, 0x59, 0x5D, 0x70, 0xA8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12lifetimetracker ]]
ILifetimeTracker :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^ILifetimeTracker_Vtbl,
}
ILifetimeTracker_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	DestroyOwnedObject: proc "system" (this: ^ILifetimeTracker, pObject: ^IDeviceChild) -> HRESULT,
}
IID_ID3D12LifetimeTracker :: GUID{0x3FD03D36, 0x4EB1, 0x424A, {0xA5, 0x82, 0x49, 0x4E, 0xCB, 0x8B, 0xA8, 0x13}}

IManualWriteTrackingResource :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IManualWriteTrackingResource_Vtbl,
}
IManualWriteTrackingResource_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	TrackWrite: proc "system" (this: ^IManualWriteTrackingResource, Subresource: u32, pWrittenRange: ^RANGE),
}
IID_ID3D12ManualWriteTrackingResource :: GUID{0x86CA3B85, 0x49AD, 0x4B6E, {0xAE, 0xD5, 0xED, 0xDB, 0x18, 0x54, 0x0F, 0x41}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12metacommand ]]
IMetaCommand :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^IMetaCommand_Vtbl,
}
IMetaCommand_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
	GetRequiredParameterResourceSize: proc "system" (
		this: ^IMetaCommand,
		Stage: META_COMMAND_PARAMETER_STAGE,
		ParameterIndex: u32,
	) -> u64,
}
IID_ID3D12MetaCommand :: GUID{0xDBB84C27, 0x36CE, 0x4FC9, {0xB8, 0x01, 0xF0, 0x48, 0xC4, 0x6A, 0xC5, 0x70}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12object ]]
IObject :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObject_Vtbl,
}
IObject_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetPrivateData: proc "system" (this: ^IObject, #by_ptr guid: GUID, pDataSize: ^u32, pData: rawptr) -> HRESULT,
	SetPrivateData: proc "system" (this: ^IObject, #by_ptr guid: GUID, DataSize: u32, pData: rawptr) -> HRESULT,
	SetPrivateDataInterface: proc "system" (this: ^IObject, #by_ptr guid: GUID, pData: ^IUnknown) -> HRESULT,
	SetName: proc "system" (this: ^IObject, Name: PWSTR) -> HRESULT,
}
IID_ID3D12Object :: GUID{0xC4FEC28F, 0x7966, 0x4E95, {0x9F, 0x94, 0xF4, 0x31, 0xCB, 0x56, 0xC3, 0xB8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12pageable ]]
IPageable :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IPageable_Vtbl,
}
IPageable_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D12Pageable :: GUID{0x63EE58FB, 0x1268, 0x4835, {0x86, 0xDA, 0xF0, 0x08, 0xCE, 0x62, 0xF0, 0xD6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12pipelinelibrary ]]
IPipelineLibrary :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IPipelineLibrary_Vtbl,
}
IPipelineLibrary_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	StorePipeline: proc "system" (this: ^IPipelineLibrary, pName: PWSTR, pPipeline: ^IPipelineState) -> HRESULT,
	LoadGraphicsPipeline: proc "system" (
		this: ^IPipelineLibrary,
		pName: PWSTR,
		#by_ptr pDesc: GRAPHICS_PIPELINE_STATE_DESC,
		#by_ptr riid: GUID,
		ppPipelineState: rawptr,
	) -> HRESULT,
	LoadComputePipeline: proc "system" (
		this: ^IPipelineLibrary,
		pName: PWSTR,
		#by_ptr pDesc: COMPUTE_PIPELINE_STATE_DESC,
		#by_ptr riid: GUID,
		ppPipelineState: rawptr,
	) -> HRESULT,
	GetSerializedSize: proc "system" (this: ^IPipelineLibrary) -> uintptr,
	Serialize: proc "system" (this: ^IPipelineLibrary, pData: rawptr, DataSizeInBytes: uintptr) -> HRESULT,
}
IID_ID3D12PipelineLibrary :: GUID{0xC64226A8, 0x9201, 0x46AF, {0xB4, 0xCC, 0x53, 0xFB, 0x9F, 0xF7, 0x41, 0x4F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12pipelinelibrary1 ]]
IPipelineLibrary1 :: struct #raw_union {
	#subtype IPipelineLibrary: IPipelineLibrary,
	using Vtbl: ^IPipelineLibrary1_Vtbl,
}
IPipelineLibrary1_Vtbl :: struct {
	using IPipelineLibrary_Vtbl: IPipelineLibrary_Vtbl,
	LoadPipeline: proc "system" (
		this: ^IPipelineLibrary1,
		pName: PWSTR,
		#by_ptr pDesc: PIPELINE_STATE_STREAM_DESC,
		#by_ptr riid: GUID,
		ppPipelineState: rawptr,
	) -> HRESULT,
}
IID_ID3D12PipelineLibrary1 :: GUID{0x80EABF42, 0x2568, 0x4E5E, {0xBD, 0x82, 0xC3, 0x7F, 0x86, 0x96, 0x1D, 0xC3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12pipelinestate ]]
IPipelineState :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^IPipelineState_Vtbl,
}
IPipelineState_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
	GetCachedBlob: proc "system" (this: ^IPipelineState, ppBlob: ^^d3d.IBlob) -> HRESULT,
}
IID_ID3D12PipelineState :: GUID{0x765A30F3, 0xF624, 0x4C6F, {0xA8, 0x28, 0xAC, 0xE9, 0x48, 0x62, 0x24, 0x45}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12protectedresourcesession ]]
IProtectedResourceSession :: struct #raw_union {
	#subtype IProtectedSession: IProtectedSession,
	using Vtbl: ^IProtectedResourceSession_Vtbl,
}
IProtectedResourceSession_Vtbl :: struct {
	using IProtectedSession_Vtbl: IProtectedSession_Vtbl,
	GetDesc: proc "system" (this: ^IProtectedResourceSession) -> PROTECTED_RESOURCE_SESSION_DESC,
}
IID_ID3D12ProtectedResourceSession :: GUID{0x6CD696F4, 0xF289, 0x40CC, {0x80, 0x91, 0x5A, 0x6C, 0x0A, 0x09, 0x9C, 0x3D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12protectedresourcesession1 ]]
IProtectedResourceSession1 :: struct #raw_union {
	#subtype IProtectedResourceSession: IProtectedResourceSession,
	using Vtbl: ^IProtectedResourceSession1_Vtbl,
}
IProtectedResourceSession1_Vtbl :: struct {
	using IProtectedResourceSession_Vtbl: IProtectedResourceSession_Vtbl,
	GetDesc1: proc "system" (this: ^IProtectedResourceSession1) -> PROTECTED_RESOURCE_SESSION_DESC1,
}
IID_ID3D12ProtectedResourceSession1 :: GUID{0xD6F12DD6, 0x76FB, 0x406E, {0x89, 0x61, 0x42, 0x96, 0xEE, 0xFC, 0x04, 0x09}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12protectedsession ]]
IProtectedSession :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IProtectedSession_Vtbl,
}
IProtectedSession_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetStatusFence: proc "system" (this: ^IProtectedSession, #by_ptr riid: GUID, ppFence: rawptr) -> HRESULT,
	GetSessionStatus: proc "system" (this: ^IProtectedSession) -> PROTECTED_SESSION_STATUS,
}
IID_ID3D12ProtectedSession :: GUID{0xA1533D18, 0x0AC1, 0x4084, {0x85, 0xB9, 0x89, 0xA9, 0x61, 0x16, 0x80, 0x6B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12queryheap ]]
IQueryHeap :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^IQueryHeap_Vtbl,
}
IQueryHeap_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
}
IID_ID3D12QueryHeap :: GUID{0x0D9658AE, 0xED45, 0x469E, {0xA6, 0x1D, 0x97, 0x0E, 0xC5, 0x83, 0xCA, 0xB4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12resource ]]
IResource :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^IResource_Vtbl,
}
IResource_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
	Map: proc "system" (this: ^IResource, Subresource: u32, pReadRange: ^RANGE, ppData: rawptr) -> HRESULT,
	Unmap: proc "system" (this: ^IResource, Subresource: u32, pWrittenRange: ^RANGE),
	GetDesc: proc "system" (this: ^IResource) -> RESOURCE_DESC,
	GetGPUVirtualAddress: proc "system" (this: ^IResource) -> u64,
	WriteToSubresource: proc "system" (
		this: ^IResource,
		DstSubresource: u32,
		pDstBox: ^BOX,
		pSrcData: rawptr,
		SrcRowPitch: u32,
		SrcDepthPitch: u32,
	) -> HRESULT,
	ReadFromSubresource: proc "system" (
		this: ^IResource,
		pDstData: rawptr,
		DstRowPitch: u32,
		DstDepthPitch: u32,
		SrcSubresource: u32,
		pSrcBox: ^BOX,
	) -> HRESULT,
	GetHeapProperties: proc "system" (
		this: ^IResource,
		pHeapProperties: ^HEAP_PROPERTIES,
		pHeapFlags: ^HEAP_FLAGS,
	) -> HRESULT,
}
IID_ID3D12Resource :: GUID{0x696442BE, 0xA72E, 0x4059, {0xBC, 0x79, 0x5B, 0x5C, 0x98, 0x04, 0x0F, 0xAD}}

IResource1 :: struct #raw_union {
	#subtype IResource: IResource,
	using Vtbl: ^IResource1_Vtbl,
}
IResource1_Vtbl :: struct {
	using IResource_Vtbl: IResource_Vtbl,
	GetProtectedResourceSession: proc "system" (this: ^IResource1, #by_ptr riid: GUID, ppProtectedSession: rawptr) -> HRESULT,
}
IID_ID3D12Resource1 :: GUID{0x9D5E227A, 0x4430, 0x4161, {0x88, 0xB3, 0x3E, 0xCA, 0x6B, 0xB1, 0x6E, 0x19}}

IResource2 :: struct #raw_union {
	#subtype IResource1: IResource1,
	using Vtbl: ^IResource2_Vtbl,
}
IResource2_Vtbl :: struct {
	using IResource1_Vtbl: IResource1_Vtbl,
	GetDesc1: proc "system" (this: ^IResource2) -> RESOURCE_DESC1,
}
IID_ID3D12Resource2 :: GUID{0xBE36EC3B, 0xEA85, 0x4AEB, {0xA4, 0x5A, 0xE9, 0xD7, 0x64, 0x04, 0xA4, 0x95}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignature ]]
IRootSignature :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IRootSignature_Vtbl,
}
IRootSignature_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D12RootSignature :: GUID{0xC54A6B66, 0x72DF, 0x4EE8, {0x8B, 0xE5, 0xA9, 0x46, 0xA1, 0x42, 0x92, 0x14}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12rootsignaturedeserializer ]]
IRootSignatureDeserializer :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRootSignatureDeserializer_Vtbl,
}
IRootSignatureDeserializer_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetRootSignatureDesc: proc "system" (this: ^IRootSignatureDeserializer) -> ^ROOT_SIGNATURE_DESC,
}
IID_ID3D12RootSignatureDeserializer :: GUID{0x34AB647B, 0x3CC8, 0x46AC, {0x84, 0x1B, 0xC0, 0x96, 0x56, 0x45, 0xC0, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12sdkconfiguration ]]
ISDKConfiguration :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISDKConfiguration_Vtbl,
}
ISDKConfiguration_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetSDKVersion: proc "system" (this: ^ISDKConfiguration, SDKVersion: u32, SDKPath: PSTR) -> HRESULT,
}
IID_ID3D12SDKConfiguration :: GUID{0xE9EB5314, 0x33AA, 0x42B2, {0xA7, 0x18, 0xD7, 0x7F, 0x58, 0xB1, 0xF1, 0xC7}}

ISDKConfiguration1 :: struct #raw_union {
	#subtype ISDKConfiguration: ISDKConfiguration,
	using Vtbl: ^ISDKConfiguration1_Vtbl,
}
ISDKConfiguration1_Vtbl :: struct {
	using ISDKConfiguration_Vtbl: ISDKConfiguration_Vtbl,
	CreateDeviceFactory: proc "system" (
		this: ^ISDKConfiguration1,
		SDKVersion: u32,
		SDKPath: PSTR,
		#by_ptr riid: GUID,
		ppvFactory: rawptr,
	) -> HRESULT,
	FreeUnusedSDKs: proc "system" (this: ^ISDKConfiguration1),
}
IID_ID3D12SDKConfiguration1 :: GUID{0x8AAF9303, 0xAD25, 0x48B9, {0x9A, 0x57, 0xD9, 0xC3, 0x7E, 0x00, 0x9D, 0x9F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12shadercachesession ]]
IShaderCacheSession :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IShaderCacheSession_Vtbl,
}
IShaderCacheSession_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	FindValue: proc "system" (
		this: ^IShaderCacheSession,
		pKey: rawptr,
		KeySize: u32,
		pValue: rawptr,
		pValueSize: ^u32,
	) -> HRESULT,
	StoreValue: proc "system" (
		this: ^IShaderCacheSession,
		pKey: rawptr,
		KeySize: u32,
		pValue: rawptr,
		ValueSize: u32,
	) -> HRESULT,
	SetDeleteOnDestroy: proc "system" (this: ^IShaderCacheSession),
	GetDesc: proc "system" (this: ^IShaderCacheSession) -> SHADER_CACHE_SESSION_DESC,
}
IID_ID3D12ShaderCacheSession :: GUID{0x28E2495D, 0x0F64, 0x4AE4, {0xA6, 0xEC, 0x12, 0x92, 0x55, 0xDC, 0x49, 0xA8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12shaderreflection ]]
IShaderReflection :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShaderReflection_Vtbl,
}
IShaderReflection_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDesc: proc "system" (this: ^IShaderReflection, pDesc: ^SHADER_DESC) -> HRESULT,
	GetConstantBufferByIndex: proc "system" (this: ^IShaderReflection, Index: u32) -> ^IShaderReflectionConstantBuffer,
	GetConstantBufferByName: proc "system" (this: ^IShaderReflection, Name: PSTR) -> ^IShaderReflectionConstantBuffer,
	GetResourceBindingDesc: proc "system" (
		this: ^IShaderReflection,
		ResourceIndex: u32,
		pDesc: ^SHADER_INPUT_BIND_DESC,
	) -> HRESULT,
	GetInputParameterDesc: proc "system" (
		this: ^IShaderReflection,
		ParameterIndex: u32,
		pDesc: ^SIGNATURE_PARAMETER_DESC,
	) -> HRESULT,
	GetOutputParameterDesc: proc "system" (
		this: ^IShaderReflection,
		ParameterIndex: u32,
		pDesc: ^SIGNATURE_PARAMETER_DESC,
	) -> HRESULT,
	GetPatchConstantParameterDesc: proc "system" (
		this: ^IShaderReflection,
		ParameterIndex: u32,
		pDesc: ^SIGNATURE_PARAMETER_DESC,
	) -> HRESULT,
	GetVariableByName: proc "system" (this: ^IShaderReflection, Name: PSTR) -> ^IShaderReflectionVariable,
	GetResourceBindingDescByName: proc "system" (this: ^IShaderReflection, Name: PSTR, pDesc: ^SHADER_INPUT_BIND_DESC) -> HRESULT,
	GetMovInstructionCount: proc "system" (this: ^IShaderReflection) -> u32,
	GetMovcInstructionCount: proc "system" (this: ^IShaderReflection) -> u32,
	GetConversionInstructionCount: proc "system" (this: ^IShaderReflection) -> u32,
	GetBitwiseInstructionCount: proc "system" (this: ^IShaderReflection) -> u32,
	GetGSInputPrimitive: proc "system" (this: ^IShaderReflection) -> d3d.PRIMITIVE,
	IsSampleFrequencyShader: proc "system" (this: ^IShaderReflection) -> BOOL,
	GetNumInterfaceSlots: proc "system" (this: ^IShaderReflection) -> u32,
	GetMinFeatureLevel: proc "system" (this: ^IShaderReflection, pLevel: ^d3d.FEATURE_LEVEL) -> HRESULT,
	GetThreadGroupSize: proc "system" (this: ^IShaderReflection, pSizeX: ^u32, pSizeY: ^u32, pSizeZ: ^u32) -> u32,
	GetRequiresFlags: proc "system" (this: ^IShaderReflection) -> u64,
}
IID_ID3D12ShaderReflection :: GUID{0x5A58797D, 0xA72C, 0x478D, {0x8B, 0xA2, 0xEF, 0xC6, 0xB0, 0xEF, 0xE8, 0x8E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionconstantbuffer ]]
IShaderReflectionConstantBuffer :: struct #raw_union {
	using Vtbl: ^IShaderReflectionConstantBuffer_Vtbl,
}
IShaderReflectionConstantBuffer_Vtbl :: struct {
	GetDesc: proc "system" (this: ^IShaderReflectionConstantBuffer, pDesc: ^SHADER_BUFFER_DESC) -> HRESULT,
	GetVariableByIndex: proc "system" (
		this: ^IShaderReflectionConstantBuffer,
		Index: u32,
	) -> ^IShaderReflectionVariable,
	GetVariableByName: proc "system" (
		this: ^IShaderReflectionConstantBuffer,
		Name: PSTR,
	) -> ^IShaderReflectionVariable,
}
IID_ID3D12ShaderReflectionConstantBuffer :: GUID{0xC59598B4, 0x48B3, 0x4869, {0xB9, 0xB1, 0xB1, 0x61, 0x8B, 0x14, 0xA8, 0xB7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectiontype ]]
IShaderReflectionType :: struct #raw_union {
	using Vtbl: ^IShaderReflectionType_Vtbl,
}
IShaderReflectionType_Vtbl :: struct {
	GetDesc: proc "system" (this: ^IShaderReflectionType, pDesc: ^SHADER_TYPE_DESC) -> HRESULT,
	GetMemberTypeByIndex: proc "system" (this: ^IShaderReflectionType, Index: u32) -> ^IShaderReflectionType,
	GetMemberTypeByName: proc "system" (this: ^IShaderReflectionType, Name: PSTR) -> ^IShaderReflectionType,
	GetMemberTypeName: proc "system" (this: ^IShaderReflectionType, Index: u32) -> PSTR,
	IsEqual: proc "system" (this: ^IShaderReflectionType, pType: ^IShaderReflectionType) -> HRESULT,
	GetSubType: proc "system" (this: ^IShaderReflectionType) -> ^IShaderReflectionType,
	GetBaseClass: proc "system" (this: ^IShaderReflectionType) -> ^IShaderReflectionType,
	GetNumInterfaces: proc "system" (this: ^IShaderReflectionType) -> u32,
	GetInterfaceByIndex: proc "system" (this: ^IShaderReflectionType, uIndex: u32) -> ^IShaderReflectionType,
	IsOfType: proc "system" (this: ^IShaderReflectionType, pType: ^IShaderReflectionType) -> HRESULT,
	ImplementsInterface: proc "system" (this: ^IShaderReflectionType, pBase: ^IShaderReflectionType) -> HRESULT,
}
IID_ID3D12ShaderReflectionType :: GUID{0xE913C351, 0x783D, 0x48CA, {0xA1, 0xD1, 0x4F, 0x30, 0x62, 0x84, 0xAD, 0x56}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12shader/nn-d3d12shader-id3d12shaderreflectionvariable ]]
IShaderReflectionVariable :: struct #raw_union {
	using Vtbl: ^IShaderReflectionVariable_Vtbl,
}
IShaderReflectionVariable_Vtbl :: struct {
	GetDesc: proc "system" (this: ^IShaderReflectionVariable, pDesc: ^SHADER_VARIABLE_DESC) -> HRESULT,
	GetType: proc "system" (this: ^IShaderReflectionVariable) -> ^IShaderReflectionType,
	GetBuffer: proc "system" (this: ^IShaderReflectionVariable) -> ^IShaderReflectionConstantBuffer,
	GetInterfaceSlot: proc "system" (this: ^IShaderReflectionVariable, uArrayIndex: u32) -> u32,
}
IID_ID3D12ShaderReflectionVariable :: GUID{0x8337A8A6, 0xA216, 0x444A, {0xB2, 0xF4, 0x31, 0x47, 0x33, 0xA7, 0x3A, 0xEA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12sharingcontract ]]
ISharingContract :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISharingContract_Vtbl,
}
ISharingContract_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Present: proc "system" (this: ^ISharingContract, pResource: ^IResource, Subresource: u32, window: HWND),
	SharedFenceSignal: proc "system" (this: ^ISharingContract, pFence: ^IFence, FenceValue: u64),
	BeginCapturableWork: proc "system" (this: ^ISharingContract, #by_ptr guid: GUID),
	EndCapturableWork: proc "system" (this: ^ISharingContract, #by_ptr guid: GUID),
}
IID_ID3D12SharingContract :: GUID{0x0ADF7D52, 0x929C, 0x4E61, {0xAD, 0xDB, 0xFF, 0xED, 0x30, 0xDE, 0x66, 0xEF}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12stateobject ]]
IStateObject :: struct #raw_union {
	#subtype IPageable: IPageable,
	using Vtbl: ^IStateObject_Vtbl,
}
IStateObject_Vtbl :: struct {
	using IPageable_Vtbl: IPageable_Vtbl,
}
IID_ID3D12StateObject :: GUID{0x47016943, 0xFCA8, 0x4594, {0x93, 0xEA, 0xAF, 0x25, 0x8B, 0x55, 0x34, 0x6D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12stateobjectproperties ]]
IStateObjectProperties :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IStateObjectProperties_Vtbl,
}
IStateObjectProperties_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetShaderIdentifier: proc "system" (this: ^IStateObjectProperties, pExportName: PWSTR) -> rawptr,
	GetShaderStackSize: proc "system" (this: ^IStateObjectProperties, pExportName: PWSTR) -> u64,
	GetPipelineStackSize: proc "system" (this: ^IStateObjectProperties) -> u64,
	SetPipelineStackSize: proc "system" (this: ^IStateObjectProperties, PipelineStackSizeInBytes: u64),
}
IID_ID3D12StateObjectProperties :: GUID{0xDE5FA827, 0x9BF9, 0x4F26, {0x89, 0xFF, 0xD7, 0xF5, 0x6F, 0xDE, 0x38, 0x60}}

IStateObjectProperties1 :: struct #raw_union {
	#subtype IStateObjectProperties: IStateObjectProperties,
	using Vtbl: ^IStateObjectProperties1_Vtbl,
}
IStateObjectProperties1_Vtbl :: struct {
	using IStateObjectProperties_Vtbl: IStateObjectProperties_Vtbl,
	GetProgramIdentifier: proc "system" (this: ^IStateObjectProperties1, pProgramName: PWSTR) -> PROGRAM_IDENTIFIER,
}
IID_ID3D12StateObjectProperties1 :: GUID{0x460CAAC7, 0x1D24, 0x446A, {0xA1, 0x84, 0xCA, 0x67, 0xDB, 0x49, 0x41, 0x38}}

ISwapChainAssistant :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISwapChainAssistant_Vtbl,
}
ISwapChainAssistant_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetLUID: proc "system" (this: ^ISwapChainAssistant) -> LUID,
	GetSwapChainObject: proc "system" (this: ^ISwapChainAssistant, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetCurrentResourceAndCommandQueue: proc "system" (
		this: ^ISwapChainAssistant,
		#by_ptr riidResource: GUID,
		ppvResource: rawptr,
		#by_ptr riidQueue: GUID,
		ppvQueue: rawptr,
	) -> HRESULT,
	InsertImplicitSync: proc "system" (this: ^ISwapChainAssistant) -> HRESULT,
}
IID_ID3D12SwapChainAssistant :: GUID{0xF1DF64B6, 0x57FD, 0x49CD, {0x88, 0x07, 0xC0, 0xEB, 0x88, 0xB4, 0x5C, 0x8F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12tools ]]
ITools :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITools_Vtbl,
}
ITools_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnableShaderInstrumentation: proc "system" (this: ^ITools, bEnable: BOOL),
	ShaderInstrumentationEnabled: proc "system" (this: ^ITools) -> BOOL,
}
IID_ID3D12Tools :: GUID{0x7071E1F0, 0xE84B, 0x4B33, {0x97, 0x4F, 0x12, 0xFA, 0x49, 0xDE, 0x65, 0xC5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12versionedrootsignaturedeserializer ]]
IVersionedRootSignatureDeserializer :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IVersionedRootSignatureDeserializer_Vtbl,
}
IVersionedRootSignatureDeserializer_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetRootSignatureDescAtVersion: proc "system" (
		this: ^IVersionedRootSignatureDeserializer,
		convertToVersion: ROOT_SIGNATURE_VERSION,
		#by_ptr ppDesc: VERSIONED_ROOT_SIGNATURE_DESC,
	) -> HRESULT,
	GetUnconvertedRootSignatureDesc: proc "system" (
		this: ^IVersionedRootSignatureDeserializer,
	) -> ^VERSIONED_ROOT_SIGNATURE_DESC,
}
IID_ID3D12VersionedRootSignatureDeserializer :: GUID{0x7F91CE67, 0x090C, 0x4BB7, {0xB7, 0x8E, 0xED, 0x8F, 0xF2, 0xE3, 0x1D, 0xA0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12virtualizationguestdevice ]]
IVirtualizationGuestDevice :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IVirtualizationGuestDevice_Vtbl,
}
IVirtualizationGuestDevice_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ShareWithHost: proc "system" (
		this: ^IVirtualizationGuestDevice,
		pObject: ^IDeviceChild,
		pHandle: ^HANDLE,
	) -> HRESULT,
	CreateFenceFd: proc "system" (
		this: ^IVirtualizationGuestDevice,
		pFence: ^IFence,
		FenceValue: u64,
		pFenceFd: ^i32,
	) -> HRESULT,
}
IID_ID3D12VirtualizationGuestDevice :: GUID{0xBC66D368, 0x7373, 0x4943, {0x87, 0x57, 0xFC, 0x87, 0xDC, 0x79, 0xE4, 0x76}}

IWorkGraphProperties :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IWorkGraphProperties_Vtbl,
}
IWorkGraphProperties_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetNumWorkGraphs: proc "system" (this: ^IWorkGraphProperties) -> u32,
	GetProgramName: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32) -> PWSTR,
	GetWorkGraphIndex: proc "system" (this: ^IWorkGraphProperties, pProgramName: PWSTR) -> u32,
	GetNumNodes: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32) -> u32,
	GetNodeID: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32, NodeIndex: u32) -> NODE_ID,
	GetNodeIndex: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32, NodeID: NODE_ID) -> u32,
	GetNodeLocalRootArgumentsTableIndex: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32, NodeIndex: u32) -> u32,
	GetNumEntrypoints: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32) -> u32,
	GetEntrypointID: proc "system" (
		this: ^IWorkGraphProperties,
		WorkGraphIndex: u32,
		EntrypointIndex: u32,
	) -> NODE_ID,
	GetEntrypointIndex: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32, NodeID: NODE_ID) -> u32,
	GetEntrypointRecordSizeInBytes: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32, EntrypointIndex: u32) -> u32,
	GetWorkGraphMemoryRequirements: proc "system" (
		this: ^IWorkGraphProperties,
		WorkGraphIndex: u32,
		pWorkGraphMemoryRequirements: ^WORK_GRAPH_MEMORY_REQUIREMENTS,
	),
	GetEntrypointRecordAlignmentInBytes: proc "system" (this: ^IWorkGraphProperties, WorkGraphIndex: u32, EntrypointIndex: u32) -> u32,
}
IID_ID3D12WorkGraphProperties :: GUID{0x065ACF71, 0xF863, 0x4B89, {0x82, 0xF4, 0x02, 0xE4, 0xD5, 0x88, 0x67, 0x57}}

PFN_D3D12_CREATE_DEVICE :: #type proc "system" (param0: ^IUnknown, param1: d3d.FEATURE_LEVEL, #by_ptr param2: GUID, param3: rawptr) -> HRESULT

PFN_D3D12_CREATE_ROOT_SIGNATURE_DESERIALIZER :: #type proc "system" (
	pSrcData: rawptr,
	SrcDataSizeInBytes: uintptr,
	#by_ptr pRootSignatureDeserializerInterface: GUID,
	ppRootSignatureDeserializer: rawptr,
) -> HRESULT

PFN_D3D12_CREATE_VERSIONED_ROOT_SIGNATURE_DESERIALIZER :: #type proc "system" (
	pSrcData: rawptr,
	SrcDataSizeInBytes: uintptr,
	#by_ptr pRootSignatureDeserializerInterface: GUID,
	ppRootSignatureDeserializer: rawptr,
) -> HRESULT

PFN_D3D12_GET_DEBUG_INTERFACE :: #type proc "system" (#by_ptr param0: GUID, param1: rawptr) -> HRESULT

PFN_D3D12_GET_INTERFACE :: #type proc "system" (#by_ptr param0: GUID, #by_ptr param1: GUID, param2: rawptr) -> HRESULT

PFN_D3D12_SERIALIZE_ROOT_SIGNATURE :: #type proc "system" (
	#by_ptr pRootSignature: ROOT_SIGNATURE_DESC,
	Version: ROOT_SIGNATURE_VERSION,
	ppBlob: ^^d3d.IBlob,
	ppErrorBlob: ^^d3d.IBlob,
) -> HRESULT

PFN_D3D12_SERIALIZE_VERSIONED_ROOT_SIGNATURE :: #type proc "system" (
	#by_ptr pRootSignature: VERSIONED_ROOT_SIGNATURE_DESC,
	ppBlob: ^^d3d.IBlob,
	ppErrorBlob: ^^d3d.IBlob,
) -> HRESULT

CLSID_D3D12Debug :: GUID{0xF2352AEB, 0xDD84, 0x49FE, {0xB9, 0x7B, 0xA9, 0xDC, 0xFD, 0xCC, 0x1B, 0x4F}}
CLSID_D3D12DeviceFactory :: GUID{0x114863BF, 0xC386, 0x4AEE, {0xB3, 0x9D, 0x8F, 0x0B, 0xBB, 0x06, 0x29, 0x55}}
CLSID_D3D12DeviceRemovedExtendedData :: GUID{0x4A75BBC4, 0x9FF4, 0x4AD8, {0x9F, 0x18, 0xAB, 0xAE, 0x84, 0xDC, 0x5F, 0xF2}}
CLSID_D3D12SDKConfiguration :: GUID{0x7CDA6ACA, 0xA03E, 0x49C8, {0x94, 0x58, 0x03, 0x34, 0xD2, 0x0E, 0x07, 0xCE}}
CLSID_D3D12Tools :: GUID{0xE38216B1, 0x3C8C, 0x4833, {0xAA, 0x09, 0x0A, 0x06, 0xB6, 0x5D, 0x96, 0xC8}}
SHADER_REQUIRES_ADVANCED_TEXTURE_OPS :: 536870912
SHADER_REQUIRES_ATOMIC_INT64_ON_DESCRIPTOR_HEAP_RESOURCE :: 268435456
SHADER_REQUIRES_ATOMIC_INT64_ON_GROUP_SHARED :: 8388608
SHADER_REQUIRES_ATOMIC_INT64_ON_TYPED_RESOURCE :: 4194304
SHADER_REQUIRES_BARYCENTRICS :: 131072
SHADER_REQUIRES_DERIVATIVES_IN_MESH_AND_AMPLIFICATION_SHADERS :: 16777216
SHADER_REQUIRES_INNER_COVERAGE :: 1024
SHADER_REQUIRES_INT64_OPS :: 32768
SHADER_REQUIRES_NATIVE_16BIT_OPS :: 262144
SHADER_REQUIRES_RAYTRACING_TIER_1_1 :: 1048576
SHADER_REQUIRES_RESOURCE_DESCRIPTOR_HEAP_INDEXING :: 33554432
SHADER_REQUIRES_ROVS :: 4096
SHADER_REQUIRES_SAMPLE_CMP_GRADIENT_OR_BIAS :: 2147483648
SHADER_REQUIRES_SAMPLER_DESCRIPTOR_HEAP_INDEXING :: 67108864
SHADER_REQUIRES_SAMPLER_FEEDBACK :: 2097152
SHADER_REQUIRES_SHADING_RATE :: 524288
SHADER_REQUIRES_STENCIL_REF :: 512
SHADER_REQUIRES_TYPED_UAV_LOAD_ADDITIONAL_FORMATS :: 2048
SHADER_REQUIRES_VIEW_ID :: 65536
SHADER_REQUIRES_VIEWPORT_AND_RT_ARRAY_INDEX_FROM_ANY_SHADER_FEEDING_RASTERIZER :: 8192
SHADER_REQUIRES_WAVE_MMA :: 134217728
SHADER_REQUIRES_WAVE_OPS :: 16384
SHADER_REQUIRES_WRITEABLE_MSAA_TEXTURES :: 1073741824
_16BIT_INDEX_STRIP_CUT_VALUE :: 65535
_32BIT_INDEX_STRIP_CUT_VALUE :: 4294967295
_8BIT_INDEX_STRIP_CUT_VALUE :: 255
ANISOTROPIC_FILTERING_BIT :: 64
APPEND_ALIGNED_ELEMENT :: 4294967295
ARRAY_AXIS_ADDRESS_RANGE_BIT_COUNT :: 9
CLIP_OR_CULL_DISTANCE_COUNT :: 8
CLIP_OR_CULL_DISTANCE_ELEMENT_COUNT :: 2
COMMONSHADER_CONSTANT_BUFFER_API_SLOT_COUNT :: 14
COMMONSHADER_CONSTANT_BUFFER_COMPONENT_BIT_COUNT :: 32
COMMONSHADER_CONSTANT_BUFFER_COMPONENTS :: 4
COMMONSHADER_CONSTANT_BUFFER_HW_SLOT_COUNT :: 15
COMMONSHADER_CONSTANT_BUFFER_PARTIAL_UPDATE_EXTENTS_BYTE_ALIGNMENT :: 16
COMMONSHADER_CONSTANT_BUFFER_REGISTER_COMPONENTS :: 4
COMMONSHADER_CONSTANT_BUFFER_REGISTER_COUNT :: 15
COMMONSHADER_CONSTANT_BUFFER_REGISTER_READ_PORTS :: 1
COMMONSHADER_CONSTANT_BUFFER_REGISTER_READS_PER_INST :: 1
COMMONSHADER_FLOWCONTROL_NESTING_LIMIT :: 64
COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COMPONENTS :: 4
COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_COUNT :: 1
COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READ_PORTS :: 1
COMMONSHADER_IMMEDIATE_CONSTANT_BUFFER_REGISTER_READS_PER_INST :: 1
COMMONSHADER_IMMEDIATE_VALUE_COMPONENT_BIT_COUNT :: 32
COMMONSHADER_INPUT_RESOURCE_REGISTER_COMPONENTS :: 1
COMMONSHADER_INPUT_RESOURCE_REGISTER_COUNT :: 128
COMMONSHADER_INPUT_RESOURCE_REGISTER_READ_PORTS :: 1
COMMONSHADER_INPUT_RESOURCE_REGISTER_READS_PER_INST :: 1
COMMONSHADER_INPUT_RESOURCE_SLOT_COUNT :: 128
COMMONSHADER_SAMPLER_REGISTER_COMPONENTS :: 1
COMMONSHADER_SAMPLER_REGISTER_COUNT :: 16
COMMONSHADER_SAMPLER_REGISTER_READ_PORTS :: 1
COMMONSHADER_SAMPLER_REGISTER_READS_PER_INST :: 1
COMMONSHADER_SAMPLER_SLOT_COUNT :: 16
COMMONSHADER_SUBROUTINE_NESTING_LIMIT :: 32
COMMONSHADER_TEMP_REGISTER_COMPONENT_BIT_COUNT :: 32
COMMONSHADER_TEMP_REGISTER_COMPONENTS :: 4
COMMONSHADER_TEMP_REGISTER_COUNT :: 4096
COMMONSHADER_TEMP_REGISTER_READ_PORTS :: 3
COMMONSHADER_TEMP_REGISTER_READS_PER_INST :: 3
COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MAX :: 10
COMMONSHADER_TEXCOORD_RANGE_REDUCTION_MIN :: -10
COMMONSHADER_TEXEL_OFFSET_MAX_NEGATIVE :: -8
COMMONSHADER_TEXEL_OFFSET_MAX_POSITIVE :: 7
CONSTANT_BUFFER_DATA_PLACEMENT_ALIGNMENT :: 256
CS_4_X_BUCKET00_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 256
CS_4_X_BUCKET00_MAX_NUM_THREADS_PER_GROUP :: 64
CS_4_X_BUCKET01_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 240
CS_4_X_BUCKET01_MAX_NUM_THREADS_PER_GROUP :: 68
CS_4_X_BUCKET02_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 224
CS_4_X_BUCKET02_MAX_NUM_THREADS_PER_GROUP :: 72
CS_4_X_BUCKET03_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 208
CS_4_X_BUCKET03_MAX_NUM_THREADS_PER_GROUP :: 76
CS_4_X_BUCKET04_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 192
CS_4_X_BUCKET04_MAX_NUM_THREADS_PER_GROUP :: 84
CS_4_X_BUCKET05_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 176
CS_4_X_BUCKET05_MAX_NUM_THREADS_PER_GROUP :: 92
CS_4_X_BUCKET06_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 160
CS_4_X_BUCKET06_MAX_NUM_THREADS_PER_GROUP :: 100
CS_4_X_BUCKET07_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 144
CS_4_X_BUCKET07_MAX_NUM_THREADS_PER_GROUP :: 112
CS_4_X_BUCKET08_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 128
CS_4_X_BUCKET08_MAX_NUM_THREADS_PER_GROUP :: 128
CS_4_X_BUCKET09_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 112
CS_4_X_BUCKET09_MAX_NUM_THREADS_PER_GROUP :: 144
CS_4_X_BUCKET10_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 96
CS_4_X_BUCKET10_MAX_NUM_THREADS_PER_GROUP :: 168
CS_4_X_BUCKET11_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 80
CS_4_X_BUCKET11_MAX_NUM_THREADS_PER_GROUP :: 204
CS_4_X_BUCKET12_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 64
CS_4_X_BUCKET12_MAX_NUM_THREADS_PER_GROUP :: 256
CS_4_X_BUCKET13_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 48
CS_4_X_BUCKET13_MAX_NUM_THREADS_PER_GROUP :: 340
CS_4_X_BUCKET14_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 32
CS_4_X_BUCKET14_MAX_NUM_THREADS_PER_GROUP :: 512
CS_4_X_BUCKET15_MAX_BYTES_TGSM_WRITABLE_PER_THREAD :: 16
CS_4_X_BUCKET15_MAX_NUM_THREADS_PER_GROUP :: 768
CS_4_X_DISPATCH_MAX_THREAD_GROUPS_IN_Z_DIMENSION :: 1
CS_4_X_RAW_UAV_BYTE_ALIGNMENT :: 256
CS_4_X_THREAD_GROUP_MAX_THREADS_PER_GROUP :: 768
CS_4_X_THREAD_GROUP_MAX_X :: 768
CS_4_X_THREAD_GROUP_MAX_Y :: 768
CS_4_X_UAV_REGISTER_COUNT :: 1
CS_DISPATCH_MAX_THREAD_GROUPS_PER_DIMENSION :: 65535
CS_TGSM_REGISTER_COUNT :: 8192
CS_TGSM_REGISTER_READS_PER_INST :: 1
CS_TGSM_RESOURCE_REGISTER_COMPONENTS :: 1
CS_TGSM_RESOURCE_REGISTER_READ_PORTS :: 1
CS_THREAD_GROUP_MAX_THREADS_PER_GROUP :: 1024
CS_THREAD_GROUP_MAX_X :: 1024
CS_THREAD_GROUP_MAX_Y :: 1024
CS_THREAD_GROUP_MAX_Z :: 64
CS_THREAD_GROUP_MIN_X :: 1
CS_THREAD_GROUP_MIN_Y :: 1
CS_THREAD_GROUP_MIN_Z :: 1
CS_THREAD_LOCAL_TEMP_REGISTER_POOL :: 16384
CS_THREADGROUPID_REGISTER_COMPONENTS :: 3
CS_THREADGROUPID_REGISTER_COUNT :: 1
CS_THREADID_REGISTER_COMPONENTS :: 3
CS_THREADID_REGISTER_COUNT :: 1
CS_THREADIDINGROUP_REGISTER_COMPONENTS :: 3
CS_THREADIDINGROUP_REGISTER_COUNT :: 1
CS_THREADIDINGROUPFLATTENED_REGISTER_COMPONENTS :: 1
CS_THREADIDINGROUPFLATTENED_REGISTER_COUNT :: 1
DEFAULT_BLEND_FACTOR_ALPHA :: 1
DEFAULT_BLEND_FACTOR_BLUE :: 1
DEFAULT_BLEND_FACTOR_GREEN :: 1
DEFAULT_BLEND_FACTOR_RED :: 1
DEFAULT_BORDER_COLOR_COMPONENT :: 0
DEFAULT_DEPTH_BIAS :: 0
DEFAULT_DEPTH_BIAS_CLAMP :: 0
DEFAULT_MAX_ANISOTROPY :: 16
DEFAULT_MIP_LOD_BIAS :: 0
DEFAULT_MSAA_RESOURCE_PLACEMENT_ALIGNMENT :: 4194304
DEFAULT_RENDER_TARGET_ARRAY_INDEX :: 0
DEFAULT_RESOURCE_PLACEMENT_ALIGNMENT :: 65536
DEFAULT_SAMPLE_MASK :: 4294967295
DEFAULT_SCISSOR_ENDX :: 0
DEFAULT_SCISSOR_ENDY :: 0
DEFAULT_SCISSOR_STARTX :: 0
DEFAULT_SCISSOR_STARTY :: 0
DEFAULT_SHADER_4_COMPONENT_MAPPING :: 5768
DEFAULT_SLOPE_SCALED_DEPTH_BIAS :: 0
DEFAULT_STENCIL_READ_MASK :: 255
DEFAULT_STENCIL_REFERENCE :: 0
DEFAULT_STENCIL_WRITE_MASK :: 255
DEFAULT_VIEWPORT_AND_SCISSORRECT_INDEX :: 0
DEFAULT_VIEWPORT_HEIGHT :: 0
DEFAULT_VIEWPORT_MAX_DEPTH :: 0
DEFAULT_VIEWPORT_MIN_DEPTH :: 0
DEFAULT_VIEWPORT_TOPLEFTX :: 0
DEFAULT_VIEWPORT_TOPLEFTY :: 0
DEFAULT_VIEWPORT_WIDTH :: 0
DESCRIPTOR_RANGE_OFFSET_APPEND :: 4294967295
DRIVER_RESERVED_REGISTER_SPACE_VALUES_END :: 4294967287
DRIVER_RESERVED_REGISTER_SPACE_VALUES_START :: 4294967280
DS_INPUT_CONTROL_POINT_REGISTER_COMPONENT_BIT_COUNT :: 32
DS_INPUT_CONTROL_POINT_REGISTER_COMPONENTS :: 4
DS_INPUT_CONTROL_POINT_REGISTER_COUNT :: 32
DS_INPUT_CONTROL_POINT_REGISTER_READ_PORTS :: 1
DS_INPUT_CONTROL_POINT_REGISTER_READS_PER_INST :: 2
DS_INPUT_CONTROL_POINTS_MAX_TOTAL_SCALARS :: 3968
DS_INPUT_DOMAIN_POINT_REGISTER_COMPONENT_BIT_COUNT :: 32
DS_INPUT_DOMAIN_POINT_REGISTER_COMPONENTS :: 3
DS_INPUT_DOMAIN_POINT_REGISTER_COUNT :: 1
DS_INPUT_DOMAIN_POINT_REGISTER_READ_PORTS :: 1
DS_INPUT_DOMAIN_POINT_REGISTER_READS_PER_INST :: 2
DS_INPUT_PATCH_CONSTANT_REGISTER_COMPONENT_BIT_COUNT :: 32
DS_INPUT_PATCH_CONSTANT_REGISTER_COMPONENTS :: 4
DS_INPUT_PATCH_CONSTANT_REGISTER_COUNT :: 32
DS_INPUT_PATCH_CONSTANT_REGISTER_READ_PORTS :: 1
DS_INPUT_PATCH_CONSTANT_REGISTER_READS_PER_INST :: 2
DS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENT_BIT_COUNT :: 32
DS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENTS :: 1
DS_INPUT_PRIMITIVE_ID_REGISTER_COUNT :: 1
DS_INPUT_PRIMITIVE_ID_REGISTER_READ_PORTS :: 1
DS_INPUT_PRIMITIVE_ID_REGISTER_READS_PER_INST :: 2
DS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT :: 32
DS_OUTPUT_REGISTER_COMPONENTS :: 4
DS_OUTPUT_REGISTER_COUNT :: 32
FILTER_REDUCTION_TYPE_MASK :: 3
FILTER_REDUCTION_TYPE_SHIFT :: 7
FILTER_TYPE_MASK :: 3
FLOAT_TO_SRGB_EXPONENT_DENOMINATOR :: 2.4
FLOAT_TO_SRGB_EXPONENT_NUMERATOR :: 1
FLOAT_TO_SRGB_OFFSET :: 0.055
FLOAT_TO_SRGB_SCALE_1 :: 12.92
FLOAT_TO_SRGB_SCALE_2 :: 1.055
FLOAT_TO_SRGB_THRESHOLD :: 0.0031308
FLOAT16_FUSED_TOLERANCE_IN_ULP :: 0.6
FLOAT32_MAX :: 3.4028235E+38
FLOAT32_TO_INTEGER_TOLERANCE_IN_ULP :: 0.6
FTOI_INSTRUCTION_MAX_INPUT :: 2.1474836E+09
FTOI_INSTRUCTION_MIN_INPUT :: -2.1474836E+09
FTOU_INSTRUCTION_MAX_INPUT :: 4.2949673E+09
FTOU_INSTRUCTION_MIN_INPUT :: 0
GS_INPUT_INSTANCE_ID_READ_PORTS :: 1
GS_INPUT_INSTANCE_ID_READS_PER_INST :: 2
GS_INPUT_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT :: 32
GS_INPUT_INSTANCE_ID_REGISTER_COMPONENTS :: 1
GS_INPUT_INSTANCE_ID_REGISTER_COUNT :: 1
GS_INPUT_PRIM_CONST_REGISTER_COMPONENT_BIT_COUNT :: 32
GS_INPUT_PRIM_CONST_REGISTER_COMPONENTS :: 1
GS_INPUT_PRIM_CONST_REGISTER_COUNT :: 1
GS_INPUT_PRIM_CONST_REGISTER_READ_PORTS :: 1
GS_INPUT_PRIM_CONST_REGISTER_READS_PER_INST :: 2
GS_INPUT_REGISTER_COMPONENT_BIT_COUNT :: 32
GS_INPUT_REGISTER_COMPONENTS :: 4
GS_INPUT_REGISTER_COUNT :: 32
GS_INPUT_REGISTER_READ_PORTS :: 1
GS_INPUT_REGISTER_READS_PER_INST :: 2
GS_INPUT_REGISTER_VERTICES :: 32
GS_MAX_INSTANCE_COUNT :: 32
GS_MAX_OUTPUT_VERTEX_COUNT_ACROSS_INSTANCES :: 1024
GS_OUTPUT_ELEMENTS :: 32
GS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT :: 32
GS_OUTPUT_REGISTER_COMPONENTS :: 4
GS_OUTPUT_REGISTER_COUNT :: 32
HS_CONTROL_POINT_PHASE_INPUT_REGISTER_COUNT :: 32
HS_CONTROL_POINT_PHASE_OUTPUT_REGISTER_COUNT :: 32
HS_CONTROL_POINT_REGISTER_COMPONENT_BIT_COUNT :: 32
HS_CONTROL_POINT_REGISTER_COMPONENTS :: 4
HS_CONTROL_POINT_REGISTER_READ_PORTS :: 1
HS_CONTROL_POINT_REGISTER_READS_PER_INST :: 2
HS_FORK_PHASE_INSTANCE_COUNT_UPPER_BOUND :: 4294967295
HS_INPUT_FORK_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT :: 32
HS_INPUT_FORK_INSTANCE_ID_REGISTER_COMPONENTS :: 1
HS_INPUT_FORK_INSTANCE_ID_REGISTER_COUNT :: 1
HS_INPUT_FORK_INSTANCE_ID_REGISTER_READ_PORTS :: 1
HS_INPUT_FORK_INSTANCE_ID_REGISTER_READS_PER_INST :: 2
HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COMPONENT_BIT_COUNT :: 32
HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COMPONENTS :: 1
HS_INPUT_JOIN_INSTANCE_ID_REGISTER_COUNT :: 1
HS_INPUT_JOIN_INSTANCE_ID_REGISTER_READ_PORTS :: 1
HS_INPUT_JOIN_INSTANCE_ID_REGISTER_READS_PER_INST :: 2
HS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENT_BIT_COUNT :: 32
HS_INPUT_PRIMITIVE_ID_REGISTER_COMPONENTS :: 1
HS_INPUT_PRIMITIVE_ID_REGISTER_COUNT :: 1
HS_INPUT_PRIMITIVE_ID_REGISTER_READ_PORTS :: 1
HS_INPUT_PRIMITIVE_ID_REGISTER_READS_PER_INST :: 2
HS_JOIN_PHASE_INSTANCE_COUNT_UPPER_BOUND :: 4294967295
HS_MAXTESSFACTOR_LOWER_BOUND :: 1
HS_MAXTESSFACTOR_UPPER_BOUND :: 64
HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COMPONENT_BIT_COUNT :: 32
HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COMPONENTS :: 1
HS_OUTPUT_CONTROL_POINT_ID_REGISTER_COUNT :: 1
HS_OUTPUT_CONTROL_POINT_ID_REGISTER_READ_PORTS :: 1
HS_OUTPUT_CONTROL_POINT_ID_REGISTER_READS_PER_INST :: 2
HS_OUTPUT_CONTROL_POINTS_MAX_TOTAL_SCALARS :: 3968
HS_OUTPUT_PATCH_CONSTANT_REGISTER_COMPONENT_BIT_COUNT :: 32
HS_OUTPUT_PATCH_CONSTANT_REGISTER_COMPONENTS :: 4
HS_OUTPUT_PATCH_CONSTANT_REGISTER_COUNT :: 32
HS_OUTPUT_PATCH_CONSTANT_REGISTER_READ_PORTS :: 1
HS_OUTPUT_PATCH_CONSTANT_REGISTER_READS_PER_INST :: 2
HS_OUTPUT_PATCH_CONSTANT_REGISTER_SCALAR_COMPONENTS :: 128
IA_DEFAULT_INDEX_BUFFER_OFFSET_IN_BYTES :: 0
IA_DEFAULT_PRIMITIVE_TOPOLOGY :: 0
IA_DEFAULT_VERTEX_BUFFER_OFFSET_IN_BYTES :: 0
IA_INDEX_INPUT_RESOURCE_SLOT_COUNT :: 1
IA_INSTANCE_ID_BIT_COUNT :: 32
IA_INTEGER_ARITHMETIC_BIT_COUNT :: 32
IA_PATCH_MAX_CONTROL_POINT_COUNT :: 32
IA_PRIMITIVE_ID_BIT_COUNT :: 32
IA_VERTEX_ID_BIT_COUNT :: 32
IA_VERTEX_INPUT_RESOURCE_SLOT_COUNT :: 32
IA_VERTEX_INPUT_STRUCTURE_ELEMENT_COUNT :: 32
IA_VERTEX_INPUT_STRUCTURE_ELEMENTS_COMPONENTS :: 128
INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT :: 1024
INTEGER_DIVIDE_BY_ZERO_QUOTIENT :: 4294967295
INTEGER_DIVIDE_BY_ZERO_REMAINDER :: 4294967295
KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL :: 4294967295
KEEP_UNORDERED_ACCESS_VIEWS :: 4294967295
LINEAR_GAMMA :: 1
MAG_FILTER_SHIFT :: 2
MAJOR_VERSION :: 12
MAX_BORDER_COLOR_COMPONENT :: 1
MAX_DEPTH :: 1
MAX_LIVE_STATIC_SAMPLERS :: 2032
MAX_MAXANISOTROPY :: 16
MAX_MULTISAMPLE_SAMPLE_COUNT :: 32
MAX_POSITION_VALUE :: 3.4028236E+34
MAX_ROOT_COST :: 64
MAX_SHADER_VISIBLE_DESCRIPTOR_HEAP_SIZE_TIER_1 :: 1000000
MAX_SHADER_VISIBLE_DESCRIPTOR_HEAP_SIZE_TIER_2 :: 1000000
MAX_SHADER_VISIBLE_SAMPLER_HEAP_SIZE :: 2048
MAX_TEXTURE_DIMENSION_2_TO_EXP :: 17
MAX_VIEW_INSTANCE_COUNT :: 4
MIN_BORDER_COLOR_COMPONENT :: 0
MIN_DEPTH :: 0
MIN_FILTER_SHIFT :: 4
MIN_MAXANISOTROPY :: 0
MINOR_VERSION :: 0
MIP_FILTER_SHIFT :: 0
MIP_LOD_BIAS_MAX :: 15.99
MIP_LOD_BIAS_MIN :: -16
MIP_LOD_FRACTIONAL_BIT_COUNT :: 8
MIP_LOD_RANGE_BIT_COUNT :: 8
MULTISAMPLE_ANTIALIAS_LINE_WIDTH :: 1.4
NONSAMPLE_FETCH_OUT_OF_RANGE_ACCESS_RESULT :: 0
OS_RESERVED_REGISTER_SPACE_VALUES_END :: 4294967295
OS_RESERVED_REGISTER_SPACE_VALUES_START :: 4294967288
PACKED_TILE :: 4294967295
PIXEL_ADDRESS_RANGE_BIT_COUNT :: 15
PRE_SCISSOR_PIXEL_ADDRESS_RANGE_BIT_COUNT :: 16
PREVIEW_SDK_VERSION :: 714
PROTECTED_RESOURCES_SESSION_HARDWARE_PROTECTED ::
	GUID{0x62B0084E, 0xC70E, 0x4DAA, {0xA1, 0x09, 0x30, 0xFF, 0x8D, 0x5A, 0x04, 0x82}}
PS_CS_UAV_REGISTER_COMPONENTS :: 1
PS_CS_UAV_REGISTER_COUNT :: 8
PS_CS_UAV_REGISTER_READ_PORTS :: 1
PS_CS_UAV_REGISTER_READS_PER_INST :: 1
PS_FRONTFACING_DEFAULT_VALUE :: 4294967295
PS_FRONTFACING_FALSE_VALUE :: 0
PS_FRONTFACING_TRUE_VALUE :: 4294967295
PS_INPUT_REGISTER_COMPONENT_BIT_COUNT :: 32
PS_INPUT_REGISTER_COMPONENTS :: 4
PS_INPUT_REGISTER_COUNT :: 32
PS_INPUT_REGISTER_READ_PORTS :: 1
PS_INPUT_REGISTER_READS_PER_INST :: 2
PS_LEGACY_PIXEL_CENTER_FRACTIONAL_COMPONENT :: 0
PS_OUTPUT_DEPTH_REGISTER_COMPONENT_BIT_COUNT :: 32
PS_OUTPUT_DEPTH_REGISTER_COMPONENTS :: 1
PS_OUTPUT_DEPTH_REGISTER_COUNT :: 1
PS_OUTPUT_MASK_REGISTER_COMPONENT_BIT_COUNT :: 32
PS_OUTPUT_MASK_REGISTER_COMPONENTS :: 1
PS_OUTPUT_MASK_REGISTER_COUNT :: 1
PS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT :: 32
PS_OUTPUT_REGISTER_COMPONENTS :: 4
PS_OUTPUT_REGISTER_COUNT :: 8
PS_PIXEL_CENTER_FRACTIONAL_COMPONENT :: 0.5
RAW_UAV_SRV_BYTE_ALIGNMENT :: 16
RAYTRACING_AABB_BYTE_ALIGNMENT :: 8
RAYTRACING_ACCELERATION_STRUCTURE_BYTE_ALIGNMENT :: 256
RAYTRACING_INSTANCE_DESCS_BYTE_ALIGNMENT :: 16
RAYTRACING_MAX_ATTRIBUTE_SIZE_IN_BYTES :: 32
RAYTRACING_MAX_DECLARABLE_TRACE_RECURSION_DEPTH :: 31
RAYTRACING_MAX_GEOMETRIES_PER_BOTTOM_LEVEL_ACCELERATION_STRUCTURE :: 16777216
RAYTRACING_MAX_INSTANCES_PER_TOP_LEVEL_ACCELERATION_STRUCTURE :: 16777216
RAYTRACING_MAX_PRIMITIVES_PER_BOTTOM_LEVEL_ACCELERATION_STRUCTURE :: 536870912
RAYTRACING_MAX_RAY_GENERATION_SHADER_THREADS :: 1073741824
RAYTRACING_MAX_SHADER_RECORD_STRIDE :: 4096
RAYTRACING_SHADER_RECORD_BYTE_ALIGNMENT :: 32
RAYTRACING_SHADER_TABLE_BYTE_ALIGNMENT :: 64
RAYTRACING_TRANSFORM3X4_BYTE_ALIGNMENT :: 16
REQ_BLEND_OBJECT_COUNT_PER_DEVICE :: 4096
REQ_BUFFER_RESOURCE_TEXEL_COUNT_2_TO_EXP :: 27
REQ_CONSTANT_BUFFER_ELEMENT_COUNT :: 4096
REQ_DEPTH_STENCIL_OBJECT_COUNT_PER_DEVICE :: 4096
REQ_DRAW_VERTEX_COUNT_2_TO_EXP :: 32
REQ_DRAWINDEXED_INDEX_COUNT_2_TO_EXP :: 32
REQ_FILTERING_HW_ADDRESSABLE_RESOURCE_DIMENSION :: 16384
REQ_GS_INVOCATION_32BIT_OUTPUT_COMPONENT_LIMIT :: 1024
REQ_IMMEDIATE_CONSTANT_BUFFER_ELEMENT_COUNT :: 4096
REQ_MAXANISOTROPY :: 16
REQ_MIP_LEVELS :: 15
REQ_MULTI_ELEMENT_STRUCTURE_SIZE_IN_BYTES :: 2048
REQ_RASTERIZER_OBJECT_COUNT_PER_DEVICE :: 4096
REQ_RENDER_TO_BUFFER_WINDOW_WIDTH :: 16384
REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_A_TERM :: 128
REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_B_TERM :: 0.25
REQ_RESOURCE_SIZE_IN_MEGABYTES_EXPRESSION_C_TERM :: 2048
REQ_RESOURCE_VIEW_COUNT_PER_DEVICE_2_TO_EXP :: 20
REQ_SAMPLER_OBJECT_COUNT_PER_DEVICE :: 4096
REQ_SUBRESOURCES :: 30720
REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION :: 2048
REQ_TEXTURE1D_U_DIMENSION :: 16384
REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION :: 2048
REQ_TEXTURE2D_U_OR_V_DIMENSION :: 16384
REQ_TEXTURE3D_U_V_OR_W_DIMENSION :: 2048
REQ_TEXTURECUBE_DIMENSION :: 16384
RESINFO_INSTRUCTION_MISSING_COMPONENT_RETVAL :: 0
RESOURCE_BARRIER_ALL_SUBRESOURCES :: 4294967295
RS_SET_SHADING_RATE_COMBINER_COUNT :: 2
SDK_VERSION :: 614
SHADER_COMPONENT_MAPPING_ALWAYS_SET_BIT_AVOIDING_ZEROMEM_MISTAKES :: 4096
SHADER_COMPONENT_MAPPING_MASK :: 7
SHADER_COMPONENT_MAPPING_SHIFT :: 3
SHADER_IDENTIFIER_SIZE_IN_BYTES :: 32
SHADER_MAJOR_VERSION :: 5
SHADER_MAX_INSTANCES :: 65535
SHADER_MAX_INTERFACE_CALL_SITES :: 4096
SHADER_MAX_INTERFACES :: 253
SHADER_MAX_TYPES :: 65535
SHADER_MINOR_VERSION :: 1
SHADING_RATE_VALID_MASK :: 3
SHADING_RATE_X_AXIS_SHIFT :: 2
SHIFT_INSTRUCTION_PAD_VALUE :: 0
SHIFT_INSTRUCTION_SHIFT_VALUE_BIT_COUNT :: 5
SIMULTANEOUS_RENDER_TARGET_COUNT :: 8
SMALL_MSAA_RESOURCE_PLACEMENT_ALIGNMENT :: 65536
SMALL_RESOURCE_PLACEMENT_ALIGNMENT :: 4096
SO_BUFFER_MAX_STRIDE_IN_BYTES :: 2048
SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES :: 512
SO_BUFFER_SLOT_COUNT :: 4
SO_DDI_REGISTER_INDEX_DENOTING_GAP :: 4294967295
SO_NO_RASTERIZED_STREAM :: 4294967295
SO_OUTPUT_COMPONENT_COUNT :: 128
SO_STREAM_COUNT :: 4
SPEC_DATE_DAY :: 14
SPEC_DATE_MONTH :: 11
SPEC_DATE_YEAR :: 2014
SPEC_VERSION :: 1.16
SRGB_GAMMA :: 2.2
SRGB_TO_FLOAT_DENOMINATOR_1 :: 12.92
SRGB_TO_FLOAT_DENOMINATOR_2 :: 1.055
SRGB_TO_FLOAT_EXPONENT :: 2.4
SRGB_TO_FLOAT_OFFSET :: 0.055
SRGB_TO_FLOAT_THRESHOLD :: 0.04045
SRGB_TO_FLOAT_TOLERANCE_IN_ULP :: 0.5
STANDARD_COMPONENT_BIT_COUNT :: 32
STANDARD_COMPONENT_BIT_COUNT_DOUBLED :: 64
STANDARD_MAXIMUM_ELEMENT_ALIGNMENT_BYTE_MULTIPLE :: 4
STANDARD_PIXEL_COMPONENT_COUNT :: 128
STANDARD_PIXEL_ELEMENT_COUNT :: 32
STANDARD_VECTOR_SIZE :: 4
STANDARD_VERTEX_ELEMENT_COUNT :: 32
STANDARD_VERTEX_TOTAL_COMPONENT_COUNT :: 64
SUBPIXEL_FRACTIONAL_BIT_COUNT :: 8
SUBTEXEL_FRACTIONAL_BIT_COUNT :: 8
SYSTEM_RESERVED_REGISTER_SPACE_VALUES_END :: 4294967295
SYSTEM_RESERVED_REGISTER_SPACE_VALUES_START :: 4294967280
TESSELLATOR_MAX_EVEN_TESSELLATION_FACTOR :: 64
TESSELLATOR_MAX_ISOLINE_DENSITY_TESSELLATION_FACTOR :: 64
TESSELLATOR_MAX_ODD_TESSELLATION_FACTOR :: 63
TESSELLATOR_MAX_TESSELLATION_FACTOR :: 64
TESSELLATOR_MIN_EVEN_TESSELLATION_FACTOR :: 2
TESSELLATOR_MIN_ISOLINE_DENSITY_TESSELLATION_FACTOR :: 1
TESSELLATOR_MIN_ODD_TESSELLATION_FACTOR :: 1
TEXEL_ADDRESS_RANGE_BIT_COUNT :: 16
TEXTURE_DATA_PITCH_ALIGNMENT :: 256
TEXTURE_DATA_PLACEMENT_ALIGNMENT :: 512
TILED_RESOURCE_TILE_SIZE_IN_BYTES :: 65536
TRACKED_WORKLOAD_MAX_INSTANCES :: 32
UAV_COUNTER_PLACEMENT_ALIGNMENT :: 4096
UAV_SLOT_COUNT :: 64
UNBOUND_MEMORY_ACCESS_RESULT :: 0
VIDEO_DECODE_MAX_ARGUMENTS :: 10
VIDEO_DECODE_MAX_HISTOGRAM_COMPONENTS :: 4
VIDEO_DECODE_MIN_BITSTREAM_OFFSET_ALIGNMENT :: 256
VIDEO_DECODE_MIN_HISTOGRAM_OFFSET_ALIGNMENT :: 256
VIDEO_DECODE_STATUS_MACROBLOCKS_AFFECTED_UNKNOWN :: 4294967295
VIDEO_ENCODER_AV1_INVALID_DPB_RESOURCE_INDEX :: 255
VIDEO_ENCODER_AV1_MAX_TILE_COLS :: 64
VIDEO_ENCODER_AV1_MAX_TILE_ROWS :: 64
VIDEO_ENCODER_AV1_SUPERRES_DENOM_MIN :: 9
VIDEO_ENCODER_AV1_SUPERRES_NUM :: 8
VIDEO_PROCESS_MAX_FILTERS :: 32
VIDEO_PROCESS_STEREO_VIEWS :: 2
VIEWPORT_AND_SCISSORRECT_MAX_INDEX :: 15
VIEWPORT_AND_SCISSORRECT_OBJECT_COUNT_PER_PIPELINE :: 16
VIEWPORT_BOUNDS_MAX :: 32767
VIEWPORT_BOUNDS_MIN :: -32768
VS_INPUT_REGISTER_COMPONENT_BIT_COUNT :: 32
VS_INPUT_REGISTER_COMPONENTS :: 4
VS_INPUT_REGISTER_COUNT :: 32
VS_INPUT_REGISTER_READ_PORTS :: 1
VS_INPUT_REGISTER_READS_PER_INST :: 2
VS_OUTPUT_REGISTER_COMPONENT_BIT_COUNT :: 32
VS_OUTPUT_REGISTER_COMPONENTS :: 4
VS_OUTPUT_REGISTER_COUNT :: 32
WHQL_CONTEXT_COUNT_FOR_RESOURCE_LIMIT :: 10
WHQL_DRAW_VERTEX_COUNT_2_TO_EXP :: 25
WHQL_DRAWINDEXED_INDEX_COUNT_2_TO_EXP :: 25
WORK_GRAPHS_BACKING_MEMORY_ALIGNMENT_IN_BYTES :: 8
WORK_GRAPHS_MAX_NODE_DEPTH :: 32
ExperimentalShaderModels :: GUID{0x76F5573E, 0xF13A, 0x40F5, {0xB2, 0x97, 0x81, 0xCE, 0x9E, 0x18, 0x93, 0x3F}}
TiledResourceTier4 :: GUID{0xC9C4725F, 0xA81A, 0x4F56, {0x8C, 0x5B, 0xC5, 0x10, 0x39, 0xD6, 0x94, 0xFB}}
DXGI_DEBUG_D3D12 :: GUID{0xCF59A98C, 0xA950, 0x4326, {0x91, 0xEF, 0x9B, 0xBA, 0xA1, 0x7B, 0xFD, 0x95}}
LUID_DEFINED :: 1
WKPDID_D3DAutoDebugObjectNameW :: GUID{0xD4902E36, 0x757A, 0x4942, {0x95, 0x94, 0xB6, 0x76, 0x9A, 0xFA, 0x43, 0xCD}}

BOOL :: win32.BOOL
GUID :: win32.GUID
HANDLE :: win32.HANDLE
HRESULT :: win32.HRESULT
HWND :: win32.HWND
IUnknown :: win32.IUnknown
IUnknown_Vtbl :: win32.IUnknown_Vtbl
LUID :: win32.LUID
PSTR :: win32.PSTR
PWSTR :: win32.PWSTR
RECT :: win32.RECT
SECURITY_ATTRIBUTES :: win32.SECURITY_ATTRIBUTES

import "../d3d"
import "../dxgi"
import win32 ".."
