package windows

foreign import kernel32 "system:kernel32.lib"
foreign import mincore "system:mincore.lib"
foreign import ntdll "system:ntdll.lib"
foreign import ntdllk "system:ntdllk.lib"
foreign import onecore "system:onecore.lib"

@(default_calling_convention="system")
foreign kernel32 {
	DnsHostnameToComputerNameExW :: proc(Hostname: PWSTR, ComputerName: PWSTR, nSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-enumsystemfirmwaretables ]]
	EnumSystemFirmwareTables :: proc(
		FirmwareTableProviderSignature: FIRMWARE_TABLE_PROVIDER,
		pFirmwareTableEnumBuffer: ^u8,
		BufferSize: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getcomputernameexa ]]
	GetComputerNameExA :: proc(NameType: COMPUTER_NAME_FORMAT, lpBuffer: PSTR, nSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getcomputernameexw ]]
	GetComputerNameExW :: proc(NameType: COMPUTER_NAME_FORMAT, lpBuffer: PWSTR, nSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfirmwaretype ]]
	GetFirmwareType :: proc(FirmwareType: ^FIRMWARE_TYPE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getlocaltime ]]
	GetLocalTime :: proc(lpSystemTime: ^SYSTEMTIME) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getlogicalprocessorinformation ]]
	GetLogicalProcessorInformation :: proc(Buffer: ^SYSTEM_LOGICAL_PROCESSOR_INFORMATION, ReturnedLength: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getlogicalprocessorinformationex ]]
	GetLogicalProcessorInformationEx :: proc(
		RelationshipType: LOGICAL_PROCESSOR_RELATIONSHIP,
		Buffer: ^SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX,
		ReturnedLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getnativesysteminfo ]]
	GetNativeSystemInfo :: proc(lpSystemInfo: ^SYSTEM_INFO) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getphysicallyinstalledsystemmemory ]]
	GetPhysicallyInstalledSystemMemory :: proc(TotalMemoryInKilobytes: ^u64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getprocessorsystemcycletime ]]
	GetProcessorSystemCycleTime :: proc(
		Group: u16,
		Buffer: ^SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION,
		ReturnedLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getproductinfo ]]
	GetProductInfo :: proc(
		dwOSMajorVersion: u32,
		dwOSMinorVersion: u32,
		dwSpMajorVersion: u32,
		dwSpMinorVersion: u32,
		pdwReturnedProductType: ^OS_PRODUCT_TYPE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/ProcThread/getsystemcpusetinformation ]]
	GetSystemCpuSetInformation :: proc(
		Information: ^SYSTEM_CPU_SET_INFORMATION,
		BufferLength: u32,
		ReturnedLength: ^u32,
		Process: HANDLE,
		Flags: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getsystemdeppolicy ]]
	GetSystemDEPPolicy :: proc() -> DEP_SYSTEM_POLICY_TYPE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemdirectorya ]]
	GetSystemDirectoryA :: proc(lpBuffer: PSTR, uSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemdirectoryw ]]
	GetSystemDirectoryW :: proc(lpBuffer: PWSTR, uSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemfirmwaretable ]]
	GetSystemFirmwareTable :: proc(
		FirmwareTableProviderSignature: FIRMWARE_TABLE_PROVIDER,
		FirmwareTableID: u32,
		pFirmwareTableBuffer: ^u8,
		BufferSize: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsysteminfo ]]
	GetSystemInfo :: proc(lpSystemInfo: ^SYSTEM_INFO) ---

	GetSystemLeapSecondInformation :: proc(Enabled: ^BOOL, Flags: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtime ]]
	GetSystemTime :: proc(lpSystemTime: ^SYSTEMTIME) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtimeadjustment ]]
	GetSystemTimeAdjustment :: proc(
		lpTimeAdjustment: ^u32,
		lpTimeIncrement: ^u32,
		lpTimeAdjustmentDisabled: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtimeasfiletime ]]
	GetSystemTimeAsFileTime :: proc(lpSystemTimeAsFileTime: ^FILETIME) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtimepreciseasfiletime ]]
	GetSystemTimePreciseAsFileTime :: proc(lpSystemTimeAsFileTime: ^FILETIME) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemwindowsdirectorya ]]
	GetSystemWindowsDirectoryA :: proc(lpBuffer: PSTR, uSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemwindowsdirectoryw ]]
	GetSystemWindowsDirectoryW :: proc(lpBuffer: PWSTR, uSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-getsystemwow64directorya ]]
	GetSystemWow64DirectoryA :: proc(lpBuffer: PSTR, uSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-getsystemwow64directoryw ]]
	GetSystemWow64DirectoryW :: proc(lpBuffer: PWSTR, uSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-gettickcount ]]
	GetTickCount :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-gettickcount64 ]]
	GetTickCount64 :: proc() -> u64 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversion ]]
	GetVersion :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversionexa ]]
	GetVersionExA :: proc(lpVersionInformation: ^OSVERSIONINFOA) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getversionexw ]]
	GetVersionExW :: proc(lpVersionInformation: ^OSVERSIONINFOW) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectorya ]]
	GetWindowsDirectoryA :: proc(lpBuffer: PSTR, uSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getwindowsdirectoryw ]]
	GetWindowsDirectoryW :: proc(lpBuffer: PWSTR, uSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalmemorystatus ]]
	GlobalMemoryStatus :: proc(lpBuffer: ^MEMORYSTATUS) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-globalmemorystatusex ]]
	GlobalMemoryStatusEx :: proc(lpBuffer: ^MEMORYSTATUSEX) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-isusercetavailableinenvironment ]]
	IsUserCetAvailableInEnvironment :: proc(UserCetEnvironment: USER_CET_ENVIRONMENT) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-iswow64guestmachinesupported ]]
	IsWow64GuestMachineSupported :: proc(WowGuestMachine: IMAGE_FILE_MACHINE, MachineIsSupported: ^BOOL) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-setcomputernamea ]]
	SetComputerNameA :: proc(lpComputerName: PSTR) -> BOOL ---

	SetComputerNameEx2W :: proc(NameType: COMPUTER_NAME_FORMAT, Flags: u32, lpBuffer: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-setcomputernameexa ]]
	SetComputerNameExA :: proc(NameType: COMPUTER_NAME_FORMAT, lpBuffer: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-setcomputernameexw ]]
	SetComputerNameExW :: proc(NameType: COMPUTER_NAME_FORMAT, lpBuffer: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-setcomputernamew ]]
	SetComputerNameW :: proc(lpComputerName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-setlocaltime ]]
	SetLocalTime :: proc(#by_ptr lpSystemTime: SYSTEMTIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-setsystemtime ]]
	SetSystemTime :: proc(#by_ptr lpSystemTime: SYSTEMTIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-setsystemtimeadjustment ]]
	SetSystemTimeAdjustment :: proc(dwTimeAdjustment: u32, bTimeAdjustmentDisabled: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-verifyversioninfoa ]]
	VerifyVersionInfoA :: proc(
		lpVersionInformation: ^OSVERSIONINFOEXA,
		dwTypeMask: VER_FLAGS,
		dwlConditionMask: u64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-verifyversioninfow ]]
	VerifyVersionInfoW :: proc(
		lpVersionInformation: ^OSVERSIONINFOEXW,
		dwTypeMask: VER_FLAGS,
		dwlConditionMask: u64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-versetconditionmask ]]
	VerSetConditionMask :: proc(ConditionMask: u64, TypeMask: VER_FLAGS, Condition: u8) -> u64 ---
}

