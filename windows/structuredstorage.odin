package windows

BSTRBLOB :: struct {
	cbSize: u32,
	pData: ^u8,
}

CABOOL :: struct {
	cElems: u32,
	pElems: ^VARIANT_BOOL,
}

CABSTR :: struct {
	cElems: u32,
	pElems: ^BSTR,
}

CABSTRBLOB :: struct {
	cElems: u32,
	pElems: ^BSTRBLOB,
}

CAC :: struct {
	cElems: u32,
	pElems: PSTR,
}

CACLIPDATA :: struct {
	cElems: u32,
	pElems: ^CLIPDATA,
}

CACLSID :: struct {
	cElems: u32,
	pElems: ^GUID,
}

CACY :: struct {
	cElems: u32,
	pElems: ^CY,
}

CADATE :: struct {
	cElems: u32,
	pElems: ^f64,
}

CADBL :: struct {
	cElems: u32,
	pElems: ^f64,
}

CAFILETIME :: struct {
	cElems: u32,
	pElems: ^FILETIME,
}

CAFLT :: struct {
	cElems: u32,
	pElems: ^f32,
}

CAH :: struct {
	cElems: u32,
	pElems: ^i64,
}

CAI :: struct {
	cElems: u32,
	pElems: ^i16,
}

CAL :: struct {
	cElems: u32,
	pElems: ^i32,
}

CALPSTR :: struct {
	cElems: u32,
	pElems: ^PSTR,
}

CALPWSTR :: struct {
	cElems: u32,
	pElems: ^PWSTR,
}

CAPROPVARIANT :: struct {
	cElems: u32,
	pElems: ^PROPVARIANT,
}

CASCODE :: struct {
	cElems: u32,
	pElems: ^i32,
}

CAUB :: struct {
	cElems: u32,
	pElems: ^u8,
}

CAUH :: struct {
	cElems: u32,
	pElems: ^u64,
}

CAUI :: struct {
	cElems: u32,
	pElems: ^u16,
}

CAUL :: struct {
	cElems: u32,
	pElems: ^u32,
}

CLIPDATA :: struct {
	cbSize: u32,
	ulClipFmt: i32,
	pClipData: ^u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ienumstatstg ]]
