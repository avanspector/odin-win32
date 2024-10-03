package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-arraydesc ]]
ARRAYDESC :: struct {
	tdescElem: TYPEDESC,
	cDims: u16,
	rgbounds: [1]SAFEARRAYBOUND,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/com/dropeffect-constants ]]
DROPEFFECT :: distinct bit_set[enum {
	COPY = 0,
	MOVE = 1,
	LINK = 2,
	SCROLL = 31,
}; u32]
DROPEFFECT_NONE :: transmute(DROPEFFECT)u32(0x00000000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-idropsource ]]
IDropSource :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDropSource_Vtbl,
}
IDropSource_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryContinueDrag: proc "system" (this: ^IDropSource, fEscapePressed: BOOL, grfKeyState: MODIFIERKEYS_FLAGS) -> HRESULT,
	GiveFeedback: proc "system" (this: ^IDropSource, dwEffect: DROPEFFECT) -> HRESULT,
}
IID_IDropSource :: GUID{0x00000121, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-idroptarget ]]
IDropTarget :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDropTarget_Vtbl,
}
IDropTarget_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	DragEnter: proc "system" (
		this: ^IDropTarget,
		pDataObj: ^IDataObject,
		grfKeyState: MODIFIERKEYS_FLAGS,
		pt: POINTL,
		pdwEffect: ^DROPEFFECT,
	) -> HRESULT,
	DragOver: proc "system" (
		this: ^IDropTarget,
		grfKeyState: MODIFIERKEYS_FLAGS,
		pt: POINTL,
		pdwEffect: ^DROPEFFECT,
	) -> HRESULT,
	DragLeave: proc "system" (this: ^IDropTarget) -> HRESULT,
	Drop: proc "system" (
		this: ^IDropTarget,
		pDataObj: ^IDataObject,
		grfKeyState: MODIFIERKEYS_FLAGS,
		pt: POINTL,
		pdwEffect: ^DROPEFFECT,
	) -> HRESULT,
}
IID_IDropTarget :: GUID{0x00000122, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ienumoleverb ]]
IEnumOLEVERB :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumOLEVERB_Vtbl,
}
IEnumOLEVERB_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumOLEVERB, celt: u32, rgelt: [^]OLEVERB, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumOLEVERB, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumOLEVERB) -> HRESULT,
	Clone: proc "system" (this: ^IEnumOLEVERB, ppenum: ^^IEnumOLEVERB) -> HRESULT,
}
IID_IEnumOLEVERB :: GUID{0x00000104, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ifontdisp ]]
IFontDisp :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IFontDisp_Vtbl,
}
IFontDisp_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_IFontDisp :: GUID{0xBEF6E003, 0xA874, 0x101A, {0x8B, 0xBA, 0x00, 0xAA, 0x00, 0x30, 0x0C, 0xAB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleclientsite ]]
IOleClientSite :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOleClientSite_Vtbl,
}
IOleClientSite_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SaveObject: proc "system" (this: ^IOleClientSite) -> HRESULT,
	GetMoniker: proc "system" (
		this: ^IOleClientSite,
		dwAssign: OLEGETMONIKER,
		dwWhichMoniker: OLEWHICHMK,
		ppmk: ^^IMoniker,
	) -> HRESULT,
	GetContainer: proc "system" (this: ^IOleClientSite, ppContainer: ^^IOleContainer) -> HRESULT,
	ShowObject: proc "system" (this: ^IOleClientSite) -> HRESULT,
	OnShowWindow: proc "system" (this: ^IOleClientSite, fShow: BOOL) -> HRESULT,
	RequestNewObjectLayout: proc "system" (this: ^IOleClientSite) -> HRESULT,
}
IID_IOleClientSite :: GUID{0x00000118, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/docobj/nn-docobj-iolecommandtarget ]]
IOleCommandTarget :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOleCommandTarget_Vtbl,
}
IOleCommandTarget_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryStatus: proc "system" (
		this: ^IOleCommandTarget,
		#by_ptr pguidCmdGroup: GUID,
		cCmds: u32,
		prgCmds: ^OLECMD,
		pCmdText: ^OLECMDTEXT,
	) -> HRESULT,
	Exec: proc "system" (
		this: ^IOleCommandTarget,
		#by_ptr pguidCmdGroup: GUID,
		nCmdID: u32,
		nCmdexecopt: u32,
		pvaIn: ^VARIANT,
		pvaOut: ^VARIANT,
	) -> HRESULT,
}
IID_IOleCommandTarget :: GUID{0xB722BCCB, 0x4E68, 0x101B, {0xA2, 0xBC, 0x00, 0xAA, 0x00, 0x40, 0x47, 0x70}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-iolecontainer ]]
IOleContainer :: struct #raw_union {
	#subtype IParseDisplayName: IParseDisplayName,
	using Vtbl: ^IOleContainer_Vtbl,
}
IOleContainer_Vtbl :: struct {
	using IParseDisplayName_Vtbl: IParseDisplayName_Vtbl,
	EnumObjects: proc "system" (this: ^IOleContainer, grfFlags: OLECONTF, ppenum: ^^IEnumUnknown) -> HRESULT,
	LockContainer: proc "system" (this: ^IOleContainer, fLock: BOOL) -> HRESULT,
}
IID_IOleContainer :: GUID{0x0000011B, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleinplaceactiveobject ]]
IOleInPlaceActiveObject :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IOleInPlaceActiveObject_Vtbl,
}
IOleInPlaceActiveObject_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	TranslateAccelerator: proc "system" (this: ^IOleInPlaceActiveObject, lpmsg: ^MSG) -> HRESULT,
	OnFrameWindowActivate: proc "system" (this: ^IOleInPlaceActiveObject, fActivate: BOOL) -> HRESULT,
	OnDocWindowActivate: proc "system" (this: ^IOleInPlaceActiveObject, fActivate: BOOL) -> HRESULT,
	ResizeBorder: proc "system" (
		this: ^IOleInPlaceActiveObject,
		prcBorder: ^RECT,
		pUIWindow: ^IOleInPlaceUIWindow,
		fFrameWindow: BOOL,
	) -> HRESULT,
	EnableModeless: proc "system" (this: ^IOleInPlaceActiveObject, fEnable: BOOL) -> HRESULT,
}
IID_IOleInPlaceActiveObject :: GUID{0x00000117, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleinplaceframe ]]
IOleInPlaceFrame :: struct #raw_union {
	#subtype IOleInPlaceUIWindow: IOleInPlaceUIWindow,
	using Vtbl: ^IOleInPlaceFrame_Vtbl,
}
IOleInPlaceFrame_Vtbl :: struct {
	using IOleInPlaceUIWindow_Vtbl: IOleInPlaceUIWindow_Vtbl,
	InsertMenus: proc "system" (
		this: ^IOleInPlaceFrame,
		hmenuShared: HMENU,
		lpMenuWidths: ^OLEMENUGROUPWIDTHS,
	) -> HRESULT,
	SetMenu: proc "system" (
		this: ^IOleInPlaceFrame,
		hmenuShared: HMENU,
		holemenu: int,
		hwndActiveObject: HWND,
	) -> HRESULT,
	RemoveMenus: proc "system" (this: ^IOleInPlaceFrame, hmenuShared: HMENU) -> HRESULT,
	SetStatusText: proc "system" (this: ^IOleInPlaceFrame, pszStatusText: PWSTR) -> HRESULT,
	EnableModeless: proc "system" (this: ^IOleInPlaceFrame, fEnable: BOOL) -> HRESULT,
	TranslateAccelerator: proc "system" (this: ^IOleInPlaceFrame, lpmsg: ^MSG, wID: u16) -> HRESULT,
}
IID_IOleInPlaceFrame :: GUID{0x00000116, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleinplacesite ]]
IOleInPlaceSite :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IOleInPlaceSite_Vtbl,
}
IOleInPlaceSite_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	CanInPlaceActivate: proc "system" (this: ^IOleInPlaceSite) -> HRESULT,
	OnInPlaceActivate: proc "system" (this: ^IOleInPlaceSite) -> HRESULT,
	OnUIActivate: proc "system" (this: ^IOleInPlaceSite) -> HRESULT,
	GetWindowContext: proc "system" (
		this: ^IOleInPlaceSite,
		ppFrame: ^^IOleInPlaceFrame,
		ppDoc: ^^IOleInPlaceUIWindow,
		lprcPosRect: ^RECT,
		lprcClipRect: ^RECT,
		lpFrameInfo: ^OLEINPLACEFRAMEINFO,
	) -> HRESULT,
	Scroll: proc "system" (this: ^IOleInPlaceSite, scrollExtant: SIZE) -> HRESULT,
	OnUIDeactivate: proc "system" (this: ^IOleInPlaceSite, fUndoable: BOOL) -> HRESULT,
	OnInPlaceDeactivate: proc "system" (this: ^IOleInPlaceSite) -> HRESULT,
	DiscardUndoState: proc "system" (this: ^IOleInPlaceSite) -> HRESULT,
	DeactivateAndUndo: proc "system" (this: ^IOleInPlaceSite) -> HRESULT,
	OnPosRectChange: proc "system" (this: ^IOleInPlaceSite, lprcPosRect: ^RECT) -> HRESULT,
}
IID_IOleInPlaceSite :: GUID{0x00000119, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleinplaceuiwindow ]]
IOleInPlaceUIWindow :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IOleInPlaceUIWindow_Vtbl,
}
IOleInPlaceUIWindow_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	GetBorder: proc "system" (this: ^IOleInPlaceUIWindow, lprectBorder: ^RECT) -> HRESULT,
	RequestBorderSpace: proc "system" (this: ^IOleInPlaceUIWindow, pborderwidths: ^RECT) -> HRESULT,
	SetBorderSpace: proc "system" (this: ^IOleInPlaceUIWindow, pborderwidths: ^RECT) -> HRESULT,
	SetActiveObject: proc "system" (
		this: ^IOleInPlaceUIWindow,
		pActiveObject: ^IOleInPlaceActiveObject,
		pszObjName: PWSTR,
	) -> HRESULT,
}
IID_IOleInPlaceUIWindow :: GUID{0x00000115, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-ioleobject ]]
IOleObject :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOleObject_Vtbl,
}
IOleObject_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetClientSite: proc "system" (this: ^IOleObject, pClientSite: ^IOleClientSite) -> HRESULT,
	GetClientSite: proc "system" (this: ^IOleObject, ppClientSite: ^^IOleClientSite) -> HRESULT,
	SetHostNames: proc "system" (this: ^IOleObject, szContainerApp: PWSTR, szContainerObj: PWSTR) -> HRESULT,
	Close: proc "system" (this: ^IOleObject, dwSaveOption: OLECLOSE) -> HRESULT,
	SetMoniker: proc "system" (this: ^IOleObject, dwWhichMoniker: OLEWHICHMK, pmk: ^IMoniker) -> HRESULT,
	GetMoniker: proc "system" (
		this: ^IOleObject,
		dwAssign: OLEGETMONIKER,
		dwWhichMoniker: OLEWHICHMK,
		ppmk: ^^IMoniker,
	) -> HRESULT,
	InitFromData: proc "system" (this: ^IOleObject, pDataObject: ^IDataObject, fCreation: BOOL, dwReserved: u32) -> HRESULT,
	GetClipboardData: proc "system" (this: ^IOleObject, dwReserved: u32, ppDataObject: ^^IDataObject) -> HRESULT,
	DoVerb: proc "system" (
		this: ^IOleObject,
		iVerb: i32,
		lpmsg: ^MSG,
		pActiveSite: ^IOleClientSite,
		lindex: i32,
		hwndParent: HWND,
		lprcPosRect: ^RECT,
	) -> HRESULT,
	EnumVerbs: proc "system" (this: ^IOleObject, ppEnumOleVerb: ^^IEnumOLEVERB) -> HRESULT,
	Update: proc "system" (this: ^IOleObject) -> HRESULT,
	IsUpToDate: proc "system" (this: ^IOleObject) -> HRESULT,
	GetUserClassID: proc "system" (this: ^IOleObject, pClsid: ^GUID) -> HRESULT,
	GetUserType: proc "system" (this: ^IOleObject, dwFormOfType: USERCLASSTYPE, pszUserType: ^PWSTR) -> HRESULT,
	SetExtent: proc "system" (this: ^IOleObject, dwDrawAspect: DVASPECT, psizel: ^SIZE) -> HRESULT,
	GetExtent: proc "system" (this: ^IOleObject, dwDrawAspect: DVASPECT, psizel: ^SIZE) -> HRESULT,
	Advise: proc "system" (this: ^IOleObject, pAdvSink: ^IAdviseSink, pdwConnection: ^u32) -> HRESULT,
	Unadvise: proc "system" (this: ^IOleObject, dwConnection: u32) -> HRESULT,
	EnumAdvise: proc "system" (this: ^IOleObject, ppenumAdvise: ^^IEnumSTATDATA) -> HRESULT,
	GetMiscStatus: proc "system" (this: ^IOleObject, dwAspect: DVASPECT, pdwStatus: ^OLEMISC) -> HRESULT,
	SetColorScheme: proc "system" (this: ^IOleObject, pLogpal: ^LOGPALETTE) -> HRESULT,
}
IID_IOleObject :: GUID{0x00000112, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-iolewindow ]]
IOleWindow :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOleWindow_Vtbl,
}
IOleWindow_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetWindow: proc "system" (this: ^IOleWindow, phwnd: ^HWND) -> HRESULT,
	ContextSensitiveHelp: proc "system" (this: ^IOleWindow, fEnterMode: BOOL) -> HRESULT,
}
IID_IOleWindow :: GUID{0x00000114, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/nn-oleidl-iparsedisplayname ]]
IParseDisplayName :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IParseDisplayName_Vtbl,
}
IParseDisplayName_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ParseDisplayName: proc "system" (
		this: ^IParseDisplayName,
		pbc: ^IBindCtx,
		pszDisplayName: PWSTR,
		pchEaten: ^u32,
		ppmkOut: ^^IMoniker,
	) -> HRESULT,
}
IID_IParseDisplayName :: GUID{0x0000011A, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-oleclose ]]
OLECLOSE :: enum i32 {
	SAVEIFDIRTY = 0,
	NOSAVE = 1,
	PROMPTSAVE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-olecmd ]]
