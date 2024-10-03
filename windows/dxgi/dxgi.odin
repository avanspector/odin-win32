package windows_dxgi

foreign import dxgi "system:dxgi.lib"

@(default_calling_convention="system")
foreign dxgi {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-createdxgifactory ]]
	CreateDXGIFactory :: proc(#by_ptr riid: GUID, ppFactory: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-createdxgifactory1 ]]
	CreateDXGIFactory1 :: proc(#by_ptr riid: GUID, ppFactory: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-createdxgifactory2 ]]
	CreateDXGIFactory2 :: proc(Flags: CREATE_FACTORY_FLAGS, #by_ptr riid: GUID, ppFactory: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-dxgideclareadapterremovalsupport ]]
	@(link_name="DXGIDeclareAdapterRemovalSupport")
	DeclareAdapterRemovalSupport :: proc() -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/nf-dxgi1_6-dxgidisablevblankvirtualization ]]
	@(link_name="DXGIDisableVBlankVirtualization")
	DisableVBlankVirtualization :: proc() -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nf-dxgi1_3-dxgigetdebuginterface1 ]]
	@(link_name="DXGIGetDebugInterface1")
	GetDebugInterface1 :: proc(Flags: u32, #by_ptr riid: GUID, pDebug: rawptr) -> HRESULT ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_adapter_desc ]]
ADAPTER_DESC :: struct {
	Description: [128]u16,
	VendorId: u32,
	DeviceId: u32,
	SubSysId: u32,
	Revision: u32,
	DedicatedVideoMemory: uintptr,
	DedicatedSystemMemory: uintptr,
	SharedSystemMemory: uintptr,
	AdapterLuid: LUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_adapter_desc1 ]]
ADAPTER_DESC1 :: struct {
	Description: [128]u16,
	VendorId: u32,
	DeviceId: u32,
	SubSysId: u32,
	Revision: u32,
	DedicatedVideoMemory: uintptr,
	DedicatedSystemMemory: uintptr,
	SharedSystemMemory: uintptr,
	AdapterLuid: LUID,
	Flags: ADAPTER_FLAG,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_adapter_desc2 ]]
ADAPTER_DESC2 :: struct {
	Description: [128]u16,
	VendorId: u32,
	DeviceId: u32,
	SubSysId: u32,
	Revision: u32,
	DedicatedVideoMemory: uintptr,
	DedicatedSystemMemory: uintptr,
	SharedSystemMemory: uintptr,
	AdapterLuid: LUID,
	Flags: ADAPTER_FLAG,
	GraphicsPreemptionGranularity: GRAPHICS_PREEMPTION_GRANULARITY,
	ComputePreemptionGranularity: COMPUTE_PREEMPTION_GRANULARITY,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/ns-dxgi1_6-dxgi_adapter_desc3 ]]
ADAPTER_DESC3 :: struct {
	Description: [128]u16,
	VendorId: u32,
	DeviceId: u32,
	SubSysId: u32,
	Revision: u32,
	DedicatedVideoMemory: uintptr,
	DedicatedSystemMemory: uintptr,
	SharedSystemMemory: uintptr,
	AdapterLuid: LUID,
	Flags: ADAPTER_FLAG3,
	GraphicsPreemptionGranularity: GRAPHICS_PREEMPTION_GRANULARITY,
	ComputePreemptionGranularity: COMPUTE_PREEMPTION_GRANULARITY,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_adapter_flag ]]
ADAPTER_FLAG :: distinct bit_set[enum {
	REMOTE = 0,
	SOFTWARE = 1,
}; i32]
ADAPTER_FLAG_NONE :: transmute(ADAPTER_FLAG)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/ne-dxgi1_6-dxgi_adapter_flag3 ]]
ADAPTER_FLAG3 :: distinct bit_set[enum {
	REMOTE = 0,
	SOFTWARE = 1,
	ACG_COMPATIBLE = 2,
	SUPPORT_MONITORED_FENCES = 3,
	SUPPORT_NON_MONITORED_FENCES = 4,
	KEYED_MUTEX_CONFORMANCE = 5,
}; i32]
ADAPTER_FLAG3_NONE :: transmute(ADAPTER_FLAG3)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_alpha_mode ]]
ALPHA_MODE :: enum i32 {
	UNSPECIFIED = 0,
	PREMULTIPLIED = 1,
	STRAIGHT = 2,
	IGNORE = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type ]]
COLOR_SPACE_TYPE :: enum i32 {
	RGB_FULL_G22_NONE_P709 = 0,
	RGB_FULL_G10_NONE_P709 = 1,
	RGB_STUDIO_G22_NONE_P709 = 2,
	RGB_STUDIO_G22_NONE_P2020 = 3,
	RESERVED = 4,
	YCBCR_FULL_G22_NONE_P709_X601 = 5,
	YCBCR_STUDIO_G22_LEFT_P601 = 6,
	YCBCR_FULL_G22_LEFT_P601 = 7,
	YCBCR_STUDIO_G22_LEFT_P709 = 8,
	YCBCR_FULL_G22_LEFT_P709 = 9,
	YCBCR_STUDIO_G22_LEFT_P2020 = 10,
	YCBCR_FULL_G22_LEFT_P2020 = 11,
	RGB_FULL_G2084_NONE_P2020 = 12,
	YCBCR_STUDIO_G2084_LEFT_P2020 = 13,
	RGB_STUDIO_G2084_NONE_P2020 = 14,
	YCBCR_STUDIO_G22_TOPLEFT_P2020 = 15,
	YCBCR_STUDIO_G2084_TOPLEFT_P2020 = 16,
	RGB_FULL_G22_NONE_P2020 = 17,
	YCBCR_STUDIO_GHLG_TOPLEFT_P2020 = 18,
	YCBCR_FULL_GHLG_TOPLEFT_P2020 = 19,
	RGB_STUDIO_G24_NONE_P709 = 20,
	RGB_STUDIO_G24_NONE_P2020 = 21,
	YCBCR_STUDIO_G24_LEFT_P709 = 22,
	YCBCR_STUDIO_G24_LEFT_P2020 = 23,
	YCBCR_STUDIO_G24_TOPLEFT_P2020 = 24,
	CUSTOM = -1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_compute_preemption_granularity ]]
COMPUTE_PREEMPTION_GRANULARITY :: enum i32 {
	DMA_BUFFER_BOUNDARY = 0,
	DISPATCH_BOUNDARY = 1,
	THREAD_GROUP_BOUNDARY = 2,
	THREAD_BOUNDARY = 3,
	INSTRUCTION_BOUNDARY = 4,
}

CREATE_FACTORY_FLAGS :: distinct bit_set[enum {
	DEBUG = 0,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/ne-dxgidebug-dxgi_debug_rlo_flags ]]
DEBUG_RLO_FLAGS :: distinct bit_set[enum {
	SUMMARY = 0,
	DETAIL = 1,
	IGNORE_INTERNAL = 2,
}; i32]
DEBUG_RLO_FLAGS_ALL :: transmute(DEBUG_RLO_FLAGS)i32(7)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/ns-dxgi1_3-dxgi_decode_swap_chain_desc ]]
DECODE_SWAP_CHAIN_DESC :: struct {
	Flags: SWAP_CHAIN_FLAG,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_display_color_space ]]
DISPLAY_COLOR_SPACE :: struct {
	PrimaryCoordinates: [16]f32,
	WhitePoints: [32]f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-enum-modes ]]
ENUM_MODES :: distinct bit_set[enum {
	INTERLACED = 0,
	SCALING = 1,
	STEREO = 2,
	DISABLED_STEREO = 3,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/ne-dxgi1_5-dxgi_feature ]]
FEATURE :: enum i32 {
	PRESENT_ALLOW_TEARING = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgiformat/ne-dxgiformat-dxgi_format ]]
FORMAT :: enum i32 {
	UNKNOWN = 0,
	R32G32B32A32_TYPELESS = 1,
	R32G32B32A32_FLOAT = 2,
	R32G32B32A32_UINT = 3,
	R32G32B32A32_SINT = 4,
	R32G32B32_TYPELESS = 5,
	R32G32B32_FLOAT = 6,
	R32G32B32_UINT = 7,
	R32G32B32_SINT = 8,
	R16G16B16A16_TYPELESS = 9,
	R16G16B16A16_FLOAT = 10,
	R16G16B16A16_UNORM = 11,
	R16G16B16A16_UINT = 12,
	R16G16B16A16_SNORM = 13,
	R16G16B16A16_SINT = 14,
	R32G32_TYPELESS = 15,
	R32G32_FLOAT = 16,
	R32G32_UINT = 17,
	R32G32_SINT = 18,
	R32G8X24_TYPELESS = 19,
	D32_FLOAT_S8X24_UINT = 20,
	R32_FLOAT_X8X24_TYPELESS = 21,
	X32_TYPELESS_G8X24_UINT = 22,
	R10G10B10A2_TYPELESS = 23,
	R10G10B10A2_UNORM = 24,
	R10G10B10A2_UINT = 25,
	R11G11B10_FLOAT = 26,
	R8G8B8A8_TYPELESS = 27,
	R8G8B8A8_UNORM = 28,
	R8G8B8A8_UNORM_SRGB = 29,
	R8G8B8A8_UINT = 30,
	R8G8B8A8_SNORM = 31,
	R8G8B8A8_SINT = 32,
	R16G16_TYPELESS = 33,
	R16G16_FLOAT = 34,
	R16G16_UNORM = 35,
	R16G16_UINT = 36,
	R16G16_SNORM = 37,
	R16G16_SINT = 38,
	R32_TYPELESS = 39,
	D32_FLOAT = 40,
	R32_FLOAT = 41,
	R32_UINT = 42,
	R32_SINT = 43,
	R24G8_TYPELESS = 44,
	D24_UNORM_S8_UINT = 45,
	R24_UNORM_X8_TYPELESS = 46,
	X24_TYPELESS_G8_UINT = 47,
	R8G8_TYPELESS = 48,
	R8G8_UNORM = 49,
	R8G8_UINT = 50,
	R8G8_SNORM = 51,
	R8G8_SINT = 52,
	R16_TYPELESS = 53,
	R16_FLOAT = 54,
	D16_UNORM = 55,
	R16_UNORM = 56,
	R16_UINT = 57,
	R16_SNORM = 58,
	R16_SINT = 59,
	R8_TYPELESS = 60,
	R8_UNORM = 61,
	R8_UINT = 62,
	R8_SNORM = 63,
	R8_SINT = 64,
	A8_UNORM = 65,
	R1_UNORM = 66,
	R9G9B9E5_SHAREDEXP = 67,
	R8G8_B8G8_UNORM = 68,
	G8R8_G8B8_UNORM = 69,
	BC1_TYPELESS = 70,
	BC1_UNORM = 71,
	BC1_UNORM_SRGB = 72,
	BC2_TYPELESS = 73,
	BC2_UNORM = 74,
	BC2_UNORM_SRGB = 75,
	BC3_TYPELESS = 76,
	BC3_UNORM = 77,
	BC3_UNORM_SRGB = 78,
	BC4_TYPELESS = 79,
	BC4_UNORM = 80,
	BC4_SNORM = 81,
	BC5_TYPELESS = 82,
	BC5_UNORM = 83,
	BC5_SNORM = 84,
	B5G6R5_UNORM = 85,
	B5G5R5A1_UNORM = 86,
	B8G8R8A8_UNORM = 87,
	B8G8R8X8_UNORM = 88,
	R10G10B10_XR_BIAS_A2_UNORM = 89,
	B8G8R8A8_TYPELESS = 90,
	B8G8R8A8_UNORM_SRGB = 91,
	B8G8R8X8_TYPELESS = 92,
	B8G8R8X8_UNORM_SRGB = 93,
	BC6H_TYPELESS = 94,
	BC6H_UF16 = 95,
	BC6H_SF16 = 96,
	BC7_TYPELESS = 97,
	BC7_UNORM = 98,
	BC7_UNORM_SRGB = 99,
	AYUV = 100,
	Y410 = 101,
	Y416 = 102,
	NV12 = 103,
	P010 = 104,
	P016 = 105,
	_420_OPAQUE = 106,
	YUY2 = 107,
	Y210 = 108,
	Y216 = 109,
	NV11 = 110,
	AI44 = 111,
	IA44 = 112,
	P8 = 113,
	A8P8 = 114,
	B4G4R4A4_UNORM = 115,
	P208 = 130,
	V208 = 131,
	V408 = 132,
	SAMPLER_FEEDBACK_MIN_MIP_OPAQUE = 189,
	SAMPLER_FEEDBACK_MIP_REGION_USED_OPAQUE = 190,
	A4B4G4R4_UNORM = 191,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/ne-dxgi1_3-dxgi_frame_presentation_mode ]]
FRAME_PRESENTATION_MODE :: enum i32 {
	COMPOSED = 0,
	OVERLAY = 1,
	NONE = 2,
	COMPOSITION_FAILURE = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_frame_statistics ]]
FRAME_STATISTICS :: struct {
	PresentCount: u32,
	PresentRefreshCount: u32,
	SyncRefreshCount: u32,
	SyncQPCTime: i64,
	SyncGPUTime: i64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/ns-dxgi1_3-dxgi_frame_statistics_media ]]
FRAME_STATISTICS_MEDIA :: struct {
	PresentCount: u32,
	PresentRefreshCount: u32,
	SyncRefreshCount: u32,
	SyncQPCTime: i64,
	SyncGPUTime: i64,
	CompositionMode: FRAME_PRESENTATION_MODE,
	ApprovedPresentDuration: u32,
}

GAMMA_CONTROL :: struct {
	Scale: RGB,
	Offset: RGB,
	GammaCurve: [1025]RGB,
}

GAMMA_CONTROL_CAPABILITIES :: struct {
	ScaleAndOffsetSupported: BOOL,
	MaxConvertedValue: f32,
	MinConvertedValue: f32,
	NumGammaControlPoints: u32,
	ControlPointPositions: [1025]f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/ne-dxgi1_6-dxgi_gpu_preference ]]
GPU_PREFERENCE :: enum i32 {
	UNSPECIFIED = 0,
	MINIMUM_POWER = 1,
	HIGH_PERFORMANCE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_graphics_preemption_granularity ]]
