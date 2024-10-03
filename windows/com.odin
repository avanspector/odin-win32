package windows

ADVANCED_FEATURE_FLAGS :: distinct bit_set[enum {
	AUTO = 0,
	STATIC = 1,
	EMBEDDED = 2,
	FIXEDSIZE = 4,
	RECORD = 5,
	HAVEIID = 6,
	HAVEVARTYPE = 7,
	BSTR = 8,
	UNKNOWN = 9,
	DISPATCH = 10,
	VARIANT = 11,
}; u16]
ADVANCED_FEATURE_FLAGS_RESERVED :: transmute(ADVANCED_FEATURE_FLAGS)u16(0xF008)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-bind_opts ]]
BIND_OPTS :: struct {
	cbStruct: u32,
	grfFlags: u32,
	grfMode: u32,
	dwTickCountDeadline: u32,
}

BINDINFO :: struct {
	cbSize: u32,
	szExtraInfo: PWSTR,
	stgmedData: STGMEDIUM,
	grfBindInfoF: u32,
	dwBindVerb: u32,
	szCustomVerb: PWSTR,
	cbstgmedData: u32,
	dwOptions: u32,
	dwOptionsFlags: u32,
	dwCodePage: u32,
	securityAttributes: SECURITY_ATTRIBUTES,
	iid: GUID,
	pUnk: ^IUnknown,
	dwReserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-bindptr ]]
BINDPTR :: struct #raw_union {
	lpfuncdesc: ^FUNCDESC,
	lpvardesc: ^VARDESC,
	lptcomp: ^ITypeComp,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/nspapi/ns-nspapi-blob ]]
BLOB :: struct {
	cbSize: u32,
	pBlobData: ^u8,
}

BYTE_BLOB :: struct {
	clSize: u32,
	abData: [1]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-callconv ]]
CALLCONV :: enum i32 {
	FASTCALL = 0,
	CDECL = 1,
	MSCPASCAL = 2,
	PASCAL = 2,
	MACPASCAL = 3,
	STDCALL = 4,
	FPFASTCALL = 5,
	SYSCALL = 6,
	MPWCDECL = 7,
	MPWPASCAL = 8,
	MAX = 9,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ocidl/ns-ocidl-connectdata ]]
CONNECTDATA :: struct {
	pUnk: ^IUnknown,
	dwCookie: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-cy~r1 ]]
CY :: struct #raw_union {
	using _: struct {
		Lo: u32,
		Hi: i32,
	},
	int64: i64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-desckind ]]
DESCKIND :: enum i32 {
	NONE = 0,
	FUNCDESC = 1,
	VARDESC = 2,
	TYPECOMP = 3,
	IMPLICITAPPOBJ = 4,
	MAX = 5,
}

DISPATCH_FLAGS :: distinct bit_set[enum {
	METHOD = 0,
	PROPERTYGET = 1,
	PROPERTYPUT = 2,
	PROPERTYPUTREF = 3,
}; u16]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-dispparams ]]
DISPPARAMS :: struct {
	rgvarg: ^VARIANT,
	rgdispidNamedArgs: ^i32,
	cArgs: u32,
	cNamedArgs: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-dvaspect ]]
DVASPECT :: enum u32 {
	CONTENT = 0x00000001,
	THUMBNAIL = 0x00000002,
	ICON = 0x00000004,
	DOCPRINT = 0x00000008,
	OPAQUE = 0x00000010,
	TRANSPARENT = 0x00000020,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-dvtargetdevice ]]
DVTARGETDEVICE :: struct {
	tdSize: u32,
	tdDriverNameOffset: u16,
	tdDeviceNameOffset: u16,
	tdPortNameOffset: u16,
	tdExtDevmodeOffset: u16,
	tdData: [1]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-elemdesc~r1 ]]
ELEMDESC :: struct {
	tdesc: TYPEDESC,
	using _: struct #raw_union {
		idldesc: IDLDESC,
		paramdesc: PARAMDESC,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-excepinfo ]]
EXCEPINFO :: struct {
	wCode: u16,
	wReserved: u16,
	bstrSource: BSTR,
	bstrDescription: BSTR,
	bstrHelpFile: BSTR,
	dwHelpContext: u32,
	pvReserved: rawptr,
	pfnDeferredFillIn: LPEXCEPFINO_DEFERRED_FILLIN,
	scode: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-formatetc ]]
FORMATETC :: struct {
	cfFormat: u16,
	ptd: ^DVTARGETDEVICE,
	dwAspect: u32,
	lindex: i32,
	tymed: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-funcdesc ]]
FUNCDESC :: struct {
	memid: i32,
	lprgscode: ^i32,
	lprgelemdescParam: ^ELEMDESC,
	funckind: FUNCKIND,
	invkind: INVOKEKIND,
	callconv: CALLCONV,
	cParams: i16,
	cParamsOpt: i16,
	oVft: i16,
	cScodes: i16,
	elemdescFunc: ELEMDESC,
	wFuncFlags: FUNCFLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-funcflags ]]
