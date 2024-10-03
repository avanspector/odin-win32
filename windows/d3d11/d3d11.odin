package windows_d3d11

foreign import d3d11 "system:d3d11.lib"
foreign import d3dcompiler "system:d3dcompiler.lib"
foreign import d3dcsx "system:d3dcsx.lib"

@(default_calling_convention="system")
foreign d3d11 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-d3d11createdevice ]]
	@(link_name="D3D11CreateDevice")
	CreateDevice :: proc(
		pAdapter: ^dxgi.IAdapter,
		DriverType: d3d.DRIVER_TYPE,
		Software: HMODULE,
		Flags: CREATE_DEVICE_FLAG,
		pFeatureLevels: [^]d3d.FEATURE_LEVEL,
		FeatureLevels: u32,
		SDKVersion: u32,
		ppDevice: ^^IDevice,
		pFeatureLevel: ^d3d.FEATURE_LEVEL,
		ppImmediateContext: ^^IDeviceContext,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-d3d11createdeviceandswapchain ]]
	@(link_name="D3D11CreateDeviceAndSwapChain")
	CreateDeviceAndSwapChain :: proc(
		pAdapter: ^dxgi.IAdapter,
		DriverType: d3d.DRIVER_TYPE,
		Software: HMODULE,
		Flags: CREATE_DEVICE_FLAG,
		pFeatureLevels: [^]d3d.FEATURE_LEVEL,
		FeatureLevels: u32,
		SDKVersion: u32,
		pSwapChainDesc: ^dxgi.SWAP_CHAIN_DESC,
		ppSwapChain: ^^dxgi.ISwapChain,
		ppDevice: ^^IDevice,
		pFeatureLevel: ^d3d.FEATURE_LEVEL,
		ppImmediateContext: ^^IDeviceContext,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-d3d11on12createdevice ]]
	@(link_name="D3D11On12CreateDevice")
	On12CreateDevice :: proc(
		pDevice: ^IUnknown,
		Flags: u32,
		pFeatureLevels: [^]d3d.FEATURE_LEVEL,
		FeatureLevels: u32,
		ppCommandQueues: [^]^IUnknown,
		NumQueues: u32,
		NodeMask: u32,
		ppDevice: ^^IDevice,
		ppImmediateContext: ^^IDeviceContext,
		pChosenFeatureLevel: ^d3d.FEATURE_LEVEL,
	) -> HRESULT ---
}

@(default_calling_convention="system")
foreign d3dcompiler {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nf-d3d11shadertracing-d3ddisassemble11trace ]]
	D3DDisassemble11Trace :: proc(
		pSrcData: rawptr,
		SrcDataSize: uintptr,
		pTrace: ^IShaderTrace,
		StartStep: u32,
		NumSteps: u32,
		Flags: u32,
		ppDisassembly: ^^d3d.IBlob,
	) -> HRESULT ---
}

@(default_calling_convention="system")
foreign d3dcsx {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft ]]
	D3DX11CreateFFT :: proc(
		pDeviceContext: ^IDeviceContext,
		#by_ptr pDesc: D3DX11_FFT_DESC,
		Flags: u32,
		pBufferInfo: ^D3DX11_FFT_BUFFER_INFO,
		ppFFT: ^^ID3DX11FFT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft1dcomplex ]]
	D3DX11CreateFFT1DComplex :: proc(
		pDeviceContext: ^IDeviceContext,
		X: u32,
		Flags: u32,
		pBufferInfo: ^D3DX11_FFT_BUFFER_INFO,
		ppFFT: ^^ID3DX11FFT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft1dreal ]]
	D3DX11CreateFFT1DReal :: proc(
		pDeviceContext: ^IDeviceContext,
		X: u32,
		Flags: u32,
		pBufferInfo: ^D3DX11_FFT_BUFFER_INFO,
		ppFFT: ^^ID3DX11FFT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft2dcomplex ]]
	D3DX11CreateFFT2DComplex :: proc(
		pDeviceContext: ^IDeviceContext,
		X: u32,
		Y: u32,
		Flags: u32,
		pBufferInfo: ^D3DX11_FFT_BUFFER_INFO,
		ppFFT: ^^ID3DX11FFT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft2dreal ]]
	D3DX11CreateFFT2DReal :: proc(
		pDeviceContext: ^IDeviceContext,
		X: u32,
		Y: u32,
		Flags: u32,
		pBufferInfo: ^D3DX11_FFT_BUFFER_INFO,
		ppFFT: ^^ID3DX11FFT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft3dcomplex ]]
	D3DX11CreateFFT3DComplex :: proc(
		pDeviceContext: ^IDeviceContext,
		X: u32,
		Y: u32,
		Z: u32,
		Flags: u32,
		pBufferInfo: ^D3DX11_FFT_BUFFER_INFO,
		ppFFT: ^^ID3DX11FFT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createfft3dreal ]]
	D3DX11CreateFFT3DReal :: proc(
		pDeviceContext: ^IDeviceContext,
		X: u32,
		Y: u32,
		Z: u32,
		Flags: u32,
		pBufferInfo: ^D3DX11_FFT_BUFFER_INFO,
		ppFFT: ^^ID3DX11FFT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createscan ]]
	D3DX11CreateScan :: proc(
		pDeviceContext: ^IDeviceContext,
		MaxElementScanSize: u32,
		MaxScanCount: u32,
		ppScan: ^^ID3DX11Scan,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-d3dx11createsegmentedscan ]]
	D3DX11CreateSegmentedScan :: proc(
		pDeviceContext: ^IDeviceContext,
		MaxElementScanSize: u32,
		ppScan: ^^ID3DX11SegmentedScan,
	) -> HRESULT ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_1_create_device_context_state_flag ]]
_1_CREATE_DEVICE_CONTEXT_STATE_FLAG :: enum i32 {
	SINGLETHREADED = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_aes_ctr_iv ]]
AES_CTR_IV :: struct {
	IV: u64,
	Count: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_async_getdata_flag ]]
ASYNC_GETDATA_FLAG :: enum i32 {
	DONOTFLUSH = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_authenticated_channel_type ]]
AUTHENTICATED_CHANNEL_TYPE :: enum i32 {
	D3D11 = 1,
	DRIVER_SOFTWARE = 2,
	DRIVER_HARDWARE = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_accessible_encryption_input ]]
AUTHENTICATED_CONFIGURE_ACCESSIBLE_ENCRYPTION_INPUT :: struct {
	Parameters: AUTHENTICATED_CONFIGURE_INPUT,
	EncryptionGuid: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_crypto_session_input ]]
AUTHENTICATED_CONFIGURE_CRYPTO_SESSION_INPUT :: struct {
	Parameters: AUTHENTICATED_CONFIGURE_INPUT,
	DecoderHandle: HANDLE,
	CryptoSessionHandle: HANDLE,
	DeviceHandle: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_initialize_input ]]
AUTHENTICATED_CONFIGURE_INITIALIZE_INPUT :: struct {
	Parameters: AUTHENTICATED_CONFIGURE_INPUT,
	StartSequenceQuery: u32,
	StartSequenceConfigure: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_input ]]
AUTHENTICATED_CONFIGURE_INPUT :: struct {
	omac: OMAC,
	ConfigureType: GUID,
	hChannel: HANDLE,
	SequenceNumber: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_output ]]
AUTHENTICATED_CONFIGURE_OUTPUT :: struct {
	omac: OMAC,
	ConfigureType: GUID,
	hChannel: HANDLE,
	SequenceNumber: u32,
	ReturnCode: HRESULT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_protection_input ]]
AUTHENTICATED_CONFIGURE_PROTECTION_INPUT :: struct {
	Parameters: AUTHENTICATED_CONFIGURE_INPUT,
	Protections: AUTHENTICATED_PROTECTION_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_configure_shared_resource_input ]]
AUTHENTICATED_CONFIGURE_SHARED_RESOURCE_INPUT :: struct {
	Parameters: AUTHENTICATED_CONFIGURE_INPUT,
	ProcessType: AUTHENTICATED_PROCESS_IDENTIFIER_TYPE,
	ProcessHandle: HANDLE,
	AllowAccess: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_authenticated_process_identifier_type ]]
AUTHENTICATED_PROCESS_IDENTIFIER_TYPE :: enum i32 {
	UNKNOWN = 0,
	DWM = 1,
	HANDLE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_protection_flags ]]
AUTHENTICATED_PROTECTION_FLAGS :: struct #raw_union {
	Flags: struct {
		using _: bit_field u32 {
			ProtectionEnabled: u32 | 1,
			OverlayOrFullscreenRequired: u32 | 1,
			Reserved: u32 | 30,
		},
	},
	Value: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_encryption_guid_count_output ]]
AUTHENTICATED_QUERY_ACCESSIBILITY_ENCRYPTION_GUID_COUNT_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	EncryptionGuidCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_encryption_guid_input ]]
AUTHENTICATED_QUERY_ACCESSIBILITY_ENCRYPTION_GUID_INPUT :: struct {
	Input: AUTHENTICATED_QUERY_INPUT,
	EncryptionGuidIndex: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_encryption_guid_output ]]
AUTHENTICATED_QUERY_ACCESSIBILITY_ENCRYPTION_GUID_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	EncryptionGuidIndex: u32,
	EncryptionGuid: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_accessibility_output ]]
AUTHENTICATED_QUERY_ACCESSIBILITY_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	BusType: BUS_TYPE,
	AccessibleInContiguousBlocks: BOOL,
	AccessibleInNonContiguousBlocks: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_channel_type_output ]]
AUTHENTICATED_QUERY_CHANNEL_TYPE_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	ChannelType: AUTHENTICATED_CHANNEL_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_crypto_session_input ]]
AUTHENTICATED_QUERY_CRYPTO_SESSION_INPUT :: struct {
	Input: AUTHENTICATED_QUERY_INPUT,
	DecoderHandle: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_crypto_session_output ]]
AUTHENTICATED_QUERY_CRYPTO_SESSION_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	DecoderHandle: HANDLE,
	CryptoSessionHandle: HANDLE,
	DeviceHandle: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_current_accessibility_encryption_output ]]
AUTHENTICATED_QUERY_CURRENT_ACCESSIBILITY_ENCRYPTION_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	EncryptionGuid: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_device_handle_output ]]
AUTHENTICATED_QUERY_DEVICE_HANDLE_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	DeviceHandle: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_input ]]
AUTHENTICATED_QUERY_INPUT :: struct {
	QueryType: GUID,
	hChannel: HANDLE,
	SequenceNumber: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output ]]
AUTHENTICATED_QUERY_OUTPUT :: struct {
	omac: OMAC,
	QueryType: GUID,
	hChannel: HANDLE,
	SequenceNumber: u32,
	ReturnCode: HRESULT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_count_input ]]
AUTHENTICATED_QUERY_OUTPUT_ID_COUNT_INPUT :: struct {
	Input: AUTHENTICATED_QUERY_INPUT,
	DeviceHandle: HANDLE,
	CryptoSessionHandle: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_count_output ]]
AUTHENTICATED_QUERY_OUTPUT_ID_COUNT_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	DeviceHandle: HANDLE,
	CryptoSessionHandle: HANDLE,
	OutputIDCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_input ]]
AUTHENTICATED_QUERY_OUTPUT_ID_INPUT :: struct {
	Input: AUTHENTICATED_QUERY_INPUT,
	DeviceHandle: HANDLE,
	CryptoSessionHandle: HANDLE,
	OutputIDIndex: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_output_id_output ]]
AUTHENTICATED_QUERY_OUTPUT_ID_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	DeviceHandle: HANDLE,
	CryptoSessionHandle: HANDLE,
	OutputIDIndex: u32,
	OutputID: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_protection_output ]]
AUTHENTICATED_QUERY_PROTECTION_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	ProtectionFlags: AUTHENTICATED_PROTECTION_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_count_output ]]
AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_COUNT_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	RestrictedSharedResourceProcessCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_input ]]
AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_INPUT :: struct {
	Input: AUTHENTICATED_QUERY_INPUT,
	ProcessIndex: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_restricted_shared_resource_process_output ]]
AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	ProcessIndex: u32,
	ProcessIdentifier: AUTHENTICATED_PROCESS_IDENTIFIER_TYPE,
	ProcessHandle: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_authenticated_query_unrestricted_protected_shared_resource_count_output ]]
AUTHENTICATED_QUERY_UNRESTRICTED_PROTECTED_SHARED_RESOURCE_COUNT_OUTPUT :: struct {
	Output: AUTHENTICATED_QUERY_OUTPUT,
	UnrestrictedProtectedSharedResourceCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_bind_flag ]]
BIND_FLAG :: distinct bit_set[enum {
	VERTEX_BUFFER = 0,
	INDEX_BUFFER = 1,
	CONSTANT_BUFFER = 2,
	SHADER_RESOURCE = 3,
	STREAM_OUTPUT = 4,
	RENDER_TARGET = 5,
	DEPTH_STENCIL = 6,
	UNORDERED_ACCESS = 7,
	DECODER = 9,
	VIDEO_ENCODER = 10,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_blend ]]
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
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_blend_desc ]]
BLEND_DESC :: struct {
	AlphaToCoverageEnable: BOOL,
	IndependentBlendEnable: BOOL,
	RenderTarget: [8]RENDER_TARGET_BLEND_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_blend_desc1 ]]
BLEND_DESC1 :: struct {
	AlphaToCoverageEnable: BOOL,
	IndependentBlendEnable: BOOL,
	RenderTarget: [8]RENDER_TARGET_BLEND_DESC1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_blend_op ]]
BLEND_OP :: enum i32 {
	ADD = 1,
	SUBTRACT = 2,
	REV_SUBTRACT = 3,
	MIN = 4,
	MAX = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_box ]]
BOX :: struct {
	left: u32,
	top: u32,
	front: u32,
	right: u32,
	bottom: u32,
	back: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_buffer_desc ]]
BUFFER_DESC :: struct {
	ByteWidth: u32,
	Usage: USAGE,
	BindFlags: BIND_FLAG,
	CPUAccessFlags: CPU_ACCESS_FLAG,
	MiscFlags: RESOURCE_MISC_FLAG,
	StructureByteStride: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_buffer_rtv ]]
BUFFER_RTV :: struct {
	using _: struct #raw_union {
		FirstElement: u32,
		ElementOffset: u32,
	},
	using _: struct #raw_union {
		NumElements: u32,
		ElementWidth: u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_buffer_srv ]]
BUFFER_SRV :: struct {
	using _: struct #raw_union {
		FirstElement: u32,
		ElementOffset: u32,
	},
	using _: struct #raw_union {
		NumElements: u32,
		ElementWidth: u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_buffer_uav ]]
BUFFER_UAV :: struct {
	FirstElement: u32,
	NumElements: u32,
	Flags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_buffer_uav_flag ]]
BUFFER_UAV_FLAG :: enum i32 {
	RAW = 1,
	APPEND = 2,
	COUNTER = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_bufferex_srv ]]
BUFFEREX_SRV :: struct {
	FirstElement: u32,
	NumElements: u32,
	Flags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_bufferex_srv_flag ]]
BUFFEREX_SRV_FLAG :: enum i32 {
	RAW = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_bus_type ]]
BUS_TYPE :: enum i32 {
	TYPE_OTHER = 0,
	TYPE_PCI = 1,
	TYPE_PCIX = 2,
	TYPE_PCIEXPRESS = 3,
	TYPE_AGP = 4,
	IMPL_MODIFIER_INSIDE_OF_CHIPSET = 65536,
	IMPL_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_CHIP = 131072,
	IMPL_MODIFIER_TRACKS_ON_MOTHER_BOARD_TO_SOCKET = 196608,
	IMPL_MODIFIER_DAUGHTER_BOARD_CONNECTOR = 262144,
	IMPL_MODIFIER_DAUGHTER_BOARD_CONNECTOR_INSIDE_OF_NUAE = 327680,
	IMPL_MODIFIER_NON_STANDARD = -2147483648,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ne-d3d11_2-d3d11_check_multisample_quality_levels_flag ]]
CHECK_MULTISAMPLE_QUALITY_LEVELS_FLAG :: enum i32 {
	TILED_RESOURCE = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_class_instance_desc ]]
CLASS_INSTANCE_DESC :: struct {
	InstanceId: u32,
	InstanceIndex: u32,
	TypeId: u32,
	ConstantBuffer: u32,
	BaseConstantBufferOffset: u32,
	BaseTexture: u32,
	BaseSampler: u32,
	Created: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_clear_flag ]]
CLEAR_FLAG :: distinct bit_set[enum {
	DEPTH = 0,
	STENCIL = 1,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_color_write_enable ]]
COLOR_WRITE_ENABLE :: enum i32 {
	RED = 1,
	GREEN = 2,
	BLUE = 4,
	ALPHA = 8,
	ALL = 15,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_comparison_func ]]
COMPARISON_FUNC :: enum i32 {
	NEVER = 1,
	LESS = 2,
	EQUAL = 3,
	LESS_EQUAL = 4,
	GREATER = 5,
	NOT_EQUAL = 6,
	GREATER_EQUAL = 7,
	ALWAYS = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_compute_shader_trace_desc ]]
COMPUTE_SHADER_TRACE_DESC :: struct {
	Invocation: u64,
	ThreadIDInGroup: [3]u32,
	ThreadGroupID: [3]u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_conservative_rasterization_mode ]]
CONSERVATIVE_RASTERIZATION_MODE :: enum i32 {
	OFF = 0,
	ON = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_conservative_rasterization_tier ]]
CONSERVATIVE_RASTERIZATION_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	TIER_1 = 1,
	TIER_2 = 2,
	TIER_3 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_content_protection_caps ]]
CONTENT_PROTECTION_CAPS :: enum i32 {
	SOFTWARE = 1,
	HARDWARE = 2,
	PROTECTION_ALWAYS_ON = 4,
	PARTIAL_DECRYPTION = 8,
	CONTENT_KEY = 16,
	FRESHEN_SESSION_KEY = 32,
	ENCRYPTED_READ_BACK = 64,
	ENCRYPTED_READ_BACK_KEY = 128,
	SEQUENTIAL_CTR_IV = 256,
	ENCRYPT_SLICEDATA_ONLY = 512,
	DECRYPTION_BLT = 1024,
	HARDWARE_PROTECT_UNCOMPRESSED = 2048,
	HARDWARE_PROTECTED_MEMORY_PAGEABLE = 4096,
	HARDWARE_TEARDOWN = 8192,
	HARDWARE_DRM_COMMUNICATION = 16384,
	HARDWARE_DRM_COMMUNICATION_MULTI_THREADED = 32768,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_context_type ]]
CONTEXT_TYPE :: enum i32 {
	ALL = 0,
	_3D = 1,
	COMPUTE = 2,
	COPY = 3,
	VIDEO = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_copy_flags ]]
COPY_FLAGS :: enum i32 {
	NO_OVERWRITE = 1,
	DISCARD = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_counter ]]
COUNTER :: enum i32 {
	DEVICE_DEPENDENT_0 = 1073741824,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_counter_desc ]]
COUNTER_DESC :: struct {
	Counter: COUNTER,
	MiscFlags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_counter_info ]]
COUNTER_INFO :: struct {
	LastDeviceDependentCounter: COUNTER,
	NumSimultaneousCounters: u32,
	NumDetectableParallelUnits: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_counter_type ]]
COUNTER_TYPE :: enum i32 {
	FLOAT32 = 0,
	UINT16 = 1,
	UINT32 = 2,
	UINT64 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_cpu_access_flag ]]
CPU_ACCESS_FLAG :: distinct bit_set[enum {
	WRITE = 16,
	READ = 17,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_create_device_flag ]]
CREATE_DEVICE_FLAG :: distinct bit_set[enum {
	SINGLETHREADED = 0,
	DEBUG = 1,
	SWITCH_TO_REF = 2,
	PREVENT_INTERNAL_THREADING_OPTIMIZATIONS = 3,
	BGRA_SUPPORT = 5,
	DEBUGGABLE = 6,
	PREVENT_ALTERING_LAYER_SETTINGS_FROM_REGISTRY = 7,
	DISABLE_GPU_TIMEOUT = 8,
	VIDEO_SUPPORT = 11,
}; u32]

CRYPTO_SESSION_KEY_EXCHANGE_FLAGS :: distinct bit_set[enum {}; i32]
CRYPTO_SESSION_KEY_EXCHANGE_FLAGS_NONE :: transmute(CRYPTO_SESSION_KEY_EXCHANGE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_crypto_session_status ]]
CRYPTO_SESSION_STATUS :: enum i32 {
	OK = 0,
	KEY_LOST = 1,
	KEY_AND_CONTENT_LOST = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_cull_mode ]]
CULL_MODE :: enum i32 {
	NONE = 1,
	FRONT = 2,
	BACK = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_depth_stencil_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_depth_stencil_view_desc ]]
DEPTH_STENCIL_VIEW_DESC :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: DSV_DIMENSION,
	Flags: u32,
	using _: struct #raw_union {
		Texture1D: TEX1D_DSV,
		Texture1DArray: TEX1D_ARRAY_DSV,
		Texture2D: TEX2D_DSV,
		Texture2DArray: TEX2D_ARRAY_DSV,
		Texture2DMS: TEX2DMS_DSV,
		Texture2DMSArray: TEX2DMS_ARRAY_DSV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_depth_stencilop_desc ]]
DEPTH_STENCILOP_DESC :: struct {
	StencilFailOp: STENCIL_OP,
	StencilDepthFailOp: STENCIL_OP,
	StencilPassOp: STENCIL_OP,
	StencilFunc: COMPARISON_FUNC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_depth_write_mask ]]
DEPTH_WRITE_MASK :: enum i32 {
	ZERO = 0,
	ALL = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_device_context_type ]]
DEVICE_CONTEXT_TYPE :: enum i32 {
	IMMEDIATE = 0,
	DEFERRED = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_domain_shader_trace_desc ]]
DOMAIN_SHADER_TRACE_DESC :: struct {
	Invocation: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_draw_indexed_instanced_indirect_args ]]
DRAW_INDEXED_INSTANCED_INDIRECT_ARGS :: struct {
	IndexCountPerInstance: u32,
	InstanceCount: u32,
	StartIndexLocation: u32,
	BaseVertexLocation: i32,
	StartInstanceLocation: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_draw_instanced_indirect_args ]]
DRAW_INSTANCED_INDIRECT_ARGS :: struct {
	VertexCountPerInstance: u32,
	InstanceCount: u32,
	StartVertexLocation: u32,
	StartInstanceLocation: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_dsv_dimension ]]
DSV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	TEXTURE1D = 1,
	TEXTURE1DARRAY = 2,
	TEXTURE2D = 3,
	TEXTURE2DARRAY = 4,
	TEXTURE2DMS = 5,
	TEXTURE2DMSARRAY = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_dsv_flag ]]
DSV_FLAG :: enum i32 {
	DEPTH = 1,
	STENCIL = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_encrypted_block_info ]]
ENCRYPTED_BLOCK_INFO :: struct {
	NumEncryptedBytesAtBeginning: u32,
	NumBytesInSkipPattern: u32,
	NumBytesInEncryptPattern: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_feature ]]
FEATURE :: enum i32 {
	THREADING = 0,
	DOUBLES = 1,
	FORMAT_SUPPORT = 2,
	FORMAT_SUPPORT2 = 3,
	D3D10_X_HARDWARE_OPTIONS = 4,
	D3D11_OPTIONS = 5,
	ARCHITECTURE_INFO = 6,
	D3D9_OPTIONS = 7,
	SHADER_MIN_PRECISION_SUPPORT = 8,
	D3D9_SHADOW_SUPPORT = 9,
	D3D11_OPTIONS1 = 10,
	D3D9_SIMPLE_INSTANCING_SUPPORT = 11,
	MARKER_SUPPORT = 12,
	D3D9_OPTIONS1 = 13,
	D3D11_OPTIONS2 = 14,
	D3D11_OPTIONS3 = 15,
	GPU_VIRTUAL_ADDRESS_SUPPORT = 16,
	D3D11_OPTIONS4 = 17,
	SHADER_CACHE = 18,
	D3D11_OPTIONS5 = 19,
	DISPLAYABLE = 20,
}

FEATURE_DATA_ARCHITECTURE_INFO :: struct {
	TileBasedDeferredRenderer: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d10_x_hardware_options ]]
FEATURE_DATA_D3D10_X_HARDWARE_OPTIONS :: struct {
	ComputeShaders_Plus_RawAndStructuredBuffers_Via_Shader_4_x: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options ]]
FEATURE_DATA_D3D11_OPTIONS :: struct {
	OutputMergerLogicOp: BOOL,
	UAVOnlyRenderingForcedSampleCount: BOOL,
	DiscardAPIsSeenByDriver: BOOL,
	FlagsForUpdateAndCopySeenByDriver: BOOL,
	ClearView: BOOL,
	CopyWithOverlap: BOOL,
	ConstantBufferPartialUpdate: BOOL,
	ConstantBufferOffsetting: BOOL,
	MapNoOverwriteOnDynamicConstantBuffer: BOOL,
	MapNoOverwriteOnDynamicBufferSRV: BOOL,
	MultisampleRTVWithForcedSampleCountOne: BOOL,
	SAD4ShaderInstructions: BOOL,
	ExtendedDoublesShaderInstructions: BOOL,
	ExtendedResourceSharing: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options1 ]]
FEATURE_DATA_D3D11_OPTIONS1 :: struct {
	TiledResourcesTier: TILED_RESOURCES_TIER,
	MinMaxFiltering: BOOL,
	ClearViewAlsoSupportsDepthOnlyFormats: BOOL,
	MapOnDefaultBuffers: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options2 ]]
FEATURE_DATA_D3D11_OPTIONS2 :: struct {
	PSSpecifiedStencilRefSupported: BOOL,
	TypedUAVLoadAdditionalFormats: BOOL,
	ROVsSupported: BOOL,
	ConservativeRasterizationTier: CONSERVATIVE_RASTERIZATION_TIER,
	TiledResourcesTier: TILED_RESOURCES_TIER,
	MapOnDefaultTextures: BOOL,
	StandardSwizzle: BOOL,
	UnifiedMemoryArchitecture: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options3 ]]
FEATURE_DATA_D3D11_OPTIONS3 :: struct {
	VPAndRTArrayIndexFromAnyShaderFeedingRasterizer: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/ns-d3d11_4-d3d11_feature_data_d3d11_options4 ]]
FEATURE_DATA_D3D11_OPTIONS4 :: struct {
	ExtendedNV12SharedTextureSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d11_options5 ]]
FEATURE_DATA_D3D11_OPTIONS5 :: struct {
	SharedResourceTier: SHARED_RESOURCE_TIER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_options ]]
FEATURE_DATA_D3D9_OPTIONS :: struct {
	FullNonPow2TextureSupport: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_options1 ]]
FEATURE_DATA_D3D9_OPTIONS1 :: struct {
	FullNonPow2TextureSupported: BOOL,
	DepthAsTextureWithLessEqualComparisonFilterSupported: BOOL,
	SimpleInstancingSupported: BOOL,
	TextureCubeFaceRenderTargetWithNonCubeDepthStencilSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_shadow_support ]]
FEATURE_DATA_D3D9_SHADOW_SUPPORT :: struct {
	SupportsDepthAsTextureWithLessEqualComparisonFilter: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_d3d9_simple_instancing_support ]]
FEATURE_DATA_D3D9_SIMPLE_INSTANCING_SUPPORT :: struct {
	SimpleInstancingSupported: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_displayable ]]
FEATURE_DATA_DISPLAYABLE :: struct {
	DisplayableTexture: BOOL,
	SharedResourceTier: SHARED_RESOURCE_TIER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_doubles ]]
FEATURE_DATA_DOUBLES :: struct {
	DoublePrecisionFloatShaderOps: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_format_support ]]
FEATURE_DATA_FORMAT_SUPPORT :: struct {
	InFormat: dxgi.FORMAT,
	OutFormatSupport: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_format_support2 ]]
FEATURE_DATA_FORMAT_SUPPORT2 :: struct {
	InFormat: dxgi.FORMAT,
	OutFormatSupport2: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_gpu_virtual_address_support ]]
FEATURE_DATA_GPU_VIRTUAL_ADDRESS_SUPPORT :: struct {
	MaxGPUVirtualAddressBitsPerResource: u32,
	MaxGPUVirtualAddressBitsPerProcess: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_marker_support ]]
FEATURE_DATA_MARKER_SUPPORT :: struct {
	Profile: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_shader_cache ]]
FEATURE_DATA_SHADER_CACHE :: struct {
	SupportFlags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_shader_min_precision_support ]]
FEATURE_DATA_SHADER_MIN_PRECISION_SUPPORT :: struct {
	PixelShaderMinPrecision: u32,
	AllOtherShaderStagesMinPrecision: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_feature_data_threading ]]
FEATURE_DATA_THREADING :: struct {
	DriverConcurrentCreates: BOOL,
	DriverCommandLists: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/ns-d3d11_4-d3d11_feature_data_video_decoder_histogram ]]
FEATURE_DATA_VIDEO_DECODER_HISTOGRAM :: struct {
	DecoderDesc: VIDEO_DECODER_DESC,
	Components: VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS,
	BinCount: u32,
	CounterBitDepth: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/ne-d3d11_4-d3d11_feature_video ]]
FEATURE_VIDEO :: enum i32 {
	DECODER_HISTOGRAM = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_fence_flag ]]
FENCE_FLAG :: distinct bit_set[enum {
	SHARED = 1,
	SHARED_CROSS_ADAPTER = 2,
	NON_MONITORED = 3,
}; i32]
FENCE_FLAG_NONE :: transmute(FENCE_FLAG)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_fill_mode ]]
FILL_MODE :: enum i32 {
	WIREFRAME = 2,
	SOLID = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_filter ]]
FILTER :: enum i32 {
	MIN_MAG_MIP_POINT = 0,
	MIN_MAG_POINT_MIP_LINEAR = 1,
	MIN_POINT_MAG_LINEAR_MIP_POINT = 4,
	MIN_POINT_MAG_MIP_LINEAR = 5,
	MIN_LINEAR_MAG_MIP_POINT = 16,
	MIN_LINEAR_MAG_POINT_MIP_LINEAR = 17,
	MIN_MAG_LINEAR_MIP_POINT = 20,
	MIN_MAG_MIP_LINEAR = 21,
	ANISOTROPIC = 85,
	COMPARISON_MIN_MAG_MIP_POINT = 128,
	COMPARISON_MIN_MAG_POINT_MIP_LINEAR = 129,
	COMPARISON_MIN_POINT_MAG_LINEAR_MIP_POINT = 132,
	COMPARISON_MIN_POINT_MAG_MIP_LINEAR = 133,
	COMPARISON_MIN_LINEAR_MAG_MIP_POINT = 144,
	COMPARISON_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 145,
	COMPARISON_MIN_MAG_LINEAR_MIP_POINT = 148,
	COMPARISON_MIN_MAG_MIP_LINEAR = 149,
	COMPARISON_ANISOTROPIC = 213,
	MINIMUM_MIN_MAG_MIP_POINT = 256,
	MINIMUM_MIN_MAG_POINT_MIP_LINEAR = 257,
	MINIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT = 260,
	MINIMUM_MIN_POINT_MAG_MIP_LINEAR = 261,
	MINIMUM_MIN_LINEAR_MAG_MIP_POINT = 272,
	MINIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 273,
	MINIMUM_MIN_MAG_LINEAR_MIP_POINT = 276,
	MINIMUM_MIN_MAG_MIP_LINEAR = 277,
	MINIMUM_ANISOTROPIC = 341,
	MAXIMUM_MIN_MAG_MIP_POINT = 384,
	MAXIMUM_MIN_MAG_POINT_MIP_LINEAR = 385,
	MAXIMUM_MIN_POINT_MAG_LINEAR_MIP_POINT = 388,
	MAXIMUM_MIN_POINT_MAG_MIP_LINEAR = 389,
	MAXIMUM_MIN_LINEAR_MAG_MIP_POINT = 400,
	MAXIMUM_MIN_LINEAR_MAG_POINT_MIP_LINEAR = 401,
	MAXIMUM_MIN_MAG_LINEAR_MIP_POINT = 404,
	MAXIMUM_MIN_MAG_MIP_LINEAR = 405,
	MAXIMUM_ANISOTROPIC = 469,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_filter_reduction_type ]]
FILTER_REDUCTION_TYPE :: enum i32 {
	STANDARD = 0,
	COMPARISON = 1,
	MINIMUM = 2,
	MAXIMUM = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_filter_type ]]
FILTER_TYPE :: enum i32 {
	POINT = 0,
	LINEAR = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_format_support ]]
FORMAT_SUPPORT :: enum i32 {
	BUFFER = 1,
	IA_VERTEX_BUFFER = 2,
	IA_INDEX_BUFFER = 4,
	SO_BUFFER = 8,
	TEXTURE1D = 16,
	TEXTURE2D = 32,
	TEXTURE3D = 64,
	TEXTURECUBE = 128,
	SHADER_LOAD = 256,
	SHADER_SAMPLE = 512,
	SHADER_SAMPLE_COMPARISON = 1024,
	SHADER_SAMPLE_MONO_TEXT = 2048,
	MIP = 4096,
	MIP_AUTOGEN = 8192,
	RENDER_TARGET = 16384,
	BLENDABLE = 32768,
	DEPTH_STENCIL = 65536,
	CPU_LOCKABLE = 131072,
	MULTISAMPLE_RESOLVE = 262144,
	DISPLAY = 524288,
	CAST_WITHIN_BIT_LAYOUT = 1048576,
	MULTISAMPLE_RENDERTARGET = 2097152,
	MULTISAMPLE_LOAD = 4194304,
	SHADER_GATHER = 8388608,
	BACK_BUFFER_CAST = 16777216,
	TYPED_UNORDERED_ACCESS_VIEW = 33554432,
	SHADER_GATHER_COMPARISON = 67108864,
	DECODER_OUTPUT = 134217728,
	VIDEO_PROCESSOR_OUTPUT = 268435456,
	VIDEO_PROCESSOR_INPUT = 536870912,
	VIDEO_ENCODER = 1073741824,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_format_support2 ]]
FORMAT_SUPPORT2 :: enum i32 {
	UAV_ATOMIC_ADD = 1,
	UAV_ATOMIC_BITWISE_OPS = 2,
	UAV_ATOMIC_COMPARE_STORE_OR_COMPARE_EXCHANGE = 4,
	UAV_ATOMIC_EXCHANGE = 8,
	UAV_ATOMIC_SIGNED_MIN_OR_MAX = 16,
	UAV_ATOMIC_UNSIGNED_MIN_OR_MAX = 32,
	UAV_TYPED_LOAD = 64,
	UAV_TYPED_STORE = 128,
	OUTPUT_MERGER_LOGIC_OP = 256,
	TILED = 512,
	SHAREABLE = 1024,
	MULTIPLANE_OVERLAY = 16384,
	DISPLAYABLE = 65536,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_function_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_geometry_shader_trace_desc ]]
GEOMETRY_SHADER_TRACE_DESC :: struct {
	Invocation: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_hull_shader_trace_desc ]]
HULL_SHADER_TRACE_DESC :: struct {
	Invocation: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter ]]
INFO_QUEUE_FILTER :: struct {
	AllowList: INFO_QUEUE_FILTER_DESC,
	DenyList: INFO_QUEUE_FILTER_DESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_info_queue_filter_desc ]]
INFO_QUEUE_FILTER_DESC :: struct {
	NumCategories: u32,
	pCategoryList: ^MESSAGE_CATEGORY,
	NumSeverities: u32,
	pSeverityList: ^MESSAGE_SEVERITY,
	NumIDs: u32,
	pIDList: ^MESSAGE_ID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_input_classification ]]
INPUT_CLASSIFICATION :: enum i32 {
	VERTEX_DATA = 0,
	INSTANCE_DATA = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_input_element_desc ]]
INPUT_ELEMENT_DESC :: struct {
	SemanticName: PSTR,
	SemanticIndex: u32,
	Format: dxgi.FORMAT,
	InputSlot: u32,
	AlignedByteOffset: u32,
	InputSlotClass: INPUT_CLASSIFICATION,
	InstanceDataStepRate: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_data ]]
KEY_EXCHANGE_HW_PROTECTION_DATA :: struct {
	HWProtectionFunctionID: u32,
	pInputData: ^KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA,
	pOutputData: ^KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA,
	Status: HRESULT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_input_data ]]
KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA :: struct {
	PrivateDataSize: u32,
	HWProtectionDataSize: u32,
	pbInput: [4]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_output_data ]]
KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA :: struct {
	PrivateDataSize: u32,
	MaxHWProtectionDataSize: u32,
	HWProtectionDataSize: u32,
	TransportTime: u64,
	ExecutionTime: u64,
	pbOutput: [4]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_library_desc ]]
LIBRARY_DESC :: struct {
	Creator: PSTR,
	Flags: u32,
	FunctionCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_logic_op ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_map ]]
MAP :: enum i32 {
	READ = 1,
	WRITE = 2,
	READ_WRITE = 3,
	WRITE_DISCARD = 4,
	WRITE_NO_OVERWRITE = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_map_flag ]]
MAP_FLAG :: enum i32 {
	DO_NOT_WAIT = 1048576,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_mapped_subresource ]]
MAPPED_SUBRESOURCE :: struct {
	pData: rawptr,
	RowPitch: u32,
	DepthPitch: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ns-d3d11sdklayers-d3d11_message ]]
MESSAGE :: struct {
	Category: MESSAGE_CATEGORY,
	Severity: MESSAGE_SEVERITY,
	ID: MESSAGE_ID,
	pDescription: ^u8,
	DescriptionByteLength: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_category ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_id ]]
MESSAGE_ID :: enum i32 {
	UNKNOWN = 0,
	DEVICE_IASETVERTEXBUFFERS_HAZARD = 1,
	DEVICE_IASETINDEXBUFFER_HAZARD = 2,
	DEVICE_VSSETSHADERRESOURCES_HAZARD = 3,
	DEVICE_VSSETCONSTANTBUFFERS_HAZARD = 4,
	DEVICE_GSSETSHADERRESOURCES_HAZARD = 5,
	DEVICE_GSSETCONSTANTBUFFERS_HAZARD = 6,
	DEVICE_PSSETSHADERRESOURCES_HAZARD = 7,
	DEVICE_PSSETCONSTANTBUFFERS_HAZARD = 8,
	DEVICE_OMSETRENDERTARGETS_HAZARD = 9,
	DEVICE_SOSETTARGETS_HAZARD = 10,
	STRING_FROM_APPLICATION = 11,
	CORRUPTED_THIS = 12,
	CORRUPTED_PARAMETER1 = 13,
	CORRUPTED_PARAMETER2 = 14,
	CORRUPTED_PARAMETER3 = 15,
	CORRUPTED_PARAMETER4 = 16,
	CORRUPTED_PARAMETER5 = 17,
	CORRUPTED_PARAMETER6 = 18,
	CORRUPTED_PARAMETER7 = 19,
	CORRUPTED_PARAMETER8 = 20,
	CORRUPTED_PARAMETER9 = 21,
	CORRUPTED_PARAMETER10 = 22,
	CORRUPTED_PARAMETER11 = 23,
	CORRUPTED_PARAMETER12 = 24,
	CORRUPTED_PARAMETER13 = 25,
	CORRUPTED_PARAMETER14 = 26,
	CORRUPTED_PARAMETER15 = 27,
	CORRUPTED_MULTITHREADING = 28,
	MESSAGE_REPORTING_OUTOFMEMORY = 29,
	IASETINPUTLAYOUT_UNBINDDELETINGOBJECT = 30,
	IASETVERTEXBUFFERS_UNBINDDELETINGOBJECT = 31,
	IASETINDEXBUFFER_UNBINDDELETINGOBJECT = 32,
	VSSETSHADER_UNBINDDELETINGOBJECT = 33,
	VSSETSHADERRESOURCES_UNBINDDELETINGOBJECT = 34,
	VSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT = 35,
	VSSETSAMPLERS_UNBINDDELETINGOBJECT = 36,
	GSSETSHADER_UNBINDDELETINGOBJECT = 37,
	GSSETSHADERRESOURCES_UNBINDDELETINGOBJECT = 38,
	GSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT = 39,
	GSSETSAMPLERS_UNBINDDELETINGOBJECT = 40,
	SOSETTARGETS_UNBINDDELETINGOBJECT = 41,
	PSSETSHADER_UNBINDDELETINGOBJECT = 42,
	PSSETSHADERRESOURCES_UNBINDDELETINGOBJECT = 43,
	PSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT = 44,
	PSSETSAMPLERS_UNBINDDELETINGOBJECT = 45,
	RSSETSTATE_UNBINDDELETINGOBJECT = 46,
	OMSETBLENDSTATE_UNBINDDELETINGOBJECT = 47,
	OMSETDEPTHSTENCILSTATE_UNBINDDELETINGOBJECT = 48,
	OMSETRENDERTARGETS_UNBINDDELETINGOBJECT = 49,
	SETPREDICATION_UNBINDDELETINGOBJECT = 50,
	GETPRIVATEDATA_MOREDATA = 51,
	SETPRIVATEDATA_INVALIDFREEDATA = 52,
	SETPRIVATEDATA_INVALIDIUNKNOWN = 53,
	SETPRIVATEDATA_INVALIDFLAGS = 54,
	SETPRIVATEDATA_CHANGINGPARAMS = 55,
	SETPRIVATEDATA_OUTOFMEMORY = 56,
	CREATEBUFFER_UNRECOGNIZEDFORMAT = 57,
	CREATEBUFFER_INVALIDSAMPLES = 58,
	CREATEBUFFER_UNRECOGNIZEDUSAGE = 59,
	CREATEBUFFER_UNRECOGNIZEDBINDFLAGS = 60,
	CREATEBUFFER_UNRECOGNIZEDCPUACCESSFLAGS = 61,
	CREATEBUFFER_UNRECOGNIZEDMISCFLAGS = 62,
	CREATEBUFFER_INVALIDCPUACCESSFLAGS = 63,
	CREATEBUFFER_INVALIDBINDFLAGS = 64,
	CREATEBUFFER_INVALIDINITIALDATA = 65,
	CREATEBUFFER_INVALIDDIMENSIONS = 66,
	CREATEBUFFER_INVALIDMIPLEVELS = 67,
	CREATEBUFFER_INVALIDMISCFLAGS = 68,
	CREATEBUFFER_INVALIDARG_RETURN = 69,
	CREATEBUFFER_OUTOFMEMORY_RETURN = 70,
	CREATEBUFFER_NULLDESC = 71,
	CREATEBUFFER_INVALIDCONSTANTBUFFERBINDINGS = 72,
	CREATEBUFFER_LARGEALLOCATION = 73,
	CREATETEXTURE1D_UNRECOGNIZEDFORMAT = 74,
	CREATETEXTURE1D_UNSUPPORTEDFORMAT = 75,
	CREATETEXTURE1D_INVALIDSAMPLES = 76,
	CREATETEXTURE1D_UNRECOGNIZEDUSAGE = 77,
	CREATETEXTURE1D_UNRECOGNIZEDBINDFLAGS = 78,
	CREATETEXTURE1D_UNRECOGNIZEDCPUACCESSFLAGS = 79,
	CREATETEXTURE1D_UNRECOGNIZEDMISCFLAGS = 80,
	CREATETEXTURE1D_INVALIDCPUACCESSFLAGS = 81,
	CREATETEXTURE1D_INVALIDBINDFLAGS = 82,
	CREATETEXTURE1D_INVALIDINITIALDATA = 83,
	CREATETEXTURE1D_INVALIDDIMENSIONS = 84,
	CREATETEXTURE1D_INVALIDMIPLEVELS = 85,
	CREATETEXTURE1D_INVALIDMISCFLAGS = 86,
	CREATETEXTURE1D_INVALIDARG_RETURN = 87,
	CREATETEXTURE1D_OUTOFMEMORY_RETURN = 88,
	CREATETEXTURE1D_NULLDESC = 89,
	CREATETEXTURE1D_LARGEALLOCATION = 90,
	CREATETEXTURE2D_UNRECOGNIZEDFORMAT = 91,
	CREATETEXTURE2D_UNSUPPORTEDFORMAT = 92,
	CREATETEXTURE2D_INVALIDSAMPLES = 93,
	CREATETEXTURE2D_UNRECOGNIZEDUSAGE = 94,
	CREATETEXTURE2D_UNRECOGNIZEDBINDFLAGS = 95,
	CREATETEXTURE2D_UNRECOGNIZEDCPUACCESSFLAGS = 96,
	CREATETEXTURE2D_UNRECOGNIZEDMISCFLAGS = 97,
	CREATETEXTURE2D_INVALIDCPUACCESSFLAGS = 98,
	CREATETEXTURE2D_INVALIDBINDFLAGS = 99,
	CREATETEXTURE2D_INVALIDINITIALDATA = 100,
	CREATETEXTURE2D_INVALIDDIMENSIONS = 101,
	CREATETEXTURE2D_INVALIDMIPLEVELS = 102,
	CREATETEXTURE2D_INVALIDMISCFLAGS = 103,
	CREATETEXTURE2D_INVALIDARG_RETURN = 104,
	CREATETEXTURE2D_OUTOFMEMORY_RETURN = 105,
	CREATETEXTURE2D_NULLDESC = 106,
	CREATETEXTURE2D_LARGEALLOCATION = 107,
	CREATETEXTURE3D_UNRECOGNIZEDFORMAT = 108,
	CREATETEXTURE3D_UNSUPPORTEDFORMAT = 109,
	CREATETEXTURE3D_INVALIDSAMPLES = 110,
	CREATETEXTURE3D_UNRECOGNIZEDUSAGE = 111,
	CREATETEXTURE3D_UNRECOGNIZEDBINDFLAGS = 112,
	CREATETEXTURE3D_UNRECOGNIZEDCPUACCESSFLAGS = 113,
	CREATETEXTURE3D_UNRECOGNIZEDMISCFLAGS = 114,
	CREATETEXTURE3D_INVALIDCPUACCESSFLAGS = 115,
	CREATETEXTURE3D_INVALIDBINDFLAGS = 116,
	CREATETEXTURE3D_INVALIDINITIALDATA = 117,
	CREATETEXTURE3D_INVALIDDIMENSIONS = 118,
	CREATETEXTURE3D_INVALIDMIPLEVELS = 119,
	CREATETEXTURE3D_INVALIDMISCFLAGS = 120,
	CREATETEXTURE3D_INVALIDARG_RETURN = 121,
	CREATETEXTURE3D_OUTOFMEMORY_RETURN = 122,
	CREATETEXTURE3D_NULLDESC = 123,
	CREATETEXTURE3D_LARGEALLOCATION = 124,
	CREATESHADERRESOURCEVIEW_UNRECOGNIZEDFORMAT = 125,
	CREATESHADERRESOURCEVIEW_INVALIDDESC = 126,
	CREATESHADERRESOURCEVIEW_INVALIDFORMAT = 127,
	CREATESHADERRESOURCEVIEW_INVALIDDIMENSIONS = 128,
	CREATESHADERRESOURCEVIEW_INVALIDRESOURCE = 129,
	CREATESHADERRESOURCEVIEW_TOOMANYOBJECTS = 130,
	CREATESHADERRESOURCEVIEW_INVALIDARG_RETURN = 131,
	CREATESHADERRESOURCEVIEW_OUTOFMEMORY_RETURN = 132,
	CREATERENDERTARGETVIEW_UNRECOGNIZEDFORMAT = 133,
	CREATERENDERTARGETVIEW_UNSUPPORTEDFORMAT = 134,
	CREATERENDERTARGETVIEW_INVALIDDESC = 135,
	CREATERENDERTARGETVIEW_INVALIDFORMAT = 136,
	CREATERENDERTARGETVIEW_INVALIDDIMENSIONS = 137,
	CREATERENDERTARGETVIEW_INVALIDRESOURCE = 138,
	CREATERENDERTARGETVIEW_TOOMANYOBJECTS = 139,
	CREATERENDERTARGETVIEW_INVALIDARG_RETURN = 140,
	CREATERENDERTARGETVIEW_OUTOFMEMORY_RETURN = 141,
	CREATEDEPTHSTENCILVIEW_UNRECOGNIZEDFORMAT = 142,
	CREATEDEPTHSTENCILVIEW_INVALIDDESC = 143,
	CREATEDEPTHSTENCILVIEW_INVALIDFORMAT = 144,
	CREATEDEPTHSTENCILVIEW_INVALIDDIMENSIONS = 145,
	CREATEDEPTHSTENCILVIEW_INVALIDRESOURCE = 146,
	CREATEDEPTHSTENCILVIEW_TOOMANYOBJECTS = 147,
	CREATEDEPTHSTENCILVIEW_INVALIDARG_RETURN = 148,
	CREATEDEPTHSTENCILVIEW_OUTOFMEMORY_RETURN = 149,
	CREATEINPUTLAYOUT_OUTOFMEMORY = 150,
	CREATEINPUTLAYOUT_TOOMANYELEMENTS = 151,
	CREATEINPUTLAYOUT_INVALIDFORMAT = 152,
	CREATEINPUTLAYOUT_INCOMPATIBLEFORMAT = 153,
	CREATEINPUTLAYOUT_INVALIDSLOT = 154,
	CREATEINPUTLAYOUT_INVALIDINPUTSLOTCLASS = 155,
	CREATEINPUTLAYOUT_STEPRATESLOTCLASSMISMATCH = 156,
	CREATEINPUTLAYOUT_INVALIDSLOTCLASSCHANGE = 157,
	CREATEINPUTLAYOUT_INVALIDSTEPRATECHANGE = 158,
	CREATEINPUTLAYOUT_INVALIDALIGNMENT = 159,
	CREATEINPUTLAYOUT_DUPLICATESEMANTIC = 160,
	CREATEINPUTLAYOUT_UNPARSEABLEINPUTSIGNATURE = 161,
	CREATEINPUTLAYOUT_NULLSEMANTIC = 162,
	CREATEINPUTLAYOUT_MISSINGELEMENT = 163,
	CREATEINPUTLAYOUT_NULLDESC = 164,
	CREATEVERTEXSHADER_OUTOFMEMORY = 165,
	CREATEVERTEXSHADER_INVALIDSHADERBYTECODE = 166,
	CREATEVERTEXSHADER_INVALIDSHADERTYPE = 167,
	CREATEGEOMETRYSHADER_OUTOFMEMORY = 168,
	CREATEGEOMETRYSHADER_INVALIDSHADERBYTECODE = 169,
	CREATEGEOMETRYSHADER_INVALIDSHADERTYPE = 170,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTOFMEMORY = 171,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERBYTECODE = 172,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE = 173,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMENTRIES = 174,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSTREAMSTRIDEUNUSED = 175,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDDECL = 176,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_EXPECTEDDECL = 177,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSLOT0EXPECTED = 178,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSLOT = 179,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_ONLYONEELEMENTPERSLOT = 180,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDCOMPONENTCOUNT = 181,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTARTCOMPONENTANDCOMPONENTCOUNT = 182,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDGAPDEFINITION = 183,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_REPEATEDOUTPUT = 184,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSTREAMSTRIDE = 185,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGSEMANTIC = 186,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MASKMISMATCH = 187,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_CANTHAVEONLYGAPS = 188,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DECLTOOCOMPLEX = 189,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGOUTPUTSIGNATURE = 190,
	CREATEPIXELSHADER_OUTOFMEMORY = 191,
	CREATEPIXELSHADER_INVALIDSHADERBYTECODE = 192,
	CREATEPIXELSHADER_INVALIDSHADERTYPE = 193,
	CREATERASTERIZERSTATE_INVALIDFILLMODE = 194,
	CREATERASTERIZERSTATE_INVALIDCULLMODE = 195,
	CREATERASTERIZERSTATE_INVALIDDEPTHBIASCLAMP = 196,
	CREATERASTERIZERSTATE_INVALIDSLOPESCALEDDEPTHBIAS = 197,
	CREATERASTERIZERSTATE_TOOMANYOBJECTS = 198,
	CREATERASTERIZERSTATE_NULLDESC = 199,
	CREATEDEPTHSTENCILSTATE_INVALIDDEPTHWRITEMASK = 200,
	CREATEDEPTHSTENCILSTATE_INVALIDDEPTHFUNC = 201,
	CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFAILOP = 202,
	CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILZFAILOP = 203,
	CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILPASSOP = 204,
	CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFUNC = 205,
	CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFAILOP = 206,
	CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILZFAILOP = 207,
	CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILPASSOP = 208,
	CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFUNC = 209,
	CREATEDEPTHSTENCILSTATE_TOOMANYOBJECTS = 210,
	CREATEDEPTHSTENCILSTATE_NULLDESC = 211,
	CREATEBLENDSTATE_INVALIDSRCBLEND = 212,
	CREATEBLENDSTATE_INVALIDDESTBLEND = 213,
	CREATEBLENDSTATE_INVALIDBLENDOP = 214,
	CREATEBLENDSTATE_INVALIDSRCBLENDALPHA = 215,
	CREATEBLENDSTATE_INVALIDDESTBLENDALPHA = 216,
	CREATEBLENDSTATE_INVALIDBLENDOPALPHA = 217,
	CREATEBLENDSTATE_INVALIDRENDERTARGETWRITEMASK = 218,
	CREATEBLENDSTATE_TOOMANYOBJECTS = 219,
	CREATEBLENDSTATE_NULLDESC = 220,
	CREATESAMPLERSTATE_INVALIDFILTER = 221,
	CREATESAMPLERSTATE_INVALIDADDRESSU = 222,
	CREATESAMPLERSTATE_INVALIDADDRESSV = 223,
	CREATESAMPLERSTATE_INVALIDADDRESSW = 224,
	CREATESAMPLERSTATE_INVALIDMIPLODBIAS = 225,
	CREATESAMPLERSTATE_INVALIDMAXANISOTROPY = 226,
	CREATESAMPLERSTATE_INVALIDCOMPARISONFUNC = 227,
	CREATESAMPLERSTATE_INVALIDMINLOD = 228,
	CREATESAMPLERSTATE_INVALIDMAXLOD = 229,
	CREATESAMPLERSTATE_TOOMANYOBJECTS = 230,
	CREATESAMPLERSTATE_NULLDESC = 231,
	CREATEQUERYORPREDICATE_INVALIDQUERY = 232,
	CREATEQUERYORPREDICATE_INVALIDMISCFLAGS = 233,
	CREATEQUERYORPREDICATE_UNEXPECTEDMISCFLAG = 234,
	CREATEQUERYORPREDICATE_NULLDESC = 235,
	DEVICE_IASETPRIMITIVETOPOLOGY_TOPOLOGY_UNRECOGNIZED = 236,
	DEVICE_IASETPRIMITIVETOPOLOGY_TOPOLOGY_UNDEFINED = 237,
	IASETVERTEXBUFFERS_INVALIDBUFFER = 238,
	DEVICE_IASETVERTEXBUFFERS_OFFSET_TOO_LARGE = 239,
	DEVICE_IASETVERTEXBUFFERS_BUFFERS_EMPTY = 240,
	IASETINDEXBUFFER_INVALIDBUFFER = 241,
	DEVICE_IASETINDEXBUFFER_FORMAT_INVALID = 242,
	DEVICE_IASETINDEXBUFFER_OFFSET_TOO_LARGE = 243,
	DEVICE_IASETINDEXBUFFER_OFFSET_UNALIGNED = 244,
	DEVICE_VSSETSHADERRESOURCES_VIEWS_EMPTY = 245,
	VSSETCONSTANTBUFFERS_INVALIDBUFFER = 246,
	DEVICE_VSSETCONSTANTBUFFERS_BUFFERS_EMPTY = 247,
	DEVICE_VSSETSAMPLERS_SAMPLERS_EMPTY = 248,
	DEVICE_GSSETSHADERRESOURCES_VIEWS_EMPTY = 249,
	GSSETCONSTANTBUFFERS_INVALIDBUFFER = 250,
	DEVICE_GSSETCONSTANTBUFFERS_BUFFERS_EMPTY = 251,
	DEVICE_GSSETSAMPLERS_SAMPLERS_EMPTY = 252,
	SOSETTARGETS_INVALIDBUFFER = 253,
	DEVICE_SOSETTARGETS_OFFSET_UNALIGNED = 254,
	DEVICE_PSSETSHADERRESOURCES_VIEWS_EMPTY = 255,
	PSSETCONSTANTBUFFERS_INVALIDBUFFER = 256,
	DEVICE_PSSETCONSTANTBUFFERS_BUFFERS_EMPTY = 257,
	DEVICE_PSSETSAMPLERS_SAMPLERS_EMPTY = 258,
	DEVICE_RSSETVIEWPORTS_INVALIDVIEWPORT = 259,
	DEVICE_RSSETSCISSORRECTS_INVALIDSCISSOR = 260,
	CLEARRENDERTARGETVIEW_DENORMFLUSH = 261,
	CLEARDEPTHSTENCILVIEW_DENORMFLUSH = 262,
	CLEARDEPTHSTENCILVIEW_INVALID = 263,
	DEVICE_IAGETVERTEXBUFFERS_BUFFERS_EMPTY = 264,
	DEVICE_VSGETSHADERRESOURCES_VIEWS_EMPTY = 265,
	DEVICE_VSGETCONSTANTBUFFERS_BUFFERS_EMPTY = 266,
	DEVICE_VSGETSAMPLERS_SAMPLERS_EMPTY = 267,
	DEVICE_GSGETSHADERRESOURCES_VIEWS_EMPTY = 268,
	DEVICE_GSGETCONSTANTBUFFERS_BUFFERS_EMPTY = 269,
	DEVICE_GSGETSAMPLERS_SAMPLERS_EMPTY = 270,
	DEVICE_SOGETTARGETS_BUFFERS_EMPTY = 271,
	DEVICE_PSGETSHADERRESOURCES_VIEWS_EMPTY = 272,
	DEVICE_PSGETCONSTANTBUFFERS_BUFFERS_EMPTY = 273,
	DEVICE_PSGETSAMPLERS_SAMPLERS_EMPTY = 274,
	DEVICE_RSGETVIEWPORTS_VIEWPORTS_EMPTY = 275,
	DEVICE_RSGETSCISSORRECTS_RECTS_EMPTY = 276,
	DEVICE_GENERATEMIPS_RESOURCE_INVALID = 277,
	COPYSUBRESOURCEREGION_INVALIDDESTINATIONSUBRESOURCE = 278,
	COPYSUBRESOURCEREGION_INVALIDSOURCESUBRESOURCE = 279,
	COPYSUBRESOURCEREGION_INVALIDSOURCEBOX = 280,
	COPYSUBRESOURCEREGION_INVALIDSOURCE = 281,
	COPYSUBRESOURCEREGION_INVALIDDESTINATIONSTATE = 282,
	COPYSUBRESOURCEREGION_INVALIDSOURCESTATE = 283,
	COPYRESOURCE_INVALIDSOURCE = 284,
	COPYRESOURCE_INVALIDDESTINATIONSTATE = 285,
	COPYRESOURCE_INVALIDSOURCESTATE = 286,
	UPDATESUBRESOURCE_INVALIDDESTINATIONSUBRESOURCE = 287,
	UPDATESUBRESOURCE_INVALIDDESTINATIONBOX = 288,
	UPDATESUBRESOURCE_INVALIDDESTINATIONSTATE = 289,
	DEVICE_RESOLVESUBRESOURCE_DESTINATION_INVALID = 290,
	DEVICE_RESOLVESUBRESOURCE_DESTINATION_SUBRESOURCE_INVALID = 291,
	DEVICE_RESOLVESUBRESOURCE_SOURCE_INVALID = 292,
	DEVICE_RESOLVESUBRESOURCE_SOURCE_SUBRESOURCE_INVALID = 293,
	DEVICE_RESOLVESUBRESOURCE_FORMAT_INVALID = 294,
	BUFFER_MAP_INVALIDMAPTYPE = 295,
	BUFFER_MAP_INVALIDFLAGS = 296,
	BUFFER_MAP_ALREADYMAPPED = 297,
	BUFFER_MAP_DEVICEREMOVED_RETURN = 298,
	BUFFER_UNMAP_NOTMAPPED = 299,
	TEXTURE1D_MAP_INVALIDMAPTYPE = 300,
	TEXTURE1D_MAP_INVALIDSUBRESOURCE = 301,
	TEXTURE1D_MAP_INVALIDFLAGS = 302,
	TEXTURE1D_MAP_ALREADYMAPPED = 303,
	TEXTURE1D_MAP_DEVICEREMOVED_RETURN = 304,
	TEXTURE1D_UNMAP_INVALIDSUBRESOURCE = 305,
	TEXTURE1D_UNMAP_NOTMAPPED = 306,
	TEXTURE2D_MAP_INVALIDMAPTYPE = 307,
	TEXTURE2D_MAP_INVALIDSUBRESOURCE = 308,
	TEXTURE2D_MAP_INVALIDFLAGS = 309,
	TEXTURE2D_MAP_ALREADYMAPPED = 310,
	TEXTURE2D_MAP_DEVICEREMOVED_RETURN = 311,
	TEXTURE2D_UNMAP_INVALIDSUBRESOURCE = 312,
	TEXTURE2D_UNMAP_NOTMAPPED = 313,
	TEXTURE3D_MAP_INVALIDMAPTYPE = 314,
	TEXTURE3D_MAP_INVALIDSUBRESOURCE = 315,
	TEXTURE3D_MAP_INVALIDFLAGS = 316,
	TEXTURE3D_MAP_ALREADYMAPPED = 317,
	TEXTURE3D_MAP_DEVICEREMOVED_RETURN = 318,
	TEXTURE3D_UNMAP_INVALIDSUBRESOURCE = 319,
	TEXTURE3D_UNMAP_NOTMAPPED = 320,
	CHECKFORMATSUPPORT_FORMAT_DEPRECATED = 321,
	CHECKMULTISAMPLEQUALITYLEVELS_FORMAT_DEPRECATED = 322,
	SETEXCEPTIONMODE_UNRECOGNIZEDFLAGS = 323,
	SETEXCEPTIONMODE_INVALIDARG_RETURN = 324,
	SETEXCEPTIONMODE_DEVICEREMOVED_RETURN = 325,
	REF_SIMULATING_INFINITELY_FAST_HARDWARE = 326,
	REF_THREADING_MODE = 327,
	REF_UMDRIVER_EXCEPTION = 328,
	REF_KMDRIVER_EXCEPTION = 329,
	REF_HARDWARE_EXCEPTION = 330,
	REF_ACCESSING_INDEXABLE_TEMP_OUT_OF_RANGE = 331,
	REF_PROBLEM_PARSING_SHADER = 332,
	REF_OUT_OF_MEMORY = 333,
	REF_INFO = 334,
	DEVICE_DRAW_VERTEXPOS_OVERFLOW = 335,
	DEVICE_DRAWINDEXED_INDEXPOS_OVERFLOW = 336,
	DEVICE_DRAWINSTANCED_VERTEXPOS_OVERFLOW = 337,
	DEVICE_DRAWINSTANCED_INSTANCEPOS_OVERFLOW = 338,
	DEVICE_DRAWINDEXEDINSTANCED_INSTANCEPOS_OVERFLOW = 339,
	DEVICE_DRAWINDEXEDINSTANCED_INDEXPOS_OVERFLOW = 340,
	DEVICE_DRAW_VERTEX_SHADER_NOT_SET = 341,
	DEVICE_SHADER_LINKAGE_SEMANTICNAME_NOT_FOUND = 342,
	DEVICE_SHADER_LINKAGE_REGISTERINDEX = 343,
	DEVICE_SHADER_LINKAGE_COMPONENTTYPE = 344,
	DEVICE_SHADER_LINKAGE_REGISTERMASK = 345,
	DEVICE_SHADER_LINKAGE_SYSTEMVALUE = 346,
	DEVICE_SHADER_LINKAGE_NEVERWRITTEN_ALWAYSREADS = 347,
	DEVICE_DRAW_VERTEX_BUFFER_NOT_SET = 348,
	DEVICE_DRAW_INPUTLAYOUT_NOT_SET = 349,
	DEVICE_DRAW_CONSTANT_BUFFER_NOT_SET = 350,
	DEVICE_DRAW_CONSTANT_BUFFER_TOO_SMALL = 351,
	DEVICE_DRAW_SAMPLER_NOT_SET = 352,
	DEVICE_DRAW_SHADERRESOURCEVIEW_NOT_SET = 353,
	DEVICE_DRAW_VIEW_DIMENSION_MISMATCH = 354,
	DEVICE_DRAW_VERTEX_BUFFER_STRIDE_TOO_SMALL = 355,
	DEVICE_DRAW_VERTEX_BUFFER_TOO_SMALL = 356,
	DEVICE_DRAW_INDEX_BUFFER_NOT_SET = 357,
	DEVICE_DRAW_INDEX_BUFFER_FORMAT_INVALID = 358,
	DEVICE_DRAW_INDEX_BUFFER_TOO_SMALL = 359,
	DEVICE_DRAW_GS_INPUT_PRIMITIVE_MISMATCH = 360,
	DEVICE_DRAW_RESOURCE_RETURN_TYPE_MISMATCH = 361,
	DEVICE_DRAW_POSITION_NOT_PRESENT = 362,
	DEVICE_DRAW_OUTPUT_STREAM_NOT_SET = 363,
	DEVICE_DRAW_BOUND_RESOURCE_MAPPED = 364,
	DEVICE_DRAW_INVALID_PRIMITIVETOPOLOGY = 365,
	DEVICE_DRAW_VERTEX_OFFSET_UNALIGNED = 366,
	DEVICE_DRAW_VERTEX_STRIDE_UNALIGNED = 367,
	DEVICE_DRAW_INDEX_OFFSET_UNALIGNED = 368,
	DEVICE_DRAW_OUTPUT_STREAM_OFFSET_UNALIGNED = 369,
	DEVICE_DRAW_RESOURCE_FORMAT_LD_UNSUPPORTED = 370,
	DEVICE_DRAW_RESOURCE_FORMAT_SAMPLE_UNSUPPORTED = 371,
	DEVICE_DRAW_RESOURCE_FORMAT_SAMPLE_C_UNSUPPORTED = 372,
	DEVICE_DRAW_RESOURCE_MULTISAMPLE_UNSUPPORTED = 373,
	DEVICE_DRAW_SO_TARGETS_BOUND_WITHOUT_SOURCE = 374,
	DEVICE_DRAW_SO_STRIDE_LARGER_THAN_BUFFER = 375,
	DEVICE_DRAW_OM_RENDER_TARGET_DOES_NOT_SUPPORT_BLENDING = 376,
	DEVICE_DRAW_OM_DUAL_SOURCE_BLENDING_CAN_ONLY_HAVE_RENDER_TARGET_0 = 377,
	DEVICE_REMOVAL_PROCESS_AT_FAULT = 378,
	DEVICE_REMOVAL_PROCESS_POSSIBLY_AT_FAULT = 379,
	DEVICE_REMOVAL_PROCESS_NOT_AT_FAULT = 380,
	DEVICE_OPEN_SHARED_RESOURCE_INVALIDARG_RETURN = 381,
	DEVICE_OPEN_SHARED_RESOURCE_OUTOFMEMORY_RETURN = 382,
	DEVICE_OPEN_SHARED_RESOURCE_BADINTERFACE_RETURN = 383,
	DEVICE_DRAW_VIEWPORT_NOT_SET = 384,
	CREATEINPUTLAYOUT_TRAILING_DIGIT_IN_SEMANTIC = 385,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_TRAILING_DIGIT_IN_SEMANTIC = 386,
	DEVICE_RSSETVIEWPORTS_DENORMFLUSH = 387,
	OMSETRENDERTARGETS_INVALIDVIEW = 388,
	DEVICE_SETTEXTFILTERSIZE_INVALIDDIMENSIONS = 389,
	DEVICE_DRAW_SAMPLER_MISMATCH = 390,
	CREATEINPUTLAYOUT_TYPE_MISMATCH = 391,
	BLENDSTATE_GETDESC_LEGACY = 392,
	SHADERRESOURCEVIEW_GETDESC_LEGACY = 393,
	CREATEQUERY_OUTOFMEMORY_RETURN = 394,
	CREATEPREDICATE_OUTOFMEMORY_RETURN = 395,
	CREATECOUNTER_OUTOFRANGE_COUNTER = 396,
	CREATECOUNTER_SIMULTANEOUS_ACTIVE_COUNTERS_EXHAUSTED = 397,
	CREATECOUNTER_UNSUPPORTED_WELLKNOWN_COUNTER = 398,
	CREATECOUNTER_OUTOFMEMORY_RETURN = 399,
	CREATECOUNTER_NONEXCLUSIVE_RETURN = 400,
	CREATECOUNTER_NULLDESC = 401,
	CHECKCOUNTER_OUTOFRANGE_COUNTER = 402,
	CHECKCOUNTER_UNSUPPORTED_WELLKNOWN_COUNTER = 403,
	SETPREDICATION_INVALID_PREDICATE_STATE = 404,
	QUERY_BEGIN_UNSUPPORTED = 405,
	PREDICATE_BEGIN_DURING_PREDICATION = 406,
	QUERY_BEGIN_DUPLICATE = 407,
	QUERY_BEGIN_ABANDONING_PREVIOUS_RESULTS = 408,
	PREDICATE_END_DURING_PREDICATION = 409,
	QUERY_END_ABANDONING_PREVIOUS_RESULTS = 410,
	QUERY_END_WITHOUT_BEGIN = 411,
	QUERY_GETDATA_INVALID_DATASIZE = 412,
	QUERY_GETDATA_INVALID_FLAGS = 413,
	QUERY_GETDATA_INVALID_CALL = 414,
	DEVICE_DRAW_PS_OUTPUT_TYPE_MISMATCH = 415,
	DEVICE_DRAW_RESOURCE_FORMAT_GATHER_UNSUPPORTED = 416,
	DEVICE_DRAW_INVALID_USE_OF_CENTER_MULTISAMPLE_PATTERN = 417,
	DEVICE_IASETVERTEXBUFFERS_STRIDE_TOO_LARGE = 418,
	DEVICE_IASETVERTEXBUFFERS_INVALIDRANGE = 419,
	CREATEINPUTLAYOUT_EMPTY_LAYOUT = 420,
	DEVICE_DRAW_RESOURCE_SAMPLE_COUNT_MISMATCH = 421,
	LIVE_OBJECT_SUMMARY = 422,
	LIVE_BUFFER = 423,
	LIVE_TEXTURE1D = 424,
	LIVE_TEXTURE2D = 425,
	LIVE_TEXTURE3D = 426,
	LIVE_SHADERRESOURCEVIEW = 427,
	LIVE_RENDERTARGETVIEW = 428,
	LIVE_DEPTHSTENCILVIEW = 429,
	LIVE_VERTEXSHADER = 430,
	LIVE_GEOMETRYSHADER = 431,
	LIVE_PIXELSHADER = 432,
	LIVE_INPUTLAYOUT = 433,
	LIVE_SAMPLER = 434,
	LIVE_BLENDSTATE = 435,
	LIVE_DEPTHSTENCILSTATE = 436,
	LIVE_RASTERIZERSTATE = 437,
	LIVE_QUERY = 438,
	LIVE_PREDICATE = 439,
	LIVE_COUNTER = 440,
	LIVE_DEVICE = 441,
	LIVE_SWAPCHAIN = 442,
	D3D10_MESSAGES_END = 443,
	D3D10L9_MESSAGES_START = 1048576,
	CREATEDEPTHSTENCILSTATE_STENCIL_NO_TWO_SIDED = 1048577,
	CREATERASTERIZERSTATE_DepthBiasClamp_NOT_SUPPORTED = 1048578,
	CREATESAMPLERSTATE_NO_COMPARISON_SUPPORT = 1048579,
	CREATESAMPLERSTATE_EXCESSIVE_ANISOTROPY = 1048580,
	CREATESAMPLERSTATE_BORDER_OUT_OF_RANGE = 1048581,
	VSSETSAMPLERS_NOT_SUPPORTED = 1048582,
	VSSETSAMPLERS_TOO_MANY_SAMPLERS = 1048583,
	PSSETSAMPLERS_TOO_MANY_SAMPLERS = 1048584,
	CREATERESOURCE_NO_ARRAYS = 1048585,
	CREATERESOURCE_NO_VB_AND_IB_BIND = 1048586,
	CREATERESOURCE_NO_TEXTURE_1D = 1048587,
	CREATERESOURCE_DIMENSION_OUT_OF_RANGE = 1048588,
	CREATERESOURCE_NOT_BINDABLE_AS_SHADER_RESOURCE = 1048589,
	OMSETRENDERTARGETS_TOO_MANY_RENDER_TARGETS = 1048590,
	OMSETRENDERTARGETS_NO_DIFFERING_BIT_DEPTHS = 1048591,
	IASETVERTEXBUFFERS_BAD_BUFFER_INDEX = 1048592,
	DEVICE_RSSETVIEWPORTS_TOO_MANY_VIEWPORTS = 1048593,
	DEVICE_IASETPRIMITIVETOPOLOGY_ADJACENCY_UNSUPPORTED = 1048594,
	DEVICE_RSSETSCISSORRECTS_TOO_MANY_SCISSORS = 1048595,
	COPYRESOURCE_ONLY_TEXTURE_2D_WITHIN_GPU_MEMORY = 1048596,
	COPYRESOURCE_NO_TEXTURE_3D_READBACK = 1048597,
	COPYRESOURCE_NO_TEXTURE_ONLY_READBACK = 1048598,
	CREATEINPUTLAYOUT_UNSUPPORTED_FORMAT = 1048599,
	CREATEBLENDSTATE_NO_ALPHA_TO_COVERAGE = 1048600,
	CREATERASTERIZERSTATE_DepthClipEnable_MUST_BE_TRUE = 1048601,
	DRAWINDEXED_STARTINDEXLOCATION_MUST_BE_POSITIVE = 1048602,
	CREATESHADERRESOURCEVIEW_MUST_USE_LOWEST_LOD = 1048603,
	CREATESAMPLERSTATE_MINLOD_MUST_NOT_BE_FRACTIONAL = 1048604,
	CREATESAMPLERSTATE_MAXLOD_MUST_BE_FLT_MAX = 1048605,
	CREATESHADERRESOURCEVIEW_FIRSTARRAYSLICE_MUST_BE_ZERO = 1048606,
	CREATESHADERRESOURCEVIEW_CUBES_MUST_HAVE_6_SIDES = 1048607,
	CREATERESOURCE_NOT_BINDABLE_AS_RENDER_TARGET = 1048608,
	CREATERESOURCE_NO_DWORD_INDEX_BUFFER = 1048609,
	CREATERESOURCE_MSAA_PRECLUDES_SHADER_RESOURCE = 1048610,
	CREATERESOURCE_PRESENTATION_PRECLUDES_SHADER_RESOURCE = 1048611,
	CREATEBLENDSTATE_NO_INDEPENDENT_BLEND_ENABLE = 1048612,
	CREATEBLENDSTATE_NO_INDEPENDENT_WRITE_MASKS = 1048613,
	CREATERESOURCE_NO_STREAM_OUT = 1048614,
	CREATERESOURCE_ONLY_VB_IB_FOR_BUFFERS = 1048615,
	CREATERESOURCE_NO_AUTOGEN_FOR_VOLUMES = 1048616,
	CREATERESOURCE_DXGI_FORMAT_R8G8B8A8_CANNOT_BE_SHARED = 1048617,
	VSSHADERRESOURCES_NOT_SUPPORTED = 1048618,
	GEOMETRY_SHADER_NOT_SUPPORTED = 1048619,
	STREAM_OUT_NOT_SUPPORTED = 1048620,
	TEXT_FILTER_NOT_SUPPORTED = 1048621,
	CREATEBLENDSTATE_NO_SEPARATE_ALPHA_BLEND = 1048622,
	CREATEBLENDSTATE_NO_MRT_BLEND = 1048623,
	CREATEBLENDSTATE_OPERATION_NOT_SUPPORTED = 1048624,
	CREATESAMPLERSTATE_NO_MIRRORONCE = 1048625,
	DRAWINSTANCED_NOT_SUPPORTED = 1048626,
	DRAWINDEXEDINSTANCED_NOT_SUPPORTED_BELOW_9_3 = 1048627,
	DRAWINDEXED_POINTLIST_UNSUPPORTED = 1048628,
	SETBLENDSTATE_SAMPLE_MASK_CANNOT_BE_ZERO = 1048629,
	CREATERESOURCE_DIMENSION_EXCEEDS_FEATURE_LEVEL_DEFINITION = 1048630,
	CREATERESOURCE_ONLY_SINGLE_MIP_LEVEL_DEPTH_STENCIL_SUPPORTED = 1048631,
	DEVICE_RSSETSCISSORRECTS_NEGATIVESCISSOR = 1048632,
	SLOT_ZERO_MUST_BE_D3D10_INPUT_PER_VERTEX_DATA = 1048633,
	CREATERESOURCE_NON_POW_2_MIPMAP = 1048634,
	CREATESAMPLERSTATE_BORDER_NOT_SUPPORTED = 1048635,
	OMSETRENDERTARGETS_NO_SRGB_MRT = 1048636,
	COPYRESOURCE_NO_3D_MISMATCHED_UPDATES = 1048637,
	D3D10L9_MESSAGES_END = 1048638,
	D3D11_MESSAGES_START = 2097152,
	CREATEDEPTHSTENCILVIEW_INVALIDFLAGS = 2097153,
	CREATEVERTEXSHADER_INVALIDCLASSLINKAGE = 2097154,
	CREATEGEOMETRYSHADER_INVALIDCLASSLINKAGE = 2097155,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMSTREAMS = 2097156,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAMTORASTERIZER = 2097157,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDSTREAMS = 2097158,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDCLASSLINKAGE = 2097159,
	CREATEPIXELSHADER_INVALIDCLASSLINKAGE = 2097160,
	CREATEDEFERREDCONTEXT_INVALID_COMMANDLISTFLAGS = 2097161,
	CREATEDEFERREDCONTEXT_SINGLETHREADED = 2097162,
	CREATEDEFERREDCONTEXT_INVALIDARG_RETURN = 2097163,
	CREATEDEFERREDCONTEXT_INVALID_CALL_RETURN = 2097164,
	CREATEDEFERREDCONTEXT_OUTOFMEMORY_RETURN = 2097165,
	FINISHDISPLAYLIST_ONIMMEDIATECONTEXT = 2097166,
	FINISHDISPLAYLIST_OUTOFMEMORY_RETURN = 2097167,
	FINISHDISPLAYLIST_INVALID_CALL_RETURN = 2097168,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTREAM = 2097169,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDENTRIES = 2097170,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDSTRIDES = 2097171,
	CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMSTRIDES = 2097172,
	DEVICE_HSSETSHADERRESOURCES_HAZARD = 2097173,
	DEVICE_HSSETCONSTANTBUFFERS_HAZARD = 2097174,
	HSSETSHADERRESOURCES_UNBINDDELETINGOBJECT = 2097175,
	HSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT = 2097176,
	CREATEHULLSHADER_INVALIDCALL = 2097177,
	CREATEHULLSHADER_OUTOFMEMORY = 2097178,
	CREATEHULLSHADER_INVALIDSHADERBYTECODE = 2097179,
	CREATEHULLSHADER_INVALIDSHADERTYPE = 2097180,
	CREATEHULLSHADER_INVALIDCLASSLINKAGE = 2097181,
	DEVICE_HSSETSHADERRESOURCES_VIEWS_EMPTY = 2097182,
	HSSETCONSTANTBUFFERS_INVALIDBUFFER = 2097183,
	DEVICE_HSSETCONSTANTBUFFERS_BUFFERS_EMPTY = 2097184,
	DEVICE_HSSETSAMPLERS_SAMPLERS_EMPTY = 2097185,
	DEVICE_HSGETSHADERRESOURCES_VIEWS_EMPTY = 2097186,
	DEVICE_HSGETCONSTANTBUFFERS_BUFFERS_EMPTY = 2097187,
	DEVICE_HSGETSAMPLERS_SAMPLERS_EMPTY = 2097188,
	DEVICE_DSSETSHADERRESOURCES_HAZARD = 2097189,
	DEVICE_DSSETCONSTANTBUFFERS_HAZARD = 2097190,
	DSSETSHADERRESOURCES_UNBINDDELETINGOBJECT = 2097191,
	DSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT = 2097192,
	CREATEDOMAINSHADER_INVALIDCALL = 2097193,
	CREATEDOMAINSHADER_OUTOFMEMORY = 2097194,
	CREATEDOMAINSHADER_INVALIDSHADERBYTECODE = 2097195,
	CREATEDOMAINSHADER_INVALIDSHADERTYPE = 2097196,
	CREATEDOMAINSHADER_INVALIDCLASSLINKAGE = 2097197,
	DEVICE_DSSETSHADERRESOURCES_VIEWS_EMPTY = 2097198,
	DSSETCONSTANTBUFFERS_INVALIDBUFFER = 2097199,
	DEVICE_DSSETCONSTANTBUFFERS_BUFFERS_EMPTY = 2097200,
	DEVICE_DSSETSAMPLERS_SAMPLERS_EMPTY = 2097201,
	DEVICE_DSGETSHADERRESOURCES_VIEWS_EMPTY = 2097202,
	DEVICE_DSGETCONSTANTBUFFERS_BUFFERS_EMPTY = 2097203,
	DEVICE_DSGETSAMPLERS_SAMPLERS_EMPTY = 2097204,
	DEVICE_DRAW_HS_XOR_DS_MISMATCH = 2097205,
	DEFERRED_CONTEXT_REMOVAL_PROCESS_AT_FAULT = 2097206,
	DEVICE_DRAWINDIRECT_INVALID_ARG_BUFFER = 2097207,
	DEVICE_DRAWINDIRECT_OFFSET_UNALIGNED = 2097208,
	DEVICE_DRAWINDIRECT_OFFSET_OVERFLOW = 2097209,
	RESOURCE_MAP_INVALIDMAPTYPE = 2097210,
	RESOURCE_MAP_INVALIDSUBRESOURCE = 2097211,
	RESOURCE_MAP_INVALIDFLAGS = 2097212,
	RESOURCE_MAP_ALREADYMAPPED = 2097213,
	RESOURCE_MAP_DEVICEREMOVED_RETURN = 2097214,
	RESOURCE_MAP_OUTOFMEMORY_RETURN = 2097215,
	RESOURCE_MAP_WITHOUT_INITIAL_DISCARD = 2097216,
	RESOURCE_UNMAP_INVALIDSUBRESOURCE = 2097217,
	RESOURCE_UNMAP_NOTMAPPED = 2097218,
	DEVICE_DRAW_RASTERIZING_CONTROL_POINTS = 2097219,
	DEVICE_IASETPRIMITIVETOPOLOGY_TOPOLOGY_UNSUPPORTED = 2097220,
	DEVICE_DRAW_HS_DS_SIGNATURE_MISMATCH = 2097221,
	DEVICE_DRAW_HULL_SHADER_INPUT_TOPOLOGY_MISMATCH = 2097222,
	DEVICE_DRAW_HS_DS_CONTROL_POINT_COUNT_MISMATCH = 2097223,
	DEVICE_DRAW_HS_DS_TESSELLATOR_DOMAIN_MISMATCH = 2097224,
	CREATE_CONTEXT = 2097225,
	LIVE_CONTEXT = 2097226,
	DESTROY_CONTEXT = 2097227,
	CREATE_BUFFER = 2097228,
	LIVE_BUFFER_WIN7 = 2097229,
	DESTROY_BUFFER = 2097230,
	CREATE_TEXTURE1D = 2097231,
	LIVE_TEXTURE1D_WIN7 = 2097232,
	DESTROY_TEXTURE1D = 2097233,
	CREATE_TEXTURE2D = 2097234,
	LIVE_TEXTURE2D_WIN7 = 2097235,
	DESTROY_TEXTURE2D = 2097236,
	CREATE_TEXTURE3D = 2097237,
	LIVE_TEXTURE3D_WIN7 = 2097238,
	DESTROY_TEXTURE3D = 2097239,
	CREATE_SHADERRESOURCEVIEW = 2097240,
	LIVE_SHADERRESOURCEVIEW_WIN7 = 2097241,
	DESTROY_SHADERRESOURCEVIEW = 2097242,
	CREATE_RENDERTARGETVIEW = 2097243,
	LIVE_RENDERTARGETVIEW_WIN7 = 2097244,
	DESTROY_RENDERTARGETVIEW = 2097245,
	CREATE_DEPTHSTENCILVIEW = 2097246,
	LIVE_DEPTHSTENCILVIEW_WIN7 = 2097247,
	DESTROY_DEPTHSTENCILVIEW = 2097248,
	CREATE_VERTEXSHADER = 2097249,
	LIVE_VERTEXSHADER_WIN7 = 2097250,
	DESTROY_VERTEXSHADER = 2097251,
	CREATE_HULLSHADER = 2097252,
	LIVE_HULLSHADER = 2097253,
	DESTROY_HULLSHADER = 2097254,
	CREATE_DOMAINSHADER = 2097255,
	LIVE_DOMAINSHADER = 2097256,
	DESTROY_DOMAINSHADER = 2097257,
	CREATE_GEOMETRYSHADER = 2097258,
	LIVE_GEOMETRYSHADER_WIN7 = 2097259,
	DESTROY_GEOMETRYSHADER = 2097260,
	CREATE_PIXELSHADER = 2097261,
	LIVE_PIXELSHADER_WIN7 = 2097262,
	DESTROY_PIXELSHADER = 2097263,
	CREATE_INPUTLAYOUT = 2097264,
	LIVE_INPUTLAYOUT_WIN7 = 2097265,
	DESTROY_INPUTLAYOUT = 2097266,
	CREATE_SAMPLER = 2097267,
	LIVE_SAMPLER_WIN7 = 2097268,
	DESTROY_SAMPLER = 2097269,
	CREATE_BLENDSTATE = 2097270,
	LIVE_BLENDSTATE_WIN7 = 2097271,
	DESTROY_BLENDSTATE = 2097272,
	CREATE_DEPTHSTENCILSTATE = 2097273,
	LIVE_DEPTHSTENCILSTATE_WIN7 = 2097274,
	DESTROY_DEPTHSTENCILSTATE = 2097275,
	CREATE_RASTERIZERSTATE = 2097276,
	LIVE_RASTERIZERSTATE_WIN7 = 2097277,
	DESTROY_RASTERIZERSTATE = 2097278,
	CREATE_QUERY = 2097279,
	LIVE_QUERY_WIN7 = 2097280,
	DESTROY_QUERY = 2097281,
	CREATE_PREDICATE = 2097282,
	LIVE_PREDICATE_WIN7 = 2097283,
	DESTROY_PREDICATE = 2097284,
	CREATE_COUNTER = 2097285,
	DESTROY_COUNTER = 2097286,
	CREATE_COMMANDLIST = 2097287,
	LIVE_COMMANDLIST = 2097288,
	DESTROY_COMMANDLIST = 2097289,
	CREATE_CLASSINSTANCE = 2097290,
	LIVE_CLASSINSTANCE = 2097291,
	DESTROY_CLASSINSTANCE = 2097292,
	CREATE_CLASSLINKAGE = 2097293,
	LIVE_CLASSLINKAGE = 2097294,
	DESTROY_CLASSLINKAGE = 2097295,
	LIVE_DEVICE_WIN7 = 2097296,
	LIVE_OBJECT_SUMMARY_WIN7 = 2097297,
	CREATE_COMPUTESHADER = 2097298,
	LIVE_COMPUTESHADER = 2097299,
	DESTROY_COMPUTESHADER = 2097300,
	CREATE_UNORDEREDACCESSVIEW = 2097301,
	LIVE_UNORDEREDACCESSVIEW = 2097302,
	DESTROY_UNORDEREDACCESSVIEW = 2097303,
	DEVICE_SETSHADER_INTERFACES_FEATURELEVEL = 2097304,
	DEVICE_SETSHADER_INTERFACE_COUNT_MISMATCH = 2097305,
	DEVICE_SETSHADER_INVALID_INSTANCE = 2097306,
	DEVICE_SETSHADER_INVALID_INSTANCE_INDEX = 2097307,
	DEVICE_SETSHADER_INVALID_INSTANCE_TYPE = 2097308,
	DEVICE_SETSHADER_INVALID_INSTANCE_DATA = 2097309,
	DEVICE_SETSHADER_UNBOUND_INSTANCE_DATA = 2097310,
	DEVICE_SETSHADER_INSTANCE_DATA_BINDINGS = 2097311,
	DEVICE_CREATESHADER_CLASSLINKAGE_FULL = 2097312,
	DEVICE_CHECKFEATURESUPPORT_UNRECOGNIZED_FEATURE = 2097313,
	DEVICE_CHECKFEATURESUPPORT_MISMATCHED_DATA_SIZE = 2097314,
	DEVICE_CHECKFEATURESUPPORT_INVALIDARG_RETURN = 2097315,
	DEVICE_CSSETSHADERRESOURCES_HAZARD = 2097316,
	DEVICE_CSSETCONSTANTBUFFERS_HAZARD = 2097317,
	CSSETSHADERRESOURCES_UNBINDDELETINGOBJECT = 2097318,
	CSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT = 2097319,
	CREATECOMPUTESHADER_INVALIDCALL = 2097320,
	CREATECOMPUTESHADER_OUTOFMEMORY = 2097321,
	CREATECOMPUTESHADER_INVALIDSHADERBYTECODE = 2097322,
	CREATECOMPUTESHADER_INVALIDSHADERTYPE = 2097323,
	CREATECOMPUTESHADER_INVALIDCLASSLINKAGE = 2097324,
	DEVICE_CSSETSHADERRESOURCES_VIEWS_EMPTY = 2097325,
	CSSETCONSTANTBUFFERS_INVALIDBUFFER = 2097326,
	DEVICE_CSSETCONSTANTBUFFERS_BUFFERS_EMPTY = 2097327,
	DEVICE_CSSETSAMPLERS_SAMPLERS_EMPTY = 2097328,
	DEVICE_CSGETSHADERRESOURCES_VIEWS_EMPTY = 2097329,
	DEVICE_CSGETCONSTANTBUFFERS_BUFFERS_EMPTY = 2097330,
	DEVICE_CSGETSAMPLERS_SAMPLERS_EMPTY = 2097331,
	DEVICE_CREATEVERTEXSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 2097332,
	DEVICE_CREATEHULLSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 2097333,
	DEVICE_CREATEDOMAINSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 2097334,
	DEVICE_CREATEGEOMETRYSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 2097335,
	DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEFLOATOPSNOTSUPPORTED = 2097336,
	DEVICE_CREATEPIXELSHADER_DOUBLEFLOATOPSNOTSUPPORTED = 2097337,
	DEVICE_CREATECOMPUTESHADER_DOUBLEFLOATOPSNOTSUPPORTED = 2097338,
	CREATEBUFFER_INVALIDSTRUCTURESTRIDE = 2097339,
	CREATESHADERRESOURCEVIEW_INVALIDFLAGS = 2097340,
	CREATEUNORDEREDACCESSVIEW_INVALIDRESOURCE = 2097341,
	CREATEUNORDEREDACCESSVIEW_INVALIDDESC = 2097342,
	CREATEUNORDEREDACCESSVIEW_INVALIDFORMAT = 2097343,
	CREATEUNORDEREDACCESSVIEW_INVALIDDIMENSIONS = 2097344,
	CREATEUNORDEREDACCESSVIEW_UNRECOGNIZEDFORMAT = 2097345,
	DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_HAZARD = 2097346,
	DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_OVERLAPPING_OLD_SLOTS = 2097347,
	DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_NO_OP = 2097348,
	CSSETUNORDEREDACCESSVIEWS_UNBINDDELETINGOBJECT = 2097349,
	PSSETUNORDEREDACCESSVIEWS_UNBINDDELETINGOBJECT = 2097350,
	CREATEUNORDEREDACCESSVIEW_INVALIDARG_RETURN = 2097351,
	CREATEUNORDEREDACCESSVIEW_OUTOFMEMORY_RETURN = 2097352,
	CREATEUNORDEREDACCESSVIEW_TOOMANYOBJECTS = 2097353,
	DEVICE_CSSETUNORDEREDACCESSVIEWS_HAZARD = 2097354,
	CLEARUNORDEREDACCESSVIEW_DENORMFLUSH = 2097355,
	DEVICE_CSSETUNORDEREDACCESSS_VIEWS_EMPTY = 2097356,
	DEVICE_CSGETUNORDEREDACCESSS_VIEWS_EMPTY = 2097357,
	CREATEUNORDEREDACCESSVIEW_INVALIDFLAGS = 2097358,
	CREATESHADERRESESOURCEVIEW_TOOMANYOBJECTS = 2097359,
	DEVICE_DISPATCHINDIRECT_INVALID_ARG_BUFFER = 2097360,
	DEVICE_DISPATCHINDIRECT_OFFSET_UNALIGNED = 2097361,
	DEVICE_DISPATCHINDIRECT_OFFSET_OVERFLOW = 2097362,
	DEVICE_SETRESOURCEMINLOD_INVALIDCONTEXT = 2097363,
	DEVICE_SETRESOURCEMINLOD_INVALIDRESOURCE = 2097364,
	DEVICE_SETRESOURCEMINLOD_INVALIDMINLOD = 2097365,
	DEVICE_GETRESOURCEMINLOD_INVALIDCONTEXT = 2097366,
	DEVICE_GETRESOURCEMINLOD_INVALIDRESOURCE = 2097367,
	OMSETDEPTHSTENCIL_UNBINDDELETINGOBJECT = 2097368,
	CLEARDEPTHSTENCILVIEW_DEPTH_READONLY = 2097369,
	CLEARDEPTHSTENCILVIEW_STENCIL_READONLY = 2097370,
	CHECKFEATURESUPPORT_FORMAT_DEPRECATED = 2097371,
	DEVICE_UNORDEREDACCESSVIEW_RETURN_TYPE_MISMATCH = 2097372,
	DEVICE_UNORDEREDACCESSVIEW_NOT_SET = 2097373,
	DEVICE_DRAW_UNORDEREDACCESSVIEW_RENDERTARGETVIEW_OVERLAP = 2097374,
	DEVICE_UNORDEREDACCESSVIEW_DIMENSION_MISMATCH = 2097375,
	DEVICE_UNORDEREDACCESSVIEW_APPEND_UNSUPPORTED = 2097376,
	DEVICE_UNORDEREDACCESSVIEW_ATOMICS_UNSUPPORTED = 2097377,
	DEVICE_UNORDEREDACCESSVIEW_STRUCTURE_STRIDE_MISMATCH = 2097378,
	DEVICE_UNORDEREDACCESSVIEW_BUFFER_TYPE_MISMATCH = 2097379,
	DEVICE_UNORDEREDACCESSVIEW_RAW_UNSUPPORTED = 2097380,
	DEVICE_UNORDEREDACCESSVIEW_FORMAT_LD_UNSUPPORTED = 2097381,
	DEVICE_UNORDEREDACCESSVIEW_FORMAT_STORE_UNSUPPORTED = 2097382,
	DEVICE_UNORDEREDACCESSVIEW_ATOMIC_ADD_UNSUPPORTED = 2097383,
	DEVICE_UNORDEREDACCESSVIEW_ATOMIC_BITWISE_OPS_UNSUPPORTED = 2097384,
	DEVICE_UNORDEREDACCESSVIEW_ATOMIC_CMPSTORE_CMPEXCHANGE_UNSUPPORTED = 2097385,
	DEVICE_UNORDEREDACCESSVIEW_ATOMIC_EXCHANGE_UNSUPPORTED = 2097386,
	DEVICE_UNORDEREDACCESSVIEW_ATOMIC_SIGNED_MINMAX_UNSUPPORTED = 2097387,
	DEVICE_UNORDEREDACCESSVIEW_ATOMIC_UNSIGNED_MINMAX_UNSUPPORTED = 2097388,
	DEVICE_DISPATCH_BOUND_RESOURCE_MAPPED = 2097389,
	DEVICE_DISPATCH_THREADGROUPCOUNT_OVERFLOW = 2097390,
	DEVICE_DISPATCH_THREADGROUPCOUNT_ZERO = 2097391,
	DEVICE_SHADERRESOURCEVIEW_STRUCTURE_STRIDE_MISMATCH = 2097392,
	DEVICE_SHADERRESOURCEVIEW_BUFFER_TYPE_MISMATCH = 2097393,
	DEVICE_SHADERRESOURCEVIEW_RAW_UNSUPPORTED = 2097394,
	DEVICE_DISPATCH_UNSUPPORTED = 2097395,
	DEVICE_DISPATCHINDIRECT_UNSUPPORTED = 2097396,
	COPYSTRUCTURECOUNT_INVALIDOFFSET = 2097397,
	COPYSTRUCTURECOUNT_LARGEOFFSET = 2097398,
	COPYSTRUCTURECOUNT_INVALIDDESTINATIONSTATE = 2097399,
	COPYSTRUCTURECOUNT_INVALIDSOURCESTATE = 2097400,
	CHECKFORMATSUPPORT_FORMAT_NOT_SUPPORTED = 2097401,
	DEVICE_CSSETUNORDEREDACCESSVIEWS_INVALIDVIEW = 2097402,
	DEVICE_CSSETUNORDEREDACCESSVIEWS_INVALIDOFFSET = 2097403,
	DEVICE_CSSETUNORDEREDACCESSVIEWS_TOOMANYVIEWS = 2097404,
	CLEARUNORDEREDACCESSVIEWFLOAT_INVALIDFORMAT = 2097405,
	DEVICE_UNORDEREDACCESSVIEW_COUNTER_UNSUPPORTED = 2097406,
	REF_WARNING = 2097407,
	DEVICE_DRAW_PIXEL_SHADER_WITHOUT_RTV_OR_DSV = 2097408,
	SHADER_ABORT = 2097409,
	SHADER_MESSAGE = 2097410,
	SHADER_ERROR = 2097411,
	OFFERRESOURCES_INVALIDRESOURCE = 2097412,
	HSSETSAMPLERS_UNBINDDELETINGOBJECT = 2097413,
	DSSETSAMPLERS_UNBINDDELETINGOBJECT = 2097414,
	CSSETSAMPLERS_UNBINDDELETINGOBJECT = 2097415,
	HSSETSHADER_UNBINDDELETINGOBJECT = 2097416,
	DSSETSHADER_UNBINDDELETINGOBJECT = 2097417,
	CSSETSHADER_UNBINDDELETINGOBJECT = 2097418,
	ENQUEUESETEVENT_INVALIDARG_RETURN = 2097419,
	ENQUEUESETEVENT_OUTOFMEMORY_RETURN = 2097420,
	ENQUEUESETEVENT_ACCESSDENIED_RETURN = 2097421,
	DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_NUMUAVS_INVALIDRANGE = 2097422,
	USE_OF_ZERO_REFCOUNT_OBJECT = 2097423,
	D3D11_MESSAGES_END = 2097424,
	D3D11_1_MESSAGES_START = 3145728,
	CREATE_VIDEODECODER = 3145729,
	CREATE_VIDEOPROCESSORENUM = 3145730,
	CREATE_VIDEOPROCESSOR = 3145731,
	CREATE_DECODEROUTPUTVIEW = 3145732,
	CREATE_PROCESSORINPUTVIEW = 3145733,
	CREATE_PROCESSOROUTPUTVIEW = 3145734,
	CREATE_DEVICECONTEXTSTATE = 3145735,
	LIVE_VIDEODECODER = 3145736,
	LIVE_VIDEOPROCESSORENUM = 3145737,
	LIVE_VIDEOPROCESSOR = 3145738,
	LIVE_DECODEROUTPUTVIEW = 3145739,
	LIVE_PROCESSORINPUTVIEW = 3145740,
	LIVE_PROCESSOROUTPUTVIEW = 3145741,
	LIVE_DEVICECONTEXTSTATE = 3145742,
	DESTROY_VIDEODECODER = 3145743,
	DESTROY_VIDEOPROCESSORENUM = 3145744,
	DESTROY_VIDEOPROCESSOR = 3145745,
	DESTROY_DECODEROUTPUTVIEW = 3145746,
	DESTROY_PROCESSORINPUTVIEW = 3145747,
	DESTROY_PROCESSOROUTPUTVIEW = 3145748,
	DESTROY_DEVICECONTEXTSTATE = 3145749,
	CREATEDEVICECONTEXTSTATE_INVALIDFLAGS = 3145750,
	CREATEDEVICECONTEXTSTATE_INVALIDFEATURELEVEL = 3145751,
	CREATEDEVICECONTEXTSTATE_FEATURELEVELS_NOT_SUPPORTED = 3145752,
	CREATEDEVICECONTEXTSTATE_INVALIDREFIID = 3145753,
	DEVICE_DISCARDVIEW_INVALIDVIEW = 3145754,
	COPYSUBRESOURCEREGION1_INVALIDCOPYFLAGS = 3145755,
	UPDATESUBRESOURCE1_INVALIDCOPYFLAGS = 3145756,
	CREATERASTERIZERSTATE_INVALIDFORCEDSAMPLECOUNT = 3145757,
	CREATEVIDEODECODER_OUTOFMEMORY_RETURN = 3145758,
	CREATEVIDEODECODER_NULLPARAM = 3145759,
	CREATEVIDEODECODER_INVALIDFORMAT = 3145760,
	CREATEVIDEODECODER_ZEROWIDTHHEIGHT = 3145761,
	CREATEVIDEODECODER_DRIVER_INVALIDBUFFERSIZE = 3145762,
	CREATEVIDEODECODER_DRIVER_INVALIDBUFFERUSAGE = 3145763,
	GETVIDEODECODERPROFILECOUNT_OUTOFMEMORY = 3145764,
	GETVIDEODECODERPROFILE_NULLPARAM = 3145765,
	GETVIDEODECODERPROFILE_INVALIDINDEX = 3145766,
	GETVIDEODECODERPROFILE_OUTOFMEMORY_RETURN = 3145767,
	CHECKVIDEODECODERFORMAT_NULLPARAM = 3145768,
	CHECKVIDEODECODERFORMAT_OUTOFMEMORY_RETURN = 3145769,
	GETVIDEODECODERCONFIGCOUNT_NULLPARAM = 3145770,
	GETVIDEODECODERCONFIGCOUNT_OUTOFMEMORY_RETURN = 3145771,
	GETVIDEODECODERCONFIG_NULLPARAM = 3145772,
	GETVIDEODECODERCONFIG_INVALIDINDEX = 3145773,
	GETVIDEODECODERCONFIG_OUTOFMEMORY_RETURN = 3145774,
	GETDECODERCREATIONPARAMS_NULLPARAM = 3145775,
	GETDECODERDRIVERHANDLE_NULLPARAM = 3145776,
	GETDECODERBUFFER_NULLPARAM = 3145777,
	GETDECODERBUFFER_INVALIDBUFFER = 3145778,
	GETDECODERBUFFER_INVALIDTYPE = 3145779,
	GETDECODERBUFFER_LOCKED = 3145780,
	RELEASEDECODERBUFFER_NULLPARAM = 3145781,
	RELEASEDECODERBUFFER_INVALIDTYPE = 3145782,
	RELEASEDECODERBUFFER_NOTLOCKED = 3145783,
	DECODERBEGINFRAME_NULLPARAM = 3145784,
	DECODERBEGINFRAME_HAZARD = 3145785,
	DECODERENDFRAME_NULLPARAM = 3145786,
	SUBMITDECODERBUFFERS_NULLPARAM = 3145787,
	SUBMITDECODERBUFFERS_INVALIDTYPE = 3145788,
	DECODEREXTENSION_NULLPARAM = 3145789,
	DECODEREXTENSION_INVALIDRESOURCE = 3145790,
	CREATEVIDEOPROCESSORENUMERATOR_OUTOFMEMORY_RETURN = 3145791,
	CREATEVIDEOPROCESSORENUMERATOR_NULLPARAM = 3145792,
	CREATEVIDEOPROCESSORENUMERATOR_INVALIDFRAMEFORMAT = 3145793,
	CREATEVIDEOPROCESSORENUMERATOR_INVALIDUSAGE = 3145794,
	CREATEVIDEOPROCESSORENUMERATOR_INVALIDINPUTFRAMERATE = 3145795,
	CREATEVIDEOPROCESSORENUMERATOR_INVALIDOUTPUTFRAMERATE = 3145796,
	CREATEVIDEOPROCESSORENUMERATOR_INVALIDWIDTHHEIGHT = 3145797,
	GETVIDEOPROCESSORCONTENTDESC_NULLPARAM = 3145798,
	CHECKVIDEOPROCESSORFORMAT_NULLPARAM = 3145799,
	GETVIDEOPROCESSORCAPS_NULLPARAM = 3145800,
	GETVIDEOPROCESSORRATECONVERSIONCAPS_NULLPARAM = 3145801,
	GETVIDEOPROCESSORRATECONVERSIONCAPS_INVALIDINDEX = 3145802,
	GETVIDEOPROCESSORCUSTOMRATE_NULLPARAM = 3145803,
	GETVIDEOPROCESSORCUSTOMRATE_INVALIDINDEX = 3145804,
	GETVIDEOPROCESSORFILTERRANGE_NULLPARAM = 3145805,
	GETVIDEOPROCESSORFILTERRANGE_UNSUPPORTED = 3145806,
	CREATEVIDEOPROCESSOR_OUTOFMEMORY_RETURN = 3145807,
	CREATEVIDEOPROCESSOR_NULLPARAM = 3145808,
	VIDEOPROCESSORSETOUTPUTTARGETRECT_NULLPARAM = 3145809,
	VIDEOPROCESSORSETOUTPUTBACKGROUNDCOLOR_NULLPARAM = 3145810,
	VIDEOPROCESSORSETOUTPUTBACKGROUNDCOLOR_INVALIDALPHA = 3145811,
	VIDEOPROCESSORSETOUTPUTCOLORSPACE_NULLPARAM = 3145812,
	VIDEOPROCESSORSETOUTPUTALPHAFILLMODE_NULLPARAM = 3145813,
	VIDEOPROCESSORSETOUTPUTALPHAFILLMODE_UNSUPPORTED = 3145814,
	VIDEOPROCESSORSETOUTPUTALPHAFILLMODE_INVALIDSTREAM = 3145815,
	VIDEOPROCESSORSETOUTPUTALPHAFILLMODE_INVALIDFILLMODE = 3145816,
	VIDEOPROCESSORSETOUTPUTCONSTRICTION_NULLPARAM = 3145817,
	VIDEOPROCESSORSETOUTPUTSTEREOMODE_NULLPARAM = 3145818,
	VIDEOPROCESSORSETOUTPUTSTEREOMODE_UNSUPPORTED = 3145819,
	VIDEOPROCESSORSETOUTPUTEXTENSION_NULLPARAM = 3145820,
	VIDEOPROCESSORGETOUTPUTTARGETRECT_NULLPARAM = 3145821,
	VIDEOPROCESSORGETOUTPUTBACKGROUNDCOLOR_NULLPARAM = 3145822,
	VIDEOPROCESSORGETOUTPUTCOLORSPACE_NULLPARAM = 3145823,
	VIDEOPROCESSORGETOUTPUTALPHAFILLMODE_NULLPARAM = 3145824,
	VIDEOPROCESSORGETOUTPUTCONSTRICTION_NULLPARAM = 3145825,
	VIDEOPROCESSORSETOUTPUTCONSTRICTION_UNSUPPORTED = 3145826,
	VIDEOPROCESSORSETOUTPUTCONSTRICTION_INVALIDSIZE = 3145827,
	VIDEOPROCESSORGETOUTPUTSTEREOMODE_NULLPARAM = 3145828,
	VIDEOPROCESSORGETOUTPUTEXTENSION_NULLPARAM = 3145829,
	VIDEOPROCESSORSETSTREAMFRAMEFORMAT_NULLPARAM = 3145830,
	VIDEOPROCESSORSETSTREAMFRAMEFORMAT_INVALIDFORMAT = 3145831,
	VIDEOPROCESSORSETSTREAMFRAMEFORMAT_INVALIDSTREAM = 3145832,
	VIDEOPROCESSORSETSTREAMCOLORSPACE_NULLPARAM = 3145833,
	VIDEOPROCESSORSETSTREAMCOLORSPACE_INVALIDSTREAM = 3145834,
	VIDEOPROCESSORSETSTREAMOUTPUTRATE_NULLPARAM = 3145835,
	VIDEOPROCESSORSETSTREAMOUTPUTRATE_INVALIDRATE = 3145836,
	VIDEOPROCESSORSETSTREAMOUTPUTRATE_INVALIDFLAG = 3145837,
	VIDEOPROCESSORSETSTREAMOUTPUTRATE_INVALIDSTREAM = 3145838,
	VIDEOPROCESSORSETSTREAMSOURCERECT_NULLPARAM = 3145839,
	VIDEOPROCESSORSETSTREAMSOURCERECT_INVALIDSTREAM = 3145840,
	VIDEOPROCESSORSETSTREAMSOURCERECT_INVALIDRECT = 3145841,
	VIDEOPROCESSORSETSTREAMDESTRECT_NULLPARAM = 3145842,
	VIDEOPROCESSORSETSTREAMDESTRECT_INVALIDSTREAM = 3145843,
	VIDEOPROCESSORSETSTREAMDESTRECT_INVALIDRECT = 3145844,
	VIDEOPROCESSORSETSTREAMALPHA_NULLPARAM = 3145845,
	VIDEOPROCESSORSETSTREAMALPHA_INVALIDSTREAM = 3145846,
	VIDEOPROCESSORSETSTREAMALPHA_INVALIDALPHA = 3145847,
	VIDEOPROCESSORSETSTREAMPALETTE_NULLPARAM = 3145848,
	VIDEOPROCESSORSETSTREAMPALETTE_INVALIDSTREAM = 3145849,
	VIDEOPROCESSORSETSTREAMPALETTE_INVALIDCOUNT = 3145850,
	VIDEOPROCESSORSETSTREAMPALETTE_INVALIDALPHA = 3145851,
	VIDEOPROCESSORSETSTREAMPIXELASPECTRATIO_NULLPARAM = 3145852,
	VIDEOPROCESSORSETSTREAMPIXELASPECTRATIO_INVALIDSTREAM = 3145853,
	VIDEOPROCESSORSETSTREAMPIXELASPECTRATIO_INVALIDRATIO = 3145854,
	VIDEOPROCESSORSETSTREAMLUMAKEY_NULLPARAM = 3145855,
	VIDEOPROCESSORSETSTREAMLUMAKEY_INVALIDSTREAM = 3145856,
	VIDEOPROCESSORSETSTREAMLUMAKEY_INVALIDRANGE = 3145857,
	VIDEOPROCESSORSETSTREAMLUMAKEY_UNSUPPORTED = 3145858,
	VIDEOPROCESSORSETSTREAMSTEREOFORMAT_NULLPARAM = 3145859,
	VIDEOPROCESSORSETSTREAMSTEREOFORMAT_INVALIDSTREAM = 3145860,
	VIDEOPROCESSORSETSTREAMSTEREOFORMAT_UNSUPPORTED = 3145861,
	VIDEOPROCESSORSETSTREAMSTEREOFORMAT_FLIPUNSUPPORTED = 3145862,
	VIDEOPROCESSORSETSTREAMSTEREOFORMAT_MONOOFFSETUNSUPPORTED = 3145863,
	VIDEOPROCESSORSETSTREAMSTEREOFORMAT_FORMATUNSUPPORTED = 3145864,
	VIDEOPROCESSORSETSTREAMSTEREOFORMAT_INVALIDFORMAT = 3145865,
	VIDEOPROCESSORSETSTREAMAUTOPROCESSINGMODE_NULLPARAM = 3145866,
	VIDEOPROCESSORSETSTREAMAUTOPROCESSINGMODE_INVALIDSTREAM = 3145867,
	VIDEOPROCESSORSETSTREAMFILTER_NULLPARAM = 3145868,
	VIDEOPROCESSORSETSTREAMFILTER_INVALIDSTREAM = 3145869,
	VIDEOPROCESSORSETSTREAMFILTER_INVALIDFILTER = 3145870,
	VIDEOPROCESSORSETSTREAMFILTER_UNSUPPORTED = 3145871,
	VIDEOPROCESSORSETSTREAMFILTER_INVALIDLEVEL = 3145872,
	VIDEOPROCESSORSETSTREAMEXTENSION_NULLPARAM = 3145873,
	VIDEOPROCESSORSETSTREAMEXTENSION_INVALIDSTREAM = 3145874,
	VIDEOPROCESSORGETSTREAMFRAMEFORMAT_NULLPARAM = 3145875,
	VIDEOPROCESSORGETSTREAMCOLORSPACE_NULLPARAM = 3145876,
	VIDEOPROCESSORGETSTREAMOUTPUTRATE_NULLPARAM = 3145877,
	VIDEOPROCESSORGETSTREAMSOURCERECT_NULLPARAM = 3145878,
	VIDEOPROCESSORGETSTREAMDESTRECT_NULLPARAM = 3145879,
	VIDEOPROCESSORGETSTREAMALPHA_NULLPARAM = 3145880,
	VIDEOPROCESSORGETSTREAMPALETTE_NULLPARAM = 3145881,
	VIDEOPROCESSORGETSTREAMPIXELASPECTRATIO_NULLPARAM = 3145882,
	VIDEOPROCESSORGETSTREAMLUMAKEY_NULLPARAM = 3145883,
	VIDEOPROCESSORGETSTREAMSTEREOFORMAT_NULLPARAM = 3145884,
	VIDEOPROCESSORGETSTREAMAUTOPROCESSINGMODE_NULLPARAM = 3145885,
	VIDEOPROCESSORGETSTREAMFILTER_NULLPARAM = 3145886,
	VIDEOPROCESSORGETSTREAMEXTENSION_NULLPARAM = 3145887,
	VIDEOPROCESSORGETSTREAMEXTENSION_INVALIDSTREAM = 3145888,
	VIDEOPROCESSORBLT_NULLPARAM = 3145889,
	VIDEOPROCESSORBLT_INVALIDSTREAMCOUNT = 3145890,
	VIDEOPROCESSORBLT_TARGETRECT = 3145891,
	VIDEOPROCESSORBLT_INVALIDOUTPUT = 3145892,
	VIDEOPROCESSORBLT_INVALIDPASTFRAMES = 3145893,
	VIDEOPROCESSORBLT_INVALIDFUTUREFRAMES = 3145894,
	VIDEOPROCESSORBLT_INVALIDSOURCERECT = 3145895,
	VIDEOPROCESSORBLT_INVALIDDESTRECT = 3145896,
	VIDEOPROCESSORBLT_INVALIDINPUTRESOURCE = 3145897,
	VIDEOPROCESSORBLT_INVALIDARRAYSIZE = 3145898,
	VIDEOPROCESSORBLT_INVALIDARRAY = 3145899,
	VIDEOPROCESSORBLT_RIGHTEXPECTED = 3145900,
	VIDEOPROCESSORBLT_RIGHTNOTEXPECTED = 3145901,
	VIDEOPROCESSORBLT_STEREONOTENABLED = 3145902,
	VIDEOPROCESSORBLT_INVALIDRIGHTRESOURCE = 3145903,
	VIDEOPROCESSORBLT_NOSTEREOSTREAMS = 3145904,
	VIDEOPROCESSORBLT_INPUTHAZARD = 3145905,
	VIDEOPROCESSORBLT_OUTPUTHAZARD = 3145906,
	CREATEVIDEODECODEROUTPUTVIEW_OUTOFMEMORY_RETURN = 3145907,
	CREATEVIDEODECODEROUTPUTVIEW_NULLPARAM = 3145908,
	CREATEVIDEODECODEROUTPUTVIEW_INVALIDTYPE = 3145909,
	CREATEVIDEODECODEROUTPUTVIEW_INVALIDBIND = 3145910,
	CREATEVIDEODECODEROUTPUTVIEW_UNSUPPORTEDFORMAT = 3145911,
	CREATEVIDEODECODEROUTPUTVIEW_INVALIDMIP = 3145912,
	CREATEVIDEODECODEROUTPUTVIEW_UNSUPPORTEMIP = 3145913,
	CREATEVIDEODECODEROUTPUTVIEW_INVALIDARRAYSIZE = 3145914,
	CREATEVIDEODECODEROUTPUTVIEW_INVALIDARRAY = 3145915,
	CREATEVIDEODECODEROUTPUTVIEW_INVALIDDIMENSION = 3145916,
	CREATEVIDEOPROCESSORINPUTVIEW_OUTOFMEMORY_RETURN = 3145917,
	CREATEVIDEOPROCESSORINPUTVIEW_NULLPARAM = 3145918,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDTYPE = 3145919,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDBIND = 3145920,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDMISC = 3145921,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDUSAGE = 3145922,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDFORMAT = 3145923,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDFOURCC = 3145924,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDMIP = 3145925,
	CREATEVIDEOPROCESSORINPUTVIEW_UNSUPPORTEDMIP = 3145926,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDARRAYSIZE = 3145927,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDARRAY = 3145928,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDDIMENSION = 3145929,
	CREATEVIDEOPROCESSOROUTPUTVIEW_OUTOFMEMORY_RETURN = 3145930,
	CREATEVIDEOPROCESSOROUTPUTVIEW_NULLPARAM = 3145931,
	CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDTYPE = 3145932,
	CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDBIND = 3145933,
	CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDFORMAT = 3145934,
	CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDMIP = 3145935,
	CREATEVIDEOPROCESSOROUTPUTVIEW_UNSUPPORTEDMIP = 3145936,
	CREATEVIDEOPROCESSOROUTPUTVIEW_UNSUPPORTEDARRAY = 3145937,
	CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDARRAY = 3145938,
	CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDDIMENSION = 3145939,
	DEVICE_DRAW_INVALID_USE_OF_FORCED_SAMPLE_COUNT = 3145940,
	CREATEBLENDSTATE_INVALIDLOGICOPS = 3145941,
	CREATESHADERRESOURCEVIEW_INVALIDDARRAYWITHDECODER = 3145942,
	CREATEUNORDEREDACCESSVIEW_INVALIDDARRAYWITHDECODER = 3145943,
	CREATERENDERTARGETVIEW_INVALIDDARRAYWITHDECODER = 3145944,
	DEVICE_LOCKEDOUT_INTERFACE = 3145945,
	REF_WARNING_ATOMIC_INCONSISTENT = 3145946,
	REF_WARNING_READING_UNINITIALIZED_RESOURCE = 3145947,
	REF_WARNING_RAW_HAZARD = 3145948,
	REF_WARNING_WAR_HAZARD = 3145949,
	REF_WARNING_WAW_HAZARD = 3145950,
	CREATECRYPTOSESSION_NULLPARAM = 3145951,
	CREATECRYPTOSESSION_OUTOFMEMORY_RETURN = 3145952,
	GETCRYPTOTYPE_NULLPARAM = 3145953,
	GETDECODERPROFILE_NULLPARAM = 3145954,
	GETCRYPTOSESSIONCERTIFICATESIZE_NULLPARAM = 3145955,
	GETCRYPTOSESSIONCERTIFICATE_NULLPARAM = 3145956,
	GETCRYPTOSESSIONCERTIFICATE_WRONGSIZE = 3145957,
	GETCRYPTOSESSIONHANDLE_WRONGSIZE = 3145958,
	NEGOTIATECRPYTOSESSIONKEYEXCHANGE_NULLPARAM = 3145959,
	ENCRYPTIONBLT_UNSUPPORTED = 3145960,
	ENCRYPTIONBLT_NULLPARAM = 3145961,
	ENCRYPTIONBLT_SRC_WRONGDEVICE = 3145962,
	ENCRYPTIONBLT_DST_WRONGDEVICE = 3145963,
	ENCRYPTIONBLT_FORMAT_MISMATCH = 3145964,
	ENCRYPTIONBLT_SIZE_MISMATCH = 3145965,
	ENCRYPTIONBLT_SRC_MULTISAMPLED = 3145966,
	ENCRYPTIONBLT_DST_NOT_STAGING = 3145967,
	ENCRYPTIONBLT_SRC_MAPPED = 3145968,
	ENCRYPTIONBLT_DST_MAPPED = 3145969,
	ENCRYPTIONBLT_SRC_OFFERED = 3145970,
	ENCRYPTIONBLT_DST_OFFERED = 3145971,
	ENCRYPTIONBLT_SRC_CONTENT_UNDEFINED = 3145972,
	DECRYPTIONBLT_UNSUPPORTED = 3145973,
	DECRYPTIONBLT_NULLPARAM = 3145974,
	DECRYPTIONBLT_SRC_WRONGDEVICE = 3145975,
	DECRYPTIONBLT_DST_WRONGDEVICE = 3145976,
	DECRYPTIONBLT_FORMAT_MISMATCH = 3145977,
	DECRYPTIONBLT_SIZE_MISMATCH = 3145978,
	DECRYPTIONBLT_DST_MULTISAMPLED = 3145979,
	DECRYPTIONBLT_SRC_NOT_STAGING = 3145980,
	DECRYPTIONBLT_DST_NOT_RENDER_TARGET = 3145981,
	DECRYPTIONBLT_SRC_MAPPED = 3145982,
	DECRYPTIONBLT_DST_MAPPED = 3145983,
	DECRYPTIONBLT_SRC_OFFERED = 3145984,
	DECRYPTIONBLT_DST_OFFERED = 3145985,
	DECRYPTIONBLT_SRC_CONTENT_UNDEFINED = 3145986,
	STARTSESSIONKEYREFRESH_NULLPARAM = 3145987,
	STARTSESSIONKEYREFRESH_INVALIDSIZE = 3145988,
	FINISHSESSIONKEYREFRESH_NULLPARAM = 3145989,
	GETENCRYPTIONBLTKEY_NULLPARAM = 3145990,
	GETENCRYPTIONBLTKEY_INVALIDSIZE = 3145991,
	GETCONTENTPROTECTIONCAPS_NULLPARAM = 3145992,
	CHECKCRYPTOKEYEXCHANGE_NULLPARAM = 3145993,
	CHECKCRYPTOKEYEXCHANGE_INVALIDINDEX = 3145994,
	CREATEAUTHENTICATEDCHANNEL_NULLPARAM = 3145995,
	CREATEAUTHENTICATEDCHANNEL_UNSUPPORTED = 3145996,
	CREATEAUTHENTICATEDCHANNEL_INVALIDTYPE = 3145997,
	CREATEAUTHENTICATEDCHANNEL_OUTOFMEMORY_RETURN = 3145998,
	GETAUTHENTICATEDCHANNELCERTIFICATESIZE_INVALIDCHANNEL = 3145999,
	GETAUTHENTICATEDCHANNELCERTIFICATESIZE_NULLPARAM = 3146000,
	GETAUTHENTICATEDCHANNELCERTIFICATE_INVALIDCHANNEL = 3146001,
	GETAUTHENTICATEDCHANNELCERTIFICATE_NULLPARAM = 3146002,
	GETAUTHENTICATEDCHANNELCERTIFICATE_WRONGSIZE = 3146003,
	NEGOTIATEAUTHENTICATEDCHANNELKEYEXCHANGE_INVALIDCHANNEL = 3146004,
	NEGOTIATEAUTHENTICATEDCHANNELKEYEXCHANGE_NULLPARAM = 3146005,
	QUERYAUTHENTICATEDCHANNEL_NULLPARAM = 3146006,
	QUERYAUTHENTICATEDCHANNEL_WRONGCHANNEL = 3146007,
	QUERYAUTHENTICATEDCHANNEL_UNSUPPORTEDQUERY = 3146008,
	QUERYAUTHENTICATEDCHANNEL_WRONGSIZE = 3146009,
	QUERYAUTHENTICATEDCHANNEL_INVALIDPROCESSINDEX = 3146010,
	CONFIGUREAUTHENTICATEDCHANNEL_NULLPARAM = 3146011,
	CONFIGUREAUTHENTICATEDCHANNEL_WRONGCHANNEL = 3146012,
	CONFIGUREAUTHENTICATEDCHANNEL_UNSUPPORTEDCONFIGURE = 3146013,
	CONFIGUREAUTHENTICATEDCHANNEL_WRONGSIZE = 3146014,
	CONFIGUREAUTHENTICATEDCHANNEL_INVALIDPROCESSIDTYPE = 3146015,
	VSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT = 3146016,
	DSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT = 3146017,
	HSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT = 3146018,
	GSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT = 3146019,
	PSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT = 3146020,
	CSSETCONSTANTBUFFERS_INVALIDBUFFEROFFSETORCOUNT = 3146021,
	NEGOTIATECRPYTOSESSIONKEYEXCHANGE_INVALIDSIZE = 3146022,
	NEGOTIATEAUTHENTICATEDCHANNELKEYEXCHANGE_INVALIDSIZE = 3146023,
	OFFERRESOURCES_INVALIDPRIORITY = 3146024,
	GETCRYPTOSESSIONHANDLE_OUTOFMEMORY = 3146025,
	ACQUIREHANDLEFORCAPTURE_NULLPARAM = 3146026,
	ACQUIREHANDLEFORCAPTURE_INVALIDTYPE = 3146027,
	ACQUIREHANDLEFORCAPTURE_INVALIDBIND = 3146028,
	ACQUIREHANDLEFORCAPTURE_INVALIDARRAY = 3146029,
	VIDEOPROCESSORSETSTREAMROTATION_NULLPARAM = 3146030,
	VIDEOPROCESSORSETSTREAMROTATION_INVALIDSTREAM = 3146031,
	VIDEOPROCESSORSETSTREAMROTATION_INVALID = 3146032,
	VIDEOPROCESSORSETSTREAMROTATION_UNSUPPORTED = 3146033,
	VIDEOPROCESSORGETSTREAMROTATION_NULLPARAM = 3146034,
	DEVICE_CLEARVIEW_INVALIDVIEW = 3146035,
	DEVICE_CREATEVERTEXSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 3146036,
	DEVICE_CREATEVERTEXSHADER_SHADEREXTENSIONSNOTSUPPORTED = 3146037,
	DEVICE_CREATEHULLSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 3146038,
	DEVICE_CREATEHULLSHADER_SHADEREXTENSIONSNOTSUPPORTED = 3146039,
	DEVICE_CREATEDOMAINSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 3146040,
	DEVICE_CREATEDOMAINSHADER_SHADEREXTENSIONSNOTSUPPORTED = 3146041,
	DEVICE_CREATEGEOMETRYSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 3146042,
	DEVICE_CREATEGEOMETRYSHADER_SHADEREXTENSIONSNOTSUPPORTED = 3146043,
	DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DOUBLEEXTENSIONSNOTSUPPORTED = 3146044,
	DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_SHADEREXTENSIONSNOTSUPPORTED = 3146045,
	DEVICE_CREATEPIXELSHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 3146046,
	DEVICE_CREATEPIXELSHADER_SHADEREXTENSIONSNOTSUPPORTED = 3146047,
	DEVICE_CREATECOMPUTESHADER_DOUBLEEXTENSIONSNOTSUPPORTED = 3146048,
	DEVICE_CREATECOMPUTESHADER_SHADEREXTENSIONSNOTSUPPORTED = 3146049,
	DEVICE_SHADER_LINKAGE_MINPRECISION = 3146050,
	VIDEOPROCESSORSETSTREAMALPHA_UNSUPPORTED = 3146051,
	VIDEOPROCESSORSETSTREAMPIXELASPECTRATIO_UNSUPPORTED = 3146052,
	DEVICE_CREATEVERTEXSHADER_UAVSNOTSUPPORTED = 3146053,
	DEVICE_CREATEHULLSHADER_UAVSNOTSUPPORTED = 3146054,
	DEVICE_CREATEDOMAINSHADER_UAVSNOTSUPPORTED = 3146055,
	DEVICE_CREATEGEOMETRYSHADER_UAVSNOTSUPPORTED = 3146056,
	DEVICE_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UAVSNOTSUPPORTED = 3146057,
	DEVICE_CREATEPIXELSHADER_UAVSNOTSUPPORTED = 3146058,
	DEVICE_CREATECOMPUTESHADER_UAVSNOTSUPPORTED = 3146059,
	DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_INVALIDOFFSET = 3146060,
	DEVICE_OMSETRENDERTARGETSANDUNORDEREDACCESSVIEWS_TOOMANYVIEWS = 3146061,
	DEVICE_CLEARVIEW_NOTSUPPORTED = 3146062,
	SWAPDEVICECONTEXTSTATE_NOTSUPPORTED = 3146063,
	UPDATESUBRESOURCE_PREFERUPDATESUBRESOURCE1 = 3146064,
	GETDC_INACCESSIBLE = 3146065,
	DEVICE_CLEARVIEW_INVALIDRECT = 3146066,
	DEVICE_DRAW_SAMPLE_MASK_IGNORED_ON_FL9 = 3146067,
	DEVICE_OPEN_SHARED_RESOURCE1_NOT_SUPPORTED = 3146068,
	DEVICE_OPEN_SHARED_RESOURCE_BY_NAME_NOT_SUPPORTED = 3146069,
	ENQUEUESETEVENT_NOT_SUPPORTED = 3146070,
	OFFERRELEASE_NOT_SUPPORTED = 3146071,
	OFFERRESOURCES_INACCESSIBLE = 3146072,
	CREATEVIDEOPROCESSORINPUTVIEW_INVALIDMSAA = 3146073,
	CREATEVIDEOPROCESSOROUTPUTVIEW_INVALIDMSAA = 3146074,
	DEVICE_CLEARVIEW_INVALIDSOURCERECT = 3146075,
	DEVICE_CLEARVIEW_EMPTYRECT = 3146076,
	UPDATESUBRESOURCE_EMPTYDESTBOX = 3146077,
	COPYSUBRESOURCEREGION_EMPTYSOURCEBOX = 3146078,
	DEVICE_DRAW_OM_RENDER_TARGET_DOES_NOT_SUPPORT_LOGIC_OPS = 3146079,
	DEVICE_DRAW_DEPTHSTENCILVIEW_NOT_SET = 3146080,
	DEVICE_DRAW_RENDERTARGETVIEW_NOT_SET = 3146081,
	DEVICE_DRAW_RENDERTARGETVIEW_NOT_SET_DUE_TO_FLIP_PRESENT = 3146082,
	DEVICE_UNORDEREDACCESSVIEW_NOT_SET_DUE_TO_FLIP_PRESENT = 3146083,
	GETDATAFORNEWHARDWAREKEY_NULLPARAM = 3146084,
	CHECKCRYPTOSESSIONSTATUS_NULLPARAM = 3146085,
	GETCRYPTOSESSIONPRIVATEDATASIZE_NULLPARAM = 3146086,
	GETVIDEODECODERCAPS_NULLPARAM = 3146087,
	GETVIDEODECODERCAPS_ZEROWIDTHHEIGHT = 3146088,
	CHECKVIDEODECODERDOWNSAMPLING_NULLPARAM = 3146089,
	CHECKVIDEODECODERDOWNSAMPLING_INVALIDCOLORSPACE = 3146090,
	CHECKVIDEODECODERDOWNSAMPLING_ZEROWIDTHHEIGHT = 3146091,
	VIDEODECODERENABLEDOWNSAMPLING_NULLPARAM = 3146092,
	VIDEODECODERENABLEDOWNSAMPLING_UNSUPPORTED = 3146093,
	VIDEODECODERUPDATEDOWNSAMPLING_NULLPARAM = 3146094,
	VIDEODECODERUPDATEDOWNSAMPLING_UNSUPPORTED = 3146095,
	CHECKVIDEOPROCESSORFORMATCONVERSION_NULLPARAM = 3146096,
	VIDEOPROCESSORSETOUTPUTCOLORSPACE1_NULLPARAM = 3146097,
	VIDEOPROCESSORGETOUTPUTCOLORSPACE1_NULLPARAM = 3146098,
	VIDEOPROCESSORSETSTREAMCOLORSPACE1_NULLPARAM = 3146099,
	VIDEOPROCESSORSETSTREAMCOLORSPACE1_INVALIDSTREAM = 3146100,
	VIDEOPROCESSORSETSTREAMMIRROR_NULLPARAM = 3146101,
	VIDEOPROCESSORSETSTREAMMIRROR_INVALIDSTREAM = 3146102,
	VIDEOPROCESSORSETSTREAMMIRROR_UNSUPPORTED = 3146103,
	VIDEOPROCESSORGETSTREAMCOLORSPACE1_NULLPARAM = 3146104,
	VIDEOPROCESSORGETSTREAMMIRROR_NULLPARAM = 3146105,
	RECOMMENDVIDEODECODERDOWNSAMPLING_NULLPARAM = 3146106,
	RECOMMENDVIDEODECODERDOWNSAMPLING_INVALIDCOLORSPACE = 3146107,
	RECOMMENDVIDEODECODERDOWNSAMPLING_ZEROWIDTHHEIGHT = 3146108,
	VIDEOPROCESSORSETOUTPUTSHADERUSAGE_NULLPARAM = 3146109,
	VIDEOPROCESSORGETOUTPUTSHADERUSAGE_NULLPARAM = 3146110,
	VIDEOPROCESSORGETBEHAVIORHINTS_NULLPARAM = 3146111,
	VIDEOPROCESSORGETBEHAVIORHINTS_INVALIDSTREAMCOUNT = 3146112,
	VIDEOPROCESSORGETBEHAVIORHINTS_TARGETRECT = 3146113,
	VIDEOPROCESSORGETBEHAVIORHINTS_INVALIDSOURCERECT = 3146114,
	VIDEOPROCESSORGETBEHAVIORHINTS_INVALIDDESTRECT = 3146115,
	GETCRYPTOSESSIONPRIVATEDATASIZE_INVALID_KEY_EXCHANGE_TYPE = 3146116,
	DEVICE_OPEN_SHARED_RESOURCE1_ACCESS_DENIED = 3146117,
	D3D11_1_MESSAGES_END = 3146118,
	D3D11_2_MESSAGES_START = 3146119,
	CREATEBUFFER_INVALIDUSAGE = 3146120,
	CREATETEXTURE1D_INVALIDUSAGE = 3146121,
	CREATETEXTURE2D_INVALIDUSAGE = 3146122,
	CREATEINPUTLAYOUT_LEVEL9_STEPRATE_NOT_1 = 3146123,
	CREATEINPUTLAYOUT_LEVEL9_INSTANCING_NOT_SUPPORTED = 3146124,
	UPDATETILEMAPPINGS_INVALID_PARAMETER = 3146125,
	COPYTILEMAPPINGS_INVALID_PARAMETER = 3146126,
	COPYTILES_INVALID_PARAMETER = 3146127,
	UPDATETILES_INVALID_PARAMETER = 3146128,
	RESIZETILEPOOL_INVALID_PARAMETER = 3146129,
	TILEDRESOURCEBARRIER_INVALID_PARAMETER = 3146130,
	NULL_TILE_MAPPING_ACCESS_WARNING = 3146131,
	NULL_TILE_MAPPING_ACCESS_ERROR = 3146132,
	DIRTY_TILE_MAPPING_ACCESS = 3146133,
	DUPLICATE_TILE_MAPPINGS_IN_COVERED_AREA = 3146134,
	TILE_MAPPINGS_IN_COVERED_AREA_DUPLICATED_OUTSIDE = 3146135,
	TILE_MAPPINGS_SHARED_BETWEEN_INCOMPATIBLE_RESOURCES = 3146136,
	TILE_MAPPINGS_SHARED_BETWEEN_INPUT_AND_OUTPUT = 3146137,
	CHECKMULTISAMPLEQUALITYLEVELS_INVALIDFLAGS = 3146138,
	GETRESOURCETILING_NONTILED_RESOURCE = 3146139,
	RESIZETILEPOOL_SHRINK_WITH_MAPPINGS_STILL_DEFINED_PAST_END = 3146140,
	NEED_TO_CALL_TILEDRESOURCEBARRIER = 3146141,
	CREATEDEVICE_INVALIDARGS = 3146142,
	CREATEDEVICE_WARNING = 3146143,
	CLEARUNORDEREDACCESSVIEWUINT_HAZARD = 3146144,
	CLEARUNORDEREDACCESSVIEWFLOAT_HAZARD = 3146145,
	TILED_RESOURCE_TIER_1_BUFFER_TEXTURE_MISMATCH = 3146146,
	CREATE_CRYPTOSESSION = 3146147,
	CREATE_AUTHENTICATEDCHANNEL = 3146148,
	LIVE_CRYPTOSESSION = 3146149,
	LIVE_AUTHENTICATEDCHANNEL = 3146150,
	DESTROY_CRYPTOSESSION = 3146151,
	DESTROY_AUTHENTICATEDCHANNEL = 3146152,
	D3D11_2_MESSAGES_END = 3146153,
	D3D11_3_MESSAGES_START = 3146154,
	CREATERASTERIZERSTATE_INVALID_CONSERVATIVERASTERMODE = 3146155,
	DEVICE_DRAW_INVALID_SYSTEMVALUE = 3146156,
	CREATEQUERYORPREDICATE_INVALIDCONTEXTTYPE = 3146157,
	CREATEQUERYORPREDICATE_DECODENOTSUPPORTED = 3146158,
	CREATEQUERYORPREDICATE_ENCODENOTSUPPORTED = 3146159,
	CREATESHADERRESOURCEVIEW_INVALIDPLANEINDEX = 3146160,
	CREATESHADERRESOURCEVIEW_INVALIDVIDEOPLANEINDEX = 3146161,
	CREATESHADERRESOURCEVIEW_AMBIGUOUSVIDEOPLANEINDEX = 3146162,
	CREATERENDERTARGETVIEW_INVALIDPLANEINDEX = 3146163,
	CREATERENDERTARGETVIEW_INVALIDVIDEOPLANEINDEX = 3146164,
	CREATERENDERTARGETVIEW_AMBIGUOUSVIDEOPLANEINDEX = 3146165,
	CREATEUNORDEREDACCESSVIEW_INVALIDPLANEINDEX = 3146166,
	CREATEUNORDEREDACCESSVIEW_INVALIDVIDEOPLANEINDEX = 3146167,
	CREATEUNORDEREDACCESSVIEW_AMBIGUOUSVIDEOPLANEINDEX = 3146168,
	JPEGDECODE_INVALIDSCANDATAOFFSET = 3146169,
	JPEGDECODE_NOTSUPPORTED = 3146170,
	JPEGDECODE_DIMENSIONSTOOLARGE = 3146171,
	JPEGDECODE_INVALIDCOMPONENTS = 3146172,
	JPEGDECODE_DESTINATIONNOT2D = 3146173,
	JPEGDECODE_TILEDRESOURCESUNSUPPORTED = 3146174,
	JPEGDECODE_GUARDRECTSUNSUPPORTED = 3146175,
	JPEGDECODE_FORMATUNSUPPORTED = 3146176,
	JPEGDECODE_INVALIDSUBRESOURCE = 3146177,
	JPEGDECODE_INVALIDMIPLEVEL = 3146178,
	JPEGDECODE_EMPTYDESTBOX = 3146179,
	JPEGDECODE_DESTBOXNOT2D = 3146180,
	JPEGDECODE_DESTBOXNOTSUB = 3146181,
	JPEGDECODE_DESTBOXESINTERSECT = 3146182,
	JPEGDECODE_XSUBSAMPLEMISMATCH = 3146183,
	JPEGDECODE_YSUBSAMPLEMISMATCH = 3146184,
	JPEGDECODE_XSUBSAMPLEODD = 3146185,
	JPEGDECODE_YSUBSAMPLEODD = 3146186,
	JPEGDECODE_OUTPUTDIMENSIONSTOOLARGE = 3146187,
	JPEGDECODE_NONPOW2SCALEUNSUPPORTED = 3146188,
	JPEGDECODE_FRACTIONALDOWNSCALETOLARGE = 3146189,
	JPEGDECODE_CHROMASIZEMISMATCH = 3146190,
	JPEGDECODE_LUMACHROMASIZEMISMATCH = 3146191,
	JPEGDECODE_INVALIDNUMDESTINATIONS = 3146192,
	JPEGDECODE_SUBBOXUNSUPPORTED = 3146193,
	JPEGDECODE_1DESTUNSUPPORTEDFORMAT = 3146194,
	JPEGDECODE_3DESTUNSUPPORTEDFORMAT = 3146195,
	JPEGDECODE_SCALEUNSUPPORTED = 3146196,
	JPEGDECODE_INVALIDSOURCESIZE = 3146197,
	JPEGDECODE_INVALIDCOPYFLAGS = 3146198,
	JPEGDECODE_HAZARD = 3146199,
	JPEGDECODE_UNSUPPORTEDSRCBUFFERUSAGE = 3146200,
	JPEGDECODE_UNSUPPORTEDSRCBUFFERMISCFLAGS = 3146201,
	JPEGDECODE_UNSUPPORTEDDSTTEXTUREUSAGE = 3146202,
	JPEGDECODE_BACKBUFFERNOTSUPPORTED = 3146203,
	JPEGDECODE_UNSUPPRTEDCOPYFLAGS = 3146204,
	JPEGENCODE_NOTSUPPORTED = 3146205,
	JPEGENCODE_INVALIDSCANDATAOFFSET = 3146206,
	JPEGENCODE_INVALIDCOMPONENTS = 3146207,
	JPEGENCODE_SOURCENOT2D = 3146208,
	JPEGENCODE_TILEDRESOURCESUNSUPPORTED = 3146209,
	JPEGENCODE_GUARDRECTSUNSUPPORTED = 3146210,
	JPEGENCODE_XSUBSAMPLEMISMATCH = 3146211,
	JPEGENCODE_YSUBSAMPLEMISMATCH = 3146212,
	JPEGENCODE_FORMATUNSUPPORTED = 3146213,
	JPEGENCODE_INVALIDSUBRESOURCE = 3146214,
	JPEGENCODE_INVALIDMIPLEVEL = 3146215,
	JPEGENCODE_DIMENSIONSTOOLARGE = 3146216,
	JPEGENCODE_HAZARD = 3146217,
	JPEGENCODE_UNSUPPORTEDDSTBUFFERUSAGE = 3146218,
	JPEGENCODE_UNSUPPORTEDDSTBUFFERMISCFLAGS = 3146219,
	JPEGENCODE_UNSUPPORTEDSRCTEXTUREUSAGE = 3146220,
	JPEGENCODE_BACKBUFFERNOTSUPPORTED = 3146221,
	CREATEQUERYORPREDICATE_UNSUPPORTEDCONTEXTTTYPEFORQUERY = 3146222,
	FLUSH1_INVALIDCONTEXTTYPE = 3146223,
	DEVICE_SETHARDWAREPROTECTION_INVALIDCONTEXT = 3146224,
	VIDEOPROCESSORSETOUTPUTHDRMETADATA_NULLPARAM = 3146225,
	VIDEOPROCESSORSETOUTPUTHDRMETADATA_INVALIDSIZE = 3146226,
	VIDEOPROCESSORGETOUTPUTHDRMETADATA_NULLPARAM = 3146227,
	VIDEOPROCESSORGETOUTPUTHDRMETADATA_INVALIDSIZE = 3146228,
	VIDEOPROCESSORSETSTREAMHDRMETADATA_NULLPARAM = 3146229,
	VIDEOPROCESSORSETSTREAMHDRMETADATA_INVALIDSTREAM = 3146230,
	VIDEOPROCESSORSETSTREAMHDRMETADATA_INVALIDSIZE = 3146231,
	VIDEOPROCESSORGETSTREAMHDRMETADATA_NULLPARAM = 3146232,
	VIDEOPROCESSORGETSTREAMHDRMETADATA_INVALIDSTREAM = 3146233,
	VIDEOPROCESSORGETSTREAMHDRMETADATA_INVALIDSIZE = 3146234,
	VIDEOPROCESSORGETSTREAMFRAMEFORMAT_INVALIDSTREAM = 3146235,
	VIDEOPROCESSORGETSTREAMCOLORSPACE_INVALIDSTREAM = 3146236,
	VIDEOPROCESSORGETSTREAMOUTPUTRATE_INVALIDSTREAM = 3146237,
	VIDEOPROCESSORGETSTREAMSOURCERECT_INVALIDSTREAM = 3146238,
	VIDEOPROCESSORGETSTREAMDESTRECT_INVALIDSTREAM = 3146239,
	VIDEOPROCESSORGETSTREAMALPHA_INVALIDSTREAM = 3146240,
	VIDEOPROCESSORGETSTREAMPALETTE_INVALIDSTREAM = 3146241,
	VIDEOPROCESSORGETSTREAMPIXELASPECTRATIO_INVALIDSTREAM = 3146242,
	VIDEOPROCESSORGETSTREAMLUMAKEY_INVALIDSTREAM = 3146243,
	VIDEOPROCESSORGETSTREAMSTEREOFORMAT_INVALIDSTREAM = 3146244,
	VIDEOPROCESSORGETSTREAMAUTOPROCESSINGMODE_INVALIDSTREAM = 3146245,
	VIDEOPROCESSORGETSTREAMFILTER_INVALIDSTREAM = 3146246,
	VIDEOPROCESSORGETSTREAMROTATION_INVALIDSTREAM = 3146247,
	VIDEOPROCESSORGETSTREAMCOLORSPACE1_INVALIDSTREAM = 3146248,
	VIDEOPROCESSORGETSTREAMMIRROR_INVALIDSTREAM = 3146249,
	CREATE_FENCE = 3146250,
	LIVE_FENCE = 3146251,
	DESTROY_FENCE = 3146252,
	CREATE_SYNCHRONIZEDCHANNEL = 3146253,
	LIVE_SYNCHRONIZEDCHANNEL = 3146254,
	DESTROY_SYNCHRONIZEDCHANNEL = 3146255,
	CREATEFENCE_INVALIDFLAGS = 3146256,
	D3D11_3_MESSAGES_END = 3146257,
	D3D11_5_MESSAGES_START = 3146258,
	NEGOTIATECRYPTOSESSIONKEYEXCHANGEMT_INVALIDKEYEXCHANGETYPE = 3146259,
	NEGOTIATECRYPTOSESSIONKEYEXCHANGEMT_NOT_SUPPORTED = 3146260,
	DECODERBEGINFRAME_INVALID_HISTOGRAM_COMPONENT_COUNT = 3146261,
	DECODERBEGINFRAME_INVALID_HISTOGRAM_COMPONENT = 3146262,
	DECODERBEGINFRAME_INVALID_HISTOGRAM_BUFFER_SIZE = 3146263,
	DECODERBEGINFRAME_INVALID_HISTOGRAM_BUFFER_USAGE = 3146264,
	DECODERBEGINFRAME_INVALID_HISTOGRAM_BUFFER_MISC_FLAGS = 3146265,
	DECODERBEGINFRAME_INVALID_HISTOGRAM_BUFFER_OFFSET = 3146266,
	CREATE_TRACKEDWORKLOAD = 3146267,
	LIVE_TRACKEDWORKLOAD = 3146268,
	DESTROY_TRACKEDWORKLOAD = 3146269,
	CREATE_TRACKED_WORKLOAD_NULLPARAM = 3146270,
	CREATE_TRACKED_WORKLOAD_INVALID_MAX_INSTANCES = 3146271,
	CREATE_TRACKED_WORKLOAD_INVALID_DEADLINE_TYPE = 3146272,
	CREATE_TRACKED_WORKLOAD_INVALID_ENGINE_TYPE = 3146273,
	MULTIPLE_TRACKED_WORKLOADS = 3146274,
	MULTIPLE_TRACKED_WORKLOAD_PAIRS = 3146275,
	INCOMPLETE_TRACKED_WORKLOAD_PAIR = 3146276,
	OUT_OF_ORDER_TRACKED_WORKLOAD_PAIR = 3146277,
	CANNOT_ADD_TRACKED_WORKLOAD = 3146278,
	TRACKED_WORKLOAD_NOT_SUPPORTED = 3146279,
	TRACKED_WORKLOAD_ENGINE_TYPE_NOT_FOUND = 3146280,
	NO_TRACKED_WORKLOAD_SLOT_AVAILABLE = 3146281,
	END_TRACKED_WORKLOAD_INVALID_ARG = 3146282,
	TRACKED_WORKLOAD_DISJOINT_FAILURE = 3146283,
	D3D11_5_MESSAGES_END = 3146284,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_message_severity ]]
MESSAGE_SEVERITY :: enum i32 {
	CORRUPTION = 0,
	ERROR = 1,
	WARNING = 2,
	INFO = 3,
	MESSAGE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_omac ]]
OMAC :: struct {
	Omac: [16]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_packed_mip_desc ]]
PACKED_MIP_DESC :: struct {
	NumStandardMips: u8,
	NumPackedMips: u8,
	NumTilesForPackedMips: u32,
	StartTileIndexInOverallResource: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_parameter_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_pixel_shader_trace_desc ]]
PIXEL_SHADER_TRACE_DESC :: struct {
	Invocation: u64,
	X: i32,
	Y: i32,
	SampleMask: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_query ]]
QUERY :: enum i32 {
	EVENT = 0,
	OCCLUSION = 1,
	TIMESTAMP = 2,
	TIMESTAMP_DISJOINT = 3,
	PIPELINE_STATISTICS = 4,
	OCCLUSION_PREDICATE = 5,
	SO_STATISTICS = 6,
	SO_OVERFLOW_PREDICATE = 7,
	SO_STATISTICS_STREAM0 = 8,
	SO_OVERFLOW_PREDICATE_STREAM0 = 9,
	SO_STATISTICS_STREAM1 = 10,
	SO_OVERFLOW_PREDICATE_STREAM1 = 11,
	SO_STATISTICS_STREAM2 = 12,
	SO_OVERFLOW_PREDICATE_STREAM2 = 13,
	SO_STATISTICS_STREAM3 = 14,
	SO_OVERFLOW_PREDICATE_STREAM3 = 15,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_query_data_pipeline_statistics ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_query_data_so_statistics ]]
QUERY_DATA_SO_STATISTICS :: struct {
	NumPrimitivesWritten: u64,
	PrimitivesStorageNeeded: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_query_data_timestamp_disjoint ]]
QUERY_DATA_TIMESTAMP_DISJOINT :: struct {
	Frequency: u64,
	Disjoint: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_query_desc ]]
QUERY_DESC :: struct {
	Query: QUERY,
	MiscFlags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_query_desc1 ]]
QUERY_DESC1 :: struct {
	Query: QUERY,
	MiscFlags: u32,
	ContextType: CONTEXT_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_query_misc_flag ]]
QUERY_MISC_FLAG :: enum i32 {
	PREDICATEHINT = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_raise_flag ]]
RAISE_FLAG :: enum i32 {
	DRIVER_INTERNAL_ERROR = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_rasterizer_desc ]]
RASTERIZER_DESC :: struct {
	FillMode: FILL_MODE,
	CullMode: CULL_MODE,
	FrontCounterClockwise: BOOL,
	DepthBias: i32,
	DepthBiasClamp: f32,
	SlopeScaledDepthBias: f32,
	DepthClipEnable: BOOL,
	ScissorEnable: BOOL,
	MultisampleEnable: BOOL,
	AntialiasedLineEnable: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_rasterizer_desc1 ]]
RASTERIZER_DESC1 :: struct {
	FillMode: FILL_MODE,
	CullMode: CULL_MODE,
	FrontCounterClockwise: BOOL,
	DepthBias: i32,
	DepthBiasClamp: f32,
	SlopeScaledDepthBias: f32,
	DepthClipEnable: BOOL,
	ScissorEnable: BOOL,
	MultisampleEnable: BOOL,
	AntialiasedLineEnable: BOOL,
	ForcedSampleCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_rasterizer_desc2 ]]
RASTERIZER_DESC2 :: struct {
	FillMode: FILL_MODE,
	CullMode: CULL_MODE,
	FrontCounterClockwise: BOOL,
	DepthBias: i32,
	DepthBiasClamp: f32,
	SlopeScaledDepthBias: f32,
	DepthClipEnable: BOOL,
	ScissorEnable: BOOL,
	MultisampleEnable: BOOL,
	AntialiasedLineEnable: BOOL,
	ForcedSampleCount: u32,
	ConservativeRaster: CONSERVATIVE_RASTERIZATION_MODE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_render_target_blend_desc ]]
RENDER_TARGET_BLEND_DESC :: struct {
	BlendEnable: BOOL,
	SrcBlend: BLEND,
	DestBlend: BLEND,
	BlendOp: BLEND_OP,
	SrcBlendAlpha: BLEND,
	DestBlendAlpha: BLEND,
	BlendOpAlpha: BLEND_OP,
	RenderTargetWriteMask: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_render_target_blend_desc1 ]]
RENDER_TARGET_BLEND_DESC1 :: struct {
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_render_target_view_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_render_target_view_desc1 ]]
RENDER_TARGET_VIEW_DESC1 :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: RTV_DIMENSION,
	using _: struct #raw_union {
		Buffer: BUFFER_RTV,
		Texture1D: TEX1D_RTV,
		Texture1DArray: TEX1D_ARRAY_RTV,
		Texture2D: TEX2D_RTV1,
		Texture2DArray: TEX2D_ARRAY_RTV1,
		Texture2DMS: TEX2DMS_RTV,
		Texture2DMSArray: TEX2DMS_ARRAY_RTV,
		Texture3D: TEX3D_RTV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_resource_dimension ]]
RESOURCE_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	BUFFER = 1,
	TEXTURE1D = 2,
	TEXTURE2D = 3,
	TEXTURE3D = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11on12/ns-d3d11on12-d3d11_resource_flags ]]
RESOURCE_FLAGS :: struct {
	BindFlags: u32,
	MiscFlags: u32,
	CPUAccessFlags: u32,
	StructureByteStride: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_resource_misc_flag ]]
RESOURCE_MISC_FLAG :: distinct bit_set[enum {
	GENERATE_MIPS = 0,
	SHARED = 1,
	TEXTURECUBE = 2,
	DRAWINDIRECT_ARGS = 4,
	BUFFER_ALLOW_RAW_VIEWS = 5,
	BUFFER_STRUCTURED = 6,
	RESOURCE_CLAMP = 7,
	SHARED_KEYEDMUTEX = 8,
	GDI_COMPATIBLE = 9,
	SHARED_NTHANDLE = 11,
	RESTRICTED_CONTENT = 12,
	RESTRICT_SHARED_RESOURCE = 13,
	RESTRICT_SHARED_RESOURCE_DRIVER = 14,
	GUARDED = 15,
	TILE_POOL = 17,
	TILED = 18,
	HW_PROTECTED = 19,
	SHARED_DISPLAYABLE = 20,
	SHARED_EXCLUSIVE_WRITER = 21,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_rldo_flags ]]
RLDO_FLAGS :: distinct bit_set[enum {
	SUMMARY = 0,
	DETAIL = 1,
	IGNORE_INTERNAL = 2,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_rtv_dimension ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_sampler_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_buffer_desc ]]
SHADER_BUFFER_DESC :: struct {
	Name: PSTR,
	Type: d3d.CBUFFER_TYPE,
	Variables: u32,
	Size: u32,
	uFlags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_shader_cache_support_flags ]]
SHADER_CACHE_SUPPORT_FLAGS :: enum i32 {
	NONE = 0,
	AUTOMATIC_INPROC_CACHE = 1,
	AUTOMATIC_DISK_CACHE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_input_bind_desc ]]
SHADER_INPUT_BIND_DESC :: struct {
	Name: PSTR,
	Type: d3d.SHADER_INPUT_TYPE,
	BindPoint: u32,
	BindCount: u32,
	uFlags: u32,
	ReturnType: d3d.RESOURCE_RETURN_TYPE,
	Dimension: d3d.SRV_DIMENSION,
	NumSamples: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_shader_min_precision_support ]]
SHADER_MIN_PRECISION_SUPPORT :: enum i32 {
	_0_BIT = 1,
	_6_BIT = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_shader_resource_view_desc ]]
SHADER_RESOURCE_VIEW_DESC :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: d3d.SRV_DIMENSION,
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
		BufferEx: BUFFEREX_SRV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_shader_resource_view_desc1 ]]
SHADER_RESOURCE_VIEW_DESC1 :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: d3d.SRV_DIMENSION,
	using _: struct #raw_union {
		Buffer: BUFFER_SRV,
		Texture1D: TEX1D_SRV,
		Texture1DArray: TEX1D_ARRAY_SRV,
		Texture2D: TEX2D_SRV1,
		Texture2DArray: TEX2D_ARRAY_SRV1,
		Texture2DMS: TEX2DMS_SRV,
		Texture2DMSArray: TEX2DMS_ARRAY_SRV,
		Texture3D: TEX3D_SRV,
		TextureCube: TEXCUBE_SRV,
		TextureCubeArray: TEXCUBE_ARRAY_SRV,
		BufferEx: BUFFEREX_SRV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_shader_trace_desc ]]
SHADER_TRACE_DESC :: struct {
	Type: SHADER_TYPE,
	Flags: u32,
	using _: struct #raw_union {
		VertexShaderTraceDesc: VERTEX_SHADER_TRACE_DESC,
		HullShaderTraceDesc: HULL_SHADER_TRACE_DESC,
		DomainShaderTraceDesc: DOMAIN_SHADER_TRACE_DESC,
		GeometryShaderTraceDesc: GEOMETRY_SHADER_TRACE_DESC,
		PixelShaderTraceDesc: PIXEL_SHADER_TRACE_DESC,
		ComputeShaderTraceDesc: COMPUTE_SHADER_TRACE_DESC,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_options ]]
SHADER_TRACKING_OPTIONS :: enum i32 {
	IGNORE = 0,
	TRACK_UNINITIALIZED = 1,
	TRACK_RAW = 2,
	TRACK_WAR = 4,
	TRACK_WAW = 8,
	ALLOW_SAME = 16,
	TRACK_ATOMIC_CONSISTENCY = 32,
	TRACK_RAW_ACROSS_THREADGROUPS = 64,
	TRACK_WAR_ACROSS_THREADGROUPS = 128,
	TRACK_WAW_ACROSS_THREADGROUPS = 256,
	TRACK_ATOMIC_CONSISTENCY_ACROSS_THREADGROUPS = 512,
	UAV_SPECIFIC_FLAGS = 960,
	ALL_HAZARDS = 1006,
	ALL_HAZARDS_ALLOWING_SAME = 1022,
	ALL_OPTIONS = 1023,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/ne-d3d11sdklayers-d3d11_shader_tracking_resource_type ]]
SHADER_TRACKING_RESOURCE_TYPE :: enum i32 {
	NONE = 0,
	UAV_DEVICEMEMORY = 1,
	NON_UAV_DEVICEMEMORY = 2,
	ALL_DEVICEMEMORY = 3,
	GROUPSHARED_MEMORY = 4,
	ALL_SHARED_MEMORY = 5,
	GROUPSHARED_NON_UAV = 6,
	ALL = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_shader_type ]]
SHADER_TYPE :: enum i32 {
	VERTEX_SHADER = 1,
	HULL_SHADER = 2,
	DOMAIN_SHADER = 3,
	GEOMETRY_SHADER = 4,
	PIXEL_SHADER = 5,
	COMPUTE_SHADER = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_type_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_shader_variable_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ne-d3d11shader-d3d11_shader_version_type ]]
SHADER_VERSION_TYPE :: enum i32 {
	PIXEL_SHADER = 0,
	VERTEX_SHADER = 1,
	GEOMETRY_SHADER = 2,
	HULL_SHADER = 3,
	DOMAIN_SHADER = 4,
	COMPUTE_SHADER = 5,
	RESERVED0 = 65520,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_shared_resource_tier ]]
SHARED_RESOURCE_TIER :: enum i32 {
	_0 = 0,
	_1 = 1,
	_2 = 2,
	_3 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/ns-d3d11shader-d3d11_signature_parameter_desc ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_so_declaration_entry ]]
SO_DECLARATION_ENTRY :: struct {
	Stream: u32,
	SemanticName: PSTR,
	SemanticIndex: u32,
	StartComponent: u8,
	ComponentCount: u8,
	OutputSlot: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_standard_multisample_quality_levels ]]
STANDARD_MULTISAMPLE_QUALITY_LEVELS :: enum i32 {
	STANDARD_MULTISAMPLE_PATTERN = -1,
	CENTER_MULTISAMPLE_PATTERN = -2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_stencil_op ]]
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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_subresource_data ]]
SUBRESOURCE_DATA :: struct {
	pSysMem: rawptr,
	SysMemPitch: u32,
	SysMemSlicePitch: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_subresource_tiling ]]
SUBRESOURCE_TILING :: struct {
	WidthInTiles: u32,
	HeightInTiles: u16,
	DepthInTiles: u16,
	StartTileIndexInOverallResource: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_array_dsv ]]
TEX1D_ARRAY_DSV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_array_rtv ]]
TEX1D_ARRAY_RTV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_array_srv ]]
TEX1D_ARRAY_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_array_uav ]]
TEX1D_ARRAY_UAV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_dsv ]]
TEX1D_DSV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_rtv ]]
TEX1D_RTV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_srv ]]
TEX1D_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex1d_uav ]]
TEX1D_UAV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_array_dsv ]]
TEX2D_ARRAY_DSV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_array_rtv ]]
TEX2D_ARRAY_RTV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_array_rtv1 ]]
TEX2D_ARRAY_RTV1 :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_array_srv ]]
TEX2D_ARRAY_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_array_srv1 ]]
TEX2D_ARRAY_SRV1 :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_array_uav ]]
TEX2D_ARRAY_UAV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_array_uav1 ]]
TEX2D_ARRAY_UAV1 :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_array_vpov ]]
TEX2D_ARRAY_VPOV :: struct {
	MipSlice: u32,
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_dsv ]]
TEX2D_DSV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_rtv ]]
TEX2D_RTV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_rtv1 ]]
TEX2D_RTV1 :: struct {
	MipSlice: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_srv ]]
TEX2D_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_srv1 ]]
TEX2D_SRV1 :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_uav ]]
TEX2D_UAV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_tex2d_uav1 ]]
TEX2D_UAV1 :: struct {
	MipSlice: u32,
	PlaneSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_vdov ]]
TEX2D_VDOV :: struct {
	ArraySlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_vpiv ]]
TEX2D_VPIV :: struct {
	MipSlice: u32,
	ArraySlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2d_vpov ]]
TEX2D_VPOV :: struct {
	MipSlice: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2dms_array_dsv ]]
TEX2DMS_ARRAY_DSV :: struct {
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2dms_array_rtv ]]
TEX2DMS_ARRAY_RTV :: struct {
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2dms_array_srv ]]
TEX2DMS_ARRAY_SRV :: struct {
	FirstArraySlice: u32,
	ArraySize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2dms_dsv ]]
TEX2DMS_DSV :: struct {
	UnusedField_NothingToDefine: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2dms_rtv ]]
TEX2DMS_RTV :: struct {
	UnusedField_NothingToDefine: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex2dms_srv ]]
TEX2DMS_SRV :: struct {
	UnusedField_NothingToDefine: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex3d_rtv ]]
TEX3D_RTV :: struct {
	MipSlice: u32,
	FirstWSlice: u32,
	WSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex3d_srv ]]
TEX3D_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_tex3d_uav ]]
TEX3D_UAV :: struct {
	MipSlice: u32,
	FirstWSlice: u32,
	WSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_texcube_array_srv ]]
TEXCUBE_ARRAY_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
	First2DArrayFace: u32,
	NumCubes: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_texcube_srv ]]
TEXCUBE_SRV :: struct {
	MostDetailedMip: u32,
	MipLevels: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_texture_address_mode ]]
TEXTURE_ADDRESS_MODE :: enum i32 {
	WRAP = 1,
	MIRROR = 2,
	CLAMP = 3,
	BORDER = 4,
	MIRROR_ONCE = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ne-d3d11_3-d3d11_texture_layout ]]
TEXTURE_LAYOUT :: enum i32 {
	UNDEFINED = 0,
	ROW_MAJOR = 1,
	_64K_STANDARD_SWIZZLE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_texture1d_desc ]]
TEXTURE1D_DESC :: struct {
	Width: u32,
	MipLevels: u32,
	ArraySize: u32,
	Format: dxgi.FORMAT,
	Usage: USAGE,
	BindFlags: BIND_FLAG,
	CPUAccessFlags: CPU_ACCESS_FLAG,
	MiscFlags: RESOURCE_MISC_FLAG,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_texture2d_desc ]]
TEXTURE2D_DESC :: struct {
	Width: u32,
	Height: u32,
	MipLevels: u32,
	ArraySize: u32,
	Format: dxgi.FORMAT,
	SampleDesc: dxgi.SAMPLE_DESC,
	Usage: USAGE,
	BindFlags: BIND_FLAG,
	CPUAccessFlags: CPU_ACCESS_FLAG,
	MiscFlags: RESOURCE_MISC_FLAG,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_texture2d_desc1 ]]
TEXTURE2D_DESC1 :: struct {
	Width: u32,
	Height: u32,
	MipLevels: u32,
	ArraySize: u32,
	Format: dxgi.FORMAT,
	SampleDesc: dxgi.SAMPLE_DESC,
	Usage: USAGE,
	BindFlags: BIND_FLAG,
	CPUAccessFlags: CPU_ACCESS_FLAG,
	MiscFlags: RESOURCE_MISC_FLAG,
	TextureLayout: TEXTURE_LAYOUT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_texture3d_desc ]]
TEXTURE3D_DESC :: struct {
	Width: u32,
	Height: u32,
	Depth: u32,
	MipLevels: u32,
	Format: dxgi.FORMAT,
	Usage: USAGE,
	BindFlags: BIND_FLAG,
	CPUAccessFlags: CPU_ACCESS_FLAG,
	MiscFlags: RESOURCE_MISC_FLAG,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_texture3d_desc1 ]]
TEXTURE3D_DESC1 :: struct {
	Width: u32,
	Height: u32,
	Depth: u32,
	MipLevels: u32,
	Format: dxgi.FORMAT,
	Usage: USAGE,
	BindFlags: BIND_FLAG,
	CPUAccessFlags: CPU_ACCESS_FLAG,
	MiscFlags: RESOURCE_MISC_FLAG,
	TextureLayout: TEXTURE_LAYOUT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_texturecube_face ]]
TEXTURECUBE_FACE :: enum i32 {
	POSITIVE_X = 0,
	NEGATIVE_X = 1,
	POSITIVE_Y = 2,
	NEGATIVE_Y = 3,
	POSITIVE_Z = 4,
	NEGATIVE_Z = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ne-d3d11_2-d3d11_tile_copy_flag ]]
TILE_COPY_FLAG :: enum i32 {
	NO_OVERWRITE = 1,
	LINEAR_BUFFER_TO_SWIZZLED_TILED_RESOURCE = 2,
	SWIZZLED_TILED_RESOURCE_TO_LINEAR_BUFFER = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ne-d3d11_2-d3d11_tile_mapping_flag ]]
TILE_MAPPING_FLAG :: enum i32 {
	NO_OVERWRITE = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ne-d3d11_2-d3d11_tile_range_flag ]]
TILE_RANGE_FLAG :: enum i32 {
	NULL = 1,
	SKIP = 2,
	REUSE_SINGLE_TILE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_tile_region_size ]]
TILE_REGION_SIZE :: struct {
	NumTiles: u32,
	bUseBox: BOOL,
	Width: u32,
	Height: u16,
	Depth: u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_tile_shape ]]
TILE_SHAPE :: struct {
	WidthInTexels: u32,
	HeightInTexels: u32,
	DepthInTexels: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/ns-d3d11_2-d3d11_tiled_resource_coordinate ]]
TILED_RESOURCE_COORDINATE :: struct {
	X: u32,
	Y: u32,
	Z: u32,
	Subresource: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_tiled_resources_tier ]]
TILED_RESOURCES_TIER :: enum i32 {
	NOT_SUPPORTED = 0,
	TIER_1 = 1,
	TIER_2 = 2,
	TIER_3 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_gs_input_primitive ]]
TRACE_GS_INPUT_PRIMITIVE :: enum i32 {
	UNDEFINED = 0,
	POINT = 1,
	LINE = 2,
	TRIANGLE = 3,
	LINE_ADJ = 6,
	TRIANGLE_ADJ = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_register ]]
TRACE_REGISTER :: struct {
	RegType: TRACE_REGISTER_TYPE,
	using _: struct #raw_union {
		Index1D: u16,
		Index2D: [2]u16,
	},
	OperandIndex: u8,
	Flags: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ne-d3d11shadertracing-d3d11_trace_register_type ]]
TRACE_REGISTER_TYPE :: enum i32 {
	OUTPUT_NULL_REGISTER = 0,
	INPUT_REGISTER = 1,
	INPUT_PRIMITIVE_ID_REGISTER = 2,
	IMMEDIATE_CONSTANT_BUFFER = 3,
	TEMP_REGISTER = 4,
	INDEXABLE_TEMP_REGISTER = 5,
	OUTPUT_REGISTER = 6,
	OUTPUT_DEPTH_REGISTER = 7,
	CONSTANT_BUFFER = 8,
	IMMEDIATE32 = 9,
	SAMPLER = 10,
	RESOURCE = 11,
	RASTERIZER = 12,
	OUTPUT_COVERAGE_MASK = 13,
	STREAM = 14,
	THIS_POINTER = 15,
	OUTPUT_CONTROL_POINT_ID_REGISTER = 16,
	INPUT_FORK_INSTANCE_ID_REGISTER = 17,
	INPUT_JOIN_INSTANCE_ID_REGISTER = 18,
	INPUT_CONTROL_POINT_REGISTER = 19,
	OUTPUT_CONTROL_POINT_REGISTER = 20,
	INPUT_PATCH_CONSTANT_REGISTER = 21,
	INPUT_DOMAIN_POINT_REGISTER = 22,
	UNORDERED_ACCESS_VIEW = 23,
	THREAD_GROUP_SHARED_MEMORY = 24,
	INPUT_THREAD_ID_REGISTER = 25,
	INPUT_THREAD_GROUP_ID_REGISTER = 26,
	INPUT_THREAD_ID_IN_GROUP_REGISTER = 27,
	INPUT_COVERAGE_MASK_REGISTER = 28,
	INPUT_THREAD_ID_IN_GROUP_FLATTENED_REGISTER = 29,
	INPUT_GS_INSTANCE_ID_REGISTER = 30,
	OUTPUT_DEPTH_GREATER_EQUAL_REGISTER = 31,
	OUTPUT_DEPTH_LESS_EQUAL_REGISTER = 32,
	IMMEDIATE64 = 33,
	INPUT_CYCLE_COUNTER_REGISTER = 34,
	INTERFACE_POINTER = 35,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_stats ]]
TRACE_STATS :: struct {
	TraceDesc: SHADER_TRACE_DESC,
	NumInvocationsInStamp: u8,
	TargetStampIndex: u8,
	NumTraceSteps: u32,
	InputMask: [32]u8,
	OutputMask: [32]u8,
	NumTemps: u16,
	MaxIndexableTempIndex: u16,
	IndexableTempSize: [4096]u16,
	ImmediateConstantBufferSize: u16,
	PixelPosition: [8]u32,
	PixelCoverageMask: [4]u64,
	PixelDiscardedMask: [4]u64,
	PixelCoverageMaskAfterShader: [4]u64,
	PixelCoverageMaskAfterA2CSampleMask: [4]u64,
	PixelCoverageMaskAfterA2CSampleMaskDepth: [4]u64,
	PixelCoverageMaskAfterA2CSampleMaskDepthStencil: [4]u64,
	PSOutputsDepth: BOOL,
	PSOutputsMask: BOOL,
	GSInputPrimitive: TRACE_GS_INPUT_PRIMITIVE,
	GSInputsPrimitiveID: BOOL,
	HSOutputPatchConstantMask: [32]u8,
	DSInputPatchConstantMask: [32]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_step ]]
TRACE_STEP :: struct {
	ID: u32,
	InstructionActive: BOOL,
	NumRegistersWritten: u8,
	NumRegistersRead: u8,
	MiscOperations: u16,
	OpcodeType: u32,
	CurrentGlobalCycle: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_trace_value ]]
TRACE_VALUE :: struct {
	Bits: [4]u32,
	ValidMask: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_uav_dimension ]]
UAV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	BUFFER = 1,
	TEXTURE1D = 2,
	TEXTURE1DARRAY = 3,
	TEXTURE2D = 4,
	TEXTURE2DARRAY = 5,
	TEXTURE3D = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_unordered_access_view_desc ]]
UNORDERED_ACCESS_VIEW_DESC :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: UAV_DIMENSION,
	using _: struct #raw_union {
		Buffer: BUFFER_UAV,
		Texture1D: TEX1D_UAV,
		Texture1DArray: TEX1D_ARRAY_UAV,
		Texture2D: TEX2D_UAV,
		Texture2DArray: TEX2D_ARRAY_UAV,
		Texture3D: TEX3D_UAV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/ns-d3d11_3-d3d11_unordered_access_view_desc1 ]]
UNORDERED_ACCESS_VIEW_DESC1 :: struct {
	Format: dxgi.FORMAT,
	ViewDimension: UAV_DIMENSION,
	using _: struct #raw_union {
		Buffer: BUFFER_UAV,
		Texture1D: TEX1D_UAV,
		Texture1DArray: TEX1D_ARRAY_UAV,
		Texture2D: TEX2D_UAV1,
		Texture2DArray: TEX2D_ARRAY_UAV1,
		Texture3D: TEX3D_UAV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_usage ]]
USAGE :: enum i32 {
	DEFAULT = 0,
	IMMUTABLE = 1,
	DYNAMIC = 2,
	STAGING = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_vdov_dimension ]]
VDOV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	TEXTURE2D = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/ns-d3d11shadertracing-d3d11_vertex_shader_trace_desc ]]
VERTEX_SHADER_TRACE_DESC :: struct {
	Invocation: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_color ]]
VIDEO_COLOR :: struct {
	using _: struct #raw_union {
		YCbCr: VIDEO_COLOR_YCbCrA,
		RGBA: VIDEO_COLOR_RGBA,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_color_rgba ]]
VIDEO_COLOR_RGBA :: struct {
	R: f32,
	G: f32,
	B: f32,
	A: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_color_ycbcra ]]
VIDEO_COLOR_YCbCrA :: struct {
	Y: f32,
	Cb: f32,
	Cr: f32,
	A: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_content_protection_caps ]]
VIDEO_CONTENT_PROTECTION_CAPS :: struct {
	Caps: u32,
	KeyExchangeTypeCount: u32,
	BlockAlignmentSize: u32,
	ProtectedMemorySize: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_begin_frame_crypto_session ]]
VIDEO_DECODER_BEGIN_FRAME_CRYPTO_SESSION :: struct {
	pCryptoSession: ^ICryptoSession,
	BlobSize: u32,
	pBlob: rawptr,
	pKeyInfoId: ^GUID,
	PrivateDataSize: u32,
	pPrivateData: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_buffer_desc ]]
VIDEO_DECODER_BUFFER_DESC :: struct {
	BufferType: VIDEO_DECODER_BUFFER_TYPE,
	BufferIndex: u32,
	DataOffset: u32,
	DataSize: u32,
	FirstMBaddress: u32,
	NumMBsInBuffer: u32,
	Width: u32,
	Height: u32,
	Stride: u32,
	ReservedBits: u32,
	pIV: rawptr,
	IVSize: u32,
	PartialEncryption: BOOL,
	EncryptedBlockInfo: ENCRYPTED_BLOCK_INFO,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_buffer_desc1 ]]
VIDEO_DECODER_BUFFER_DESC1 :: struct {
	BufferType: VIDEO_DECODER_BUFFER_TYPE,
	DataOffset: u32,
	DataSize: u32,
	pIV: rawptr,
	IVSize: u32,
	pSubSampleMappingBlock: ^VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK,
	SubSampleMappingCount: u32,
}

VIDEO_DECODER_BUFFER_DESC2 :: struct {
	BufferType: VIDEO_DECODER_BUFFER_TYPE,
	DataOffset: u32,
	DataSize: u32,
	pIV: rawptr,
	IVSize: u32,
	pSubSampleMappingBlock: ^VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK,
	SubSampleMappingCount: u32,
	cBlocksStripeEncrypted: u32,
	cBlocksStripeClear: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_decoder_buffer_type ]]
VIDEO_DECODER_BUFFER_TYPE :: enum i32 {
	PICTURE_PARAMETERS = 0,
	MACROBLOCK_CONTROL = 1,
	RESIDUAL_DIFFERENCE = 2,
	DEBLOCKING_CONTROL = 3,
	INVERSE_QUANTIZATION_MATRIX = 4,
	SLICE_CONTROL = 5,
	BITSTREAM = 6,
	MOTION_VECTOR = 7,
	FILM_GRAIN = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_video_decoder_caps ]]
VIDEO_DECODER_CAPS :: enum i32 {
	DOWNSAMPLE = 1,
	NON_REAL_TIME = 2,
	DOWNSAMPLE_DYNAMIC = 4,
	DOWNSAMPLE_REQUIRED = 8,
	UNSUPPORTED = 16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_config ]]
VIDEO_DECODER_CONFIG :: struct {
	guidConfigBitstreamEncryption: GUID,
	guidConfigMBcontrolEncryption: GUID,
	guidConfigResidDiffEncryption: GUID,
	ConfigBitstreamRaw: u32,
	ConfigMBcontrolRasterOrder: u32,
	ConfigResidDiffHost: u32,
	ConfigSpatialResid8: u32,
	ConfigResid8Subtraction: u32,
	ConfigSpatialHost8or9Clipping: u32,
	ConfigSpatialResidInterleaved: u32,
	ConfigIntraResidUnsigned: u32,
	ConfigResidDiffAccelerator: u32,
	ConfigHostInverseScan: u32,
	ConfigSpecificIDCT: u32,
	Config4GroupedCoefs: u32,
	ConfigMinRenderTargetBuffCount: u16,
	ConfigDecoderSpecific: u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_desc ]]
VIDEO_DECODER_DESC :: struct {
	Guid: GUID,
	SampleWidth: u32,
	SampleHeight: u32,
	OutputFormat: dxgi.FORMAT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_extension ]]
VIDEO_DECODER_EXTENSION :: struct {
	Function: u32,
	pPrivateInputData: rawptr,
	PrivateInputDataSize: u32,
	pPrivateOutputData: rawptr,
	PrivateOutputDataSize: u32,
	ResourceCount: u32,
	ppResourceList: ^^IResource,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/ne-d3d11_4-d3d11_video_decoder_histogram_component ]]
VIDEO_DECODER_HISTOGRAM_COMPONENT :: enum i32 {
	Y = 0,
	U = 1,
	V = 2,
	R = 0,
	G = 1,
	B = 2,
	A = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/ne-d3d11_4-d3d11_video_decoder_histogram_component_flags ]]
VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS :: distinct bit_set[enum {
	Y = 0,
	U = 1,
	V = 2,
	R = 0,
	G = 1,
	B = 2,
	A = 3,
}; i32]
VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS_NONE :: transmute(VIDEO_DECODER_HISTOGRAM_COMPONENT_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_output_view_desc ]]
VIDEO_DECODER_OUTPUT_VIEW_DESC :: struct {
	DecodeProfile: GUID,
	ViewDimension: VDOV_DIMENSION,
	using _: struct #raw_union {
		Texture2D: TEX2D_VDOV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_decoder_sub_sample_mapping_block ]]
VIDEO_DECODER_SUB_SAMPLE_MAPPING_BLOCK :: struct {
	ClearSize: u32,
	EncryptedSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_frame_format ]]
VIDEO_FRAME_FORMAT :: enum i32 {
	PROGRESSIVE = 0,
	INTERLACED_TOP_FIELD_FIRST = 1,
	INTERLACED_BOTTOM_FIELD_FIRST = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_alpha_fill_mode ]]
VIDEO_PROCESSOR_ALPHA_FILL_MODE :: enum i32 {
	OPAQUE = 0,
	BACKGROUND = 1,
	DESTINATION = 2,
	SOURCE_STREAM = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_auto_stream_caps ]]
VIDEO_PROCESSOR_AUTO_STREAM_CAPS :: enum i32 {
	DENOISE = 1,
	DERINGING = 2,
	EDGE_ENHANCEMENT = 4,
	COLOR_CORRECTION = 8,
	FLESH_TONE_MAPPING = 16,
	IMAGE_STABILIZATION = 32,
	SUPER_RESOLUTION = 64,
	ANAMORPHIC_SCALING = 128,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_video_processor_behavior_hints ]]
VIDEO_PROCESSOR_BEHAVIOR_HINTS :: enum i32 {
	MULTIPLANE_OVERLAY_ROTATION = 1,
	MULTIPLANE_OVERLAY_RESIZE = 2,
	MULTIPLANE_OVERLAY_COLOR_SPACE_CONVERSION = 4,
	TRIPLE_BUFFER_OUTPUT = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_caps ]]
VIDEO_PROCESSOR_CAPS :: struct {
	DeviceCaps: u32,
	FeatureCaps: u32,
	FilterCaps: u32,
	InputFormatCaps: u32,
	AutoStreamCaps: u32,
	StereoCaps: u32,
	RateConversionCapsCount: u32,
	MaxInputStreams: u32,
	MaxStreamStates: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_color_space ]]
VIDEO_PROCESSOR_COLOR_SPACE :: struct {
	using _: bit_field u32 {
		Usage: u32 | 1,
		RGB_Range: u32 | 1,
		YCbCr_Matrix: u32 | 1,
		YCbCr_xvYCC: u32 | 1,
		Nominal_Range: u32 | 2,
		Reserved: u32 | 26,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_content_desc ]]
VIDEO_PROCESSOR_CONTENT_DESC :: struct {
	InputFrameFormat: VIDEO_FRAME_FORMAT,
	InputFrameRate: dxgi.RATIONAL,
	InputWidth: u32,
	InputHeight: u32,
	OutputFrameRate: dxgi.RATIONAL,
	OutputWidth: u32,
	OutputHeight: u32,
	Usage: VIDEO_USAGE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_custom_rate ]]
VIDEO_PROCESSOR_CUSTOM_RATE :: struct {
	CustomRate: dxgi.RATIONAL,
	OutputFrames: u32,
	InputInterlaced: BOOL,
	InputFramesOrFields: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_device_caps ]]
VIDEO_PROCESSOR_DEVICE_CAPS :: enum i32 {
	LINEAR_SPACE = 1,
	xvYCC = 2,
	RGB_RANGE_CONVERSION = 4,
	YCbCr_MATRIX_CONVERSION = 8,
	NOMINAL_RANGE = 16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_feature_caps ]]
VIDEO_PROCESSOR_FEATURE_CAPS :: enum i32 {
	ALPHA_FILL = 1,
	CONSTRICTION = 2,
	LUMA_KEY = 4,
	ALPHA_PALETTE = 8,
	LEGACY = 16,
	STEREO = 32,
	ROTATION = 64,
	ALPHA_STREAM = 128,
	PIXEL_ASPECT_RATIO = 256,
	MIRROR = 512,
	SHADER_USAGE = 1024,
	METADATA_HDR10 = 2048,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_filter ]]
VIDEO_PROCESSOR_FILTER :: enum i32 {
	BRIGHTNESS = 0,
	CONTRAST = 1,
	HUE = 2,
	SATURATION = 3,
	NOISE_REDUCTION = 4,
	EDGE_ENHANCEMENT = 5,
	ANAMORPHIC_SCALING = 6,
	STEREO_ADJUSTMENT = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_filter_caps ]]
VIDEO_PROCESSOR_FILTER_CAPS :: enum i32 {
	BRIGHTNESS = 1,
	CONTRAST = 2,
	HUE = 4,
	SATURATION = 8,
	NOISE_REDUCTION = 16,
	EDGE_ENHANCEMENT = 32,
	ANAMORPHIC_SCALING = 64,
	STEREO_ADJUSTMENT = 128,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_filter_range ]]
VIDEO_PROCESSOR_FILTER_RANGE :: struct {
	Minimum: i32,
	Maximum: i32,
	Default: i32,
	Multiplier: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_format_caps ]]
VIDEO_PROCESSOR_FORMAT_CAPS :: enum i32 {
	RGB_INTERLACED = 1,
	RGB_PROCAMP = 2,
	RGB_LUMA_KEY = 4,
	PALETTE_INTERLACED = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_format_support ]]
VIDEO_PROCESSOR_FORMAT_SUPPORT :: enum i32 {
	INPUT = 1,
	OUTPUT = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_input_view_desc ]]
VIDEO_PROCESSOR_INPUT_VIEW_DESC :: struct {
	FourCC: u32,
	ViewDimension: VPIV_DIMENSION,
	using _: struct #raw_union {
		Texture2D: TEX2D_VPIV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_itelecine_caps ]]
VIDEO_PROCESSOR_ITELECINE_CAPS :: enum i32 {
	_32 = 1,
	_22 = 2,
	_2224 = 4,
	_2332 = 8,
	_32322 = 16,
	_55 = 32,
	_64 = 64,
	_87 = 128,
	_222222222223 = 256,
	OTHER = -2147483648,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_nominal_range ]]
VIDEO_PROCESSOR_NOMINAL_RANGE :: enum i32 {
	UNDEFINED = 0,
	_16_235 = 1,
	_0_255 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_output_rate ]]
VIDEO_PROCESSOR_OUTPUT_RATE :: enum i32 {
	NORMAL = 0,
	HALF = 1,
	CUSTOM = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_output_view_desc ]]
VIDEO_PROCESSOR_OUTPUT_VIEW_DESC :: struct {
	ViewDimension: VPOV_DIMENSION,
	using _: struct #raw_union {
		Texture2D: TEX2D_VPOV,
		Texture2DArray: TEX2D_ARRAY_VPOV,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_processor_caps ]]
VIDEO_PROCESSOR_PROCESSOR_CAPS :: enum i32 {
	DEINTERLACE_BLEND = 1,
	DEINTERLACE_BOB = 2,
	DEINTERLACE_ADAPTIVE = 4,
	DEINTERLACE_MOTION_COMPENSATION = 8,
	INVERSE_TELECINE = 16,
	FRAME_RATE_CONVERSION = 32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps ]]
VIDEO_PROCESSOR_RATE_CONVERSION_CAPS :: struct {
	PastFrames: u32,
	FutureFrames: u32,
	ProcessorCaps: u32,
	ITelecineCaps: u32,
	CustomRateCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_rotation ]]
VIDEO_PROCESSOR_ROTATION :: enum i32 {
	IDENTITY = 0,
	_90 = 1,
	_180 = 2,
	_270 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_caps ]]
VIDEO_PROCESSOR_STEREO_CAPS :: enum i32 {
	MONO_OFFSET = 1,
	ROW_INTERLEAVED = 2,
	COLUMN_INTERLEAVED = 4,
	CHECKERBOARD = 8,
	FLIP_MODE = 16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_flip_mode ]]
VIDEO_PROCESSOR_STEREO_FLIP_MODE :: enum i32 {
	NONE = 0,
	FRAME0 = 1,
	FRAME1 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_processor_stereo_format ]]
VIDEO_PROCESSOR_STEREO_FORMAT :: enum i32 {
	MONO = 0,
	HORIZONTAL = 1,
	VERTICAL = 2,
	SEPARATE = 3,
	MONO_OFFSET = 4,
	ROW_INTERLEAVED = 5,
	COLUMN_INTERLEAVED = 6,
	CHECKERBOARD = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_processor_stream ]]
VIDEO_PROCESSOR_STREAM :: struct {
	Enable: BOOL,
	OutputIndex: u32,
	InputFrameOrField: u32,
	PastFrames: u32,
	FutureFrames: u32,
	ppPastSurfaces: ^^IVideoProcessorInputView,
	pInputSurface: ^IVideoProcessorInputView,
	ppFutureSurfaces: ^^IVideoProcessorInputView,
	ppPastSurfacesRight: ^^IVideoProcessorInputView,
	pInputSurfaceRight: ^IVideoProcessorInputView,
	ppFutureSurfacesRight: ^^IVideoProcessorInputView,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_processor_stream_behavior_hint ]]
VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT :: struct {
	Enable: BOOL,
	Width: u32,
	Height: u32,
	Format: dxgi.FORMAT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_video_sample_desc ]]
VIDEO_SAMPLE_DESC :: struct {
	Width: u32,
	Height: u32,
	Format: dxgi.FORMAT,
	ColorSpace: dxgi.COLOR_SPACE_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_video_usage ]]
VIDEO_USAGE :: enum i32 {
	PLAYBACK_NORMAL = 0,
	OPTIMAL_SPEED = 1,
	OPTIMAL_QUALITY = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_viewport ]]
VIEWPORT :: struct {
	TopLeftX: f32,
	TopLeftY: f32,
	Width: f32,
	Height: f32,
	MinDepth: f32,
	MaxDepth: f32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_vpiv_dimension ]]
VPIV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	TEXTURE2D = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_vpov_dimension ]]
VPOV_DIMENSION :: enum i32 {
	UNKNOWN = 0,
	TEXTURE2D = 1,
	TEXTURE2DARRAY = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info ]]
D3DX11_FFT_BUFFER_INFO :: struct {
	NumTempBufferSizes: u32,
	TempBufferFloatSizes: [4]u32,
	NumPrecomputeBufferSizes: u32,
	PrecomputeBufferFloatSizes: [4]u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_create_flag ]]
D3DX11_FFT_CREATE_FLAG :: enum i32 {
	NO_PRECOMPUTE_BUFFERS = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_data_type ]]
D3DX11_FFT_DATA_TYPE :: enum i32 {
	REAL = 0,
	COMPLEX = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/ns-d3dcsx-d3dx11_fft_desc ]]
D3DX11_FFT_DESC :: struct {
	NumDimensions: u32,
	ElementLengths: [32]u32,
	DimensionMask: u32,
	Type: D3DX11_FFT_DATA_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_fft_dim_mask ]]
D3DX11_FFT_DIM_MASK :: enum i32 {
	_1D = 1,
	_2D = 3,
	_3D = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_data_type ]]
D3DX11_SCAN_DATA_TYPE :: enum i32 {
	FLOAT = 1,
	INT = 2,
	UINT = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_direction ]]
D3DX11_SCAN_DIRECTION :: enum i32 {
	FORWARD = 1,
	BACKWARD = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode ]]
D3DX11_SCAN_OPCODE :: enum i32 {
	ADD = 1,
	MIN = 2,
	MAX = 3,
	MUL = 4,
	AND = 5,
	OR = 6,
	XOR = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11asynchronous ]]
IAsynchronous :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IAsynchronous_Vtbl,
}
IAsynchronous_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetDataSize: proc "system" (this: ^IAsynchronous) -> u32,
}
IID_ID3D11Asynchronous :: GUID{0x4B35D0CD, 0x1E15, 0x4258, {0x9C, 0x98, 0x1B, 0x13, 0x33, 0xF6, 0xDD, 0x3B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11authenticatedchannel ]]
IAuthenticatedChannel :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IAuthenticatedChannel_Vtbl,
}
IAuthenticatedChannel_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetCertificateSize: proc "system" (this: ^IAuthenticatedChannel, pCertificateSize: ^u32) -> HRESULT,
	GetCertificate: proc "system" (this: ^IAuthenticatedChannel, CertificateSize: u32, pCertificate: ^u8) -> HRESULT,
	GetChannelHandle: proc "system" (this: ^IAuthenticatedChannel, pChannelHandle: ^HANDLE),
}
IID_ID3D11AuthenticatedChannel :: GUID{0x3015A308, 0xDCBD, 0x47AA, {0xA7, 0x47, 0x19, 0x24, 0x86, 0xD1, 0x4D, 0x4A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11blendstate ]]
IBlendState :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IBlendState_Vtbl,
}
IBlendState_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetDesc: proc "system" (this: ^IBlendState, pDesc: ^BLEND_DESC),
}
IID_ID3D11BlendState :: GUID{0x75B68FAA, 0x347D, 0x4159, {0x8F, 0x45, 0xA0, 0x64, 0x0F, 0x01, 0xCD, 0x9A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11blendstate1 ]]
IBlendState1 :: struct #raw_union {
	#subtype IBlendState: IBlendState,
	using Vtbl: ^IBlendState1_Vtbl,
}
IBlendState1_Vtbl :: struct {
	using IBlendState_Vtbl: IBlendState_Vtbl,
	GetDesc1: proc "system" (this: ^IBlendState1, pDesc: ^BLEND_DESC1),
}
IID_ID3D11BlendState1 :: GUID{0xCC86FABE, 0xDA55, 0x401D, {0x85, 0xE7, 0xE3, 0xC9, 0xDE, 0x28, 0x77, 0xE9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11buffer ]]
IBuffer :: struct #raw_union {
	#subtype IResource: IResource,
	using Vtbl: ^IBuffer_Vtbl,
}
IBuffer_Vtbl :: struct {
	using IResource_Vtbl: IResource_Vtbl,
	GetDesc: proc "system" (this: ^IBuffer, pDesc: ^BUFFER_DESC),
}
IID_ID3D11Buffer :: GUID{0x48570B85, 0xD1EE, 0x4FCD, {0xA2, 0x50, 0xEB, 0x35, 0x07, 0x22, 0xB0, 0x37}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11classinstance ]]
IClassInstance :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IClassInstance_Vtbl,
}
IClassInstance_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetClassLinkage: proc "system" (this: ^IClassInstance, ppLinkage: ^^IClassLinkage),
	GetDesc: proc "system" (this: ^IClassInstance, pDesc: ^CLASS_INSTANCE_DESC),
	GetInstanceName: proc "system" (this: ^IClassInstance, pInstanceName: PSTR, pBufferLength: ^uintptr),
	GetTypeName: proc "system" (this: ^IClassInstance, pTypeName: PSTR, pBufferLength: ^uintptr),
}
IID_ID3D11ClassInstance :: GUID{0xA6CD7FAA, 0xB0B7, 0x4A2F, {0x94, 0x36, 0x86, 0x62, 0xA6, 0x57, 0x97, 0xCB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11classlinkage ]]
IClassLinkage :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IClassLinkage_Vtbl,
}
IClassLinkage_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetClassInstance: proc "system" (
		this: ^IClassLinkage,
		pClassInstanceName: PSTR,
		InstanceIndex: u32,
		ppInstance: ^^IClassInstance,
	) -> HRESULT,
	CreateClassInstance: proc "system" (
		this: ^IClassLinkage,
		pClassTypeName: PSTR,
		ConstantBufferOffset: u32,
		ConstantVectorOffset: u32,
		TextureOffset: u32,
		SamplerOffset: u32,
		ppInstance: ^^IClassInstance,
	) -> HRESULT,
}
IID_ID3D11ClassLinkage :: GUID{0xDDF57CBA, 0x9543, 0x46E4, {0xA1, 0x2B, 0xF2, 0x07, 0xA0, 0xFE, 0x7F, 0xED}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11commandlist ]]
ICommandList :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^ICommandList_Vtbl,
}
ICommandList_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetContextFlags: proc "system" (this: ^ICommandList) -> u32,
}
IID_ID3D11CommandList :: GUID{0xA24BC4D1, 0x769E, 0x43F7, {0x80, 0x13, 0x98, 0xFF, 0x56, 0x6C, 0x18, 0xE2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11computeshader ]]
IComputeShader :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IComputeShader_Vtbl,
}
IComputeShader_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D11ComputeShader :: GUID{0x4F5B196E, 0xC2BD, 0x495E, {0xBD, 0x01, 0x1F, 0xDE, 0xD3, 0x8E, 0x49, 0x69}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11counter ]]
ICounter :: struct #raw_union {
	#subtype IAsynchronous: IAsynchronous,
	using Vtbl: ^ICounter_Vtbl,
}
ICounter_Vtbl :: struct {
	using IAsynchronous_Vtbl: IAsynchronous_Vtbl,
	GetDesc: proc "system" (this: ^ICounter, pDesc: ^COUNTER_DESC),
}
IID_ID3D11Counter :: GUID{0x6E8C49FB, 0xA371, 0x4770, {0xB4, 0x40, 0x29, 0x08, 0x60, 0x22, 0xB7, 0x41}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11cryptosession ]]
ICryptoSession :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^ICryptoSession_Vtbl,
}
ICryptoSession_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetCryptoType: proc "system" (this: ^ICryptoSession, pCryptoType: ^GUID),
	GetDecoderProfile: proc "system" (this: ^ICryptoSession, pDecoderProfile: ^GUID),
	GetCertificateSize: proc "system" (this: ^ICryptoSession, pCertificateSize: ^u32) -> HRESULT,
	GetCertificate: proc "system" (this: ^ICryptoSession, CertificateSize: u32, pCertificate: ^u8) -> HRESULT,
	GetCryptoSessionHandle: proc "system" (this: ^ICryptoSession, pCryptoSessionHandle: ^HANDLE),
}
IID_ID3D11CryptoSession :: GUID{0x9B32F9AD, 0xBDCC, 0x40A6, {0xA3, 0x9D, 0xD5, 0xC8, 0x65, 0x84, 0x57, 0x20}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11debug ]]
IDebug :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDebug_Vtbl,
}
IDebug_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetFeatureMask: proc "system" (this: ^IDebug, Mask: u32) -> HRESULT,
	GetFeatureMask: proc "system" (this: ^IDebug) -> u32,
	SetPresentPerRenderOpDelay: proc "system" (this: ^IDebug, Milliseconds: u32) -> HRESULT,
	GetPresentPerRenderOpDelay: proc "system" (this: ^IDebug) -> u32,
	SetSwapChain: proc "system" (this: ^IDebug, pSwapChain: ^dxgi.ISwapChain) -> HRESULT,
	GetSwapChain: proc "system" (this: ^IDebug, ppSwapChain: ^^dxgi.ISwapChain) -> HRESULT,
	ValidateContext: proc "system" (this: ^IDebug, pContext: ^IDeviceContext) -> HRESULT,
	ReportLiveDeviceObjects: proc "system" (this: ^IDebug, Flags: RLDO_FLAGS) -> HRESULT,
	ValidateContextForDispatch: proc "system" (this: ^IDebug, pContext: ^IDeviceContext) -> HRESULT,
}
IID_ID3D11Debug :: GUID{0x79CF2233, 0x7536, 0x4948, {0x9D, 0x36, 0x1E, 0x46, 0x92, 0xDC, 0x57, 0x60}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11depthstencilstate ]]
IDepthStencilState :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IDepthStencilState_Vtbl,
}
IDepthStencilState_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetDesc: proc "system" (this: ^IDepthStencilState, pDesc: ^DEPTH_STENCIL_DESC),
}
IID_ID3D11DepthStencilState :: GUID{0x03823EFB, 0x8D8F, 0x4E1C, {0x9A, 0xA2, 0xF6, 0x4B, 0xB2, 0xCB, 0xFD, 0xF1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11depthstencilview ]]
IDepthStencilView :: struct #raw_union {
	#subtype IView: IView,
	using Vtbl: ^IDepthStencilView_Vtbl,
}
IDepthStencilView_Vtbl :: struct {
	using IView_Vtbl: IView_Vtbl,
	GetDesc: proc "system" (this: ^IDepthStencilView, pDesc: ^DEPTH_STENCIL_VIEW_DESC),
}
IID_ID3D11DepthStencilView :: GUID{0x9FDAC92A, 0x1876, 0x48C3, {0xAF, 0xAD, 0x25, 0xB9, 0x4F, 0x84, 0xA9, 0xB6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11device ]]
IDevice :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDevice_Vtbl,
}
IDevice_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateBuffer: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: BUFFER_DESC,
		pInitialData: ^SUBRESOURCE_DATA,
		ppBuffer: ^^IBuffer,
	) -> HRESULT,
	CreateTexture1D: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: TEXTURE1D_DESC,
		pInitialData: ^SUBRESOURCE_DATA,
		ppTexture1D: ^^ITexture1D,
	) -> HRESULT,
	CreateTexture2D: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: TEXTURE2D_DESC,
		pInitialData: ^SUBRESOURCE_DATA,
		ppTexture2D: ^^ITexture2D,
	) -> HRESULT,
	CreateTexture3D: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: TEXTURE3D_DESC,
		pInitialData: ^SUBRESOURCE_DATA,
		ppTexture3D: ^^ITexture3D,
	) -> HRESULT,
	CreateShaderResourceView: proc "system" (
		this: ^IDevice,
		pResource: ^IResource,
		pDesc: ^SHADER_RESOURCE_VIEW_DESC,
		ppSRView: ^^IShaderResourceView,
	) -> HRESULT,
	CreateUnorderedAccessView: proc "system" (
		this: ^IDevice,
		pResource: ^IResource,
		pDesc: ^UNORDERED_ACCESS_VIEW_DESC,
		ppUAView: ^^IUnorderedAccessView,
	) -> HRESULT,
	CreateRenderTargetView: proc "system" (
		this: ^IDevice,
		pResource: ^IResource,
		pDesc: ^RENDER_TARGET_VIEW_DESC,
		ppRTView: ^^IRenderTargetView,
	) -> HRESULT,
	CreateDepthStencilView: proc "system" (
		this: ^IDevice,
		pResource: ^IResource,
		pDesc: ^DEPTH_STENCIL_VIEW_DESC,
		ppDepthStencilView: ^^IDepthStencilView,
	) -> HRESULT,
	CreateInputLayout: proc "system" (
		this: ^IDevice,
		pInputElementDescs: [^]INPUT_ELEMENT_DESC,
		NumElements: u32,
		pShaderBytecodeWithInputSignature: rawptr,
		BytecodeLength: uintptr,
		ppInputLayout: ^^IInputLayout,
	) -> HRESULT,
	CreateVertexShader: proc "system" (
		this: ^IDevice,
		pShaderBytecode: rawptr,
		BytecodeLength: uintptr,
		pClassLinkage: ^IClassLinkage,
		ppVertexShader: ^^IVertexShader,
	) -> HRESULT,
	CreateGeometryShader: proc "system" (
		this: ^IDevice,
		pShaderBytecode: rawptr,
		BytecodeLength: uintptr,
		pClassLinkage: ^IClassLinkage,
		ppGeometryShader: ^^IGeometryShader,
	) -> HRESULT,
	CreateGeometryShaderWithStreamOutput: proc "system" (
		this: ^IDevice,
		pShaderBytecode: rawptr,
		BytecodeLength: uintptr,
		pSODeclaration: [^]SO_DECLARATION_ENTRY,
		NumEntries: u32,
		pBufferStrides: [^]u32,
		NumStrides: u32,
		RasterizedStream: u32,
		pClassLinkage: ^IClassLinkage,
		ppGeometryShader: ^^IGeometryShader,
	) -> HRESULT,
	CreatePixelShader: proc "system" (
		this: ^IDevice,
		pShaderBytecode: rawptr,
		BytecodeLength: uintptr,
		pClassLinkage: ^IClassLinkage,
		ppPixelShader: ^^IPixelShader,
	) -> HRESULT,
	CreateHullShader: proc "system" (
		this: ^IDevice,
		pShaderBytecode: rawptr,
		BytecodeLength: uintptr,
		pClassLinkage: ^IClassLinkage,
		ppHullShader: ^^IHullShader,
	) -> HRESULT,
	CreateDomainShader: proc "system" (
		this: ^IDevice,
		pShaderBytecode: rawptr,
		BytecodeLength: uintptr,
		pClassLinkage: ^IClassLinkage,
		ppDomainShader: ^^IDomainShader,
	) -> HRESULT,
	CreateComputeShader: proc "system" (
		this: ^IDevice,
		pShaderBytecode: rawptr,
		BytecodeLength: uintptr,
		pClassLinkage: ^IClassLinkage,
		ppComputeShader: ^^IComputeShader,
	) -> HRESULT,
	CreateClassLinkage: proc "system" (this: ^IDevice, ppLinkage: ^^IClassLinkage) -> HRESULT,
	CreateBlendState: proc "system" (
		this: ^IDevice,
		#by_ptr pBlendStateDesc: BLEND_DESC,
		ppBlendState: ^^IBlendState,
	) -> HRESULT,
	CreateDepthStencilState: proc "system" (
		this: ^IDevice,
		#by_ptr pDepthStencilDesc: DEPTH_STENCIL_DESC,
		ppDepthStencilState: ^^IDepthStencilState,
	) -> HRESULT,
	CreateRasterizerState: proc "system" (
		this: ^IDevice,
		#by_ptr pRasterizerDesc: RASTERIZER_DESC,
		ppRasterizerState: ^^IRasterizerState,
	) -> HRESULT,
	CreateSamplerState: proc "system" (
		this: ^IDevice,
		#by_ptr pSamplerDesc: SAMPLER_DESC,
		ppSamplerState: ^^ISamplerState,
	) -> HRESULT,
	CreateQuery: proc "system" (this: ^IDevice, #by_ptr pQueryDesc: QUERY_DESC, ppQuery: ^^IQuery) -> HRESULT,
	CreatePredicate: proc "system" (
		this: ^IDevice,
		#by_ptr pPredicateDesc: QUERY_DESC,
		ppPredicate: ^^IPredicate,
	) -> HRESULT,
	CreateCounter: proc "system" (this: ^IDevice, #by_ptr pCounterDesc: COUNTER_DESC, ppCounter: ^^ICounter) -> HRESULT,
	CreateDeferredContext: proc "system" (this: ^IDevice, ContextFlags: u32, ppDeferredContext: ^^IDeviceContext) -> HRESULT,
	OpenSharedResource: proc "system" (
		this: ^IDevice,
		hResource: HANDLE,
		#by_ptr ReturnedInterface: GUID,
		ppResource: rawptr,
	) -> HRESULT,
	CheckFormatSupport: proc "system" (this: ^IDevice, Format: dxgi.FORMAT, pFormatSupport: ^u32) -> HRESULT,
	CheckMultisampleQualityLevels: proc "system" (this: ^IDevice, Format: dxgi.FORMAT, SampleCount: u32, pNumQualityLevels: ^u32) -> HRESULT,
	CheckCounterInfo: proc "system" (this: ^IDevice, pCounterInfo: ^COUNTER_INFO),
	CheckCounter: proc "system" (
		this: ^IDevice,
		#by_ptr pDesc: COUNTER_DESC,
		pType: ^COUNTER_TYPE,
		pActiveCounters: ^u32,
		szName: PSTR,
		pNameLength: ^u32,
		szUnits: PSTR,
		pUnitsLength: ^u32,
		szDescription: PSTR,
		pDescriptionLength: ^u32,
	) -> HRESULT,
	CheckFeatureSupport: proc "system" (
		this: ^IDevice,
		Feature: FEATURE,
		pFeatureSupportData: rawptr,
		FeatureSupportDataSize: u32,
	) -> HRESULT,
	GetPrivateData: proc "system" (this: ^IDevice, #by_ptr guid: GUID, pDataSize: ^u32, pData: rawptr) -> HRESULT,
	SetPrivateData: proc "system" (this: ^IDevice, #by_ptr guid: GUID, DataSize: u32, pData: rawptr) -> HRESULT,
	SetPrivateDataInterface: proc "system" (this: ^IDevice, #by_ptr guid: GUID, pData: ^IUnknown) -> HRESULT,
	GetFeatureLevel: proc "system" (this: ^IDevice) -> d3d.FEATURE_LEVEL,
	GetCreationFlags: proc "system" (this: ^IDevice) -> u32,
	GetDeviceRemovedReason: proc "system" (this: ^IDevice) -> HRESULT,
	GetImmediateContext: proc "system" (this: ^IDevice, ppImmediateContext: ^^IDeviceContext),
	SetExceptionMode: proc "system" (this: ^IDevice, RaiseFlags: u32) -> HRESULT,
	GetExceptionMode: proc "system" (this: ^IDevice) -> u32,
}
IID_ID3D11Device :: GUID{0xDB6F6DDB, 0xAC77, 0x4E88, {0x82, 0x53, 0x81, 0x9D, 0xF9, 0xBB, 0xF1, 0x40}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11device1 ]]
IDevice1 :: struct #raw_union {
	#subtype IDevice: IDevice,
	using Vtbl: ^IDevice1_Vtbl,
}
IDevice1_Vtbl :: struct {
	using IDevice_Vtbl: IDevice_Vtbl,
	GetImmediateContext1: proc "system" (this: ^IDevice1, ppImmediateContext: ^^IDeviceContext1),
	CreateDeferredContext1: proc "system" (this: ^IDevice1, ContextFlags: u32, ppDeferredContext: ^^IDeviceContext1) -> HRESULT,
	CreateBlendState1: proc "system" (
		this: ^IDevice1,
		#by_ptr pBlendStateDesc: BLEND_DESC1,
		ppBlendState: ^^IBlendState1,
	) -> HRESULT,
	CreateRasterizerState1: proc "system" (
		this: ^IDevice1,
		#by_ptr pRasterizerDesc: RASTERIZER_DESC1,
		ppRasterizerState: ^^IRasterizerState1,
	) -> HRESULT,
	CreateDeviceContextState: proc "system" (
		this: ^IDevice1,
		Flags: u32,
		pFeatureLevels: [^]d3d.FEATURE_LEVEL,
		FeatureLevels: u32,
		SDKVersion: u32,
		#by_ptr EmulatedInterface: GUID,
		pChosenFeatureLevel: ^d3d.FEATURE_LEVEL,
		ppContextState: ^^ID3DDeviceContextState,
	) -> HRESULT,
	OpenSharedResource1: proc "system" (
		this: ^IDevice1,
		hResource: HANDLE,
		#by_ptr returnedInterface: GUID,
		ppResource: rawptr,
	) -> HRESULT,
	OpenSharedResourceByName: proc "system" (
		this: ^IDevice1,
		lpName: PWSTR,
		dwDesiredAccess: u32,
		#by_ptr returnedInterface: GUID,
		ppResource: rawptr,
	) -> HRESULT,
}
IID_ID3D11Device1 :: GUID{0xA04BFB29, 0x08EF, 0x43D6, {0xA4, 0x9C, 0xA9, 0xBD, 0xBD, 0xCB, 0xE6, 0x86}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/nn-d3d11_2-id3d11device2 ]]
IDevice2 :: struct #raw_union {
	#subtype IDevice1: IDevice1,
	using Vtbl: ^IDevice2_Vtbl,
}
IDevice2_Vtbl :: struct {
	using IDevice1_Vtbl: IDevice1_Vtbl,
	GetImmediateContext2: proc "system" (this: ^IDevice2, ppImmediateContext: ^^IDeviceContext2),
	CreateDeferredContext2: proc "system" (this: ^IDevice2, ContextFlags: u32, ppDeferredContext: ^^IDeviceContext2) -> HRESULT,
	GetResourceTiling: proc "system" (
		this: ^IDevice2,
		pTiledResource: ^IResource,
		pNumTilesForEntireResource: ^u32,
		pPackedMipDesc: ^PACKED_MIP_DESC,
		pStandardTileShapeForNonPackedMips: ^TILE_SHAPE,
		pNumSubresourceTilings: ^u32,
		FirstSubresourceTilingToGet: u32,
		pSubresourceTilingsForNonPackedMips: [^]SUBRESOURCE_TILING,
	),
	CheckMultisampleQualityLevels1: proc "system" (
		this: ^IDevice2,
		Format: dxgi.FORMAT,
		SampleCount: u32,
		Flags: u32,
		pNumQualityLevels: ^u32,
	) -> HRESULT,
}
IID_ID3D11Device2 :: GUID{0x9D06DFFA, 0xD1E5, 0x4D07, {0x83, 0xA8, 0x1B, 0xB1, 0x23, 0xF2, 0xF8, 0x41}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11device3 ]]
IDevice3 :: struct #raw_union {
	#subtype IDevice2: IDevice2,
	using Vtbl: ^IDevice3_Vtbl,
}
IDevice3_Vtbl :: struct {
	using IDevice2_Vtbl: IDevice2_Vtbl,
	CreateTexture2D1: proc "system" (
		this: ^IDevice3,
		#by_ptr pDesc1: TEXTURE2D_DESC1,
		pInitialData: ^SUBRESOURCE_DATA,
		ppTexture2D: ^^ITexture2D1,
	) -> HRESULT,
	CreateTexture3D1: proc "system" (
		this: ^IDevice3,
		#by_ptr pDesc1: TEXTURE3D_DESC1,
		pInitialData: ^SUBRESOURCE_DATA,
		ppTexture3D: ^^ITexture3D1,
	) -> HRESULT,
	CreateRasterizerState2: proc "system" (
		this: ^IDevice3,
		#by_ptr pRasterizerDesc: RASTERIZER_DESC2,
		ppRasterizerState: ^^IRasterizerState2,
	) -> HRESULT,
	CreateShaderResourceView1: proc "system" (
		this: ^IDevice3,
		pResource: ^IResource,
		pDesc1: ^SHADER_RESOURCE_VIEW_DESC1,
		ppSRView1: ^^IShaderResourceView1,
	) -> HRESULT,
	CreateUnorderedAccessView1: proc "system" (
		this: ^IDevice3,
		pResource: ^IResource,
		pDesc1: ^UNORDERED_ACCESS_VIEW_DESC1,
		ppUAView1: ^^IUnorderedAccessView1,
	) -> HRESULT,
	CreateRenderTargetView1: proc "system" (
		this: ^IDevice3,
		pResource: ^IResource,
		pDesc1: ^RENDER_TARGET_VIEW_DESC1,
		ppRTView1: ^^IRenderTargetView1,
	) -> HRESULT,
	CreateQuery1: proc "system" (this: ^IDevice3, #by_ptr pQueryDesc1: QUERY_DESC1, ppQuery1: ^^IQuery1) -> HRESULT,
	GetImmediateContext3: proc "system" (this: ^IDevice3, ppImmediateContext: ^^IDeviceContext3),
	CreateDeferredContext3: proc "system" (this: ^IDevice3, ContextFlags: u32, ppDeferredContext: ^^IDeviceContext3) -> HRESULT,
	WriteToSubresource: proc "system" (
		this: ^IDevice3,
		pDstResource: ^IResource,
		DstSubresource: u32,
		pDstBox: ^BOX,
		pSrcData: rawptr,
		SrcRowPitch: u32,
		SrcDepthPitch: u32,
	),
	ReadFromSubresource: proc "system" (
		this: ^IDevice3,
		pDstData: rawptr,
		DstRowPitch: u32,
		DstDepthPitch: u32,
		pSrcResource: ^IResource,
		SrcSubresource: u32,
		pSrcBox: ^BOX,
	),
}
IID_ID3D11Device3 :: GUID{0xA05C8C37, 0xD2C6, 0x4732, {0xB3, 0xA0, 0x9C, 0xE0, 0xB0, 0xDC, 0x9A, 0xE6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11device4 ]]
IDevice4 :: struct #raw_union {
	#subtype IDevice3: IDevice3,
	using Vtbl: ^IDevice4_Vtbl,
}
IDevice4_Vtbl :: struct {
	using IDevice3_Vtbl: IDevice3_Vtbl,
	RegisterDeviceRemovedEvent: proc "system" (this: ^IDevice4, hEvent: HANDLE, pdwCookie: ^u32) -> HRESULT,
	UnregisterDeviceRemoved: proc "system" (this: ^IDevice4, dwCookie: u32),
}
IID_ID3D11Device4 :: GUID{0x8992AB71, 0x02E6, 0x4B8D, {0xBA, 0x48, 0xB0, 0x56, 0xDC, 0xDA, 0x42, 0xC4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11device5 ]]
IDevice5 :: struct #raw_union {
	#subtype IDevice4: IDevice4,
	using Vtbl: ^IDevice5_Vtbl,
}
IDevice5_Vtbl :: struct {
	using IDevice4_Vtbl: IDevice4_Vtbl,
	OpenSharedFence: proc "system" (
		this: ^IDevice5,
		hFence: HANDLE,
		#by_ptr ReturnedInterface: GUID,
		ppFence: rawptr,
	) -> HRESULT,
	CreateFence: proc "system" (
		this: ^IDevice5,
		InitialValue: u64,
		Flags: FENCE_FLAG,
		#by_ptr ReturnedInterface: GUID,
		ppFence: rawptr,
	) -> HRESULT,
}
IID_ID3D11Device5 :: GUID{0x8FFDE202, 0xA0E7, 0x45DF, {0x9E, 0x01, 0xE8, 0x37, 0x80, 0x1B, 0x5E, 0xA0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11devicechild ]]
IDeviceChild :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDeviceChild_Vtbl,
}
IDeviceChild_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDevice: proc "system" (this: ^IDeviceChild, ppDevice: ^^IDevice),
	GetPrivateData: proc "system" (this: ^IDeviceChild, #by_ptr guid: GUID, pDataSize: ^u32, pData: rawptr) -> HRESULT,
	SetPrivateData: proc "system" (this: ^IDeviceChild, #by_ptr guid: GUID, DataSize: u32, pData: rawptr) -> HRESULT,
	SetPrivateDataInterface: proc "system" (this: ^IDeviceChild, #by_ptr guid: GUID, pData: ^IUnknown) -> HRESULT,
}
IID_ID3D11DeviceChild :: GUID{0x1841E5C8, 0x16B0, 0x489B, {0xBC, 0xC8, 0x44, 0xCF, 0xB0, 0xD5, 0xDE, 0xAE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11devicecontext ]]
IDeviceContext :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IDeviceContext_Vtbl,
}
IDeviceContext_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	VSSetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	PSSetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	PSSetShader: proc "system" (
		this: ^IDeviceContext,
		pPixelShader: ^IPixelShader,
		ppClassInstances: [^]^IClassInstance,
		NumClassInstances: u32,
	),
	PSSetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	VSSetShader: proc "system" (
		this: ^IDeviceContext,
		pVertexShader: ^IVertexShader,
		ppClassInstances: [^]^IClassInstance,
		NumClassInstances: u32,
	),
	DrawIndexed: proc "system" (
		this: ^IDeviceContext,
		IndexCount: u32,
		StartIndexLocation: u32,
		BaseVertexLocation: i32,
	),
	Draw: proc "system" (this: ^IDeviceContext, VertexCount: u32, StartVertexLocation: u32),
	Map: proc "system" (
		this: ^IDeviceContext,
		pResource: ^IResource,
		Subresource: u32,
		MapType: MAP,
		MapFlags: u32,
		pMappedResource: ^MAPPED_SUBRESOURCE,
	) -> HRESULT,
	Unmap: proc "system" (this: ^IDeviceContext, pResource: ^IResource, Subresource: u32),
	PSSetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	IASetInputLayout: proc "system" (this: ^IDeviceContext, pInputLayout: ^IInputLayout),
	IASetVertexBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppVertexBuffers: [^]^IBuffer,
		pStrides: [^]u32,
		pOffsets: [^]u32,
	),
	IASetIndexBuffer: proc "system" (this: ^IDeviceContext, pIndexBuffer: ^IBuffer, Format: dxgi.FORMAT, Offset: u32),
	DrawIndexedInstanced: proc "system" (
		this: ^IDeviceContext,
		IndexCountPerInstance: u32,
		InstanceCount: u32,
		StartIndexLocation: u32,
		BaseVertexLocation: i32,
		StartInstanceLocation: u32,
	),
	DrawInstanced: proc "system" (
		this: ^IDeviceContext,
		VertexCountPerInstance: u32,
		InstanceCount: u32,
		StartVertexLocation: u32,
		StartInstanceLocation: u32,
	),
	GSSetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	GSSetShader: proc "system" (
		this: ^IDeviceContext,
		pShader: ^IGeometryShader,
		ppClassInstances: [^]^IClassInstance,
		NumClassInstances: u32,
	),
	IASetPrimitiveTopology: proc "system" (this: ^IDeviceContext, Topology: d3d.PRIMITIVE_TOPOLOGY),
	VSSetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	VSSetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	Begin: proc "system" (this: ^IDeviceContext, pAsync: ^IAsynchronous),
	End: proc "system" (this: ^IDeviceContext, pAsync: ^IAsynchronous),
	GetData: proc "system" (
		this: ^IDeviceContext,
		pAsync: ^IAsynchronous,
		pData: rawptr,
		DataSize: u32,
		GetDataFlags: u32,
	) -> HRESULT,
	SetPredication: proc "system" (this: ^IDeviceContext, pPredicate: ^IPredicate, PredicateValue: BOOL),
	GSSetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	GSSetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	OMSetRenderTargets: proc "system" (
		this: ^IDeviceContext,
		NumViews: u32,
		ppRenderTargetViews: [^]^IRenderTargetView,
		pDepthStencilView: ^IDepthStencilView,
	),
	OMSetRenderTargetsAndUnorderedAccessViews: proc "system" (
		this: ^IDeviceContext,
		NumRTVs: u32,
		ppRenderTargetViews: [^]^IRenderTargetView,
		pDepthStencilView: ^IDepthStencilView,
		UAVStartSlot: u32,
		NumUAVs: u32,
		ppUnorderedAccessViews: [^]^IUnorderedAccessView,
		pUAVInitialCounts: [^]u32,
	),
	OMSetBlendState: proc "system" (
		this: ^IDeviceContext,
		pBlendState: ^IBlendState,
		BlendFactor: ^[4]f32,
		SampleMask: u32,
	),
	OMSetDepthStencilState: proc "system" (
		this: ^IDeviceContext,
		pDepthStencilState: ^IDepthStencilState,
		StencilRef: u32,
	),
	SOSetTargets: proc "system" (
		this: ^IDeviceContext,
		NumBuffers: u32,
		ppSOTargets: [^]^IBuffer,
		pOffsets: [^]u32,
	),
	DrawAuto: proc "system" (this: ^IDeviceContext),
	DrawIndexedInstancedIndirect: proc "system" (
		this: ^IDeviceContext,
		pBufferForArgs: ^IBuffer,
		AlignedByteOffsetForArgs: u32,
	),
	DrawInstancedIndirect: proc "system" (
		this: ^IDeviceContext,
		pBufferForArgs: ^IBuffer,
		AlignedByteOffsetForArgs: u32,
	),
	Dispatch: proc "system" (
		this: ^IDeviceContext,
		ThreadGroupCountX: u32,
		ThreadGroupCountY: u32,
		ThreadGroupCountZ: u32,
	),
	DispatchIndirect: proc "system" (
		this: ^IDeviceContext,
		pBufferForArgs: ^IBuffer,
		AlignedByteOffsetForArgs: u32,
	),
	RSSetState: proc "system" (this: ^IDeviceContext, pRasterizerState: ^IRasterizerState),
	RSSetViewports: proc "system" (this: ^IDeviceContext, NumViewports: u32, pViewports: [^]VIEWPORT),
	RSSetScissorRects: proc "system" (this: ^IDeviceContext, NumRects: u32, pRects: [^]RECT),
	CopySubresourceRegion: proc "system" (
		this: ^IDeviceContext,
		pDstResource: ^IResource,
		DstSubresource: u32,
		DstX: u32,
		DstY: u32,
		DstZ: u32,
		pSrcResource: ^IResource,
		SrcSubresource: u32,
		pSrcBox: ^BOX,
	),
	CopyResource: proc "system" (this: ^IDeviceContext, pDstResource: ^IResource, pSrcResource: ^IResource),
	UpdateSubresource: proc "system" (
		this: ^IDeviceContext,
		pDstResource: ^IResource,
		DstSubresource: u32,
		pDstBox: ^BOX,
		pSrcData: rawptr,
		SrcRowPitch: u32,
		SrcDepthPitch: u32,
	),
	CopyStructureCount: proc "system" (
		this: ^IDeviceContext,
		pDstBuffer: ^IBuffer,
		DstAlignedByteOffset: u32,
		pSrcView: ^IUnorderedAccessView,
	),
	ClearRenderTargetView: proc "system" (
		this: ^IDeviceContext,
		pRenderTargetView: ^IRenderTargetView,
		ColorRGBA: ^[4]f32,
	),
	ClearUnorderedAccessViewUint: proc "system" (
		this: ^IDeviceContext,
		pUnorderedAccessView: ^IUnorderedAccessView,
		Values: ^[4]u32,
	),
	ClearUnorderedAccessViewFloat: proc "system" (
		this: ^IDeviceContext,
		pUnorderedAccessView: ^IUnorderedAccessView,
		Values: ^[4]f32,
	),
	ClearDepthStencilView: proc "system" (
		this: ^IDeviceContext,
		pDepthStencilView: ^IDepthStencilView,
		ClearFlags: CLEAR_FLAG,
		Depth: f32,
		Stencil: u8,
	),
	GenerateMips: proc "system" (this: ^IDeviceContext, pShaderResourceView: ^IShaderResourceView),
	SetResourceMinLOD: proc "system" (this: ^IDeviceContext, pResource: ^IResource, MinLOD: f32),
	GetResourceMinLOD: proc "system" (this: ^IDeviceContext, pResource: ^IResource) -> f32,
	ResolveSubresource: proc "system" (
		this: ^IDeviceContext,
		pDstResource: ^IResource,
		DstSubresource: u32,
		pSrcResource: ^IResource,
		SrcSubresource: u32,
		Format: dxgi.FORMAT,
	),
	ExecuteCommandList: proc "system" (this: ^IDeviceContext, pCommandList: ^ICommandList, RestoreContextState: BOOL),
	HSSetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	HSSetShader: proc "system" (
		this: ^IDeviceContext,
		pHullShader: ^IHullShader,
		ppClassInstances: [^]^IClassInstance,
		NumClassInstances: u32,
	),
	HSSetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	HSSetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	DSSetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	DSSetShader: proc "system" (
		this: ^IDeviceContext,
		pDomainShader: ^IDomainShader,
		ppClassInstances: [^]^IClassInstance,
		NumClassInstances: u32,
	),
	DSSetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	DSSetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	CSSetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	CSSetUnorderedAccessViews: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumUAVs: u32,
		ppUnorderedAccessViews: [^]^IUnorderedAccessView,
		pUAVInitialCounts: [^]u32,
	),
	CSSetShader: proc "system" (
		this: ^IDeviceContext,
		pComputeShader: ^IComputeShader,
		ppClassInstances: [^]^IClassInstance,
		NumClassInstances: u32,
	),
	CSSetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	CSSetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	VSGetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	PSGetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	PSGetShader: proc "system" (
		this: ^IDeviceContext,
		ppPixelShader: ^^IPixelShader,
		ppClassInstances: [^]^IClassInstance,
		pNumClassInstances: ^u32,
	),
	PSGetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	VSGetShader: proc "system" (
		this: ^IDeviceContext,
		ppVertexShader: ^^IVertexShader,
		ppClassInstances: [^]^IClassInstance,
		pNumClassInstances: ^u32,
	),
	PSGetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	IAGetInputLayout: proc "system" (this: ^IDeviceContext, ppInputLayout: ^^IInputLayout),
	IAGetVertexBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppVertexBuffers: [^]^IBuffer,
		pStrides: [^]u32,
		pOffsets: [^]u32,
	),
	IAGetIndexBuffer: proc "system" (
		this: ^IDeviceContext,
		pIndexBuffer: ^^IBuffer,
		Format: ^dxgi.FORMAT,
		Offset: ^u32,
	),
	GSGetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	GSGetShader: proc "system" (
		this: ^IDeviceContext,
		ppGeometryShader: ^^IGeometryShader,
		ppClassInstances: [^]^IClassInstance,
		pNumClassInstances: ^u32,
	),
	IAGetPrimitiveTopology: proc "system" (this: ^IDeviceContext, pTopology: ^d3d.PRIMITIVE_TOPOLOGY),
	VSGetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	VSGetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	GetPredication: proc "system" (this: ^IDeviceContext, ppPredicate: ^^IPredicate, pPredicateValue: ^BOOL),
	GSGetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	GSGetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	OMGetRenderTargets: proc "system" (
		this: ^IDeviceContext,
		NumViews: u32,
		ppRenderTargetViews: [^]^IRenderTargetView,
		ppDepthStencilView: ^^IDepthStencilView,
	),
	OMGetRenderTargetsAndUnorderedAccessViews: proc "system" (
		this: ^IDeviceContext,
		NumRTVs: u32,
		ppRenderTargetViews: [^]^IRenderTargetView,
		ppDepthStencilView: ^^IDepthStencilView,
		UAVStartSlot: u32,
		NumUAVs: u32,
		ppUnorderedAccessViews: [^]^IUnorderedAccessView,
	),
	OMGetBlendState: proc "system" (
		this: ^IDeviceContext,
		ppBlendState: ^^IBlendState,
		BlendFactor: ^[4]f32,
		pSampleMask: ^u32,
	),
	OMGetDepthStencilState: proc "system" (
		this: ^IDeviceContext,
		ppDepthStencilState: ^^IDepthStencilState,
		pStencilRef: ^u32,
	),
	SOGetTargets: proc "system" (this: ^IDeviceContext, NumBuffers: u32, ppSOTargets: [^]^IBuffer),
	RSGetState: proc "system" (this: ^IDeviceContext, ppRasterizerState: ^^IRasterizerState),
	RSGetViewports: proc "system" (this: ^IDeviceContext, pNumViewports: ^u32, pViewports: [^]VIEWPORT),
	RSGetScissorRects: proc "system" (this: ^IDeviceContext, pNumRects: ^u32, pRects: [^]RECT),
	HSGetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	HSGetShader: proc "system" (
		this: ^IDeviceContext,
		ppHullShader: ^^IHullShader,
		ppClassInstances: [^]^IClassInstance,
		pNumClassInstances: ^u32,
	),
	HSGetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	HSGetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	DSGetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	DSGetShader: proc "system" (
		this: ^IDeviceContext,
		ppDomainShader: ^^IDomainShader,
		ppClassInstances: [^]^IClassInstance,
		pNumClassInstances: ^u32,
	),
	DSGetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	DSGetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	CSGetShaderResources: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumViews: u32,
		ppShaderResourceViews: [^]^IShaderResourceView,
	),
	CSGetUnorderedAccessViews: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumUAVs: u32,
		ppUnorderedAccessViews: [^]^IUnorderedAccessView,
	),
	CSGetShader: proc "system" (
		this: ^IDeviceContext,
		ppComputeShader: ^^IComputeShader,
		ppClassInstances: [^]^IClassInstance,
		pNumClassInstances: ^u32,
	),
	CSGetSamplers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumSamplers: u32,
		ppSamplers: [^]^ISamplerState,
	),
	CSGetConstantBuffers: proc "system" (
		this: ^IDeviceContext,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
	),
	ClearState: proc "system" (this: ^IDeviceContext),
	Flush: proc "system" (this: ^IDeviceContext),
	GetType: proc "system" (this: ^IDeviceContext) -> DEVICE_CONTEXT_TYPE,
	GetContextFlags: proc "system" (this: ^IDeviceContext) -> u32,
	FinishCommandList: proc "system" (
		this: ^IDeviceContext,
		RestoreDeferredContextState: BOOL,
		ppCommandList: ^^ICommandList,
	) -> HRESULT,
}
IID_ID3D11DeviceContext :: GUID{0xC0BFA96C, 0xE089, 0x44FB, {0x8E, 0xAF, 0x26, 0xF8, 0x79, 0x61, 0x90, 0xDA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11devicecontext1 ]]
IDeviceContext1 :: struct #raw_union {
	#subtype IDeviceContext: IDeviceContext,
	using Vtbl: ^IDeviceContext1_Vtbl,
}
IDeviceContext1_Vtbl :: struct {
	using IDeviceContext_Vtbl: IDeviceContext_Vtbl,
	CopySubresourceRegion1: proc "system" (
		this: ^IDeviceContext1,
		pDstResource: ^IResource,
		DstSubresource: u32,
		DstX: u32,
		DstY: u32,
		DstZ: u32,
		pSrcResource: ^IResource,
		SrcSubresource: u32,
		pSrcBox: ^BOX,
		CopyFlags: u32,
	),
	UpdateSubresource1: proc "system" (
		this: ^IDeviceContext1,
		pDstResource: ^IResource,
		DstSubresource: u32,
		pDstBox: ^BOX,
		pSrcData: rawptr,
		SrcRowPitch: u32,
		SrcDepthPitch: u32,
		CopyFlags: u32,
	),
	DiscardResource: proc "system" (this: ^IDeviceContext1, pResource: ^IResource),
	DiscardView: proc "system" (this: ^IDeviceContext1, pResourceView: ^IView),
	VSSetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	HSSetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	DSSetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	GSSetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	PSSetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	CSSetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	VSGetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	HSGetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	DSGetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	GSGetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	PSGetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	CSGetConstantBuffers1: proc "system" (
		this: ^IDeviceContext1,
		StartSlot: u32,
		NumBuffers: u32,
		ppConstantBuffers: [^]^IBuffer,
		pFirstConstant: [^]u32,
		pNumConstants: [^]u32,
	),
	SwapDeviceContextState: proc "system" (
		this: ^IDeviceContext1,
		pState: ^ID3DDeviceContextState,
		ppPreviousState: ^^ID3DDeviceContextState,
	),
	ClearView: proc "system" (this: ^IDeviceContext1, pView: ^IView, Color: ^[4]f32, pRect: [^]RECT, NumRects: u32),
	DiscardView1: proc "system" (this: ^IDeviceContext1, pResourceView: ^IView, pRects: [^]RECT, NumRects: u32),
}
IID_ID3D11DeviceContext1 :: GUID{0xBB2C6FAA, 0xB5FB, 0x4082, {0x8E, 0x6B, 0x38, 0x8B, 0x8C, 0xFA, 0x90, 0xE1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_2/nn-d3d11_2-id3d11devicecontext2 ]]
IDeviceContext2 :: struct #raw_union {
	#subtype IDeviceContext1: IDeviceContext1,
	using Vtbl: ^IDeviceContext2_Vtbl,
}
IDeviceContext2_Vtbl :: struct {
	using IDeviceContext1_Vtbl: IDeviceContext1_Vtbl,
	UpdateTileMappings: proc "system" (
		this: ^IDeviceContext2,
		pTiledResource: ^IResource,
		NumTiledResourceRegions: u32,
		pTiledResourceRegionStartCoordinates: [^]TILED_RESOURCE_COORDINATE,
		pTiledResourceRegionSizes: [^]TILE_REGION_SIZE,
		pTilePool: ^IBuffer,
		NumRanges: u32,
		pRangeFlags: [^]u32,
		pTilePoolStartOffsets: [^]u32,
		pRangeTileCounts: [^]u32,
		Flags: u32,
	) -> HRESULT,
	CopyTileMappings: proc "system" (
		this: ^IDeviceContext2,
		pDestTiledResource: ^IResource,
		#by_ptr pDestRegionStartCoordinate: TILED_RESOURCE_COORDINATE,
		pSourceTiledResource: ^IResource,
		#by_ptr pSourceRegionStartCoordinate: TILED_RESOURCE_COORDINATE,
		#by_ptr pTileRegionSize: TILE_REGION_SIZE,
		Flags: u32,
	) -> HRESULT,
	CopyTiles: proc "system" (
		this: ^IDeviceContext2,
		pTiledResource: ^IResource,
		#by_ptr pTileRegionStartCoordinate: TILED_RESOURCE_COORDINATE,
		#by_ptr pTileRegionSize: TILE_REGION_SIZE,
		pBuffer: ^IBuffer,
		BufferStartOffsetInBytes: u64,
		Flags: u32,
	),
	UpdateTiles: proc "system" (
		this: ^IDeviceContext2,
		pDestTiledResource: ^IResource,
		#by_ptr pDestTileRegionStartCoordinate: TILED_RESOURCE_COORDINATE,
		#by_ptr pDestTileRegionSize: TILE_REGION_SIZE,
		pSourceTileData: rawptr,
		Flags: u32,
	),
	ResizeTilePool: proc "system" (this: ^IDeviceContext2, pTilePool: ^IBuffer, NewSizeInBytes: u64) -> HRESULT,
	TiledResourceBarrier: proc "system" (
		this: ^IDeviceContext2,
		pTiledResourceOrViewAccessBeforeBarrier: ^IDeviceChild,
		pTiledResourceOrViewAccessAfterBarrier: ^IDeviceChild,
	),
	IsAnnotationEnabled: proc "system" (this: ^IDeviceContext2) -> BOOL,
	SetMarkerInt: proc "system" (this: ^IDeviceContext2, pLabel: PWSTR, Data: i32),
	BeginEventInt: proc "system" (this: ^IDeviceContext2, pLabel: PWSTR, Data: i32),
	EndEvent: proc "system" (this: ^IDeviceContext2),
}
IID_ID3D11DeviceContext2 :: GUID{0x420D5B32, 0xB90C, 0x4DA4, {0xBE, 0xF0, 0x35, 0x9F, 0x6A, 0x24, 0xA8, 0x3A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11devicecontext3 ]]
IDeviceContext3 :: struct #raw_union {
	#subtype IDeviceContext2: IDeviceContext2,
	using Vtbl: ^IDeviceContext3_Vtbl,
}
IDeviceContext3_Vtbl :: struct {
	using IDeviceContext2_Vtbl: IDeviceContext2_Vtbl,
	Flush1: proc "system" (this: ^IDeviceContext3, ContextType: CONTEXT_TYPE, hEvent: HANDLE),
	SetHardwareProtectionState: proc "system" (this: ^IDeviceContext3, HwProtectionEnable: BOOL),
	GetHardwareProtectionState: proc "system" (this: ^IDeviceContext3, pHwProtectionEnable: ^BOOL),
}
IID_ID3D11DeviceContext3 :: GUID{0xB4E3C01D, 0xE79E, 0x4637, {0x91, 0xB2, 0x51, 0x0E, 0x9F, 0x4C, 0x9B, 0x8F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11devicecontext4 ]]
IDeviceContext4 :: struct #raw_union {
	#subtype IDeviceContext3: IDeviceContext3,
	using Vtbl: ^IDeviceContext4_Vtbl,
}
IDeviceContext4_Vtbl :: struct {
	using IDeviceContext3_Vtbl: IDeviceContext3_Vtbl,
	Signal: proc "system" (this: ^IDeviceContext4, pFence: ^IFence, Value: u64) -> HRESULT,
	Wait: proc "system" (this: ^IDeviceContext4, pFence: ^IFence, Value: u64) -> HRESULT,
}
IID_ID3D11DeviceContext4 :: GUID{0x917600DA, 0xF58C, 0x4C33, {0x98, 0xD8, 0x3E, 0x15, 0xB3, 0x90, 0xFA, 0x24}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11domainshader ]]
IDomainShader :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IDomainShader_Vtbl,
}
IDomainShader_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D11DomainShader :: GUID{0xF582C508, 0x0F36, 0x490C, {0x99, 0x77, 0x31, 0xEE, 0xCE, 0x26, 0x8C, 0xFA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11fence ]]
IFence :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IFence_Vtbl,
}
IFence_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	CreateSharedHandle: proc "system" (
		this: ^IFence,
		pAttributes: ^SECURITY_ATTRIBUTES,
		dwAccess: u32,
		lpName: PWSTR,
		pHandle: ^HANDLE,
	) -> HRESULT,
	GetCompletedValue: proc "system" (this: ^IFence) -> u64,
	SetEventOnCompletion: proc "system" (this: ^IFence, Value: u64, hEvent: HANDLE) -> HRESULT,
}
IID_ID3D11Fence :: GUID{0xAFFDE9D1, 0x1DF7, 0x4BB7, {0x8A, 0x34, 0x0F, 0x46, 0x25, 0x1D, 0xAB, 0x80}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11functionlinkinggraph ]]
IFunctionLinkingGraph :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFunctionLinkingGraph_Vtbl,
}
IFunctionLinkingGraph_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateModuleInstance: proc "system" (
		this: ^IFunctionLinkingGraph,
		ppModuleInstance: ^^IModuleInstance,
		ppErrorBuffer: ^^d3d.IBlob,
	) -> HRESULT,
	SetInputSignature: proc "system" (
		this: ^IFunctionLinkingGraph,
		pInputParameters: [^]PARAMETER_DESC,
		cInputParameters: u32,
		ppInputNode: ^^ILinkingNode,
	) -> HRESULT,
	SetOutputSignature: proc "system" (
		this: ^IFunctionLinkingGraph,
		pOutputParameters: [^]PARAMETER_DESC,
		cOutputParameters: u32,
		ppOutputNode: ^^ILinkingNode,
	) -> HRESULT,
	CallFunction: proc "system" (
		this: ^IFunctionLinkingGraph,
		pModuleInstanceNamespace: PSTR,
		pModuleWithFunctionPrototype: ^IModule,
		pFunctionName: PSTR,
		ppCallNode: ^^ILinkingNode,
	) -> HRESULT,
	PassValue: proc "system" (
		this: ^IFunctionLinkingGraph,
		pSrcNode: ^ILinkingNode,
		SrcParameterIndex: i32,
		pDstNode: ^ILinkingNode,
		DstParameterIndex: i32,
	) -> HRESULT,
	PassValueWithSwizzle: proc "system" (
		this: ^IFunctionLinkingGraph,
		pSrcNode: ^ILinkingNode,
		SrcParameterIndex: i32,
		pSrcSwizzle: PSTR,
		pDstNode: ^ILinkingNode,
		DstParameterIndex: i32,
		pDstSwizzle: PSTR,
	) -> HRESULT,
	GetLastError: proc "system" (this: ^IFunctionLinkingGraph, ppErrorBuffer: ^^d3d.IBlob) -> HRESULT,
	GenerateHlsl: proc "system" (this: ^IFunctionLinkingGraph, uFlags: u32, ppBuffer: ^^d3d.IBlob) -> HRESULT,
}
IID_ID3D11FunctionLinkingGraph :: GUID{0x54133220, 0x1CE8, 0x43D3, {0x82, 0x36, 0x98, 0x55, 0xC5, 0xCE, 0xEC, 0xFF}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11functionparameterreflection ]]
IFunctionParameterReflection :: struct #raw_union {
	using Vtbl: ^IFunctionParameterReflection_Vtbl,
}
IFunctionParameterReflection_Vtbl :: struct {
	GetDesc: proc "system" (this: ^IFunctionParameterReflection, pDesc: ^PARAMETER_DESC) -> HRESULT,
}
IID_ID3D11FunctionParameterReflection :: GUID{0x42757488, 0x334F, 0x47FE, {0x98, 0x2E, 0x1A, 0x65, 0xD0, 0x8C, 0xC4, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11functionreflection ]]
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
IID_ID3D11FunctionReflection :: GUID{0x207BCECB, 0xD683, 0x4A06, {0xA8, 0xA3, 0x9B, 0x14, 0x9B, 0x9F, 0x73, 0xA4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11geometryshader ]]
IGeometryShader :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IGeometryShader_Vtbl,
}
IGeometryShader_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D11GeometryShader :: GUID{0x38325B96, 0xEFFB, 0x4022, {0xBA, 0x02, 0x2E, 0x79, 0x5B, 0x70, 0x27, 0x5C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11hullshader ]]
IHullShader :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IHullShader_Vtbl,
}
IHullShader_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D11HullShader :: GUID{0x8E5C6061, 0x628A, 0x4C8E, {0x82, 0x64, 0xBB, 0xE4, 0x5C, 0xB3, 0xD5, 0xDD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11infoqueue ]]
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
IID_ID3D11InfoQueue :: GUID{0x6543DBB6, 0x1B48, 0x42F5, {0xAB, 0x82, 0xE9, 0x7E, 0xC7, 0x43, 0x26, 0xF6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11inputlayout ]]
IInputLayout :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IInputLayout_Vtbl,
}
IInputLayout_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D11InputLayout :: GUID{0xE4819DDC, 0x4CF0, 0x4025, {0xBD, 0x26, 0x5D, 0xE8, 0x2A, 0x3E, 0x07, 0xB7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11libraryreflection ]]
ILibraryReflection :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILibraryReflection_Vtbl,
}
ILibraryReflection_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDesc: proc "system" (this: ^ILibraryReflection, pDesc: ^LIBRARY_DESC) -> HRESULT,
	GetFunctionByIndex: proc "system" (this: ^ILibraryReflection, FunctionIndex: i32) -> ^IFunctionReflection,
}
IID_ID3D11LibraryReflection :: GUID{0x54384F1B, 0x5B3E, 0x4BB7, {0xAE, 0x01, 0x60, 0xBA, 0x30, 0x97, 0xCB, 0xB6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11linker ]]
ILinker :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILinker_Vtbl,
}
ILinker_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Link: proc "system" (
		this: ^ILinker,
		pEntry: ^IModuleInstance,
		pEntryName: PSTR,
		pTargetName: PSTR,
		uFlags: u32,
		ppShaderBlob: ^^d3d.IBlob,
		ppErrorBuffer: ^^d3d.IBlob,
	) -> HRESULT,
	UseLibrary: proc "system" (this: ^ILinker, pLibraryMI: ^IModuleInstance) -> HRESULT,
	AddClipPlaneFromCBuffer: proc "system" (this: ^ILinker, uCBufferSlot: u32, uCBufferEntry: u32) -> HRESULT,
}
IID_ID3D11Linker :: GUID{0x59A6CD0E, 0xE10D, 0x4C1F, {0x88, 0xC0, 0x63, 0xAB, 0xA1, 0xDA, 0xF3, 0x0E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11linkingnode ]]
ILinkingNode :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILinkingNode_Vtbl,
}
ILinkingNode_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
}
IID_ID3D11LinkingNode :: GUID{0xD80DD70C, 0x8D2F, 0x4751, {0x94, 0xA1, 0x03, 0xC7, 0x9B, 0x35, 0x56, 0xDB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11module ]]
IModule :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IModule_Vtbl,
}
IModule_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateInstance: proc "system" (this: ^IModule, pNamespace: PSTR, ppModuleInstance: ^^IModuleInstance) -> HRESULT,
}
IID_ID3D11Module :: GUID{0xCAC701EE, 0x80FC, 0x4122, {0x82, 0x42, 0x10, 0xB3, 0x9C, 0x8C, 0xEC, 0x34}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11moduleinstance ]]
IModuleInstance :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IModuleInstance_Vtbl,
}
IModuleInstance_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	BindConstantBuffer: proc "system" (this: ^IModuleInstance, uSrcSlot: u32, uDstSlot: u32, cbDstOffset: u32) -> HRESULT,
	BindConstantBufferByName: proc "system" (this: ^IModuleInstance, pName: PSTR, uDstSlot: u32, cbDstOffset: u32) -> HRESULT,
	BindResource: proc "system" (this: ^IModuleInstance, uSrcSlot: u32, uDstSlot: u32, uCount: u32) -> HRESULT,
	BindResourceByName: proc "system" (this: ^IModuleInstance, pName: PSTR, uDstSlot: u32, uCount: u32) -> HRESULT,
	BindSampler: proc "system" (this: ^IModuleInstance, uSrcSlot: u32, uDstSlot: u32, uCount: u32) -> HRESULT,
	BindSamplerByName: proc "system" (this: ^IModuleInstance, pName: PSTR, uDstSlot: u32, uCount: u32) -> HRESULT,
	BindUnorderedAccessView: proc "system" (this: ^IModuleInstance, uSrcSlot: u32, uDstSlot: u32, uCount: u32) -> HRESULT,
	BindUnorderedAccessViewByName: proc "system" (this: ^IModuleInstance, pName: PSTR, uDstSlot: u32, uCount: u32) -> HRESULT,
	BindResourceAsUnorderedAccessView: proc "system" (this: ^IModuleInstance, uSrcSrvSlot: u32, uDstUavSlot: u32, uCount: u32) -> HRESULT,
	BindResourceAsUnorderedAccessViewByName: proc "system" (this: ^IModuleInstance, pSrvName: PSTR, uDstUavSlot: u32, uCount: u32) -> HRESULT,
}
IID_ID3D11ModuleInstance :: GUID{0x469E07F7, 0x045A, 0x48D5, {0xAA, 0x12, 0x68, 0xA4, 0x78, 0xCD, 0xF7, 0x5D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11multithread ]]
IMultithread :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMultithread_Vtbl,
}
IMultithread_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Enter: proc "system" (this: ^IMultithread),
	Leave: proc "system" (this: ^IMultithread),
	SetMultithreadProtected: proc "system" (this: ^IMultithread, bMTProtect: BOOL) -> BOOL,
	GetMultithreadProtected: proc "system" (this: ^IMultithread) -> BOOL,
}
IID_ID3D11Multithread :: GUID{0x9B7E4E00, 0x342C, 0x4106, {0xA1, 0x9F, 0x4F, 0x27, 0x04, 0xF6, 0x89, 0xF0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11on12/nn-d3d11on12-id3d11on12device ]]
IOn12Device :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOn12Device_Vtbl,
}
IOn12Device_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateWrappedResource: proc "system" (
		this: ^IOn12Device,
		pResource12: ^IUnknown,
		#by_ptr pFlags11: RESOURCE_FLAGS,
		InState: d3d12.RESOURCE_STATES,
		OutState: d3d12.RESOURCE_STATES,
		#by_ptr riid: GUID,
		ppResource11: rawptr,
	) -> HRESULT,
	ReleaseWrappedResources: proc "system" (this: ^IOn12Device, ppResources: [^]^IResource, NumResources: u32),
	AcquireWrappedResources: proc "system" (this: ^IOn12Device, ppResources: [^]^IResource, NumResources: u32),
}
IID_ID3D11On12Device :: GUID{0x85611E73, 0x70A9, 0x490E, {0x96, 0x14, 0xA9, 0xE3, 0x02, 0x77, 0x79, 0x04}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11on12/nn-d3d11on12-id3d11on12device1 ]]
IOn12Device1 :: struct #raw_union {
	#subtype IOn12Device: IOn12Device,
	using Vtbl: ^IOn12Device1_Vtbl,
}
IOn12Device1_Vtbl :: struct {
	using IOn12Device_Vtbl: IOn12Device_Vtbl,
	GetD3D12Device: proc "system" (this: ^IOn12Device1, #by_ptr riid: GUID, ppvDevice: rawptr) -> HRESULT,
}
IID_ID3D11On12Device1 :: GUID{0xBDB64DF4, 0xEA2F, 0x4C70, {0xB8, 0x61, 0xAA, 0xAB, 0x12, 0x58, 0xBB, 0x5D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11on12/nn-d3d11on12-id3d11on12device2 ]]
IOn12Device2 :: struct #raw_union {
	#subtype IOn12Device1: IOn12Device1,
	using Vtbl: ^IOn12Device2_Vtbl,
}
IOn12Device2_Vtbl :: struct {
	using IOn12Device1_Vtbl: IOn12Device1_Vtbl,
	UnwrapUnderlyingResource: proc "system" (
		this: ^IOn12Device2,
		pResource11: ^IResource,
		pCommandQueue: ^d3d12.ICommandQueue,
		#by_ptr riid: GUID,
		ppvResource12: rawptr,
	) -> HRESULT,
	ReturnUnderlyingResource: proc "system" (
		this: ^IOn12Device2,
		pResource11: ^IResource,
		NumSync: u32,
		pSignalValues: [^]u64,
		ppFences: [^]^d3d12.IFence,
	) -> HRESULT,
}
IID_ID3D11On12Device2 :: GUID{0xDC90F331, 0x4740, 0x43FA, {0x86, 0x6E, 0x67, 0xF1, 0x2C, 0xB5, 0x82, 0x23}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11pixelshader ]]
IPixelShader :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IPixelShader_Vtbl,
}
IPixelShader_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D11PixelShader :: GUID{0xEA82E40D, 0x51DC, 0x4F33, {0x93, 0xD4, 0xDB, 0x7C, 0x91, 0x25, 0xAE, 0x8C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11predicate ]]
IPredicate :: struct #raw_union {
	#subtype IQuery: IQuery,
	using Vtbl: ^IPredicate_Vtbl,
}
IPredicate_Vtbl :: struct {
	using IQuery_Vtbl: IQuery_Vtbl,
}
IID_ID3D11Predicate :: GUID{0x9EB576DD, 0x9F77, 0x4D86, {0x81, 0xAA, 0x8B, 0xAB, 0x5F, 0xE4, 0x90, 0xE2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11query ]]
IQuery :: struct #raw_union {
	#subtype IAsynchronous: IAsynchronous,
	using Vtbl: ^IQuery_Vtbl,
}
IQuery_Vtbl :: struct {
	using IAsynchronous_Vtbl: IAsynchronous_Vtbl,
	GetDesc: proc "system" (this: ^IQuery, pDesc: ^QUERY_DESC),
}
IID_ID3D11Query :: GUID{0xD6C00747, 0x87B7, 0x425E, {0xB8, 0x4D, 0x44, 0xD1, 0x08, 0x56, 0x0A, 0xFD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11query1 ]]
IQuery1 :: struct #raw_union {
	#subtype IQuery: IQuery,
	using Vtbl: ^IQuery1_Vtbl,
}
IQuery1_Vtbl :: struct {
	using IQuery_Vtbl: IQuery_Vtbl,
	GetDesc1: proc "system" (this: ^IQuery1, pDesc1: ^QUERY_DESC1),
}
IID_ID3D11Query1 :: GUID{0x631B4766, 0x36DC, 0x461D, {0x8D, 0xB6, 0xC4, 0x7E, 0x13, 0xE6, 0x09, 0x16}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11rasterizerstate ]]
IRasterizerState :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IRasterizerState_Vtbl,
}
IRasterizerState_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetDesc: proc "system" (this: ^IRasterizerState, pDesc: ^RASTERIZER_DESC),
}
IID_ID3D11RasterizerState :: GUID{0x9BB4AB81, 0xAB1A, 0x4D8F, {0xB5, 0x06, 0xFC, 0x04, 0x20, 0x0B, 0x6E, 0xE7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11rasterizerstate1 ]]
IRasterizerState1 :: struct #raw_union {
	#subtype IRasterizerState: IRasterizerState,
	using Vtbl: ^IRasterizerState1_Vtbl,
}
IRasterizerState1_Vtbl :: struct {
	using IRasterizerState_Vtbl: IRasterizerState_Vtbl,
	GetDesc1: proc "system" (this: ^IRasterizerState1, pDesc: ^RASTERIZER_DESC1),
}
IID_ID3D11RasterizerState1 :: GUID{0x1217D7A6, 0x5039, 0x418C, {0xB0, 0x42, 0x9C, 0xBE, 0x25, 0x6A, 0xFD, 0x6E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11rasterizerstate2 ]]
IRasterizerState2 :: struct #raw_union {
	#subtype IRasterizerState1: IRasterizerState1,
	using Vtbl: ^IRasterizerState2_Vtbl,
}
IRasterizerState2_Vtbl :: struct {
	using IRasterizerState1_Vtbl: IRasterizerState1_Vtbl,
	GetDesc2: proc "system" (this: ^IRasterizerState2, pDesc: ^RASTERIZER_DESC2),
}
IID_ID3D11RasterizerState2 :: GUID{0x6FBD02FB, 0x209F, 0x46C4, {0xB0, 0x59, 0x2E, 0xD1, 0x55, 0x86, 0xA6, 0xAC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11refdefaulttrackingoptions ]]
IRefDefaultTrackingOptions :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRefDefaultTrackingOptions_Vtbl,
}
IRefDefaultTrackingOptions_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetTrackingOptions: proc "system" (this: ^IRefDefaultTrackingOptions, ResourceTypeFlags: u32, Options: u32) -> HRESULT,
}
IID_ID3D11RefDefaultTrackingOptions :: GUID{0x03916615, 0xC644, 0x418C, {0x9B, 0xF4, 0x75, 0xDB, 0x5B, 0xE6, 0x3C, 0xA0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11reftrackingoptions ]]
IRefTrackingOptions :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRefTrackingOptions_Vtbl,
}
IRefTrackingOptions_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetTrackingOptions: proc "system" (this: ^IRefTrackingOptions, uOptions: u32) -> HRESULT,
}
IID_ID3D11RefTrackingOptions :: GUID{0x193DACDF, 0x0DB2, 0x4C05, {0xA5, 0x5C, 0xEF, 0x06, 0xCA, 0xC5, 0x6F, 0xD9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11rendertargetview ]]
IRenderTargetView :: struct #raw_union {
	#subtype IView: IView,
	using Vtbl: ^IRenderTargetView_Vtbl,
}
IRenderTargetView_Vtbl :: struct {
	using IView_Vtbl: IView_Vtbl,
	GetDesc: proc "system" (this: ^IRenderTargetView, pDesc: ^RENDER_TARGET_VIEW_DESC),
}
IID_ID3D11RenderTargetView :: GUID{0xDFDBA067, 0x0B8D, 0x4865, {0x87, 0x5B, 0xD7, 0xB4, 0x51, 0x6C, 0xC1, 0x64}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11rendertargetview1 ]]
IRenderTargetView1 :: struct #raw_union {
	#subtype IRenderTargetView: IRenderTargetView,
	using Vtbl: ^IRenderTargetView1_Vtbl,
}
IRenderTargetView1_Vtbl :: struct {
	using IRenderTargetView_Vtbl: IRenderTargetView_Vtbl,
	GetDesc1: proc "system" (this: ^IRenderTargetView1, pDesc1: ^RENDER_TARGET_VIEW_DESC1),
}
IID_ID3D11RenderTargetView1 :: GUID{0xFFBE2E23, 0xF011, 0x418A, {0xAC, 0x56, 0x5C, 0xEE, 0xD7, 0xC5, 0xB9, 0x4B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11resource ]]
IResource :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IResource_Vtbl,
}
IResource_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetType: proc "system" (this: ^IResource, pResourceDimension: ^RESOURCE_DIMENSION),
	SetEvictionPriority: proc "system" (this: ^IResource, EvictionPriority: u32),
	GetEvictionPriority: proc "system" (this: ^IResource) -> u32,
}
IID_ID3D11Resource :: GUID{0xDC8E63F3, 0xD12B, 0x4952, {0xB4, 0x7B, 0x5E, 0x45, 0x02, 0x6A, 0x86, 0x2D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11samplerstate ]]
ISamplerState :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^ISamplerState_Vtbl,
}
ISamplerState_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetDesc: proc "system" (this: ^ISamplerState, pDesc: ^SAMPLER_DESC),
}
IID_ID3D11SamplerState :: GUID{0xDA6FEA51, 0x564C, 0x4487, {0x98, 0x10, 0xF0, 0xD0, 0xF9, 0xB4, 0xE3, 0xA5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11shaderreflection ]]
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
IID_ID3D11ShaderReflection :: GUID{0x8D536CA1, 0x0CCA, 0x4956, {0xA8, 0x37, 0x78, 0x69, 0x63, 0x75, 0x55, 0x84}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionconstantbuffer ]]
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
IID_ID3D11ShaderReflectionConstantBuffer :: GUID{0xEB62D63D, 0x93DD, 0x4318, {0x8A, 0xE8, 0xC6, 0xF8, 0x3A, 0xD3, 0x71, 0xB8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectiontype ]]
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
IID_ID3D11ShaderReflectionType :: GUID{0x6E6FFA6A, 0x9BAE, 0x4613, {0xA5, 0x1E, 0x91, 0x65, 0x2D, 0x50, 0x8C, 0x21}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shader/nn-d3d11shader-id3d11shaderreflectionvariable ]]
IShaderReflectionVariable :: struct #raw_union {
	using Vtbl: ^IShaderReflectionVariable_Vtbl,
}
IShaderReflectionVariable_Vtbl :: struct {
	GetDesc: proc "system" (this: ^IShaderReflectionVariable, pDesc: ^SHADER_VARIABLE_DESC) -> HRESULT,
	GetType: proc "system" (this: ^IShaderReflectionVariable) -> ^IShaderReflectionType,
	GetBuffer: proc "system" (this: ^IShaderReflectionVariable) -> ^IShaderReflectionConstantBuffer,
	GetInterfaceSlot: proc "system" (this: ^IShaderReflectionVariable, uArrayIndex: u32) -> u32,
}
IID_ID3D11ShaderReflectionVariable :: GUID{0x51F23923, 0xF3E5, 0x4BD1, {0x91, 0xCB, 0x60, 0x61, 0x77, 0xD8, 0xDB, 0x4C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11shaderresourceview ]]
IShaderResourceView :: struct #raw_union {
	#subtype IView: IView,
	using Vtbl: ^IShaderResourceView_Vtbl,
}
IShaderResourceView_Vtbl :: struct {
	using IView_Vtbl: IView_Vtbl,
	GetDesc: proc "system" (this: ^IShaderResourceView, pDesc: ^SHADER_RESOURCE_VIEW_DESC),
}
IID_ID3D11ShaderResourceView :: GUID{0xB0E06FE0, 0x8192, 0x4E1A, {0xB1, 0xCA, 0x36, 0xD7, 0x41, 0x47, 0x10, 0xB2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11shaderresourceview1 ]]
IShaderResourceView1 :: struct #raw_union {
	#subtype IShaderResourceView: IShaderResourceView,
	using Vtbl: ^IShaderResourceView1_Vtbl,
}
IShaderResourceView1_Vtbl :: struct {
	using IShaderResourceView_Vtbl: IShaderResourceView_Vtbl,
	GetDesc1: proc "system" (this: ^IShaderResourceView1, pDesc1: ^SHADER_RESOURCE_VIEW_DESC1),
}
IID_ID3D11ShaderResourceView1 :: GUID{0x91308B87, 0x9040, 0x411D, {0x8C, 0x67, 0xC3, 0x92, 0x53, 0xCE, 0x38, 0x02}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nn-d3d11shadertracing-id3d11shadertrace ]]
IShaderTrace :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShaderTrace_Vtbl,
}
IShaderTrace_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	TraceReady: proc "system" (this: ^IShaderTrace, pTestCount: ^u64) -> HRESULT,
	ResetTrace: proc "system" (this: ^IShaderTrace),
	GetTraceStats: proc "system" (this: ^IShaderTrace, pTraceStats: ^TRACE_STATS) -> HRESULT,
	PSSelectStamp: proc "system" (this: ^IShaderTrace, stampIndex: u32) -> HRESULT,
	GetInitialRegisterContents: proc "system" (this: ^IShaderTrace, pRegister: ^TRACE_REGISTER, pValue: ^TRACE_VALUE) -> HRESULT,
	GetStep: proc "system" (this: ^IShaderTrace, stepIndex: u32, pTraceStep: ^TRACE_STEP) -> HRESULT,
	GetWrittenRegister: proc "system" (
		this: ^IShaderTrace,
		stepIndex: u32,
		writtenRegisterIndex: u32,
		pRegister: ^TRACE_REGISTER,
		pValue: ^TRACE_VALUE,
	) -> HRESULT,
	GetReadRegister: proc "system" (
		this: ^IShaderTrace,
		stepIndex: u32,
		readRegisterIndex: u32,
		pRegister: ^TRACE_REGISTER,
		pValue: ^TRACE_VALUE,
	) -> HRESULT,
}
IID_ID3D11ShaderTrace :: GUID{0x36B013E6, 0x2811, 0x4845, {0xBA, 0xA7, 0xD6, 0x23, 0xFE, 0x0D, 0xF1, 0x04}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11shadertracing/nn-d3d11shadertracing-id3d11shadertracefactory ]]
IShaderTraceFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShaderTraceFactory_Vtbl,
}
IShaderTraceFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateShaderTrace: proc "system" (
		this: ^IShaderTraceFactory,
		pShader: ^IUnknown,
		pTraceDesc: ^SHADER_TRACE_DESC,
		ppShaderTrace: ^^IShaderTrace,
	) -> HRESULT,
}
IID_ID3D11ShaderTraceFactory :: GUID{0x1FBAD429, 0x66AB, 0x41CC, {0x96, 0x17, 0x66, 0x7A, 0xC1, 0x0E, 0x44, 0x59}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11switchtoref ]]
ISwitchToRef :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISwitchToRef_Vtbl,
}
ISwitchToRef_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetUseRef: proc "system" (this: ^ISwitchToRef, UseRef: BOOL) -> BOOL,
	GetUseRef: proc "system" (this: ^ISwitchToRef) -> BOOL,
}
IID_ID3D11SwitchToRef :: GUID{0x1EF337E3, 0x58E7, 0x4F83, {0xA6, 0x92, 0xDB, 0x22, 0x1F, 0x5E, 0xD4, 0x7E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11texture1d ]]
ITexture1D :: struct #raw_union {
	#subtype IResource: IResource,
	using Vtbl: ^ITexture1D_Vtbl,
}
ITexture1D_Vtbl :: struct {
	using IResource_Vtbl: IResource_Vtbl,
	GetDesc: proc "system" (this: ^ITexture1D, pDesc: ^TEXTURE1D_DESC),
}
IID_ID3D11Texture1D :: GUID{0xF8FB5C27, 0xC6B3, 0x4F75, {0xA4, 0xC8, 0x43, 0x9A, 0xF2, 0xEF, 0x56, 0x4C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11texture2d ]]
ITexture2D :: struct #raw_union {
	#subtype IResource: IResource,
	using Vtbl: ^ITexture2D_Vtbl,
}
ITexture2D_Vtbl :: struct {
	using IResource_Vtbl: IResource_Vtbl,
	GetDesc: proc "system" (this: ^ITexture2D, pDesc: ^TEXTURE2D_DESC),
}
IID_ID3D11Texture2D :: GUID{0x6F15AAF2, 0xD208, 0x4E89, {0x9A, 0xB4, 0x48, 0x95, 0x35, 0xD3, 0x4F, 0x9C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11texture2d1 ]]
ITexture2D1 :: struct #raw_union {
	#subtype ITexture2D: ITexture2D,
	using Vtbl: ^ITexture2D1_Vtbl,
}
ITexture2D1_Vtbl :: struct {
	using ITexture2D_Vtbl: ITexture2D_Vtbl,
	GetDesc1: proc "system" (this: ^ITexture2D1, pDesc: ^TEXTURE2D_DESC1),
}
IID_ID3D11Texture2D1 :: GUID{0x51218251, 0x1E33, 0x4617, {0x9C, 0xCB, 0x4D, 0x3A, 0x43, 0x67, 0xE7, 0xBB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11texture3d ]]
ITexture3D :: struct #raw_union {
	#subtype IResource: IResource,
	using Vtbl: ^ITexture3D_Vtbl,
}
ITexture3D_Vtbl :: struct {
	using IResource_Vtbl: IResource_Vtbl,
	GetDesc: proc "system" (this: ^ITexture3D, pDesc: ^TEXTURE3D_DESC),
}
IID_ID3D11Texture3D :: GUID{0x037E866E, 0xF56D, 0x4357, {0xA8, 0xAF, 0x9D, 0xAB, 0xBE, 0x6E, 0x25, 0x0E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11texture3d1 ]]
ITexture3D1 :: struct #raw_union {
	#subtype ITexture3D: ITexture3D,
	using Vtbl: ^ITexture3D1_Vtbl,
}
ITexture3D1_Vtbl :: struct {
	using ITexture3D_Vtbl: ITexture3D_Vtbl,
	GetDesc1: proc "system" (this: ^ITexture3D1, pDesc: ^TEXTURE3D_DESC1),
}
IID_ID3D11Texture3D1 :: GUID{0x0C711683, 0x2853, 0x4846, {0x9B, 0xB0, 0xF3, 0xE6, 0x06, 0x39, 0xE4, 0x6A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11sdklayers/nn-d3d11sdklayers-id3d11tracingdevice ]]
ITracingDevice :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITracingDevice_Vtbl,
}
ITracingDevice_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetShaderTrackingOptionsByType: proc "system" (this: ^ITracingDevice, ResourceTypeFlags: u32, Options: u32) -> HRESULT,
	SetShaderTrackingOptions: proc "system" (this: ^ITracingDevice, pShader: ^IUnknown, Options: u32) -> HRESULT,
}
IID_ID3D11TracingDevice :: GUID{0x1911C771, 0x1587, 0x413E, {0xA7, 0xE0, 0xFB, 0x26, 0xC3, 0xDE, 0x02, 0x68}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11unorderedaccessview ]]
IUnorderedAccessView :: struct #raw_union {
	#subtype IView: IView,
	using Vtbl: ^IUnorderedAccessView_Vtbl,
}
IUnorderedAccessView_Vtbl :: struct {
	using IView_Vtbl: IView_Vtbl,
	GetDesc: proc "system" (this: ^IUnorderedAccessView, pDesc: ^UNORDERED_ACCESS_VIEW_DESC),
}
IID_ID3D11UnorderedAccessView :: GUID{0x28ACF509, 0x7F5C, 0x48F6, {0x86, 0x11, 0xF3, 0x16, 0x01, 0x0A, 0x63, 0x80}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_3/nn-d3d11_3-id3d11unorderedaccessview1 ]]
IUnorderedAccessView1 :: struct #raw_union {
	#subtype IUnorderedAccessView: IUnorderedAccessView,
	using Vtbl: ^IUnorderedAccessView1_Vtbl,
}
IUnorderedAccessView1_Vtbl :: struct {
	using IUnorderedAccessView_Vtbl: IUnorderedAccessView_Vtbl,
	GetDesc1: proc "system" (this: ^IUnorderedAccessView1, pDesc1: ^UNORDERED_ACCESS_VIEW_DESC1),
}
IID_ID3D11UnorderedAccessView1 :: GUID{0x7B3B6153, 0xA886, 0x4544, {0xAB, 0x37, 0x65, 0x37, 0xC8, 0x50, 0x04, 0x03}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11vertexshader ]]
IVertexShader :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IVertexShader_Vtbl,
}
IVertexShader_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3D11VertexShader :: GUID{0x3B301D64, 0xD678, 0x4289, {0x88, 0x97, 0x22, 0xF8, 0x92, 0x8B, 0x72, 0xF3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videocontext ]]
IVideoContext :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IVideoContext_Vtbl,
}
IVideoContext_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetDecoderBuffer: proc "system" (
		this: ^IVideoContext,
		pDecoder: ^IVideoDecoder,
		Type: VIDEO_DECODER_BUFFER_TYPE,
		pBufferSize: ^u32,
		ppBuffer: rawptr,
	) -> HRESULT,
	ReleaseDecoderBuffer: proc "system" (
		this: ^IVideoContext,
		pDecoder: ^IVideoDecoder,
		Type: VIDEO_DECODER_BUFFER_TYPE,
	) -> HRESULT,
	DecoderBeginFrame: proc "system" (
		this: ^IVideoContext,
		pDecoder: ^IVideoDecoder,
		pView: ^IVideoDecoderOutputView,
		ContentKeySize: u32,
		pContentKey: rawptr,
	) -> HRESULT,
	DecoderEndFrame: proc "system" (this: ^IVideoContext, pDecoder: ^IVideoDecoder) -> HRESULT,
	SubmitDecoderBuffers: proc "system" (
		this: ^IVideoContext,
		pDecoder: ^IVideoDecoder,
		NumBuffers: u32,
		pBufferDesc: [^]VIDEO_DECODER_BUFFER_DESC,
	) -> HRESULT,
	DecoderExtension: proc "system" (
		this: ^IVideoContext,
		pDecoder: ^IVideoDecoder,
		#by_ptr pExtensionData: VIDEO_DECODER_EXTENSION,
	) -> i32,
	VideoProcessorSetOutputTargetRect: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		Enable: BOOL,
		pRect: ^RECT,
	),
	VideoProcessorSetOutputBackgroundColor: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		YCbCr: BOOL,
		#by_ptr pColor: VIDEO_COLOR,
	),
	VideoProcessorSetOutputColorSpace: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		#by_ptr pColorSpace: VIDEO_PROCESSOR_COLOR_SPACE,
	),
	VideoProcessorSetOutputAlphaFillMode: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		AlphaFillMode: VIDEO_PROCESSOR_ALPHA_FILL_MODE,
		StreamIndex: u32,
	),
	VideoProcessorSetOutputConstriction: proc "system" (this: ^IVideoContext, pVideoProcessor: ^IVideoProcessor, Enable: BOOL, Size: SIZE),
	VideoProcessorSetOutputStereoMode: proc "system" (this: ^IVideoContext, pVideoProcessor: ^IVideoProcessor, Enable: BOOL),
	VideoProcessorSetOutputExtension: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		#by_ptr pExtensionGuid: GUID,
		DataSize: u32,
		pData: rawptr,
	) -> i32,
	VideoProcessorGetOutputTargetRect: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		Enabled: ^BOOL,
		pRect: ^RECT,
	),
	VideoProcessorGetOutputBackgroundColor: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		pYCbCr: ^BOOL,
		pColor: ^VIDEO_COLOR,
	),
	VideoProcessorGetOutputColorSpace: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		pColorSpace: ^VIDEO_PROCESSOR_COLOR_SPACE,
	),
	VideoProcessorGetOutputAlphaFillMode: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		pAlphaFillMode: ^VIDEO_PROCESSOR_ALPHA_FILL_MODE,
		pStreamIndex: ^u32,
	),
	VideoProcessorGetOutputConstriction: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		pEnabled: ^BOOL,
		pSize: ^SIZE,
	),
	VideoProcessorGetOutputStereoMode: proc "system" (this: ^IVideoContext, pVideoProcessor: ^IVideoProcessor, pEnabled: ^BOOL),
	VideoProcessorGetOutputExtension: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		#by_ptr pExtensionGuid: GUID,
		DataSize: u32,
		pData: rawptr,
	) -> i32,
	VideoProcessorSetStreamFrameFormat: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		FrameFormat: VIDEO_FRAME_FORMAT,
	),
	VideoProcessorSetStreamColorSpace: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		#by_ptr pColorSpace: VIDEO_PROCESSOR_COLOR_SPACE,
	),
	VideoProcessorSetStreamOutputRate: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		OutputRate: VIDEO_PROCESSOR_OUTPUT_RATE,
		RepeatFrame: BOOL,
		pCustomRate: ^dxgi.RATIONAL,
	),
	VideoProcessorSetStreamSourceRect: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
		pRect: ^RECT,
	),
	VideoProcessorSetStreamDestRect: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
		pRect: ^RECT,
	),
	VideoProcessorSetStreamAlpha: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
		Alpha: f32,
	),
	VideoProcessorSetStreamPalette: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Count: u32,
		pEntries: [^]u32,
	),
	VideoProcessorSetStreamPixelAspectRatio: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
		pSourceAspectRatio: ^dxgi.RATIONAL,
		pDestinationAspectRatio: ^dxgi.RATIONAL,
	),
	VideoProcessorSetStreamLumaKey: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
		Lower: f32,
		Upper: f32,
	),
	VideoProcessorSetStreamStereoFormat: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
		Format: VIDEO_PROCESSOR_STEREO_FORMAT,
		LeftViewFrame0: BOOL,
		BaseViewFrame0: BOOL,
		FlipMode: VIDEO_PROCESSOR_STEREO_FLIP_MODE,
		MonoOffset: i32,
	),
	VideoProcessorSetStreamAutoProcessingMode: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
	),
	VideoProcessorSetStreamFilter: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Filter: VIDEO_PROCESSOR_FILTER,
		Enable: BOOL,
		Level: i32,
	),
	VideoProcessorSetStreamExtension: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		#by_ptr pExtensionGuid: GUID,
		DataSize: u32,
		pData: rawptr,
	) -> i32,
	VideoProcessorGetStreamFrameFormat: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pFrameFormat: ^VIDEO_FRAME_FORMAT,
	),
	VideoProcessorGetStreamColorSpace: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pColorSpace: ^VIDEO_PROCESSOR_COLOR_SPACE,
	),
	VideoProcessorGetStreamOutputRate: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pOutputRate: ^VIDEO_PROCESSOR_OUTPUT_RATE,
		pRepeatFrame: ^BOOL,
		pCustomRate: ^dxgi.RATIONAL,
	),
	VideoProcessorGetStreamSourceRect: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnabled: ^BOOL,
		pRect: ^RECT,
	),
	VideoProcessorGetStreamDestRect: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnabled: ^BOOL,
		pRect: ^RECT,
	),
	VideoProcessorGetStreamAlpha: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnabled: ^BOOL,
		pAlpha: ^f32,
	),
	VideoProcessorGetStreamPalette: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Count: u32,
		pEntries: [^]u32,
	),
	VideoProcessorGetStreamPixelAspectRatio: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnabled: ^BOOL,
		pSourceAspectRatio: ^dxgi.RATIONAL,
		pDestinationAspectRatio: ^dxgi.RATIONAL,
	),
	VideoProcessorGetStreamLumaKey: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnabled: ^BOOL,
		pLower: ^f32,
		pUpper: ^f32,
	),
	VideoProcessorGetStreamStereoFormat: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnable: ^BOOL,
		pFormat: ^VIDEO_PROCESSOR_STEREO_FORMAT,
		pLeftViewFrame0: ^BOOL,
		pBaseViewFrame0: ^BOOL,
		pFlipMode: ^VIDEO_PROCESSOR_STEREO_FLIP_MODE,
		MonoOffset: ^i32,
	),
	VideoProcessorGetStreamAutoProcessingMode: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnabled: ^BOOL,
	),
	VideoProcessorGetStreamFilter: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Filter: VIDEO_PROCESSOR_FILTER,
		pEnabled: ^BOOL,
		pLevel: ^i32,
	),
	VideoProcessorGetStreamExtension: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		#by_ptr pExtensionGuid: GUID,
		DataSize: u32,
		pData: rawptr,
	) -> i32,
	VideoProcessorBlt: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		pView: ^IVideoProcessorOutputView,
		OutputFrame: u32,
		StreamCount: u32,
		pStreams: [^]VIDEO_PROCESSOR_STREAM,
	) -> HRESULT,
	NegotiateCryptoSessionKeyExchange: proc "system" (
		this: ^IVideoContext,
		pCryptoSession: ^ICryptoSession,
		DataSize: u32,
		pData: rawptr,
	) -> HRESULT,
	EncryptionBlt: proc "system" (
		this: ^IVideoContext,
		pCryptoSession: ^ICryptoSession,
		pSrcSurface: ^ITexture2D,
		pDstSurface: ^ITexture2D,
		IVSize: u32,
		pIV: rawptr,
	),
	DecryptionBlt: proc "system" (
		this: ^IVideoContext,
		pCryptoSession: ^ICryptoSession,
		pSrcSurface: ^ITexture2D,
		pDstSurface: ^ITexture2D,
		pEncryptedBlockInfo: ^ENCRYPTED_BLOCK_INFO,
		ContentKeySize: u32,
		pContentKey: rawptr,
		IVSize: u32,
		pIV: rawptr,
	),
	StartSessionKeyRefresh: proc "system" (
		this: ^IVideoContext,
		pCryptoSession: ^ICryptoSession,
		RandomNumberSize: u32,
		pRandomNumber: rawptr,
	),
	FinishSessionKeyRefresh: proc "system" (this: ^IVideoContext, pCryptoSession: ^ICryptoSession),
	GetEncryptionBltKey: proc "system" (
		this: ^IVideoContext,
		pCryptoSession: ^ICryptoSession,
		KeySize: u32,
		pReadbackKey: rawptr,
	) -> HRESULT,
	NegotiateAuthenticatedChannelKeyExchange: proc "system" (
		this: ^IVideoContext,
		pChannel: ^IAuthenticatedChannel,
		DataSize: u32,
		pData: rawptr,
	) -> HRESULT,
	QueryAuthenticatedChannel: proc "system" (
		this: ^IVideoContext,
		pChannel: ^IAuthenticatedChannel,
		InputSize: u32,
		pInput: rawptr,
		OutputSize: u32,
		pOutput: rawptr,
	) -> HRESULT,
	ConfigureAuthenticatedChannel: proc "system" (
		this: ^IVideoContext,
		pChannel: ^IAuthenticatedChannel,
		InputSize: u32,
		pInput: rawptr,
		pOutput: ^AUTHENTICATED_CONFIGURE_OUTPUT,
	) -> HRESULT,
	VideoProcessorSetStreamRotation: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
		Rotation: VIDEO_PROCESSOR_ROTATION,
	),
	VideoProcessorGetStreamRotation: proc "system" (
		this: ^IVideoContext,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnable: ^BOOL,
		pRotation: ^VIDEO_PROCESSOR_ROTATION,
	),
}
IID_ID3D11VideoContext :: GUID{0x61F21C45, 0x3C0E, 0x4A74, {0x9C, 0xEA, 0x67, 0x10, 0x0D, 0x9A, 0xD5, 0xE4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11videocontext1 ]]
IVideoContext1 :: struct #raw_union {
	#subtype IVideoContext: IVideoContext,
	using Vtbl: ^IVideoContext1_Vtbl,
}
IVideoContext1_Vtbl :: struct {
	using IVideoContext_Vtbl: IVideoContext_Vtbl,
	SubmitDecoderBuffers1: proc "system" (
		this: ^IVideoContext1,
		pDecoder: ^IVideoDecoder,
		NumBuffers: u32,
		pBufferDesc: [^]VIDEO_DECODER_BUFFER_DESC1,
	) -> HRESULT,
	GetDataForNewHardwareKey: proc "system" (
		this: ^IVideoContext1,
		pCryptoSession: ^ICryptoSession,
		PrivateInputSize: u32,
		pPrivatInputData: rawptr,
		pPrivateOutputData: ^u64,
	) -> HRESULT,
	CheckCryptoSessionStatus: proc "system" (
		this: ^IVideoContext1,
		pCryptoSession: ^ICryptoSession,
		pStatus: ^CRYPTO_SESSION_STATUS,
	) -> HRESULT,
	DecoderEnableDownsampling: proc "system" (
		this: ^IVideoContext1,
		pDecoder: ^IVideoDecoder,
		InputColorSpace: dxgi.COLOR_SPACE_TYPE,
		#by_ptr pOutputDesc: VIDEO_SAMPLE_DESC,
		ReferenceFrameCount: u32,
	) -> HRESULT,
	DecoderUpdateDownsampling: proc "system" (
		this: ^IVideoContext1,
		pDecoder: ^IVideoDecoder,
		#by_ptr pOutputDesc: VIDEO_SAMPLE_DESC,
	) -> HRESULT,
	VideoProcessorSetOutputColorSpace1: proc "system" (
		this: ^IVideoContext1,
		pVideoProcessor: ^IVideoProcessor,
		ColorSpace: dxgi.COLOR_SPACE_TYPE,
	),
	VideoProcessorSetOutputShaderUsage: proc "system" (this: ^IVideoContext1, pVideoProcessor: ^IVideoProcessor, ShaderUsage: BOOL),
	VideoProcessorGetOutputColorSpace1: proc "system" (
		this: ^IVideoContext1,
		pVideoProcessor: ^IVideoProcessor,
		pColorSpace: ^dxgi.COLOR_SPACE_TYPE,
	),
	VideoProcessorGetOutputShaderUsage: proc "system" (this: ^IVideoContext1, pVideoProcessor: ^IVideoProcessor, pShaderUsage: ^BOOL),
	VideoProcessorSetStreamColorSpace1: proc "system" (
		this: ^IVideoContext1,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		ColorSpace: dxgi.COLOR_SPACE_TYPE,
	),
	VideoProcessorSetStreamMirror: proc "system" (
		this: ^IVideoContext1,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Enable: BOOL,
		FlipHorizontal: BOOL,
		FlipVertical: BOOL,
	),
	VideoProcessorGetStreamColorSpace1: proc "system" (
		this: ^IVideoContext1,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pColorSpace: ^dxgi.COLOR_SPACE_TYPE,
	),
	VideoProcessorGetStreamMirror: proc "system" (
		this: ^IVideoContext1,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pEnable: ^BOOL,
		pFlipHorizontal: ^BOOL,
		pFlipVertical: ^BOOL,
	),
	VideoProcessorGetBehaviorHints: proc "system" (
		this: ^IVideoContext1,
		pVideoProcessor: ^IVideoProcessor,
		OutputWidth: u32,
		OutputHeight: u32,
		OutputFormat: dxgi.FORMAT,
		StreamCount: u32,
		pStreams: [^]VIDEO_PROCESSOR_STREAM_BEHAVIOR_HINT,
		pBehaviorHints: ^u32,
	) -> HRESULT,
}
IID_ID3D11VideoContext1 :: GUID{0xA7F026DA, 0xA5F8, 0x4487, {0xA5, 0x64, 0x15, 0xE3, 0x43, 0x57, 0x65, 0x1E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11videocontext2 ]]
IVideoContext2 :: struct #raw_union {
	#subtype IVideoContext1: IVideoContext1,
	using Vtbl: ^IVideoContext2_Vtbl,
}
IVideoContext2_Vtbl :: struct {
	using IVideoContext1_Vtbl: IVideoContext1_Vtbl,
	VideoProcessorSetOutputHDRMetaData: proc "system" (
		this: ^IVideoContext2,
		pVideoProcessor: ^IVideoProcessor,
		Type: dxgi.HDR_METADATA_TYPE,
		Size: u32,
		pHDRMetaData: rawptr,
	),
	VideoProcessorGetOutputHDRMetaData: proc "system" (
		this: ^IVideoContext2,
		pVideoProcessor: ^IVideoProcessor,
		pType: ^dxgi.HDR_METADATA_TYPE,
		Size: u32,
		pMetaData: rawptr,
	),
	VideoProcessorSetStreamHDRMetaData: proc "system" (
		this: ^IVideoContext2,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		Type: dxgi.HDR_METADATA_TYPE,
		Size: u32,
		pHDRMetaData: rawptr,
	),
	VideoProcessorGetStreamHDRMetaData: proc "system" (
		this: ^IVideoContext2,
		pVideoProcessor: ^IVideoProcessor,
		StreamIndex: u32,
		pType: ^dxgi.HDR_METADATA_TYPE,
		Size: u32,
		pMetaData: rawptr,
	),
}
IID_ID3D11VideoContext2 :: GUID{0xC4E7374C, 0x6243, 0x4D1B, {0xAE, 0x87, 0x52, 0xB4, 0xF7, 0x40, 0xE2, 0x61}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11videocontext3 ]]
IVideoContext3 :: struct #raw_union {
	#subtype IVideoContext2: IVideoContext2,
	using Vtbl: ^IVideoContext3_Vtbl,
}
IVideoContext3_Vtbl :: struct {
	using IVideoContext2_Vtbl: IVideoContext2_Vtbl,
	DecoderBeginFrame1: proc "system" (
		this: ^IVideoContext3,
		pDecoder: ^IVideoDecoder,
		pView: ^IVideoDecoderOutputView,
		ContentKeySize: u32,
		pContentKey: rawptr,
		NumComponentHistograms: u32,
		pHistogramOffsets: [^]u32,
		ppHistogramBuffers: [^]^IBuffer,
	) -> HRESULT,
	SubmitDecoderBuffers2: proc "system" (
		this: ^IVideoContext3,
		pDecoder: ^IVideoDecoder,
		NumBuffers: u32,
		pBufferDesc: [^]VIDEO_DECODER_BUFFER_DESC2,
	) -> HRESULT,
}
IID_ID3D11VideoContext3 :: GUID{0xA9E2FAA0, 0xCB39, 0x418F, {0xA0, 0xB7, 0xD8, 0xAA, 0xD4, 0xDE, 0x67, 0x2E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videodecoder ]]
IVideoDecoder :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IVideoDecoder_Vtbl,
}
IVideoDecoder_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetCreationParameters: proc "system" (
		this: ^IVideoDecoder,
		pVideoDesc: ^VIDEO_DECODER_DESC,
		pConfig: ^VIDEO_DECODER_CONFIG,
	) -> HRESULT,
	GetDriverHandle: proc "system" (this: ^IVideoDecoder, pDriverHandle: ^HANDLE) -> HRESULT,
}
IID_ID3D11VideoDecoder :: GUID{0x3C9C5B51, 0x995D, 0x48D1, {0x9B, 0x8D, 0xFA, 0x5C, 0xAE, 0xDE, 0xD6, 0x5C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videodecoderoutputview ]]
IVideoDecoderOutputView :: struct #raw_union {
	#subtype IView: IView,
	using Vtbl: ^IVideoDecoderOutputView_Vtbl,
}
IVideoDecoderOutputView_Vtbl :: struct {
	using IView_Vtbl: IView_Vtbl,
	GetDesc: proc "system" (this: ^IVideoDecoderOutputView, pDesc: ^VIDEO_DECODER_OUTPUT_VIEW_DESC),
}
IID_ID3D11VideoDecoderOutputView :: GUID{0xC2931AEA, 0x2A85, 0x4F20, {0x86, 0x0F, 0xFB, 0xA1, 0xFD, 0x25, 0x6E, 0x18}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videodevice ]]
IVideoDevice :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IVideoDevice_Vtbl,
}
IVideoDevice_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateVideoDecoder: proc "system" (
		this: ^IVideoDevice,
		#by_ptr pVideoDesc: VIDEO_DECODER_DESC,
		#by_ptr pConfig: VIDEO_DECODER_CONFIG,
		ppDecoder: ^^IVideoDecoder,
	) -> HRESULT,
	CreateVideoProcessor: proc "system" (
		this: ^IVideoDevice,
		pEnum: ^IVideoProcessorEnumerator,
		RateConversionIndex: u32,
		ppVideoProcessor: ^^IVideoProcessor,
	) -> HRESULT,
	CreateAuthenticatedChannel: proc "system" (
		this: ^IVideoDevice,
		ChannelType: AUTHENTICATED_CHANNEL_TYPE,
		ppAuthenticatedChannel: ^^IAuthenticatedChannel,
	) -> HRESULT,
	CreateCryptoSession: proc "system" (
		this: ^IVideoDevice,
		#by_ptr pCryptoType: GUID,
		pDecoderProfile: ^GUID,
		#by_ptr pKeyExchangeType: GUID,
		ppCryptoSession: ^^ICryptoSession,
	) -> HRESULT,
	CreateVideoDecoderOutputView: proc "system" (
		this: ^IVideoDevice,
		pResource: ^IResource,
		#by_ptr pDesc: VIDEO_DECODER_OUTPUT_VIEW_DESC,
		ppVDOVView: ^^IVideoDecoderOutputView,
	) -> HRESULT,
	CreateVideoProcessorInputView: proc "system" (
		this: ^IVideoDevice,
		pResource: ^IResource,
		pEnum: ^IVideoProcessorEnumerator,
		#by_ptr pDesc: VIDEO_PROCESSOR_INPUT_VIEW_DESC,
		ppVPIView: ^^IVideoProcessorInputView,
	) -> HRESULT,
	CreateVideoProcessorOutputView: proc "system" (
		this: ^IVideoDevice,
		pResource: ^IResource,
		pEnum: ^IVideoProcessorEnumerator,
		#by_ptr pDesc: VIDEO_PROCESSOR_OUTPUT_VIEW_DESC,
		ppVPOView: ^^IVideoProcessorOutputView,
	) -> HRESULT,
	CreateVideoProcessorEnumerator: proc "system" (
		this: ^IVideoDevice,
		#by_ptr pDesc: VIDEO_PROCESSOR_CONTENT_DESC,
		ppEnum: ^^IVideoProcessorEnumerator,
	) -> HRESULT,
	GetVideoDecoderProfileCount: proc "system" (this: ^IVideoDevice) -> u32,
	GetVideoDecoderProfile: proc "system" (this: ^IVideoDevice, Index: u32, pDecoderProfile: ^GUID) -> HRESULT,
	CheckVideoDecoderFormat: proc "system" (
		this: ^IVideoDevice,
		#by_ptr pDecoderProfile: GUID,
		Format: dxgi.FORMAT,
		pSupported: ^BOOL,
	) -> HRESULT,
	GetVideoDecoderConfigCount: proc "system" (this: ^IVideoDevice, #by_ptr pDesc: VIDEO_DECODER_DESC, pCount: ^u32) -> HRESULT,
	GetVideoDecoderConfig: proc "system" (
		this: ^IVideoDevice,
		#by_ptr pDesc: VIDEO_DECODER_DESC,
		Index: u32,
		pConfig: ^VIDEO_DECODER_CONFIG,
	) -> HRESULT,
	GetContentProtectionCaps: proc "system" (
		this: ^IVideoDevice,
		pCryptoType: ^GUID,
		pDecoderProfile: ^GUID,
		pCaps: ^VIDEO_CONTENT_PROTECTION_CAPS,
	) -> HRESULT,
	CheckCryptoKeyExchange: proc "system" (
		this: ^IVideoDevice,
		#by_ptr pCryptoType: GUID,
		pDecoderProfile: ^GUID,
		Index: u32,
		pKeyExchangeType: ^GUID,
	) -> HRESULT,
	SetPrivateData: proc "system" (this: ^IVideoDevice, #by_ptr guid: GUID, DataSize: u32, pData: rawptr) -> HRESULT,
	SetPrivateDataInterface: proc "system" (this: ^IVideoDevice, #by_ptr guid: GUID, pData: ^IUnknown) -> HRESULT,
}
IID_ID3D11VideoDevice :: GUID{0x10EC4D5B, 0x975A, 0x4689, {0xB9, 0xE4, 0xD0, 0xAA, 0xC3, 0x0F, 0xE3, 0x33}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11videodevice1 ]]
IVideoDevice1 :: struct #raw_union {
	#subtype IVideoDevice: IVideoDevice,
	using Vtbl: ^IVideoDevice1_Vtbl,
}
IVideoDevice1_Vtbl :: struct {
	using IVideoDevice_Vtbl: IVideoDevice_Vtbl,
	GetCryptoSessionPrivateDataSize: proc "system" (
		this: ^IVideoDevice1,
		#by_ptr pCryptoType: GUID,
		pDecoderProfile: ^GUID,
		#by_ptr pKeyExchangeType: GUID,
		pPrivateInputSize: ^u32,
		pPrivateOutputSize: ^u32,
	) -> HRESULT,
	GetVideoDecoderCaps: proc "system" (
		this: ^IVideoDevice1,
		#by_ptr pDecoderProfile: GUID,
		SampleWidth: u32,
		SampleHeight: u32,
		#by_ptr pFrameRate: dxgi.RATIONAL,
		BitRate: u32,
		pCryptoType: ^GUID,
		pDecoderCaps: ^u32,
	) -> HRESULT,
	CheckVideoDecoderDownsampling: proc "system" (
		this: ^IVideoDevice1,
		#by_ptr pInputDesc: VIDEO_DECODER_DESC,
		InputColorSpace: dxgi.COLOR_SPACE_TYPE,
		#by_ptr pInputConfig: VIDEO_DECODER_CONFIG,
		#by_ptr pFrameRate: dxgi.RATIONAL,
		#by_ptr pOutputDesc: VIDEO_SAMPLE_DESC,
		pSupported: ^BOOL,
		pRealTimeHint: ^BOOL,
	) -> HRESULT,
	RecommendVideoDecoderDownsampleParameters: proc "system" (
		this: ^IVideoDevice1,
		#by_ptr pInputDesc: VIDEO_DECODER_DESC,
		InputColorSpace: dxgi.COLOR_SPACE_TYPE,
		#by_ptr pInputConfig: VIDEO_DECODER_CONFIG,
		#by_ptr pFrameRate: dxgi.RATIONAL,
		pRecommendedOutputDesc: ^VIDEO_SAMPLE_DESC,
	) -> HRESULT,
}
IID_ID3D11VideoDevice1 :: GUID{0x29DA1D51, 0x1321, 0x4454, {0x80, 0x4B, 0xF5, 0xFC, 0x9F, 0x86, 0x1F, 0x0F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_4/nn-d3d11_4-id3d11videodevice2 ]]
IVideoDevice2 :: struct #raw_union {
	#subtype IVideoDevice1: IVideoDevice1,
	using Vtbl: ^IVideoDevice2_Vtbl,
}
IVideoDevice2_Vtbl :: struct {
	using IVideoDevice1_Vtbl: IVideoDevice1_Vtbl,
	CheckFeatureSupport: proc "system" (
		this: ^IVideoDevice2,
		Feature: FEATURE_VIDEO,
		pFeatureSupportData: rawptr,
		FeatureSupportDataSize: u32,
	) -> HRESULT,
	NegotiateCryptoSessionKeyExchangeMT: proc "system" (
		this: ^IVideoDevice2,
		pCryptoSession: ^ICryptoSession,
		flags: CRYPTO_SESSION_KEY_EXCHANGE_FLAGS,
		DataSize: u32,
		pData: rawptr,
	) -> HRESULT,
}
IID_ID3D11VideoDevice2 :: GUID{0x59C0CB01, 0x35F0, 0x4A70, {0x8F, 0x67, 0x87, 0x90, 0x5C, 0x90, 0x6A, 0x53}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videoprocessor ]]
IVideoProcessor :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IVideoProcessor_Vtbl,
}
IVideoProcessor_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetContentDesc: proc "system" (this: ^IVideoProcessor, pDesc: ^VIDEO_PROCESSOR_CONTENT_DESC),
	GetRateConversionCaps: proc "system" (this: ^IVideoProcessor, pCaps: ^VIDEO_PROCESSOR_RATE_CONVERSION_CAPS),
}
IID_ID3D11VideoProcessor :: GUID{0x1D7B0652, 0x185F, 0x41C6, {0x85, 0xCE, 0x0C, 0x5B, 0xE3, 0xD4, 0xAE, 0x6C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videoprocessorenumerator ]]
IVideoProcessorEnumerator :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IVideoProcessorEnumerator_Vtbl,
}
IVideoProcessorEnumerator_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetVideoProcessorContentDesc: proc "system" (
		this: ^IVideoProcessorEnumerator,
		pContentDesc: ^VIDEO_PROCESSOR_CONTENT_DESC,
	) -> HRESULT,
	CheckVideoProcessorFormat: proc "system" (this: ^IVideoProcessorEnumerator, Format: dxgi.FORMAT, pFlags: ^u32) -> HRESULT,
	GetVideoProcessorCaps: proc "system" (this: ^IVideoProcessorEnumerator, pCaps: ^VIDEO_PROCESSOR_CAPS) -> HRESULT,
	GetVideoProcessorRateConversionCaps: proc "system" (
		this: ^IVideoProcessorEnumerator,
		TypeIndex: u32,
		pCaps: ^VIDEO_PROCESSOR_RATE_CONVERSION_CAPS,
	) -> HRESULT,
	GetVideoProcessorCustomRate: proc "system" (
		this: ^IVideoProcessorEnumerator,
		TypeIndex: u32,
		CustomRateIndex: u32,
		pRate: ^VIDEO_PROCESSOR_CUSTOM_RATE,
	) -> HRESULT,
	GetVideoProcessorFilterRange: proc "system" (
		this: ^IVideoProcessorEnumerator,
		Filter: VIDEO_PROCESSOR_FILTER,
		pRange: ^VIDEO_PROCESSOR_FILTER_RANGE,
	) -> HRESULT,
}
IID_ID3D11VideoProcessorEnumerator :: GUID{0x31627037, 0x53AB, 0x4200, {0x90, 0x61, 0x05, 0xFA, 0xA9, 0xAB, 0x45, 0xF9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3d11videoprocessorenumerator1 ]]
IVideoProcessorEnumerator1 :: struct #raw_union {
	#subtype IVideoProcessorEnumerator: IVideoProcessorEnumerator,
	using Vtbl: ^IVideoProcessorEnumerator1_Vtbl,
}
IVideoProcessorEnumerator1_Vtbl :: struct {
	using IVideoProcessorEnumerator_Vtbl: IVideoProcessorEnumerator_Vtbl,
	CheckVideoProcessorFormatConversion: proc "system" (
		this: ^IVideoProcessorEnumerator1,
		InputFormat: dxgi.FORMAT,
		InputColorSpace: dxgi.COLOR_SPACE_TYPE,
		OutputFormat: dxgi.FORMAT,
		OutputColorSpace: dxgi.COLOR_SPACE_TYPE,
		pSupported: ^BOOL,
	) -> HRESULT,
}
IID_ID3D11VideoProcessorEnumerator1 :: GUID{0x465217F2, 0x5568, 0x43CF, {0xB5, 0xB9, 0xF6, 0x1D, 0x54, 0x53, 0x1C, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videoprocessorinputview ]]
IVideoProcessorInputView :: struct #raw_union {
	#subtype IView: IView,
	using Vtbl: ^IVideoProcessorInputView_Vtbl,
}
IVideoProcessorInputView_Vtbl :: struct {
	using IView_Vtbl: IView_Vtbl,
	GetDesc: proc "system" (this: ^IVideoProcessorInputView, pDesc: ^VIDEO_PROCESSOR_INPUT_VIEW_DESC),
}
IID_ID3D11VideoProcessorInputView :: GUID{0x11EC5A5F, 0x51DC, 0x4945, {0xAB, 0x34, 0x6E, 0x8C, 0x21, 0x30, 0x0E, 0xA5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videoprocessoroutputview ]]
IVideoProcessorOutputView :: struct #raw_union {
	#subtype IView: IView,
	using Vtbl: ^IVideoProcessorOutputView_Vtbl,
}
IVideoProcessorOutputView_Vtbl :: struct {
	using IView_Vtbl: IView_Vtbl,
	GetDesc: proc "system" (
		this: ^IVideoProcessorOutputView,
		pDesc: ^VIDEO_PROCESSOR_OUTPUT_VIEW_DESC,
	),
}
IID_ID3D11VideoProcessorOutputView :: GUID{0xA048285E, 0x25A9, 0x4527, {0xBD, 0x93, 0xD6, 0x8B, 0x68, 0xC4, 0x42, 0x54}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11view ]]
IView :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^IView_Vtbl,
}
IView_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
	GetResource: proc "system" (this: ^IView, ppResource: ^^IResource),
}
IID_ID3D11View :: GUID{0x839D1216, 0xBB2E, 0x412B, {0xB7, 0xF4, 0xA9, 0xDB, 0xEB, 0xE0, 0x8E, 0xD1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3ddevicecontextstate ]]
ID3DDeviceContextState :: struct #raw_union {
	#subtype IDeviceChild: IDeviceChild,
	using Vtbl: ^ID3DDeviceContextState_Vtbl,
}
ID3DDeviceContextState_Vtbl :: struct {
	using IDeviceChild_Vtbl: IDeviceChild_Vtbl,
}
IID_ID3DDeviceContextState :: GUID{0x5C1E0D8A, 0x7C23, 0x48F9, {0x8C, 0x59, 0xA9, 0x29, 0x58, 0xCE, 0xFF, 0x11}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3d11_1/nn-d3d11_1-id3duserdefinedannotation ]]
ID3DUserDefinedAnnotation :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ID3DUserDefinedAnnotation_Vtbl,
}
ID3DUserDefinedAnnotation_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	BeginEvent: proc "system" (this: ^ID3DUserDefinedAnnotation, Name: PWSTR) -> i32,
	EndEvent: proc "system" (this: ^ID3DUserDefinedAnnotation) -> i32,
	SetMarker: proc "system" (this: ^ID3DUserDefinedAnnotation, Name: PWSTR),
	GetStatus: proc "system" (this: ^ID3DUserDefinedAnnotation) -> BOOL,
}
IID_ID3DUserDefinedAnnotation :: GUID{0xB2DAAD8B, 0x03D4, 0x4DBF, {0x95, 0xEB, 0x32, 0xAB, 0x4B, 0x63, 0xD0, 0xAB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nn-d3dcsx-id3dx11fft ]]
ID3DX11FFT :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ID3DX11FFT_Vtbl,
}
ID3DX11FFT_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetForwardScale: proc "system" (this: ^ID3DX11FFT, ForwardScale: f32) -> HRESULT,
	GetForwardScale: proc "system" (this: ^ID3DX11FFT) -> f32,
	SetInverseScale: proc "system" (this: ^ID3DX11FFT, InverseScale: f32) -> HRESULT,
	GetInverseScale: proc "system" (this: ^ID3DX11FFT) -> f32,
	AttachBuffersAndPrecompute: proc "system" (
		this: ^ID3DX11FFT,
		NumTempBuffers: u32,
		ppTempBuffers: [^]^IUnorderedAccessView,
		NumPrecomputeBuffers: u32,
		ppPrecomputeBufferSizes: [^]^IUnorderedAccessView,
	) -> HRESULT,
	ForwardTransform: proc "system" (
		this: ^ID3DX11FFT,
		pInputBuffer: ^IUnorderedAccessView,
		ppOutputBuffer: ^^IUnorderedAccessView,
	) -> HRESULT,
	InverseTransform: proc "system" (
		this: ^ID3DX11FFT,
		pInputBuffer: ^IUnorderedAccessView,
		ppOutputBuffer: ^^IUnorderedAccessView,
	) -> HRESULT,
}
IID_ID3DX11FFT :: GUID{0xB3F7A938, 0x4C93, 0x4310, {0xA6, 0x75, 0xB3, 0x0D, 0x6D, 0xE5, 0x05, 0x53}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nn-d3dcsx-id3dx11scan ]]
ID3DX11Scan :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ID3DX11Scan_Vtbl,
}
ID3DX11Scan_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetScanDirection: proc "system" (this: ^ID3DX11Scan, Direction: D3DX11_SCAN_DIRECTION) -> HRESULT,
	Scan: proc "system" (
		this: ^ID3DX11Scan,
		ElementType: D3DX11_SCAN_DATA_TYPE,
		OpCode: D3DX11_SCAN_OPCODE,
		ElementScanSize: u32,
		pSrc: ^IUnorderedAccessView,
		pDst: ^IUnorderedAccessView,
	) -> HRESULT,
	Multiscan: proc "system" (
		this: ^ID3DX11Scan,
		ElementType: D3DX11_SCAN_DATA_TYPE,
		OpCode: D3DX11_SCAN_OPCODE,
		ElementScanSize: u32,
		ElementScanPitch: u32,
		ScanCount: u32,
		pSrc: ^IUnorderedAccessView,
		pDst: ^IUnorderedAccessView,
	) -> HRESULT,
}
IID_ID3DX11Scan :: GUID{0x5089B68F, 0xE71D, 0x4D38, {0xBE, 0x8E, 0xF3, 0x63, 0xB9, 0x5A, 0x94, 0x05}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/d3dcsx/nn-d3dcsx-id3dx11segmentedscan ]]
ID3DX11SegmentedScan :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ID3DX11SegmentedScan_Vtbl,
}
ID3DX11SegmentedScan_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetScanDirection: proc "system" (this: ^ID3DX11SegmentedScan, Direction: D3DX11_SCAN_DIRECTION) -> HRESULT,
	SegScan: proc "system" (
		this: ^ID3DX11SegmentedScan,
		ElementType: D3DX11_SCAN_DATA_TYPE,
		OpCode: D3DX11_SCAN_OPCODE,
		ElementScanSize: u32,
		pSrc: ^IUnorderedAccessView,
		pSrcElementFlags: ^IUnorderedAccessView,
		pDst: ^IUnorderedAccessView,
	) -> HRESULT,
}
IID_ID3DX11SegmentedScan :: GUID{0xA915128C, 0xD954, 0x4C79, {0xBF, 0xE1, 0x64, 0xDB, 0x92, 0x31, 0x94, 0xD6}}

PFN_D3D11_CREATE_DEVICE :: #type proc "system" (
	param0: ^dxgi.IAdapter,
	param1: d3d.DRIVER_TYPE,
	param2: HMODULE,
	param3: u32,
	param4: [^]d3d.FEATURE_LEVEL,
	FeatureLevels: u32,
	param6: u32,
	param7: ^^IDevice,
	param8: ^d3d.FEATURE_LEVEL,
	param9: ^^IDeviceContext,
) -> HRESULT

PFN_D3D11_CREATE_DEVICE_AND_SWAP_CHAIN :: #type proc "system" (
	param0: ^dxgi.IAdapter,
	param1: d3d.DRIVER_TYPE,
	param2: HMODULE,
	param3: u32,
	param4: [^]d3d.FEATURE_LEVEL,
	FeatureLevels: u32,
	param6: u32,
	param7: ^dxgi.SWAP_CHAIN_DESC,
	param8: ^^dxgi.ISwapChain,
	param9: ^^IDevice,
	param10: ^d3d.FEATURE_LEVEL,
	param11: ^^IDeviceContext,
) -> HRESULT

PFN_D3D11ON12_CREATE_DEVICE :: #type proc "system" (
	param0: ^IUnknown,
	param1: u32,
	param2: [^]d3d.FEATURE_LEVEL,
	FeatureLevels: u32,
	param4: [^]^IUnknown,
	NumQueues: u32,
	param6: u32,
	param7: ^^IDevice,
	param8: ^^IDeviceContext,
	param9: ^d3d.FEATURE_LEVEL,
) -> HRESULT

FACD3D11 :: 2172
RETURN_PARAMETER_INDEX :: -1
SHADER_REQUIRES_11_1_DOUBLE_EXTENSIONS :: 32
SHADER_REQUIRES_11_1_SHADER_EXTENSIONS :: 64
SHADER_REQUIRES_64_UAVS :: 8
SHADER_REQUIRES_DOUBLES :: 1
SHADER_REQUIRES_EARLY_DEPTH_STENCIL :: 2
SHADER_REQUIRES_LEVEL_9_COMPARISON_FILTERING :: 128
SHADER_REQUIRES_MINIMUM_PRECISION :: 16
SHADER_REQUIRES_TILED_RESOURCES :: 256
SHADER_REQUIRES_UAVS_AT_EVERY_STAGE :: 4
_1_UAV_SLOT_COUNT :: 64
_16BIT_INDEX_STRIP_CUT_VALUE :: 65535
_2_TILED_RESOURCE_TILE_SIZE_IN_BYTES :: 65536
_32BIT_INDEX_STRIP_CUT_VALUE :: 4294967295
_4_VIDEO_DECODER_HISTOGRAM_OFFSET_ALIGNMENT :: 256
_4_VIDEO_DECODER_MAX_HISTOGRAM_COMPONENTS :: 4
_8BIT_INDEX_STRIP_CUT_VALUE :: 255
ANISOTROPIC_FILTERING_BIT :: 64
APPEND_ALIGNED_ELEMENT :: 4294967295
APPNAME_STRING :: "Name"
APPSIZE_STRING :: "Size"
ARRAY_AXIS_ADDRESS_RANGE_BIT_COUNT :: 9
AUTHENTICATED_CONFIGURE_CRYPTO_SESSION :: GUID{0x6346CC54, 0x2CFC, 0x4AD4, {0x82, 0x24, 0xD1, 0x58, 0x37, 0xDE, 0x77, 0x00}}
AUTHENTICATED_CONFIGURE_ENCRYPTION_WHEN_ACCESSIBLE ::
	GUID{0x41FFF286, 0x6AE0, 0x4D43, {0x9D, 0x55, 0xA4, 0x6E, 0x9E, 0xFD, 0x15, 0x8A}}
AUTHENTICATED_CONFIGURE_INITIALIZE :: GUID{0x06114BDB, 0x3523, 0x470A, {0x8D, 0xCA, 0xFB, 0xC2, 0x84, 0x51, 0x54, 0xF0}}
AUTHENTICATED_CONFIGURE_PROTECTION :: GUID{0x50455658, 0x3F47, 0x4362, {0xBF, 0x99, 0xBF, 0xDF, 0xCD, 0xE9, 0xED, 0x29}}
AUTHENTICATED_CONFIGURE_SHARED_RESOURCE ::
	GUID{0x0772D047, 0x1B40, 0x48E8, {0x9C, 0xA6, 0xB5, 0xF5, 0x10, 0xDE, 0x9F, 0x01}}
AUTHENTICATED_QUERY_ACCESSIBILITY_ATTRIBUTES ::
	GUID{0x6214D9D2, 0x432C, 0x4ABB, {0x9F, 0xCE, 0x21, 0x6E, 0xEA, 0x26, 0x9E, 0x3B}}
AUTHENTICATED_QUERY_CHANNEL_TYPE :: GUID{0xBC1B18A5, 0xB1FB, 0x42AB, {0xBD, 0x94, 0xB5, 0x82, 0x8B, 0x4B, 0xF7, 0xBE}}
AUTHENTICATED_QUERY_CRYPTO_SESSION :: GUID{0x2634499E, 0xD018, 0x4D74, {0xAC, 0x17, 0x7F, 0x72, 0x40, 0x59, 0x52, 0x8D}}
AUTHENTICATED_QUERY_CURRENT_ENCRYPTION_WHEN_ACCESSIBLE ::
	GUID{0xEC1791C7, 0xDAD3, 0x4F15, {0x9E, 0xC3, 0xFA, 0xA9, 0x3D, 0x60, 0xD4, 0xF0}}
AUTHENTICATED_QUERY_DEVICE_HANDLE :: GUID{0xEC1C539D, 0x8CFF, 0x4E2A, {0xBC, 0xC4, 0xF5, 0x69, 0x2F, 0x99, 0xF4, 0x80}}
AUTHENTICATED_QUERY_ENCRYPTION_WHEN_ACCESSIBLE_GUID ::
	GUID{0xF83A5958, 0xE986, 0x4BDA, {0xBE, 0xB0, 0x41, 0x1F, 0x6A, 0x7A, 0x01, 0xB7}}
AUTHENTICATED_QUERY_ENCRYPTION_WHEN_ACCESSIBLE_GUID_COUNT ::
	GUID{0xB30F7066, 0x203C, 0x4B07, {0x93, 0xFC, 0xCE, 0xAA, 0xFD, 0x61, 0x24, 0x1E}}
AUTHENTICATED_QUERY_OUTPUT_ID :: GUID{0x839DDCA3, 0x9B4E, 0x41E4, {0xB0, 0x53, 0x89, 0x2B, 0xD2, 0xA1, 0x1E, 0xE7}}
AUTHENTICATED_QUERY_OUTPUT_ID_COUNT :: GUID{0x2C042B5E, 0x8C07, 0x46D5, {0xAA, 0xBE, 0x8F, 0x75, 0xCB, 0xAD, 0x4C, 0x31}}
AUTHENTICATED_QUERY_PROTECTION :: GUID{0xA84EB584, 0xC495, 0x48AA, {0xB9, 0x4D, 0x8B, 0xD2, 0xD6, 0xFB, 0xCE, 0x05}}
AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS ::
	GUID{0x649BBADB, 0xF0F4, 0x4639, {0xA1, 0x5B, 0x24, 0x39, 0x3F, 0xC3, 0xAB, 0xAC}}
AUTHENTICATED_QUERY_RESTRICTED_SHARED_RESOURCE_PROCESS_COUNT ::
	GUID{0x0DB207B3, 0x9450, 0x46A6, {0x82, 0xDE, 0x1B, 0x96, 0xD4, 0x4F, 0x9C, 0xF2}}
AUTHENTICATED_QUERY_UNRESTRICTED_PROTECTED_SHARED_RESOURCE_COUNT ::
	GUID{0x012F0BD6, 0xE662, 0x4474, {0xBE, 0xFD, 0xAA, 0x53, 0xE5, 0x14, 0x3C, 0x6D}}
BREAKON_CATEGORY :: "BreakOn_CATEGORY_%s"
BREAKON_ID_DECIMAL :: "BreakOn_ID_%d"
BREAKON_ID_STRING :: "BreakOn_ID_%s"
BREAKON_SEVERITY :: "BreakOn_SEVERITY_%s"
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
COMPARISON_FILTERING_BIT :: 128
CRYPTO_TYPE_AES128_CTR :: GUID{0x9B6BD711, 0x4F74, 0x41C9, {0x9E, 0x7B, 0x0B, 0xE2, 0xD7, 0xD9, 0x3B, 0x4F}}
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
DEBUG_FEATURE_ALWAYS_DISCARD_OFFERED_RESOURCE :: 8
DEBUG_FEATURE_AVOID_BEHAVIOR_CHANGING_DEBUG_AIDS :: 64
DEBUG_FEATURE_DISABLE_TILED_RESOURCE_MAPPING_TRACKING_AND_VALIDATION :: 128
DEBUG_FEATURE_FINISH_PER_RENDER_OP :: 2
DEBUG_FEATURE_FLUSH_PER_RENDER_OP :: 1
DEBUG_FEATURE_NEVER_DISCARD_OFFERED_RESOURCE :: 16
DEBUG_FEATURE_PRESENT_PER_RENDER_OP :: 4
DECODER_BITSTREAM_ENCRYPTION_TYPE_CBCS :: GUID{0x422D9319, 0x9D21, 0x4BB7, {0x93, 0x71, 0xFA, 0xF5, 0xA8, 0x2C, 0x3E, 0x04}}
DECODER_BITSTREAM_ENCRYPTION_TYPE_CENC :: GUID{0xB0405235, 0xC13D, 0x44F2, {0x9A, 0xE5, 0xDD, 0x48, 0xE0, 0x8E, 0x5B, 0x67}}
DECODER_ENCRYPTION_HW_CENC :: GUID{0x89D6AC4F, 0x09F2, 0x4229, {0xB2, 0xCD, 0x37, 0x74, 0x0A, 0x6D, 0xFD, 0x81}}
DECODER_PROFILE_AV1_VLD_12BIT_PROFILE2 :: GUID{0x17127009, 0xA00F, 0x4CE1, {0x99, 0x4E, 0xBF, 0x40, 0x81, 0xF6, 0xF3, 0xF0}}
DECODER_PROFILE_AV1_VLD_12BIT_PROFILE2_420 ::
	GUID{0x2D80BED6, 0x9CAC, 0x4835, {0x9E, 0x91, 0x32, 0x7B, 0xBC, 0x4F, 0x9E, 0xE8}}
DECODER_PROFILE_AV1_VLD_PROFILE0 :: GUID{0xB8BE4CCB, 0xCF53, 0x46BA, {0x8D, 0x59, 0xD6, 0xB8, 0xA6, 0xDA, 0x5D, 0x2A}}
DECODER_PROFILE_AV1_VLD_PROFILE1 :: GUID{0x6936FF0F, 0x45B1, 0x4163, {0x9C, 0xC1, 0x64, 0x6E, 0xF6, 0x94, 0x61, 0x08}}
DECODER_PROFILE_AV1_VLD_PROFILE2 :: GUID{0x0C5F2AA1, 0xE541, 0x4089, {0xBB, 0x7B, 0x98, 0x11, 0x0A, 0x19, 0xD7, 0xC8}}
DECODER_PROFILE_H264_IDCT_FGT :: GUID{0x1B81BE67, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_H264_IDCT_NOFGT :: GUID{0x1B81BE66, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_H264_MOCOMP_FGT :: GUID{0x1B81BE65, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_H264_MOCOMP_NOFGT :: GUID{0x1B81BE64, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_H264_VLD_FGT :: GUID{0x1B81BE69, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_H264_VLD_MULTIVIEW_NOFGT ::
	GUID{0x705B9D82, 0x76CF, 0x49D6, {0xB7, 0xE6, 0xAC, 0x88, 0x72, 0xDB, 0x01, 0x3C}}
DECODER_PROFILE_H264_VLD_NOFGT :: GUID{0x1B81BE68, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_H264_VLD_STEREO_NOFGT :: GUID{0xF9AACCBB, 0xC2B6, 0x4CFC, {0x87, 0x79, 0x57, 0x07, 0xB1, 0x76, 0x05, 0x52}}
DECODER_PROFILE_H264_VLD_STEREO_PROGRESSIVE_NOFGT ::
	GUID{0xD79BE8DA, 0x0CF1, 0x4C81, {0xB8, 0x2A, 0x69, 0xA4, 0xE2, 0x36, 0xF4, 0x3D}}
DECODER_PROFILE_H264_VLD_WITHFMOASO_NOFGT ::
	GUID{0xD5F04FF9, 0x3418, 0x45D8, {0x95, 0x61, 0x32, 0xA7, 0x6A, 0xAE, 0x2D, 0xDD}}
DECODER_PROFILE_HEVC_VLD_MAIN :: GUID{0x5B11D51B, 0x2F4C, 0x4452, {0xBC, 0xC3, 0x09, 0xF2, 0xA1, 0x16, 0x0C, 0xC0}}
DECODER_PROFILE_HEVC_VLD_MAIN10 :: GUID{0x107AF0E0, 0xEF1A, 0x4D19, {0xAB, 0xA8, 0x67, 0xA1, 0x63, 0x07, 0x3D, 0x13}}
DECODER_PROFILE_MPEG1_VLD :: GUID{0x6F3EC719, 0x3735, 0x42CC, {0x80, 0x63, 0x65, 0xCC, 0x3C, 0xB3, 0x66, 0x16}}
DECODER_PROFILE_MPEG2_IDCT :: GUID{0xBF22AD00, 0x03EA, 0x4690, {0x80, 0x77, 0x47, 0x33, 0x46, 0x20, 0x9B, 0x7E}}
DECODER_PROFILE_MPEG2_MOCOMP :: GUID{0xE6A9F44B, 0x61B0, 0x4563, {0x9E, 0xA4, 0x63, 0xD2, 0xA3, 0xC6, 0xFE, 0x66}}
DECODER_PROFILE_MPEG2_VLD :: GUID{0xEE27417F, 0x5E28, 0x4E65, {0xBE, 0xEA, 0x1D, 0x26, 0xB5, 0x08, 0xAD, 0xC9}}
DECODER_PROFILE_MPEG2and1_VLD :: GUID{0x86695F12, 0x340E, 0x4F04, {0x9F, 0xD3, 0x92, 0x53, 0xDD, 0x32, 0x74, 0x60}}
DECODER_PROFILE_MPEG4PT2_VLD_ADVSIMPLE_GMC ::
	GUID{0xAB998B5B, 0x4258, 0x44A9, {0x9F, 0xEB, 0x94, 0xE5, 0x97, 0xA6, 0xBA, 0xAE}}
DECODER_PROFILE_MPEG4PT2_VLD_ADVSIMPLE_NOGMC ::
	GUID{0xED418A9F, 0x010D, 0x4EDA, {0x9A, 0xE3, 0x9A, 0x65, 0x35, 0x8D, 0x8D, 0x2E}}
DECODER_PROFILE_MPEG4PT2_VLD_SIMPLE :: GUID{0xEFD64D74, 0xC9E8, 0x41D7, {0xA5, 0xE9, 0xE9, 0xB0, 0xE3, 0x9F, 0xA3, 0x19}}
DECODER_PROFILE_VC1_D2010 :: GUID{0x1B81BEA4, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_VC1_IDCT :: GUID{0x1B81BEA2, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_VC1_MOCOMP :: GUID{0x1B81BEA1, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_VC1_POSTPROC :: GUID{0x1B81BEA0, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_VC1_VLD :: GUID{0x1B81BEA3, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_VP8_VLD :: GUID{0x90B899EA, 0x3A62, 0x4705, {0x88, 0xB3, 0x8D, 0xF0, 0x4B, 0x27, 0x44, 0xE7}}
DECODER_PROFILE_VP9_VLD_10BIT_PROFILE2 :: GUID{0xA4C749EF, 0x6ECF, 0x48AA, {0x84, 0x48, 0x50, 0xA7, 0xA1, 0x16, 0x5F, 0xF7}}
DECODER_PROFILE_VP9_VLD_PROFILE0 :: GUID{0x463707F8, 0xA1D0, 0x4585, {0x87, 0x6D, 0x83, 0xAA, 0x6D, 0x60, 0xB8, 0x9E}}
DECODER_PROFILE_WMV8_MOCOMP :: GUID{0x1B81BE81, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_WMV8_POSTPROC :: GUID{0x1B81BE80, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_WMV9_IDCT :: GUID{0x1B81BE94, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_WMV9_MOCOMP :: GUID{0x1B81BE91, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DECODER_PROFILE_WMV9_POSTPROC :: GUID{0x1B81BE90, 0xA0C7, 0x11D3, {0xB9, 0x84, 0x00, 0xC0, 0x4F, 0x2E, 0x73, 0xC5}}
DEFAULT_BLEND_FACTOR_ALPHA :: 1
DEFAULT_BLEND_FACTOR_BLUE :: 1
DEFAULT_BLEND_FACTOR_GREEN :: 1
DEFAULT_BLEND_FACTOR_RED :: 1
DEFAULT_BORDER_COLOR_COMPONENT :: 0
DEFAULT_DEPTH_BIAS :: 0
DEFAULT_DEPTH_BIAS_CLAMP :: 0
DEFAULT_MAX_ANISOTROPY :: 16
DEFAULT_MIP_LOD_BIAS :: 0
DEFAULT_RENDER_TARGET_ARRAY_INDEX :: 0
DEFAULT_SAMPLE_MASK :: 4294967295
DEFAULT_SCISSOR_ENDX :: 0
DEFAULT_SCISSOR_ENDY :: 0
DEFAULT_SCISSOR_STARTX :: 0
DEFAULT_SCISSOR_STARTY :: 0
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
ENABLE_BREAK_ON_MESSAGE :: "EnableBreakOnMessage"
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
FORCE_DEBUGGABLE :: "ForceDebuggable"
FORCE_SHADER_SKIP_OPTIMIZATION :: "ForceShaderSkipOptimization"
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
INFOQUEUE_STORAGE_FILTER_OVERRIDE :: "InfoQueueStorageFilterOverride"
INTEGER_DIVIDE_BY_ZERO_QUOTIENT :: 4294967295
INTEGER_DIVIDE_BY_ZERO_REMAINDER :: 4294967295
KEEP_RENDER_TARGETS_AND_DEPTH_STENCIL :: 4294967295
KEEP_UNORDERED_ACCESS_VIEWS :: 4294967295
KEY_EXCHANGE_HW_PROTECTION :: GUID{0xB1170D8A, 0x628D, 0x4DA3, {0xAD, 0x3B, 0x82, 0xDD, 0xB0, 0x8B, 0x49, 0x70}}
KEY_EXCHANGE_RSAES_OAEP :: GUID{0xC1949895, 0xD72A, 0x4A1D, {0x8E, 0x5D, 0xED, 0x85, 0x7D, 0x17, 0x15, 0x20}}
LINEAR_GAMMA :: 1
MAG_FILTER_SHIFT :: 2
MAJOR_VERSION :: 11
MAX_BORDER_COLOR_COMPONENT :: 1
MAX_DEPTH :: 1
MAX_MAXANISOTROPY :: 16
MAX_MULTISAMPLE_SAMPLE_COUNT :: 32
MAX_POSITION_VALUE :: 3.4028236E+34
MAX_TEXTURE_DIMENSION_2_TO_EXP :: 17
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
MUTE_CATEGORY :: "Mute_CATEGORY_%s"
MUTE_DEBUG_OUTPUT :: "MuteDebugOutput"
MUTE_ID_DECIMAL :: "Mute_ID_%d"
MUTE_ID_STRING :: "Mute_ID_%s"
MUTE_SEVERITY :: "Mute_SEVERITY_%s"
NONSAMPLE_FETCH_OUT_OF_RANGE_ACCESS_RESULT :: 0
PACKED_TILE :: 4294967295
PIXEL_ADDRESS_RANGE_BIT_COUNT :: 15
PRE_SCISSOR_PIXEL_ADDRESS_RANGE_BIT_COUNT :: 16
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
REGKEY_PATH :: "Software\\Microsoft\\Direct3D"
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
REQ_TEXTURE1D_ARRAY_AXIS_DIMENSION :: 2048
REQ_TEXTURE1D_U_DIMENSION :: 16384
REQ_TEXTURE2D_ARRAY_AXIS_DIMENSION :: 2048
REQ_TEXTURE2D_U_OR_V_DIMENSION :: 16384
REQ_TEXTURE3D_U_V_OR_W_DIMENSION :: 2048
REQ_TEXTURECUBE_DIMENSION :: 16384
RESINFO_INSTRUCTION_MISSING_COMPONENT_RETVAL :: 0
SDK_LAYERS_VERSION :: 1
SDK_VERSION :: 7
SHADER_MAJOR_VERSION :: 5
SHADER_MAX_INSTANCES :: 65535
SHADER_MAX_INTERFACE_CALL_SITES :: 4096
SHADER_MAX_INTERFACES :: 253
SHADER_MAX_TYPES :: 65535
SHADER_MINOR_VERSION :: 0
SHADER_TRACE_FLAG_RECORD_REGISTER_READS :: 2
SHADER_TRACE_FLAG_RECORD_REGISTER_WRITES :: 1
SHIFT_INSTRUCTION_PAD_VALUE :: 0
SHIFT_INSTRUCTION_SHIFT_VALUE_BIT_COUNT :: 5
SIMULTANEOUS_RENDER_TARGET_COUNT :: 8
SO_BUFFER_MAX_STRIDE_IN_BYTES :: 2048
SO_BUFFER_MAX_WRITE_WINDOW_IN_BYTES :: 512
SO_BUFFER_SLOT_COUNT :: 4
SO_DDI_REGISTER_INDEX_DENOTING_GAP :: 4294967295
SO_NO_RASTERIZED_STREAM :: 4294967295
SO_OUTPUT_COMPONENT_COUNT :: 128
SO_STREAM_COUNT :: 4
SPEC_DATE_DAY :: 16
SPEC_DATE_MONTH :: 5
SPEC_DATE_YEAR :: 2011
SPEC_VERSION :: 1.07
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
TESSELLATOR_MAX_EVEN_TESSELLATION_FACTOR :: 64
TESSELLATOR_MAX_ISOLINE_DENSITY_TESSELLATION_FACTOR :: 64
TESSELLATOR_MAX_ODD_TESSELLATION_FACTOR :: 63
TESSELLATOR_MAX_TESSELLATION_FACTOR :: 64
TESSELLATOR_MIN_EVEN_TESSELLATION_FACTOR :: 2
TESSELLATOR_MIN_ISOLINE_DENSITY_TESSELLATION_FACTOR :: 1
TESSELLATOR_MIN_ODD_TESSELLATION_FACTOR :: 1
TEXEL_ADDRESS_RANGE_BIT_COUNT :: 16
TRACE_COMPONENT_W :: 8
TRACE_COMPONENT_X :: 1
TRACE_COMPONENT_Y :: 2
TRACE_COMPONENT_Z :: 4
TRACE_MISC_GS_CUT :: 2
TRACE_MISC_GS_CUT_STREAM :: 16
TRACE_MISC_GS_EMIT :: 1
TRACE_MISC_GS_EMIT_STREAM :: 8
TRACE_MISC_HALT :: 32
TRACE_MISC_MESSAGE :: 64
TRACE_MISC_PS_DISCARD :: 4
TRACE_REGISTER_FLAGS_RELATIVE_INDEXING :: 1
UNBOUND_MEMORY_ACCESS_RESULT :: 0
UNMUTE_SEVERITY_INFO :: "Unmute_SEVERITY_INFO"
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
D3DCSX_DLL :: "d3dcsx_47.dll"
D3DCSX_DLL_A :: "d3dcsx_47.dll"
D3DCSX_DLL_W :: "d3dcsx_47.dll"
D3DX11_FFT_MAX_DIMENSIONS :: 32
D3DX11_FFT_MAX_PRECOMPUTE_BUFFERS :: 4
D3DX11_FFT_MAX_TEMP_BUFFERS :: 4
DXGI_DEBUG_D3D11 :: GUID{0x4B99317B, 0xAC39, 0x4AA6, {0xBB, 0x0B, 0xBA, 0xA0, 0x47, 0x84, 0x79, 0x8F}}

BOOL :: win32.BOOL
GUID :: win32.GUID
HANDLE :: win32.HANDLE
HMODULE :: win32.HMODULE
HRESULT :: win32.HRESULT
IUnknown :: win32.IUnknown
IUnknown_Vtbl :: win32.IUnknown_Vtbl
PSTR :: win32.PSTR
PWSTR :: win32.PWSTR
RECT :: win32.RECT
SECURITY_ATTRIBUTES :: win32.SECURITY_ATTRIBUTES
SIZE :: win32.SIZE

import "../d3d"
import "../d3d12"
import "../dxgi"
import win32 ".."