@(default_calling_convention="system")
foreign mincore {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getsystemtimeadjustmentprecise ]]
	GetSystemTimeAdjustmentPrecise :: proc(
		lpTimeAdjustment: ^u64,
		lpTimeIncrement: ^u64,
		lpTimeAdjustmentDisabled: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-setsystemtimeadjustmentprecise ]]
	SetSystemTimeAdjustmentPrecise :: proc(dwTimeAdjustment: u64, bTimeAdjustmentDisabled: BOOL) -> BOOL ---
}

@(default_calling_convention="system")
foreign ntdll {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/nf-winnt-rtlconvertdevicefamilyinfotostring ]]
	RtlConvertDeviceFamilyInfoToString :: proc(
		pulDeviceFamilyBufferSize: ^u32,
		pulDeviceFormBufferSize: ^u32,
		DeviceFamily: PWSTR,
		DeviceForm: PWSTR,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/DevNotes/rtlgetdevicefamilyinfoenum ]]
	RtlGetDeviceFamilyInfoEnum :: proc(
		pullUAPInfo: ^u64,
		pulDeviceFamily: ^DEVICEFAMILYINFOENUM,
		pulDeviceForm: ^DEVICEFAMILYDEVICEFORM,
	) ---

	RtlGetProductInfo :: proc(
		OSMajorVersion: u32,
		OSMinorVersion: u32,
		SpMajorVersion: u32,
		SpMinorVersion: u32,
		ReturnedProductType: ^u32,
	) -> BOOLEAN ---

	RtlOsDeploymentState :: proc(Flags: u32) -> OS_DEPLOYEMENT_STATE_VALUES ---

	RtlSwitchedVVI :: proc(VersionInfo: ^OSVERSIONINFOEXW, TypeMask: u32, ConditionMask: u64) -> u32 ---
}

@(default_calling_convention="system")
foreign ntdllk {
	RtlGetSystemGlobalData :: proc(DataId: RTL_SYSTEM_GLOBAL_DATA_ID, Buffer: rawptr, Size: u32) -> u32 ---
}