IEnumSTATSTG :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumSTATSTG_Vtbl,
}
IEnumSTATSTG_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumSTATSTG, celt: u32, rgelt: [^]STATSTG, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumSTATSTG, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumSTATSTG) -> HRESULT,
	Clone: proc "system" (this: ^IEnumSTATSTG, ppenum: ^^IEnumSTATSTG) -> HRESULT,
}
IID_IEnumSTATSTG :: GUID{0x0000000D, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ipropertybag ]]
IPropertyBag :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPropertyBag_Vtbl,
}
IPropertyBag_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Read: proc "system" (this: ^IPropertyBag, pszPropName: PWSTR, pVar: ^VARIANT, pErrorLog: ^IErrorLog) -> HRESULT,
	Write: proc "system" (this: ^IPropertyBag, pszPropName: PWSTR, pVar: ^VARIANT) -> HRESULT,
}
IID_IPropertyBag :: GUID{0x55272A00, 0x42CB, 0x11CE, {0x81, 0x35, 0x00, 0xAA, 0x00, 0x4B, 0xB8, 0x51}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-istorage ]]
IStorage :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IStorage_Vtbl,
}
IStorage_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateStream: proc "system" (
		this: ^IStorage,
		pwcsName: PWSTR,
		grfMode: STGM,
		reserved1: u32,
		reserved2: u32,
		ppstm: ^^IStream,
	) -> HRESULT,
	OpenStream: proc "system" (
		this: ^IStorage,
		pwcsName: PWSTR,
		reserved1: rawptr,
		grfMode: STGM,
		reserved2: u32,
		ppstm: ^^IStream,
	) -> HRESULT,
	CreateStorage: proc "system" (
		this: ^IStorage,
		pwcsName: PWSTR,
		grfMode: STGM,
		reserved1: u32,
		reserved2: u32,
		ppstg: ^^IStorage,
	) -> HRESULT,
	OpenStorage: proc "system" (
		this: ^IStorage,
		pwcsName: PWSTR,
		pstgPriority: ^IStorage,
		grfMode: STGM,
		snbExclude: ^u16,
		reserved: u32,
		ppstg: ^^IStorage,
	) -> HRESULT,
	CopyTo: proc "system" (
		this: ^IStorage,
		ciidExclude: u32,
		rgiidExclude: [^]GUID,
		snbExclude: ^u16,
		pstgDest: ^IStorage,
	) -> HRESULT,
	MoveElementTo: proc "system" (
		this: ^IStorage,
		pwcsName: PWSTR,
		pstgDest: ^IStorage,
		pwcsNewName: PWSTR,
		grfFlags: STGMOVE,
	) -> HRESULT,
	Commit: proc "system" (this: ^IStorage, grfCommitFlags: u32) -> HRESULT,
	Revert: proc "system" (this: ^IStorage) -> HRESULT,
	EnumElements: proc "system" (
		this: ^IStorage,
		reserved1: u32,
		reserved2: rawptr,
		reserved3: u32,
		ppenum: ^^IEnumSTATSTG,
	) -> HRESULT,
	DestroyElement: proc "system" (this: ^IStorage, pwcsName: PWSTR) -> HRESULT,
	RenameElement: proc "system" (this: ^IStorage, pwcsOldName: PWSTR, pwcsNewName: PWSTR) -> HRESULT,
	SetElementTimes: proc "system" (
		this: ^IStorage,
		pwcsName: PWSTR,
		#by_ptr pctime: FILETIME,
		#by_ptr patime: FILETIME,
		#by_ptr pmtime: FILETIME,
	) -> HRESULT,
	SetClass: proc "system" (this: ^IStorage, #by_ptr clsid: GUID) -> HRESULT,
	SetStateBits: proc "system" (this: ^IStorage, grfStateBits: u32, grfMask: u32) -> HRESULT,
	Stat: proc "system" (this: ^IStorage, pstatstg: ^STATSTG, grfStatFlag: u32) -> HRESULT,
}
IID_IStorage :: GUID{0x0000000B, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propidlbase/ns-propidlbase-propvariant ]]
PROPVARIANT :: struct {
	using _: struct #raw_union {
		using _: struct {
			vt: VARENUM,
			wReserved1: u16,
			wReserved2: u16,
			wReserved3: u16,
			using _: struct #raw_union {
				cVal: CHAR,
				bVal: u8,
				iVal: i16,
				uiVal: u16,
				lVal: i32,
				ulVal: u32,
				intVal: i32,
				uintVal: u32,
				hVal: i64,
				uhVal: u64,
				fltVal: f32,
				dblVal: f64,
				boolVal: VARIANT_BOOL,
				__OBSOLETE__VARIANT_BOOL: VARIANT_BOOL,
				scode: i32,
				cyVal: CY,
				date: f64,
				filetime: FILETIME,
				puuid: ^GUID,
				pclipdata: ^CLIPDATA,
				bstrVal: BSTR,
				bstrblobVal: BSTRBLOB,
				blob: BLOB,
				pszVal: PSTR,
				pwszVal: PWSTR,
				punkVal: ^IUnknown,
				pdispVal: ^IDispatch,
				pStream: ^IStream,
				pStorage: ^IStorage,
				pVersionedStream: ^VERSIONEDSTREAM,
				parray: ^SAFEARRAY,
				cac: CAC,
				caub: CAUB,
				cai: CAI,
				caui: CAUI,
				cal: CAL,
				caul: CAUL,
				cah: CAH,
				cauh: CAUH,
				caflt: CAFLT,
				cadbl: CADBL,
				cabool: CABOOL,
				cascode: CASCODE,
				cacy: CACY,
				cadate: CADATE,
				cafiletime: CAFILETIME,
				cauuid: CACLSID,
				caclipdata: CACLIPDATA,
				cabstr: CABSTR,
				cabstrblob: CABSTRBLOB,
				calpstr: CALPSTR,
				calpwstr: CALPWSTR,
				capropvar: CAPROPVARIANT,
				pcVal: PSTR,
				pbVal: ^u8,
				piVal: ^i16,
				puiVal: ^u16,
				plVal: ^i32,
				pulVal: ^u32,
				pintVal: ^i32,
				puintVal: ^u32,
				pfltVal: ^f32,
				pdblVal: ^f64,
				pboolVal: ^VARIANT_BOOL,
				pdecVal: ^DECIMAL,
				pscode: ^i32,
				pcyVal: ^CY,
				pdate: ^f64,
				pbstrVal: ^BSTR,
				ppunkVal: ^^IUnknown,
				ppdispVal: ^^IDispatch,
				pparray: ^SAFEARRAY,
				pvarVal: ^PROPVARIANT,
			},
		},
		decVal: DECIMAL,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-stgmove ]]
STGMOVE :: enum i32 {
	MOVE = 0,
	COPY = 1,
	SHALLOWCOPY = 2,
}

VERSIONEDSTREAM :: struct {
	guidVersion: GUID,
	pStream: ^IStream,
}