GRAPHICS_PREEMPTION_GRANULARITY :: enum i32 {
	DMA_BUFFER_BOUNDARY = 0,
	PRIMITIVE_BOUNDARY = 1,
	TRIANGLE_BOUNDARY = 2,
	PIXEL_BOUNDARY = 3,
	INSTRUCTION_BOUNDARY = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/ne-dxgi1_6-dxgi_hardware_composition_support_flags ]]
HARDWARE_COMPOSITION_SUPPORT_FLAGS :: distinct bit_set[enum {
	FULLSCREEN = 0,
	WINDOWED = 1,
	CURSOR_STRETCHED = 2,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/ns-dxgi1_5-dxgi_hdr_metadata_hdr10 ]]
HDR_METADATA_HDR10 :: struct {
	RedPrimary: [2]u16,
	GreenPrimary: [2]u16,
	BluePrimary: [2]u16,
	WhitePoint: [2]u16,
	MaxMasteringLuminance: u32,
	MinMasteringLuminance: u32,
	MaxContentLightLevel: u16,
	MaxFrameAverageLightLevel: u16,
}

HDR_METADATA_HDR10PLUS :: struct {
	Data: [72]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/ne-dxgi1_5-dxgi_hdr_metadata_type ]]
HDR_METADATA_TYPE :: enum i32 {
	NONE = 0,
	HDR10 = 1,
	HDR10PLUS = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter ]]
INFO_QUEUE_FILTER :: struct {
	AllowList: INFO_QUEUE_FILTER_DESC,
	DenyList: INFO_QUEUE_FILTER_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_filter_desc ]]
INFO_QUEUE_FILTER_DESC :: struct {
	NumCategories: u32,
	pCategoryList: ^INFO_QUEUE_MESSAGE_CATEGORY,
	NumSeverities: u32,
	pSeverityList: ^INFO_QUEUE_MESSAGE_SEVERITY,
	NumIDs: u32,
	pIDList: ^i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/ns-dxgidebug-dxgi_info_queue_message ]]
INFO_QUEUE_MESSAGE :: struct {
	Producer: GUID,
	Category: INFO_QUEUE_MESSAGE_CATEGORY,
	Severity: INFO_QUEUE_MESSAGE_SEVERITY,
	ID: i32,
	pDescription: ^u8,
	DescriptionByteLength: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_category ]]
INFO_QUEUE_MESSAGE_CATEGORY :: enum i32 {
	UNKNOWN = 0,
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/ne-dxgidebug-dxgi_info_queue_message_severity ]]
INFO_QUEUE_MESSAGE_SEVERITY :: enum i32 {
	CORRUPTION = 0,
	ERROR = 1,
	WARNING = 2,
	INFO = 3,
	MESSAGE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-jpeg-ac-huffman-table ]]
JPEG_AC_HUFFMAN_TABLE :: struct {
	CodeCounts: [16]u8,
	CodeValues: [162]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-jpeg-dc-huffman-table ]]
JPEG_DC_HUFFMAN_TABLE :: struct {
	CodeCounts: [12]u8,
	CodeValues: [12]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-jpeg-quantization-table ]]
JPEG_QUANTIZATION_TABLE :: struct {
	Elements: [64]u8,
}

MAP_FLAGS :: distinct bit_set[enum {
	READ = 0,
	WRITE = 1,
	DISCARD = 2,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_mapped_rect ]]
MAPPED_RECT :: struct {
	Pitch: i32,
	pBits: ^u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/ns-dxgi1_3-dxgi_matrix_3x2_f ]]
MATRIX_3X2_F :: struct {
	_11: f32,
	_12: f32,
	_21: f32,
	_22: f32,
	_31: f32,
	_32: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_memory_segment_group ]]
MEMORY_SEGMENT_GROUP :: enum i32 {
	LOCAL = 0,
	NON_LOCAL = 1,
}