@(default_calling_convention="system")
foreign onecore {
	GetDeveloperDriveEnablementState :: proc() -> DEVELOPER_DRIVE_ENABLEMENT_STATE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/nf-sysinfoapi-getintegrateddisplaysize ]]
	GetIntegratedDisplaySize :: proc(sizeInInches: ^f64) -> HRESULT ---

	GetOsManufacturingMode :: proc(pbEnabled: ^BOOL) -> BOOL ---

	GetOsSafeBootMode :: proc(Flags: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-getsystemwow64directory2a ]]
	GetSystemWow64Directory2A :: proc(lpBuffer: PSTR, uSize: u32, ImageFileMachineType: IMAGE_FILE_MACHINE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-getsystemwow64directory2w ]]
	GetSystemWow64Directory2W :: proc(lpBuffer: PWSTR, uSize: u32, ImageFileMachineType: IMAGE_FILE_MACHINE) -> u32 ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-cache_descriptor ]]
CACHE_DESCRIPTOR :: struct {
	Level: u8,
	Associativity: u8,
	LineSize: u16,
	Size: u32,
	Type: PROCESSOR_CACHE_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-cache_relationship ]]
CACHE_RELATIONSHIP :: struct {
	Level: u8,
	Associativity: u8,
	LineSize: u16,
	CacheSize: u32,
	Type: PROCESSOR_CACHE_TYPE,
	Reserved: [18]u8,
	GroupCount: u16,
	using _: struct #raw_union {
		GroupMask: GROUP_AFFINITY,
		GroupMasks: [1]GROUP_AFFINITY,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/ne-sysinfoapi-computer_name_format ]]
COMPUTER_NAME_FORMAT :: enum i32 {
	NetBIOS = 0,
	DnsHostname = 1,
	DnsDomain = 2,
	DnsFullyQualified = 3,
	PhysicalNetBIOS = 4,
	PhysicalDnsHostname = 5,
	PhysicalDnsDomain = 6,
	PhysicalDnsFullyQualified = 7,
	Max = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/ProcThread/cpu-set-information-type ]]
CPU_SET_INFORMATION_TYPE :: enum i32 {
	puSetInformation = 0,
}

DEP_SYSTEM_POLICY_TYPE :: enum i32 {
	PolicyAlwaysOff = 0,
	PolicyAlwaysOn = 1,
	PolicyOptIn = 2,
	PolicyOptOut = 3,
	TotalPolicyCount = 4,
}

DEVELOPER_DRIVE_ENABLEMENT_STATE :: enum i32 {
	EnablementStateError = 0,
	Enabled = 1,
	DisabledBySystemPolicy = 2,
	DisabledByGroupPolicy = 3,
}

DEVICEFAMILYDEVICEFORM :: enum u32 {
	UNKNOWN = 0x00000000,
	PHONE = 0x00000001,
	TABLET = 0x00000002,
	DESKTOP = 0x00000003,
	NOTEBOOK = 0x00000004,
	CONVERTIBLE = 0x00000005,
	DETACHABLE = 0x00000006,
	ALLINONE = 0x00000007,
	STICKPC = 0x00000008,
	PUCK = 0x00000009,
	LARGESCREEN = 0x0000000A,
	HMD = 0x0000000B,
	INDUSTRY_HANDHELD = 0x0000000C,
	INDUSTRY_TABLET = 0x0000000D,
	BANKING = 0x0000000E,
	BUILDING_AUTOMATION = 0x0000000F,
	DIGITAL_SIGNAGE = 0x00000010,
	GAMING = 0x00000011,
	HOME_AUTOMATION = 0x00000012,
	INDUSTRIAL_AUTOMATION = 0x00000013,
	KIOSK = 0x00000014,
	MAKER_BOARD = 0x00000015,
	MEDICAL = 0x00000016,
	NETWORKING = 0x00000017,
	POINT_OF_SERVICE = 0x00000018,
	PRINTING = 0x00000019,
	THIN_CLIENT = 0x0000001A,
	TOY = 0x0000001B,
	VENDING = 0x0000001C,
	INDUSTRY_OTHER = 0x0000001D,
	XBOX_ONE = 0x0000001E,
	XBOX_ONE_S = 0x0000001F,
	XBOX_ONE_X = 0x00000020,
	XBOX_ONE_X_DEVKIT = 0x00000021,
	XBOX_SERIES_X = 0x00000022,
	XBOX_SERIES_X_DEVKIT = 0x00000023,
	XBOX_SERIES_S = 0x00000024,
	XBOX_RESERVED_01 = 0x00000025,
	XBOX_RESERVED_02 = 0x00000026,
	XBOX_RESERVED_03 = 0x00000027,
	XBOX_RESERVED_04 = 0x00000028,
	XBOX_RESERVED_05 = 0x00000029,
	XBOX_RESERVED_06 = 0x0000002A,
	XBOX_RESERVED_07 = 0x0000002B,
	XBOX_RESERVED_08 = 0x0000002C,
	XBOX_RESERVED_09 = 0x0000002D,
	MAX = 0x0000002D,
}

