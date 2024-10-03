package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-arraydesc ]]
ARRAYDESC :: struct {
	tdescElem: TYPEDESC,
	cDims: u16,
	rgbounds: [1]SAFEARRAYBOUND,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ifontdisp ]]
IFontDisp :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IFontDisp_Vtbl,
}
IFontDisp_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_IFontDisp :: GUID{0xBEF6E003, 0xA874, 0x101A, {0x8B, 0xBA, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-irecordinfo ]]
IRecordInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRecordInfo_Vtbl,
}
IRecordInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RecordInit: proc "system" (this: ^IRecordInfo, pvNew: rawptr) -> HRESULT,
	RecordClear: proc "system" (this: ^IRecordInfo, pvExisting: rawptr) -> HRESULT,
	RecordCopy: proc "system" (this: ^IRecordInfo, pvExisting: rawptr, pvNew: rawptr) -> HRESULT,
	GetGuid: proc "system" (this: ^IRecordInfo, pguid: ^GUID) -> HRESULT,
	GetName: proc "system" (this: ^IRecordInfo, pbstrName: ^BSTR) -> HRESULT,
	GetSize: proc "system" (this: ^IRecordInfo, pcbSize: ^u32) -> HRESULT,
	GetTypeInfo: proc "system" (this: ^IRecordInfo, ppTypeInfo: ^^ITypeInfo) -> HRESULT,
	GetField: proc "system" (this: ^IRecordInfo, pvData: rawptr, szFieldName: PWSTR, pvarField: ^VARIANT) -> HRESULT,
	GetFieldNoCopy: proc "system" (
		this: ^IRecordInfo,
		pvData: rawptr,
		szFieldName: PWSTR,
		pvarField: ^VARIANT,
		ppvDataCArray: rawptr,
	) -> HRESULT,
	PutField: proc "system" (
		this: ^IRecordInfo,
		wFlags: u32,
		pvData: rawptr,
		szFieldName: PWSTR,
		pvarField: ^VARIANT,
	) -> HRESULT,
	PutFieldNoCopy: proc "system" (
		this: ^IRecordInfo,
		wFlags: u32,
		pvData: rawptr,
		szFieldName: PWSTR,
		pvarField: ^VARIANT,
	) -> HRESULT,
	GetFieldNames: proc "system" (this: ^IRecordInfo, pcNames: ^u32, rgBstrNames: [^]BSTR) -> HRESULT,
	IsMatchingType: proc "system" (this: ^IRecordInfo, pRecordInfo: ^IRecordInfo) -> BOOL,
	RecordCreate: proc "system" (this: ^IRecordInfo) -> rawptr,
	RecordCreateCopy: proc "system" (this: ^IRecordInfo, pvSource: rawptr, ppvDest: rawptr) -> HRESULT,
	RecordDestroy: proc "system" (this: ^IRecordInfo, pvRecord: rawptr) -> HRESULT,
}
IID_IRecordInfo :: GUID{0x0000002F, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-paramdesc ]]
PARAMDESC :: struct {
	pparamdescex: ^PARAMDESCEX,
	wParamFlags: PARAMFLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-paramdescex ]]
PARAMDESCEX :: struct {
	cBytes: u32,
	varDefaultValue: VARIANT,
}

PARAMFLAGS :: distinct bit_set[enum {
	FIN = 0,
	FOUT = 1,
	FLCID = 2,
	FRETVAL = 3,
	FOPT = 4,
	FHASDEFAULT = 5,
	FHASCUSTDATA = 6,
}; u16]
PARAMFLAGS_NONE :: transmute(PARAMFLAGS)u16(0x0000)

