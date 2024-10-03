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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-bindptr ]]
BINDPTR :: struct #raw_union {
	lpfuncdesc: ^FUNCDESC,
	lpvardesc: ^VARDESC,
	lptcomp: ^ITypeComp,
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