FUNCFLAGS :: enum u16 {
	FRESTRICTED = 0x0001,
	FSOURCE = 0x0002,
	FBINDABLE = 0x0004,
	FREQUESTEDIT = 0x0008,
	FDISPLAYBIND = 0x0010,
	FDEFAULTBIND = 0x0020,
	FHIDDEN = 0x0040,
	FUSESGETLASTERROR = 0x0080,
	FDEFAULTCOLLELEM = 0x0100,
	FUIDEFAULT = 0x0200,
	FNONBROWSABLE = 0x0400,
	FREPLACEABLE = 0x0800,
	FIMMEDIATEBIND = 0x1000,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-funckind ]]
FUNCKIND :: enum i32 {
	VIRTUAL = 0,
	PUREVIRTUAL = 1,
	NONVIRTUAL = 2,
	STATIC = 3,
	DISPATCH = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-iadvisesink ]]
IAdviseSink :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAdviseSink_Vtbl,
}
IAdviseSink_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnDataChange: proc "system" (this: ^IAdviseSink, pFormatetc: ^FORMATETC, pStgmed: ^STGMEDIUM),
	OnViewChange: proc "system" (this: ^IAdviseSink, dwAspect: u32, lindex: i32),
	OnRename: proc "system" (this: ^IAdviseSink, pmk: ^IMoniker),
	OnSave: proc "system" (this: ^IAdviseSink),
	OnClose: proc "system" (this: ^IAdviseSink),
}
IID_IAdviseSink :: GUID{0x0000010F, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ibindctx ]]
IBindCtx :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBindCtx_Vtbl,
}
IBindCtx_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RegisterObjectBound: proc "system" (this: ^IBindCtx, punk: ^IUnknown) -> HRESULT,
	RevokeObjectBound: proc "system" (this: ^IBindCtx, punk: ^IUnknown) -> HRESULT,
	ReleaseBoundObjects: proc "system" (this: ^IBindCtx) -> HRESULT,
	SetBindOptions: proc "system" (this: ^IBindCtx, pbindopts: ^BIND_OPTS) -> HRESULT,
	GetBindOptions: proc "system" (this: ^IBindCtx, pbindopts: ^BIND_OPTS) -> HRESULT,
	GetRunningObjectTable: proc "system" (this: ^IBindCtx, pprot: ^^IRunningObjectTable) -> HRESULT,
	RegisterObjectParam: proc "system" (this: ^IBindCtx, pszKey: PWSTR, punk: ^IUnknown) -> HRESULT,
	GetObjectParam: proc "system" (this: ^IBindCtx, pszKey: PWSTR, ppunk: ^^IUnknown) -> HRESULT,
	EnumObjectParam: proc "system" (this: ^IBindCtx, ppenum: ^^IEnumString) -> HRESULT,
	RevokeObjectParam: proc "system" (this: ^IBindCtx, pszKey: PWSTR) -> HRESULT,
}
IID_IBindCtx :: GUID{0x0000000E, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

IBinding :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBinding_Vtbl,
}
IBinding_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Abort: proc "system" (this: ^IBinding) -> HRESULT,
	Suspend: proc "system" (this: ^IBinding) -> HRESULT,
	Resume: proc "system" (this: ^IBinding) -> HRESULT,
	SetPriority: proc "system" (this: ^IBinding, nPriority: i32) -> HRESULT,
	GetPriority: proc "system" (this: ^IBinding, pnPriority: ^i32) -> HRESULT,
	GetBindResult: proc "system" (
		this: ^IBinding,
		pclsidProtocol: ^GUID,
		pdwResult: ^u32,
		pszResult: ^PWSTR,
		pdwReserved: ^u32,
	) -> HRESULT,
}
IID_IBinding :: GUID{0x79EAC9C0, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

IBindStatusCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBindStatusCallback_Vtbl,
}
IBindStatusCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnStartBinding: proc "system" (this: ^IBindStatusCallback, dwReserved: u32, pib: ^IBinding) -> HRESULT,
	GetPriority: proc "system" (this: ^IBindStatusCallback, pnPriority: ^i32) -> HRESULT,
	OnLowResource: proc "system" (this: ^IBindStatusCallback, reserved: u32) -> HRESULT,
	OnProgress: proc "system" (
		this: ^IBindStatusCallback,
		ulProgress: u32,
		ulProgressMax: u32,
		ulStatusCode: u32,
		szStatusText: PWSTR,
	) -> HRESULT,
	OnStopBinding: proc "system" (this: ^IBindStatusCallback, hresult: HRESULT, szError: PWSTR) -> HRESULT,
	GetBindInfo: proc "system" (this: ^IBindStatusCallback, grfBINDF: ^u32, pbindinfo: ^BINDINFO) -> HRESULT,
	OnDataAvailable: proc "system" (
		this: ^IBindStatusCallback,
		grfBSCF: u32,
		dwSize: u32,
		pformatetc: ^FORMATETC,
		pstgmed: ^STGMEDIUM,
	) -> HRESULT,
	OnObjectAvailable: proc "system" (this: ^IBindStatusCallback, #by_ptr riid: GUID, punk: ^IUnknown) -> HRESULT,
}
IID_IBindStatusCallback :: GUID{0x79EAC9C1, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpoint ]]
IConnectionPoint :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IConnectionPoint_Vtbl,
}
IConnectionPoint_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetConnectionInterface: proc "system" (this: ^IConnectionPoint, pIID: ^GUID) -> HRESULT,
	GetConnectionPointContainer: proc "system" (this: ^IConnectionPoint, ppCPC: ^^IConnectionPointContainer) -> HRESULT,
	Advise: proc "system" (this: ^IConnectionPoint, pUnkSink: ^IUnknown, pdwCookie: ^u32) -> HRESULT,
	Unadvise: proc "system" (this: ^IConnectionPoint, dwCookie: u32) -> HRESULT,
	EnumConnections: proc "system" (this: ^IConnectionPoint, ppEnum: ^^IEnumConnections) -> HRESULT,
}
IID_IConnectionPoint :: GUID{0xB196B286, 0xBAB4, 0x101A, {0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-iconnectionpointcontainer ]]
IConnectionPointContainer :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IConnectionPointContainer_Vtbl,
}
IConnectionPointContainer_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnumConnectionPoints: proc "system" (this: ^IConnectionPointContainer, ppEnum: ^^IEnumConnectionPoints) -> HRESULT,
	FindConnectionPoint: proc "system" (
		this: ^IConnectionPointContainer,
		#by_ptr riid: GUID,
		ppCP: ^^IConnectionPoint,
	) -> HRESULT,
}
IID_IConnectionPointContainer :: GUID{0xB196B284, 0xBAB4, 0x101A, {0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-idataobject ]]
IDataObject :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDataObject_Vtbl,
}
IDataObject_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetData: proc "system" (this: ^IDataObject, pformatetcIn: ^FORMATETC, pmedium: ^STGMEDIUM) -> HRESULT,
	GetDataHere: proc "system" (this: ^IDataObject, pformatetc: ^FORMATETC, pmedium: ^STGMEDIUM) -> HRESULT,
	QueryGetData: proc "system" (this: ^IDataObject, pformatetc: ^FORMATETC) -> HRESULT,
	GetCanonicalFormatEtc: proc "system" (this: ^IDataObject, pformatectIn: ^FORMATETC, pformatetcOut: ^FORMATETC) -> HRESULT,
	SetData: proc "system" (
		this: ^IDataObject,
		pformatetc: ^FORMATETC,
		pmedium: ^STGMEDIUM,
		fRelease: BOOL,
	) -> HRESULT,
	EnumFormatEtc: proc "system" (this: ^IDataObject, dwDirection: u32, ppenumFormatEtc: ^^IEnumFORMATETC) -> HRESULT,
	DAdvise: proc "system" (
		this: ^IDataObject,
		pformatetc: ^FORMATETC,
		advf: u32,
		pAdvSink: ^IAdviseSink,
		pdwConnection: ^u32,
	) -> HRESULT,
	DUnadvise: proc "system" (this: ^IDataObject, dwConnection: u32) -> HRESULT,
	EnumDAdvise: proc "system" (this: ^IDataObject, ppenumAdvise: ^^IEnumSTATDATA) -> HRESULT,
}
IID_IDataObject :: GUID{0x0000010E, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-idispatch ]]
IDispatch :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDispatch_Vtbl,
}
IDispatch_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetTypeInfoCount: proc "system" (this: ^IDispatch, pctinfo: ^u32) -> HRESULT,
	GetTypeInfo: proc "system" (this: ^IDispatch, iTInfo: u32, lcid: u32, ppTInfo: ^^ITypeInfo) -> HRESULT,
	GetIDsOfNames: proc "system" (
		this: ^IDispatch,
		#by_ptr riid: GUID,
		rgszNames: [^]PWSTR,
		cNames: u32,
		lcid: u32,
		rgDispId: [^]i32,
	) -> HRESULT,
	Invoke: proc "system" (
		this: ^IDispatch,
		dispIdMember: i32,
		#by_ptr riid: GUID,
		lcid: u32,
		wFlags: DISPATCH_FLAGS,
		pDispParams: ^DISPPARAMS,
		pVarResult: ^VARIANT,
		pExcepInfo: ^EXCEPINFO,
		puArgErr: ^u32,
	) -> HRESULT,
}
IID_IDispatch :: GUID{0x00020400, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

IDLDESC :: struct {
	dwReserved: uintptr,
	wIDLFlags: IDLFLAGS,
}

IDLFLAGS :: distinct bit_set[enum {
	FIN = 0,
	FOUT = 1,
	FLCID = 2,
	FRETVAL = 3,
}; u16]
IDLFLAGS_NONE :: transmute(IDLFLAGS)u16(0x0000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ienumconnectionpoints ]]
IEnumConnectionPoints :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumConnectionPoints_Vtbl,
}
IEnumConnectionPoints_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumConnectionPoints,
		cConnections: u32,
		ppCP: [^]^IConnectionPoint,
		pcFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumConnectionPoints, cConnections: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumConnectionPoints) -> HRESULT,
	Clone: proc "system" (this: ^IEnumConnectionPoints, ppEnum: ^^IEnumConnectionPoints) -> HRESULT,
}
IID_IEnumConnectionPoints :: GUID{0xB196B285, 0xBAB4, 0x101A, {0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ienumconnections ]]
IEnumConnections :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumConnections_Vtbl,
}
IEnumConnections_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumConnections,
		cConnections: u32,
		rgcd: [^]CONNECTDATA,
		pcFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumConnections, cConnections: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumConnections) -> HRESULT,
	Clone: proc "system" (this: ^IEnumConnections, ppEnum: ^^IEnumConnections) -> HRESULT,
}
IID_IEnumConnections :: GUID{0xB196B287, 0xBAB4, 0x101A, {0xB6, 0x9C, 0x00, 0xAA, 0x00, 0x34, 0x1D, 0x07}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ienumformatetc ]]
IEnumFORMATETC :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumFORMATETC_Vtbl,
}
IEnumFORMATETC_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumFORMATETC, celt: u32, rgelt: [^]FORMATETC, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumFORMATETC, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumFORMATETC) -> HRESULT,
	Clone: proc "system" (this: ^IEnumFORMATETC, ppenum: ^^IEnumFORMATETC) -> HRESULT,
}
IID_IEnumFORMATETC :: GUID{0x00000103, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/comcat/nn-comcat-ienumguid ]]
IEnumGUID :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumGUID_Vtbl,
}
IEnumGUID_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumGUID, celt: u32, rgelt: [^]GUID, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumGUID, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumGUID) -> HRESULT,
	Clone: proc "system" (this: ^IEnumGUID, ppenum: ^^IEnumGUID) -> HRESULT,
}
IID_IEnumGUID :: GUID{0x0002E000, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ienummoniker ]]
IEnumMoniker :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumMoniker_Vtbl,
}
IEnumMoniker_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumMoniker, celt: u32, rgelt: [^]^IMoniker, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumMoniker, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumMoniker) -> HRESULT,
	Clone: proc "system" (this: ^IEnumMoniker, ppenum: ^^IEnumMoniker) -> HRESULT,
}
IID_IEnumMoniker :: GUID{0x00000102, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ienumstatdata ]]
IEnumSTATDATA :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumSTATDATA_Vtbl,
}
IEnumSTATDATA_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumSTATDATA, celt: u32, rgelt: [^]STATDATA, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumSTATDATA, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumSTATDATA) -> HRESULT,
	Clone: proc "system" (this: ^IEnumSTATDATA, ppenum: ^^IEnumSTATDATA) -> HRESULT,
}
IID_IEnumSTATDATA :: GUID{0x00000105, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-ienumstring ]]
IEnumString :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumString_Vtbl,
}
IEnumString_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumString, celt: u32, rgelt: [^]PWSTR, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumString, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumString) -> HRESULT,
	Clone: proc "system" (this: ^IEnumString, ppenum: ^^IEnumString) -> HRESULT,
}
IID_IEnumString :: GUID{0x00000101, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-ienumunknown ]]
IEnumUnknown :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumUnknown_Vtbl,
}
IEnumUnknown_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumUnknown, celt: u32, rgelt: [^]^IUnknown, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumUnknown, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumUnknown) -> HRESULT,
	Clone: proc "system" (this: ^IEnumUnknown, ppenum: ^^IEnumUnknown) -> HRESULT,
}
IID_IEnumUnknown :: GUID{0x00000100, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-ierrorlog ]]
IErrorLog :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IErrorLog_Vtbl,
}
IErrorLog_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AddError: proc "system" (this: ^IErrorLog, pszPropName: PWSTR, pExcepInfo: ^EXCEPINFO) -> HRESULT,
}
IID_IErrorLog :: GUID{0x3127CA40, 0x446E, 0x11CE, {0x81, 0x35, 0x00, 0xAA, 0x00, 0x4B, 0xB8, 0x51}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidlbase/nn-objidlbase-imalloc ]]
IMalloc :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMalloc_Vtbl,
}
IMalloc_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Alloc: proc "system" (this: ^IMalloc, cb: uintptr) -> rawptr,
	Realloc: proc "system" (this: ^IMalloc, pv: rawptr, cb: uintptr) -> rawptr,
	Free: proc "system" (this: ^IMalloc, pv: rawptr),
	GetSize: proc "system" (this: ^IMalloc, pv: rawptr) -> uintptr,
	DidAlloc: proc "system" (this: ^IMalloc, pv: rawptr) -> i32,
	HeapMinimize: proc "system" (this: ^IMalloc),
}
IID_IMalloc :: GUID{0x00000002, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-imoniker ]]
IMoniker :: struct #raw_union {
	#subtype IPersistStream: IPersistStream,
	using Vtbl: ^IMoniker_Vtbl,
}
IMoniker_Vtbl :: struct {
	using IPersistStream_Vtbl: IPersistStream_Vtbl,
	BindToObject: proc "system" (
		this: ^IMoniker,
		pbc: ^IBindCtx,
		pmkToLeft: ^IMoniker,
		#by_ptr riidResult: GUID,
		ppvResult: rawptr,
	) -> HRESULT,
	BindToStorage: proc "system" (
		this: ^IMoniker,
		pbc: ^IBindCtx,
		pmkToLeft: ^IMoniker,
		#by_ptr riid: GUID,
		ppvObj: rawptr,
	) -> HRESULT,
	Reduce: proc "system" (
		this: ^IMoniker,
		pbc: ^IBindCtx,
		dwReduceHowFar: u32,
		ppmkToLeft: ^^IMoniker,
		ppmkReduced: ^^IMoniker,
	) -> HRESULT,
	ComposeWith: proc "system" (
		this: ^IMoniker,
		pmkRight: ^IMoniker,
		fOnlyIfNotGeneric: BOOL,
		ppmkComposite: ^^IMoniker,
	) -> HRESULT,
	Enum: proc "system" (this: ^IMoniker, fForward: BOOL, ppenumMoniker: ^^IEnumMoniker) -> HRESULT,
	IsEqual: proc "system" (this: ^IMoniker, pmkOtherMoniker: ^IMoniker) -> HRESULT,
	Hash: proc "system" (this: ^IMoniker, pdwHash: ^u32) -> HRESULT,
	IsRunning: proc "system" (
		this: ^IMoniker,
		pbc: ^IBindCtx,
		pmkToLeft: ^IMoniker,
		pmkNewlyRunning: ^IMoniker,
	) -> HRESULT,
	GetTimeOfLastChange: proc "system" (this: ^IMoniker, pbc: ^IBindCtx, pmkToLeft: ^IMoniker, pFileTime: ^FILETIME) -> HRESULT,
	Inverse: proc "system" (this: ^IMoniker, ppmk: ^^IMoniker) -> HRESULT,
	CommonPrefixWith: proc "system" (this: ^IMoniker, pmkOther: ^IMoniker, ppmkPrefix: ^^IMoniker) -> HRESULT,
	RelativePathTo: proc "system" (this: ^IMoniker, pmkOther: ^IMoniker, ppmkRelPath: ^^IMoniker) -> HRESULT,
	GetDisplayName: proc "system" (this: ^IMoniker, pbc: ^IBindCtx, pmkToLeft: ^IMoniker, ppszDisplayName: ^PWSTR) -> HRESULT,
	ParseDisplayName: proc "system" (
		this: ^IMoniker,
		pbc: ^IBindCtx,
		pmkToLeft: ^IMoniker,
		pszDisplayName: PWSTR,
		pchEaten: ^u32,
		ppmkOut: ^^IMoniker,
	) -> HRESULT,
	IsSystemMoniker: proc "system" (this: ^IMoniker, pdwMksys: ^u32) -> HRESULT,
}
IID_IMoniker :: GUID{0x0000000F, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

IMPLTYPEFLAGS :: distinct bit_set[enum {
	FDEFAULT = 0,
	FSOURCE = 1,
	FRESTRICTED = 2,
	FDEFAULTVTABLE = 3,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-invokekind ]]
INVOKEKIND :: enum i32 {
	FUNC = 1,
	PROPERTYGET = 2,
	PROPERTYPUT = 4,
	PROPERTYPUTREF = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ipersist ]]