DEVICEFAMILYINFOENUM :: enum u32 {
	UAP = 0x00000000,
	WINDOWS_8X = 0x00000001,
	WINDOWS_PHONE_8X = 0x00000002,
	DESKTOP = 0x00000003,
	MOBILE = 0x00000004,
	XBOX = 0x00000005,
	TEAM = 0x00000006,
	IOT = 0x00000007,
	IOT_HEADLESS = 0x00000008,
	SERVER = 0x00000009,
	HOLOGRAPHIC = 0x0000000A,
	XBOXSRA = 0x0000000B,
	XBOXERA = 0x0000000C,
	SERVER_NANO = 0x0000000D,
	_8828080 = 0x0000000E,
	_7067329 = 0x0000000F,
	WINDOWS_CORE = 0x00000010,
	WINDOWS_CORE_HEADLESS = 0x00000011,
	MAX = 0x00000011,
}

FIRMWARE_TABLE_PROVIDER :: enum u32 {
	ACPI = 0x41435049,
	FIRM = 0x4649524D,
	RSMB = 0x52534D42,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-firmware_type ]]
FIRMWARE_TYPE :: enum i32 {
	Unknown = 0,
	Bios = 1,
	Uefi = 2,
	Max = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-group_affinity ]]
GROUP_AFFINITY :: struct {
	Mask: uintptr,
	Group: u16,
	Reserved: [3]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-group_relationship ]]
GROUP_RELATIONSHIP :: struct {
	MaximumGroupCount: u16,
	ActiveGroupCount: u16,
	Reserved: [20]u8,
	GroupInfo: [1]PROCESSOR_GROUP_INFO,
}

IMAGE_FILE_MACHINE :: enum u16 {
	AXP64 = 0x0284,
	I386 = 0x014C,
	IA64 = 0x0200,
	AMD64 = 0x8664,
	UNKNOWN = 0x0000,
	TARGET_HOST = 0x0001,
	R3000 = 0x0162,
	R4000 = 0x0166,
	R10000 = 0x0168,
	WCEMIPSV2 = 0x0169,
	ALPHA = 0x0184,
	SH3 = 0x01A2,
	SH3DSP = 0x01A3,
	SH3E = 0x01A4,
	SH4 = 0x01A6,
	SH5 = 0x01A8,
	ARM = 0x01C0,
	THUMB = 0x01C2,
	ARMNT = 0x01C4,
	AM33 = 0x01D3,
	POWERPC = 0x01F0,
	POWERPCFP = 0x01F1,
	MIPS16 = 0x0266,
	ALPHA64 = 0x0284,
	MIPSFPU = 0x0366,
	MIPSFPU16 = 0x0466,
	TRICORE = 0x0520,
	CEF = 0x0CEF,
	EBC = 0x0EBC,
	M32R = 0x9041,
	ARM64 = 0xAA64,
	CEE = 0xC0EE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-logical_processor_relationship ]]
LOGICAL_PROCESSOR_RELATIONSHIP :: enum i32 {
	ProcessorCore = 0,
	NumaNode = 1,
	Cache = 2,
	ProcessorPackage = 3,
	Group = 4,
	ProcessorDie = 5,
	NumaNodeEx = 6,
	ProcessorModule = 7,
	All = 65535,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-memorystatus ]]
MEMORYSTATUS :: struct {
	dwLength: u32,
	dwMemoryLoad: u32,
	dwTotalPhys: uintptr,
	dwAvailPhys: uintptr,
	dwTotalPageFile: uintptr,
	dwAvailPageFile: uintptr,
	dwTotalVirtual: uintptr,
	dwAvailVirtual: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/ns-sysinfoapi-memorystatusex ]]
MEMORYSTATUSEX :: struct {
	dwLength: u32,
	dwMemoryLoad: u32,
	ullTotalPhys: u64,
	ullAvailPhys: u64,
	ullTotalPageFile: u64,
	ullAvailPageFile: u64,
	ullTotalVirtual: u64,
	ullAvailVirtual: u64,
	ullAvailExtendedVirtual: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-numa_node_relationship ]]
NUMA_NODE_RELATIONSHIP :: struct {
	NodeNumber: u32,
	Reserved: [18]u8,
	GroupCount: u16,
	using _: struct #raw_union {
		GroupMask: GROUP_AFFINITY,
		GroupMasks: [1]GROUP_AFFINITY,
	},
}

OS_DEPLOYEMENT_STATE_VALUES :: enum i32 {
	STANDARD = 1,
	COMPACT = 2,
}