Message_Id :: enum i32 {
	IDXGISwapChain_CreationOrResizeBuffers_InvalidOutputWindow = 0,
	IDXGISwapChain_CreationOrResizeBuffers_BufferWidthInferred = 1,
	IDXGISwapChain_CreationOrResizeBuffers_BufferHeightInferred = 2,
	IDXGISwapChain_CreationOrResizeBuffers_NoScanoutFlagChanged = 3,
	IDXGISwapChain_Creation_MaxBufferCountExceeded = 4,
	IDXGISwapChain_Creation_TooFewBuffers = 5,
	IDXGISwapChain_Creation_NoOutputWindow = 6,
	IDXGISwapChain_Destruction_OtherMethodsCalled = 7,
	IDXGISwapChain_GetDesc_pDescIsNULL = 8,
	IDXGISwapChain_GetBuffer_ppSurfaceIsNULL = 9,
	IDXGISwapChain_GetBuffer_NoAllocatedBuffers = 10,
	IDXGISwapChain_GetBuffer_iBufferMustBeZero = 11,
	IDXGISwapChain_GetBuffer_iBufferOOB = 12,
	IDXGISwapChain_GetContainingOutput_ppOutputIsNULL = 13,
	IDXGISwapChain_Present_SyncIntervalOOB = 14,
	IDXGISwapChain_Present_InvalidNonPreRotatedFlag = 15,
	IDXGISwapChain_Present_NoAllocatedBuffers = 16,
	IDXGISwapChain_Present_GetDXGIAdapterFailed = 17,
	IDXGISwapChain_ResizeBuffers_BufferCountOOB = 18,
	IDXGISwapChain_ResizeBuffers_UnreleasedReferences = 19,
	IDXGISwapChain_ResizeBuffers_InvalidSwapChainFlag = 20,
	IDXGISwapChain_ResizeBuffers_InvalidNonPreRotatedFlag = 21,
	IDXGISwapChain_ResizeTarget_RefreshRateDivideByZero = 22,
	IDXGISwapChain_SetFullscreenState_InvalidTarget = 23,
	IDXGISwapChain_GetFrameStatistics_pStatsIsNULL = 24,
	IDXGISwapChain_GetLastPresentCount_pLastPresentCountIsNULL = 25,
	IDXGISwapChain_SetFullscreenState_RemoteNotSupported = 26,
	IDXGIOutput_TakeOwnership_FailedToAcquireFullscreenMutex = 27,
	IDXGIFactory_CreateSoftwareAdapter_ppAdapterInterfaceIsNULL = 28,
	IDXGIFactory_EnumAdapters_ppAdapterInterfaceIsNULL = 29,
	IDXGIFactory_CreateSwapChain_ppSwapChainIsNULL = 30,
	IDXGIFactory_CreateSwapChain_pDescIsNULL = 31,
	IDXGIFactory_CreateSwapChain_UnknownSwapEffect = 32,
	IDXGIFactory_CreateSwapChain_InvalidFlags = 33,
	IDXGIFactory_CreateSwapChain_NonPreRotatedFlagAndWindowed = 34,
	IDXGIFactory_CreateSwapChain_NullDeviceInterface = 35,
	IDXGIFactory_GetWindowAssociation_phWndIsNULL = 36,
	IDXGIFactory_MakeWindowAssociation_InvalidFlags = 37,
	IDXGISurface_Map_InvalidSurface = 38,
	IDXGISurface_Map_FlagsSetToZero = 39,
	IDXGISurface_Map_DiscardAndReadFlagSet = 40,
	IDXGISurface_Map_DiscardButNotWriteFlagSet = 41,
	IDXGISurface_Map_NoCPUAccess = 42,
	IDXGISurface_Map_ReadFlagSetButCPUAccessIsDynamic = 43,
	IDXGISurface_Map_DiscardFlagSetButCPUAccessIsNotDynamic = 44,
	IDXGIOutput_GetDisplayModeList_pNumModesIsNULL = 45,
	IDXGIOutput_FindClosestMatchingMode_ModeHasInvalidWidthOrHeight = 46,
	IDXGIOutput_GetCammaControlCapabilities_NoOwnerDevice = 47,
	IDXGIOutput_TakeOwnership_pDeviceIsNULL = 48,
	IDXGIOutput_GetDisplaySurfaceData_NoOwnerDevice = 49,
	IDXGIOutput_GetDisplaySurfaceData_pDestinationIsNULL = 50,
	IDXGIOutput_GetDisplaySurfaceData_MapOfDestinationFailed = 51,
	IDXGIOutput_GetFrameStatistics_NoOwnerDevice = 52,
	IDXGIOutput_GetFrameStatistics_pStatsIsNULL = 53,
	IDXGIOutput_SetGammaControl_NoOwnerDevice = 54,
	IDXGIOutput_GetGammaControl_NoOwnerDevice = 55,
	IDXGIOutput_GetGammaControl_NoGammaControls = 56,
	IDXGIOutput_SetDisplaySurface_IDXGIResourceNotSupportedBypPrimary = 57,
	IDXGIOutput_SetDisplaySurface_pPrimaryIsInvalid = 58,
	IDXGIOutput_SetDisplaySurface_NoOwnerDevice = 59,
	IDXGIOutput_TakeOwnership_RemoteDeviceNotSupported = 60,
	IDXGIOutput_GetDisplayModeList_RemoteDeviceNotSupported = 61,
	IDXGIOutput_FindClosestMatchingMode_RemoteDeviceNotSupported = 62,
	IDXGIDevice_CreateSurface_InvalidParametersWithpSharedResource = 63,
	IDXGIObject_GetPrivateData_puiDataSizeIsNULL = 64,
	IDXGISwapChain_Creation_InvalidOutputWindow = 65,
	IDXGISwapChain_Release_SwapChainIsFullscreen = 66,
	IDXGIOutput_GetDisplaySurfaceData_InvalidTargetSurfaceFormat = 67,
	IDXGIFactory_CreateSoftwareAdapter_ModuleIsNULL = 68,
	IDXGIOutput_FindClosestMatchingMode_IDXGIDeviceNotSupportedBypConcernedDevice = 69,
	IDXGIOutput_FindClosestMatchingMode_pModeToMatchOrpClosestMatchIsNULL = 70,
	IDXGIOutput_FindClosestMatchingMode_ModeHasRefreshRateDenominatorZero = 71,
	IDXGIOutput_FindClosestMatchingMode_UnknownFormatIsInvalidForConfiguration = 72,
	IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScanlineOrdering = 73,
	IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeScaling = 74,
	IDXGIOutput_FindClosestMatchingMode_InvalidDisplayModeFormatAndDeviceCombination = 75,
	IDXGIFactory_Creation_CalledFromDllMain = 76,
	IDXGISwapChain_SetFullscreenState_OutputNotOwnedBySwapChainDevice = 77,
	IDXGISwapChain_Creation_InvalidWindowStyle = 78,
	IDXGISwapChain_GetFrameStatistics_UnsupportedStatistics = 79,
	IDXGISwapChain_GetContainingOutput_SwapchainAdapterDoesNotControlOutput = 80,
	IDXGIOutput_SetOrGetGammaControl_pArrayIsNULL = 81,
	IDXGISwapChain_SetFullscreenState_FullscreenInvalidForChildWindows = 82,
	IDXGIFactory_Release_CalledFromDllMain = 83,
	IDXGISwapChain_Present_UnreleasedHDC = 84,
	IDXGISwapChain_ResizeBuffers_NonPreRotatedAndGDICompatibleFlags = 85,
	IDXGIFactory_CreateSwapChain_NonPreRotatedAndGDICompatibleFlags = 86,
	IDXGISurface1_GetDC_pHdcIsNULL = 87,
	IDXGISurface1_GetDC_SurfaceNotTexture2D = 88,
	IDXGISurface1_GetDC_GDICompatibleFlagNotSet = 89,
	IDXGISurface1_GetDC_UnreleasedHDC = 90,
	IDXGISurface_Map_NoCPUAccess2 = 91,
	IDXGISurface1_ReleaseDC_GetDCNotCalled = 92,
	IDXGISurface1_ReleaseDC_InvalidRectangleDimensions = 93,
	IDXGIOutput_TakeOwnership_RemoteOutputNotSupported = 94,
	IDXGIOutput_FindClosestMatchingMode_RemoteOutputNotSupported = 95,
	IDXGIOutput_GetDisplayModeList_RemoteOutputNotSupported = 96,
	IDXGIFactory_CreateSwapChain_pDeviceHasMismatchedDXGIFactory = 97,
	IDXGISwapChain_Present_NonOptimalFSConfiguration = 98,
	IDXGIFactory_CreateSwapChain_FlipSequentialNotSupportedOnD3D10 = 99,
	IDXGIFactory_CreateSwapChain_BufferCountOOBForFlipSequential = 100,
	IDXGIFactory_CreateSwapChain_InvalidFormatForFlipSequential = 101,
	IDXGIFactory_CreateSwapChain_MultiSamplingNotSupportedForFlipSequential = 102,
	IDXGISwapChain_ResizeBuffers_BufferCountOOBForFlipSequential = 103,
	IDXGISwapChain_ResizeBuffers_InvalidFormatForFlipSequential = 104,
	IDXGISwapChain_Present_PartialPresentationBeforeStandardPresentation = 105,
	IDXGISwapChain_Present_FullscreenPartialPresentIsInvalid = 106,
	IDXGISwapChain_Present_InvalidPresentTestOrDoNotSequenceFlag = 107,
	IDXGISwapChain_Present_ScrollInfoWithNoDirtyRectsSpecified = 108,
	IDXGISwapChain_Present_EmptyScrollRect = 109,
	IDXGISwapChain_Present_ScrollRectOutOfBackbufferBounds = 110,
	IDXGISwapChain_Present_ScrollRectOutOfBackbufferBoundsWithOffset = 111,
	IDXGISwapChain_Present_EmptyDirtyRect = 112,
	IDXGISwapChain_Present_DirtyRectOutOfBackbufferBounds = 113,
	IDXGIFactory_CreateSwapChain_UnsupportedBufferUsageFlags = 114,
	IDXGISwapChain_Present_DoNotSequenceFlagSetButPreviousBufferIsUndefined = 115,
	IDXGISwapChain_Present_UnsupportedFlags = 116,
	IDXGISwapChain_Present_FlipModelChainMustResizeOrCreateOnFSTransition = 117,
	IDXGIFactory_CreateSwapChain_pRestrictToOutputFromOtherIDXGIFactory = 118,
	IDXGIFactory_CreateSwapChain_RestrictOutputNotSupportedOnAdapter = 119,
	IDXGISwapChain_Present_RestrictToOutputFlagSetButInvalidpRestrictToOutput = 120,
	IDXGISwapChain_Present_RestrictToOutputFlagdWithFullscreen = 121,
	IDXGISwapChain_Present_RestrictOutputFlagWithStaleSwapChain = 122,
	IDXGISwapChain_Present_OtherFlagsCausingInvalidPresentTestFlag = 123,
	IDXGIFactory_CreateSwapChain_UnavailableInSession0 = 124,
	IDXGIFactory_MakeWindowAssociation_UnavailableInSession0 = 125,
	IDXGIFactory_GetWindowAssociation_UnavailableInSession0 = 126,
	IDXGIAdapter_EnumOutputs_UnavailableInSession0 = 127,
	IDXGISwapChain_CreationOrSetFullscreenState_StereoDisabled = 128,
	IDXGIFactory2_UnregisterStatus_CookieNotFound = 129,
	IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFSOrOverlay = 130,
	IDXGISwapChain_Present_ProtectedContentInWindowedModeWithoutFlipSequential = 131,
	IDXGISwapChain_Present_ProtectedContentWithRDPDriver = 132,
	IDXGISwapChain_Present_ProtectedContentInWindowedModeWithDWMOffOrInvalidDisplayAffinity = 133,
	IDXGIFactory_CreateSwapChainForComposition_WidthOrHeightIsZero = 134,
	IDXGIFactory_CreateSwapChainForComposition_OnlyFlipSequentialSupported = 135,
	IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnAdapter = 136,
	IDXGIFactory_CreateSwapChainForComposition_UnsupportedOnWindows7 = 137,
	IDXGISwapChain_SetFullscreenState_FSTransitionWithCompositionSwapChain = 138,
	IDXGISwapChain_ResizeTarget_InvalidWithCompositionSwapChain = 139,
	IDXGISwapChain_ResizeBuffers_WidthOrHeightIsZero = 140,
	IDXGIFactory_CreateSwapChain_ScalingNoneIsFlipModelOnly = 141,
	IDXGIFactory_CreateSwapChain_ScalingUnrecognized = 142,
	IDXGIFactory_CreateSwapChain_DisplayOnlyFullscreenUnsupported = 143,
	IDXGIFactory_CreateSwapChain_DisplayOnlyUnsupported = 144,
	IDXGISwapChain_Present_RestartIsFullscreenOnly = 145,
	IDXGISwapChain_Present_ProtectedWindowlessPresentationRequiresDisplayOnly = 146,
	IDXGISwapChain_SetFullscreenState_DisplayOnlyUnsupported = 147,
	IDXGISwapChain1_SetBackgroundColor_OutOfRange = 148,
	IDXGISwapChain_ResizeBuffers_DisplayOnlyFullscreenUnsupported = 149,
	IDXGISwapChain_ResizeBuffers_DisplayOnlyUnsupported = 150,
	IDXGISwapchain_Present_ScrollUnsupported = 151,
	IDXGISwapChain1_SetRotation_UnsupportedOS = 152,
	IDXGISwapChain1_GetRotation_UnsupportedOS = 153,
	IDXGISwapchain_Present_FullscreenRotation = 154,
	IDXGISwapChain_Present_PartialPresentationWithMSAABuffers = 155,
	IDXGISwapChain1_SetRotation_FlipSequentialRequired = 156,
	IDXGISwapChain1_SetRotation_InvalidRotation = 157,
	IDXGISwapChain1_GetRotation_FlipSequentialRequired = 158,
	IDXGISwapChain_GetHwnd_WrongType = 159,
	IDXGISwapChain_GetCompositionSurface_WrongType = 160,
	IDXGISwapChain_GetCoreWindow_WrongType = 161,
	IDXGISwapChain_GetFullscreenDesc_NonHwnd = 162,
	IDXGISwapChain_SetFullscreenState_CoreWindow = 163,
	IDXGIFactory2_CreateSwapChainForCoreWindow_UnsupportedOnWindows7 = 164,
	IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsNULL = 165,
	IDXGIFactory_CreateSwapChain_FSUnsupportedForModernApps = 166,
	IDXGIFactory_MakeWindowAssociation_ModernApp = 167,
	IDXGISwapChain_ResizeTarget_ModernApp = 168,
	IDXGISwapChain_ResizeTarget_pNewTargetParametersIsNULL = 169,
	IDXGIOutput_SetDisplaySurface_ModernApp = 170,
	IDXGIOutput_TakeOwnership_ModernApp = 171,
	IDXGIFactory2_CreateSwapChainForCoreWindow_pWindowIsInvalid = 172,
	IDXGIFactory2_CreateSwapChainForCompositionSurface_InvalidHandle = 173,
	IDXGISurface1_GetDC_ModernApp = 174,
	IDXGIFactory_CreateSwapChain_ScalingNoneRequiresWindows8OrNewer = 175,
	IDXGISwapChain_Present_TemporaryMonoAndPreferRight = 176,
	IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithDoNotSequence = 177,
	IDXGISwapChain_Present_TemporaryMonoOrPreferRightWithoutStereo = 178,
	IDXGISwapChain_Present_TemporaryMonoUnsupported = 179,
	IDXGIOutput_GetDisplaySurfaceData_ArraySizeMismatch = 180,
	IDXGISwapChain_Present_PartialPresentationWithSwapEffectDiscard = 181,
	IDXGIFactory_CreateSwapChain_AlphaUnrecognized = 182,
	IDXGIFactory_CreateSwapChain_AlphaIsWindowlessOnly = 183,
	IDXGIFactory_CreateSwapChain_AlphaIsFlipModelOnly = 184,
	IDXGIFactory_CreateSwapChain_RestrictToOutputAdapterMismatch = 185,
	IDXGIFactory_CreateSwapChain_DisplayOnlyOnLegacy = 186,
	IDXGISwapChain_ResizeBuffers_DisplayOnlyOnLegacy = 187,
	IDXGIResource1_CreateSubresourceSurface_InvalidIndex = 188,
	IDXGIFactory_CreateSwapChainForComposition_InvalidScaling = 189,
	IDXGIFactory_CreateSwapChainForCoreWindow_InvalidSwapEffect = 190,
	IDXGIResource1_CreateSharedHandle_UnsupportedOS = 191,
	IDXGIFactory2_RegisterOcclusionStatusWindow_UnsupportedOS = 192,
	IDXGIFactory2_RegisterOcclusionStatusEvent_UnsupportedOS = 193,
	IDXGIOutput1_DuplicateOutput_UnsupportedOS = 194,
	IDXGIDisplayControl_IsStereoEnabled_UnsupportedOS = 195,
	IDXGIFactory_CreateSwapChainForComposition_InvalidAlphaMode = 196,
	IDXGIFactory_GetSharedResourceAdapterLuid_InvalidResource = 197,
	IDXGIFactory_GetSharedResourceAdapterLuid_InvalidLUID = 198,
	IDXGIFactory_GetSharedResourceAdapterLuid_UnsupportedOS = 199,
	IDXGIOutput1_GetDisplaySurfaceData1_2DOnly = 200,
	IDXGIOutput1_GetDisplaySurfaceData1_StagingOnly = 201,
	IDXGIOutput1_GetDisplaySurfaceData1_NeedCPUAccessWrite = 202,
	IDXGIOutput1_GetDisplaySurfaceData1_NoShared = 203,
	IDXGIOutput1_GetDisplaySurfaceData1_OnlyMipLevels1 = 204,
	IDXGIOutput1_GetDisplaySurfaceData1_MappedOrOfferedResource = 205,
	IDXGISwapChain_SetFullscreenState_FSUnsupportedForModernApps = 206,
	IDXGIFactory_CreateSwapChain_FailedToGoFSButNonPreRotated = 207,
	IDXGIFactory_CreateSwapChainOrRegisterOcclusionStatus_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = 208,
	IDXGISwapChain_Present_BlitModelUsedWhileRegisteredForOcclusionStatusEvents = 209,
	IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreFlipModelOnly = 210,
	IDXGIFactory_CreateSwapChain_WaitableSwapChainsAreNotFullscreen = 211,
	IDXGISwapChain_SetFullscreenState_Waitable = 212,
	IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveWaitableFlag = 213,
	IDXGISwapChain_GetFrameLatencyWaitableObject_OnlyWaitable = 214,
	IDXGISwapChain_GetMaximumFrameLatency_OnlyWaitable = 215,
	IDXGISwapChain_GetMaximumFrameLatency_pMaxLatencyIsNULL = 216,
	IDXGISwapChain_SetMaximumFrameLatency_OnlyWaitable = 217,
	IDXGISwapChain_SetMaximumFrameLatency_MaxLatencyIsOutOfBounds = 218,
	IDXGIFactory_CreateSwapChain_ForegroundIsCoreWindowOnly = 219,
	IDXGIFactory2_CreateSwapChainForCoreWindow_ForegroundUnsupportedOnAdapter = 220,
	IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidScaling = 221,
	IDXGIFactory2_CreateSwapChainForCoreWindow_InvalidAlphaMode = 222,
	IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveForegroundFlag = 223,
	IDXGISwapChain_SetMatrixTransform_MatrixPointerCannotBeNull = 224,
	IDXGISwapChain_SetMatrixTransform_RequiresCompositionSwapChain = 225,
	IDXGISwapChain_SetMatrixTransform_MatrixMustBeFinite = 226,
	IDXGISwapChain_SetMatrixTransform_MatrixMustBeTranslateAndOrScale = 227,
	IDXGISwapChain_GetMatrixTransform_MatrixPointerCannotBeNull = 228,
	IDXGISwapChain_GetMatrixTransform_RequiresCompositionSwapChain = 229,
	DXGIGetDebugInterface1_NULL_ppDebug = 230,
	DXGIGetDebugInterface1_InvalidFlags = 231,
	IDXGISwapChain_Present_Decode = 232,
	IDXGISwapChain_ResizeBuffers_Decode = 233,
	IDXGISwapChain_SetSourceSize_FlipModel = 234,
	IDXGISwapChain_SetSourceSize_Decode = 235,
	IDXGISwapChain_SetSourceSize_WidthHeight = 236,
	IDXGISwapChain_GetSourceSize_NullPointers = 237,
	IDXGISwapChain_GetSourceSize_Decode = 238,
	IDXGIDecodeSwapChain_SetColorSpace_InvalidFlags = 239,
	IDXGIDecodeSwapChain_SetSourceRect_InvalidRect = 240,
	IDXGIDecodeSwapChain_SetTargetRect_InvalidRect = 241,
	IDXGIDecodeSwapChain_SetDestSize_InvalidSize = 242,
	IDXGIDecodeSwapChain_GetSourceRect_InvalidPointer = 243,
	IDXGIDecodeSwapChain_GetTargetRect_InvalidPointer = 244,
	IDXGIDecodeSwapChain_GetDestSize_InvalidPointer = 245,
	IDXGISwapChain_PresentBuffer_YUV = 246,
	IDXGISwapChain_SetSourceSize_YUV = 247,
	IDXGISwapChain_GetSourceSize_YUV = 248,
	IDXGISwapChain_SetMatrixTransform_YUV = 249,
	IDXGISwapChain_GetMatrixTransform_YUV = 250,
	IDXGISwapChain_Present_PartialPresentation_YUV = 251,
	IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveFlag_YUV = 252,
	IDXGISwapChain_ResizeBuffers_Alignment_YUV = 253,
	IDXGIFactory_CreateSwapChain_ShaderInputUnsupported_YUV = 254,
	IDXGIOutput3_CheckOverlaySupport_NullPointers = 255,
	IDXGIOutput3_CheckOverlaySupport_IDXGIDeviceNotSupportedBypConcernedDevice = 256,
	IDXGIAdapter_EnumOutputs2_InvalidEnumOutputs2Flag = 257,
	IDXGISwapChain_CreationOrSetFullscreenState_FSUnsupportedForFlipDiscard = 258,
	IDXGIOutput4_CheckOverlayColorSpaceSupport_NullPointers = 259,
	IDXGIOutput4_CheckOverlayColorSpaceSupport_IDXGIDeviceNotSupportedBypConcernedDevice = 260,
	IDXGISwapChain3_CheckColorSpaceSupport_NullPointers = 261,
	IDXGISwapChain3_SetColorSpace1_InvalidColorSpace = 262,
	IDXGIFactory_CreateSwapChain_InvalidHwProtect = 263,
	IDXGIFactory_CreateSwapChain_HwProtectUnsupported = 264,
	IDXGISwapChain_ResizeBuffers_InvalidHwProtect = 265,
	IDXGISwapChain_ResizeBuffers_HwProtectUnsupported = 266,
	IDXGISwapChain_ResizeBuffers1_D3D12Only = 267,
	IDXGISwapChain_ResizeBuffers1_FlipModel = 268,
	IDXGISwapChain_ResizeBuffers1_NodeMaskAndQueueRequired = 269,
	IDXGISwapChain_CreateSwapChain_InvalidHwProtectGdiFlag = 270,
	IDXGISwapChain_ResizeBuffers_InvalidHwProtectGdiFlag = 271,
	IDXGIFactory_CreateSwapChain_10BitFormatNotSupported = 272,
	IDXGIFactory_CreateSwapChain_FlipSwapEffectRequired = 273,
	IDXGIFactory_CreateSwapChain_InvalidDevice = 274,
	IDXGIOutput_TakeOwnership_Unsupported = 275,
	IDXGIFactory_CreateSwapChain_InvalidQueue = 276,
	IDXGISwapChain3_ResizeBuffers1_InvalidQueue = 277,
	IDXGIFactory_CreateSwapChainForHwnd_InvalidScaling = 278,
	IDXGISwapChain3_SetHDRMetaData_InvalidSize = 279,
	IDXGISwapChain3_SetHDRMetaData_InvalidPointer = 280,
	IDXGISwapChain3_SetHDRMetaData_InvalidType = 281,
	IDXGISwapChain_Present_FullscreenAllowTearingIsInvalid = 282,
	IDXGISwapChain_Present_AllowTearingRequiresPresentIntervalZero = 283,
	IDXGISwapChain_Present_AllowTearingRequiresCreationFlag = 284,
	IDXGISwapChain_ResizeBuffers_CannotAddOrRemoveAllowTearingFlag = 285,
	IDXGIFactory_CreateSwapChain_AllowTearingFlagIsFlipModelOnly = 286,
	IDXGIFactory_CheckFeatureSupport_InvalidFeature = 287,
	IDXGIFactory_CheckFeatureSupport_InvalidSize = 288,
	IDXGIOutput6_CheckHardwareCompositionSupport_NullPointer = 289,
	IDXGISwapChain_SetFullscreenState_PerMonitorDpiShimApplied = 290,
	IDXGIOutput_DuplicateOutput_PerMonitorDpiShimApplied = 291,
	IDXGIOutput_DuplicateOutput1_PerMonitorDpiRequired = 292,
	IDXGIFactory7_UnregisterAdaptersChangedEvent_CookieNotFound = 293,
	IDXGIFactory_CreateSwapChain_LegacyBltModelSwapEffect = 294,
	IDXGISwapChain4_SetHDRMetaData_MetadataUnchanged = 295,
	IDXGISwapChain_Present_11On12_Released_Resource = 296,
	IDXGIFactory_CreateSwapChain_MultipleSwapchainRefToSurface_DeferredDtr = 297,
	IDXGIFactory_MakeWindowAssociation_NoOpBehavior = 298,
	Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow = 1000,
	Phone_IDXGIFactory_CreateSwapChain_DISCARD_BufferCount = 1001,
	Phone_IDXGISwapChain_SetFullscreenState_NotAvailable = 1002,
	Phone_IDXGISwapChain_ResizeBuffers_NotAvailable = 1003,
	Phone_IDXGISwapChain_ResizeTarget_NotAvailable = 1004,
	Phone_IDXGISwapChain_Present_InvalidLayerIndex = 1005,
	Phone_IDXGISwapChain_Present_MultipleLayerIndex = 1006,
	Phone_IDXGISwapChain_Present_InvalidLayerFlag = 1007,
	Phone_IDXGISwapChain_Present_InvalidRotation = 1008,
	Phone_IDXGISwapChain_Present_InvalidBlend = 1009,
	Phone_IDXGISwapChain_Present_InvalidResource = 1010,
	Phone_IDXGISwapChain_Present_InvalidMultiPlaneOverlayResource = 1011,
	Phone_IDXGISwapChain_Present_InvalidIndexForPrimary = 1012,
	Phone_IDXGISwapChain_Present_InvalidIndexForOverlay = 1013,
	Phone_IDXGISwapChain_Present_InvalidSubResourceIndex = 1014,
	Phone_IDXGISwapChain_Present_InvalidSourceRect = 1015,
	Phone_IDXGISwapChain_Present_InvalidDestinationRect = 1016,
	Phone_IDXGISwapChain_Present_MultipleResource = 1017,
	Phone_IDXGISwapChain_Present_NotSharedResource = 1018,
	Phone_IDXGISwapChain_Present_InvalidFlag = 1019,
	Phone_IDXGISwapChain_Present_InvalidInterval = 1020,
	Phone_IDXGIFactory_CreateSwapChain_MSAA_NotSupported = 1021,
	Phone_IDXGIFactory_CreateSwapChain_ScalingAspectRatioStretch_Supported_ModernApp = 1022,
	Phone_IDXGISwapChain_GetFrameStatistics_NotAvailable_ModernApp = 1023,
	Phone_IDXGISwapChain_Present_ReplaceInterval0With1 = 1024,
	Phone_IDXGIFactory_CreateSwapChain_FailedRegisterWithCompositor = 1025,
	Phone_IDXGIFactory_CreateSwapChain_NotForegroundWindow_AtRendering = 1026,
	Phone_IDXGIFactory_CreateSwapChain_FLIP_SEQUENTIAL_BufferCount = 1027,
	Phone_IDXGIFactory_CreateSwapChain_FLIP_Modern_CoreWindow_Only = 1028,
	Phone_IDXGISwapChain_Present1_RequiresOverlays = 1029,
	Phone_IDXGISwapChain_SetBackgroundColor_FlipSequentialRequired = 1030,
	Phone_IDXGISwapChain_GetBackgroundColor_FlipSequentialRequired = 1031,
}