IPersist :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPersist_Vtbl,
}
IPersist_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetClassID: proc "system" (this: ^IPersist, pClassID: ^GUID) -> HRESULT,
}
IID_IPersist :: GUID{0x0000010C, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-ipersiststream ]]
IPersistStream :: struct #raw_union {
	#subtype IPersist: IPersist,
	using Vtbl: ^IPersistStream_Vtbl,
}
IPersistStream_Vtbl :: struct {
	using IPersist_Vtbl: IPersist_Vtbl,
	IsDirty: proc "system" (this: ^IPersistStream) -> HRESULT,
	Load: proc "system" (this: ^IPersistStream, pStm: ^IStream) -> HRESULT,
	Save: proc "system" (this: ^IPersistStream, pStm: ^IStream, fClearDirty: BOOL) -> HRESULT,
	GetSizeMax: proc "system" (this: ^IPersistStream, pcbSize: ^u64) -> HRESULT,
}
IID_IPersistStream :: GUID{0x00000109, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-irunningobjecttable ]]
IRunningObjectTable :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRunningObjectTable_Vtbl,
}
IRunningObjectTable_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Register: proc "system" (
		this: ^IRunningObjectTable,
		grfFlags: ROT_FLAGS,
		punkObject: ^IUnknown,
		pmkObjectName: ^IMoniker,
		pdwRegister: ^u32,
	) -> HRESULT,
	Revoke: proc "system" (this: ^IRunningObjectTable, dwRegister: u32) -> HRESULT,
	IsRunning: proc "system" (this: ^IRunningObjectTable, pmkObjectName: ^IMoniker) -> HRESULT,
	GetObject: proc "system" (
		this: ^IRunningObjectTable,
		pmkObjectName: ^IMoniker,
		ppunkObject: ^^IUnknown,
	) -> HRESULT,
	NoteChangeTime: proc "system" (this: ^IRunningObjectTable, dwRegister: u32, pfiletime: ^FILETIME) -> HRESULT,
	GetTimeOfLastChange: proc "system" (this: ^IRunningObjectTable, pmkObjectName: ^IMoniker, pfiletime: ^FILETIME) -> HRESULT,
	EnumRunning: proc "system" (this: ^IRunningObjectTable, ppenumMoniker: ^^IEnumMoniker) -> HRESULT,
}
IID_IRunningObjectTable :: GUID{0x00000010, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-isequentialstream ]]
ISequentialStream :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISequentialStream_Vtbl,
}
ISequentialStream_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Read: proc "system" (this: ^ISequentialStream, pv: rawptr, cb: u32, pcbRead: ^u32) -> HRESULT,
	Write: proc "system" (this: ^ISequentialStream, pv: rawptr, cb: u32, pcbWritten: ^u32) -> HRESULT,
}
IID_ISequentialStream :: GUID{0x0C733A30, 0x2A1C, 0x11CE, {0xAD, 0xE5, 0x00, 0xAA, 0x00, 0x44, 0x77, 0x3D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/servprov/nn-servprov-iserviceprovider ]]
IServiceProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IServiceProvider_Vtbl,
}
IServiceProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryService: proc "system" (
		this: ^IServiceProvider,
		#by_ptr guidService: GUID,
		#by_ptr riid: GUID,
		ppvObject: rawptr,
	) -> HRESULT,
}
IID_IServiceProvider :: GUID{0x6D5140C1, 0x7436, 0x11CE, {0x80, 0x34, 0x00, 0xAA, 0x00, 0x60, 0x09, 0xFA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-istream ]]
IStream :: struct #raw_union {
	#subtype ISequentialStream: ISequentialStream,
	using Vtbl: ^IStream_Vtbl,
}
IStream_Vtbl :: struct {
	using ISequentialStream_Vtbl: ISequentialStream_Vtbl,
	Seek: proc "system" (this: ^IStream, dlibMove: i64, dwOrigin: STREAM_SEEK, plibNewPosition: ^u64) -> HRESULT,
	SetSize: proc "system" (this: ^IStream, libNewSize: u64) -> HRESULT,
	CopyTo: proc "system" (this: ^IStream, pstm: ^IStream, cb: u64, pcbRead: ^u64, pcbWritten: ^u64) -> HRESULT,
	Commit: proc "system" (this: ^IStream, grfCommitFlags: STGC) -> HRESULT,
	Revert: proc "system" (this: ^IStream) -> HRESULT,
	LockRegion: proc "system" (this: ^IStream, libOffset: u64, cb: u64, dwLockType: LOCKTYPE) -> HRESULT,
	UnlockRegion: proc "system" (this: ^IStream, libOffset: u64, cb: u64, dwLockType: u32) -> HRESULT,
	Stat: proc "system" (this: ^IStream, pstatstg: ^STATSTG, grfStatFlag: STATFLAG) -> HRESULT,
	Clone: proc "system" (this: ^IStream, ppstm: ^^IStream) -> HRESULT,
}
IID_IStream :: GUID{0x0000000C, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-itypecomp ]]
ITypeComp :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITypeComp_Vtbl,
}
ITypeComp_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Bind: proc "system" (
		this: ^ITypeComp,
		szName: PWSTR,
		lHashVal: u32,
		wFlags: u16,
		ppTInfo: ^^ITypeInfo,
		pDescKind: ^DESCKIND,
		pBindPtr: ^BINDPTR,
	) -> HRESULT,
	BindType: proc "system" (
		this: ^ITypeComp,
		szName: PWSTR,
		lHashVal: u32,
		ppTInfo: ^^ITypeInfo,
		ppTComp: ^^ITypeComp,
	) -> HRESULT,
}
IID_ITypeComp :: GUID{0x00020403, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-itypeinfo ]]
ITypeInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITypeInfo_Vtbl,
}
ITypeInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetTypeAttr: proc "system" (this: ^ITypeInfo, ppTypeAttr: ^TYPEATTR) -> HRESULT,
	GetTypeComp: proc "system" (this: ^ITypeInfo, ppTComp: ^^ITypeComp) -> HRESULT,
	GetFuncDesc: proc "system" (this: ^ITypeInfo, index: u32, ppFuncDesc: ^FUNCDESC) -> HRESULT,
	GetVarDesc: proc "system" (this: ^ITypeInfo, index: u32, ppVarDesc: ^VARDESC) -> HRESULT,
	GetNames: proc "system" (this: ^ITypeInfo, memid: i32, rgBstrNames: [^]BSTR, cMaxNames: u32, pcNames: ^u32) -> HRESULT,
	GetRefTypeOfImplType: proc "system" (this: ^ITypeInfo, index: u32, pRefType: ^u32) -> HRESULT,
	GetImplTypeFlags: proc "system" (this: ^ITypeInfo, index: u32, pImplTypeFlags: ^IMPLTYPEFLAGS) -> HRESULT,
	GetIDsOfNames: proc "system" (this: ^ITypeInfo, rgszNames: [^]PWSTR, cNames: u32, pMemId: [^]i32) -> HRESULT,
	Invoke: proc "system" (
		this: ^ITypeInfo,
		pvInstance: rawptr,
		memid: i32,
		wFlags: DISPATCH_FLAGS,
		pDispParams: ^DISPPARAMS,
		pVarResult: ^VARIANT,
		pExcepInfo: ^EXCEPINFO,
		puArgErr: ^u32,
	) -> HRESULT,
	GetDocumentation: proc "system" (
		this: ^ITypeInfo,
		memid: i32,
		pBstrName: ^BSTR,
		pBstrDocString: ^BSTR,
		pdwHelpContext: ^u32,
		pBstrHelpFile: ^BSTR,
	) -> HRESULT,
	GetDllEntry: proc "system" (
		this: ^ITypeInfo,
		memid: i32,
		invKind: INVOKEKIND,
		pBstrDllName: ^BSTR,
		pBstrName: ^BSTR,
		pwOrdinal: ^u16,
	) -> HRESULT,
	GetRefTypeInfo: proc "system" (this: ^ITypeInfo, hRefType: u32, ppTInfo: ^^ITypeInfo) -> HRESULT,
	AddressOfMember: proc "system" (this: ^ITypeInfo, memid: i32, invKind: INVOKEKIND, ppv: rawptr) -> HRESULT,
	CreateInstance: proc "system" (this: ^ITypeInfo, pUnkOuter: ^IUnknown, #by_ptr riid: GUID, ppvObj: rawptr) -> HRESULT,
	GetMops: proc "system" (this: ^ITypeInfo, memid: i32, pBstrMops: ^BSTR) -> HRESULT,
	GetContainingTypeLib: proc "system" (this: ^ITypeInfo, ppTLib: ^^ITypeLib, pIndex: ^u32) -> HRESULT,
	ReleaseTypeAttr: proc "system" (this: ^ITypeInfo, pTypeAttr: ^TYPEATTR),
	ReleaseFuncDesc: proc "system" (this: ^ITypeInfo, pFuncDesc: ^FUNCDESC),
	ReleaseVarDesc: proc "system" (this: ^ITypeInfo, pVarDesc: ^VARDESC),
}
IID_ITypeInfo :: GUID{0x00020401, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/nn-oaidl-itypelib ]]
ITypeLib :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITypeLib_Vtbl,
}
ITypeLib_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetTypeInfoCount: proc "system" (this: ^ITypeLib) -> u32,
	GetTypeInfo: proc "system" (this: ^ITypeLib, index: u32, ppTInfo: ^^ITypeInfo) -> HRESULT,
	GetTypeInfoType: proc "system" (this: ^ITypeLib, index: u32, pTKind: ^TYPEKIND) -> HRESULT,
	GetTypeInfoOfGuid: proc "system" (this: ^ITypeLib, #by_ptr guid: GUID, ppTinfo: ^^ITypeInfo) -> HRESULT,
	GetLibAttr: proc "system" (this: ^ITypeLib, ppTLibAttr: ^TLIBATTR) -> HRESULT,
	GetTypeComp: proc "system" (this: ^ITypeLib, ppTComp: ^^ITypeComp) -> HRESULT,
	GetDocumentation: proc "system" (
		this: ^ITypeLib,
		index: i32,
		pBstrName: ^BSTR,
		pBstrDocString: ^BSTR,
		pdwHelpContext: ^u32,
		pBstrHelpFile: ^BSTR,
	) -> HRESULT,
	IsName: proc "system" (this: ^ITypeLib, szNameBuf: PWSTR, lHashVal: u32, pfName: ^BOOL) -> HRESULT,
	FindName: proc "system" (
		this: ^ITypeLib,
		szNameBuf: PWSTR,
		lHashVal: u32,
		ppTInfo: [^]^ITypeInfo,
		rgMemId: [^]i32,
		pcFound: ^u16,
	) -> HRESULT,
	ReleaseTLibAttr: proc "system" (this: ^ITypeLib, pTLibAttr: ^TLIBATTR),
}
IID_ITypeLib :: GUID{0x00020402, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iunknown ]]
IUnknown :: struct #raw_union {
	using Vtbl: ^IUnknown_Vtbl,
}
IUnknown_Vtbl :: struct {
	QueryInterface: proc "system" (this: ^IUnknown, #by_ptr riid: GUID, ppvObject: rawptr) -> HRESULT,
	AddRef: proc "system" (this: ^IUnknown) -> u32,
	Release: proc "system" (this: ^IUnknown) -> u32,
}
IID_IUnknown :: GUID{0x00000000, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-locktype ]]
LOCKTYPE :: enum i32 {
	WRITE = 1,
	EXCLUSIVE = 2,
	ONLYONCE = 4,
}