OS_PRODUCT_TYPE :: enum u32 {
	BUSINESS = 0x00000006,
	BUSINESS_N = 0x00000010,
	CLUSTER_SERVER = 0x00000012,
	CLUSTER_SERVER_V = 0x00000040,
	CORE = 0x00000065,
	CORE_COUNTRYSPECIFIC = 0x00000063,
	CORE_N = 0x00000062,
	CORE_SINGLELANGUAGE = 0x00000064,
	DATACENTER_EVALUATION_SERVER = 0x00000050,
	DATACENTER_A_SERVER_CORE = 0x00000091,
	STANDARD_A_SERVER_CORE = 0x00000092,
	DATACENTER_SERVER = 0x00000008,
	DATACENTER_SERVER_CORE = 0x0000000C,
	DATACENTER_SERVER_CORE_V = 0x00000027,
	DATACENTER_SERVER_V = 0x00000025,
	EDUCATION = 0x00000079,
	EDUCATION_N = 0x0000007A,
	ENTERPRISE = 0x00000004,
	ENTERPRISE_E = 0x00000046,
	ENTERPRISE_EVALUATION = 0x00000048,
	ENTERPRISE_N = 0x0000001B,
	ENTERPRISE_N_EVALUATION = 0x00000054,
	ENTERPRISE_S = 0x0000007D,
	ENTERPRISE_S_EVALUATION = 0x00000081,
	ENTERPRISE_S_N = 0x0000007E,
	ENTERPRISE_S_N_EVALUATION = 0x00000082,
	ENTERPRISE_SERVER = 0x0000000A,
	ENTERPRISE_SERVER_CORE = 0x0000000E,
	ENTERPRISE_SERVER_CORE_V = 0x00000029,
	ENTERPRISE_SERVER_IA64 = 0x0000000F,
	ENTERPRISE_SERVER_V = 0x00000026,
	ESSENTIALBUSINESS_SERVER_ADDL = 0x0000003C,
	ESSENTIALBUSINESS_SERVER_ADDLSVC = 0x0000003E,
	ESSENTIALBUSINESS_SERVER_MGMT = 0x0000003B,
	ESSENTIALBUSINESS_SERVER_MGMTSVC = 0x0000003D,
	HOME_BASIC = 0x00000002,
	HOME_BASIC_E = 0x00000043,
	HOME_BASIC_N = 0x00000005,
	HOME_PREMIUM = 0x00000003,
	HOME_PREMIUM_E = 0x00000044,
	HOME_PREMIUM_N = 0x0000001A,
	HOME_PREMIUM_SERVER = 0x00000022,
	HOME_SERVER = 0x00000013,
	HYPERV = 0x0000002A,
	IOTUAP = 0x0000007B,
	IOTUAPCOMMERCIAL = 0x00000083,
	MEDIUMBUSINESS_SERVER_MANAGEMENT = 0x0000001E,
	MEDIUMBUSINESS_SERVER_MESSAGING = 0x00000020,
	MEDIUMBUSINESS_SERVER_SECURITY = 0x0000001F,
	MOBILE_CORE = 0x00000068,
	MOBILE_ENTERPRISE = 0x00000085,
	MULTIPOINT_PREMIUM_SERVER = 0x0000004D,
	MULTIPOINT_STANDARD_SERVER = 0x0000004C,
	PRO_WORKSTATION = 0x000000A1,
	PRO_WORKSTATION_N = 0x000000A2,
	PROFESSIONAL = 0x00000030,
	PROFESSIONAL_E = 0x00000045,
	PROFESSIONAL_N = 0x00000031,
	PROFESSIONAL_WMC = 0x00000067,
	SB_SOLUTION_SERVER = 0x00000032,
	SB_SOLUTION_SERVER_EM = 0x00000036,
	SERVER_FOR_SB_SOLUTIONS = 0x00000033,
	SERVER_FOR_SB_SOLUTIONS_EM = 0x00000037,
	SERVER_FOR_SMALLBUSINESS = 0x00000018,
	SERVER_FOR_SMALLBUSINESS_V = 0x00000023,
	SERVER_FOUNDATION = 0x00000021,
	SMALLBUSINESS_SERVER = 0x00000009,
	SMALLBUSINESS_SERVER_PREMIUM = 0x00000019,
	SMALLBUSINESS_SERVER_PREMIUM_CORE = 0x0000003F,
	SOLUTION_EMBEDDEDSERVER = 0x00000038,
	STANDARD_EVALUATION_SERVER = 0x0000004F,
	STANDARD_SERVER = 0x00000007,
	STANDARD_SERVER_CORE_ = 0x0000000D,
	STANDARD_SERVER_CORE_V = 0x00000028,
	STANDARD_SERVER_V = 0x00000024,
	STANDARD_SERVER_SOLUTIONS = 0x00000034,
	STANDARD_SERVER_SOLUTIONS_CORE = 0x00000035,
	STARTER = 0x0000000B,
	STARTER_E = 0x00000042,
	STARTER_N = 0x0000002F,
	STORAGE_ENTERPRISE_SERVER = 0x00000017,
	STORAGE_ENTERPRISE_SERVER_CORE = 0x0000002E,
	STORAGE_EXPRESS_SERVER = 0x00000014,
	STORAGE_EXPRESS_SERVER_CORE = 0x0000002B,
	STORAGE_STANDARD_EVALUATION_SERVER = 0x00000060,
	STORAGE_STANDARD_SERVER = 0x00000015,
	STORAGE_STANDARD_SERVER_CORE = 0x0000002C,
	STORAGE_WORKGROUP_EVALUATION_SERVER = 0x0000005F,
	STORAGE_WORKGROUP_SERVER = 0x00000016,
	STORAGE_WORKGROUP_SERVER_CORE = 0x0000002D,
	ULTIMATE = 0x00000001,
	ULTIMATE_E = 0x00000047,
	ULTIMATE_N = 0x0000001C,
	UNDEFINED = 0x00000000,
	WEB_SERVER = 0x00000011,
	WEB_SERVER_CORE = 0x0000001D,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-osversioninfoa ]]
