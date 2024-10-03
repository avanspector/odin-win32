package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-comdlg_filterspec ]]
COMDLG_FILTERSPEC :: struct {
	pszName: PWSTR,
	pszSpec: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ne-shtypes-device_scale_factor ]]
DEVICE_SCALE_FACTOR :: enum i32 {
	DEVICE_SCALE_FACTOR_INVALID = 0,
	SCALE_100_PERCENT = 100,
	SCALE_120_PERCENT = 120,
	SCALE_125_PERCENT = 125,
	SCALE_140_PERCENT = 140,
	SCALE_150_PERCENT = 150,
	SCALE_160_PERCENT = 160,
	SCALE_175_PERCENT = 175,
	SCALE_180_PERCENT = 180,
	SCALE_200_PERCENT = 200,
	SCALE_225_PERCENT = 225,
	SCALE_250_PERCENT = 250,
	SCALE_300_PERCENT = 300,
	SCALE_350_PERCENT = 350,
	SCALE_400_PERCENT = 400,
	SCALE_450_PERCENT = 450,
	SCALE_500_PERCENT = 500,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objectarray/nn-objectarray-iobjectarray ]]
IObjectArray :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectArray_Vtbl,
}
IObjectArray_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCount: proc "system" (this: ^IObjectArray, pcObjects: ^u32) -> HRESULT,
	GetAt: proc "system" (this: ^IObjectArray, uiIndex: u32, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
}
IID_IObjectArray :: GUID{0x92CA9DCD, 0x5622, 0x4BBA, {0xA8, 0x05, 0x5E, 0x9F, 0x54, 0x1B, 0xD8, 0xC9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objectarray/nn-objectarray-iobjectcollection ]]
IObjectCollection :: struct #raw_union {
	#subtype IObjectArray: IObjectArray,
	using Vtbl: ^IObjectCollection_Vtbl,
}
IObjectCollection_Vtbl :: struct {
	using IObjectArray_Vtbl: IObjectArray_Vtbl,
	AddObject: proc "system" (this: ^IObjectCollection, punk: ^IUnknown) -> HRESULT,
	AddFromArray: proc "system" (this: ^IObjectCollection, poaSource: ^IObjectArray) -> HRESULT,
	RemoveObjectAt: proc "system" (this: ^IObjectCollection, uiIndex: u32) -> HRESULT,
	Clear: proc "system" (this: ^IObjectCollection) -> HRESULT,
}
IID_IObjectCollection :: GUID{0x5632B1A4, 0xE38A, 0x400A, {0x92, 0x8A, 0xD4, 0xCD, 0x63, 0x23, 0x02, 0x95}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-itemidlist ]]
ITEMIDLIST :: struct #packed {
	mkid: SHITEMID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ne-shtypes-perceived ]]
PERCEIVED :: enum i32 {
	FIRST = -3,
	CUSTOM = -3,
	UNSPECIFIED = -2,
	FOLDER = -1,
	UNKNOWN = 0,
	TEXT = 1,
	IMAGE = 2,
	AUDIO = 3,
	VIDEO = 4,
	COMPRESSED = 5,
	DOCUMENT = 6,
	SYSTEM = 7,
	APPLICATION = 8,
	GAMEMEDIA = 9,
	CONTACTS = 10,
	LAST = 10,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ne-shtypes-shcolstate ]]
SHCOLSTATE :: enum i32 {
	DEFAULT = 0,
	TYPE_STR = 1,
	TYPE_INT = 2,
	TYPE_DATE = 3,
	TYPEMASK = 15,
	ONBYDEFAULT = 16,
	SLOW = 32,
	EXTENDED = 64,
	SECONDARYUI = 128,
	HIDDEN = 256,
	PREFER_VARCMP = 512,
	PREFER_FMTCMP = 1024,
	NOSORTBYFOLDERNESS = 2048,
	VIEWONLY = 65536,
	BATCHREAD = 131072,
	NO_GROUPBY = 262144,
	FIXED_WIDTH = 4096,
	NODPISCALE = 8192,
	FIXED_RATIO = 16384,
	DISPLAYMASK = 61440,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-shelldetails ]]
SHELLDETAILS :: struct #packed {
	fmt: i32,
	cxChar: i32,
	str: STRRET,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-shitemid ]]
SHITEMID :: struct #packed {
	cb: u16,
	abID: [1]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-strret ]]
STRRET :: struct {
	uType: u32,
	using _: struct #raw_union {
		pOleStr: PWSTR,
		uOffset: u32,
		cStr: [260]u8,
	},
}

STRRET_TYPE :: enum i32 {
	WSTR = 0,
	OFFSET = 1,
	CSTR = 2,
}

PERCEIVEDFLAG_GDIPLUS :: 16
PERCEIVEDFLAG_HARDCODED :: 2
PERCEIVEDFLAG_NATIVESUPPORT :: 4
PERCEIVEDFLAG_SOFTCODED :: 1
PERCEIVEDFLAG_UNDEFINED :: 0
PERCEIVEDFLAG_WMSDK :: 32
PERCEIVEDFLAG_ZIPFOLDER :: 64