LPEXCEPFINO_DEFERRED_FILLIN :: #type proc "system" (pExcepInfo: ^EXCEPINFO) -> HRESULT

ROT_FLAGS :: distinct bit_set[enum {
	REGISTRATIONKEEPSALIVE = 0,
	ALLOWANYCLIENT = 1,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearray ]]
SAFEARRAY :: struct {
	cDims: u16,
	fFeatures: ADVANCED_FEATURE_FLAGS,
	cbElements: u32,
	cLocks: u32,
	pvData: rawptr,
	rgsabound: [1]SAFEARRAYBOUND,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-safearraybound ]]
SAFEARRAYBOUND :: struct {
	cElements: u32,
	lLbound: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-statdata ]]
STATDATA :: struct {
	formatetc: FORMATETC,
	advf: u32,
	pAdvSink: ^IAdviseSink,
	dwConnection: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-statflag ]]
STATFLAG :: enum i32 {
	DEFAULT = 0,
	NONAME = 1,
	NOOPEN = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/ns-objidl-statstg ]]
STATSTG :: struct {
	pwcsName: PWSTR,
	type: u32,
	cbSize: u64,
	mtime: FILETIME,
	ctime: FILETIME,
	atime: FILETIME,
	grfMode: STGM,
	grfLocksSupported: LOCKTYPE,
	clsid: GUID,
	grfStateBits: u32,
	reserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-stgc ]]