OSVERSIONINFOA :: struct {
	dwOSVersionInfoSize: u32,
	dwMajorVersion: u32,
	dwMinorVersion: u32,
	dwBuildNumber: u32,
	dwPlatformId: u32,
	szCSDVersion: [128]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-osversioninfoexa ]]
OSVERSIONINFOEXA :: struct {
	dwOSVersionInfoSize: u32,
	dwMajorVersion: u32,
	dwMinorVersion: u32,
	dwBuildNumber: u32,
	dwPlatformId: u32,
	szCSDVersion: [128]CHAR,
	wServicePackMajor: u16,
	wServicePackMinor: u16,
	wSuiteMask: u16,
	wProductType: u8,
	wReserved: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-osversioninfoexw ]]
OSVERSIONINFOEXW :: struct {
	dwOSVersionInfoSize: u32,
	dwMajorVersion: u32,
	dwMinorVersion: u32,
	dwBuildNumber: u32,
	dwPlatformId: u32,
	szCSDVersion: [128]u16,
	wServicePackMajor: u16,
	wServicePackMinor: u16,
	wSuiteMask: u16,
	wProductType: u8,
	wReserved: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-osversioninfow ]]
OSVERSIONINFOW :: struct {
	dwOSVersionInfoSize: u32,
	dwMajorVersion: u32,
	dwMinorVersion: u32,
	dwBuildNumber: u32,
	dwPlatformId: u32,
	szCSDVersion: [128]u16,
}

PGET_SYSTEM_WOW64_DIRECTORY_A :: #type proc "system" (lpBuffer: PSTR, uSize: u32) -> u32

PGET_SYSTEM_WOW64_DIRECTORY_W :: #type proc "system" (lpBuffer: PWSTR, uSize: u32) -> u32

PROCESSOR_ARCHITECTURE :: enum u16 {
	INTEL = 0x0000,
	MIPS = 0x0001,
	ALPHA = 0x0002,
	PPC = 0x0003,
	SHX = 0x0004,
	ARM = 0x0005,
	IA64 = 0x0006,
	ALPHA64 = 0x0007,
	MSIL = 0x0008,
	AMD64 = 0x0009,
	IA32_ON_WIN64 = 0x000A,
	NEUTRAL = 0x000B,
	ARM64 = 0x000C,
	ARM32_ON_WIN64 = 0x000D,
	IA32_ON_ARM64 = 0x000E,
	UNKNOWN = 0xFFFF,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-processor_cache_type ]]
PROCESSOR_CACHE_TYPE :: enum i32 {
	Unified = 0,
	Instruction = 1,
	Data = 2,
	Trace = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_group_info ]]
PROCESSOR_GROUP_INFO :: struct {
	MaximumProcessorCount: u8,
	ActiveProcessorCount: u8,
	Reserved: [38]u8,
	ActiveProcessorMask: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_relationship ]]
PROCESSOR_RELATIONSHIP :: struct {
	Flags: u8,
	EfficiencyClass: u8,
	Reserved: [20]u8,
	GroupCount: u16,
	GroupMask: [1]GROUP_AFFINITY,
}

RTL_SYSTEM_GLOBAL_DATA_ID :: enum i32 {
	Unknown = 0,
	RngSeedVersion = 1,
	InterruptTime = 2,
	TimeZoneBias = 3,
	ImageNumberLow = 4,
	ImageNumberHigh = 5,
	TimeZoneId = 6,
	NtMajorVersion = 7,
	NtMinorVersion = 8,
	SystemExpirationDate = 9,
	KdDebuggerEnabled = 10,
	CyclesPerYield = 11,
	SafeBootMode = 12,
	LastSystemRITEventTickCount = 13,
	ConsoleSharedDataFlags = 14,
	NtSystemRootDrive = 15,
	QpcShift = 16,
	QpcBypassEnabled = 17,
	QpcData = 18,
	QpcBias = 19,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_cpu_set_information ]]