OLECMD :: struct {
	cmdID: OLECMDID,
	cmdf: OLECMDF,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-olecmdexecopt ]]
OLECMDEXECOPT :: enum i32 {
	DODEFAULT = 0,
	PROMPTUSER = 1,
	DONTPROMPTUSER = 2,
	SHOWHELP = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-olecmdf ]]
OLECMDF :: enum i32 {
	SUPPORTED = 1,
	ENABLED = 2,
	LATCHED = 4,
	NINCHED = 8,
	INVISIBLE = 16,
	DEFHIDEONCTXTMENU = 32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/docobj/ne-docobj-olecmdid ]]
OLECMDID :: enum i32 {
	OPEN = 1,
	NEW = 2,
	SAVE = 3,
	SAVEAS = 4,
	SAVECOPYAS = 5,
	PRINT = 6,
	PRINTPREVIEW = 7,
	PAGESETUP = 8,
	SPELL = 9,
	PROPERTIES = 10,
	CUT = 11,
	COPY = 12,
	PASTE = 13,
	PASTESPECIAL = 14,
	UNDO = 15,
	REDO = 16,
	SELECTALL = 17,
	CLEARSELECTION = 18,
	ZOOM = 19,
	GETZOOMRANGE = 20,
	UPDATECOMMANDS = 21,
	REFRESH = 22,
	STOP = 23,
	HIDETOOLBARS = 24,
	SETPROGRESSMAX = 25,
	SETPROGRESSPOS = 26,
	SETPROGRESSTEXT = 27,
	SETTITLE = 28,
	SETDOWNLOADSTATE = 29,
	STOPDOWNLOAD = 30,
	ONTOOLBARACTIVATED = 31,
	FIND = 32,
	DELETE = 33,
	HTTPEQUIV = 34,
	HTTPEQUIV_DONE = 35,
	ENABLE_INTERACTION = 36,
	ONUNLOAD = 37,
	PROPERTYBAG2 = 38,
	PREREFRESH = 39,
	SHOWSCRIPTERROR = 40,
	SHOWMESSAGE = 41,
	SHOWFIND = 42,
	SHOWPAGESETUP = 43,
	SHOWPRINT = 44,
	CLOSE = 45,
	ALLOWUILESSSAVEAS = 46,
	DONTDOWNLOADCSS = 47,
	UPDATEPAGESTATUS = 48,
	PRINT2 = 49,
	PRINTPREVIEW2 = 50,
	SETPRINTTEMPLATE = 51,
	GETPRINTTEMPLATE = 52,
	PAGEACTIONBLOCKED = 55,
	PAGEACTIONUIQUERY = 56,
	FOCUSVIEWCONTROLS = 57,
	FOCUSVIEWCONTROLSQUERY = 58,
	SHOWPAGEACTIONMENU = 59,
	ADDTRAVELENTRY = 60,
	UPDATETRAVELENTRY = 61,
	UPDATEBACKFORWARDSTATE = 62,
	OPTICAL_ZOOM = 63,
	OPTICAL_GETZOOMRANGE = 64,
	WINDOWSTATECHANGED = 65,
	ACTIVEXINSTALLSCOPE = 66,
	UPDATETRAVELENTRY_DATARECOVERY = 67,
	SHOWTASKDLG = 68,
	POPSTATEEVENT = 69,
	VIEWPORT_MODE = 70,
	LAYOUT_VIEWPORT_WIDTH = 71,
	VISUAL_VIEWPORT_EXCLUDE_BOTTOM = 72,
	USER_OPTICAL_ZOOM = 73,
	PAGEAVAILABLE = 74,
	GETUSERSCALABLE = 75,
	UPDATE_CARET = 76,
	ENABLE_VISIBILITY = 77,
	MEDIA_PLAYBACK = 78,
	SETFAVICON = 79,
	SET_HOST_FULLSCREENMODE = 80,
	EXITFULLSCREEN = 81,
	SCROLLCOMPLETE = 82,
	ONBEFOREUNLOAD = 83,
	SHOWMESSAGE_BLOCKABLE = 84,
	SHOWTASKDLG_BLOCKABLE = 85,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/docobj/ns-docobj-olecmdtext ]]