MODE_DESC :: struct {
	Width: u32,
	Height: u32,
	RefreshRate: RATIONAL,
	Format: FORMAT,
	ScanlineOrdering: MODE_SCANLINE_ORDER,
	Scaling: MODE_SCALING,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_mode_desc1 ]]
MODE_DESC1 :: struct {
	Width: u32,
	Height: u32,
	RefreshRate: RATIONAL,
	Format: FORMAT,
	ScanlineOrdering: MODE_SCANLINE_ORDER,
	Scaling: MODE_SCALING,
	Stereo: BOOL,
}

MODE_ROTATION :: enum i32 {
	UNSPECIFIED = 0,
	IDENTITY = 1,
	ROTATE90 = 2,
	ROTATE180 = 3,
	ROTATE270 = 4,
}

MODE_SCALING :: enum i32 {
	UNSPECIFIED = 0,
	CENTERED = 1,
	STRETCHED = 2,
}

MODE_SCANLINE_ORDER :: enum i32 {
	UNSPECIFIED = 0,
	PROGRESSIVE = 1,
	UPPER_FIELD_FIRST = 2,
	LOWER_FIELD_FIRST = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/ne-dxgi1_3-dxgi_multiplane_overlay_ycbcr_flags ]]
MULTIPLANE_OVERLAY_YCbCr_FLAGS :: distinct bit_set[enum {
	NOMINAL_RANGE = 0,
	BT709 = 1,
	xvYCC = 2,
}; i32]

MWA_FLAGS :: distinct bit_set[enum {
	NO_WINDOW_CHANGES = 0,
	NO_ALT_ENTER = 1,
	NO_PRINT_SCREEN = 2,
}; u32]
MWA_FLAGS_VALID :: transmute(MWA_FLAGS)u32(0x00000007)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/ne-dxgi1_5-dxgi_offer_resource_flags ]]
OFFER_RESOURCE_FLAGS :: distinct bit_set[enum {
	ALLOW_DECOMMIT = 0,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_offer_resource_priority ]]
OFFER_RESOURCE_PRIORITY :: enum i32 {
	LOW = 1,
	NORMAL = 2,
	HIGH = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_desc ]]
OUTDUPL_DESC :: struct {
	ModeDesc: MODE_DESC,
	Rotation: MODE_ROTATION,
	DesktopImageInSystemMemory: BOOL,
}

OUTDUPL_FLAG :: distinct bit_set[enum {
	COMPOSITED_UI_CAPTURE_ONLY = 0,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_frame_info ]]
OUTDUPL_FRAME_INFO :: struct {
	LastPresentTime: i64,
	LastMouseUpdateTime: i64,
	AccumulatedFrames: u32,
	RectsCoalesced: BOOL,
	ProtectedContentMaskedOut: BOOL,
	PointerPosition: OUTDUPL_POINTER_POSITION,
	TotalMetadataBufferSize: u32,
	PointerShapeBufferSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_move_rect ]]
OUTDUPL_MOVE_RECT :: struct {
	SourcePoint: POINT,
	DestinationRect: RECT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_position ]]
OUTDUPL_POINTER_POSITION :: struct {
	Position: POINT,
	Visible: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_outdupl_pointer_shape_info ]]
OUTDUPL_POINTER_SHAPE_INFO :: struct {
	Type: u32,
	Width: u32,
	Height: u32,
	Pitch: u32,
	HotSpot: POINT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_outdupl_pointer_shape_type ]]
OUTDUPL_POINTER_SHAPE_TYPE :: enum i32 {
	MONOCHROME = 1,
	COLOR = 2,
	MASKED_COLOR = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_output_desc ]]
OUTPUT_DESC :: struct {
	DeviceName: [32]u16,
	DesktopCoordinates: RECT,
	AttachedToDesktop: BOOL,
	Rotation: MODE_ROTATION,
	Monitor: HMONITOR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/ns-dxgi1_6-dxgi_output_desc1 ]]
OUTPUT_DESC1 :: struct {
	DeviceName: [32]u16,
	DesktopCoordinates: RECT,
	AttachedToDesktop: BOOL,
	Rotation: MODE_ROTATION,
	Monitor: HMONITOR,
	BitsPerColor: u32,
	ColorSpace: COLOR_SPACE_TYPE,
	RedPrimary: [2]f32,
	GreenPrimary: [2]f32,
	BluePrimary: [2]f32,
	WhitePoint: [2]f32,
	MinLuminance: f32,
	MaxLuminance: f32,
	MaxFullFrameLuminance: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_overlay_color_space_support_flag ]]
OVERLAY_COLOR_SPACE_SUPPORT_FLAG :: distinct bit_set[enum {
	PRESENT = 0,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/ne-dxgi1_3-dxgi_overlay_support_flag ]]
OVERLAY_SUPPORT_FLAG :: distinct bit_set[enum {
	DIRECT = 0,
	SCALING = 1,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-present ]]
PRESENT :: distinct bit_set[enum {
	TEST = 0,
	DO_NOT_SEQUENCE = 1,
	RESTART = 2,
	DO_NOT_WAIT = 3,
	STEREO_PREFER_RIGHT = 4,
	STEREO_TEMPORARY_MONO = 5,
	RESTRICT_TO_OUTPUT = 6,
	USE_DURATION = 8,
	ALLOW_TEARING = 9,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_present_parameters ]]
PRESENT_PARAMETERS :: struct {
	DirtyRectsCount: u32,
	pDirtyRects: ^RECT,
	pScrollRect: ^RECT,
	pScrollOffset: ^POINT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_4/ns-dxgi1_4-dxgi_query_video_memory_info ]]
QUERY_VIDEO_MEMORY_INFO :: struct {
	Budget: u64,
	CurrentUsage: u64,
	AvailableForReservation: u64,
	CurrentReservation: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_rational ]]
RATIONAL :: struct {
	Numerator: u32,
	Denominator: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/ne-dxgi1_5-dxgi_reclaim_resource_results ]]
RECLAIM_RESOURCE_RESULTS :: enum i32 {
	OK = 0,
	DISCARDED = 1,
	NOT_COMMITTED = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_residency ]]
RESIDENCY :: enum i32 {
	FULLY_RESIDENT = 1,
	RESIDENT_IN_SHARED_MEMORY = 2,
	EVICTED_TO_DISK = 3,
}

RESOURCE_PRIORITY :: enum u32 {
	MINIMUM = 0x28000000,
	LOW = 0x50000000,
	NORMAL = 0x78000000,
	HIGH = 0xA0000000,
	MAXIMUM = 0xC8000000,
}

RGB :: struct {
	Red: f32,
	Green: f32,
	Blue: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-rgba ]]
RGBA :: struct {
	r: f32,
	g: f32,
	b: f32,
	a: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc ]]
SAMPLE_DESC :: struct {
	Count: u32,
	Quality: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ne-dxgi1_2-dxgi_scaling ]]
SCALING :: enum i32 {
	STRETCH = 0,
	NONE = 1,
	ASPECT_RATIO_STRETCH = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_shared_resource ]]
SHARED_RESOURCE :: struct {
	Handle: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-shared-resource-rw ]]
SHARED_RESOURCE_RW :: distinct bit_set[enum {
	READ = 31,
	WRITE = 0,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_surface_desc ]]
SURFACE_DESC :: struct {
	Width: u32,
	Height: u32,
	Format: FORMAT,
	SampleDesc: SAMPLE_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_4/ne-dxgi1_4-dxgi_swap_chain_color_space_support_flag ]]
SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG :: distinct bit_set[enum {
	PRESENT = 0,
	OVERLAY_PRESENT = 1,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ns-dxgi-dxgi_swap_chain_desc ]]
SWAP_CHAIN_DESC :: struct {
	BufferDesc: MODE_DESC,
	SampleDesc: SAMPLE_DESC,
	BufferUsage: USAGE,
	BufferCount: u32,
	OutputWindow: HWND,
	Windowed: BOOL,
	SwapEffect: SWAP_EFFECT,
	Flags: SWAP_CHAIN_FLAG,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_desc1 ]]
SWAP_CHAIN_DESC1 :: struct {
	Width: u32,
	Height: u32,
	Format: FORMAT,
	Stereo: BOOL,
	SampleDesc: SAMPLE_DESC,
	BufferUsage: USAGE,
	BufferCount: u32,
	Scaling: SCALING,
	SwapEffect: SWAP_EFFECT,
	AlphaMode: ALPHA_MODE,
	Flags: SWAP_CHAIN_FLAG,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_swap_chain_flag ]]
SWAP_CHAIN_FLAG :: distinct bit_set[enum {
	NONPREROTATED = 0,
	ALLOW_MODE_SWITCH = 1,
	GDI_COMPATIBLE = 2,
	RESTRICTED_CONTENT = 3,
	RESTRICT_SHARED_RESOURCE_DRIVER = 4,
	DISPLAY_ONLY = 5,
	FRAME_LATENCY_WAITABLE_OBJECT = 6,
	FOREGROUND_LAYER = 7,
	FULLSCREEN_VIDEO = 8,
	YUV_VIDEO = 9,
	HW_PROTECTED = 10,
	ALLOW_TEARING = 11,
	RESTRICTED_TO_ALL_HOLOGRAPHIC_DISPLAYS = 12,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/ns-dxgi1_2-dxgi_swap_chain_fullscreen_desc ]]
SWAP_CHAIN_FULLSCREEN_DESC :: struct {
	RefreshRate: RATIONAL,
	ScanlineOrdering: MODE_SCANLINE_ORDER,
	Scaling: MODE_SCALING,
	Windowed: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_swap_effect ]]
SWAP_EFFECT :: enum i32 {
	DISCARD = 0,
	SEQUENTIAL = 1,
	FLIP_SEQUENTIAL = 3,
	FLIP_DISCARD = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-usage ]]
USAGE :: distinct bit_set[enum {
	SHADER_INPUT = 4,
	RENDER_TARGET_OUTPUT = 5,
	BACK_BUFFER = 6,
	SHARED = 7,
	READ_ONLY = 8,
	DISCARD_ON_PRESENT = 9,
	UNORDERED_ACCESS = 10,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgiadapter ]]