SYSTEM_CPU_SET_INFORMATION :: struct {
	Size: u32,
	Type: CPU_SET_INFORMATION_TYPE,
	using _: struct #raw_union {
		CpuSet: struct {
			Id: u32,
			Group: u16,
			LogicalProcessorIndex: u8,
			CoreIndex: u8,
			LastLevelCacheIndex: u8,
			NumaNodeIndex: u8,
			EfficiencyClass: u8,
			using _: struct #raw_union {
				AllFlags: u8,
				using _: struct {
					using _: bit_field u8 {
						Parked: u8 | 1,
						Allocated: u8 | 1,
						AllocatedToTargetProcess: u8 | 1,
						RealTime: u8 | 1,
						ReservedFlags: u8 | 4,
					},
				},
			},
			using _: struct #raw_union {
				Reserved: u32,
				SchedulingClass: u8,
			},
			AllocationTag: u64,
		},
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/sysinfoapi/ns-sysinfoapi-system_info ]]
SYSTEM_INFO :: struct {
	using _: struct #raw_union {
		dwOemId: u32,
		using _: struct {
			wProcessorArchitecture: PROCESSOR_ARCHITECTURE,
			wReserved: u16,
		},
	},
	dwPageSize: u32,
	lpMinimumApplicationAddress: rawptr,
	lpMaximumApplicationAddress: rawptr,
	dwActiveProcessorMask: uintptr,
	dwNumberOfProcessors: u32,
	dwProcessorType: u32,
	dwAllocationGranularity: u32,
	wProcessorLevel: u16,
	wProcessorRevision: u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information ]]
SYSTEM_LOGICAL_PROCESSOR_INFORMATION :: struct {
	ProcessorMask: uintptr,
	Relationship: LOGICAL_PROCESSOR_RELATIONSHIP,
	using _: struct #raw_union {
		ProcessorCore: struct {
			Flags: u8,
		},
		NumaNode: struct {
			NodeNumber: u32,
		},
		Cache: CACHE_DESCRIPTOR,
		Reserved: [2]u64,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_logical_processor_information_ex ]]
SYSTEM_LOGICAL_PROCESSOR_INFORMATION_EX :: struct {
	Relationship: LOGICAL_PROCESSOR_RELATIONSHIP,
	Size: u32,
	using _: struct #raw_union {
		Processor: PROCESSOR_RELATIONSHIP,
		NumaNode: NUMA_NODE_RELATIONSHIP,
		Cache: CACHE_RELATIONSHIP,
		Group: GROUP_RELATIONSHIP,
	},
}

SYSTEM_POOL_ZEROING_INFORMATION :: struct {
	PoolZeroingSupportPresent: BOOLEAN,
}

SYSTEM_PROCESSOR_CYCLE_TIME_INFORMATION :: struct {
	CycleTime: u64,
}

SYSTEM_SUPPORTED_PROCESSOR_ARCHITECTURES_INFORMATION :: struct {
	using _: bit_field u32 {
		Machine: u32 | 16,
		KernelMode: u32 | 1,
		UserMode: u32 | 1,
		Native: u32 | 1,
		Process: u32 | 1,
		WoW64Container: u32 | 1,
		ReservedZero0: u32 | 11,
	},
}

USER_CET_ENVIRONMENT :: enum u32 {
	WIN32_PROCESS = 0x00000000,
	SGX2_ENCLAVE = 0x00000002,
	VBS_ENCLAVE = 0x00000010,
	VBS_BASIC_ENCLAVE = 0x00000011,
}

VER_FLAGS :: distinct bit_set[enum {
	MINORVERSION = 0,
	MAJORVERSION = 1,
	BUILDNUMBER = 2,
	PLATFORMID = 3,
	SERVICEPACKMINOR = 4,
	SERVICEPACKMAJOR = 5,
	SUITENAME = 6,
	PRODUCT_TYPE = 7,
}; u32]