OLECMDTEXT :: struct {
	cmdtextf: u32,
	cwActual: u32,
	cwBuf: u32,
	rgwz: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-olecontf ]]
OLECONTF :: enum i32 {
	EMBEDDINGS = 1,
	LINKS = 2,
	OTHERS = 4,
	ONLYUSER = 8,
	ONLYIFRUNNING = 16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-olegetmoniker ]]
OLEGETMONIKER :: enum i32 {
	ONLYIFTHERE = 1,
	FORCEASSIGN = 2,
	UNASSIGN = 3,
	TEMPFORUSER = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleinplaceframeinfo ]]
OLEINPLACEFRAMEINFO :: struct {
	cb: u32,
	fMDIApp: BOOL,
	hwndFrame: HWND,
	haccel: HACCEL,
	cAccelEntries: u32,
}

OLEIVERB :: enum i32 {
	PRIMARY = 0,
	SHOW = -1,
	OPEN = -2,
	HIDE = -3,
	UIACTIVATE = -4,
	INPLACEACTIVATE = -5,
	DISCARDUNDOSTATE = -6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ns-oleidl-olemenugroupwidths ]]
OLEMENUGROUPWIDTHS :: struct {
	width: [6]i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-olemisc ]]
OLEMISC :: enum i32 {
	RECOMPOSEONRESIZE = 1,
	ONLYICONIC = 2,
	INSERTNOTREPLACE = 4,
	STATIC = 8,
	CANTLINKINSIDE = 16,
	CANLINKBYOLE1 = 32,
	ISLINKOBJECT = 64,
	INSIDEOUT = 128,
	ACTIVATEWHENVISIBLE = 256,
	RENDERINGISDEVICEINDEPENDENT = 512,
	INVISIBLEATRUNTIME = 1024,
	ALWAYSRUN = 2048,
	ACTSLIKEBUTTON = 4096,
	ACTSLIKELABEL = 8192,
	NOUIACTIVATE = 16384,
	ALIGNABLE = 32768,
	SIMPLEFRAME = 65536,
	SETCLIENTSITEFIRST = 131072,
	IMEMODE = 262144,
	IGNOREACTIVATEWHENVISIBLE = 524288,
	WANTSTOMENUMERGE = 1048576,
	SUPPORTSMULTILEVELUNDO = 2097152,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleverb ]]
OLEVERB :: struct {
	lVerb: OLEIVERB,
	lpszVerbName: PWSTR,
	fuFlags: MENU_ITEM_FLAGS,
	grfAttribs: OLEVERBATTRIB,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-oleverbattrib ]]
OLEVERBATTRIB :: enum i32 {
	NEVERDIRTIES = 1,
	ONCONTAINERMENU = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-olewhichmk ]]
OLEWHICHMK :: enum i32 {
	CONTAINER = 1,
	OBJREL = 2,
	OBJFULL = 3,
}

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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-readystate ]]
READYSTATE :: enum i32 {
	UNINITIALIZED = 0,
	LOADING = 1,
	LOADED = 2,
	INTERACTIVE = 3,
	COMPLETE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-userclasstype ]]
USERCLASSTYPE :: enum i32 {
	FULL = 1,
	SHORT = 2,
	APPNAME = 3,
}