IAdapter :: struct #raw_union {
	#subtype IObject: IObject,
	using Vtbl: ^IAdapter_Vtbl,
}
IAdapter_Vtbl :: struct {
	using IObject_Vtbl: IObject_Vtbl,
	EnumOutputs: proc "system" (this: ^IAdapter, Output: u32, ppOutput: ^^IOutput) -> HRESULT,
	GetDesc: proc "system" (this: ^IAdapter, pDesc: ^ADAPTER_DESC) -> HRESULT,
	CheckInterfaceSupport: proc "system" (this: ^IAdapter, #by_ptr InterfaceName: GUID, pUMDVersion: ^i64) -> HRESULT,
}
IID_IDXGIAdapter :: GUID{0x2411E7E1, 0x12AC, 0x4CCF, {0xBD, 0x14, 0x97, 0x98, 0xE8, 0x53, 0x4D, 0xC0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgiadapter1 ]]
IAdapter1 :: struct #raw_union {
	#subtype IAdapter: IAdapter,
	using Vtbl: ^IAdapter1_Vtbl,
}
IAdapter1_Vtbl :: struct {
	using IAdapter_Vtbl: IAdapter_Vtbl,
	GetDesc1: proc "system" (this: ^IAdapter1, pDesc: ^ADAPTER_DESC1) -> HRESULT,
}
IID_IDXGIAdapter1 :: GUID{0x29038F61, 0x3839, 0x4626, {0x91, 0xFD, 0x08, 0x68, 0x79, 0x01, 0x1A, 0x05}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgiadapter2 ]]
IAdapter2 :: struct #raw_union {
	#subtype IAdapter1: IAdapter1,
	using Vtbl: ^IAdapter2_Vtbl,
}
IAdapter2_Vtbl :: struct {
	using IAdapter1_Vtbl: IAdapter1_Vtbl,
	GetDesc2: proc "system" (this: ^IAdapter2, pDesc: ^ADAPTER_DESC2) -> HRESULT,
}
IID_IDXGIAdapter2 :: GUID{0x0AA1AE0A, 0xFA0E, 0x4B84, {0x86, 0x44, 0xE0, 0x5F, 0xF8, 0xE5, 0xAC, 0xB5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_4/nn-dxgi1_4-idxgiadapter3 ]]
IAdapter3 :: struct #raw_union {
	#subtype IAdapter2: IAdapter2,
	using Vtbl: ^IAdapter3_Vtbl,
}
IAdapter3_Vtbl :: struct {
	using IAdapter2_Vtbl: IAdapter2_Vtbl,
	RegisterHardwareContentProtectionTeardownStatusEvent: proc "system" (this: ^IAdapter3, hEvent: HANDLE, pdwCookie: ^u32) -> HRESULT,
	UnregisterHardwareContentProtectionTeardownStatus: proc "system" (this: ^IAdapter3, dwCookie: u32),
	QueryVideoMemoryInfo: proc "system" (
		this: ^IAdapter3,
		NodeIndex: u32,
		MemorySegmentGroup: MEMORY_SEGMENT_GROUP,
		pVideoMemoryInfo: ^QUERY_VIDEO_MEMORY_INFO,
	) -> HRESULT,
	SetVideoMemoryReservation: proc "system" (
		this: ^IAdapter3,
		NodeIndex: u32,
		MemorySegmentGroup: MEMORY_SEGMENT_GROUP,
		Reservation: u64,
	) -> HRESULT,
	RegisterVideoMemoryBudgetChangeNotificationEvent: proc "system" (this: ^IAdapter3, hEvent: HANDLE, pdwCookie: ^u32) -> HRESULT,
	UnregisterVideoMemoryBudgetChangeNotification: proc "system" (this: ^IAdapter3, dwCookie: u32),
}
IID_IDXGIAdapter3 :: GUID{0x645967A4, 0x1392, 0x4310, {0xA7, 0x98, 0x80, 0x53, 0xCE, 0x3E, 0x93, 0xFD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/nn-dxgi1_6-idxgiadapter4 ]]
IAdapter4 :: struct #raw_union {
	#subtype IAdapter3: IAdapter3,
	using Vtbl: ^IAdapter4_Vtbl,
}
IAdapter4_Vtbl :: struct {
	using IAdapter3_Vtbl: IAdapter3_Vtbl,
	GetDesc3: proc "system" (this: ^IAdapter4, pDesc: ^ADAPTER_DESC3) -> HRESULT,
}
IID_IDXGIAdapter4 :: GUID{0x3C8D99D1, 0x4FBF, 0x4181, {0xA8, 0x2C, 0xAF, 0x66, 0xBF, 0x7B, 0xD2, 0x4E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/nn-dxgidebug-idxgidebug ]]
IDebug :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebug_Vtbl,
}
IDebug_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ReportLiveObjects: proc "system" (this: ^IDebug, apiid: GUID, flags: DEBUG_RLO_FLAGS) -> HRESULT,
}
IID_IDXGIDebug :: GUID{0x119E7452, 0xDE9E, 0x40FE, {0x88, 0x06, 0x88, 0xF9, 0x0C, 0x12, 0xB4, 0x41}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/nn-dxgidebug-idxgidebug1 ]]
IDebug1 :: struct #raw_union {
	#subtype IDebug: IDebug,
	using Vtbl: ^IDebug1_Vtbl,
}
IDebug1_Vtbl :: struct {
	using IDebug_Vtbl: IDebug_Vtbl,
	EnableLeakTrackingForThread: proc "system" (this: ^IDebug1),
	DisableLeakTrackingForThread: proc "system" (this: ^IDebug1),
	IsLeakTrackingEnabledForThread: proc "system" (this: ^IDebug1) -> BOOL,
}
IID_IDXGIDebug1 :: GUID{0xC5A05F0C, 0x16F2, 0x4ADF, {0x9F, 0x4D, 0xA8, 0xC4, 0xD5, 0x8A, 0xC5, 0x50}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgidecodeswapchain ]]
IDecodeSwapChain :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDecodeSwapChain_Vtbl,
}
IDecodeSwapChain_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	PresentBuffer: proc "system" (
		this: ^IDecodeSwapChain,
		BufferToPresent: u32,
		SyncInterval: u32,
		Flags: PRESENT,
	) -> HRESULT,
	SetSourceRect: proc "system" (this: ^IDecodeSwapChain, #by_ptr pRect: RECT) -> HRESULT,
	SetTargetRect: proc "system" (this: ^IDecodeSwapChain, #by_ptr pRect: RECT) -> HRESULT,
	SetDestSize: proc "system" (this: ^IDecodeSwapChain, Width: u32, Height: u32) -> HRESULT,
	GetSourceRect: proc "system" (this: ^IDecodeSwapChain, pRect: ^RECT) -> HRESULT,
	GetTargetRect: proc "system" (this: ^IDecodeSwapChain, pRect: ^RECT) -> HRESULT,
	GetDestSize: proc "system" (this: ^IDecodeSwapChain, pWidth: ^u32, pHeight: ^u32) -> HRESULT,
	SetColorSpace: proc "system" (this: ^IDecodeSwapChain, ColorSpace: MULTIPLANE_OVERLAY_YCbCr_FLAGS) -> HRESULT,
	GetColorSpace: proc "system" (this: ^IDecodeSwapChain) -> MULTIPLANE_OVERLAY_YCbCr_FLAGS,
}
IID_IDXGIDecodeSwapChain :: GUID{0x2633066B, 0x4514, 0x4C7A, {0x8F, 0xD8, 0x12, 0xEA, 0x98, 0x05, 0x9D, 0x18}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgidevice ]]
IDevice :: struct #raw_union {
	#subtype IObject: IObject,
	using Vtbl: ^IDevice_Vtbl,
}
IDevice_Vtbl :: struct {
	using IObject_Vtbl: IObject_Vtbl,
	GetAdapter: proc "system" (this: ^IDevice, pAdapter: ^^IAdapter) -> HRESULT,
	CreateSurface: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: SURFACE_DESC,
		NumSurfaces: u32,
		Usage: USAGE,
		pSharedResource: ^SHARED_RESOURCE,
		ppSurface: [^]^ISurface,
	) -> HRESULT,
	QueryResourceResidency: proc "system" (
		this: ^IDevice,
		ppResources: [^]^IUnknown,
		pResidencyStatus: [^]RESIDENCY,
		NumResources: u32,
	) -> HRESULT,
	SetGPUThreadPriority: proc "system" (this: ^IDevice, Priority: i32) -> HRESULT,
	GetGPUThreadPriority: proc "system" (this: ^IDevice, pPriority: ^i32) -> HRESULT,
}
IID_IDXGIDevice :: GUID{0x54EC77FA, 0x1377, 0x44E6, {0x8C, 0x32, 0x88, 0xFD, 0x5F, 0x44, 0xC8, 0x4C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgidevice1 ]]
IDevice1 :: struct #raw_union {
	#subtype IDevice: IDevice,
	using Vtbl: ^IDevice1_Vtbl,
}
IDevice1_Vtbl :: struct {
	using IDevice_Vtbl: IDevice_Vtbl,
	SetMaximumFrameLatency: proc "system" (this: ^IDevice1, MaxLatency: u32) -> HRESULT,
	GetMaximumFrameLatency: proc "system" (this: ^IDevice1, pMaxLatency: ^u32) -> HRESULT,
}
IID_IDXGIDevice1 :: GUID{0x77DB970F, 0x6276, 0x48BA, {0xBA, 0x28, 0x07, 0x01, 0x43, 0xB4, 0x39, 0x2C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgidevice2 ]]
IDevice2 :: struct #raw_union {
	#subtype IDevice1: IDevice1,
	using Vtbl: ^IDevice2_Vtbl,
}
IDevice2_Vtbl :: struct {
	using IDevice1_Vtbl: IDevice1_Vtbl,
	OfferResources: proc "system" (
		this: ^IDevice2,
		NumResources: u32,
		ppResources: [^]^IResource,
		Priority: OFFER_RESOURCE_PRIORITY,
	) -> HRESULT,
	ReclaimResources: proc "system" (
		this: ^IDevice2,
		NumResources: u32,
		ppResources: [^]^IResource,
		pDiscarded: [^]BOOL,
	) -> HRESULT,
	EnqueueSetEvent: proc "system" (this: ^IDevice2, hEvent: HANDLE) -> HRESULT,
}
IID_IDXGIDevice2 :: GUID{0x05008617, 0xFBFD, 0x4051, {0xA7, 0x90, 0x14, 0x48, 0x84, 0xB4, 0xF6, 0xA9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgidevice3 ]]
IDevice3 :: struct #raw_union {
	#subtype IDevice2: IDevice2,
	using Vtbl: ^IDevice3_Vtbl,
}
IDevice3_Vtbl :: struct {
	using IDevice2_Vtbl: IDevice2_Vtbl,
	Trim: proc "system" (this: ^IDevice3),
}
IID_IDXGIDevice3 :: GUID{0x6007896C, 0x3244, 0x4AFD, {0xBF, 0x18, 0xA6, 0xD3, 0xBE, 0xDA, 0x50, 0x23}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/nn-dxgi1_5-idxgidevice4 ]]
IDevice4 :: struct #raw_union {
	#subtype IDevice3: IDevice3,
	using Vtbl: ^IDevice4_Vtbl,
}
IDevice4_Vtbl :: struct {
	using IDevice3_Vtbl: IDevice3_Vtbl,
	OfferResources1: proc "system" (
		this: ^IDevice4,
		NumResources: u32,
		ppResources: [^]^IResource,
		Priority: OFFER_RESOURCE_PRIORITY,
		Flags: OFFER_RESOURCE_FLAGS,
	) -> HRESULT,
	ReclaimResources1: proc "system" (
		this: ^IDevice4,
		NumResources: u32,
		ppResources: [^]^IResource,
		pResults: [^]RECLAIM_RESOURCE_RESULTS,
	) -> HRESULT,
}
IID_IDXGIDevice4 :: GUID{0x95B4F95F, 0xD8DA, 0x4CA4, {0x9E, 0xE6, 0x3B, 0x76, 0xD5, 0x96, 0x8A, 0x10}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgidevicesubobject ]]
IDeviceSubObject :: struct #raw_union {
	#subtype IObject: IObject,
	using Vtbl: ^IDeviceSubObject_Vtbl,
}
IDeviceSubObject_Vtbl :: struct {
	using IObject_Vtbl: IObject_Vtbl,
	GetDevice: proc "system" (this: ^IDeviceSubObject, #by_ptr riid: GUID, ppDevice: rawptr) -> HRESULT,
}
IID_IDXGIDeviceSubObject :: GUID{0x3D3E0379, 0xF9DE, 0x4D58, {0xBB, 0x6C, 0x18, 0xD6, 0x29, 0x92, 0xF1, 0xA6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgidisplaycontrol ]]
IDisplayControl :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDisplayControl_Vtbl,
}
IDisplayControl_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	IsStereoEnabled: proc "system" (this: ^IDisplayControl) -> BOOL,
	SetStereoEnabled: proc "system" (this: ^IDisplayControl, enabled: BOOL),
}
IID_IDXGIDisplayControl :: GUID{0xEA9DBF1A, 0xC88E, 0x4486, {0x85, 0x4A, 0x98, 0xAA, 0x01, 0x38, 0xF3, 0x0C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgifactory ]]
IFactory :: struct #raw_union {
	#subtype IObject: IObject,
	using Vtbl: ^IFactory_Vtbl,
}
IFactory_Vtbl :: struct {
	using IObject_Vtbl: IObject_Vtbl,
	EnumAdapters: proc "system" (this: ^IFactory, Adapter: u32, ppAdapter: ^^IAdapter) -> HRESULT,
	MakeWindowAssociation: proc "system" (this: ^IFactory, WindowHandle: HWND, Flags: MWA_FLAGS) -> HRESULT,
	GetWindowAssociation: proc "system" (this: ^IFactory, pWindowHandle: ^HWND) -> HRESULT,
	CreateSwapChain: proc "system" (
		this: ^IFactory,
		pDevice: ^IUnknown,
		pDesc: ^SWAP_CHAIN_DESC,
		ppSwapChain: ^^ISwapChain,
	) -> HRESULT,
	CreateSoftwareAdapter: proc "system" (this: ^IFactory, Module: HMODULE, ppAdapter: ^^IAdapter) -> HRESULT,
}
IID_IDXGIFactory :: GUID{0x7B7166EC, 0x21C7, 0x44AE, {0xB2, 0x1A, 0xC9, 0xAE, 0x32, 0x1A, 0xE3, 0x69}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgifactory1 ]]
IFactory1 :: struct #raw_union {
	#subtype IFactory: IFactory,
	using Vtbl: ^IFactory1_Vtbl,
}
IFactory1_Vtbl :: struct {
	using IFactory_Vtbl: IFactory_Vtbl,
	EnumAdapters1: proc "system" (this: ^IFactory1, Adapter: u32, ppAdapter: ^^IAdapter1) -> HRESULT,
	IsCurrent: proc "system" (this: ^IFactory1) -> BOOL,
}
IID_IDXGIFactory1 :: GUID{0x770AAE78, 0xF26F, 0x4DBA, {0xA8, 0x29, 0x25, 0x3C, 0x83, 0xD1, 0xB3, 0x87}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgifactory2 ]]
IFactory2 :: struct #raw_union {
	#subtype IFactory1: IFactory1,
	using Vtbl: ^IFactory2_Vtbl,
}
IFactory2_Vtbl :: struct {
	using IFactory1_Vtbl: IFactory1_Vtbl,
	IsWindowedStereoEnabled: proc "system" (this: ^IFactory2) -> BOOL,
	CreateSwapChainForHwnd: proc "system" (
		this: ^IFactory2,
		pDevice: ^IUnknown,
		hWnd: HWND,
		#by_ptr pDesc: SWAP_CHAIN_DESC1,
		pFullscreenDesc: ^SWAP_CHAIN_FULLSCREEN_DESC,
		pRestrictToOutput: ^IOutput,
		ppSwapChain: ^^ISwapChain1,
	) -> HRESULT,
	CreateSwapChainForCoreWindow: proc "system" (
		this: ^IFactory2,
		pDevice: ^IUnknown,
		pWindow: ^IUnknown,
		#by_ptr pDesc: SWAP_CHAIN_DESC1,
		pRestrictToOutput: ^IOutput,
		ppSwapChain: ^^ISwapChain1,
	) -> HRESULT,
	GetSharedResourceAdapterLuid: proc "system" (this: ^IFactory2, hResource: HANDLE, pLuid: ^LUID) -> HRESULT,
	RegisterStereoStatusWindow: proc "system" (this: ^IFactory2, WindowHandle: HWND, wMsg: u32, pdwCookie: ^u32) -> HRESULT,
	RegisterStereoStatusEvent: proc "system" (this: ^IFactory2, hEvent: HANDLE, pdwCookie: ^u32) -> HRESULT,
	UnregisterStereoStatus: proc "system" (this: ^IFactory2, dwCookie: u32),
	RegisterOcclusionStatusWindow: proc "system" (this: ^IFactory2, WindowHandle: HWND, wMsg: u32, pdwCookie: ^u32) -> HRESULT,
	RegisterOcclusionStatusEvent: proc "system" (this: ^IFactory2, hEvent: HANDLE, pdwCookie: ^u32) -> HRESULT,
	UnregisterOcclusionStatus: proc "system" (this: ^IFactory2, dwCookie: u32),
	CreateSwapChainForComposition: proc "system" (
		this: ^IFactory2,
		pDevice: ^IUnknown,
		#by_ptr pDesc: SWAP_CHAIN_DESC1,
		pRestrictToOutput: ^IOutput,
		ppSwapChain: ^^ISwapChain1,
	) -> HRESULT,
}
IID_IDXGIFactory2 :: GUID{0x50C83A1C, 0xE072, 0x4C48, {0x87, 0xB0, 0x36, 0x30, 0xFA, 0x36, 0xA6, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgifactory3 ]]
IFactory3 :: struct #raw_union {
	#subtype IFactory2: IFactory2,
	using Vtbl: ^IFactory3_Vtbl,
}
IFactory3_Vtbl :: struct {
	using IFactory2_Vtbl: IFactory2_Vtbl,
	GetCreationFlags: proc "system" (this: ^IFactory3) -> CREATE_FACTORY_FLAGS,
}
IID_IDXGIFactory3 :: GUID{0x25483823, 0xCD46, 0x4C7D, {0x86, 0xCA, 0x47, 0xAA, 0x95, 0xB8, 0x37, 0xBD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_4/nn-dxgi1_4-idxgifactory4 ]]
IFactory4 :: struct #raw_union {
	#subtype IFactory3: IFactory3,
	using Vtbl: ^IFactory4_Vtbl,
}
IFactory4_Vtbl :: struct {
	using IFactory3_Vtbl: IFactory3_Vtbl,
	EnumAdapterByLuid: proc "system" (this: ^IFactory4, AdapterLuid: LUID, #by_ptr riid: GUID, ppvAdapter: rawptr) -> HRESULT,
	EnumWarpAdapter: proc "system" (this: ^IFactory4, #by_ptr riid: GUID, ppvAdapter: rawptr) -> HRESULT,
}
IID_IDXGIFactory4 :: GUID{0x1BC6EA02, 0xEF36, 0x464F, {0xBF, 0x0C, 0x21, 0xCA, 0x39, 0xE5, 0x16, 0x8A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/nn-dxgi1_5-idxgifactory5 ]]
IFactory5 :: struct #raw_union {
	#subtype IFactory4: IFactory4,
	using Vtbl: ^IFactory5_Vtbl,
}
IFactory5_Vtbl :: struct {
	using IFactory4_Vtbl: IFactory4_Vtbl,
	CheckFeatureSupport: proc "system" (
		this: ^IFactory5,
		Feature: FEATURE,
		pFeatureSupportData: rawptr,
		FeatureSupportDataSize: u32,
	) -> HRESULT,
}
IID_IDXGIFactory5 :: GUID{0x7632E1F5, 0xEE65, 0x4DCA, {0x87, 0xFD, 0x84, 0xCD, 0x75, 0xF8, 0x83, 0x8D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/nn-dxgi1_6-idxgifactory6 ]]
IFactory6 :: struct #raw_union {
	#subtype IFactory5: IFactory5,
	using Vtbl: ^IFactory6_Vtbl,
}
IFactory6_Vtbl :: struct {
	using IFactory5_Vtbl: IFactory5_Vtbl,
	EnumAdapterByGpuPreference: proc "system" (
		this: ^IFactory6,
		Adapter: u32,
		GpuPreference: GPU_PREFERENCE,
		#by_ptr riid: GUID,
		ppvAdapter: rawptr,
	) -> HRESULT,
}
IID_IDXGIFactory6 :: GUID{0xC1B6694F, 0xFF09, 0x44A9, {0xB0, 0x3C, 0x77, 0x90, 0x0A, 0x0A, 0x1D, 0x17}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/nn-dxgi1_6-idxgifactory7 ]]
IFactory7 :: struct #raw_union {
	#subtype IFactory6: IFactory6,
	using Vtbl: ^IFactory7_Vtbl,
}
IFactory7_Vtbl :: struct {
	using IFactory6_Vtbl: IFactory6_Vtbl,
	RegisterAdaptersChangedEvent: proc "system" (this: ^IFactory7, hEvent: HANDLE, pdwCookie: ^u32) -> HRESULT,
	UnregisterAdaptersChangedEvent: proc "system" (this: ^IFactory7, dwCookie: u32) -> HRESULT,
}
IID_IDXGIFactory7 :: GUID{0xA4966EED, 0x76DB, 0x44DA, {0x84, 0xC1, 0xEE, 0x9A, 0x7A, 0xFB, 0x20, 0xA8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgifactorymedia ]]
IFactoryMedia :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFactoryMedia_Vtbl,
}
IFactoryMedia_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateSwapChainForCompositionSurfaceHandle: proc "system" (
		this: ^IFactoryMedia,
		pDevice: ^IUnknown,
		hSurface: HANDLE,
		#by_ptr pDesc: SWAP_CHAIN_DESC1,
		pRestrictToOutput: ^IOutput,
		ppSwapChain: ^^ISwapChain1,
	) -> HRESULT,
	CreateDecodeSwapChainForCompositionSurfaceHandle: proc "system" (
		this: ^IFactoryMedia,
		pDevice: ^IUnknown,
		hSurface: HANDLE,
		pDesc: ^DECODE_SWAP_CHAIN_DESC,
		pYuvDecodeBuffers: ^IResource,
		pRestrictToOutput: ^IOutput,
		ppSwapChain: ^^IDecodeSwapChain,
	) -> HRESULT,
}
IID_IDXGIFactoryMedia :: GUID{0x41E7D1F2, 0xA591, 0x4F7B, {0xA2, 0xE5, 0xFA, 0x9C, 0x84, 0x3E, 0x1C, 0x12}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgidebug/nn-dxgidebug-idxgiinfoqueue ]]
IInfoQueue :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInfoQueue_Vtbl,
}
IInfoQueue_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetMessageCountLimit: proc "system" (this: ^IInfoQueue, Producer: GUID, MessageCountLimit: u64) -> HRESULT,
	ClearStoredMessages: proc "system" (this: ^IInfoQueue, Producer: GUID),
	GetMessage: proc "system" (
		this: ^IInfoQueue,
		Producer: GUID,
		MessageIndex: u64,
		pMessage: ^INFO_QUEUE_MESSAGE,
		pMessageByteLength: ^uintptr,
	) -> HRESULT,
	GetNumStoredMessagesAllowedByRetrievalFilters: proc "system" (this: ^IInfoQueue, Producer: GUID) -> u64,
	GetNumStoredMessages: proc "system" (this: ^IInfoQueue, Producer: GUID) -> u64,
	GetNumMessagesDiscardedByMessageCountLimit: proc "system" (this: ^IInfoQueue, Producer: GUID) -> u64,
	GetMessageCountLimit: proc "system" (this: ^IInfoQueue, Producer: GUID) -> u64,
	GetNumMessagesAllowedByStorageFilter: proc "system" (this: ^IInfoQueue, Producer: GUID) -> u64,
	GetNumMessagesDeniedByStorageFilter: proc "system" (this: ^IInfoQueue, Producer: GUID) -> u64,
	AddStorageFilterEntries: proc "system" (this: ^IInfoQueue, Producer: GUID, pFilter: ^INFO_QUEUE_FILTER) -> HRESULT,
	GetStorageFilter: proc "system" (
		this: ^IInfoQueue,
		Producer: GUID,
		pFilter: ^INFO_QUEUE_FILTER,
		pFilterByteLength: ^uintptr,
	) -> HRESULT,
	ClearStorageFilter: proc "system" (this: ^IInfoQueue, Producer: GUID),
	PushEmptyStorageFilter: proc "system" (this: ^IInfoQueue, Producer: GUID) -> HRESULT,
	PushDenyAllStorageFilter: proc "system" (this: ^IInfoQueue, Producer: GUID) -> HRESULT,
	PushCopyOfStorageFilter: proc "system" (this: ^IInfoQueue, Producer: GUID) -> HRESULT,
	PushStorageFilter: proc "system" (this: ^IInfoQueue, Producer: GUID, pFilter: ^INFO_QUEUE_FILTER) -> HRESULT,
	PopStorageFilter: proc "system" (this: ^IInfoQueue, Producer: GUID),
	GetStorageFilterStackSize: proc "system" (this: ^IInfoQueue, Producer: GUID) -> u32,
	AddRetrievalFilterEntries: proc "system" (this: ^IInfoQueue, Producer: GUID, pFilter: ^INFO_QUEUE_FILTER) -> HRESULT,
	GetRetrievalFilter: proc "system" (
		this: ^IInfoQueue,
		Producer: GUID,
		pFilter: ^INFO_QUEUE_FILTER,
		pFilterByteLength: ^uintptr,
	) -> HRESULT,
	ClearRetrievalFilter: proc "system" (this: ^IInfoQueue, Producer: GUID),
	PushEmptyRetrievalFilter: proc "system" (this: ^IInfoQueue, Producer: GUID) -> HRESULT,
	PushDenyAllRetrievalFilter: proc "system" (this: ^IInfoQueue, Producer: GUID) -> HRESULT,
	PushCopyOfRetrievalFilter: proc "system" (this: ^IInfoQueue, Producer: GUID) -> HRESULT,
	PushRetrievalFilter: proc "system" (this: ^IInfoQueue, Producer: GUID, pFilter: ^INFO_QUEUE_FILTER) -> HRESULT,
	PopRetrievalFilter: proc "system" (this: ^IInfoQueue, Producer: GUID),
	GetRetrievalFilterStackSize: proc "system" (this: ^IInfoQueue, Producer: GUID) -> u32,
	AddMessage: proc "system" (
		this: ^IInfoQueue,
		Producer: GUID,
		Category: INFO_QUEUE_MESSAGE_CATEGORY,
		Severity: INFO_QUEUE_MESSAGE_SEVERITY,
		ID: i32,
		pDescription: PSTR,
	) -> HRESULT,
	AddApplicationMessage: proc "system" (
		this: ^IInfoQueue,
		Severity: INFO_QUEUE_MESSAGE_SEVERITY,
		pDescription: PSTR,
	) -> HRESULT,
	SetBreakOnCategory: proc "system" (
		this: ^IInfoQueue,
		Producer: GUID,
		Category: INFO_QUEUE_MESSAGE_CATEGORY,
		bEnable: BOOL,
	) -> HRESULT,
	SetBreakOnSeverity: proc "system" (
		this: ^IInfoQueue,
		Producer: GUID,
		Severity: INFO_QUEUE_MESSAGE_SEVERITY,
		bEnable: BOOL,
	) -> HRESULT,
	SetBreakOnID: proc "system" (this: ^IInfoQueue, Producer: GUID, ID: i32, bEnable: BOOL) -> HRESULT,
	GetBreakOnCategory: proc "system" (this: ^IInfoQueue, Producer: GUID, Category: INFO_QUEUE_MESSAGE_CATEGORY) -> BOOL,
	GetBreakOnSeverity: proc "system" (this: ^IInfoQueue, Producer: GUID, Severity: INFO_QUEUE_MESSAGE_SEVERITY) -> BOOL,
	GetBreakOnID: proc "system" (this: ^IInfoQueue, Producer: GUID, ID: i32) -> BOOL,
	SetMuteDebugOutput: proc "system" (this: ^IInfoQueue, Producer: GUID, bMute: BOOL),
	GetMuteDebugOutput: proc "system" (this: ^IInfoQueue, Producer: GUID) -> BOOL,
}
IID_IDXGIInfoQueue :: GUID{0xD67441C7, 0x672A, 0x476F, {0x9E, 0x82, 0xCD, 0x55, 0xB4, 0x49, 0x49, 0xCE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgikeyedmutex ]]
IKeyedMutex :: struct #raw_union {
	#subtype IDeviceSubObject: IDeviceSubObject,
	using Vtbl: ^IKeyedMutex_Vtbl,
}
IKeyedMutex_Vtbl :: struct {
	using IDeviceSubObject_Vtbl: IDeviceSubObject_Vtbl,
	AcquireSync: proc "system" (this: ^IKeyedMutex, Key: u64, dwMilliseconds: u32) -> HRESULT,
	ReleaseSync: proc "system" (this: ^IKeyedMutex, Key: u64) -> HRESULT,
}
IID_IDXGIKeyedMutex :: GUID{0x9D8E1289, 0xD7B3, 0x465F, {0x81, 0x26, 0x25, 0x0E, 0x34, 0x9A, 0xF8, 0x5D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgiobject ]]
IObject :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObject_Vtbl,
}
IObject_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetPrivateData: proc "system" (this: ^IObject, #by_ptr Name: GUID, DataSize: u32, pData: rawptr) -> HRESULT,
	SetPrivateDataInterface: proc "system" (this: ^IObject, #by_ptr Name: GUID, pUnknown: ^IUnknown) -> HRESULT,
	GetPrivateData: proc "system" (this: ^IObject, #by_ptr Name: GUID, pDataSize: ^u32, pData: rawptr) -> HRESULT,
	GetParent: proc "system" (this: ^IObject, #by_ptr riid: GUID, ppParent: rawptr) -> HRESULT,
}
IID_IDXGIObject :: GUID{0xAEC22FB8, 0x76F3, 0x4639, {0x9B, 0xE0, 0x28, 0xEB, 0x43, 0xA6, 0x7A, 0x2E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgioutput ]]
IOutput :: struct #raw_union {
	#subtype IObject: IObject,
	using Vtbl: ^IOutput_Vtbl,
}
IOutput_Vtbl :: struct {
	using IObject_Vtbl: IObject_Vtbl,
	GetDesc: proc "system" (this: ^IOutput, pDesc: ^OUTPUT_DESC) -> HRESULT,
	GetDisplayModeList: proc "system" (
		this: ^IOutput,
		EnumFormat: FORMAT,
		Flags: ENUM_MODES,
		pNumModes: ^u32,
		pDesc: [^]MODE_DESC,
	) -> HRESULT,
	FindClosestMatchingMode: proc "system" (
		this: ^IOutput,
		#by_ptr pModeToMatch: MODE_DESC,
		pClosestMatch: ^MODE_DESC,
		pConcernedDevice: ^IUnknown,
	) -> HRESULT,
	WaitForVBlank: proc "system" (this: ^IOutput) -> HRESULT,
	TakeOwnership: proc "system" (this: ^IOutput, pDevice: ^IUnknown, Exclusive: BOOL) -> HRESULT,
	ReleaseOwnership: proc "system" (this: ^IOutput),
	GetGammaControlCapabilities: proc "system" (this: ^IOutput, pGammaCaps: ^GAMMA_CONTROL_CAPABILITIES) -> HRESULT,
	SetGammaControl: proc "system" (this: ^IOutput, #by_ptr pArray: GAMMA_CONTROL) -> HRESULT,
	GetGammaControl: proc "system" (this: ^IOutput, pArray: ^GAMMA_CONTROL) -> HRESULT,
	SetDisplaySurface: proc "system" (this: ^IOutput, pScanoutSurface: ^ISurface) -> HRESULT,
	GetDisplaySurfaceData: proc "system" (this: ^IOutput, pDestination: ^ISurface) -> HRESULT,
	GetFrameStatistics: proc "system" (this: ^IOutput, pStats: ^FRAME_STATISTICS) -> HRESULT,
}
IID_IDXGIOutput :: GUID{0xAE02EEDB, 0xC735, 0x4690, {0x8D, 0x52, 0x5A, 0x8D, 0xC2, 0x02, 0x13, 0xAA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgioutput1 ]]
IOutput1 :: struct #raw_union {
	#subtype IOutput: IOutput,
	using Vtbl: ^IOutput1_Vtbl,
}
IOutput1_Vtbl :: struct {
	using IOutput_Vtbl: IOutput_Vtbl,
	GetDisplayModeList1: proc "system" (
		this: ^IOutput1,
		EnumFormat: FORMAT,
		Flags: ENUM_MODES,
		pNumModes: ^u32,
		pDesc: [^]MODE_DESC1,
	) -> HRESULT,
	FindClosestMatchingMode1: proc "system" (
		this: ^IOutput1,
		#by_ptr pModeToMatch: MODE_DESC1,
		pClosestMatch: ^MODE_DESC1,
		pConcernedDevice: ^IUnknown,
	) -> HRESULT,
	GetDisplaySurfaceData1: proc "system" (this: ^IOutput1, pDestination: ^IResource) -> HRESULT,
	DuplicateOutput: proc "system" (
		this: ^IOutput1,
		pDevice: ^IUnknown,
		ppOutputDuplication: ^^IOutputDuplication,
	) -> HRESULT,
}
IID_IDXGIOutput1 :: GUID{0x00CDDEA8, 0x939B, 0x4B83, {0xA3, 0x40, 0xA6, 0x85, 0x22, 0x66, 0x66, 0xCC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgioutput2 ]]
IOutput2 :: struct #raw_union {
	#subtype IOutput1: IOutput1,
	using Vtbl: ^IOutput2_Vtbl,
}
IOutput2_Vtbl :: struct {
	using IOutput1_Vtbl: IOutput1_Vtbl,
	SupportsOverlays: proc "system" (this: ^IOutput2) -> BOOL,
}
IID_IDXGIOutput2 :: GUID{0x595E39D1, 0x2724, 0x4663, {0x99, 0xB1, 0xDA, 0x96, 0x9D, 0xE2, 0x83, 0x64}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgioutput3 ]]
IOutput3 :: struct #raw_union {
	#subtype IOutput2: IOutput2,
	using Vtbl: ^IOutput3_Vtbl,
}
IOutput3_Vtbl :: struct {
	using IOutput2_Vtbl: IOutput2_Vtbl,
	CheckOverlaySupport: proc "system" (
		this: ^IOutput3,
		EnumFormat: FORMAT,
		pConcernedDevice: ^IUnknown,
		pFlags: OVERLAY_SUPPORT_FLAG,
	) -> HRESULT,
}
IID_IDXGIOutput3 :: GUID{0x8A6BB301, 0x7E7E, 0x41F4, {0xA8, 0xE0, 0x5B, 0x32, 0xF7, 0xF9, 0x9B, 0x18}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_4/nn-dxgi1_4-idxgioutput4 ]]
IOutput4 :: struct #raw_union {
	#subtype IOutput3: IOutput3,
	using Vtbl: ^IOutput4_Vtbl,
}
IOutput4_Vtbl :: struct {
	using IOutput3_Vtbl: IOutput3_Vtbl,
	CheckOverlayColorSpaceSupport: proc "system" (
		this: ^IOutput4,
		Format: FORMAT,
		ColorSpace: COLOR_SPACE_TYPE,
		pConcernedDevice: ^IUnknown,
		pFlags: OVERLAY_COLOR_SPACE_SUPPORT_FLAG,
	) -> HRESULT,
}
IID_IDXGIOutput4 :: GUID{0xDC7DCA35, 0x2196, 0x414D, {0x9F, 0x53, 0x61, 0x78, 0x84, 0x03, 0x2A, 0x60}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/nn-dxgi1_5-idxgioutput5 ]]
IOutput5 :: struct #raw_union {
	#subtype IOutput4: IOutput4,
	using Vtbl: ^IOutput5_Vtbl,
}
IOutput5_Vtbl :: struct {
	using IOutput4_Vtbl: IOutput4_Vtbl,
	DuplicateOutput1: proc "system" (
		this: ^IOutput5,
		pDevice: ^IUnknown,
		Flags: u32,
		SupportedFormatsCount: u32,
		pSupportedFormats: [^]FORMAT,
		ppOutputDuplication: ^^IOutputDuplication,
	) -> HRESULT,
}
IID_IDXGIOutput5 :: GUID{0x80A07424, 0xAB52, 0x42EB, {0x83, 0x3C, 0x0C, 0x42, 0xFD, 0x28, 0x2D, 0x98}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_6/nn-dxgi1_6-idxgioutput6 ]]
IOutput6 :: struct #raw_union {
	#subtype IOutput5: IOutput5,
	using Vtbl: ^IOutput6_Vtbl,
}
IOutput6_Vtbl :: struct {
	using IOutput5_Vtbl: IOutput5_Vtbl,
	GetDesc1: proc "system" (this: ^IOutput6, pDesc: ^OUTPUT_DESC1) -> HRESULT,
	CheckHardwareCompositionSupport: proc "system" (this: ^IOutput6, pFlags: HARDWARE_COMPOSITION_SUPPORT_FLAGS) -> HRESULT,
}
IID_IDXGIOutput6 :: GUID{0x068346E8, 0xAAEC, 0x4B84, {0xAD, 0xD7, 0x13, 0x7F, 0x51, 0x3F, 0x77, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication ]]
IOutputDuplication :: struct #raw_union {
	#subtype IObject: IObject,
	using Vtbl: ^IOutputDuplication_Vtbl,
}
IOutputDuplication_Vtbl :: struct {
	using IObject_Vtbl: IObject_Vtbl,
	GetDesc: proc "system" (this: ^IOutputDuplication, pDesc: ^OUTDUPL_DESC),
	AcquireNextFrame: proc "system" (
		this: ^IOutputDuplication,
		TimeoutInMilliseconds: u32,
		pFrameInfo: ^OUTDUPL_FRAME_INFO,
		ppDesktopResource: ^^IResource,
	) -> HRESULT,
	GetFrameDirtyRects: proc "system" (
		this: ^IOutputDuplication,
		DirtyRectsBufferSize: u32,
		pDirtyRectsBuffer: ^RECT,
		pDirtyRectsBufferSizeRequired: ^u32,
	) -> HRESULT,
	GetFrameMoveRects: proc "system" (
		this: ^IOutputDuplication,
		MoveRectsBufferSize: u32,
		pMoveRectBuffer: ^OUTDUPL_MOVE_RECT,
		pMoveRectsBufferSizeRequired: ^u32,
	) -> HRESULT,
	GetFramePointerShape: proc "system" (
		this: ^IOutputDuplication,
		PointerShapeBufferSize: u32,
		pPointerShapeBuffer: rawptr,
		pPointerShapeBufferSizeRequired: ^u32,
		pPointerShapeInfo: ^OUTDUPL_POINTER_SHAPE_INFO,
	) -> HRESULT,
	MapDesktopSurface: proc "system" (this: ^IOutputDuplication, pLockedRect: ^MAPPED_RECT) -> HRESULT,
	UnMapDesktopSurface: proc "system" (this: ^IOutputDuplication) -> HRESULT,
	ReleaseFrame: proc "system" (this: ^IOutputDuplication) -> HRESULT,
}
IID_IDXGIOutputDuplication :: GUID{0x191CFAC3, 0xA341, 0x470D, {0xB2, 0x6E, 0xA8, 0x64, 0xF4, 0x28, 0x31, 0x9C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgiresource ]]
IResource :: struct #raw_union {
	#subtype IDeviceSubObject: IDeviceSubObject,
	using Vtbl: ^IResource_Vtbl,
}
IResource_Vtbl :: struct {
	using IDeviceSubObject_Vtbl: IDeviceSubObject_Vtbl,
	GetSharedHandle: proc "system" (this: ^IResource, pSharedHandle: ^HANDLE) -> HRESULT,
	GetUsage: proc "system" (this: ^IResource, pUsage: ^USAGE) -> HRESULT,
	SetEvictionPriority: proc "system" (this: ^IResource, EvictionPriority: RESOURCE_PRIORITY) -> HRESULT,
	GetEvictionPriority: proc "system" (this: ^IResource, pEvictionPriority: ^RESOURCE_PRIORITY) -> HRESULT,
}
IID_IDXGIResource :: GUID{0x035F3AB4, 0x482E, 0x4E50, {0xB4, 0x1F, 0x8A, 0x7F, 0x8B, 0xD8, 0x96, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgiresource1 ]]
IResource1 :: struct #raw_union {
	#subtype IResource: IResource,
	using Vtbl: ^IResource1_Vtbl,
}
IResource1_Vtbl :: struct {
	using IResource_Vtbl: IResource_Vtbl,
	CreateSubresourceSurface: proc "system" (this: ^IResource1, index: u32, ppSurface: ^^ISurface2) -> HRESULT,
	CreateSharedHandle: proc "system" (
		this: ^IResource1,
		pAttributes: ^SECURITY_ATTRIBUTES,
		dwAccess: u32,
		lpName: PWSTR,
		pHandle: ^HANDLE,
	) -> HRESULT,
}
IID_IDXGIResource1 :: GUID{0x30961379, 0x4609, 0x4A41, {0x99, 0x8E, 0x54, 0xFE, 0x56, 0x7E, 0xE0, 0xC1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface ]]
ISurface :: struct #raw_union {
	#subtype IDeviceSubObject: IDeviceSubObject,
	using Vtbl: ^ISurface_Vtbl,
}
ISurface_Vtbl :: struct {
	using IDeviceSubObject_Vtbl: IDeviceSubObject_Vtbl,
	GetDesc: proc "system" (this: ^ISurface, pDesc: ^SURFACE_DESC) -> HRESULT,
	Map: proc "system" (this: ^ISurface, pLockedRect: ^MAPPED_RECT, MapFlags: MAP_FLAGS) -> HRESULT,
	Unmap: proc "system" (this: ^ISurface) -> HRESULT,
}
IID_IDXGISurface :: GUID{0xCAFCB56C, 0x6AC3, 0x4889, {0xBF, 0x47, 0x9E, 0x23, 0xBB, 0xD2, 0x60, 0xEC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgisurface1 ]]
ISurface1 :: struct #raw_union {
	#subtype ISurface: ISurface,
	using Vtbl: ^ISurface1_Vtbl,
}
ISurface1_Vtbl :: struct {
	using ISurface_Vtbl: ISurface_Vtbl,
	GetDC: proc "system" (this: ^ISurface1, Discard: BOOL, phdc: ^HDC) -> HRESULT,
	ReleaseDC: proc "system" (this: ^ISurface1, pDirtyRect: ^RECT) -> HRESULT,
}
IID_IDXGISurface1 :: GUID{0x4AE63092, 0x6327, 0x4C1B, {0x80, 0xAE, 0xBF, 0xE1, 0x2E, 0xA3, 0x2B, 0x86}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgisurface2 ]]
ISurface2 :: struct #raw_union {
	#subtype ISurface1: ISurface1,
	using Vtbl: ^ISurface2_Vtbl,
}
ISurface2_Vtbl :: struct {
	using ISurface1_Vtbl: ISurface1_Vtbl,
	GetResource: proc "system" (
		this: ^ISurface2,
		#by_ptr riid: GUID,
		ppParentResource: rawptr,
		pSubresourceIndex: ^u32,
	) -> HRESULT,
}
IID_IDXGISurface2 :: GUID{0xABA496DD, 0xB617, 0x4CB8, {0xA8, 0x66, 0xBC, 0x44, 0xD7, 0xEB, 0x1F, 0xA2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi/nn-dxgi-idxgiswapchain ]]
ISwapChain :: struct #raw_union {
	#subtype IDeviceSubObject: IDeviceSubObject,
	using Vtbl: ^ISwapChain_Vtbl,
}
ISwapChain_Vtbl :: struct {
	using IDeviceSubObject_Vtbl: IDeviceSubObject_Vtbl,
	Present: proc "system" (this: ^ISwapChain, SyncInterval: u32, Flags: PRESENT) -> HRESULT,
	GetBuffer: proc "system" (this: ^ISwapChain, Buffer: u32, #by_ptr riid: GUID, ppSurface: rawptr) -> HRESULT,
	SetFullscreenState: proc "system" (this: ^ISwapChain, Fullscreen: BOOL, pTarget: ^IOutput) -> HRESULT,
	GetFullscreenState: proc "system" (this: ^ISwapChain, pFullscreen: ^BOOL, ppTarget: ^^IOutput) -> HRESULT,
	GetDesc: proc "system" (this: ^ISwapChain, pDesc: ^SWAP_CHAIN_DESC) -> HRESULT,
	ResizeBuffers: proc "system" (
		this: ^ISwapChain,
		BufferCount: u32,
		Width: u32,
		Height: u32,
		NewFormat: FORMAT,
		SwapChainFlags: SWAP_CHAIN_FLAG,
	) -> HRESULT,
	ResizeTarget: proc "system" (this: ^ISwapChain, #by_ptr pNewTargetParameters: MODE_DESC) -> HRESULT,
	GetContainingOutput: proc "system" (this: ^ISwapChain, ppOutput: ^^IOutput) -> HRESULT,
	GetFrameStatistics: proc "system" (this: ^ISwapChain, pStats: ^FRAME_STATISTICS) -> HRESULT,
	GetLastPresentCount: proc "system" (this: ^ISwapChain, pLastPresentCount: ^u32) -> HRESULT,
}
IID_IDXGISwapChain :: GUID{0x310D36A0, 0xD2E7, 0x4C0A, {0xAA, 0x04, 0x6A, 0x9D, 0x23, 0xB8, 0x88, 0x6A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_2/nn-dxgi1_2-idxgiswapchain1 ]]
ISwapChain1 :: struct #raw_union {
	#subtype ISwapChain: ISwapChain,
	using Vtbl: ^ISwapChain1_Vtbl,
}
ISwapChain1_Vtbl :: struct {
	using ISwapChain_Vtbl: ISwapChain_Vtbl,
	GetDesc1: proc "system" (this: ^ISwapChain1, pDesc: ^SWAP_CHAIN_DESC1) -> HRESULT,
	GetFullscreenDesc: proc "system" (this: ^ISwapChain1, pDesc: ^SWAP_CHAIN_FULLSCREEN_DESC) -> HRESULT,
	GetHwnd: proc "system" (this: ^ISwapChain1, pHwnd: ^HWND) -> HRESULT,
	GetCoreWindow: proc "system" (this: ^ISwapChain1, #by_ptr refiid: GUID, ppUnk: rawptr) -> HRESULT,
	Present1: proc "system" (
		this: ^ISwapChain1,
		SyncInterval: u32,
		PresentFlags: PRESENT,
		#by_ptr pPresentParameters: PRESENT_PARAMETERS,
	) -> HRESULT,
	IsTemporaryMonoSupported: proc "system" (this: ^ISwapChain1) -> BOOL,
	GetRestrictToOutput: proc "system" (this: ^ISwapChain1, ppRestrictToOutput: ^^IOutput) -> HRESULT,
	SetBackgroundColor: proc "system" (this: ^ISwapChain1, #by_ptr pColor: RGBA) -> HRESULT,
	GetBackgroundColor: proc "system" (this: ^ISwapChain1, pColor: ^RGBA) -> HRESULT,
	SetRotation: proc "system" (this: ^ISwapChain1, Rotation: MODE_ROTATION) -> HRESULT,
	GetRotation: proc "system" (this: ^ISwapChain1, pRotation: ^MODE_ROTATION) -> HRESULT,
}
IID_IDXGISwapChain1 :: GUID{0x790A45F7, 0x0D42, 0x4876, {0x98, 0x3A, 0x0A, 0x55, 0xCF, 0xE6, 0xF4, 0xAA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgiswapchain2 ]]
ISwapChain2 :: struct #raw_union {
	#subtype ISwapChain1: ISwapChain1,
	using Vtbl: ^ISwapChain2_Vtbl,
}
ISwapChain2_Vtbl :: struct {
	using ISwapChain1_Vtbl: ISwapChain1_Vtbl,
	SetSourceSize: proc "system" (this: ^ISwapChain2, Width: u32, Height: u32) -> HRESULT,
	GetSourceSize: proc "system" (this: ^ISwapChain2, pWidth: ^u32, pHeight: ^u32) -> HRESULT,
	SetMaximumFrameLatency: proc "system" (this: ^ISwapChain2, MaxLatency: u32) -> HRESULT,
	GetMaximumFrameLatency: proc "system" (this: ^ISwapChain2, pMaxLatency: ^u32) -> HRESULT,
	GetFrameLatencyWaitableObject: proc "system" (this: ^ISwapChain2) -> HANDLE,
	SetMatrixTransform: proc "system" (this: ^ISwapChain2, #by_ptr pMatrix: MATRIX_3X2_F) -> HRESULT,
	GetMatrixTransform: proc "system" (this: ^ISwapChain2, pMatrix: ^MATRIX_3X2_F) -> HRESULT,
}
IID_IDXGISwapChain2 :: GUID{0xA8BE2AC4, 0x199F, 0x4946, {0xB3, 0x31, 0x79, 0x59, 0x9F, 0xB9, 0x8D, 0xE7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_4/nn-dxgi1_4-idxgiswapchain3 ]]
ISwapChain3 :: struct #raw_union {
	#subtype ISwapChain2: ISwapChain2,
	using Vtbl: ^ISwapChain3_Vtbl,
}
ISwapChain3_Vtbl :: struct {
	using ISwapChain2_Vtbl: ISwapChain2_Vtbl,
	GetCurrentBackBufferIndex: proc "system" (this: ^ISwapChain3) -> u32,
	CheckColorSpaceSupport: proc "system" (
		this: ^ISwapChain3,
		ColorSpace: COLOR_SPACE_TYPE,
		pColorSpaceSupport: SWAP_CHAIN_COLOR_SPACE_SUPPORT_FLAG,
	) -> HRESULT,
	SetColorSpace1: proc "system" (this: ^ISwapChain3, ColorSpace: COLOR_SPACE_TYPE) -> HRESULT,
	ResizeBuffers1: proc "system" (
		this: ^ISwapChain3,
		BufferCount: u32,
		Width: u32,
		Height: u32,
		Format: FORMAT,
		SwapChainFlags: SWAP_CHAIN_FLAG,
		pCreationNodeMask: [^]u32,
		ppPresentQueue: [^]^IUnknown,
	) -> HRESULT,
}
IID_IDXGISwapChain3 :: GUID{0x94D99BDB, 0xF1F8, 0x4AB0, {0xB2, 0x36, 0x7D, 0xA0, 0x17, 0x0E, 0xDA, 0xB1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_5/nn-dxgi1_5-idxgiswapchain4 ]]
ISwapChain4 :: struct #raw_union {
	#subtype ISwapChain3: ISwapChain3,
	using Vtbl: ^ISwapChain4_Vtbl,
}
ISwapChain4_Vtbl :: struct {
	using ISwapChain3_Vtbl: ISwapChain3_Vtbl,
	SetHDRMetaData: proc "system" (this: ^ISwapChain4, Type: HDR_METADATA_TYPE, Size: u32, pMetaData: rawptr) -> HRESULT,
}
IID_IDXGISwapChain4 :: GUID{0x3D585D5A, 0xBD4A, 0x489E, {0xB1, 0xF4, 0x3D, 0xBC, 0xB6, 0x45, 0x2F, 0xFB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dxgi1_3/nn-dxgi1_3-idxgiswapchainmedia ]]
ISwapChainMedia :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISwapChainMedia_Vtbl,
}
ISwapChainMedia_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetFrameStatisticsMedia: proc "system" (this: ^ISwapChainMedia, pStats: ^FRAME_STATISTICS_MEDIA) -> HRESULT,
	SetPresentDuration: proc "system" (this: ^ISwapChainMedia, Duration: u32) -> HRESULT,
	CheckPresentDurationSupport: proc "system" (
		this: ^ISwapChainMedia,
		DesiredPresentDuration: u32,
		pClosestSmallerPresentDuration: ^u32,
		pClosestLargerPresentDuration: ^u32,
	) -> HRESULT,
}
IID_IDXGISwapChainMedia :: GUID{0xDD95B90B, 0xF05F, 0x4F6A, {0xBD, 0x65, 0x25, 0xBF, 0xB2, 0x64, 0xBD, 0x84}}