WIN32_IE_IE100 :: 2560
WIN32_IE_IE110 :: 2560
WIN32_IE_IE20 :: 512
WIN32_IE_IE30 :: 768
WIN32_IE_IE302 :: 770
WIN32_IE_IE40 :: 1024
WIN32_IE_IE401 :: 1025
WIN32_IE_IE50 :: 1280
WIN32_IE_IE501 :: 1281
WIN32_IE_IE55 :: 1360
WIN32_IE_IE60 :: 1536
WIN32_IE_IE60SP1 :: 1537
WIN32_IE_IE60SP2 :: 1539
WIN32_IE_IE70 :: 1792
WIN32_IE_IE80 :: 2048
WIN32_IE_IE90 :: 2304
WIN32_IE_LONGHORN :: 1792
WIN32_IE_NT4 :: 512
WIN32_IE_NT4SP1 :: 512
WIN32_IE_NT4SP2 :: 512
WIN32_IE_NT4SP3 :: 770
WIN32_IE_NT4SP4 :: 1025
WIN32_IE_NT4SP5 :: 1025
WIN32_IE_NT4SP6 :: 1280
WIN32_IE_WIN10 :: 2560
WIN32_IE_WIN2K :: 1281
WIN32_IE_WIN2KSP1 :: 1281
WIN32_IE_WIN2KSP2 :: 1281
WIN32_IE_WIN2KSP3 :: 1281
WIN32_IE_WIN2KSP4 :: 1281
WIN32_IE_WIN6 :: 1792
WIN32_IE_WIN7 :: 2048
WIN32_IE_WIN8 :: 2560
WIN32_IE_WIN98 :: 1025
WIN32_IE_WIN98SE :: 1280
WIN32_IE_WINBLUE :: 2560
WIN32_IE_WINME :: 1360
WIN32_IE_WINTHRESHOLD :: 2560
WIN32_IE_WS03 :: 1538
WIN32_IE_WS03SP1 :: 1539
WIN32_IE_XP :: 1536
WIN32_IE_XPSP1 :: 1537
WIN32_IE_XPSP2 :: 1539
WIN32_WINNT_LONGHORN :: 1536
WIN32_WINNT_NT4 :: 1024
WIN32_WINNT_VISTA :: 1536
WIN32_WINNT_WIN10 :: 2560
WIN32_WINNT_WIN2K :: 1280
WIN32_WINNT_WIN6 :: 1536
WIN32_WINNT_WIN7 :: 1537
WIN32_WINNT_WIN8 :: 1538
WIN32_WINNT_WINBLUE :: 1539
WIN32_WINNT_WINTHRESHOLD :: 2560
WIN32_WINNT_WINXP :: 1281
WIN32_WINNT_WS03 :: 1282
WIN32_WINNT_WS08 :: 1536
NTDDI_LONGHORN :: 100663296
NTDDI_VERSION :: 167772172
NTDDI_VISTA :: 100663296
NTDDI_VISTASP1 :: 100663552
NTDDI_VISTASP2 :: 100663808
NTDDI_VISTASP3 :: 100664064
NTDDI_VISTASP4 :: 100664320
NTDDI_WIN10 :: 167772160
NTDDI_WIN10_19H1 :: 167772167
NTDDI_WIN10_CO :: 167772171
NTDDI_WIN10_FE :: 167772170
NTDDI_WIN10_MN :: 167772169
NTDDI_WIN10_NI :: 167772172
NTDDI_WIN10_RS1 :: 167772162
NTDDI_WIN10_RS2 :: 167772163
NTDDI_WIN10_RS3 :: 167772164
NTDDI_WIN10_RS4 :: 167772165
NTDDI_WIN10_RS5 :: 167772166
NTDDI_WIN10_TH2 :: 167772161
NTDDI_WIN10_VB :: 167772168
NTDDI_WIN2K :: 83886080
NTDDI_WIN2KSP1 :: 83886336
NTDDI_WIN2KSP2 :: 83886592
NTDDI_WIN2KSP3 :: 83886848
NTDDI_WIN2KSP4 :: 83887104
NTDDI_WIN4 :: 67108864
NTDDI_WIN6 :: 100663296
NTDDI_WIN6SP1 :: 100663552
NTDDI_WIN6SP2 :: 100663808
NTDDI_WIN6SP3 :: 100664064
NTDDI_WIN6SP4 :: 100664320
NTDDI_WIN7 :: 100728832
NTDDI_WIN8 :: 100794368
NTDDI_WINBLUE :: 100859904
NTDDI_WINTHRESHOLD :: 167772160
NTDDI_WINXP :: 83951616
NTDDI_WINXPSP1 :: 83951872
NTDDI_WINXPSP2 :: 83952128
NTDDI_WINXPSP3 :: 83952384
NTDDI_WINXPSP4 :: 83952640
NTDDI_WS03 :: 84017152
NTDDI_WS03SP1 :: 84017408
NTDDI_WS03SP2 :: 84017664
NTDDI_WS03SP3 :: 84017920
NTDDI_WS03SP4 :: 84018176
NTDDI_WS08 :: 100663552
NTDDI_WS08SP2 :: 100663808
NTDDI_WS08SP3 :: 100664064
NTDDI_WS08SP4 :: 100664320
OSVERSION_MASK :: 4294901760
SCEX2_ALT_NETBIOS_NAME :: 1
SPVERSION_MASK :: 65280
SUBVERSION_MASK :: 255
SYSTEM_CPU_SET_INFORMATION_ALLOCATED :: 2
SYSTEM_CPU_SET_INFORMATION_ALLOCATED_TO_TARGET_PROCESS :: 4
SYSTEM_CPU_SET_INFORMATION_PARKED :: 1
SYSTEM_CPU_SET_INFORMATION_REALTIME :: 8
WDK_NTDDI_VERSION :: 167772172