STGC :: distinct bit_set[enum {
	OVERWRITE = 0,
	ONLYIFCURRENT = 1,
	DANGEROUSLYCOMMITMERELYTODISKCACHE = 2,
	CONSOLIDATE = 3,
}; i32]
STGC_DEFAULT :: transmute(STGC)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/Stg/stgm-constants ]]
STGM :: distinct bit_set[enum {
	TRANSACTED = 16,
	SIMPLE = 27,
	WRITE = 0,
	READWRITE = 1,
	SHARE_DENY_NONE = 6,
	SHARE_DENY_WRITE = 5,
	SHARE_EXCLUSIVE = 4,
	PRIORITY = 18,
	DELETEONRELEASE = 26,
	NOSCRATCH = 20,
	CREATE = 12,
	CONVERT = 17,
	NOSNAPSHOT = 21,
	DIRECT_SWMR = 22,
}; u32]
STGM_DIRECT :: transmute(STGM)u32(0x00000000)
STGM_READ :: transmute(STGM)u32(0x00000000)
STGM_SHARE_DENY_READ :: transmute(STGM)u32(0x00000030)
STGM_FAILIFTHERE :: transmute(STGM)u32(0x00000000)

STGMEDIUM :: struct {
	tymed: TYMED,
	u: struct #raw_union {
		hBitmap: HBITMAP,
		hMetaFilePict: rawptr,
		hEnhMetaFile: HENHMETAFILE,
		hGlobal: HGLOBAL,
		lpszFileName: PWSTR,
		pstm: ^IStream,
		pstg: ^IStorage,
	},
	pUnkForRelease: ^IUnknown,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-stream_seek ]]