IDXGraphicsAnalysis :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDXGraphicsAnalysis_Vtbl,
}
IDXGraphicsAnalysis_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	BeginCapture: proc "system" (this: ^IDXGraphicsAnalysis),
	EndCapture: proc "system" (this: ^IDXGraphicsAnalysis),
}
IID_IDXGraphicsAnalysis :: GUID{0x9F251514, 0x9D4D, 0x4902, {0x9D, 0x60, 0x18, 0x98, 0x8A, 0xB7, 0xD4, 0xB5}}

FACDXGI :: 2170
CENTER_MULTISAMPLE_QUALITY_PATTERN :: 4294967294
CPU_ACCESS_DYNAMIC :: 1
CPU_ACCESS_FIELD :: 15
CPU_ACCESS_NONE :: 0
CPU_ACCESS_READ_WRITE :: 2
CPU_ACCESS_SCRATCH :: 3
DEBUG_ALL :: GUID{0xE48AE283, 0xDA80, 0x490B, {0x87, 0xE6, 0x43, 0xE9, 0xA9, 0xCF, 0xDA, 0x08}}
DEBUG_APP :: GUID{0x06CD6E01, 0x4219, 0x4EBD, {0x87, 0x09, 0x27, 0xED, 0x23, 0x36, 0x0C, 0x62}}
DEBUG_BINARY_VERSION :: 1
DEBUG_DX :: GUID{0x35CDD7FC, 0x13B2, 0x421D, {0xA5, 0xD7, 0x7E, 0x44, 0x51, 0x28, 0x7D, 0x64}}
DEBUG_DXGI :: GUID{0x25CDDAA4, 0xB1C6, 0x47E1, {0xAC, 0x3E, 0x98, 0x87, 0x5B, 0x5A, 0x2E, 0x2A}}
ERROR_ACCESS_DENIED :: -2005270485
ERROR_ACCESS_LOST :: -2005270490
ERROR_ALREADY_EXISTS :: -2005270474
ERROR_CACHE_CORRUPT :: -2005270477
ERROR_CACHE_FULL :: -2005270476
ERROR_CACHE_HASH_COLLISION :: -2005270475
ERROR_CANNOT_PROTECT_CONTENT :: -2005270486
ERROR_DEVICE_HUNG :: -2005270522
ERROR_DEVICE_REMOVED :: -2005270523
ERROR_DEVICE_RESET :: -2005270521
ERROR_DRIVER_INTERNAL_ERROR :: -2005270496
ERROR_DYNAMIC_CODE_POLICY_VIOLATION :: -2005270479
ERROR_FRAME_STATISTICS_DISJOINT :: -2005270517
ERROR_GRAPHICS_VIDPN_SOURCE_IN_USE :: -2005270516
ERROR_HW_PROTECTION_OUTOFMEMORY :: -2005270480
ERROR_INVALID_CALL :: -2005270527
ERROR_MODE_CHANGE_IN_PROGRESS :: -2005270491
ERROR_MORE_DATA :: -2005270525
ERROR_MPO_UNPINNED :: -2005270428
ERROR_NAME_ALREADY_EXISTS :: -2005270484
ERROR_NON_COMPOSITED_UI :: -2005270478
ERROR_NONEXCLUSIVE :: -2005270495
ERROR_NOT_CURRENT :: -2005270482
ERROR_NOT_CURRENTLY_AVAILABLE :: -2005270494
ERROR_NOT_FOUND :: -2005270526
ERROR_REMOTE_CLIENT_DISCONNECTED :: -2005270493
ERROR_REMOTE_OUTOFMEMORY :: -2005270492
ERROR_RESTRICT_TO_OUTPUT_STALE :: -2005270487
ERROR_SDK_COMPONENT_MISSING :: -2005270483
ERROR_SESSION_DISCONNECTED :: -2005270488
ERROR_UNSUPPORTED :: -2005270524
ERROR_WAIT_TIMEOUT :: -2005270489
ERROR_WAS_STILL_DRAWING :: -2005270518
FORMAT_DEFINED :: 1
INFO_QUEUE_DEFAULT_MESSAGE_COUNT_LIMIT :: 1024
INFO_QUEUE_MESSAGE_ID_STRING_FROM_APPLICATION :: 0
MAX_SWAP_CHAIN_BUFFERS :: 16
STANDARD_MULTISAMPLE_QUALITY_PATTERN :: 4294967295

BOOL :: win32.BOOL
GUID :: win32.GUID
HANDLE :: win32.HANDLE
HDC :: win32.HDC
HMODULE :: win32.HMODULE
HMONITOR :: win32.HMONITOR
HRESULT :: win32.HRESULT
HWND :: win32.HWND
IUnknown :: win32.IUnknown
IUnknown_Vtbl :: win32.IUnknown_Vtbl
LUID :: win32.LUID
POINT :: win32.POINT
PSTR :: win32.PSTR
PWSTR :: win32.PWSTR
RECT :: win32.RECT
SECURITY_ATTRIBUTES :: win32.SECURITY_ATTRIBUTES

import win32 ".."