STREAM_SEEK :: enum u32 {
	SET = 0x00000000,
	CUR = 0x00000001,
	END = 0x00000002,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-syskind ]]
SYSKIND :: enum i32 {
	WIN16 = 0,
	WIN32 = 1,
	MAC = 2,
	WIN64 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-tlibattr ]]
TLIBATTR :: struct {
	guid: GUID,
	lcid: u32,
	syskind: SYSKIND,
	wMajorVerNum: u16,
	wMinorVerNum: u16,
	wLibFlags: u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-tymed ]]
TYMED :: enum i32 {
	HGLOBAL = 1,
	FILE = 2,
	ISTREAM = 4,
	ISTORAGE = 8,
	GDI = 16,
	MFPICT = 32,
	ENHMF = 64,
	NULL = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-typeattr ]]
TYPEATTR :: struct {
	guid: GUID,
	lcid: u32,
	dwReserved: u32,
	memidConstructor: i32,
	memidDestructor: i32,
	lpstrSchema: PWSTR,
	cbSizeInstance: u32,
	typekind: TYPEKIND,
	cFuncs: u16,
	cVars: u16,
	cImplTypes: u16,
	cbSizeVft: u16,
	cbAlignment: u16,
	wTypeFlags: u16,
	wMajorVerNum: u16,
	wMinorVerNum: u16,
	tdescAlias: TYPEDESC,
	idldescType: IDLDESC,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-typedesc ]]
TYPEDESC :: struct {
	using _: struct #raw_union {
		lptdesc: ^TYPEDESC,
		lpadesc: ^ARRAYDESC,
		hreftype: u32,
	},
	vt: VARENUM,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-typekind ]]
TYPEKIND :: enum i32 {
	ENUM = 0,
	RECORD = 1,
	MODULE = 2,
	INTERFACE = 3,
	DISPATCH = 4,
	COCLASS = 5,
	ALIAS = 6,
	UNION = 7,
	MAX = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-vardesc ]]
VARDESC :: struct {
	memid: i32,
	lpstrSchema: PWSTR,
	using _: struct #raw_union {
		oInst: u32,
		lpvarValue: ^VARIANT,
	},
	elemdescVar: ELEMDESC,
	wVarFlags: VARFLAGS,
	varkind: VARKIND,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-varflags ]]
VARFLAGS :: enum u16 {
	FREADONLY = 0x0001,
	FSOURCE = 0x0002,
	FBINDABLE = 0x0004,
	FREQUESTEDIT = 0x0008,
	FDISPLAYBIND = 0x0010,
	FDEFAULTBIND = 0x0020,
	FHIDDEN = 0x0040,
	FRESTRICTED = 0x0080,
	FDEFAULTCOLLELEM = 0x0100,
	FUIDEFAULT = 0x0200,
	FNONBROWSABLE = 0x0400,
	FREPLACEABLE = 0x0800,
	FIMMEDIATEBIND = 0x1000,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ne-oaidl-varkind ]]
VARKIND :: enum i32 {
	PERINSTANCE = 0,
	STATIC = 1,
	CONST = 2,
	DISPATCH = 3,
}

