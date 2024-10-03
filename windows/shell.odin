package windows

foreign import appnotify "system:appnotify.lib"
foreign import comctl32 "system:comctl32.lib"
foreign import hlink "system:hlink.lib"
foreign import ole32 "system:ole32.lib"
foreign import pathcch "system:pathcch.lib"
foreign import propsys "system:propsys.lib"
foreign import shcore "system:shcore.lib"
foreign import shdocvw "system:shdocvw.lib"
foreign import shell32 "system:shell32.lib"
foreign import shlwapi "system:shlwapi.lib"
foreign import user32 "system:user32.lib"
foreign import userenv "system:userenv.lib"

@(default_calling_convention="system")
foreign appnotify {
	RegisterAppConstrainedChangeNotification :: proc(
		Routine: PAPPCONSTRAIN_CHANGE_ROUTINE,
		Context: rawptr,
		Registration: ^PAPPCONSTRAIN_REGISTRATION,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/appnotify/nf-appnotify-registerappstatechangenotification ]]
	RegisterAppStateChangeNotification :: proc(
		Routine: PAPPSTATE_CHANGE_ROUTINE,
		Context: rawptr,
		Registration: ^PAPPSTATE_REGISTRATION,
	) -> u32 ---

	UnregisterAppConstrainedChangeNotification :: proc(Registration: PAPPCONSTRAIN_REGISTRATION) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/appnotify/nf-appnotify-unregisterappstatechangenotification ]]
	UnregisterAppStateChangeNotification :: proc(Registration: PAPPSTATE_REGISTRATION) ---
}

@(default_calling_convention="system")
foreign comctl32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-defsubclassproc ]]
	DefSubclassProc :: proc(hWnd: HWND, uMsg: u32, wParam: WPARAM, lParam: LPARAM) -> LRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-getwindowsubclass ]]
	GetWindowSubclass :: proc(hWnd: HWND, pfnSubclass: SUBCLASSPROC, uIdSubclass: uintptr, pdwRefData: ^uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-removewindowsubclass ]]
	RemoveWindowSubclass :: proc(hWnd: HWND, pfnSubclass: SUBCLASSPROC, uIdSubclass: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-setwindowsubclass ]]
	SetWindowSubclass :: proc(hWnd: HWND, pfnSubclass: SUBCLASSPROC, uIdSubclass: uintptr, dwRefData: uintptr) -> BOOL ---
}

@(default_calling_convention="system")
foreign hlink {
	HlinkClone :: proc(
		pihl: ^IHlink,
		#by_ptr riid: GUID,
		pihlsiteForClone: ^IHlinkSite,
		dwSiteData: u32,
		ppvObj: rawptr,
	) -> HRESULT ---

	HlinkCreateBrowseContext :: proc(piunkOuter: ^IUnknown, #by_ptr riid: GUID, ppvObj: rawptr) -> HRESULT ---

	HlinkCreateExtensionServices :: proc(
		pwzAdditionalHeaders: PWSTR,
		phwnd: HWND,
		pszUsername: PWSTR,
		pszPassword: PWSTR,
		piunkOuter: ^IUnknown,
		#by_ptr riid: GUID,
		ppvObj: rawptr,
	) -> HRESULT ---

	HlinkCreateFromData :: proc(
		piDataObj: ^IDataObject,
		pihlsite: ^IHlinkSite,
		dwSiteData: u32,
		piunkOuter: ^IUnknown,
		#by_ptr riid: GUID,
		ppvObj: rawptr,
	) -> HRESULT ---

	HlinkCreateFromMoniker :: proc(
		pimkTrgt: ^IMoniker,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
		pihlsite: ^IHlinkSite,
		dwSiteData: u32,
		piunkOuter: ^IUnknown,
		#by_ptr riid: GUID,
		ppvObj: rawptr,
	) -> HRESULT ---

	HlinkCreateFromString :: proc(
		pwzTarget: PWSTR,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
		pihlsite: ^IHlinkSite,
		dwSiteData: u32,
		piunkOuter: ^IUnknown,
		#by_ptr riid: GUID,
		ppvObj: rawptr,
	) -> HRESULT ---

	HlinkCreateShortcut :: proc(
		grfHLSHORTCUTF: u32,
		pihl: ^IHlink,
		pwzDir: PWSTR,
		pwzFileName: PWSTR,
		ppwzShortcutFile: ^PWSTR,
		dwReserved: u32,
	) -> HRESULT ---

	HlinkCreateShortcutFromMoniker :: proc(
		grfHLSHORTCUTF: u32,
		pimkTarget: ^IMoniker,
		pwzLocation: PWSTR,
		pwzDir: PWSTR,
		pwzFileName: PWSTR,
		ppwzShortcutFile: ^PWSTR,
		dwReserved: u32,
	) -> HRESULT ---

	HlinkCreateShortcutFromString :: proc(
		grfHLSHORTCUTF: u32,
		pwzTarget: PWSTR,
		pwzLocation: PWSTR,
		pwzDir: PWSTR,
		pwzFileName: PWSTR,
		ppwzShortcutFile: ^PWSTR,
		dwReserved: u32,
	) -> HRESULT ---

	HlinkGetSpecialReference :: proc(uReference: u32, ppwzReference: ^PWSTR) -> HRESULT ---

	HlinkGetValueFromParams :: proc(pwzParams: PWSTR, pwzName: PWSTR, ppwzValue: ^PWSTR) -> HRESULT ---

	HlinkIsShortcut :: proc(pwzFileName: PWSTR) -> HRESULT ---

	HlinkNavigate :: proc(
		pihl: ^IHlink,
		pihlframe: ^IHlinkFrame,
		grfHLNF: u32,
		pbc: ^IBindCtx,
		pibsc: ^IBindStatusCallback,
		pihlbc: ^IHlinkBrowseContext,
	) -> HRESULT ---

	HlinkNavigateToStringReference :: proc(
		pwzTarget: PWSTR,
		pwzLocation: PWSTR,
		pihlsite: ^IHlinkSite,
		dwSiteData: u32,
		pihlframe: ^IHlinkFrame,
		grfHLNF: u32,
		pibc: ^IBindCtx,
		pibsc: ^IBindStatusCallback,
		pihlbc: ^IHlinkBrowseContext,
	) -> HRESULT ---

	HlinkOnNavigate :: proc(
		pihlframe: ^IHlinkFrame,
		pihlbc: ^IHlinkBrowseContext,
		grfHLNF: u32,
		pimkTarget: ^IMoniker,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
		puHLID: ^u32,
	) -> HRESULT ---

	HlinkOnRenameDocument :: proc(
		dwReserved: u32,
		pihlbc: ^IHlinkBrowseContext,
		pimkOld: ^IMoniker,
		pimkNew: ^IMoniker,
	) -> HRESULT ---

	HlinkParseDisplayName :: proc(
		pibc: ^IBindCtx,
		pwzDisplayName: PWSTR,
		fNoForceAbs: BOOL,
		pcchEaten: ^u32,
		ppimk: ^^IMoniker,
	) -> HRESULT ---

	HlinkPreprocessMoniker :: proc(pibc: ^IBindCtx, pimkIn: ^IMoniker, ppimkOut: ^^IMoniker) -> HRESULT ---

	HlinkQueryCreateFromData :: proc(piDataObj: ^IDataObject) -> HRESULT ---

	HlinkResolveMonikerForData :: proc(
		pimkReference: ^IMoniker,
		reserved: u32,
		pibc: ^IBindCtx,
		cFmtetc: u32,
		rgFmtetc: ^FORMATETC,
		pibsc: ^IBindStatusCallback,
		pimkBase: ^IMoniker,
	) -> HRESULT ---

	HlinkResolveShortcut :: proc(
		pwzShortcutFileName: PWSTR,
		pihlsite: ^IHlinkSite,
		dwSiteData: u32,
		piunkOuter: ^IUnknown,
		#by_ptr riid: GUID,
		ppvObj: rawptr,
	) -> HRESULT ---

	HlinkResolveShortcutToMoniker :: proc(pwzShortcutFileName: PWSTR, ppimkTarget: ^^IMoniker, ppwzLocation: ^PWSTR) -> HRESULT ---

	HlinkResolveShortcutToString :: proc(pwzShortcutFileName: PWSTR, ppwzTarget: ^PWSTR, ppwzLocation: ^PWSTR) -> HRESULT ---

	HlinkResolveStringForData :: proc(
		pwzReference: PWSTR,
		reserved: u32,
		pibc: ^IBindCtx,
		cFmtetc: u32,
		rgFmtetc: ^FORMATETC,
		pibsc: ^IBindStatusCallback,
		pimkBase: ^IMoniker,
	) -> HRESULT ---

	HlinkSetSpecialReference :: proc(uReference: u32, pwzReference: PWSTR) -> HRESULT ---

	HlinkTranslateURL :: proc(pwzURL: PWSTR, grfFlags: u32, ppwzTranslatedURL: ^PWSTR) -> HRESULT ---

	HlinkUpdateStackItem :: proc(
		pihlframe: ^IHlinkFrame,
		pihlbc: ^IHlinkBrowseContext,
		uHLID: u32,
		pimkTrgt: ^IMoniker,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
	) -> HRESULT ---

	OleSaveToStreamEx :: proc(piunk: ^IUnknown, pistm: ^IStream, fClearDirty: BOOL) -> HRESULT ---
}

@(default_calling_convention="system")
foreign ole32 {
	HMONITOR_UserFree :: proc(param0: ^u32, param1: ^HMONITOR) ---

	HMONITOR_UserFree64 :: proc(param0: ^u32, param1: ^HMONITOR) ---

	HMONITOR_UserMarshal :: proc(param0: ^u32, param1: ^u8, param2: ^HMONITOR) -> ^u8 ---

	HMONITOR_UserMarshal64 :: proc(param0: ^u32, param1: ^u8, param2: ^HMONITOR) -> ^u8 ---

	HMONITOR_UserSize :: proc(param0: ^u32, param1: u32, param2: ^HMONITOR) -> u32 ---

	HMONITOR_UserSize64 :: proc(param0: ^u32, param1: u32, param2: ^HMONITOR) -> u32 ---

	HMONITOR_UserUnmarshal :: proc(param0: ^u32, param1: ^u8, param2: ^HMONITOR) -> ^u8 ---

	HMONITOR_UserUnmarshal64 :: proc(param0: ^u32, param1: ^u8, param2: ^HMONITOR) -> ^u8 ---
}

@(default_calling_convention="system")
foreign pathcch {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathalloccanonicalize ]]
	PathAllocCanonicalize :: proc(pszPathIn: PWSTR, dwFlags: PATHCCH_OPTIONS, ppszPathOut: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathalloccombine ]]
	PathAllocCombine :: proc(
		pszPathIn: PWSTR,
		pszMore: PWSTR,
		dwFlags: PATHCCH_OPTIONS,
		ppszPathOut: ^PWSTR,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchaddbackslash ]]
	PathCchAddBackslash :: proc(pszPath: PWSTR, cchPath: uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchaddbackslashex ]]
	PathCchAddBackslashEx :: proc(pszPath: PWSTR, cchPath: uintptr, ppszEnd: ^PWSTR, pcchRemaining: ^uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchaddextension ]]
	PathCchAddExtension :: proc(pszPath: PWSTR, cchPath: uintptr, pszExt: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchappend ]]
	PathCchAppend :: proc(pszPath: PWSTR, cchPath: uintptr, pszMore: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchappendex ]]
	PathCchAppendEx :: proc(pszPath: PWSTR, cchPath: uintptr, pszMore: PWSTR, dwFlags: PATHCCH_OPTIONS) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchcanonicalize ]]
	PathCchCanonicalize :: proc(pszPathOut: PWSTR, cchPathOut: uintptr, pszPathIn: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchcanonicalizeex ]]
	PathCchCanonicalizeEx :: proc(
		pszPathOut: PWSTR,
		cchPathOut: uintptr,
		pszPathIn: PWSTR,
		dwFlags: PATHCCH_OPTIONS,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchcombine ]]
	PathCchCombine :: proc(pszPathOut: PWSTR, cchPathOut: uintptr, pszPathIn: PWSTR, pszMore: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchcombineex ]]
	PathCchCombineEx :: proc(
		pszPathOut: PWSTR,
		cchPathOut: uintptr,
		pszPathIn: PWSTR,
		pszMore: PWSTR,
		dwFlags: PATHCCH_OPTIONS,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchfindextension ]]
	PathCchFindExtension :: proc(pszPath: PWSTR, cchPath: uintptr, #by_ptr ppszExt: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchisroot ]]
	PathCchIsRoot :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchremovebackslash ]]
	PathCchRemoveBackslash :: proc(pszPath: PWSTR, cchPath: uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchremovebackslashex ]]
	PathCchRemoveBackslashEx :: proc(pszPath: PWSTR, cchPath: uintptr, ppszEnd: ^PWSTR, pcchRemaining: ^uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchremoveextension ]]
	PathCchRemoveExtension :: proc(pszPath: PWSTR, cchPath: uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchremovefilespec ]]
	PathCchRemoveFileSpec :: proc(pszPath: PWSTR, cchPath: uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchrenameextension ]]
	PathCchRenameExtension :: proc(pszPath: PWSTR, cchPath: uintptr, pszExt: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchskiproot ]]
	PathCchSkipRoot :: proc(pszPath: PWSTR, #by_ptr ppszRootEnd: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchstripprefix ]]
	PathCchStripPrefix :: proc(pszPath: PWSTR, cchPath: uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathcchstriptoroot ]]
	PathCchStripToRoot :: proc(pszPath: PWSTR, cchPath: uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pathcch/nf-pathcch-pathisuncex ]]
	PathIsUNCEx :: proc(pszPath: PWSTR, ppszServer: ^PWSTR) -> BOOL ---
}

@(default_calling_convention="system")
foreign propsys {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initpropvariantfromstrret ]]
	InitPropVariantFromStrRet :: proc(pstrret: ^STRRET, pidl: ^ITEMIDLIST, ppropvar: ^PROPVARIANT) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-initvariantfromstrret ]]
	InitVariantFromStrRet :: proc(pstrret: ^STRRET, pidl: ^ITEMIDLIST, pvar: ^VARIANT) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-propvarianttostrret ]]
	PropVariantToStrRet :: proc(#by_ptr propvar: PROPVARIANT, pstrret: ^STRRET) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propvarutil/nf-propvarutil-varianttostrret ]]
	VariantToStrRet :: proc(#by_ptr varIn: VARIANT, pstrret: ^STRRET) -> HRESULT ---
}

@(default_calling_convention="system")
foreign shcore {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-getdpiforshelluicomponent ]]
	GetDpiForShellUIComponent :: proc(param0: SHELL_UI_COMPONENT) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-getscalefactorfordevice ]]
	GetScaleFactorForDevice :: proc(deviceType: DISPLAY_DEVICE_TYPE) -> DEVICE_SCALE_FACTOR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-getscalefactorformonitor ]]
	GetScaleFactorForMonitor :: proc(hMon: HMONITOR, pScale: ^DEVICE_SCALE_FACTOR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-registerscalechangeevent ]]
	RegisterScaleChangeEvent :: proc(hEvent: HANDLE, pdwCookie: ^uintptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-registerscalechangenotifications ]]
	RegisterScaleChangeNotifications :: proc(
		displayDevice: DISPLAY_DEVICE_TYPE,
		hwndNotify: HWND,
		uMsgNotify: u32,
		pdwCookie: ^u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-revokescalechangenotifications ]]
	RevokeScaleChangeNotifications :: proc(displayDevice: DISPLAY_DEVICE_TYPE, dwCookie: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/nf-shellscalingapi-unregisterscalechangeevent ]]
	UnregisterScaleChangeEvent :: proc(dwCookie: uintptr) -> HRESULT ---
}

@(default_calling_convention="system")
foreign shdocvw {
	ImportPrivacySettings :: proc(
		pszFilename: PWSTR,
		pfParsePrivacyPreferences: ^BOOL,
		pfParsePerSiteRules: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-softwareupdatemessagebox ]]
	SoftwareUpdateMessageBox :: proc(hWnd: HWND, pszDistUnit: PWSTR, dwFlags: u32, psdi: ^SOFTDISTINFO) -> u32 ---
}

@(default_calling_convention="system")
foreign shell32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-assoccreateforclasses ]]
	AssocCreateForClasses :: proc(
		rgClasses: [^]ASSOCIATIONELEMENT,
		cClasses: u32,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-assocgetdetailsofpropkey ]]
	AssocGetDetailsOfPropKey :: proc(
		psf: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		#by_ptr pkey: PROPERTYKEY,
		pv: ^VARIANT,
		pfFoundPropKey: ^BOOL,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-cdeffoldermenu_create2 ]]
	CDefFolderMenu_Create2 :: proc(
		pidlFolder: ^ITEMIDLIST,
		hwnd: HWND,
		cidl: u32,
		apidl: [^]ITEMIDLIST,
		psf: ^IShellFolder,
		pfn: LPFNDFMCALLBACK,
		nKeys: u32,
		ahkeys: [^]HKEY,
		ppcm: ^^IContextMenu,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-cidldata_createfromidarray ]]
	CIDLData_CreateFromIDArray :: proc(
		pidlFolder: ^ITEMIDLIST,
		cidl: u32,
		apidl: [^]ITEMIDLIST,
		ppdtobj: ^^IDataObject,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-commandlinetoargvw ]]
	CommandLineToArgvW :: proc(lpCmdLine: PWSTR, pNumArgs: ^i32) -> ^PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-dad_autoscroll ]]
	DAD_AutoScroll :: proc(hwnd: HWND, pad: ^AUTO_SCROLL_DATA, #by_ptr pptNow: POINT) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-dad_dragenterex ]]
	DAD_DragEnterEx :: proc(hwndTarget: HWND, ptStart: POINT) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-dad_dragenterex2 ]]
	DAD_DragEnterEx2 :: proc(hwndTarget: HWND, ptStart: POINT, pdtObject: ^IDataObject) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-dad_dragleave ]]
	DAD_DragLeave :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-dad_dragmove ]]
	DAD_DragMove :: proc(pt: POINT) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-dad_setdragimage ]]
	DAD_SetDragImage :: proc(him: HIMAGELIST, pptOffset: ^POINT) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-dad_showdragimage ]]
	DAD_ShowDragImage :: proc(fShow: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-doenvironmentsubsta ]]
	DoEnvironmentSubstA :: proc(pszSrc: PSTR, cchSrc: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-doenvironmentsubstw ]]
	DoEnvironmentSubstW :: proc(pszSrc: PWSTR, cchSrc: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-dragacceptfiles ]]
	DragAcceptFiles :: proc(hWnd: HWND, fAccept: BOOL) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-dragfinish ]]
	DragFinish :: proc(hDrop: HDROP) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-dragqueryfilea ]]
	DragQueryFileA :: proc(hDrop: HDROP, iFile: u32, lpszFile: PSTR, cch: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-dragqueryfilew ]]
	DragQueryFileW :: proc(hDrop: HDROP, iFile: u32, lpszFile: PWSTR, cch: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-dragquerypoint ]]
	DragQueryPoint :: proc(hDrop: HDROP, ppt: ^POINT) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-drivetype ]]
	DriveType :: proc(iDrive: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-duplicateicon ]]
	DuplicateIcon :: proc(hInst: HINSTANCE, hIcon: HICON) -> HICON ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-extractassociatedicona ]]
	ExtractAssociatedIconA :: proc(hInst: HINSTANCE, pszIconPath: PSTR, piIcon: ^u16) -> HICON ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-extractassociatediconexa ]]
	ExtractAssociatedIconExA :: proc(hInst: HINSTANCE, pszIconPath: PSTR, piIconIndex: ^u16, piIconId: ^u16) -> HICON ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-extractassociatediconexw ]]
	ExtractAssociatedIconExW :: proc(hInst: HINSTANCE, pszIconPath: PWSTR, piIconIndex: ^u16, piIconId: ^u16) -> HICON ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-extractassociatediconw ]]
	ExtractAssociatedIconW :: proc(hInst: HINSTANCE, pszIconPath: PWSTR, piIcon: ^u16) -> HICON ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-extracticona ]]
	ExtractIconA :: proc(hInst: HINSTANCE, pszExeFileName: PSTR, nIconIndex: u32) -> HICON ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-extracticonexa ]]
	ExtractIconExA :: proc(
		lpszFile: PSTR,
		nIconIndex: i32,
		phiconLarge: [^]HICON,
		phiconSmall: [^]HICON,
		nIcons: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-extracticonexw ]]
	ExtractIconExW :: proc(
		lpszFile: PWSTR,
		nIconIndex: i32,
		phiconLarge: [^]HICON,
		phiconSmall: [^]HICON,
		nIcons: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-extracticonw ]]
	ExtractIconW :: proc(hInst: HINSTANCE, pszExeFileName: PWSTR, nIconIndex: u32) -> HICON ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/fileiconinit ]]
	FileIconInit :: proc(fRestoreCache: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-findexecutablea ]]
	FindExecutableA :: proc(lpFile: PSTR, lpDirectory: PSTR, lpResult: PSTR) -> HINSTANCE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-findexecutablew ]]
	FindExecutableW :: proc(lpFile: PWSTR, lpDirectory: PWSTR, lpResult: PWSTR) -> HINSTANCE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-getcurrentprocessexplicitappusermodelid ]]
	GetCurrentProcessExplicitAppUserModelID :: proc(AppID: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-getfilenamefrombrowse ]]
	GetFileNameFromBrowse :: proc(
		hwnd: HWND,
		pszFilePath: PWSTR,
		cchFilePath: u32,
		pszWorkingDir: PWSTR,
		pszDefExt: PWSTR,
		pszFilters: PWSTR,
		pszTitle: PWSTR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilappendid ]]
	ILAppendID :: proc(pidl: ^ITEMIDLIST, pmkid: ^SHITEMID, fAppend: BOOL) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilclone ]]
	ILClone :: proc(pidl: ^ITEMIDLIST) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilclonefirst ]]
	ILCloneFirst :: proc(pidl: ^ITEMIDLIST) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilcombine ]]
	ILCombine :: proc(pidl1: ^ITEMIDLIST, pidl2: ^ITEMIDLIST) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilcreatefrompatha ]]
	ILCreateFromPathA :: proc(pszPath: PSTR) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilcreatefrompathw ]]
	ILCreateFromPathW :: proc(pszPath: PWSTR) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilfindchild ]]
	ILFindChild :: proc(pidlParent: ^ITEMIDLIST, pidlChild: ^ITEMIDLIST) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilfindlastid ]]
	ILFindLastID :: proc(pidl: ^ITEMIDLIST) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilfree ]]
	ILFree :: proc(pidl: ^ITEMIDLIST) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilgetnext ]]
	ILGetNext :: proc(pidl: ^ITEMIDLIST) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilgetsize ]]
	ILGetSize :: proc(pidl: ^ITEMIDLIST) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilisequal ]]
	ILIsEqual :: proc(pidl1: ^ITEMIDLIST, pidl2: ^ITEMIDLIST) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilisparent ]]
	ILIsParent :: proc(pidl1: ^ITEMIDLIST, pidl2: ^ITEMIDLIST, fImmediate: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-illoadfromstreamex ]]
	ILLoadFromStreamEx :: proc(pstm: ^IStream, pidl: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilremovelastid ]]
	ILRemoveLastID :: proc(pidl: ^ITEMIDLIST) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-ilsavetostream ]]
	ILSaveToStream :: proc(pstm: ^IStream, pidl: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-initnetworkaddresscontrol ]]
	InitNetworkAddressControl :: proc() -> BOOL ---

	IsLFNDriveA :: proc(pszPath: PSTR) -> BOOL ---

	IsLFNDriveW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-isnetdrive ]]
	IsNetDrive :: proc(iDrive: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-isuseranadmin ]]
	IsUserAnAdmin :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-openregstream ]]
	OpenRegStream :: proc(hkey: HKEY, pszSubkey: PWSTR, pszValue: PWSTR, grfMode: u32) -> ^IStream ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pathcleanupspec ]]
	PathCleanupSpec :: proc(pszDir: PWSTR, pszSpec: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pathgetshortpath ]]
	PathGetShortPath :: proc(pszLongPath: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pathisexe ]]
	PathIsExe :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-pathisslowa ]]
	PathIsSlowA :: proc(pszFile: PSTR, dwAttr: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-pathissloww ]]
	PathIsSlowW :: proc(pszFile: PWSTR, dwAttr: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pathmakeuniquename ]]
	PathMakeUniqueName :: proc(
		pszUniqueName: PWSTR,
		cchMax: u32,
		pszTemplate: PWSTR,
		pszLongPlate: PWSTR,
		pszDir: PWSTR,
	) -> BOOL ---

	PathQualify :: proc(psz: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pathresolve ]]
	PathResolve :: proc(pszPath: PWSTR, dirs: ^u16, fFlags: PRF_FLAGS) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pathyetanothermakeuniquename ]]
	PathYetAnotherMakeUniqueName :: proc(pszUniqueName: PWSTR, pszPath: PWSTR, pszShort: PWSTR, pszFileSpec: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-pickicondlg ]]
	PickIconDlg :: proc(hwnd: HWND, pszIconPath: PWSTR, cchIconPath: u32, piIconIndex: ^i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-readcabinetstate ]]
	ReadCabinetState :: proc(pcs: ^CABINETSTATE, cLength: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-realdrivetype ]]
	RealDriveType :: proc(iDrive: i32, fOKToHitNet: BOOL) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-restartdialog ]]
	RestartDialog :: proc(hwnd: HWND, pszPrompt: PWSTR, dwReturn: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-restartdialogex ]]
	RestartDialogEx :: proc(hwnd: HWND, pszPrompt: PWSTR, dwReturn: u32, dwReasonCode: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-setcurrentprocessexplicitappusermodelid ]]
	SetCurrentProcessExplicitAppUserModelID :: proc(AppID: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shaddfrompropsheetextarray ]]
	SHAddFromPropSheetExtArray :: proc(hpsxa: HPSXA, lpfnAddPage: LPFNSVADDPROPSHEETPAGE, lParam: LPARAM) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shaddtorecentdocs ]]
	SHAddToRecentDocs :: proc(uFlags: u32, pv: rawptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shalloc ]]
	SHAlloc :: proc(cb: uintptr) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shappbarmessage ]]
	SHAppBarMessage :: proc(dwMessage: u32, pData: ^APPBARDATA) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shassocenumhandlers ]]
	SHAssocEnumHandlers :: proc(
		pszExtra: PWSTR,
		afFilter: ASSOC_FILTER,
		ppEnumHandler: ^^IEnumAssocHandlers,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shassocenumhandlersforprotocolbyapplication ]]
	SHAssocEnumHandlersForProtocolByApplication :: proc(protocol: PWSTR, #by_ptr riid: GUID, enumHandlers: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shbindtofolderidlistparent ]]
	SHBindToFolderIDListParent :: proc(
		psfRoot: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		#by_ptr riid: GUID,
		ppv: rawptr,
		ppidlLast: ^ITEMIDLIST,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shbindtofolderidlistparentex ]]
	SHBindToFolderIDListParentEx :: proc(
		psfRoot: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		ppbc: ^IBindCtx,
		#by_ptr riid: GUID,
		ppv: rawptr,
		ppidlLast: ^ITEMIDLIST,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shbindtoobject ]]
	SHBindToObject :: proc(
		psf: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		pbc: ^IBindCtx,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shbindtoparent ]]
	SHBindToParent :: proc(pidl: ^ITEMIDLIST, #by_ptr riid: GUID, ppv: rawptr, ppidlLast: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shbrowseforfoldera ]]
	SHBrowseForFolderA :: proc(lpbi: ^BROWSEINFOA) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shbrowseforfolderw ]]
	SHBrowseForFolderW :: proc(lpbi: ^BROWSEINFOW) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shchangenotification_lock ]]
	SHChangeNotification_Lock :: proc(hChange: HANDLE, dwProcId: u32, pppidl: ^ITEMIDLIST, plEvent: ^i32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shchangenotification_unlock ]]
	SHChangeNotification_Unlock :: proc(hLock: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shchangenotify ]]
	SHChangeNotify :: proc(wEventId: SHCNE_ID, uFlags: SHCNF_FLAGS, dwItem1: rawptr, dwItem2: rawptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shchangenotifyderegister ]]
	SHChangeNotifyDeregister :: proc(ulID: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shchangenotifyregister ]]
	SHChangeNotifyRegister :: proc(
		hwnd: HWND,
		fSources: SHCNRF_SOURCE,
		fEvents: i32,
		wMsg: u32,
		cEntries: i32,
		#by_ptr pshcne: SHChangeNotifyEntry,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-shchangenotifyregisterthread ]]
	SHChangeNotifyRegisterThread :: proc(status: SCNRT_STATUS) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shclonespecialidlist ]]
	SHCloneSpecialIDList :: proc(hwnd: HWND, csidl: i32, fCreate: BOOL) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shclsidfromstring ]]
	SHCLSIDFromString :: proc(psz: PWSTR, pclsid: ^GUID) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcocreateinstance ]]
	SHCoCreateInstance :: proc(
		pszCLSID: PWSTR,
		pclsid: ^GUID,
		pUnkOuter: ^IUnknown,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateassociationregistration ]]
	SHCreateAssociationRegistration :: proc(#by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreatedataobject ]]
	SHCreateDataObject :: proc(
		pidlFolder: ^ITEMIDLIST,
		cidl: u32,
		apidl: [^]ITEMIDLIST,
		pdtInner: ^IDataObject,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreatedefaultcontextmenu ]]
	SHCreateDefaultContextMenu :: proc(#by_ptr pdcm: DEFCONTEXTMENU, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreatedefaultextracticon ]]
	SHCreateDefaultExtractIcon :: proc(#by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-shcreatedefaultpropertiesop ]]
	SHCreateDefaultPropertiesOp :: proc(psi: ^IShellItem, ppFileOp: ^^IFileOperation) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreatedirectory ]]
	SHCreateDirectory :: proc(hwnd: HWND, pszPath: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreatedirectoryexa ]]
	SHCreateDirectoryExA :: proc(hwnd: HWND, pszPath: PSTR, psa: ^SECURITY_ATTRIBUTES) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreatedirectoryexw ]]
	SHCreateDirectoryExW :: proc(hwnd: HWND, pszPath: PWSTR, psa: ^SECURITY_ATTRIBUTES) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreatefileextracticonw ]]
	SHCreateFileExtractIconW :: proc(pszFile: PWSTR, dwFileAttributes: u32, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromidlist ]]
	SHCreateItemFromIDList :: proc(pidl: ^ITEMIDLIST, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromparsingname ]]
	SHCreateItemFromParsingName :: proc(pszPath: PWSTR, pbc: ^IBindCtx, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateitemfromrelativename ]]
	SHCreateItemFromRelativeName :: proc(
		psiParent: ^IShellItem,
		pszName: PWSTR,
		pbc: ^IBindCtx,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateiteminknownfolder ]]
	SHCreateItemInKnownFolder :: proc(
		#by_ptr kfid: GUID,
		dwKFFlags: KNOWN_FOLDER_FLAG,
		pszItem: PWSTR,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateitemwithparent ]]
	SHCreateItemWithParent :: proc(
		pidlParent: ^ITEMIDLIST,
		psfParent: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		#by_ptr riid: GUID,
		ppvItem: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shcreateprocessasuserw ]]
	SHCreateProcessAsUserW :: proc(pscpi: ^SHCREATEPROCESSINFOW) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-shcreatepropsheetextarray ]]
	SHCreatePropSheetExtArray :: proc(hKey: HKEY, pszSubKey: PWSTR, max_iface: u32) -> HPSXA ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-shcreatequerycancelautoplaymoniker ]]
	SHCreateQueryCancelAutoPlayMoniker :: proc(ppmoniker: ^^IMoniker) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreateshellfolderview ]]
	SHCreateShellFolderView :: proc(#by_ptr pcsfv: SFV_CREATE, ppsv: ^^IShellView) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreateshellfolderviewex ]]
	SHCreateShellFolderViewEx :: proc(pcsfv: ^CSFV, ppsv: ^^IShellView) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreateshellitem ]]
	SHCreateShellItem :: proc(
		pidlParent: ^ITEMIDLIST,
		psfParent: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		ppsi: ^^IShellItem,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateshellitemarray ]]
	SHCreateShellItemArray :: proc(
		pidlParent: ^ITEMIDLIST,
		psf: ^IShellFolder,
		cidl: u32,
		ppidl: [^]ITEMIDLIST,
		ppsiItemArray: ^^IShellItemArray,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateshellitemarrayfromdataobject ]]
	SHCreateShellItemArrayFromDataObject :: proc(pdo: ^IDataObject, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateshellitemarrayfromidlists ]]
	SHCreateShellItemArrayFromIDLists :: proc(cidl: u32, rgpidl: [^]ITEMIDLIST, ppsiItemArray: ^^IShellItemArray) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shcreateshellitemarrayfromshellitem ]]
	SHCreateShellItemArrayFromShellItem :: proc(psi: ^IShellItem, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shcreatestdenumfmtetc ]]
	SHCreateStdEnumFmtEtc :: proc(cfmt: u32, afmt: [^]FORMATETC, ppenumFormatEtc: ^^IEnumFORMATETC) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shdefextracticona ]]
	SHDefExtractIconA :: proc(
		pszIconFile: PSTR,
		iIndex: i32,
		uFlags: u32,
		phiconLarge: ^HICON,
		phiconSmall: ^HICON,
		nIconSize: u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shdefextracticonw ]]
	SHDefExtractIconW :: proc(
		pszIconFile: PWSTR,
		iIndex: i32,
		uFlags: u32,
		phiconLarge: ^HICON,
		phiconSmall: ^HICON,
		nIconSize: u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shdestroypropsheetextarray ]]
	SHDestroyPropSheetExtArray :: proc(hpsxa: HPSXA) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shdodragdrop ]]
	SHDoDragDrop :: proc(
		hwnd: HWND,
		pdata: ^IDataObject,
		pdsrc: ^IDropSource,
		dwEffect: DROPEFFECT,
		pdwEffect: ^DROPEFFECT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shell_getcachedimageindex ]]
	Shell_GetCachedImageIndex :: proc(pwszIconPath: PWSTR, iIconIndex: i32, uIconFlags: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shell_getcachedimageindexa ]]
	Shell_GetCachedImageIndexA :: proc(pszIconPath: PSTR, iIconIndex: i32, uIconFlags: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shell_getcachedimageindexw ]]
	Shell_GetCachedImageIndexW :: proc(pszIconPath: PWSTR, iIconIndex: i32, uIconFlags: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shell_getimagelists ]]
	Shell_GetImageLists :: proc(phiml: ^HIMAGELIST, phimlSmall: ^HIMAGELIST) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shell_mergemenus ]]
	Shell_MergeMenus :: proc(
		hmDst: HMENU,
		hmSrc: HMENU,
		uInsert: u32,
		uIDAdjust: u32,
		uIDAdjustMax: u32,
		uFlags: MM_FLAGS,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shell_notifyicona ]]
	Shell_NotifyIconA :: proc(dwMessage: NOTIFY_ICON_MESSAGE, lpData: ^NOTIFYICONDATAA) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shell_notifyicongetrect ]]
	Shell_NotifyIconGetRect :: proc(#by_ptr identifier: NOTIFYICONIDENTIFIER, iconLocation: ^RECT) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shell_notifyiconw ]]
	Shell_NotifyIconW :: proc(dwMessage: NOTIFY_ICON_MESSAGE, lpData: ^NOTIFYICONDATAW) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellabouta ]]
	ShellAboutA :: proc(hWnd: HWND, szApp: PSTR, szOtherStuff: PSTR, hIcon: HICON) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellaboutw ]]
	ShellAboutW :: proc(hWnd: HWND, szApp: PWSTR, szOtherStuff: PWSTR, hIcon: HICON) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellexecutea ]]
	ShellExecuteA :: proc(
		hwnd: HWND,
		lpOperation: PSTR,
		lpFile: PSTR,
		lpParameters: PSTR,
		lpDirectory: PSTR,
		nShowCmd: SHOW_WINDOW_CMD,
	) -> HINSTANCE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellexecuteexa ]]
	ShellExecuteExA :: proc(pExecInfo: ^SHELLEXECUTEINFOA) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellexecuteexw ]]
	ShellExecuteExW :: proc(pExecInfo: ^SHELLEXECUTEINFOW) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellexecutew ]]
	ShellExecuteW :: proc(
		hwnd: HWND,
		lpOperation: PWSTR,
		lpFile: PWSTR,
		lpParameters: PWSTR,
		lpDirectory: PWSTR,
		nShowCmd: SHOW_WINDOW_CMD,
	) -> HINSTANCE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shemptyrecyclebina ]]
	SHEmptyRecycleBinA :: proc(hwnd: HWND, pszRootPath: PSTR, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shemptyrecyclebinw ]]
	SHEmptyRecycleBinW :: proc(hwnd: HWND, pszRootPath: PWSTR, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shenumerateunreadmailaccountsw ]]
	SHEnumerateUnreadMailAccountsW :: proc(hKeyUser: HKEY, dwIndex: u32, pszMailAddress: PWSTR, cchMailAddress: i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shevaluatesystemcommandtemplate ]]
	SHEvaluateSystemCommandTemplate :: proc(
		pszCmdTemplate: PWSTR,
		ppszApplication: ^PWSTR,
		ppszCommandLine: ^PWSTR,
		ppszParameters: ^PWSTR,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shfileoperationa ]]
	SHFileOperationA :: proc(lpFileOp: ^SHFILEOPSTRUCTA) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shfileoperationw ]]
	SHFileOperationW :: proc(lpFileOp: ^SHFILEOPSTRUCTW) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shfind_initmenupopup ]]
	SHFind_InitMenuPopup :: proc(hmenu: HMENU, hwndOwner: HWND, idCmdFirst: u32, idCmdLast: u32) -> ^IContextMenu ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shfindfiles ]]
	SHFindFiles :: proc(pidlFolder: ^ITEMIDLIST, pidlSaveFile: ^ITEMIDLIST) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shflushsfcache ]]
	SHFlushSFCache :: proc() ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shformatdrive ]]
	SHFormatDrive :: proc(hwnd: HWND, drive: u32, fmtID: SHFMT_ID, options: SHFMT_OPT) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shfree ]]
	SHFree :: proc(pv: rawptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shfreenamemappings ]]
	SHFreeNameMappings :: proc(hNameMappings: HANDLE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetattributesfromdataobject ]]
	SHGetAttributesFromDataObject :: proc(pdo: ^IDataObject, dwAttributeMask: u32, pdwAttributes: ^u32, pcItems: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetdatafromidlista ]]
	SHGetDataFromIDListA :: proc(
		psf: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		nFormat: SHGDFIL_FORMAT,
		pv: rawptr,
		cb: i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetdatafromidlistw ]]
	SHGetDataFromIDListW :: proc(
		psf: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		nFormat: SHGDFIL_FORMAT,
		pv: rawptr,
		cb: i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetdesktopfolder ]]
	SHGetDesktopFolder :: proc(ppshf: ^^IShellFolder) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetdiskfreespaceexa ]]
	SHGetDiskFreeSpaceExA :: proc(
		pszDirectoryName: PSTR,
		pulFreeBytesAvailableToCaller: ^u64,
		pulTotalNumberOfBytes: ^u64,
		pulTotalNumberOfFreeBytes: ^u64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetdiskfreespaceexw ]]
	SHGetDiskFreeSpaceExW :: proc(
		pszDirectoryName: PWSTR,
		pulFreeBytesAvailableToCaller: ^u64,
		pulTotalNumberOfBytes: ^u64,
		pulTotalNumberOfFreeBytes: ^u64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetdrivemedia ]]
	SHGetDriveMedia :: proc(pszDrive: PWSTR, pdwMediaContent: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetfileinfoa ]]
	SHGetFileInfoA :: proc(
		pszPath: PSTR,
		dwFileAttributes: FILE_FLAGS_AND_ATTRIBUTES,
		psfi: ^SHFILEINFOA,
		cbFileInfo: u32,
		uFlags: SHGFI_FLAGS,
	) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetfileinfow ]]
	SHGetFileInfoW :: proc(
		pszPath: PWSTR,
		dwFileAttributes: FILE_FLAGS_AND_ATTRIBUTES,
		psfi: ^SHFILEINFOW,
		cbFileInfo: u32,
		uFlags: SHGFI_FLAGS,
	) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetfolderlocation ]]
	SHGetFolderLocation :: proc(hwnd: HWND, csidl: i32, hToken: HANDLE, dwFlags: u32, ppidl: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetfolderpatha ]]
	SHGetFolderPathA :: proc(hwnd: HWND, csidl: i32, hToken: HANDLE, dwFlags: u32, pszPath: PSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetfolderpathandsubdira ]]
	SHGetFolderPathAndSubDirA :: proc(hwnd: HWND, csidl: i32, hToken: HANDLE, dwFlags: u32, pszSubDir: PSTR, pszPath: PSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetfolderpathandsubdirw ]]
	SHGetFolderPathAndSubDirW :: proc(hwnd: HWND, csidl: i32, hToken: HANDLE, dwFlags: u32, pszSubDir: PWSTR, pszPath: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetfolderpathw ]]
	SHGetFolderPathW :: proc(hwnd: HWND, csidl: i32, hToken: HANDLE, dwFlags: u32, pszPath: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgeticonoverlayindexa ]]
	SHGetIconOverlayIndexA :: proc(pszIconPath: PSTR, iIconIndex: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgeticonoverlayindexw ]]
	SHGetIconOverlayIndexW :: proc(pszIconPath: PWSTR, iIconIndex: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shgetidlistfromobject ]]
	SHGetIDListFromObject :: proc(punk: ^IUnknown, ppidl: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetimagelist ]]
	SHGetImageList :: proc(iImageList: i32, #by_ptr riid: GUID, ppvObj: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetinstanceexplorer ]]
	SHGetInstanceExplorer :: proc(ppunk: ^^IUnknown) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shgetitemfromdataobject ]]
	SHGetItemFromDataObject :: proc(
		pdtobj: ^IDataObject,
		dwFlags: DATAOBJ_GET_ITEM_FLAGS,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shgetitemfromobject ]]
	SHGetItemFromObject :: proc(punk: ^IUnknown, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetknownfolderidlist ]]
	SHGetKnownFolderIDList :: proc(#by_ptr rfid: GUID, dwFlags: u32, hToken: HANDLE, ppidl: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetknownfolderitem ]]
	SHGetKnownFolderItem :: proc(
		#by_ptr rfid: GUID,
		flags: KNOWN_FOLDER_FLAG,
		hToken: HANDLE,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetknownfolderpath ]]
	SHGetKnownFolderPath :: proc(
		#by_ptr rfid: GUID,
		dwFlags: KNOWN_FOLDER_FLAG,
		hToken: HANDLE,
		ppszPath: ^PWSTR,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetlocalizedname ]]
	SHGetLocalizedName :: proc(pszPath: PWSTR, pszResModule: PWSTR, cch: u32, pidsRes: ^i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetmalloc ]]
	SHGetMalloc :: proc(ppMalloc: ^^IMalloc) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shgetnamefromidlist ]]
	SHGetNameFromIDList :: proc(pidl: ^ITEMIDLIST, sigdnName: SIGDN, ppszName: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetnewlinkinfoa ]]
	SHGetNewLinkInfoA :: proc(pszLinkTo: PSTR, pszDir: PSTR, pszName: PSTR, pfMustCopy: ^BOOL, uFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetnewlinkinfow ]]
	SHGetNewLinkInfoW :: proc(pszLinkTo: PWSTR, pszDir: PWSTR, pszName: PWSTR, pfMustCopy: ^BOOL, uFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetpathfromidlista ]]
	SHGetPathFromIDListA :: proc(pidl: ^ITEMIDLIST, pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetpathfromidlistex ]]
	SHGetPathFromIDListEx :: proc(pidl: ^ITEMIDLIST, pszPath: PWSTR, cchPath: u32, uOpts: GPFIDL_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetpathfromidlistw ]]
	SHGetPathFromIDListW :: proc(pidl: ^ITEMIDLIST, pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetrealidl ]]
	SHGetRealIDL :: proc(psf: ^IShellFolder, pidlSimple: ^ITEMIDLIST, ppidlReal: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetsetfoldercustomsettings ]]
	SHGetSetFolderCustomSettings :: proc(pfcs: ^SHFOLDERCUSTOMSETTINGS, pszPath: PWSTR, dwReadWrite: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetsetsettings ]]
	SHGetSetSettings :: proc(lpss: ^SHELLSTATEA, dwMask: SSF_MASK, bSet: BOOL) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetsettings ]]
	SHGetSettings :: proc(psfs: ^SHELLFLAGSTATE, dwMask: u32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetspecialfolderlocation ]]
	SHGetSpecialFolderLocation :: proc(hwnd: HWND, csidl: i32, ppidl: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetspecialfolderpatha ]]
	SHGetSpecialFolderPathA :: proc(hwnd: HWND, pszPath: PSTR, csidl: i32, fCreate: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shgetspecialfolderpathw ]]
	SHGetSpecialFolderPathW :: proc(hwnd: HWND, pszPath: PWSTR, csidl: i32, fCreate: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetstockiconinfo ]]
	SHGetStockIconInfo :: proc(siid: SHSTOCKICONID, uFlags: SHGSI_FLAGS, psii: ^SHSTOCKICONINFO) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shgettemporarypropertyforitem ]]
	SHGetTemporaryPropertyForItem :: proc(psi: ^IShellItem, #by_ptr propkey: PROPERTYKEY, ppropvar: ^PROPVARIANT) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shgetunreadmailcountw ]]
	SHGetUnreadMailCountW :: proc(
		hKeyUser: HKEY,
		pszMailAddress: PWSTR,
		pdwCount: ^u32,
		pFileTime: ^FILETIME,
		pszShellExecuteCommand: PWSTR,
		cchShellExecuteCommand: i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shhandleupdateimage ]]
	SHHandleUpdateImage :: proc(pidlExtra: ^ITEMIDLIST) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shilcreatefrompath ]]
	SHILCreateFromPath :: proc(pszPath: PWSTR, ppidl: ^ITEMIDLIST, rgfInOut: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shinvokeprintercommanda ]]
	SHInvokePrinterCommandA :: proc(hwnd: HWND, uAction: u32, lpBuf1: PSTR, lpBuf2: PSTR, fModal: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shinvokeprintercommandw ]]
	SHInvokePrinterCommandW :: proc(hwnd: HWND, uAction: u32, lpBuf1: PWSTR, lpBuf2: PWSTR, fModal: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shisfileavailableoffline ]]
	SHIsFileAvailableOffline :: proc(pwszPath: PWSTR, pdwStatus: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shlimitinputedit ]]
	SHLimitInputEdit :: proc(hwndEdit: HWND, psf: ^IShellFolder) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shloadinproc ]]
	SHLoadInProc :: proc(#by_ptr rclsid: GUID) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shloadnonloadediconoverlayidentifiers ]]
	SHLoadNonloadedIconOverlayIdentifiers :: proc() -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shmappidltosystemimagelistindex ]]
	SHMapPIDLToSystemImageListIndex :: proc(pshf: ^IShellFolder, pidl: ^ITEMIDLIST, piIndexSel: ^i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-shmultifileproperties ]]
	SHMultiFileProperties :: proc(pdtobj: ^IDataObject, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shobjectproperties ]]
	SHObjectProperties :: proc(
		hwnd: HWND,
		shopObjectType: SHOP_TYPE,
		pszObjectName: PWSTR,
		pszPropertyPage: PWSTR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shopenfolderandselectitems ]]
	SHOpenFolderAndSelectItems :: proc(pidlFolder: ^ITEMIDLIST, cidl: u32, apidl: [^]ITEMIDLIST, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-shopenpropsheetw ]]
	SHOpenPropSheetW :: proc(
		pszCaption: PWSTR,
		ahkeys: [^]HKEY,
		ckeys: u32,
		pclsidDefault: ^GUID,
		pdtobj: ^IDataObject,
		psb: ^IShellBrowser,
		pStartPage: PWSTR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shopenwithdialog ]]
	SHOpenWithDialog :: proc(hwndParent: HWND, #by_ptr poainfo: OPENASINFO) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shparsedisplayname ]]
	SHParseDisplayName :: proc(pszName: PWSTR, pbc: ^IBindCtx, ppidl: ^ITEMIDLIST, sfgaoIn: u32, psfgaoOut: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shpathprepareforwritea ]]
	SHPathPrepareForWriteA :: proc(hwnd: HWND, punkEnableModless: ^IUnknown, pszPath: PSTR, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shpathprepareforwritew ]]
	SHPathPrepareForWriteW :: proc(hwnd: HWND, punkEnableModless: ^IUnknown, pszPath: PWSTR, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shqueryrecyclebina ]]
	SHQueryRecycleBinA :: proc(pszRootPath: PSTR, pSHQueryRBInfo: ^SHQUERYRBINFO) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shqueryrecyclebinw ]]
	SHQueryRecycleBinW :: proc(pszRootPath: PWSTR, pSHQueryRBInfo: ^SHQUERYRBINFO) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shqueryusernotificationstate ]]
	SHQueryUserNotificationState :: proc(pquns: ^QUERY_USER_NOTIFICATION_STATE) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shremovelocalizedname ]]
	SHRemoveLocalizedName :: proc(pszPath: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shreplacefrompropsheetextarray ]]
	SHReplaceFromPropSheetExtArray :: proc(
		hpsxa: HPSXA,
		uPageID: u32,
		lpfnReplaceWith: LPFNSVADDPROPSHEETPAGE,
		lParam: LPARAM,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shresolvelibrary ]]
	SHResolveLibrary :: proc(psiLibrary: ^IShellItem) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shrestricted ]]
	SHRestricted :: proc(rest: RESTRICTIONS) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-shsetdefaultproperties ]]
	SHSetDefaultProperties :: proc(
		hwnd: HWND,
		psi: ^IShellItem,
		dwFileOpFlags: u32,
		pfops: ^IFileOperationProgressSink,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shsetfolderpatha ]]
	SHSetFolderPathA :: proc(csidl: i32, hToken: HANDLE, dwFlags: u32, pszPath: PSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shsetfolderpathw ]]
	SHSetFolderPathW :: proc(csidl: i32, hToken: HANDLE, dwFlags: u32, pszPath: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shsetinstanceexplorer ]]
	SHSetInstanceExplorer :: proc(punk: ^IUnknown) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shsetknownfolderpath ]]
	SHSetKnownFolderPath :: proc(#by_ptr rfid: GUID, dwFlags: u32, hToken: HANDLE, pszPath: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shsetlocalizedname ]]
	SHSetLocalizedName :: proc(pszPath: PWSTR, pszResModule: PWSTR, idsRes: i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shsettemporarypropertyforitem ]]
	SHSetTemporaryPropertyForItem :: proc(
		psi: ^IShellItem,
		#by_ptr propkey: PROPERTYKEY,
		#by_ptr propvar: PROPVARIANT,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shsetunreadmailcountw ]]
	SHSetUnreadMailCountW :: proc(pszMailAddress: PWSTR, dwCount: u32, pszShellExecuteCommand: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shshellfolderview_message ]]
	SHShellFolderView_Message :: proc(hwndMain: HWND, uMsg: u32, lParam: LPARAM) -> LRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shshowmanagelibraryui ]]
	SHShowManageLibraryUI :: proc(
		psiLibrary: ^IShellItem,
		hwndOwner: HWND,
		pszTitle: PWSTR,
		pszInstruction: PWSTR,
		lmdOptions: LIBRARYMANAGEDIALOGOPTIONS,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-shsimpleidlistfrompath ]]
	SHSimpleIDListFromPath :: proc(pszPath: PWSTR) -> ^ITEMIDLIST ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shstartnetconnectiondialogw ]]
	SHStartNetConnectionDialogW :: proc(hwnd: HWND, pszRemoteName: PWSTR, dwType: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shtesttokenmembership ]]
	SHTestTokenMembership :: proc(hToken: HANDLE, ulRID: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shupdateimagea ]]
	SHUpdateImageA :: proc(pszHashItem: PSTR, iIndex: i32, uFlags: u32, iImageIndex: i32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shupdateimagew ]]
	SHUpdateImageW :: proc(pszHashItem: PWSTR, iIndex: i32, uFlags: u32, iImageIndex: i32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-shvalidateunc ]]
	SHValidateUNC :: proc(hwndOwner: HWND, pszFile: PWSTR, fConnect: VALIDATEUNC_OPTION) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-signalfileopen ]]
	SignalFileOpen :: proc(pidl: ^ITEMIDLIST) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-stgmakeuniquename ]]
	StgMakeUniqueName :: proc(
		pstgParent: ^IStorage,
		pszFileSpec: PWSTR,
		grfMode: u32,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-win32deletefile ]]
	Win32DeleteFile :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nf-shlobj_core-writecabinetstate ]]
	WriteCabinetState :: proc(pcs: ^CABINETSTATE) -> BOOL ---
}

@(default_calling_convention="system")
foreign shlwapi {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-assoccreate ]]
	AssocCreate :: proc(clsid: GUID, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-assocgetperceivedtype ]]
	AssocGetPerceivedType :: proc(pszExt: PWSTR, ptype: ^PERCEIVED, pflag: ^u32, ppszType: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-associsdangerous ]]
	AssocIsDangerous :: proc(pszAssoc: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-assocquerykeya ]]
	AssocQueryKeyA :: proc(flags: ASSOCF, key: ASSOCKEY, pszAssoc: PSTR, pszExtra: PSTR, phkeyOut: ^HKEY) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-assocquerykeyw ]]
	AssocQueryKeyW :: proc(flags: ASSOCF, key: ASSOCKEY, pszAssoc: PWSTR, pszExtra: PWSTR, phkeyOut: ^HKEY) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-assocquerystringa ]]
	AssocQueryStringA :: proc(
		flags: ASSOCF,
		str: ASSOCSTR,
		pszAssoc: PSTR,
		pszExtra: PSTR,
		pszOut: PSTR,
		pcchOut: ^u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-assocquerystringbykeya ]]
	AssocQueryStringByKeyA :: proc(
		flags: ASSOCF,
		str: ASSOCSTR,
		hkAssoc: HKEY,
		pszExtra: PSTR,
		pszOut: PSTR,
		pcchOut: ^u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-assocquerystringbykeyw ]]
	AssocQueryStringByKeyW :: proc(
		flags: ASSOCF,
		str: ASSOCSTR,
		hkAssoc: HKEY,
		pszExtra: PWSTR,
		pszOut: PWSTR,
		pcchOut: ^u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-assocquerystringw ]]
	AssocQueryStringW :: proc(
		flags: ASSOCF,
		str: ASSOCSTR,
		pszAssoc: PWSTR,
		pszExtra: PWSTR,
		pszOut: PWSTR,
		pcchOut: ^u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-chrcmpia ]]
	ChrCmpIA :: proc(w1: u16, w2: u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-chrcmpiw ]]
	ChrCmpIW :: proc(w1: u16, w2: u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-coloradjustluma ]]
	ColorAdjustLuma :: proc(clrRGB: COLORREF, n: i32, fScale: BOOL) -> COLORREF ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-colorhlstorgb ]]
	ColorHLSToRGB :: proc(wHue: u16, wLuminance: u16, wSaturation: u16) -> COLORREF ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-colorrgbtohls ]]
	ColorRGBToHLS :: proc(clrRGB: COLORREF, pwHue: ^u16, pwLuminance: ^u16, pwSaturation: ^u16) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-connecttoconnectionpoint ]]
	ConnectToConnectionPoint :: proc(
		punk: ^IUnknown,
		#by_ptr riidEvent: GUID,
		fConnect: BOOL,
		punkTarget: ^IUnknown,
		pdwCookie: ^u32,
		ppcpOut: ^^IConnectionPoint,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-getacceptlanguagesa ]]
	GetAcceptLanguagesA :: proc(pszLanguages: PSTR, pcchLanguages: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-getacceptlanguagesw ]]
	GetAcceptLanguagesW :: proc(pszLanguages: PWSTR, pcchLanguages: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-getmenuposfromid ]]
	GetMenuPosFromID :: proc(hmenu: HMENU, id: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-hashdata ]]
	HashData :: proc(pbData: ^u8, cbData: u32, pbHash: ^u8, cbHash: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-intlstreqworkera ]]
	IntlStrEqWorkerA :: proc(fCaseSens: BOOL, lpString1: PSTR, lpString2: PSTR, nChar: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-intlstreqworkerw ]]
	IntlStrEqWorkerW :: proc(fCaseSens: BOOL, lpString1: PWSTR, lpString2: PWSTR, nChar: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-ischarspacea ]]
	IsCharSpaceA :: proc(wch: CHAR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-ischarspacew ]]
	IsCharSpaceW :: proc(wch: u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-isinternetescenabled ]]
	IsInternetESCEnabled :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-isos ]]
	IsOS :: proc(dwOS: OS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_copy ]]
	IStream_Copy :: proc(pstmFrom: ^IStream, pstmTo: ^IStream, cb: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_read ]]
	IStream_Read :: proc(pstm: ^IStream, pv: rawptr, cb: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_readpidl ]]
	IStream_ReadPidl :: proc(pstm: ^IStream, ppidlOut: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_readstr ]]
	IStream_ReadStr :: proc(pstm: ^IStream, ppsz: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_reset ]]
	IStream_Reset :: proc(pstm: ^IStream) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_size ]]
	IStream_Size :: proc(pstm: ^IStream, pui: ^u64) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_write ]]
	IStream_Write :: proc(pstm: ^IStream, pv: rawptr, cb: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_writepidl ]]
	IStream_WritePidl :: proc(pstm: ^IStream, pidlWrite: ^ITEMIDLIST) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-istream_writestr ]]
	IStream_WriteStr :: proc(pstm: ^IStream, psz: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iunknown_atomicrelease ]]
	IUnknown_AtomicRelease :: proc(ppunk: rawptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iunknown_getsite ]]
	IUnknown_GetSite :: proc(punk: ^IUnknown, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iunknown_getwindow ]]
	IUnknown_GetWindow :: proc(punk: ^IUnknown, phwnd: ^HWND) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iunknown_queryservice ]]
	IUnknown_QueryService :: proc(punk: ^IUnknown, #by_ptr guidService: GUID, #by_ptr riid: GUID, ppvOut: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iunknown_set ]]
	IUnknown_Set :: proc(ppunk: ^^IUnknown, punk: ^IUnknown) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-iunknown_setsite ]]
	IUnknown_SetSite :: proc(punk: ^IUnknown, punkSite: ^IUnknown) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-parseurla ]]
	ParseURLA :: proc(pcszURL: PSTR, ppu: ^PARSEDURLA) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-parseurlw ]]
	ParseURLW :: proc(pcszURL: PWSTR, ppu: ^PARSEDURLW) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathaddbackslasha ]]
	PathAddBackslashA :: proc(pszPath: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathaddbackslashw ]]
	PathAddBackslashW :: proc(pszPath: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathaddextensiona ]]
	PathAddExtensionA :: proc(pszPath: PSTR, pszExt: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathaddextensionw ]]
	PathAddExtensionW :: proc(pszPath: PWSTR, pszExt: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathappenda ]]
	PathAppendA :: proc(pszPath: PSTR, pszMore: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathappendw ]]
	PathAppendW :: proc(pszPath: PWSTR, pszMore: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathbuildroota ]]
	PathBuildRootA :: proc(pszRoot: PSTR, iDrive: i32) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathbuildrootw ]]
	PathBuildRootW :: proc(pszRoot: PWSTR, iDrive: i32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcanonicalizea ]]
	PathCanonicalizeA :: proc(pszBuf: PSTR, pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcanonicalizew ]]
	PathCanonicalizeW :: proc(pszBuf: PWSTR, pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcombinea ]]
	PathCombineA :: proc(pszDest: PSTR, pszDir: PSTR, pszFile: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcombinew ]]
	PathCombineW :: proc(pszDest: PWSTR, pszDir: PWSTR, pszFile: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcommonprefixa ]]
	PathCommonPrefixA :: proc(pszFile1: PSTR, pszFile2: PSTR, achPath: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcommonprefixw ]]
	PathCommonPrefixW :: proc(pszFile1: PWSTR, pszFile2: PWSTR, achPath: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcompactpatha ]]
	PathCompactPathA :: proc(hDC: HDC, pszPath: PSTR, dx: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcompactpathexa ]]
	PathCompactPathExA :: proc(pszOut: PSTR, pszSrc: PSTR, cchMax: u32, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcompactpathexw ]]
	PathCompactPathExW :: proc(pszOut: PWSTR, pszSrc: PWSTR, cchMax: u32, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcompactpathw ]]
	PathCompactPathW :: proc(hDC: HDC, pszPath: PWSTR, dx: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcreatefromurla ]]
	PathCreateFromUrlA :: proc(pszUrl: PSTR, pszPath: PSTR, pcchPath: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcreatefromurlalloc ]]
	PathCreateFromUrlAlloc :: proc(pszIn: PWSTR, ppszOut: ^PWSTR, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathcreatefromurlw ]]
	PathCreateFromUrlW :: proc(pszUrl: PWSTR, pszPath: PWSTR, pcchPath: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfileexistsa ]]
	PathFileExistsA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfileexistsw ]]
	PathFileExistsW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindextensiona ]]
	PathFindExtensionA :: proc(pszPath: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindextensionw ]]
	PathFindExtensionW :: proc(pszPath: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindfilenamea ]]
	PathFindFileNameA :: proc(pszPath: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindfilenamew ]]
	PathFindFileNameW :: proc(pszPath: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindnextcomponenta ]]
	PathFindNextComponentA :: proc(pszPath: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindnextcomponentw ]]
	PathFindNextComponentW :: proc(pszPath: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindonpatha ]]
	PathFindOnPathA :: proc(pszPath: PSTR, ppszOtherDirs: ^i8) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindonpathw ]]
	PathFindOnPathW :: proc(pszPath: PWSTR, ppszOtherDirs: ^u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindsuffixarraya ]]
	PathFindSuffixArrayA :: proc(pszPath: PSTR, apszSuffix: [^]PSTR, iArraySize: i32) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathfindsuffixarrayw ]]
	PathFindSuffixArrayW :: proc(pszPath: PWSTR, apszSuffix: [^]PWSTR, iArraySize: i32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathgetargsa ]]
	PathGetArgsA :: proc(pszPath: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathgetargsw ]]
	PathGetArgsW :: proc(pszPath: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathgetchartypea ]]
	PathGetCharTypeA :: proc(ch: u8) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathgetchartypew ]]
	PathGetCharTypeW :: proc(ch: u16) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathgetdrivenumbera ]]
	PathGetDriveNumberA :: proc(pszPath: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathgetdrivenumberw ]]
	PathGetDriveNumberW :: proc(pszPath: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathiscontenttypea ]]
	PathIsContentTypeA :: proc(pszPath: PSTR, pszContentType: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathiscontenttypew ]]
	PathIsContentTypeW :: proc(pszPath: PWSTR, pszContentType: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisdirectorya ]]
	PathIsDirectoryA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisdirectoryemptya ]]
	PathIsDirectoryEmptyA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisdirectoryemptyw ]]
	PathIsDirectoryEmptyW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisdirectoryw ]]
	PathIsDirectoryW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisfilespeca ]]
	PathIsFileSpecA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisfilespecw ]]
	PathIsFileSpecW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathislfnfilespeca ]]
	PathIsLFNFileSpecA :: proc(pszName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathislfnfilespecw ]]
	PathIsLFNFileSpecW :: proc(pszName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisnetworkpatha ]]
	PathIsNetworkPathA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisnetworkpathw ]]
	PathIsNetworkPathW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisprefixa ]]
	PathIsPrefixA :: proc(pszPrefix: PSTR, pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisprefixw ]]
	PathIsPrefixW :: proc(pszPrefix: PWSTR, pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisrelativea ]]
	PathIsRelativeA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisrelativew ]]
	PathIsRelativeW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisroota ]]
	PathIsRootA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisrootw ]]
	PathIsRootW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathissameroota ]]
	PathIsSameRootA :: proc(pszPath1: PSTR, pszPath2: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathissamerootw ]]
	PathIsSameRootW :: proc(pszPath1: PWSTR, pszPath2: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathissystemfoldera ]]
	PathIsSystemFolderA :: proc(pszPath: PSTR, dwAttrb: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathissystemfolderw ]]
	PathIsSystemFolderW :: proc(pszPath: PWSTR, dwAttrb: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisunca ]]
	PathIsUNCA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisuncservera ]]
	PathIsUNCServerA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisuncserversharea ]]
	PathIsUNCServerShareA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisuncserversharew ]]
	PathIsUNCServerShareW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisuncserverw ]]
	PathIsUNCServerW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisuncw ]]
	PathIsUNCW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisurla ]]
	PathIsURLA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathisurlw ]]
	PathIsURLW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathmakeprettya ]]
	PathMakePrettyA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathmakeprettyw ]]
	PathMakePrettyW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathmakesystemfoldera ]]
	PathMakeSystemFolderA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathmakesystemfolderw ]]
	PathMakeSystemFolderW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathmatchspeca ]]
	PathMatchSpecA :: proc(pszFile: PSTR, pszSpec: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathmatchspecexa ]]
	PathMatchSpecExA :: proc(pszFile: PSTR, pszSpec: PSTR, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathmatchspecexw ]]
	PathMatchSpecExW :: proc(pszFile: PWSTR, pszSpec: PWSTR, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathmatchspecw ]]
	PathMatchSpecW :: proc(pszFile: PWSTR, pszSpec: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathparseiconlocationa ]]
	PathParseIconLocationA :: proc(pszIconFile: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathparseiconlocationw ]]
	PathParseIconLocationW :: proc(pszIconFile: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathquotespacesa ]]
	PathQuoteSpacesA :: proc(lpsz: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathquotespacesw ]]
	PathQuoteSpacesW :: proc(lpsz: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathrelativepathtoa ]]
	PathRelativePathToA :: proc(pszPath: PSTR, pszFrom: PSTR, dwAttrFrom: u32, pszTo: PSTR, dwAttrTo: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathrelativepathtow ]]
	PathRelativePathToW :: proc(pszPath: PWSTR, pszFrom: PWSTR, dwAttrFrom: u32, pszTo: PWSTR, dwAttrTo: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremoveargsa ]]
	PathRemoveArgsA :: proc(pszPath: PSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremoveargsw ]]
	PathRemoveArgsW :: proc(pszPath: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremovebackslasha ]]
	PathRemoveBackslashA :: proc(pszPath: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremovebackslashw ]]
	PathRemoveBackslashW :: proc(pszPath: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremoveblanksa ]]
	PathRemoveBlanksA :: proc(pszPath: PSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremoveblanksw ]]
	PathRemoveBlanksW :: proc(pszPath: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremoveextensiona ]]
	PathRemoveExtensionA :: proc(pszPath: PSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremoveextensionw ]]
	PathRemoveExtensionW :: proc(pszPath: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremovefilespeca ]]
	PathRemoveFileSpecA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathremovefilespecw ]]
	PathRemoveFileSpecW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathrenameextensiona ]]
	PathRenameExtensionA :: proc(pszPath: PSTR, pszExt: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathrenameextensionw ]]
	PathRenameExtensionW :: proc(pszPath: PWSTR, pszExt: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathsearchandqualifya ]]
	PathSearchAndQualifyA :: proc(pszPath: PSTR, pszBuf: PSTR, cchBuf: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathsearchandqualifyw ]]
	PathSearchAndQualifyW :: proc(pszPath: PWSTR, pszBuf: PWSTR, cchBuf: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathsetdlgitempatha ]]
	PathSetDlgItemPathA :: proc(hDlg: HWND, id: i32, pszPath: PSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathsetdlgitempathw ]]
	PathSetDlgItemPathW :: proc(hDlg: HWND, id: i32, pszPath: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathskiproota ]]
	PathSkipRootA :: proc(pszPath: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathskiprootw ]]
	PathSkipRootW :: proc(pszPath: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathstrippatha ]]
	PathStripPathA :: proc(pszPath: PSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathstrippathw ]]
	PathStripPathW :: proc(pszPath: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathstriptoroota ]]
	PathStripToRootA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathstriptorootw ]]
	PathStripToRootW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathundecoratea ]]
	PathUndecorateA :: proc(pszPath: PSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathundecoratew ]]
	PathUndecorateW :: proc(pszPath: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathunexpandenvstringsa ]]
	PathUnExpandEnvStringsA :: proc(pszPath: PSTR, pszBuf: PSTR, cchBuf: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathunexpandenvstringsw ]]
	PathUnExpandEnvStringsW :: proc(pszPath: PWSTR, pszBuf: PWSTR, cchBuf: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathunmakesystemfoldera ]]
	PathUnmakeSystemFolderA :: proc(pszPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathunmakesystemfolderw ]]
	PathUnmakeSystemFolderW :: proc(pszPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathunquotespacesa ]]
	PathUnquoteSpacesA :: proc(lpsz: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-pathunquotespacesw ]]
	PathUnquoteSpacesW :: proc(lpsz: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-qisearch ]]
	QISearch :: proc(that: rawptr, pqit: ^QITAB, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shallocshared ]]
	SHAllocShared :: proc(pvData: rawptr, dwSize: u32, dwProcessId: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shansitoansi ]]
	SHAnsiToAnsi :: proc(pszSrc: PSTR, pszDst: PSTR, cchBuf: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shansitounicode ]]
	SHAnsiToUnicode :: proc(pszSrc: PSTR, pwszDst: PWSTR, cwchBuf: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shautocomplete ]]
	SHAutoComplete :: proc(hwndEdit: HWND, dwFlags: SHELL_AUTOCOMPLETE_FLAGS) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcopykeya ]]
	SHCopyKeyA :: proc(hkeySrc: HKEY, pszSrcSubKey: PSTR, hkeyDest: HKEY, fReserved: u32) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcopykeyw ]]
	SHCopyKeyW :: proc(hkeySrc: HKEY, pszSrcSubKey: PWSTR, hkeyDest: HKEY, fReserved: u32) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcreatememstream ]]
	SHCreateMemStream :: proc(pInit: ^u8, cbInit: u32) -> ^IStream ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcreateshellpalette ]]
	SHCreateShellPalette :: proc(hdc: HDC) -> HPALETTE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcreatestreamonfilea ]]
	SHCreateStreamOnFileA :: proc(pszFile: PSTR, grfMode: u32, ppstm: ^^IStream) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcreatestreamonfileex ]]
	SHCreateStreamOnFileEx :: proc(
		pszFile: PWSTR,
		grfMode: u32,
		dwAttributes: u32,
		fCreate: BOOL,
		pstmTemplate: ^IStream,
		ppstm: ^^IStream,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcreatestreamonfilew ]]
	SHCreateStreamOnFileW :: proc(pszFile: PWSTR, grfMode: u32, ppstm: ^^IStream) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcreatethread ]]
	SHCreateThread :: proc(
		pfnThreadProc: LPTHREAD_START_ROUTINE,
		pData: rawptr,
		flags: u32,
		pfnCallback: LPTHREAD_START_ROUTINE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcreatethreadref ]]
	SHCreateThreadRef :: proc(pcRef: ^i32, ppunk: ^^IUnknown) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shcreatethreadwithhandle ]]
	SHCreateThreadWithHandle :: proc(
		pfnThreadProc: LPTHREAD_START_ROUTINE,
		pData: rawptr,
		flags: u32,
		pfnCallback: LPTHREAD_START_ROUTINE,
		pHandle: ^HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shdeleteemptykeya ]]
	SHDeleteEmptyKeyA :: proc(hkey: HKEY, pszSubKey: PSTR) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shdeleteemptykeyw ]]
	SHDeleteEmptyKeyW :: proc(hkey: HKEY, pszSubKey: PWSTR) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shdeletekeya ]]
	SHDeleteKeyA :: proc(hkey: HKEY, pszSubKey: PSTR) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shdeletekeyw ]]
	SHDeleteKeyW :: proc(hkey: HKEY, pszSubKey: PWSTR) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shdeletevaluea ]]
	SHDeleteValueA :: proc(hkey: HKEY, pszSubKey: PSTR, pszValue: PSTR) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shdeletevaluew ]]
	SHDeleteValueW :: proc(hkey: HKEY, pszSubKey: PWSTR, pszValue: PWSTR) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellmessageboxa ]]
	ShellMessageBoxA :: proc(
		hAppInst: HINSTANCE,
		hWnd: HWND,
		lpcText: PSTR,
		lpcTitle: PSTR,
		fuStyle: MESSAGEBOX_STYLE,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/nf-shellapi-shellmessageboxw ]]
	ShellMessageBoxW :: proc(
		hAppInst: HINSTANCE,
		hWnd: HWND,
		lpcText: PWSTR,
		lpcTitle: PWSTR,
		fuStyle: MESSAGEBOX_STYLE,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shenumkeyexa ]]
	SHEnumKeyExA :: proc(hkey: HKEY, dwIndex: u32, pszName: PSTR, pcchName: ^u32) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shenumkeyexw ]]
	SHEnumKeyExW :: proc(hkey: HKEY, dwIndex: u32, pszName: PWSTR, pcchName: ^u32) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shenumvaluea ]]
	SHEnumValueA :: proc(
		hkey: HKEY,
		dwIndex: u32,
		pszValueName: PSTR,
		pcchValueName: ^u32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shenumvaluew ]]
	SHEnumValueW :: proc(
		hkey: HKEY,
		dwIndex: u32,
		pszValueName: PWSTR,
		pcchValueName: ^u32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shformatdatetimea ]]
	SHFormatDateTimeA :: proc(#by_ptr pft: FILETIME, pdwFlags: ^u32, pszBuf: PSTR, cchBuf: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shformatdatetimew ]]
	SHFormatDateTimeW :: proc(#by_ptr pft: FILETIME, pdwFlags: ^u32, pszBuf: PWSTR, cchBuf: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shfreeshared ]]
	SHFreeShared :: proc(hData: HANDLE, dwProcessId: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shgetinversecmap ]]
	SHGetInverseCMAP :: proc(pbMap: ^u8, cbMap: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shgetthreadref ]]
	SHGetThreadRef :: proc(ppunk: ^^IUnknown) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shgetvaluea ]]
	SHGetValueA :: proc(
		hkey: HKEY,
		pszSubKey: PSTR,
		pszValue: PSTR,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shgetvaluew ]]
	SHGetValueW :: proc(
		hkey: HKEY,
		pszSubKey: PWSTR,
		pszValue: PWSTR,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shgetviewstatepropertybag ]]
	SHGetViewStatePropertyBag :: proc(
		pidl: ^ITEMIDLIST,
		pszBagName: PWSTR,
		dwFlags: u32,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shglobalcounterdecrement ]]
	SHGlobalCounterDecrement :: proc(id: SHGLOBALCOUNTER) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shglobalcountergetvalue ]]
	SHGlobalCounterGetValue :: proc(id: SHGLOBALCOUNTER) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shglobalcounterincrement ]]
	SHGlobalCounterIncrement :: proc(id: SHGLOBALCOUNTER) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shislowmemorymachine ]]
	SHIsLowMemoryMachine :: proc(dwType: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shloadindirectstring ]]
	SHLoadIndirectString :: proc(pszSource: PWSTR, pszOutBuf: PWSTR, cchOutBuf: u32, ppvReserved: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shlockshared ]]
	SHLockShared :: proc(hData: HANDLE, dwProcessId: u32) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shmessageboxchecka ]]
	SHMessageBoxCheckA :: proc(hwnd: HWND, pszText: PSTR, pszCaption: PSTR, uType: u32, iDefault: i32, pszRegVal: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shmessageboxcheckw ]]
	SHMessageBoxCheckW :: proc(
		hwnd: HWND,
		pszText: PWSTR,
		pszCaption: PWSTR,
		uType: u32,
		iDefault: i32,
		pszRegVal: PWSTR,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shopenregstream2a ]]
	SHOpenRegStream2A :: proc(hkey: HKEY, pszSubkey: PSTR, pszValue: PSTR, grfMode: u32) -> ^IStream ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shopenregstream2w ]]
	SHOpenRegStream2W :: proc(hkey: HKEY, pszSubkey: PWSTR, pszValue: PWSTR, grfMode: u32) -> ^IStream ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shopenregstreama ]]
	SHOpenRegStreamA :: proc(hkey: HKEY, pszSubkey: PSTR, pszValue: PSTR, grfMode: u32) -> ^IStream ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shopenregstreamw ]]
	SHOpenRegStreamW :: proc(hkey: HKEY, pszSubkey: PWSTR, pszValue: PWSTR, grfMode: u32) -> ^IStream ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shqueryinfokeya ]]
	SHQueryInfoKeyA :: proc(
		hkey: HKEY,
		pcSubKeys: ^u32,
		pcchMaxSubKeyLen: ^u32,
		pcValues: ^u32,
		pcchMaxValueNameLen: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shqueryinfokeyw ]]
	SHQueryInfoKeyW :: proc(
		hkey: HKEY,
		pcSubKeys: ^u32,
		pcchMaxSubKeyLen: ^u32,
		pcValues: ^u32,
		pcchMaxValueNameLen: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shqueryvalueexa ]]
	SHQueryValueExA :: proc(
		hkey: HKEY,
		pszValue: PSTR,
		pdwReserved: ^u32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shqueryvalueexw ]]
	SHQueryValueExW :: proc(
		hkey: HKEY,
		pszValue: PWSTR,
		pdwReserved: ^u32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregcloseuskey ]]
	SHRegCloseUSKey :: proc(hUSKey: int) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregcreateuskeya ]]
	SHRegCreateUSKeyA :: proc(
		pszPath: PSTR,
		samDesired: u32,
		hRelativeUSKey: int,
		phNewUSKey: ^int,
		dwFlags: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregcreateuskeyw ]]
	SHRegCreateUSKeyW :: proc(
		pwzPath: PWSTR,
		samDesired: u32,
		hRelativeUSKey: int,
		phNewUSKey: ^int,
		dwFlags: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregdeleteemptyuskeya ]]
	SHRegDeleteEmptyUSKeyA :: proc(hUSKey: int, pszSubKey: PSTR, delRegFlags: SHREGDEL_FLAGS) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregdeleteemptyuskeyw ]]
	SHRegDeleteEmptyUSKeyW :: proc(hUSKey: int, pwzSubKey: PWSTR, delRegFlags: SHREGDEL_FLAGS) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregdeleteusvaluea ]]
	SHRegDeleteUSValueA :: proc(hUSKey: int, pszValue: PSTR, delRegFlags: SHREGDEL_FLAGS) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregdeleteusvaluew ]]
	SHRegDeleteUSValueW :: proc(hUSKey: int, pwzValue: PWSTR, delRegFlags: SHREGDEL_FLAGS) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregduplicatehkey ]]
	SHRegDuplicateHKey :: proc(hkey: HKEY) -> HKEY ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregenumuskeya ]]
	SHRegEnumUSKeyA :: proc(
		hUSKey: int,
		dwIndex: u32,
		pszName: PSTR,
		pcchName: ^u32,
		enumRegFlags: SHREGENUM_FLAGS,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregenumuskeyw ]]
	SHRegEnumUSKeyW :: proc(
		hUSKey: int,
		dwIndex: u32,
		pwzName: PWSTR,
		pcchName: ^u32,
		enumRegFlags: SHREGENUM_FLAGS,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregenumusvaluea ]]
	SHRegEnumUSValueA :: proc(
		hUSkey: int,
		dwIndex: u32,
		pszValueName: PSTR,
		pcchValueName: ^u32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
		enumRegFlags: SHREGENUM_FLAGS,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregenumusvaluew ]]
	SHRegEnumUSValueW :: proc(
		hUSkey: int,
		dwIndex: u32,
		pszValueName: PWSTR,
		pcchValueName: ^u32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
		enumRegFlags: SHREGENUM_FLAGS,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetboolusvaluea ]]
	SHRegGetBoolUSValueA :: proc(pszSubKey: PSTR, pszValue: PSTR, fIgnoreHKCU: BOOL, fDefault: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetboolusvaluew ]]
	SHRegGetBoolUSValueW :: proc(pszSubKey: PWSTR, pszValue: PWSTR, fIgnoreHKCU: BOOL, fDefault: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetintw ]]
	SHRegGetIntW :: proc(hk: HKEY, pwzKey: PWSTR, iDefault: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetpatha ]]
	SHRegGetPathA :: proc(hKey: HKEY, pcszSubKey: PSTR, pcszValue: PSTR, pszPath: PSTR, dwFlags: u32) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetpathw ]]
	SHRegGetPathW :: proc(hKey: HKEY, pcszSubKey: PWSTR, pcszValue: PWSTR, pszPath: PWSTR, dwFlags: u32) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetusvaluea ]]
	SHRegGetUSValueA :: proc(
		pszSubKey: PSTR,
		pszValue: PSTR,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
		fIgnoreHKCU: BOOL,
		pvDefaultData: rawptr,
		dwDefaultDataSize: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetusvaluew ]]
	SHRegGetUSValueW :: proc(
		pszSubKey: PWSTR,
		pszValue: PWSTR,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
		fIgnoreHKCU: BOOL,
		pvDefaultData: rawptr,
		dwDefaultDataSize: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetvaluea ]]
	SHRegGetValueA :: proc(
		hkey: HKEY,
		pszSubKey: PSTR,
		pszValue: PSTR,
		srrfFlags: i32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetvaluefromhkcuhklm ]]
	SHRegGetValueFromHKCUHKLM :: proc(
		pwszKey: PWSTR,
		pwszValue: PWSTR,
		srrfFlags: i32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreggetvaluew ]]
	SHRegGetValueW :: proc(
		hkey: HKEY,
		pszSubKey: PWSTR,
		pszValue: PWSTR,
		srrfFlags: i32,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregopenuskeya ]]
	SHRegOpenUSKeyA :: proc(
		pszPath: PSTR,
		samDesired: u32,
		hRelativeUSKey: int,
		phNewUSKey: ^int,
		fIgnoreHKCU: BOOL,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregopenuskeyw ]]
	SHRegOpenUSKeyW :: proc(
		pwzPath: PWSTR,
		samDesired: u32,
		hRelativeUSKey: int,
		phNewUSKey: ^int,
		fIgnoreHKCU: BOOL,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregqueryinfouskeya ]]
	SHRegQueryInfoUSKeyA :: proc(
		hUSKey: int,
		pcSubKeys: ^u32,
		pcchMaxSubKeyLen: ^u32,
		pcValues: ^u32,
		pcchMaxValueNameLen: ^u32,
		enumRegFlags: SHREGENUM_FLAGS,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregqueryinfouskeyw ]]
	SHRegQueryInfoUSKeyW :: proc(
		hUSKey: int,
		pcSubKeys: ^u32,
		pcchMaxSubKeyLen: ^u32,
		pcValues: ^u32,
		pcchMaxValueNameLen: ^u32,
		enumRegFlags: SHREGENUM_FLAGS,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregqueryusvaluea ]]
	SHRegQueryUSValueA :: proc(
		hUSKey: int,
		pszValue: PSTR,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
		fIgnoreHKCU: BOOL,
		pvDefaultData: rawptr,
		dwDefaultDataSize: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregqueryusvaluew ]]
	SHRegQueryUSValueW :: proc(
		hUSKey: int,
		pszValue: PWSTR,
		pdwType: ^u32,
		pvData: rawptr,
		pcbData: ^u32,
		fIgnoreHKCU: BOOL,
		pvDefaultData: rawptr,
		dwDefaultDataSize: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregsetpatha ]]
	SHRegSetPathA :: proc(hKey: HKEY, pcszSubKey: PSTR, pcszValue: PSTR, pcszPath: PSTR, dwFlags: u32) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregsetpathw ]]
	SHRegSetPathW :: proc(hKey: HKEY, pcszSubKey: PWSTR, pcszValue: PWSTR, pcszPath: PWSTR, dwFlags: u32) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregsetusvaluea ]]
	SHRegSetUSValueA :: proc(
		pszSubKey: PSTR,
		pszValue: PSTR,
		dwType: u32,
		pvData: rawptr,
		cbData: u32,
		dwFlags: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregsetusvaluew ]]
	SHRegSetUSValueW :: proc(
		pwzSubKey: PWSTR,
		pwzValue: PWSTR,
		dwType: u32,
		pvData: rawptr,
		cbData: u32,
		dwFlags: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregwriteusvaluea ]]
	SHRegWriteUSValueA :: proc(
		hUSKey: int,
		pszValue: PSTR,
		dwType: u32,
		pvData: rawptr,
		cbData: u32,
		dwFlags: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shregwriteusvaluew ]]
	SHRegWriteUSValueW :: proc(
		hUSKey: int,
		pwzValue: PWSTR,
		dwType: u32,
		pvData: rawptr,
		cbData: u32,
		dwFlags: u32,
	) -> WIN32_ERROR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shreleasethreadref ]]
	SHReleaseThreadRef :: proc() -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shsendmessagebroadcasta ]]
	SHSendMessageBroadcastA :: proc(uMsg: u32, wParam: WPARAM, lParam: LPARAM) -> LRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shsendmessagebroadcastw ]]
	SHSendMessageBroadcastW :: proc(uMsg: u32, wParam: WPARAM, lParam: LPARAM) -> LRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shsetthreadref ]]
	SHSetThreadRef :: proc(punk: ^IUnknown) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shsetvaluea ]]
	SHSetValueA :: proc(hkey: HKEY, pszSubKey: PSTR, pszValue: PSTR, dwType: u32, pvData: rawptr, cbData: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shsetvaluew ]]
	SHSetValueW :: proc(hkey: HKEY, pszSubKey: PWSTR, pszValue: PWSTR, dwType: u32, pvData: rawptr, cbData: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shskipjunction ]]
	SHSkipJunction :: proc(pbc: ^IBindCtx, #by_ptr pclsid: GUID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shstrdupa ]]
	SHStrDupA :: proc(psz: PSTR, ppwsz: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shstrdupw ]]
	SHStrDupW :: proc(psz: PWSTR, ppwsz: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shstripmneumonica ]]
	SHStripMneumonicA :: proc(pszMenu: PSTR) -> CHAR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shstripmneumonicw ]]
	SHStripMneumonicW :: proc(pszMenu: PWSTR) -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shunicodetoansi ]]
	SHUnicodeToAnsi :: proc(pwszSrc: PWSTR, pszDst: PSTR, cchBuf: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shunicodetounicode ]]
	SHUnicodeToUnicode :: proc(pwzSrc: PWSTR, pwzDst: PWSTR, cwchBuf: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-shunlockshared ]]
	SHUnlockShared :: proc(pvData: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcatbuffa ]]
	StrCatBuffA :: proc(pszDest: PSTR, pszSrc: PSTR, cchDestBuffSize: i32) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcatbuffw ]]
	StrCatBuffW :: proc(pszDest: PWSTR, pszSrc: PWSTR, cchDestBuffSize: i32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcatchainw ]]
	StrCatChainW :: proc(pszDst: PWSTR, cchDst: u32, ichAt: u32, pszSrc: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcatw ]]
	StrCatW :: proc(psz1: PWSTR, psz2: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strchra ]]
	StrChrA :: proc(pszStart: PSTR, wMatch: u16) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strchria ]]
	StrChrIA :: proc(pszStart: PSTR, wMatch: u16) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strchriw ]]
	StrChrIW :: proc(pszStart: PWSTR, wMatch: u16) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strchrniw ]]
	StrChrNIW :: proc(pszStart: PWSTR, wMatch: u16, cchMax: u32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strchrnw ]]
	StrChrNW :: proc(pszStart: PWSTR, wMatch: u16, cchMax: u32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strchrw ]]
	StrChrW :: proc(pszStart: PWSTR, wMatch: u16) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpca ]]
	StrCmpCA :: proc(pszStr1: PSTR, pszStr2: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpcw ]]
	StrCmpCW :: proc(pszStr1: PWSTR, pszStr2: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpica ]]
	StrCmpICA :: proc(pszStr1: PSTR, pszStr2: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpicw ]]
	StrCmpICW :: proc(pszStr1: PWSTR, pszStr2: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpiw ]]
	StrCmpIW :: proc(psz1: PWSTR, psz2: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmplogicalw ]]
	StrCmpLogicalW :: proc(psz1: PWSTR, psz2: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpna ]]
	StrCmpNA :: proc(psz1: PSTR, psz2: PSTR, nChar: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpnca ]]
	StrCmpNCA :: proc(pszStr1: PSTR, pszStr2: PSTR, nChar: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpncw ]]
	StrCmpNCW :: proc(pszStr1: PWSTR, pszStr2: PWSTR, nChar: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpnia ]]
	StrCmpNIA :: proc(psz1: PSTR, psz2: PSTR, nChar: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpnica ]]
	StrCmpNICA :: proc(pszStr1: PSTR, pszStr2: PSTR, nChar: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpnicw ]]
	StrCmpNICW :: proc(pszStr1: PWSTR, pszStr2: PWSTR, nChar: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpniw ]]
	StrCmpNIW :: proc(psz1: PWSTR, psz2: PWSTR, nChar: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpnw ]]
	StrCmpNW :: proc(psz1: PWSTR, psz2: PWSTR, nChar: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcmpw ]]
	StrCmpW :: proc(psz1: PWSTR, psz2: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcpynw ]]
	StrCpyNW :: proc(pszDst: PWSTR, pszSrc: PWSTR, cchMax: i32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcpyw ]]
	StrCpyW :: proc(psz1: PWSTR, psz2: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcspna ]]
	StrCSpnA :: proc(pszStr: PSTR, pszSet: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcspnia ]]
	StrCSpnIA :: proc(pszStr: PSTR, pszSet: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcspniw ]]
	StrCSpnIW :: proc(pszStr: PWSTR, pszSet: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strcspnw ]]
	StrCSpnW :: proc(pszStr: PWSTR, pszSet: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strdupa ]]
	StrDupA :: proc(pszSrch: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strdupw ]]
	StrDupW :: proc(pszSrch: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strformatbytesize64a ]]
	StrFormatByteSize64A :: proc(qdw: i64, pszBuf: PSTR, cchBuf: u32) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strformatbytesizea ]]
	StrFormatByteSizeA :: proc(dw: u32, pszBuf: PSTR, cchBuf: u32) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strformatbytesizeex ]]
	StrFormatByteSizeEx :: proc(ull: u64, flags: SFBS_FLAGS, pszBuf: PWSTR, cchBuf: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strformatbytesizew ]]
	StrFormatByteSizeW :: proc(qdw: i64, pszBuf: PWSTR, cchBuf: u32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strformatkbsizea ]]
	StrFormatKBSizeA :: proc(qdw: i64, pszBuf: PSTR, cchBuf: u32) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strformatkbsizew ]]
	StrFormatKBSizeW :: proc(qdw: i64, pszBuf: PWSTR, cchBuf: u32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strfromtimeintervala ]]
	StrFromTimeIntervalA :: proc(pszOut: PSTR, cchMax: u32, dwTimeMS: u32, digits: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strfromtimeintervalw ]]
	StrFromTimeIntervalW :: proc(pszOut: PWSTR, cchMax: u32, dwTimeMS: u32, digits: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strisintlequala ]]
	StrIsIntlEqualA :: proc(fCaseSens: BOOL, pszString1: PSTR, pszString2: PSTR, nChar: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strisintlequalw ]]
	StrIsIntlEqualW :: proc(fCaseSens: BOOL, pszString1: PWSTR, pszString2: PWSTR, nChar: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strncata ]]
	StrNCatA :: proc(psz1: PSTR, psz2: PSTR, cchMax: i32) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strncatw ]]
	StrNCatW :: proc(psz1: PWSTR, psz2: PWSTR, cchMax: i32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strpbrka ]]
	StrPBrkA :: proc(psz: PSTR, pszSet: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strpbrkw ]]
	StrPBrkW :: proc(psz: PWSTR, pszSet: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrchra ]]
	StrRChrA :: proc(pszStart: PSTR, pszEnd: PSTR, wMatch: u16) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrchria ]]
	StrRChrIA :: proc(pszStart: PSTR, pszEnd: PSTR, wMatch: u16) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrchriw ]]
	StrRChrIW :: proc(pszStart: PWSTR, pszEnd: PWSTR, wMatch: u16) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrchrw ]]
	StrRChrW :: proc(pszStart: PWSTR, pszEnd: PWSTR, wMatch: u16) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrettobstr ]]
	StrRetToBSTR :: proc(pstr: ^STRRET, pidl: ^ITEMIDLIST, pbstr: ^BSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrettobufa ]]
	StrRetToBufA :: proc(pstr: ^STRRET, pidl: ^ITEMIDLIST, pszBuf: PSTR, cchBuf: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrettobufw ]]
	StrRetToBufW :: proc(pstr: ^STRRET, pidl: ^ITEMIDLIST, pszBuf: PWSTR, cchBuf: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrettostra ]]
	StrRetToStrA :: proc(pstr: ^STRRET, pidl: ^ITEMIDLIST, ppsz: ^PSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrettostrw ]]
	StrRetToStrW :: proc(pstr: ^STRRET, pidl: ^ITEMIDLIST, ppsz: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrstria ]]
	StrRStrIA :: proc(pszSource: PSTR, pszLast: PSTR, pszSrch: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strrstriw ]]
	StrRStrIW :: proc(pszSource: PWSTR, pszLast: PWSTR, pszSrch: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strspna ]]
	StrSpnA :: proc(psz: PSTR, pszSet: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strspnw ]]
	StrSpnW :: proc(psz: PWSTR, pszSet: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strstra ]]
	StrStrA :: proc(pszFirst: PSTR, pszSrch: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strstria ]]
	StrStrIA :: proc(pszFirst: PSTR, pszSrch: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strstriw ]]
	StrStrIW :: proc(pszFirst: PWSTR, pszSrch: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strstrniw ]]
	StrStrNIW :: proc(pszFirst: PWSTR, pszSrch: PWSTR, cchMax: u32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strstrnw ]]
	StrStrNW :: proc(pszFirst: PWSTR, pszSrch: PWSTR, cchMax: u32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strstrw ]]
	StrStrW :: proc(pszFirst: PWSTR, pszSrch: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strtoint64exa ]]
	StrToInt64ExA :: proc(pszString: PSTR, dwFlags: i32, pllRet: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strtoint64exw ]]
	StrToInt64ExW :: proc(pszString: PWSTR, dwFlags: i32, pllRet: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strtointa ]]
	StrToIntA :: proc(pszSrc: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strtointexa ]]
	StrToIntExA :: proc(pszString: PSTR, dwFlags: i32, piRet: ^i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strtointexw ]]
	StrToIntExW :: proc(pszString: PWSTR, dwFlags: i32, piRet: ^i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strtointw ]]
	StrToIntW :: proc(pszSrc: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strtrima ]]
	StrTrimA :: proc(psz: PSTR, pszTrimChars: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-strtrimw ]]
	StrTrimW :: proc(psz: PWSTR, pszTrimChars: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlapplyschemea ]]
	UrlApplySchemeA :: proc(pszIn: PSTR, pszOut: PSTR, pcchOut: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlapplyschemew ]]
	UrlApplySchemeW :: proc(pszIn: PWSTR, pszOut: PWSTR, pcchOut: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlcanonicalizea ]]
	UrlCanonicalizeA :: proc(pszUrl: PSTR, pszCanonicalized: PSTR, pcchCanonicalized: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlcanonicalizew ]]
	UrlCanonicalizeW :: proc(pszUrl: PWSTR, pszCanonicalized: PWSTR, pcchCanonicalized: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlcombinea ]]
	UrlCombineA :: proc(
		pszBase: PSTR,
		pszRelative: PSTR,
		pszCombined: PSTR,
		pcchCombined: ^u32,
		dwFlags: u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlcombinew ]]
	UrlCombineW :: proc(
		pszBase: PWSTR,
		pszRelative: PWSTR,
		pszCombined: PWSTR,
		pcchCombined: ^u32,
		dwFlags: u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlcomparea ]]
	UrlCompareA :: proc(psz1: PSTR, psz2: PSTR, fIgnoreSlash: BOOL) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlcomparew ]]
	UrlCompareW :: proc(psz1: PWSTR, psz2: PWSTR, fIgnoreSlash: BOOL) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlcreatefrompatha ]]
	UrlCreateFromPathA :: proc(pszPath: PSTR, pszUrl: PSTR, pcchUrl: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlcreatefrompathw ]]
	UrlCreateFromPathW :: proc(pszPath: PWSTR, pszUrl: PWSTR, pcchUrl: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlescapea ]]
	UrlEscapeA :: proc(pszUrl: PSTR, pszEscaped: PSTR, pcchEscaped: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlescapew ]]
	UrlEscapeW :: proc(pszUrl: PWSTR, pszEscaped: PWSTR, pcchEscaped: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlfixupw ]]
	UrlFixupW :: proc(pcszUrl: PWSTR, pszTranslatedUrl: PWSTR, cchMax: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlgetlocationa ]]
	UrlGetLocationA :: proc(pszURL: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlgetlocationw ]]
	UrlGetLocationW :: proc(pszURL: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlgetparta ]]
	UrlGetPartA :: proc(pszIn: PSTR, pszOut: PSTR, pcchOut: ^u32, dwPart: u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlgetpartw ]]
	UrlGetPartW :: proc(pszIn: PWSTR, pszOut: PWSTR, pcchOut: ^u32, dwPart: u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlhasha ]]
	UrlHashA :: proc(pszUrl: PSTR, pbHash: ^u8, cbHash: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlhashw ]]
	UrlHashW :: proc(pszUrl: PWSTR, pbHash: ^u8, cbHash: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlisa ]]
	UrlIsA :: proc(pszUrl: PSTR, UrlIs: URLIS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlisnohistorya ]]
	UrlIsNoHistoryA :: proc(pszURL: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlisnohistoryw ]]
	UrlIsNoHistoryW :: proc(pszURL: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlisopaquea ]]
	UrlIsOpaqueA :: proc(pszURL: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlisopaquew ]]
	UrlIsOpaqueW :: proc(pszURL: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlisw ]]
	UrlIsW :: proc(pszUrl: PWSTR, UrlIs: URLIS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlunescapea ]]
	UrlUnescapeA :: proc(pszUrl: PSTR, pszUnescaped: PSTR, pcchUnescaped: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-urlunescapew ]]
	UrlUnescapeW :: proc(pszUrl: PWSTR, pszUnescaped: PWSTR, pcchUnescaped: ^u32, dwFlags: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-whichplatform ]]
	WhichPlatform :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-wnsprintfa ]]
	wnsprintfA :: proc(pszDest: PSTR, cchDest: i32, pszFmt: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-wnsprintfw ]]
	wnsprintfW :: proc(pszDest: PWSTR, cchDest: i32, pszFmt: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-wvnsprintfa ]]
	wvnsprintfA :: proc(pszDest: PSTR, cchDest: i32, pszFmt: PSTR, arglist: ^i8) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nf-shlwapi-wvnsprintfw ]]
	wvnsprintfW :: proc(pszDest: PWSTR, cchDest: i32, pszFmt: PWSTR, arglist: ^i8) -> i32 ---
}

@(default_calling_convention="system")
foreign user32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getmenucontexthelpid ]]
	GetMenuContextHelpId :: proc(param0: HMENU) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getwindowcontexthelpid ]]
	GetWindowContextHelpId :: proc(param0: HWND) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setmenucontexthelpid ]]
	SetMenuContextHelpId :: proc(param0: HMENU, param1: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setwindowcontexthelpid ]]
	SetWindowContextHelpId :: proc(param0: HWND, param1: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-winhelpa ]]
	WinHelpA :: proc(hWndMain: HWND, lpszHelp: PSTR, uCommand: u32, dwData: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-winhelpw ]]
	WinHelpW :: proc(hWndMain: HWND, lpszHelp: PWSTR, uCommand: u32, dwData: uintptr) -> BOOL ---
}

@(default_calling_convention="system")
foreign userenv {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-createprofile ]]
	CreateProfile :: proc(
		pszUserSid: PWSTR,
		pszUserName: PWSTR,
		pszProfilePath: PWSTR,
		cchProfilePath: u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-deleteprofilea ]]
	DeleteProfileA :: proc(lpSidString: PSTR, lpProfilePath: PSTR, lpComputerName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-deleteprofilew ]]
	DeleteProfileW :: proc(lpSidString: PWSTR, lpProfilePath: PWSTR, lpComputerName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getallusersprofiledirectorya ]]
	GetAllUsersProfileDirectoryA :: proc(lpProfileDir: PSTR, lpcchSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getallusersprofiledirectoryw ]]
	GetAllUsersProfileDirectoryW :: proc(lpProfileDir: PWSTR, lpcchSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getdefaultuserprofiledirectorya ]]
	GetDefaultUserProfileDirectoryA :: proc(lpProfileDir: PSTR, lpcchSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getdefaultuserprofiledirectoryw ]]
	GetDefaultUserProfileDirectoryW :: proc(lpProfileDir: PWSTR, lpcchSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getprofilesdirectorya ]]
	GetProfilesDirectoryA :: proc(lpProfileDir: PSTR, lpcchSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getprofilesdirectoryw ]]
	GetProfilesDirectoryW :: proc(lpProfileDir: PWSTR, lpcchSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getprofiletype ]]
	GetProfileType :: proc(dwFlags: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getuserprofiledirectorya ]]
	GetUserProfileDirectoryA :: proc(hToken: HANDLE, lpProfileDir: PSTR, lpcchSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-getuserprofiledirectoryw ]]
	GetUserProfileDirectoryW :: proc(hToken: HANDLE, lpProfileDir: PWSTR, lpcchSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-loaduserprofilea ]]
	LoadUserProfileA :: proc(hToken: HANDLE, lpProfileInfo: ^PROFILEINFOA) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-loaduserprofilew ]]
	LoadUserProfileW :: proc(hToken: HANDLE, lpProfileInfo: ^PROFILEINFOW) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/userenv/nf-userenv-unloaduserprofile ]]
	UnloadUserProfile :: proc(hToken: HANDLE, hProfile: HANDLE) -> BOOL ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions ]]
BROWSERFRAMEOPTIONS :: enum i32 {
	FO_NONE = 0,
	FO_BROWSER_PERSIST_SETTINGS = 1,
	FO_RENAME_FOLDER_OPTIONS_TOINTERNET = 2,
	FO_BOTH_OPTIONS = 4,
	IF_PREFER_INTERNET_SHORTCUT = 8,
	FO_BROWSE_NO_IN_NEW_PROCESS = 16,
	FO_ENABLE_HYPERLINK_TRACKING = 32,
	FO_USE_IE_OFFLINE_SUPPORT = 64,
	FO_SUBSTITUE_INTERNET_START_PAGE = 128,
	FO_USE_IE_LOGOBANDING = 256,
	FO_ADD_IE_TOCAPTIONBAR = 512,
	FO_USE_DIALUP_REF = 1024,
	FO_USE_IE_TOOLBAR = 2048,
	FO_NO_PARENT_FOLDER_SUPPORT = 4096,
	FO_NO_REOPEN_NEXT_RESTART = 8192,
	FO_GO_HOME_PAGE = 16384,
	FO_PREFER_IEPROCESS = 32768,
	FO_SHOW_NAVIGATION_CANCELLED = 65536,
	FO_USE_IE_STATUSBAR = 131072,
	FO_QUERY_ALL = -1,
}

CDBE_ACTIONS :: enum i32 {
	MUSIC = 1,
	DATA = 2,
	ALL = -1,
}

EXPCMDFLAGS :: enum i32 {
	DEFAULT = 0,
	HASSUBCOMMANDS = 1,
	HASSPLITBUTTON = 2,
	HIDELABEL = 4,
	ISSEPARATOR = 8,
	HASLUASHIELD = 16,
	SEPARATORBEFORE = 32,
	SEPARATORAFTER = 64,
	ISDROPDOWN = 128,
	TOGGLEABLE = 256,
	AUTOMENUICONS = 512,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_expcmdstate ]]
EXPCMDSTATE :: enum i32 {
	ENABLED = 0,
	DISABLED = 1,
	HIDDEN = 2,
	CHECKBOX = 4,
	CHECKED = 8,
	RADIOCHECK = 16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_explorerpanestate ]]
EXPLORERPANESTATE :: enum i32 {
	DONTCARE = 0,
	DEFAULT_ON = 1,
	DEFAULT_OFF = 2,
	STATEMASK = 65535,
	INITIALSTATE = 65536,
	FORCE = 131072,
}

EXPPS :: enum i32 {
	EXPPS_FILETYPES = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_definition_flags ]]
KF_DEFINITION_FLAGS :: enum i32 {
	LOCAL_REDIRECT_ONLY = 2,
	ROAMABLE = 4,
	PRECREATE = 8,
	STREAM = 16,
	PUBLISHEXPANDEDPATH = 32,
	NO_REDIRECT_UI = 64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirect_flags ]]
KF_REDIRECT_FLAGS :: enum i32 {
	USER_EXCLUSIVE = 1,
	COPY_SOURCE_DACL = 2,
	OWNER_USER = 4,
	SET_OWNER_EXPLICIT = 8,
	CHECK_ONLY = 16,
	WITH_UI = 32,
	UNPIN = 64,
	PIN = 128,
	COPY_CONTENTS = 512,
	DEL_SOURCE_CONTENTS = 1024,
	EXCLUDE_ALL_KNOWN_SUBFOLDERS = 2048,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_kf_redirection_capabilities ]]
KF_REDIRECTION_CAPABILITIES :: enum i32 {
	ALLOW_ALL = 255,
	REDIRECTABLE = 1,
	DENY_ALL = 1048320,
	DENY_POLICY_REDIRECTED = 256,
	DENY_POLICY = 512,
	DENY_PERMISSIONS = 1024,
}

NMCII_FLAGS :: enum i32 {
	NONE = 0,
	ITEMS = 1,
	FOLDERS = 2,
}

NMCSAEI_FLAGS :: enum i32 {
	SELECT = 0,
	EDIT = 1,
}

NSTCECLICKTYPE :: enum i32 {
	LBUTTON = 1,
	MBUTTON = 2,
	RBUTTON = 3,
	BUTTON = 3,
	DBLCLICK = 4,
}

NSTCEHITTEST :: enum i32 {
	NOWHERE = 1,
	ONITEMICON = 2,
	ONITEMLABEL = 4,
	ONITEMINDENT = 8,
	ONITEMBUTTON = 16,
	ONITEMRIGHT = 32,
	ONITEMSTATEICON = 64,
	ONITEM = 70,
	ONITEMTABBUTTON = 4096,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcitemstate ]]
NSTCITEMSTATE :: enum i32 {
	NONE = 0,
	SELECTED = 1,
	EXPANDED = 2,
	BOLD = 4,
	DISABLED = 8,
	SELECTEDNOEXPAND = 16,
}

NSTCROOTSTYLE :: enum i32 {
	VISIBLE = 0,
	HIDDEN = 1,
	EXPANDED = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_nstcstyle ]]
NSTCSTYLE :: enum i32 {
	HASEXPANDOS = 1,
	HASLINES = 2,
	SINGLECLICKEXPAND = 4,
	FULLROWSELECT = 8,
	SPRINGEXPAND = 16,
	HORIZONTALSCROLL = 32,
	ROOTHASEXPANDO = 64,
	SHOWSELECTIONALWAYS = 128,
	NOINFOTIP = 512,
	EVENHEIGHT = 1024,
	NOREPLACEOPEN = 2048,
	DISABLEDRAGDROP = 4096,
	NOORDERSTREAM = 8192,
	RICHTOOLTIP = 16384,
	BORDER = 32768,
	NOEDITLABELS = 65536,
	TABSTOP = 131072,
	FAVORITESMODE = 524288,
	AUTOHSCROLL = 1048576,
	FADEINOUTEXPANDOS = 2097152,
	EMPTYTEXT = 4194304,
	CHECKBOXES = 8388608,
	PARTIALCHECKBOXES = 16777216,
	EXCLUSIONCHECKBOXES = 33554432,
	DIMMEDCHECKBOXES = 67108864,
	NOINDENTCHECKS = 134217728,
	ALLOWJUNCTIONS = 268435456,
	SHOWTABSBUTTON = 536870912,
	SHOWDELETEBUTTON = 1073741824,
	SHOWREFRESHBUTTON = -2147483648,
}

OPPROGDLGF :: enum i32 {
	DEFAULT = 0,
	ENABLEPAUSE = 128,
	ALLOWUNDO = 256,
	DONTDISPLAYSOURCEPATH = 512,
	DONTDISPLAYDESTPATH = 1024,
	NOMULTIDAYESTIMATES = 2048,
	DONTDISPLAYLOCATIONS = 4096,
}

PDMODE :: enum i32 {
	DEFAULT = 0,
	RUN = 1,
	PREFLIGHT = 2,
	UNDOING = 4,
	ERRORSBLOCKING = 8,
	INDETERMINATE = 16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_shcontf ]]
SHCONTF :: enum i32 {
	CHECKING_FOR_CHILDREN = 16,
	FOLDERS = 32,
	NONFOLDERS = 64,
	INCLUDEHIDDEN = 128,
	INIT_ON_FIRST_NEXT = 256,
	NETPRINTERSRCH = 512,
	SHAREABLE = 1024,
	STORAGE = 2048,
	NAVIGATION_ENUM = 4096,
	FASTITEMS = 8192,
	FLATLIST = 16384,
	ENABLE_ASYNC = 32768,
	INCLUDESUPERHIDDEN = 65536,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_sichintf ]]
SICHINTF :: enum i32 {
	DISPLAY = 0,
	ALLFIELDS = -2147483648,
	CANONICAL = 268435456,
	TEST_FILESYSPATH_IF_NOT_EQUAL = 536870912,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_spbeginf ]]
SPBEGINF :: enum i32 {
	NORMAL = 0,
	AUTOTIME = 2,
	NOPROGRESSBAR = 16,
	MARQUEEPROGRESS = 32,
	NOCANCELBUTTON = 64,
}

SPINITF :: enum i32 {
	NORMAL = 0,
	MODAL = 1,
	NOMINIMIZE = 8,
}

SV3CVW3_FLAGS :: enum i32 {
	DEFAULT = 0,
	NONINTERACTIVE = 1,
	FORCEVIEWMODE = 2,
	FORCEFOLDERFLAGS = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svgio ]]
SVGIO :: distinct bit_set[enum {
	SELECTION = 0,
	ALLVIEW = 1,
	FLAG_VIEWORDER = 31,
}; i32]
SVGIO_BACKGROUND :: transmute(SVGIO)i32(0)
SVGIO_CHECKED :: transmute(SVGIO)i32(3)
SVGIO_TYPE_MASK :: transmute(SVGIO)i32(15)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svsif ]]
SVSIF :: enum i32 {
	DESELECT = 0,
	SELECT = 1,
	EDIT = 3,
	DESELECTOTHERS = 4,
	ENSUREVISIBLE = 8,
	FOCUSED = 16,
	TRANSLATEPT = 32,
	SELECTIONMARK = 64,
	POSITIONITEM = 128,
	CHECK = 256,
	CHECK2 = 512,
	KEYBOARDSELECT = 1025,
	NOTAKEFOCUS = 1073741824,
}

TRANSFER_ADVISE_STATE :: enum i32 {
	NONE = 0,
	PERFORMING = 1,
	PREPARING = 2,
	INDETERMINATE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_transfer_source_flags ]]
TRANSFER_SOURCE_FLAGS :: enum i32 {
	NORMAL = 0,
	FAIL_EXIST = 0,
	RENAME_EXIST = 1,
	OVERWRITE_EXIST = 2,
	ALLOW_DECRYPTION = 4,
	NO_SECURITY = 8,
	COPY_CREATION_TIME = 16,
	COPY_WRITE_TIME = 32,
	USE_FULL_ACCESS = 64,
	DELETE_RECYCLE_IF_POSSIBLE = 128,
	COPY_HARD_LINK = 256,
	COPY_LOCALIZED_NAME = 512,
	MOVE_AS_COPY_DELETE = 1024,
	SUSPEND_SHELLEVENTS = 2048,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-aashellmenufilename ]]
AASHELLMENUFILENAME :: struct {
	cbTotal: i16,
	rgbReserved: [12]u8,
	szFileName: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-aashellmenuitem ]]
AASHELLMENUITEM :: struct {
	lpReserved1: rawptr,
	iReserved: i32,
	uiReserved: u32,
	lpName: ^AASHELLMENUFILENAME,
	psz: PWSTR,
}

AccessibilityDockingService :: struct {
}
IID_AccessibilityDockingService :: GUID{0x29CE1D46, 0xB481, 0x4AA0, {0xA0, 0x8A, 0xD3, 0xEB, 0xC8, 0xAC, 0xA4, 0x02}}

ACENUMOPTION :: enum i32 {
	NONE = 0,
	MOSTRECENTFIRST = 1,
	FIRSTUNUSED = 65536,
}

ACTIVATEOPTIONS :: distinct bit_set[enum {
	DESIGNMODE = 0,
	NOERRORUI = 1,
	NOSPLASHSCREEN = 2,
	PRELAUNCH = 25,
}; i32]
ACTIVATEOPTIONS_NONE :: transmute(ACTIVATEOPTIONS)i32(0)

ADJACENT_DISPLAY_EDGES :: distinct bit_set[enum {
	LEFT = 0,
	RIGHT = 1,
}; i32]
ADJACENT_DISPLAY_EDGES_NONE :: transmute(ADJACENT_DISPLAY_EDGES)i32(0)

AHE_TYPE :: enum i32 {
	DESKTOP = 0,
	IMMERSIVE = 1,
}

AHTYPE :: distinct bit_set[enum {
	USER_APPLICATION = 3,
	ANY_APPLICATION = 4,
	MACHINEDEFAULT = 5,
	PROGID = 6,
	APPLICATION = 7,
	CLASS_APPLICATION = 8,
	ANY_PROGID = 9,
}; i32]
AHTYPE_UNDEFINED :: transmute(AHTYPE)i32(0)

AlphabeticalCategorizer :: struct {
}
IID_AlphabeticalCategorizer :: GUID{0x3C2654C6, 0x7372, 0x4F6B, {0xB3, 0x10, 0x55, 0xD6, 0x12, 0x8F, 0x49, 0xD2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/ne-shappmgr-appactionflags ]]
APPACTIONFLAGS :: enum i32 {
	INSTALL = 1,
	UNINSTALL = 2,
	MODIFY = 4,
	REPAIR = 8,
	UPGRADE = 16,
	CANGETSIZE = 32,
	MODIFYREMOVE = 128,
	ADDLATER = 256,
	UNSCHEDULE = 512,
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-appbardata ]]
	APPBARDATA :: struct {
		cbSize: u32,
		hWnd: HWND,
		uCallbackMessage: u32,
		uEdge: u32,
		rc: RECT,
		lParam: LPARAM,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-appbardata ]]
	APPBARDATA :: struct #packed {
		cbSize: u32,
		hWnd: HWND,
		uCallbackMessage: u32,
		uEdge: u32,
		rc: RECT,
		lParam: LPARAM,
	}
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-appcategoryinfo ]]
APPCATEGORYINFO :: struct {
	Locale: u32,
	pszDescription: PWSTR,
	AppCategoryId: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/appmgmt/ns-appmgmt-appcategoryinfolist ]]
APPCATEGORYINFOLIST :: struct {
	cCategory: u32,
	pCategoryInfo: ^APPCATEGORYINFO,
}

APPDOCLISTTYPE :: enum i32 {
	RECENT = 0,
	FREQUENT = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/ns-shappmgr-appinfodata ]]
APPINFODATA :: struct {
	cbSize: u32,
	dwMask: u32,
	pszDisplayName: PWSTR,
	pszVersion: PWSTR,
	pszPublisher: PWSTR,
	pszProductID: PWSTR,
	pszRegisteredOwner: PWSTR,
	pszRegisteredCompany: PWSTR,
	pszLanguage: PWSTR,
	pszSupportUrl: PWSTR,
	pszSupportTelephone: PWSTR,
	pszHelpLink: PWSTR,
	pszInstallLocation: PWSTR,
	pszInstallSource: PWSTR,
	pszInstallDate: PWSTR,
	pszContact: PWSTR,
	pszComments: PWSTR,
	pszImage: PWSTR,
	pszReadmeUrl: PWSTR,
	pszUpdateInfoUrl: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/ne-shappmgr-appinfodataflags ]]
APPINFODATAFLAGS :: enum i32 {
	DISPLAYNAME = 1,
	VERSION = 2,
	PUBLISHER = 4,
	PRODUCTID = 8,
	REGISTEREDOWNER = 16,
	REGISTEREDCOMPANY = 32,
	LANGUAGE = 64,
	SUPPORTURL = 128,
	SUPPORTTELEPHONE = 256,
	HELPLINK = 512,
	INSTALLLOCATION = 1024,
	INSTALLSOURCE = 2048,
	INSTALLDATE = 4096,
	CONTACT = 16384,
	COMMENTS = 32768,
	IMAGE = 131072,
	READMEURL = 262144,
	UPDATEINFOURL = 524288,
}

APPLET_PROC :: #type proc "system" (hwndCpl: HWND, msg: u32, lParam1: LPARAM, lParam2: LPARAM) -> i32

APPLICATION_VIEW_MIN_WIDTH :: enum i32 {
	DEFAULT = 0,
	_320 = 1,
	_500 = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-application_view_orientation ]]
APPLICATION_VIEW_ORIENTATION :: enum i32 {
	LANDSCAPE = 0,
	PORTRAIT = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-application_view_size_preference ]]
APPLICATION_VIEW_SIZE_PREFERENCE :: enum i32 {
	DEFAULT = 0,
	USE_LESS = 1,
	USE_HALF = 2,
	USE_MORE = 3,
	USE_MINIMUM = 4,
	USE_NONE = 5,
	CUSTOM = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-application_view_state ]]
APPLICATION_VIEW_STATE :: enum i32 {
	FULLSCREEN_LANDSCAPE = 0,
	FILLED = 1,
	SNAPPED = 2,
	FULLSCREEN_PORTRAIT = 3,
}

ApplicationActivationManager :: struct {
}
IID_ApplicationActivationManager :: GUID{0x45BA127D, 0x10A8, 0x46EA, {0x8A, 0xB7, 0x56, 0xEA, 0x90, 0x78, 0x94, 0x3C}}

ApplicationAssociationRegistration :: struct {
}
IID_ApplicationAssociationRegistration :: GUID{0x591209C7, 0x767B, 0x42B2, {0x9F, 0xBA, 0x44, 0xEE, 0x46, 0x15, 0xF2, 0xC7}}

ApplicationAssociationRegistrationUI :: struct {
}
IID_ApplicationAssociationRegistrationUI :: GUID{0x1968106D, 0xF3B5, 0x44CF, {0x89, 0x0E, 0x11, 0x6F, 0xCB, 0x9E, 0xCE, 0xF1}}

ApplicationDesignModeSettings :: struct {
}
IID_ApplicationDesignModeSettings :: GUID{0x958A6FB5, 0xDCB2, 0x4FAF, {0xAA, 0xFD, 0x7F, 0xB0, 0x54, 0xAD, 0x1A, 0x3B}}

ApplicationDestinations :: struct {
}
IID_ApplicationDestinations :: GUID{0x86C14003, 0x4D6B, 0x4EF3, {0xA7, 0xB4, 0x05, 0x06, 0x66, 0x3B, 0x2E, 0x68}}

ApplicationDocumentLists :: struct {
}
IID_ApplicationDocumentLists :: GUID{0x86BEC222, 0x30F2, 0x47E0, {0x9F, 0x25, 0x60, 0xD1, 0x1C, 0xD7, 0x5C, 0x28}}

AppShellVerbHandler :: struct {
}
IID_AppShellVerbHandler :: GUID{0x4ED3A719, 0xCEA8, 0x4BD9, {0x91, 0x0D, 0xE2, 0x52, 0xF9, 0x97, 0xAF, 0xC2}}

AppStartupLink :: struct {
}
IID_AppStartupLink :: GUID{0x273EB5E7, 0x88B0, 0x4843, {0xBF, 0xEF, 0xE2, 0xC8, 0x1D, 0x43, 0xAA, 0xE5}}

AppVisibility :: struct {
}
IID_AppVisibility :: GUID{0x7E5FE3D9, 0x985F, 0x4908, {0x91, 0xF9, 0xEE, 0x19, 0xF9, 0xFD, 0x15, 0x14}}

ASSOC_FILTER :: distinct bit_set[enum {
	RECOMMENDED = 0,
}; i32]
ASSOC_FILTER_NONE :: transmute(ASSOC_FILTER)i32(0)

ASSOCCLASS :: enum i32 {
	SHELL_KEY = 0,
	PROGID_KEY = 1,
	PROGID_STR = 2,
	CLSID_KEY = 3,
	CLSID_STR = 4,
	APP_KEY = 5,
	APP_STR = 6,
	SYSTEM_STR = 7,
	FOLDER = 8,
	STAR = 9,
	FIXED_PROGID_STR = 10,
	PROTOCOL_STR = 11,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-assocdata ]]
ASSOCDATA :: enum i32 {
	MSIDESCRIPTOR = 1,
	NOACTIVATEHANDLER = 2,
	UNUSED1 = 3,
	HASPERUSERASSOC = 4,
	EDITFLAGS = 5,
	VALUE = 6,
	MAX = 7,
}

ASSOCENUM :: enum i32 {
	NONE = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ASSOCF_str ]]
ASSOCF :: distinct bit_set[enum {
	INIT_NOREMAPCLSID = 0,
	INIT_BYEXENAME = 1,
	OPEN_BYEXENAME = 1,
	INIT_DEFAULTTOSTAR = 2,
	INIT_DEFAULTTOFOLDER = 3,
	NOUSERSETTINGS = 4,
	NOTRUNCATE = 5,
	VERIFY = 6,
	REMAPRUNDLL = 7,
	NOFIXUPS = 8,
	IGNOREBASECLASS = 9,
	INIT_IGNOREUNKNOWN = 10,
	INIT_FIXED_PROGID = 11,
	IS_PROTOCOL = 12,
	INIT_FOR_FILE = 13,
	IS_FULL_URI = 14,
	PER_MACHINE_ONLY = 15,
	APP_TO_APP = 16,
}; u32]
ASSOCF_NONE :: transmute(ASSOCF)u32(0x00000000)

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-associationelement ]]
	ASSOCIATIONELEMENT :: struct {
		ac: ASSOCCLASS,
		hkClass: HKEY,
		pszClass: PWSTR,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-associationelement ]]
	ASSOCIATIONELEMENT :: struct #packed {
		ac: ASSOCCLASS,
		hkClass: HKEY,
		pszClass: PWSTR,
	}
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-associationlevel ]]
ASSOCIATIONLEVEL :: enum i32 {
	MACHINE = 0,
	EFFECTIVE = 1,
	USER = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-associationtype ]]
ASSOCIATIONTYPE :: enum i32 {
	FILEEXTENSION = 0,
	URLPROTOCOL = 1,
	STARTMENUCLIENT = 2,
	MIMETYPE = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-assockey ]]
ASSOCKEY :: enum i32 {
	SHELLEXECCLASS = 1,
	APP = 2,
	CLASS = 3,
	BASECLASS = 4,
	MAX = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-assocstr ]]
ASSOCSTR :: enum i32 {
	COMMAND = 1,
	EXECUTABLE = 2,
	FRIENDLYDOCNAME = 3,
	FRIENDLYAPPNAME = 4,
	NOOPEN = 5,
	SHELLNEWVALUE = 6,
	DDECOMMAND = 7,
	DDEIFEXEC = 8,
	DDEAPPLICATION = 9,
	DDETOPIC = 10,
	INFOTIP = 11,
	QUICKTIP = 12,
	TILEINFO = 13,
	CONTENTTYPE = 14,
	DEFAULTICON = 15,
	SHELLEXTENSION = 16,
	DROPTARGET = 17,
	DELEGATEEXECUTE = 18,
	SUPPORTED_URI_PROTOCOLS = 19,
	PROGID = 20,
	APPID = 21,
	APPPUBLISHER = 22,
	APPICONREFERENCE = 23,
	MAX = 24,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-attachment_action ]]
ATTACHMENT_ACTION :: enum i32 {
	CANCEL = 0,
	SAVE = 1,
	EXEC = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-attachment_prompt ]]
ATTACHMENT_PROMPT :: enum i32 {
	NONE = 0,
	SAVE = 1,
	EXEC = 2,
	EXEC_OR_SAVE = 3,
}

AttachmentServices :: struct {
}
IID_AttachmentServices :: GUID{0x4125DD96, 0xE03A, 0x4103, {0x8F, 0x70, 0xE0, 0x59, 0x7D, 0x80, 0x3B, 0x9C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-auto_scroll_data ]]
AUTO_SCROLL_DATA :: struct #packed {
	iNextSample: i32,
	dwLastScroll: u32,
	bFull: BOOL,
	pts: [3]POINT,
	dwTimes: [3]u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-autocompletelistoptions ]]
AUTOCOMPLETELISTOPTIONS :: enum i32 {
	NONE = 0,
	CURRENTDIR = 1,
	MYCOMPUTER = 2,
	DESKTOP = 4,
	FAVORITES = 8,
	FILESYSONLY = 16,
	FILESYSDIRS = 32,
	VIRTUALNAMESPACE = 64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/ne-shldisp-autocompleteoptions ]]
AUTOCOMPLETEOPTIONS :: enum i32 {
	NONE = 0,
	AUTOSUGGEST = 1,
	AUTOAPPEND = 2,
	SEARCH = 4,
	FILTERPREFIXES = 8,
	USETAB = 16,
	UPDOWNKEYDROPSLIST = 32,
	RTLREADING = 64,
	WORD_FILTER = 128,
	NOPREFIXFILTERING = 256,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-bandinfosfb ]]
BANDINFOSFB :: struct {
	dwMask: u32,
	dwStateMask: u32,
	dwState: u32,
	crBkgnd: COLORREF,
	crBtnLt: COLORREF,
	crBtnDk: COLORREF,
	wViewMode: u16,
	wAlign: u16,
	psf: ^IShellFolder,
	pidl: ^ITEMIDLIST,
}

BANDSITECID :: enum i32 {
	BANDADDED = 0,
	BANDREMOVED = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-bandsiteinfo ]]
BANDSITEINFO :: struct {
	dwMask: u32,
	dwState: u32,
	dwStyle: u32,
}

BANNER_NOTIFICATION :: struct {
	event: BANNER_NOTIFICATION_EVENT,
	providerIdentity: PWSTR,
	contentId: PWSTR,
}

BANNER_NOTIFICATION_EVENT :: enum i32 {
	Rendered = 0,
	Hovered = 1,
	Closed = 2,
	Dismissed = 3,
	Button1Clicked = 4,
	Button2Clicked = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-basebrowserdatalh ]]
BASEBROWSERDATALH :: struct {
	_hwnd: HWND,
	_ptl: ^ITravelLog,
	_phlf: ^IHlinkFrame,
	_pautoWB2: ^IWebBrowser2,
	_pautoEDS: ^IExpDispSupport,
	_pautoSS: ^IShellService,
	_eSecureLockIcon: i32,
	using _: bit_field u32 {
		_fCreatingViewWindow: u32 | 1,
	},
	_uActivateState: u32,
	_pidlViewState: ^ITEMIDLIST,
	_pctView: ^IOleCommandTarget,
	_pidlCur: ^ITEMIDLIST,
	_psv: ^IShellView,
	_psf: ^IShellFolder,
	_hwndView: HWND,
	_pszTitleCur: PWSTR,
	_pidlPending: ^ITEMIDLIST,
	_psvPending: ^IShellView,
	_psfPending: ^IShellFolder,
	_hwndViewPending: HWND,
	_pszTitlePending: PWSTR,
	_fIsViewMSHTML: BOOL,
	_fPrivacyImpacted: BOOL,
	_clsidView: GUID,
	_clsidViewPending: GUID,
	_hwndFrame: HWND,
	_lPhishingFilterStatus: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-basebrowserdataxp ]]
BASEBROWSERDATAXP :: struct {
	_hwnd: HWND,
	_ptl: ^ITravelLog,
	_phlf: ^IHlinkFrame,
	_pautoWB2: ^IWebBrowser2,
	_pautoEDS: ^IExpDispSupportXP,
	_pautoSS: ^IShellService,
	_eSecureLockIcon: i32,
	using _: bit_field u32 {
		_fCreatingViewWindow: u32 | 1,
	},
	_uActivateState: u32,
	_pidlViewState: ^ITEMIDLIST,
	_pctView: ^IOleCommandTarget,
	_pidlCur: ^ITEMIDLIST,
	_psv: ^IShellView,
	_psf: ^IShellFolder,
	_hwndView: HWND,
	_pszTitleCur: PWSTR,
	_pidlPending: ^ITEMIDLIST,
	_psvPending: ^IShellView,
	_psfPending: ^IShellFolder,
	_hwndViewPending: HWND,
	_pszTitlePending: PWSTR,
	_fIsViewMSHTML: BOOL,
	_fPrivacyImpacted: BOOL,
	_clsidView: GUID,
	_clsidViewPending: GUID,
	_hwndFrame: HWND,
}

BFFCALLBACK :: #type proc "system" (hwnd: HWND, uMsg: u32, lParam: LPARAM, lpData: LPARAM) -> i32

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/ne-shdeprecated-bnstate ]]
BNSTATE :: enum i32 {
	NORMAL = 0,
	BEGIN_NAVIGATE = 1,
	NAVIGATE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-browseinfoa ]]
BROWSEINFOA :: struct {
	hwndOwner: HWND,
	pidlRoot: ^ITEMIDLIST,
	pszDisplayName: PSTR,
	lpszTitle: PSTR,
	ulFlags: u32,
	lpfn: BFFCALLBACK,
	lParam: LPARAM,
	iImage: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-browseinfow ]]
BROWSEINFOW :: struct {
	hwndOwner: HWND,
	pidlRoot: ^ITEMIDLIST,
	pszDisplayName: PWSTR,
	lpszTitle: PWSTR,
	ulFlags: u32,
	lpfn: BFFCALLBACK,
	lParam: LPARAM,
	iImage: i32,
}

BrowserNavConstants :: enum i32 {
	OpenInNewWindow = 1,
	NoHistory = 2,
	NoReadFromCache = 4,
	NoWriteToCache = 8,
	AllowAutosearch = 16,
	BrowserBar = 32,
	Hyperlink = 64,
	EnforceRestricted = 128,
	NewWindowsManaged = 256,
	UntrustedForDownload = 512,
	TrustedForActiveX = 1024,
	OpenInNewTab = 2048,
	OpenInBackgroundTab = 4096,
	KeepWordWheelText = 8192,
	VirtualTab = 16384,
	BlockRedirectsXDomain = 32768,
	OpenNewForegroundTab = 65536,
	TravelLogScreenshot = 131072,
	DeferUnload = 262144,
	Speculative = 524288,
	SuggestNewWindow = 1048576,
	SuggestNewTab = 2097152,
	Reserved1 = 4194304,
	HomepageNavigate = 8388608,
	Refresh = 16777216,
	HostNavigation = 33554432,
	Reserved2 = 67108864,
	Reserved3 = 134217728,
	Reserved4 = 268435456,
	Reserved5 = 536870912,
	Reserved6 = 1073741824,
	Reserved7 = -2147483648,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-cabinetstate ]]
CABINETSTATE :: struct #packed {
	cLength: u16,
	nVersion: u16,
	using _: bit_field i32 {
		fFullPathTitle: i32 | 1,
		fSaveLocalView: i32 | 1,
		fNotShell: i32 | 1,
		fSimpleDefault: i32 | 1,
		fDontShowDescBar: i32 | 1,
		fNewWindowMode: i32 | 1,
		fShowCompColor: i32 | 1,
		fDontPrettyNames: i32 | 1,
		fAdminsCreateCommonGroups: i32 | 1,
		fUnusedFlags: i32 | 7,
	},
	fMenuEnumFilter: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-category_info ]]
CATEGORY_INFO :: struct {
	cif: CATEGORYINFO_FLAGS,
	wszName: [260]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-categoryinfo_flags ]]
CATEGORYINFO_FLAGS :: distinct bit_set[enum {
	COLLAPSED = 0,
	HIDDEN = 1,
	EXPANDED = 2,
	NOHEADER = 3,
	NOTCOLLAPSIBLE = 4,
	NOHEADERCOUNT = 5,
	SUBSETTED = 6,
	SEPARATE_IMAGES = 7,
	SHOWEMPTY = 8,
}; i32]
CATEGORYINFO_FLAGS_NORMAL :: transmute(CATEGORYINFO_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-catsort_flags ]]
CATSORT_FLAGS :: distinct bit_set[enum {
	NAME = 0,
}; i32]
CATSORT_FLAGS_DEFAULT :: transmute(CATSORT_FLAGS)i32(0)

CDBurn :: struct {
}
IID_CDBurn :: GUID{0xFBEB8A05, 0xBEEE, 0x4442, {0x80, 0x4E, 0x40, 0x9D, 0x6C, 0x45, 0x15, 0xE9}}

CDBURNINGEXTENSIONRET :: enum i32 {
	DEFAULT = 0,
	DONTRUNOTHEREXTS = 1,
	STOPWIZARD = 2,
}

CDCONTROLSTATEF :: distinct bit_set[enum {
	ENABLED = 0,
	VISIBLE = 1,
}; i32]
CDCONTROLSTATEF_INACTIVE :: transmute(CDCONTROLSTATEF)i32(0)
CDCONTROLSTATEF_ENABLEDVISIBLE :: transmute(CDCONTROLSTATEF)i32(3)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-cida ]]
CIDA :: struct #packed {
	cidl: u32,
	aoffset: [1]u32,
}

CIE4ConnectionPoint :: struct #raw_union {
	#subtype IConnectionPoint: IConnectionPoint,
	using Vtbl: ^CIE4ConnectionPoint_Vtbl,
}
CIE4ConnectionPoint_Vtbl :: struct {
	using IConnectionPoint_Vtbl: IConnectionPoint_Vtbl,
	DoInvokeIE4: proc "system" (
		this: ^CIE4ConnectionPoint,
		pf: ^BOOL,
		ppv: rawptr,
		dispid: i32,
		pdispparams: ^DISPPARAMS,
	) -> HRESULT,
	DoInvokePIDLIE4: proc "system" (this: ^CIE4ConnectionPoint, dispid: i32, pidl: ^ITEMIDLIST, fCanCancel: BOOL) -> HRESULT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-cm_columninfo ]]
CM_COLUMNINFO :: struct {
	cbSize: u32,
	dwMask: u32,
	dwState: u32,
	uWidth: u32,
	uDefaultWidth: u32,
	uIdealWidth: u32,
	wszName: [80]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_enum_flags ]]
CM_ENUM_FLAGS :: distinct bit_set[enum {
	ALL = 0,
	VISIBLE = 1,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_mask ]]
CM_MASK :: distinct bit_set[enum {
	WIDTH = 0,
	DEFAULTWIDTH = 1,
	IDEALWIDTH = 2,
	NAME = 3,
	STATE = 4,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_set_width_value ]]
CM_SET_WIDTH_VALUE :: enum i32 {
	USEDEFAULT = -1,
	AUTOSIZE = -2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-cm_state ]]
CM_STATE :: distinct bit_set[enum {
	VISIBLE = 0,
	FIXEDWIDTH = 1,
	NOSORTBYFOLDERNESS = 2,
	ALWAYSVISIBLE = 3,
}; i32]
CM_STATE_NONE :: transmute(CM_STATE)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo ]]
CMINVOKECOMMANDINFO :: struct {
	cbSize: u32,
	fMask: u32,
	hwnd: HWND,
	lpVerb: PSTR,
	lpParameters: PSTR,
	lpDirectory: PSTR,
	nShow: i32,
	dwHotKey: u32,
	hIcon: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex ]]
CMINVOKECOMMANDINFOEX :: struct {
	cbSize: u32,
	fMask: u32,
	hwnd: HWND,
	lpVerb: PSTR,
	lpParameters: PSTR,
	lpDirectory: PSTR,
	nShow: i32,
	dwHotKey: u32,
	hIcon: HANDLE,
	lpTitle: PSTR,
	lpVerbW: PWSTR,
	lpParametersW: PWSTR,
	lpDirectoryW: PWSTR,
	lpTitleW: PWSTR,
	ptInvoke: POINT,
}

CMINVOKECOMMANDINFOEX_REMOTE :: struct {
	cbSize: u32,
	fMask: u32,
	hwnd: HWND,
	lpVerbString: PSTR,
	lpParameters: PSTR,
	lpDirectory: PSTR,
	nShow: i32,
	dwHotKey: u32,
	lpTitle: PSTR,
	lpVerbWString: PWSTR,
	lpParametersW: PWSTR,
	lpDirectoryW: PWSTR,
	lpTitleW: PWSTR,
	ptInvoke: POINT,
	lpVerbInt: u32,
	lpVerbWInt: u32,
}

CommandStateChangeConstants :: enum i32 {
	UPDATECOMMANDS = -1,
	NAVIGATEFORWARD = 1,
	NAVIGATEBACK = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ns-syncmgr-confirm_conflict_item ]]
CONFIRM_CONFLICT_ITEM :: struct {
	pShellItem: ^IShellItem2,
	pszOriginalName: PWSTR,
	pszAlternateName: PWSTR,
	pszLocationShort: PWSTR,
	pszLocationFull: PWSTR,
	nType: SYNCMGR_CONFLICT_ITEM_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ns-syncmgr-confirm_conflict_result_info ]]
CONFIRM_CONFLICT_RESULT_INFO :: struct {
	pszNewName: PWSTR,
	iItemIndex: u32,
}

ConflictFolder :: struct {
}
IID_ConflictFolder :: GUID{0x289978AC, 0xA101, 0x4341, {0xA8, 0x17, 0x21, 0xEB, 0xA7, 0xFD, 0x04, 0x6D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/cpl/ns-cpl-cplinfo ]]
CPLINFO :: struct #packed {
	idIcon: i32,
	idName: i32,
	idInfo: i32,
	lData: int,
}

CPVIEW :: enum i32 {
	CLASSIC = 0,
	ALLITEMS = 0,
	CATEGORY = 1,
	HOME = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_account_options ]]
CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS :: distinct bit_set[enum {
	EMPTY_LOCAL = 0,
	EMPTY_CONNECTED = 1,
}; i32]
CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS_NONE :: transmute(CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_credential_field_options ]]
CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS :: distinct bit_set[enum {
	ENABLE_PASSWORD_REVEAL = 0,
	IS_EMAIL_ADDRESS = 1,
	ENABLE_TOUCH_KEYBOARD_AUTO_INVOKE = 2,
	NUMBERS_ONLY = 3,
	SHOW_ENGLISH_KEYBOARD = 4,
}; i32]
CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS_NONE :: transmute(CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_credential_serialization ]]
CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION :: struct {
	ulAuthenticationPackage: u32,
	clsidCredentialProvider: GUID,
	cbSerialization: u32,
	rgbSerialization: ^u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ns-credentialprovider-credential_provider_field_descriptor ]]
CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR :: struct {
	dwFieldID: u32,
	cpft: CREDENTIAL_PROVIDER_FIELD_TYPE,
	pszLabel: PWSTR,
	guidFieldType: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_interactive_state ]]
CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE :: enum i32 {
	NONE = 0,
	READONLY = 1,
	DISABLED = 2,
	FOCUSED = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_state ]]
CREDENTIAL_PROVIDER_FIELD_STATE :: enum i32 {
	HIDDEN = 0,
	DISPLAY_IN_SELECTED_TILE = 1,
	DISPLAY_IN_DESELECTED_TILE = 2,
	DISPLAY_IN_BOTH = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_field_type ]]
CREDENTIAL_PROVIDER_FIELD_TYPE :: enum i32 {
	INVALID = 0,
	LARGE_TEXT = 1,
	SMALL_TEXT = 2,
	COMMAND_LINK = 3,
	EDIT_TEXT = 4,
	PASSWORD_TEXT = 5,
	TILE_IMAGE = 6,
	CHECKBOX = 7,
	COMBOBOX = 8,
	SUBMIT_BUTTON = 9,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_get_serialization_response ]]
CREDENTIAL_PROVIDER_GET_SERIALIZATION_RESPONSE :: enum i32 {
	NO_CREDENTIAL_NOT_FINISHED = 0,
	NO_CREDENTIAL_FINISHED = 1,
	RETURN_CREDENTIAL_FINISHED = 2,
	RETURN_NO_CREDENTIAL_FINISHED = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_status_icon ]]
CREDENTIAL_PROVIDER_STATUS_ICON :: enum i32 {
	NONE = 0,
	ERROR = 1,
	WARNING = 2,
	SUCCESS = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/ne-credentialprovider-credential_provider_usage_scenario ]]
CREDENTIAL_PROVIDER_USAGE_SCENARIO :: enum i32 {
	INVALID = 0,
	LOGON = 1,
	UNLOCK_WORKSTATION = 2,
	CHANGE_PASSWORD = 3,
	CREDUI = 4,
	PLAP = 5,
}

CScriptErrorList :: struct {
}
IID_CScriptErrorList :: GUID{0xEFD01300, 0x160F, 0x11D2, {0xBB, 0x2E, 0x00, 0x80, 0x5F, 0xF7, 0xEF, 0xCA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-csfv ]]
CSFV :: struct {
	cbSize: u32,
	pshf: ^IShellFolder,
	psvOuter: ^IShellView,
	pidl: ^ITEMIDLIST,
	lEvents: i32,
	pfnCallback: LPFNVIEWCALLBACK,
	fvm: FOLDERVIEWMODE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-datablock_header ]]
DATABLOCK_HEADER :: struct #packed {
	cbSize: u32,
	dwSignature: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-dataobj_get_item_flags ]]
DATAOBJ_GET_ITEM_FLAGS :: distinct bit_set[enum {
	TRAVERSE_LINK = 0,
	NO_HDROP = 1,
	NO_URL = 2,
	ONLY_IF_ONE = 3,
}; i32]
DATAOBJ_GET_ITEM_FLAGS_DEFAULT :: transmute(DATAOBJ_GET_ITEM_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-def_share_id ]]
DEF_SHARE_ID :: enum i32 {
	USERS = 1,
	PUBLIC = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-default_folder_menu_restrictions ]]
DEFAULT_FOLDER_MENU_RESTRICTIONS :: distinct bit_set[enum {
	NO_STATIC_VERBS = 3,
	STATIC_VERBS_ONLY = 4,
	NO_RESOURCE_VERBS = 5,
	OPTIN_HANDLERS_ONLY = 6,
	RESOURCE_AND_FOLDER_VERBS_ONLY = 7,
	USE_SPECIFIED_HANDLERS = 8,
	USE_SPECIFIED_VERBS = 9,
	NO_ASYNC_VERBS = 10,
	NO_NATIVECPU_VERBS = 11,
	NO_NONWOW_VERBS = 12,
}; i32]
DEFAULT_FOLDER_MENU_RESTRICTIONS_DEFAULT :: transmute(DEFAULT_FOLDER_MENU_RESTRICTIONS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-defaultsavefoldertype ]]
DEFAULTSAVEFOLDERTYPE :: enum i32 {
	DETECT = 1,
	PRIVATE = 2,
	PUBLIC = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-defcontextmenu ]]
DEFCONTEXTMENU :: struct {
	hwnd: HWND,
	pcmcb: ^IContextMenuCB,
	pidlFolder: ^ITEMIDLIST,
	psf: ^IShellFolder,
	cidl: u32,
	apidl: ^ITEMIDLIST,
	punkAssociationInfo: ^IUnknown,
	cKeys: u32,
	aKeys: ^HKEY,
}

DefFolderMenu :: struct {
}
IID_DefFolderMenu :: GUID{0xC63382BE, 0x7933, 0x48D0, {0x9A, 0xC8, 0x85, 0xFB, 0x46, 0xBE, 0x2F, 0xDD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-delegateitemid ]]
DELEGATEITEMID :: struct #packed {
	cbSize: u16,
	wOuter: u16,
	cbInner: u16,
	rgb: [1]u8,
}

DESKBANDCID :: enum i32 {
	BANDINFOCHANGED = 0,
	SHOWONLY = 1,
	MAXIMIZEBAND = 2,
	PUSHCHEVRON = 3,
	DELAYINIT = 4,
	FINISHINIT = 5,
	SETWINDOWTHEME = 6,
	PERMITAUTOHIDE = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-deskbandinfo ]]
DESKBANDINFO :: struct {
	dwMask: u32,
	ptMinSize: POINTL,
	ptMaxSize: POINTL,
	ptIntegral: POINTL,
	ptActual: POINTL,
	wszTitle: [256]u16,
	dwModeFlags: u32,
	crBkgnd: COLORREF,
}

DESKTOP_SLIDESHOW_DIRECTION :: enum i32 {
	FORWARD = 0,
	BACKWARD = 1,
}

DESKTOP_SLIDESHOW_OPTIONS :: distinct bit_set[enum {
	SO_SHUFFLEIMAGES = 0,
}; i32]

DESKTOP_SLIDESHOW_STATE :: distinct bit_set[enum {
	ENABLED = 0,
	SLIDESHOW = 1,
	DISABLED_BY_REMOTE_SESSION = 2,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-desktop_wallpaper_position ]]
DESKTOP_WALLPAPER_POSITION :: enum i32 {
	CENTER = 0,
	TILE = 1,
	STRETCH = 2,
	FIT = 3,
	FILL = 4,
	SPAN = 5,
}

DesktopGadget :: struct {
}
IID_DesktopGadget :: GUID{0x924CCC1B, 0x6562, 0x4C85, {0x86, 0x57, 0xD1, 0x77, 0x92, 0x52, 0x22, 0xB6}}

DesktopWallpaper :: struct {
}
IID_DesktopWallpaper :: GUID{0xC2CF3110, 0x460E, 0x4FC1, {0xB9, 0xD0, 0x8A, 0x1C, 0x0C, 0x9C, 0xC4, 0xBD}}

DestinationList :: struct {
}
IID_DestinationList :: GUID{0x77F10CF0, 0x3DB5, 0x4966, {0xB5, 0x20, 0xB7, 0xC5, 0x4F, 0xD3, 0x5E, 0xD6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-detailsinfo ]]
DETAILSINFO :: struct {
	pidl: ^ITEMIDLIST,
	fmt: i32,
	cxChar: i32,
	str: STRRET,
	iImage: i32,
}

DFConstraint :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DFConstraint_Vtbl,
}
DFConstraint_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Name: proc "system" (this: ^DFConstraint, pbs: ^BSTR) -> HRESULT,
	get_Value: proc "system" (this: ^DFConstraint, pv: ^VARIANT) -> HRESULT,
}
IID_DFConstraint :: GUID{0x4A3DF050, 0x23BD, 0x11D2, {0x93, 0x9F, 0x00, 0xA0, 0xC9, 0x1E, 0xED, 0xBA}}

DFM_CMD :: enum i32 {
	DELETE = -1,
	MOVE = -2,
	COPY = -3,
	LINK = -4,
	PROPERTIES = -5,
	NEWFOLDER = -6,
	PASTE = -7,
	VIEWLIST = -8,
	VIEWDETAILS = -9,
	PASTELINK = -10,
	PASTESPECIAL = -11,
	MODALPROP = -12,
	RENAME = -13,
}

DFM_MESSAGE_ID :: enum i32 {
	MERGECONTEXTMENU = 1,
	INVOKECOMMAND = 2,
	GETHELPTEXT = 5,
	WM_MEASUREITEM = 6,
	WM_DRAWITEM = 7,
	WM_INITMENUPOPUP = 8,
	VALIDATECMD = 9,
	MERGECONTEXTMENU_TOP = 10,
	GETHELPTEXTW = 11,
	INVOKECOMMANDEX = 12,
	MAPCOMMANDNAME = 13,
	GETDEFSTATICID = 14,
	GETVERBW = 15,
	GETVERBA = 16,
	MERGECONTEXTMENU_BOTTOM = 17,
	MODIFYQCMFLAGS = 18,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-dfmics ]]
DFMICS :: struct {
	cbSize: u32,
	fMask: u32,
	lParam: LPARAM,
	idCmdFirst: u32,
	idDefMax: u32,
	pici: ^CMINVOKECOMMANDINFO,
	punkSite: ^IUnknown,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/ne-shellscalingapi-display_device_type ]]
DISPLAY_DEVICE_TYPE :: enum i32 {
	PRIMARY = 0,
	IMMERSIVE = 1,
}

DLLGETVERSIONPROC :: #type proc "system" (param0: ^DLLVERSIONINFO) -> HRESULT

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-dllversioninfo ]]
DLLVERSIONINFO :: struct {
	cbSize: u32,
	dwMajorVersion: u32,
	dwMinorVersion: u32,
	dwBuildNumber: u32,
	dwPlatformID: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-dllversioninfo2 ]]
DLLVERSIONINFO2 :: struct {
	info1: DLLVERSIONINFO,
	dwFlags: u32,
	ullVersion: u64,
}

DocPropShellExtension :: struct {
}
IID_DocPropShellExtension :: GUID{0x883373C3, 0xBF89, 0x11D1, {0xBE, 0x35, 0x08, 0x00, 0x36, 0xB1, 0x1A, 0x03}}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	DRAGINFOA :: struct {
		uSize: u32,
		pt: POINT,
		fNC: BOOL,
		lpFileList: PSTR,
		grfKeyState: u32,
	}
}

when ODIN_ARCH == .i386 {
	DRAGINFOA :: struct #packed {
		uSize: u32,
		pt: POINT,
		fNC: BOOL,
		lpFileList: PSTR,
		grfKeyState: u32,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	DRAGINFOW :: struct {
		uSize: u32,
		pt: POINT,
		fNC: BOOL,
		lpFileList: PWSTR,
		grfKeyState: u32,
	}
}

when ODIN_ARCH == .i386 {
	DRAGINFOW :: struct #packed {
		uSize: u32,
		pt: POINT,
		fNC: BOOL,
		lpFileList: PWSTR,
		grfKeyState: u32,
	}
}

DriveSizeCategorizer :: struct {
}
IID_DriveSizeCategorizer :: GUID{0x94357B53, 0xCA29, 0x4B78, {0x83, 0xAE, 0xE8, 0xFE, 0x74, 0x09, 0x13, 0x4F}}

DriveTypeCategorizer :: struct {
}
IID_DriveTypeCategorizer :: GUID{0xB0A8F3CF, 0x4333, 0x4BAB, {0x88, 0x73, 0x1C, 0xCB, 0x1C, 0xAD, 0xA4, 0x8B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-dropdescription ]]
DROPDESCRIPTION :: struct #packed {
	type: DROPIMAGETYPE,
	szMessage: [260]u16,
	szInsert: [260]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-dropfiles ]]
DROPFILES :: struct #packed {
	pFiles: u32,
	pt: POINT,
	fNC: BOOL,
	fWide: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-dropimagetype ]]
DROPIMAGETYPE :: enum i32 {
	INVALID = -1,
	NONE = 0,
	COPY = 1,
	MOVE = 2,
	LINK = 4,
	LABEL = 6,
	WARNING = 7,
	NOIMAGE = 8,
}

DSH_FLAGS :: distinct bit_set[enum {
	ALLOWDROPDESCRIPTIONTEXT = 0,
}; i32]

DShellFolderViewEvents :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DShellFolderViewEvents_Vtbl,
}
DShellFolderViewEvents_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DShellFolderViewEvents :: GUID{0x62112AA2, 0xEBE4, 0x11CF, {0xA5, 0xFB, 0x00, 0x20, 0xAF, 0xE7, 0x29, 0x2D}}

DShellNameSpaceEvents :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DShellNameSpaceEvents_Vtbl,
}
DShellNameSpaceEvents_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DShellNameSpaceEvents :: GUID{0x55136806, 0xB2DE, 0x11D1, {0xB9, 0xF2, 0x00, 0xA0, 0xC9, 0x8B, 0xC5, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/dshellwindowsevents ]]
DShellWindowsEvents :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DShellWindowsEvents_Vtbl,
}
DShellWindowsEvents_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DShellWindowsEvents :: GUID{0xFE4106E0, 0x399A, 0x11D0, {0xA4, 0x8C, 0x00, 0xA0, 0xC9, 0x0A, 0x8F, 0x39}}

DWebBrowserEvents :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DWebBrowserEvents_Vtbl,
}
DWebBrowserEvents_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DWebBrowserEvents :: GUID{0xEAB22AC2, 0x30C1, 0x11CF, {0xA7, 0xEB, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B}}

DWebBrowserEvents2 :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DWebBrowserEvents2_Vtbl,
}
DWebBrowserEvents2_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DWebBrowserEvents2 :: GUID{0x34A715A0, 0x6587, 0x11D0, {0x92, 0x4A, 0x00, 0x20, 0xAF, 0xC7, 0xAC, 0x4D}}

EC_HOST_UI_MODE :: enum i32 {
	DESKTOP = 0,
	IMMERSIVE = 1,
	SYSTEM_LAUNCHER = 2,
}

EDGE_GESTURE_KIND :: enum i32 {
	TOUCH = 0,
	KEYBOARD = 1,
	MOUSE = 2,
}

EnumerableObjectCollection :: struct {
}
IID_EnumerableObjectCollection :: GUID{0x2D3468C1, 0x36A7, 0x43B6, {0xAC, 0x24, 0xD3, 0xF0, 0x2F, 0xD9, 0x60, 0x7A}}

ExecuteFolder :: struct {
}
IID_ExecuteFolder :: GUID{0x11DBB47C, 0xA525, 0x400B, {0x9E, 0x80, 0xA5, 0x46, 0x15, 0xA0, 0x90, 0xC0}}

ExecuteUnknown :: struct {
}
IID_ExecuteUnknown :: GUID{0xE44E9428, 0xBDBC, 0x4987, {0xA0, 0x99, 0x40, 0xDC, 0x8F, 0xD2, 0x55, 0xE7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_darwin_link ]]
EXP_DARWIN_LINK :: struct #packed {
	dbh: DATABLOCK_HEADER,
	szDarwinID: [260]CHAR,
	szwDarwinID: [260]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_propertystorage ]]
EXP_PROPERTYSTORAGE :: struct #packed {
	cbSize: u32,
	dwSignature: u32,
	abPropertyStorage: [1]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_special_folder ]]
EXP_SPECIAL_FOLDER :: struct #packed {
	cbSize: u32,
	dwSignature: u32,
	idSpecialFolder: u32,
	cbOffset: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_sz_link ]]
EXP_SZ_LINK :: struct #packed {
	cbSize: u32,
	dwSignature: u32,
	szTarget: [260]CHAR,
	swzTarget: [260]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-explorer_browser_fill_flags ]]
EXPLORER_BROWSER_FILL_FLAGS :: distinct bit_set[enum {
	SELECTFROMDATAOBJECT = 8,
	NODROPTARGET = 9,
}; i32]
EXPLORER_BROWSER_FILL_FLAGS_NONE :: transmute(EXPLORER_BROWSER_FILL_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-explorer_browser_options ]]
EXPLORER_BROWSER_OPTIONS :: distinct bit_set[enum {
	NAVIGATEONCE = 0,
	SHOWFRAMES = 1,
	ALWAYSNAVIGATE = 2,
	NOTRAVELLOG = 3,
	NOWRAPPERWINDOW = 4,
	HTMLSHAREPOINTVIEW = 5,
	NOBORDER = 6,
	NOPERSISTVIEWSTATE = 7,
}; i32]
EXPLORER_BROWSER_OPTIONS_NONE :: transmute(EXPLORER_BROWSER_OPTIONS)i32(0)

ExplorerBrowser :: struct {
}
IID_ExplorerBrowser :: GUID{0x71F96385, 0xDDD6, 0x48D3, {0xA0, 0xC1, 0xAE, 0x06, 0xE8, 0xB0, 0x55, 0xFB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-extrasearch ]]
EXTRASEARCH :: struct {
	guidSearch: GUID,
	wszFriendlyName: [80]u16,
	wszUrl: [2084]u16,
}

FD_FLAGS :: enum i32 {
	CLSID = 1,
	SIZEPOINT = 2,
	ATTRIBUTES = 4,
	CREATETIME = 8,
	ACCESSTIME = 16,
	WRITESTIME = 32,
	FILESIZE = 64,
	PROGRESSUI = 16384,
	LINKUI = 32768,
	UNICODE = -2147483648,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fdap ]]
FDAP :: enum i32 {
	BOTTOM = 0,
	TOP = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fde_overwrite_response ]]
FDE_OVERWRITE_RESPONSE :: enum i32 {
	DEFAULT = 0,
	ACCEPT = 1,
	REFUSE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fde_shareviolation_response ]]
FDE_SHAREVIOLATION_RESPONSE :: enum i32 {
	DEFAULT = 0,
	ACCEPT = 1,
	REFUSE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-fffp_mode ]]
FFFP_MODE :: enum i32 {
	EXACTMATCH = 0,
	NEARESTPARENTMATCH = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-file_attributes_array ]]
FILE_ATTRIBUTES_ARRAY :: struct #packed {
	cItems: u32,
	dwSumFileAttributes: u32,
	dwProductFileAttributes: u32,
	rgdwFileAttributes: [1]u32,
}

FILE_OPERATION_FLAGS2 :: distinct bit_set[enum {
	MERGEFOLDERSONCOLLISION = 0,
}; i32]
FILE_OPERATION_FLAGS2_NONE :: transmute(FILE_OPERATION_FLAGS2)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-file_usage_type ]]
FILE_USAGE_TYPE :: enum i32 {
	PLAYING = 0,
	EDITING = 1,
	GENERIC = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-filedescriptora ]]
FILEDESCRIPTORA :: struct #packed {
	dwFlags: u32,
	clsid: GUID,
	sizel: SIZE,
	pointl: POINTL,
	dwFileAttributes: u32,
	ftCreationTime: FILETIME,
	ftLastAccessTime: FILETIME,
	ftLastWriteTime: FILETIME,
	nFileSizeHigh: u32,
	nFileSizeLow: u32,
	cFileName: [260]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-filedescriptorw ]]
FILEDESCRIPTORW :: struct #packed {
	dwFlags: u32,
	clsid: GUID,
	sizel: SIZE,
	pointl: POINTL,
	dwFileAttributes: u32,
	ftCreationTime: FILETIME,
	ftLastAccessTime: FILETIME,
	ftLastWriteTime: FILETIME,
	nFileSizeHigh: u32,
	nFileSizeLow: u32,
	cFileName: [260]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-filegroupdescriptora ]]
FILEGROUPDESCRIPTORA :: struct #packed {
	cItems: u32,
	fgd: [1]FILEDESCRIPTORA,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-filegroupdescriptorw ]]
FILEGROUPDESCRIPTORW :: struct #packed {
	cItems: u32,
	fgd: [1]FILEDESCRIPTORW,
}

FileOpenDialog :: struct {
}
IID_FileOpenDialog :: GUID{0xDC1C5A9C, 0xE88A, 0x4DDE, {0xA5, 0xA1, 0x60, 0xF8, 0x2A, 0x20, 0xAE, 0xF7}}

FILEOPENDIALOGOPTIONS :: distinct bit_set[enum {
	OVERWRITEPROMPT = 1,
	STRICTFILETYPES = 2,
	NOCHANGEDIR = 3,
	PICKFOLDERS = 5,
	FORCEFILESYSTEM = 6,
	ALLNONSTORAGEITEMS = 7,
	NOVALIDATE = 8,
	ALLOWMULTISELECT = 9,
	PATHMUSTEXIST = 11,
	FILEMUSTEXIST = 12,
	CREATEPROMPT = 13,
	SHAREAWARE = 14,
	NOREADONLYRETURN = 15,
	NOTESTFILECREATE = 16,
	HIDEMRUPLACES = 17,
	HIDEPINNEDPLACES = 18,
	NODEREFERENCELINKS = 20,
	OKBUTTONNEEDSINTERACTION = 21,
	DONTADDTORECENT = 25,
	FORCESHOWHIDDEN = 28,
	DEFAULTNOMINIMODE = 29,
	FORCEPREVIEWPANEON = 30,
	SUPPORTSTREAMABLEITEMS = 31,
}; u32]

FileOperation :: struct {
}
IID_FileOperation :: GUID{0x3AD05575, 0x8857, 0x4850, {0x92, 0x77, 0x11, 0xB8, 0x5B, 0xDB, 0x8E, 0x09}}

FILEOPERATION_FLAGS :: distinct bit_set[enum {
	X_NOSKIPJUNCTIONS = 16,
	X_PREFERHARDLINK = 17,
	X_SHOWELEVATIONPROMPT = 18,
	X_RECYCLEONDELETE = 19,
	X_EARLYFAILURE = 20,
	X_PRESERVEFILEEXTENSIONS = 21,
	X_KEEPNEWERFILE = 22,
	X_NOCOPYHOOKS = 23,
	X_NOMINIMIZEBOX = 24,
	X_MOVEACLSACROSSVOLUMES = 25,
	X_DONTDISPLAYSOURCEPATH = 26,
	X_DONTDISPLAYDESTPATH = 27,
	X_REQUIREELEVATION = 28,
	X_ADDUNDORECORD = 29,
	X_COPYASDOWNLOAD = 30,
	X_DONTDISPLAYLOCATIONS = 31,
	MULTIDESTFILES = 0,
	CONFIRMMOUSE = 1,
	SILENT = 2,
	RENAMEONCOLLISION = 3,
	NOCONFIRMATION = 4,
	WANTMAPPINGHANDLE = 5,
	ALLOWUNDO = 6,
	FILESONLY = 7,
	SIMPLEPROGRESS = 8,
	NOCONFIRMMKDIR = 9,
	NOERRORUI = 10,
	NOCOPYSECURITYATTRIBS = 11,
	NORECURSION = 12,
	NO_CONNECTED_ELEMENTS = 13,
	WANTNUKEWARNING = 14,
	NORECURSEREPARSE = 15,
}; u32]
FILEOPERATION_FLAGS_NO_UI :: transmute(FILEOPERATION_FLAGS)u32(0x00000614)

FileSaveDialog :: struct {
}
IID_FileSaveDialog :: GUID{0xC0B4E2F3, 0xBA21, 0x4773, {0x8D, 0xBA, 0x33, 0x5E, 0xC9, 0x46, 0xEB, 0x8B}}

FileSearchBand :: struct {
}
IID_FileSearchBand :: GUID{0xC4EE31F3, 0x4768, 0x11D2, {0xBE, 0x5C, 0x00, 0xA0, 0xC9, 0xA8, 0x3D, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-filetypeattributeflags ]]
FILETYPEATTRIBUTEFLAGS :: distinct bit_set[enum {
	Exclude = 0,
	Show = 1,
	HasExtension = 2,
	NoEdit = 3,
	NoRemove = 4,
	NoNewVerb = 5,
	NoEditVerb = 6,
	NoRemoveVerb = 7,
	NoEditDesc = 8,
	NoEditIcon = 9,
	NoEditDflt = 10,
	NoEditVerbCmd = 11,
	NoEditVerbExe = 12,
	NoDDE = 13,
	NoEditMIME = 15,
	OpenIsSafe = 16,
	AlwaysUnsafe = 17,
	NoRecentDocs = 20,
	SafeForElevation = 21,
	AlwaysUseDirectInvoke = 22,
}; i32]
FILETYPEATTRIBUTEFLAGS_None :: transmute(FILETYPEATTRIBUTEFLAGS)i32(0)

FLYOUT_PLACEMENT :: enum i32 {
	DEFAULT = 0,
	ABOVE = 1,
	BELOW = 2,
	LEFT = 3,
	RIGHT = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/folder ]]
Folder :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^Folder_Vtbl,
}
Folder_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Title: proc "system" (this: ^Folder, pbs: ^BSTR) -> HRESULT,
	get_Application: proc "system" (this: ^Folder, ppid: ^^IDispatch) -> HRESULT,
	get_Parent: proc "system" (this: ^Folder, ppid: ^^IDispatch) -> HRESULT,
	get_ParentFolder: proc "system" (this: ^Folder, ppsf: ^^Folder) -> HRESULT,
	Items: proc "system" (this: ^Folder, ppid: ^^FolderItems) -> HRESULT,
	ParseName: proc "system" (this: ^Folder, bName: BSTR, ppid: ^^FolderItem) -> HRESULT,
	NewFolder: proc "system" (this: ^Folder, bName: BSTR, vOptions: VARIANT) -> HRESULT,
	MoveHere: proc "system" (this: ^Folder, vItem: VARIANT, vOptions: VARIANT) -> HRESULT,
	CopyHere: proc "system" (this: ^Folder, vItem: VARIANT, vOptions: VARIANT) -> HRESULT,
	GetDetailsOf: proc "system" (this: ^Folder, vItem: VARIANT, iColumn: i32, pbs: ^BSTR) -> HRESULT,
}
IID_Folder :: GUID{0xBBCBDE60, 0xC3FF, 0x11CE, {0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-folder_enum_mode ]]
FOLDER_ENUM_MODE :: enum i32 {
	VIEWRESULT = 0,
	NAVIGATION = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/folder2-object ]]
Folder2 :: struct #raw_union {
	#subtype Folder: Folder,
	using Vtbl: ^Folder2_Vtbl,
}
Folder2_Vtbl :: struct {
	using Folder_Vtbl: Folder_Vtbl,
	get_Self: proc "system" (this: ^Folder2, ppfi: ^^FolderItem) -> HRESULT,
	get_OfflineStatus: proc "system" (this: ^Folder2, pul: ^i32) -> HRESULT,
	Synchronize: proc "system" (this: ^Folder2) -> HRESULT,
	get_HaveToShowWebViewBarricade: proc "system" (this: ^Folder2, pbHaveToShowWebViewBarricade: ^VARIANT_BOOL) -> HRESULT,
	DismissedWebViewBarricade: proc "system" (this: ^Folder2) -> HRESULT,
}
IID_Folder2 :: GUID{0xF0D2D8EF, 0x3890, 0x11D2, {0xBF, 0x8B, 0x00, 0xC0, 0x4F, 0xB9, 0x36, 0x61}}

Folder3 :: struct #raw_union {
	#subtype Folder2: Folder2,
	using Vtbl: ^Folder3_Vtbl,
}
Folder3_Vtbl :: struct {
	using Folder2_Vtbl: Folder2_Vtbl,
	get_ShowWebViewBarricade: proc "system" (this: ^Folder3, pbShowWebViewBarricade: ^VARIANT_BOOL) -> HRESULT,
	put_ShowWebViewBarricade: proc "system" (this: ^Folder3, bShowWebViewBarricade: VARIANT_BOOL) -> HRESULT,
}
IID_Folder3 :: GUID{0xA7AE5F64, 0xC4D7, 0x4D7F, {0x93, 0x07, 0x4D, 0x24, 0xEE, 0x54, 0xB8, 0x41}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-folderflags ]]
FOLDERFLAGS :: distinct bit_set[enum {
	AUTOARRANGE = 0,
	ABBREVIATEDNAMES = 1,
	SNAPTOGRID = 2,
	OWNERDATA = 3,
	BESTFITWINDOW = 4,
	DESKTOP = 5,
	SINGLESEL = 6,
	NOSUBFOLDERS = 7,
	TRANSPARENT = 8,
	NOCLIENTEDGE = 9,
	NOSCROLL = 10,
	ALIGNLEFT = 11,
	NOICONS = 12,
	SHOWSELALWAYS = 13,
	NOVISIBLE = 14,
	SINGLECLICKACTIVATE = 15,
	NOWEBVIEW = 16,
	HIDEFILENAMES = 17,
	CHECKSELECT = 18,
	NOENUMREFRESH = 19,
	NOGROUPING = 20,
	FULLROWSELECT = 21,
	NOFILTERS = 22,
	NOCOLUMNHEADER = 23,
	NOHEADERINALLVIEWS = 24,
	EXTENDEDTILES = 25,
	TRICHECKSELECT = 26,
	AUTOCHECKSELECT = 27,
	NOBROWSERVIEWSTATE = 28,
	SUBSETGROUPS = 29,
	USESEARCHFOLDER = 30,
	ALLOWRTLREADING = 31,
}; i32]
FOLDERFLAGS_NONE :: transmute(FOLDERFLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/folderitem ]]
FolderItem :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^FolderItem_Vtbl,
}
FolderItem_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Application: proc "system" (this: ^FolderItem, ppid: ^^IDispatch) -> HRESULT,
	get_Parent: proc "system" (this: ^FolderItem, ppid: ^^IDispatch) -> HRESULT,
	get_Name: proc "system" (this: ^FolderItem, pbs: ^BSTR) -> HRESULT,
	put_Name: proc "system" (this: ^FolderItem, bs: BSTR) -> HRESULT,
	get_Path: proc "system" (this: ^FolderItem, pbs: ^BSTR) -> HRESULT,
	get_GetLink: proc "system" (this: ^FolderItem, ppid: ^^IDispatch) -> HRESULT,
	get_GetFolder: proc "system" (this: ^FolderItem, ppid: ^^IDispatch) -> HRESULT,
	get_IsLink: proc "system" (this: ^FolderItem, pb: ^VARIANT_BOOL) -> HRESULT,
	get_IsFolder: proc "system" (this: ^FolderItem, pb: ^VARIANT_BOOL) -> HRESULT,
	get_IsFileSystem: proc "system" (this: ^FolderItem, pb: ^VARIANT_BOOL) -> HRESULT,
	get_IsBrowsable: proc "system" (this: ^FolderItem, pb: ^VARIANT_BOOL) -> HRESULT,
	get_ModifyDate: proc "system" (this: ^FolderItem, pdt: ^f64) -> HRESULT,
	put_ModifyDate: proc "system" (this: ^FolderItem, dt: f64) -> HRESULT,
	get_Size: proc "system" (this: ^FolderItem, pul: ^i32) -> HRESULT,
	get_Type: proc "system" (this: ^FolderItem, pbs: ^BSTR) -> HRESULT,
	Verbs: proc "system" (this: ^FolderItem, ppfic: ^^FolderItemVerbs) -> HRESULT,
	InvokeVerb: proc "system" (this: ^FolderItem, vVerb: VARIANT) -> HRESULT,
}
IID_FolderItem :: GUID{0xFAC32C80, 0xCBE4, 0x11CE, {0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00}}

FolderItem2 :: struct #raw_union {
	#subtype FolderItem: FolderItem,
	using Vtbl: ^FolderItem2_Vtbl,
}
FolderItem2_Vtbl :: struct {
	using FolderItem_Vtbl: FolderItem_Vtbl,
	InvokeVerbEx: proc "system" (this: ^FolderItem2, vVerb: VARIANT, vArgs: VARIANT) -> HRESULT,
	ExtendedProperty: proc "system" (this: ^FolderItem2, bstrPropName: BSTR, pvRet: ^VARIANT) -> HRESULT,
}
IID_FolderItem2 :: GUID{0xEDC817AA, 0x92B8, 0x11D1, {0xB0, 0x75, 0x00, 0xC0, 0x4F, 0xC3, 0x3A, 0xA5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/folderitems ]]
FolderItems :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^FolderItems_Vtbl,
}
FolderItems_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^FolderItems, plCount: ^i32) -> HRESULT,
	get_Application: proc "system" (this: ^FolderItems, ppid: ^^IDispatch) -> HRESULT,
	get_Parent: proc "system" (this: ^FolderItems, ppid: ^^IDispatch) -> HRESULT,
	Item: proc "system" (this: ^FolderItems, index: VARIANT, ppid: ^^FolderItem) -> HRESULT,
	_NewEnum: proc "system" (this: ^FolderItems, ppunk: ^^IUnknown) -> HRESULT,
}
IID_FolderItems :: GUID{0x744129E0, 0xCBE5, 0x11CE, {0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/folderitems2-object ]]
FolderItems2 :: struct #raw_union {
	#subtype FolderItems: FolderItems,
	using Vtbl: ^FolderItems2_Vtbl,
}
FolderItems2_Vtbl :: struct {
	using FolderItems_Vtbl: FolderItems_Vtbl,
	InvokeVerbEx: proc "system" (this: ^FolderItems2, vVerb: VARIANT, vArgs: VARIANT) -> HRESULT,
}
IID_FolderItems2 :: GUID{0xC94F0AD0, 0xF363, 0x11D2, {0xA3, 0x27, 0x00, 0xC0, 0x4F, 0x8E, 0xEC, 0x7F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/folderitems3-object ]]
FolderItems3 :: struct #raw_union {
	#subtype FolderItems2: FolderItems2,
	using Vtbl: ^FolderItems3_Vtbl,
}
FolderItems3_Vtbl :: struct {
	using FolderItems2_Vtbl: FolderItems2_Vtbl,
	Filter: proc "system" (this: ^FolderItems3, grfFlags: i32, bstrFileSpec: BSTR) -> HRESULT,
	get_Verbs: proc "system" (this: ^FolderItems3, ppfic: ^^FolderItemVerbs) -> HRESULT,
}
IID_FolderItems3 :: GUID{0xEAA7C309, 0xBBEC, 0x49D5, {0x82, 0x1D, 0x64, 0xD9, 0x66, 0xCB, 0x66, 0x7F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/folderitemverb ]]
FolderItemVerb :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^FolderItemVerb_Vtbl,
}
FolderItemVerb_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Application: proc "system" (this: ^FolderItemVerb, ppid: ^^IDispatch) -> HRESULT,
	get_Parent: proc "system" (this: ^FolderItemVerb, ppid: ^^IDispatch) -> HRESULT,
	get_Name: proc "system" (this: ^FolderItemVerb, pbs: ^BSTR) -> HRESULT,
	DoIt: proc "system" (this: ^FolderItemVerb) -> HRESULT,
}
IID_FolderItemVerb :: GUID{0x08EC3E00, 0x50B0, 0x11CF, {0x96, 0x0C, 0x00, 0x80, 0xC7, 0xF4, 0xEE, 0x85}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/folderitemverbs ]]
FolderItemVerbs :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^FolderItemVerbs_Vtbl,
}
FolderItemVerbs_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^FolderItemVerbs, plCount: ^i32) -> HRESULT,
	get_Application: proc "system" (this: ^FolderItemVerbs, ppid: ^^IDispatch) -> HRESULT,
	get_Parent: proc "system" (this: ^FolderItemVerbs, ppid: ^^IDispatch) -> HRESULT,
	Item: proc "system" (this: ^FolderItemVerbs, index: VARIANT, ppid: ^^FolderItemVerb) -> HRESULT,
	_NewEnum: proc "system" (this: ^FolderItemVerbs, ppunk: ^^IUnknown) -> HRESULT,
}
IID_FolderItemVerbs :: GUID{0x1F8352C0, 0x50B0, 0x11CF, {0x96, 0x0C, 0x00, 0x80, 0xC7, 0xF4, 0xEE, 0x85}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-folderlogicalviewmode ]]
FOLDERLOGICALVIEWMODE :: enum i32 {
	UNSPECIFIED = -1,
	FIRST = 1,
	DETAILS = 1,
	TILES = 2,
	ICONS = 3,
	LIST = 4,
	CONTENT = 5,
	LAST = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-foldersetdata ]]
FOLDERSETDATA :: struct {
	_fs: FOLDERSETTINGS,
	_vidRestore: GUID,
	_dwViewPriority: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-foldersettings ]]
FOLDERSETTINGS :: struct {
	ViewMode: u32,
	fFlags: u32,
}

FolderViewHost :: struct {
}
IID_FolderViewHost :: GUID{0x20B1CB23, 0x6968, 0x4EB9, {0xB7, 0xD4, 0xA6, 0x6D, 0x00, 0xD0, 0x7C, 0xEE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-folderviewmode ]]
FOLDERVIEWMODE :: enum i32 {
	AUTO = -1,
	FIRST = 1,
	ICON = 1,
	SMALLICON = 2,
	LIST = 3,
	DETAILS = 4,
	THUMBNAIL = 5,
	TILE = 6,
	THUMBSTRIP = 7,
	CONTENT = 8,
	LAST = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-folderviewoptions ]]
FOLDERVIEWOPTIONS :: distinct bit_set[enum {
	VISTALAYOUT = 0,
	CUSTOMPOSITION = 1,
	CUSTOMORDERING = 2,
	SUPPORTHYPERLINKS = 3,
	NOANIMATIONS = 4,
	NOSCROLLTIPS = 5,
}; i32]
FOLDERVIEWOPTIONS_DEFAULT :: transmute(FOLDERVIEWOPTIONS)i32(0)

FrameworkInputPane :: struct {
}
IID_FrameworkInputPane :: GUID{0xD5120AA3, 0x46BA, 0x44C5, {0x82, 0x2D, 0xCA, 0x80, 0x92, 0xC1, 0xFC, 0x72}}

FreeSpaceCategorizer :: struct {
}
IID_FreeSpaceCategorizer :: GUID{0xB5607793, 0x24AC, 0x44C7, {0x82, 0xE2, 0x83, 0x17, 0x26, 0xAA, 0x6C, 0xB7}}

FSCopyHandler :: struct {
}
IID_FSCopyHandler :: GUID{0xD197380A, 0x0A79, 0x4DC8, {0xA0, 0x33, 0xED, 0x88, 0x2C, 0x2F, 0xA1, 0x4B}}

FVTEXTTYPE :: enum i32 {
	ST_EMPTYTEXT = 0,
}

GenericCredentialProvider :: struct {
}
IID_GenericCredentialProvider :: GUID{0x25CBB996, 0x92ED, 0x457E, {0xB2, 0x8C, 0x47, 0x74, 0x08, 0x4B, 0xD5, 0x62}}

GPFIDL_FLAGS :: enum u32 {
	DEFAULT = 0x00000000,
	ALTNAME = 0x00000001,
	UNCPRINTER = 0x00000002,
}

HDROP :: rawptr

HELP_INFO_TYPE :: enum i32 {
	WINDOW = 1,
	MENUITEM = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-helpinfo ]]
HELPINFO :: struct {
	cbSize: u32,
	iContextType: HELP_INFO_TYPE,
	iCtrlId: i32,
	hItemHandle: HANDLE,
	dwContextId: uintptr,
	MousePos: POINT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-helpwininfoa ]]
HELPWININFOA :: struct {
	wStructSize: i32,
	x: i32,
	y: i32,
	dx: i32,
	dy: i32,
	wMax: i32,
	rgchMember: [2]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-helpwininfow ]]
HELPWININFOW :: struct {
	wStructSize: i32,
	x: i32,
	y: i32,
	dx: i32,
	dy: i32,
	wMax: i32,
	rgchMember: [2]u16,
}

HideInputPaneAnimationCoordinator :: struct {
}
IID_HideInputPaneAnimationCoordinator :: GUID{0x384742B1, 0x2A77, 0x4CB3, {0x8C, 0xF8, 0x11, 0x36, 0xF5, 0xE1, 0x7E, 0x59}}

HLBWIF_FLAGS :: distinct bit_set[enum {
	HASFRAMEWNDINFO = 0,
	HASDOCWNDINFO = 1,
	FRAMEWNDMAXIMIZED = 2,
	DOCWNDMAXIMIZED = 3,
	HASWEBTOOLBARINFO = 4,
	WEBTOOLBARHIDDEN = 5,
}; i32]

HLBWINFO :: struct {
	cbSize: u32,
	grfHLBWIF: u32,
	rcFramePos: RECT,
	rcDocPos: RECT,
	hltbinfo: HLTBINFO,
}

HLFNAMEF :: distinct bit_set[enum {
	TRYCACHE = 0,
	TRYPRETTYTARGET = 1,
	TRYFULLTARGET = 2,
	TRYWIN95SHORTCUT = 3,
}; i32]
HLFNAMEF_DEFAULT :: transmute(HLFNAMEF)i32(0)

HLID_INFO :: enum u32 {
	INVALID = 0x00000000,
	PREVIOUS = 0xFFFFFFFF,
	NEXT = 0xFFFFFFFE,
	CURRENT = 0xFFFFFFFD,
	STACKBOTTOM = 0xFFFFFFFC,
	STACKTOP = 0xFFFFFFFB,
}

HLINKGETREF :: enum i32 {
	DEFAULT = 0,
	ABSOLUTE = 1,
	RELATIVE = 2,
}

HLINKMISC :: enum i32 {
	RELATIVE = 1,
}

HLINKSETF :: enum i32 {
	TARGET = 1,
	LOCATION = 2,
}

HLINKWHICHMK :: enum i32 {
	CONTAINER = 1,
	BASE = 2,
}

HLITEM :: struct {
	uHLID: u32,
	pwzFriendlyName: PWSTR,
}

HLNF :: distinct bit_set[enum {
	INTERNALJUMP = 0,
	OPENINNEWWINDOW = 1,
	NAVIGATINGBACK = 2,
	NAVIGATINGFORWARD = 3,
	NAVIGATINGTOSTACKITEM = 4,
	CREATENOHISTORY = 5,
}; u32]

HLQF_INFO :: enum i32 {
	ISVALID = 1,
	ISCURRENT = 2,
}

HLSHORTCUTF :: enum i32 {
	DEFAULT = 0,
	DONTACTUALLYCREATE = 1,
	USEFILENAMEFROMFRIENDLYNAME = 2,
	USEUNIQUEFILENAME = 4,
	MAYUSEEXISTINGSHORTCUT = 8,
}

HLSR :: enum i32 {
	HOME = 0,
	SEARCHPAGE = 1,
	HISTORYFOLDER = 2,
}

HLTB_INFO :: enum i32 {
	DOCKEDLEFT = 0,
	DOCKEDTOP = 1,
	DOCKEDRIGHT = 2,
	DOCKEDBOTTOM = 3,
	FLOATING = 4,
}

HLTBINFO :: struct {
	uDockType: u32,
	rcTbPos: RECT,
}

HLTRANSLATEF :: enum i32 {
	DEFAULT = 0,
	DONTAPPLYDEFAULTPREFIX = 1,
}

HomeGroup :: struct {
}
IID_HomeGroup :: GUID{0xDE77BA04, 0x3C92, 0x4D11, {0xA1, 0xA5, 0x42, 0x35, 0x2A, 0x53, 0xE0, 0xE3}}

HOMEGROUPSHARINGCHOICES :: distinct bit_set[enum {
	MUSICLIBRARY = 0,
	PICTURESLIBRARY = 1,
	VIDEOSLIBRARY = 2,
	DOCUMENTSLIBRARY = 3,
	PRINTERS = 4,
}; i32]
HOMEGROUPSHARINGCHOICES_NONE :: transmute(HOMEGROUPSHARINGCHOICES)i32(0)

HPSXA :: rawptr

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iaccessibilitydockingservice ]]
IAccessibilityDockingService :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAccessibilityDockingService_Vtbl,
}
IAccessibilityDockingService_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetAvailableSize: proc "system" (
		this: ^IAccessibilityDockingService,
		hMonitor: HMONITOR,
		pcxFixed: ^u32,
		pcyMax: ^u32,
	) -> HRESULT,
	DockWindow: proc "system" (
		this: ^IAccessibilityDockingService,
		hwnd: HWND,
		hMonitor: HMONITOR,
		cyRequested: u32,
		pCallback: ^IAccessibilityDockingServiceCallback,
	) -> HRESULT,
	UndockWindow: proc "system" (this: ^IAccessibilityDockingService, hwnd: HWND) -> HRESULT,
}
IID_IAccessibilityDockingService :: GUID{0x8849DC22, 0xCEDF, 0x4C95, {0x99, 0x8D, 0x05, 0x14, 0x19, 0xDD, 0x3F, 0x76}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iaccessibilitydockingservicecallback ]]
IAccessibilityDockingServiceCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAccessibilityDockingServiceCallback_Vtbl,
}
IAccessibilityDockingServiceCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Undocked: proc "system" (
		this: ^IAccessibilityDockingServiceCallback,
		undockReason: UNDOCK_REASON,
	) -> HRESULT,
}
IID_IAccessibilityDockingServiceCallback :: GUID{0x157733FD, 0xA592, 0x42E5, {0xB5, 0x94, 0x24, 0x84, 0x68, 0xC5, 0xA8, 0x1B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iaccessibleobject ]]
IAccessibleObject :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAccessibleObject_Vtbl,
}
IAccessibleObject_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAccessibleName: proc "system" (this: ^IAccessibleObject, pszName: PWSTR) -> HRESULT,
}
IID_IAccessibleObject :: GUID{0x95A391C5, 0x9ED4, 0x4C28, {0x84, 0x01, 0xAB, 0x9E, 0x06, 0x71, 0x9E, 0x11}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iaclist ]]
IACList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IACList_Vtbl,
}
IACList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Expand: proc "system" (this: ^IACList, pszExpand: PWSTR) -> HRESULT,
}
IID_IACList :: GUID{0x77A130B0, 0x94FD, 0x11D0, {0xA5, 0x44, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iaclist2 ]]
IACList2 :: struct #raw_union {
	#subtype IACList: IACList,
	using Vtbl: ^IACList2_Vtbl,
}
IACList2_Vtbl :: struct {
	using IACList_Vtbl: IACList_Vtbl,
	SetOptions: proc "system" (this: ^IACList2, dwFlag: u32) -> HRESULT,
	GetOptions: proc "system" (this: ^IACList2, pdwFlag: ^u32) -> HRESULT,
}
IID_IACList2 :: GUID{0x470141A0, 0x5186, 0x11D2, {0xBB, 0xB6, 0x00, 0x60, 0x97, 0x7B, 0x46, 0x4C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iactionprogress ]]
IActionProgress :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IActionProgress_Vtbl,
}
IActionProgress_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Begin: proc "system" (this: ^IActionProgress, action: SPACTION, flags: u32) -> HRESULT,
	UpdateProgress: proc "system" (this: ^IActionProgress, ulCompleted: u64, ulTotal: u64) -> HRESULT,
	UpdateText: proc "system" (this: ^IActionProgress, sptext: SPTEXT, pszText: PWSTR, fMayCompact: BOOL) -> HRESULT,
	QueryCancel: proc "system" (this: ^IActionProgress, pfCancelled: ^BOOL) -> HRESULT,
	ResetCancel: proc "system" (this: ^IActionProgress) -> HRESULT,
	End: proc "system" (this: ^IActionProgress) -> HRESULT,
}
IID_IActionProgress :: GUID{0x49FF1173, 0xEADC, 0x446D, {0x92, 0x85, 0x15, 0x64, 0x53, 0xA6, 0x43, 0x1C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iactionprogressdialog ]]
IActionProgressDialog :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IActionProgressDialog_Vtbl,
}
IActionProgressDialog_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IActionProgressDialog, flags: u32, pszTitle: PWSTR, pszCancel: PWSTR) -> HRESULT,
	Stop: proc "system" (this: ^IActionProgressDialog) -> HRESULT,
}
IID_IActionProgressDialog :: GUID{0x49FF1172, 0xEADC, 0x446D, {0x92, 0x85, 0x15, 0x64, 0x53, 0xA6, 0x43, 0x1C}}

IAppActivationUIInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAppActivationUIInfo_Vtbl,
}
IAppActivationUIInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetMonitor: proc "system" (this: ^IAppActivationUIInfo, value: ^HMONITOR) -> HRESULT,
	GetInvokePoint: proc "system" (this: ^IAppActivationUIInfo, value: ^POINT) -> HRESULT,
	GetShowCommand: proc "system" (this: ^IAppActivationUIInfo, value: ^i32) -> HRESULT,
	GetShowUI: proc "system" (this: ^IAppActivationUIInfo, value: ^BOOL) -> HRESULT,
	GetKeyState: proc "system" (this: ^IAppActivationUIInfo, value: ^u32) -> HRESULT,
}
IID_IAppActivationUIInfo :: GUID{0xABAD189D, 0x9FA3, 0x4278, {0xB3, 0xCA, 0x8C, 0xA4, 0x48, 0xA8, 0x8D, 0xCB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationactivationmanager ]]
IApplicationActivationManager :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IApplicationActivationManager_Vtbl,
}
IApplicationActivationManager_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ActivateApplication: proc "system" (
		this: ^IApplicationActivationManager,
		appUserModelId: PWSTR,
		arguments: PWSTR,
		options: ACTIVATEOPTIONS,
		processId: ^u32,
	) -> HRESULT,
	ActivateForFile: proc "system" (
		this: ^IApplicationActivationManager,
		appUserModelId: PWSTR,
		itemArray: ^IShellItemArray,
		verb: PWSTR,
		processId: ^u32,
	) -> HRESULT,
	ActivateForProtocol: proc "system" (
		this: ^IApplicationActivationManager,
		appUserModelId: PWSTR,
		itemArray: ^IShellItemArray,
		processId: ^u32,
	) -> HRESULT,
}
IID_IApplicationActivationManager :: GUID{0x2E941141, 0x7F97, 0x4756, {0xBA, 0x1D, 0x9D, 0xEC, 0xDE, 0x89, 0x4A, 0x3D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationassociationregistration ]]
IApplicationAssociationRegistration :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IApplicationAssociationRegistration_Vtbl,
}
IApplicationAssociationRegistration_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryCurrentDefault: proc "system" (
		this: ^IApplicationAssociationRegistration,
		pszQuery: PWSTR,
		atQueryType: ASSOCIATIONTYPE,
		alQueryLevel: ASSOCIATIONLEVEL,
		ppszAssociation: ^PWSTR,
	) -> HRESULT,
	QueryAppIsDefault: proc "system" (
		this: ^IApplicationAssociationRegistration,
		pszQuery: PWSTR,
		atQueryType: ASSOCIATIONTYPE,
		alQueryLevel: ASSOCIATIONLEVEL,
		pszAppRegistryName: PWSTR,
		pfDefault: ^BOOL,
	) -> HRESULT,
	QueryAppIsDefaultAll: proc "system" (
		this: ^IApplicationAssociationRegistration,
		alQueryLevel: ASSOCIATIONLEVEL,
		pszAppRegistryName: PWSTR,
		pfDefault: ^BOOL,
	) -> HRESULT,
	SetAppAsDefault: proc "system" (
		this: ^IApplicationAssociationRegistration,
		pszAppRegistryName: PWSTR,
		pszSet: PWSTR,
		atSetType: ASSOCIATIONTYPE,
	) -> HRESULT,
	SetAppAsDefaultAll: proc "system" (this: ^IApplicationAssociationRegistration, pszAppRegistryName: PWSTR) -> HRESULT,
	ClearUserAssociations: proc "system" (this: ^IApplicationAssociationRegistration) -> HRESULT,
}
IID_IApplicationAssociationRegistration :: GUID{0x4E530B0A, 0xE611, 0x4C77, {0xA3, 0xAC, 0x90, 0x31, 0xD0, 0x22, 0x28, 0x1B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iapplicationassociationregistrationui ]]
IApplicationAssociationRegistrationUI :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IApplicationAssociationRegistrationUI_Vtbl,
}
IApplicationAssociationRegistrationUI_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	LaunchAdvancedAssociationUI: proc "system" (
		this: ^IApplicationAssociationRegistrationUI,
		pszAppRegistryName: PWSTR,
	) -> HRESULT,
}
IID_IApplicationAssociationRegistrationUI :: GUID{0x1F76A169, 0xF994, 0x40AC, {0x8F, 0xC8, 0x09, 0x59, 0xE8, 0x87, 0x47, 0x10}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings ]]
IApplicationDesignModeSettings :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IApplicationDesignModeSettings_Vtbl,
}
IApplicationDesignModeSettings_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetNativeDisplaySize: proc "system" (this: ^IApplicationDesignModeSettings, nativeDisplaySizePixels: SIZE) -> HRESULT,
	SetScaleFactor: proc "system" (
		this: ^IApplicationDesignModeSettings,
		scaleFactor: DEVICE_SCALE_FACTOR,
	) -> HRESULT,
	SetApplicationViewState: proc "system" (
		this: ^IApplicationDesignModeSettings,
		viewState: APPLICATION_VIEW_STATE,
	) -> HRESULT,
	ComputeApplicationSize: proc "system" (this: ^IApplicationDesignModeSettings, applicationSizePixels: ^SIZE) -> HRESULT,
	IsApplicationViewStateSupported: proc "system" (
		this: ^IApplicationDesignModeSettings,
		viewState: APPLICATION_VIEW_STATE,
		nativeDisplaySizePixels: SIZE,
		scaleFactor: DEVICE_SCALE_FACTOR,
		supported: ^BOOL,
	) -> HRESULT,
	TriggerEdgeGesture: proc "system" (
		this: ^IApplicationDesignModeSettings,
		edgeGestureKind: EDGE_GESTURE_KIND,
	) -> HRESULT,
}
IID_IApplicationDesignModeSettings :: GUID{0x2A3DEE9A, 0xE31D, 0x46D6, {0x85, 0x08, 0xBC, 0xC5, 0x97, 0xDB, 0x35, 0x57}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationdesignmodesettings2 ]]
IApplicationDesignModeSettings2 :: struct #raw_union {
	#subtype IApplicationDesignModeSettings: IApplicationDesignModeSettings,
	using Vtbl: ^IApplicationDesignModeSettings2_Vtbl,
}
IApplicationDesignModeSettings2_Vtbl :: struct {
	using IApplicationDesignModeSettings_Vtbl: IApplicationDesignModeSettings_Vtbl,
	SetNativeDisplayOrientation: proc "system" (
		this: ^IApplicationDesignModeSettings2,
		nativeDisplayOrientation: NATIVE_DISPLAY_ORIENTATION,
	) -> HRESULT,
	SetApplicationViewOrientation: proc "system" (
		this: ^IApplicationDesignModeSettings2,
		viewOrientation: APPLICATION_VIEW_ORIENTATION,
	) -> HRESULT,
	SetAdjacentDisplayEdges: proc "system" (
		this: ^IApplicationDesignModeSettings2,
		adjacentDisplayEdges: ADJACENT_DISPLAY_EDGES,
	) -> HRESULT,
	SetIsOnLockScreen: proc "system" (this: ^IApplicationDesignModeSettings2, isOnLockScreen: BOOL) -> HRESULT,
	SetApplicationViewMinWidth: proc "system" (
		this: ^IApplicationDesignModeSettings2,
		viewMinWidth: APPLICATION_VIEW_MIN_WIDTH,
	) -> HRESULT,
	GetApplicationSizeBounds: proc "system" (
		this: ^IApplicationDesignModeSettings2,
		minApplicationSizePixels: ^SIZE,
		maxApplicationSizePixels: ^SIZE,
	) -> HRESULT,
	GetApplicationViewOrientation: proc "system" (
		this: ^IApplicationDesignModeSettings2,
		applicationSizePixels: SIZE,
		viewOrientation: ^APPLICATION_VIEW_ORIENTATION,
	) -> HRESULT,
}
IID_IApplicationDesignModeSettings2 :: GUID{0x490514E1, 0x675A, 0x4D6E, {0xA5, 0x8D, 0xE5, 0x49, 0x01, 0xB4, 0xCA, 0x2F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationdestinations ]]
IApplicationDestinations :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IApplicationDestinations_Vtbl,
}
IApplicationDestinations_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAppID: proc "system" (this: ^IApplicationDestinations, pszAppID: PWSTR) -> HRESULT,
	RemoveDestination: proc "system" (this: ^IApplicationDestinations, punk: ^IUnknown) -> HRESULT,
	RemoveAllDestinations: proc "system" (this: ^IApplicationDestinations) -> HRESULT,
}
IID_IApplicationDestinations :: GUID{0x12337D35, 0x94C6, 0x48A0, {0xBC, 0xE7, 0x6A, 0x9C, 0x69, 0xD4, 0xD6, 0x00}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iapplicationdocumentlists ]]
IApplicationDocumentLists :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IApplicationDocumentLists_Vtbl,
}
IApplicationDocumentLists_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAppID: proc "system" (this: ^IApplicationDocumentLists, pszAppID: PWSTR) -> HRESULT,
	GetList: proc "system" (
		this: ^IApplicationDocumentLists,
		listtype: APPDOCLISTTYPE,
		cItemsDesired: u32,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
}
IID_IApplicationDocumentLists :: GUID{0x3C594F9F, 0x9F30, 0x47A1, {0x97, 0x9A, 0xC9, 0xE8, 0x3D, 0x3D, 0x0A, 0x06}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/nn-shappmgr-iapppublisher ]]
IAppPublisher :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAppPublisher_Vtbl,
}
IAppPublisher_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetNumberOfCategories: proc "system" (this: ^IAppPublisher, pdwCat: ^u32) -> HRESULT,
	GetCategories: proc "system" (this: ^IAppPublisher, pAppCategoryList: ^APPCATEGORYINFOLIST) -> HRESULT,
	GetNumberOfApps: proc "system" (this: ^IAppPublisher, pdwApps: ^u32) -> HRESULT,
	EnumApps: proc "system" (this: ^IAppPublisher, pAppCategoryId: ^GUID, ppepa: ^^IEnumPublishedApps) -> HRESULT,
}
IID_IAppPublisher :: GUID{0x07250A10, 0x9CF9, 0x11D1, {0x90, 0x76, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iappvisibility ]]
IAppVisibility :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAppVisibility_Vtbl,
}
IAppVisibility_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetAppVisibilityOnMonitor: proc "system" (this: ^IAppVisibility, hMonitor: HMONITOR, pMode: ^MONITOR_APP_VISIBILITY) -> HRESULT,
	IsLauncherVisible: proc "system" (this: ^IAppVisibility, pfVisible: ^BOOL) -> HRESULT,
	Advise: proc "system" (this: ^IAppVisibility, pCallback: ^IAppVisibilityEvents, pdwCookie: ^u32) -> HRESULT,
	Unadvise: proc "system" (this: ^IAppVisibility, dwCookie: u32) -> HRESULT,
}
IID_IAppVisibility :: GUID{0x2246EA2D, 0xCAEA, 0x4444, {0xA3, 0xC4, 0x6D, 0xE8, 0x27, 0xE4, 0x43, 0x13}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iappvisibilityevents ]]
IAppVisibilityEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAppVisibilityEvents_Vtbl,
}
IAppVisibilityEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AppVisibilityOnMonitorChanged: proc "system" (
		this: ^IAppVisibilityEvents,
		hMonitor: HMONITOR,
		previousMode: MONITOR_APP_VISIBILITY,
		currentMode: MONITOR_APP_VISIBILITY,
	) -> HRESULT,
	LauncherVisibilityChange: proc "system" (this: ^IAppVisibilityEvents, currentVisibleState: BOOL) -> HRESULT,
}
IID_IAppVisibilityEvents :: GUID{0x6584CE6B, 0x7D82, 0x49C2, {0x89, 0xC9, 0xC6, 0xBC, 0x02, 0xBA, 0x8C, 0x38}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iassochandler ]]
IAssocHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAssocHandler_Vtbl,
}
IAssocHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetName: proc "system" (this: ^IAssocHandler, ppsz: ^PWSTR) -> HRESULT,
	GetUIName: proc "system" (this: ^IAssocHandler, ppsz: ^PWSTR) -> HRESULT,
	GetIconLocation: proc "system" (this: ^IAssocHandler, ppszPath: ^PWSTR, pIndex: ^i32) -> HRESULT,
	IsRecommended: proc "system" (this: ^IAssocHandler) -> HRESULT,
	MakeDefault: proc "system" (this: ^IAssocHandler, pszDescription: PWSTR) -> HRESULT,
	Invoke: proc "system" (this: ^IAssocHandler, pdo: ^IDataObject) -> HRESULT,
	CreateInvoker: proc "system" (this: ^IAssocHandler, pdo: ^IDataObject, ppInvoker: ^^IAssocHandlerInvoker) -> HRESULT,
}
IID_IAssocHandler :: GUID{0xF04061AC, 0x1659, 0x4A3F, {0xA9, 0x54, 0x77, 0x5A, 0xA5, 0x7F, 0xC0, 0x83}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iassochandlerinvoker ]]
IAssocHandlerInvoker :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAssocHandlerInvoker_Vtbl,
}
IAssocHandlerInvoker_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SupportsSelection: proc "system" (this: ^IAssocHandlerInvoker) -> HRESULT,
	Invoke: proc "system" (this: ^IAssocHandlerInvoker) -> HRESULT,
}
IID_IAssocHandlerInvoker :: GUID{0x92218CAB, 0xECAA, 0x4335, {0x81, 0x33, 0x80, 0x7F, 0xD2, 0x34, 0xC2, 0xEE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iattachmentexecute ]]
IAttachmentExecute :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAttachmentExecute_Vtbl,
}
IAttachmentExecute_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetClientTitle: proc "system" (this: ^IAttachmentExecute, pszTitle: PWSTR) -> HRESULT,
	SetClientGuid: proc "system" (this: ^IAttachmentExecute, #by_ptr guid: GUID) -> HRESULT,
	SetLocalPath: proc "system" (this: ^IAttachmentExecute, pszLocalPath: PWSTR) -> HRESULT,
	SetFileName: proc "system" (this: ^IAttachmentExecute, pszFileName: PWSTR) -> HRESULT,
	SetSource: proc "system" (this: ^IAttachmentExecute, pszSource: PWSTR) -> HRESULT,
	SetReferrer: proc "system" (this: ^IAttachmentExecute, pszReferrer: PWSTR) -> HRESULT,
	CheckPolicy: proc "system" (this: ^IAttachmentExecute) -> HRESULT,
	Prompt: proc "system" (
		this: ^IAttachmentExecute,
		hwnd: HWND,
		prompt: ATTACHMENT_PROMPT,
		paction: ^ATTACHMENT_ACTION,
	) -> HRESULT,
	Save: proc "system" (this: ^IAttachmentExecute) -> HRESULT,
	Execute: proc "system" (this: ^IAttachmentExecute, hwnd: HWND, pszVerb: PWSTR, phProcess: ^HANDLE) -> HRESULT,
	SaveWithUI: proc "system" (this: ^IAttachmentExecute, hwnd: HWND) -> HRESULT,
	ClearClientState: proc "system" (this: ^IAttachmentExecute) -> HRESULT,
}
IID_IAttachmentExecute :: GUID{0x73DB1241, 0x1E85, 0x4581, {0x8E, 0x4F, 0xA8, 0x1E, 0x1D, 0x0F, 0x8C, 0x57}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-iautocomplete ]]
IAutoComplete :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAutoComplete_Vtbl,
}
IAutoComplete_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Init: proc "system" (
		this: ^IAutoComplete,
		hwndEdit: HWND,
		punkACL: ^IUnknown,
		pwszRegKeyPath: PWSTR,
		pwszQuickComplete: PWSTR,
	) -> HRESULT,
	Enable: proc "system" (this: ^IAutoComplete, fEnable: BOOL) -> HRESULT,
}
IID_IAutoComplete :: GUID{0x00BB2762, 0x6A77, 0x11D0, {0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-iautocomplete2 ]]
IAutoComplete2 :: struct #raw_union {
	#subtype IAutoComplete: IAutoComplete,
	using Vtbl: ^IAutoComplete2_Vtbl,
}
IAutoComplete2_Vtbl :: struct {
	using IAutoComplete_Vtbl: IAutoComplete_Vtbl,
	SetOptions: proc "system" (this: ^IAutoComplete2, dwFlag: u32) -> HRESULT,
	GetOptions: proc "system" (this: ^IAutoComplete2, pdwFlag: ^u32) -> HRESULT,
}
IID_IAutoComplete2 :: GUID{0xEAC04BC0, 0x3791, 0x11D2, {0xBB, 0x95, 0x00, 0x60, 0x97, 0x7B, 0x46, 0x4C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iautocompletedropdown ]]
IAutoCompleteDropDown :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IAutoCompleteDropDown_Vtbl,
}
IAutoCompleteDropDown_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDropDownStatus: proc "system" (this: ^IAutoCompleteDropDown, pdwFlags: ^u32, ppwszString: ^PWSTR) -> HRESULT,
	ResetEnumerator: proc "system" (this: ^IAutoCompleteDropDown) -> HRESULT,
}
IID_IAutoCompleteDropDown :: GUID{0x3CD141F4, 0x3C6A, 0x11D2, {0xBC, 0xAA, 0x00, 0xC0, 0x4F, 0xD9, 0x29, 0xDB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ibandhost ]]
IBandHost :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBandHost_Vtbl,
}
IBandHost_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateBand: proc "system" (
		this: ^IBandHost,
		#by_ptr rclsidBand: GUID,
		fAvailable: BOOL,
		fVisible: BOOL,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	SetBandAvailability: proc "system" (this: ^IBandHost, #by_ptr rclsidBand: GUID, fAvailable: BOOL) -> HRESULT,
	DestroyBand: proc "system" (this: ^IBandHost, #by_ptr rclsidBand: GUID) -> HRESULT,
}
IID_IBandHost :: GUID{0xB9075C7C, 0xD48E, 0x403F, {0xAB, 0x99, 0xD6, 0xC7, 0x7A, 0x10, 0x84, 0xAC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ibandsite ]]
IBandSite :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBandSite_Vtbl,
}
IBandSite_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AddBand: proc "system" (this: ^IBandSite, punk: ^IUnknown) -> HRESULT,
	EnumBands: proc "system" (this: ^IBandSite, uBand: u32, pdwBandID: ^u32) -> HRESULT,
	QueryBand: proc "system" (
		this: ^IBandSite,
		dwBandID: u32,
		ppstb: ^^IDeskBand,
		pdwState: ^u32,
		pszName: PWSTR,
		cchName: i32,
	) -> HRESULT,
	SetBandState: proc "system" (this: ^IBandSite, dwBandID: u32, dwMask: u32, dwState: u32) -> HRESULT,
	RemoveBand: proc "system" (this: ^IBandSite, dwBandID: u32) -> HRESULT,
	GetBandObject: proc "system" (this: ^IBandSite, dwBandID: u32, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	SetBandSiteInfo: proc "system" (this: ^IBandSite, #by_ptr pbsinfo: BANDSITEINFO) -> HRESULT,
	GetBandSiteInfo: proc "system" (this: ^IBandSite, pbsinfo: ^BANDSITEINFO) -> HRESULT,
}
IID_IBandSite :: GUID{0x4CF504B0, 0xDE96, 0x11D0, {0x8B, 0x3F, 0x00, 0xA0, 0xC9, 0x11, 0xE8, 0xE5}}

IBanneredBar :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBanneredBar_Vtbl,
}
IBanneredBar_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetIconSize: proc "system" (this: ^IBanneredBar, iIcon: u32) -> HRESULT,
	GetIconSize: proc "system" (this: ^IBanneredBar, piIcon: ^u32) -> HRESULT,
	SetBitmap: proc "system" (this: ^IBanneredBar, hBitmap: HBITMAP) -> HRESULT,
	GetBitmap: proc "system" (this: ^IBanneredBar, phBitmap: ^HBITMAP) -> HRESULT,
}
IID_IBanneredBar :: GUID{0x596A9A94, 0x013E, 0x11D1, {0x8D, 0x34, 0x00, 0xA0, 0xC9, 0x0F, 0x27, 0x19}}

IBannerNotificationHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBannerNotificationHandler_Vtbl,
}
IBannerNotificationHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnBannerEvent: proc "system" (
		this: ^IBannerNotificationHandler,
		#by_ptr notification: BANNER_NOTIFICATION,
	) -> HRESULT,
}
IID_IBannerNotificationHandler :: GUID{0x8D7B2BA7, 0xDB05, 0x46A8, {0x82, 0x3C, 0xD2, 0xB6, 0xDE, 0x08, 0xEE, 0x91}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ibrowserframeoptions ]]
IBrowserFrameOptions :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBrowserFrameOptions_Vtbl,
}
IBrowserFrameOptions_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetFrameOptions: proc "system" (this: ^IBrowserFrameOptions, dwMask: u32, pdwOptions: ^u32) -> HRESULT,
}
IID_IBrowserFrameOptions :: GUID{0x10DF43C8, 0x1DBE, 0x11D3, {0x8B, 0x34, 0x00, 0x60, 0x97, 0xDF, 0x5B, 0xD4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ibrowserservice ]]
IBrowserService :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IBrowserService_Vtbl,
}
IBrowserService_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetParentSite: proc "system" (this: ^IBrowserService, ppipsite: ^^IOleInPlaceSite) -> HRESULT,
	SetTitle: proc "system" (this: ^IBrowserService, psv: ^IShellView, pszName: PWSTR) -> HRESULT,
	GetTitle: proc "system" (this: ^IBrowserService, psv: ^IShellView, pszName: PWSTR, cchName: u32) -> HRESULT,
	GetOleObject: proc "system" (this: ^IBrowserService, ppobjv: ^^IOleObject) -> HRESULT,
	GetTravelLog: proc "system" (this: ^IBrowserService, pptl: ^^ITravelLog) -> HRESULT,
	ShowControlWindow: proc "system" (this: ^IBrowserService, id: u32, fShow: BOOL) -> HRESULT,
	IsControlWindowShown: proc "system" (this: ^IBrowserService, id: u32, pfShown: ^BOOL) -> HRESULT,
	IEGetDisplayName: proc "system" (this: ^IBrowserService, pidl: ^ITEMIDLIST, pwszName: PWSTR, uFlags: u32) -> HRESULT,
	IEParseDisplayName: proc "system" (this: ^IBrowserService, uiCP: u32, pwszPath: PWSTR, ppidlOut: ^ITEMIDLIST) -> HRESULT,
	DisplayParseError: proc "system" (this: ^IBrowserService, hres: HRESULT, pwszPath: PWSTR) -> HRESULT,
	NavigateToPidl: proc "system" (this: ^IBrowserService, pidl: ^ITEMIDLIST, grfHLNF: u32) -> HRESULT,
	SetNavigateState: proc "system" (this: ^IBrowserService, bnstate: BNSTATE) -> HRESULT,
	GetNavigateState: proc "system" (this: ^IBrowserService, pbnstate: ^BNSTATE) -> HRESULT,
	NotifyRedirect: proc "system" (
		this: ^IBrowserService,
		psv: ^IShellView,
		pidl: ^ITEMIDLIST,
		pfDidBrowse: ^BOOL,
	) -> HRESULT,
	UpdateWindowList: proc "system" (this: ^IBrowserService) -> HRESULT,
	UpdateBackForwardState: proc "system" (this: ^IBrowserService) -> HRESULT,
	SetFlags: proc "system" (this: ^IBrowserService, dwFlags: u32, dwFlagMask: u32) -> HRESULT,
	GetFlags: proc "system" (this: ^IBrowserService, pdwFlags: ^u32) -> HRESULT,
	CanNavigateNow: proc "system" (this: ^IBrowserService) -> HRESULT,
	GetPidl: proc "system" (this: ^IBrowserService, ppidl: ^ITEMIDLIST) -> HRESULT,
	SetReferrer: proc "system" (this: ^IBrowserService, pidl: ^ITEMIDLIST) -> HRESULT,
	GetBrowserIndex: proc "system" (this: ^IBrowserService) -> u32,
	GetBrowserByIndex: proc "system" (this: ^IBrowserService, dwID: u32, ppunk: ^^IUnknown) -> HRESULT,
	GetHistoryObject: proc "system" (this: ^IBrowserService, ppole: ^^IOleObject, pstm: ^^IStream, ppbc: ^^IBindCtx) -> HRESULT,
	SetHistoryObject: proc "system" (this: ^IBrowserService, pole: ^IOleObject, fIsLocalAnchor: BOOL) -> HRESULT,
	CacheOLEServer: proc "system" (this: ^IBrowserService, pole: ^IOleObject) -> HRESULT,
	GetSetCodePage: proc "system" (this: ^IBrowserService, pvarIn: ^VARIANT, pvarOut: ^VARIANT) -> HRESULT,
	OnHttpEquiv: proc "system" (
		this: ^IBrowserService,
		psv: ^IShellView,
		fDone: BOOL,
		pvarargIn: ^VARIANT,
		pvarargOut: ^VARIANT,
	) -> HRESULT,
	GetPalette: proc "system" (this: ^IBrowserService, hpal: ^HPALETTE) -> HRESULT,
	RegisterWindow: proc "system" (
		this: ^IBrowserService,
		fForceRegister: BOOL,
		swc: ShellWindowTypeConstants,
	) -> HRESULT,
}
IID_IBrowserService :: GUID{0x02BA3B52, 0x0547, 0x11D1, {0xB8, 0x33, 0x00, 0xC0, 0x4F, 0xC9, 0xB3, 0x1F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ibrowserservice2 ]]
IBrowserService2 :: struct #raw_union {
	#subtype IBrowserService: IBrowserService,
	using Vtbl: ^IBrowserService2_Vtbl,
}
IBrowserService2_Vtbl :: struct {
	using IBrowserService_Vtbl: IBrowserService_Vtbl,
	WndProcBS: proc "system" (this: ^IBrowserService2, hwnd: HWND, uMsg: u32, wParam: WPARAM, lParam: LPARAM) -> LRESULT,
	SetAsDefFolderSettings: proc "system" (this: ^IBrowserService2) -> HRESULT,
	GetViewRect: proc "system" (this: ^IBrowserService2, prc: ^RECT) -> HRESULT,
	OnSize: proc "system" (this: ^IBrowserService2, wParam: WPARAM) -> HRESULT,
	OnCreate: proc "system" (this: ^IBrowserService2, pcs: ^CREATESTRUCTW) -> HRESULT,
	OnCommand: proc "system" (this: ^IBrowserService2, wParam: WPARAM, lParam: LPARAM) -> LRESULT,
	OnDestroy: proc "system" (this: ^IBrowserService2) -> HRESULT,
	OnNotify: proc "system" (this: ^IBrowserService2, pnm: ^NMHDR) -> LRESULT,
	OnSetFocus: proc "system" (this: ^IBrowserService2) -> HRESULT,
	OnFrameWindowActivateBS: proc "system" (this: ^IBrowserService2, fActive: BOOL) -> HRESULT,
	ReleaseShellView: proc "system" (this: ^IBrowserService2) -> HRESULT,
	ActivatePendingView: proc "system" (this: ^IBrowserService2) -> HRESULT,
	CreateViewWindow: proc "system" (
		this: ^IBrowserService2,
		psvNew: ^IShellView,
		psvOld: ^IShellView,
		prcView: ^RECT,
		phwnd: ^HWND,
	) -> HRESULT,
	CreateBrowserPropSheetExt: proc "system" (this: ^IBrowserService2, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetViewWindow: proc "system" (this: ^IBrowserService2, phwndView: ^HWND) -> HRESULT,
	GetBaseBrowserData: proc "system" (this: ^IBrowserService2, pbbd: ^BASEBROWSERDATALH) -> HRESULT,
	PutBaseBrowserData: proc "system" (this: ^IBrowserService2) -> ^BASEBROWSERDATALH,
	InitializeTravelLog: proc "system" (this: ^IBrowserService2, ptl: ^ITravelLog, dw: u32) -> HRESULT,
	SetTopBrowser: proc "system" (this: ^IBrowserService2) -> HRESULT,
	Offline: proc "system" (this: ^IBrowserService2, iCmd: i32) -> HRESULT,
	AllowViewResize: proc "system" (this: ^IBrowserService2, f: BOOL) -> HRESULT,
	SetActivateState: proc "system" (this: ^IBrowserService2, u: u32) -> HRESULT,
	UpdateSecureLockIcon: proc "system" (this: ^IBrowserService2, eSecureLock: i32) -> HRESULT,
	InitializeDownloadManager: proc "system" (this: ^IBrowserService2) -> HRESULT,
	InitializeTransitionSite: proc "system" (this: ^IBrowserService2) -> HRESULT,
	_Initialize: proc "system" (this: ^IBrowserService2, hwnd: HWND, pauto: ^IUnknown) -> HRESULT,
	_CancelPendingNavigationAsync: proc "system" (this: ^IBrowserService2) -> HRESULT,
	_CancelPendingView: proc "system" (this: ^IBrowserService2) -> HRESULT,
	_MaySaveChanges: proc "system" (this: ^IBrowserService2) -> HRESULT,
	_PauseOrResumeView: proc "system" (this: ^IBrowserService2, fPaused: BOOL) -> HRESULT,
	_DisableModeless: proc "system" (this: ^IBrowserService2) -> HRESULT,
	_NavigateToPidl2: proc "system" (this: ^IBrowserService2, pidl: ^ITEMIDLIST, grfHLNF: u32, dwFlags: u32) -> HRESULT,
	_TryShell2Rename: proc "system" (this: ^IBrowserService2, psv: ^IShellView, pidlNew: ^ITEMIDLIST) -> HRESULT,
	_SwitchActivationNow: proc "system" (this: ^IBrowserService2) -> HRESULT,
	_ExecChildren: proc "system" (
		this: ^IBrowserService2,
		punkBar: ^IUnknown,
		fBroadcast: BOOL,
		pguidCmdGroup: ^GUID,
		nCmdID: u32,
		nCmdexecopt: u32,
		pvarargIn: ^VARIANT,
		pvarargOut: ^VARIANT,
	) -> HRESULT,
	_SendChildren: proc "system" (
		this: ^IBrowserService2,
		hwndBar: HWND,
		fBroadcast: BOOL,
		uMsg: u32,
		wParam: WPARAM,
		lParam: LPARAM,
	) -> HRESULT,
	GetFolderSetData: proc "system" (this: ^IBrowserService2, pfsd: ^FOLDERSETDATA) -> HRESULT,
	_OnFocusChange: proc "system" (this: ^IBrowserService2, itb: u32) -> HRESULT,
	v_ShowHideChildWindows: proc "system" (this: ^IBrowserService2, fChildOnly: BOOL) -> HRESULT,
	_get_itbLastFocus: proc "system" (this: ^IBrowserService2) -> u32,
	_put_itbLastFocus: proc "system" (this: ^IBrowserService2, itbLastFocus: u32) -> HRESULT,
	_UIActivateView: proc "system" (this: ^IBrowserService2, uState: u32) -> HRESULT,
	_GetViewBorderRect: proc "system" (this: ^IBrowserService2, prc: ^RECT) -> HRESULT,
	_UpdateViewRectSize: proc "system" (this: ^IBrowserService2) -> HRESULT,
	_ResizeNextBorder: proc "system" (this: ^IBrowserService2, itb: u32) -> HRESULT,
	_ResizeView: proc "system" (this: ^IBrowserService2) -> HRESULT,
	_GetEffectiveClientArea: proc "system" (this: ^IBrowserService2, lprectBorder: ^RECT, hmon: HMONITOR) -> HRESULT,
	v_GetViewStream: proc "system" (this: ^IBrowserService2, pidl: ^ITEMIDLIST, grfMode: u32, pwszName: PWSTR) -> ^IStream,
	ForwardViewMsg: proc "system" (this: ^IBrowserService2, uMsg: u32, wParam: WPARAM, lParam: LPARAM) -> LRESULT,
	SetAcceleratorMenu: proc "system" (this: ^IBrowserService2, hacc: HACCEL) -> HRESULT,
	_GetToolbarCount: proc "system" (this: ^IBrowserService2) -> i32,
	_GetToolbarItem: proc "system" (this: ^IBrowserService2, itb: i32) -> ^TOOLBARITEM,
	_SaveToolbars: proc "system" (this: ^IBrowserService2, pstm: ^IStream) -> HRESULT,
	_LoadToolbars: proc "system" (this: ^IBrowserService2, pstm: ^IStream) -> HRESULT,
	_CloseAndReleaseToolbars: proc "system" (this: ^IBrowserService2, fClose: BOOL) -> HRESULT,
	v_MayGetNextToolbarFocus: proc "system" (
		this: ^IBrowserService2,
		lpMsg: ^MSG,
		itbNext: u32,
		citb: i32,
		pptbi: ^TOOLBARITEM,
		phwnd: ^HWND,
	) -> HRESULT,
	_ResizeNextBorderHelper: proc "system" (this: ^IBrowserService2, itb: u32, bUseHmonitor: BOOL) -> HRESULT,
	_FindTBar: proc "system" (this: ^IBrowserService2, punkSrc: ^IUnknown) -> u32,
	_SetFocus: proc "system" (this: ^IBrowserService2, ptbi: ^TOOLBARITEM, hwnd: HWND, lpMsg: ^MSG) -> HRESULT,
	v_MayTranslateAccelerator: proc "system" (this: ^IBrowserService2, pmsg: ^MSG) -> HRESULT,
	_GetBorderDWHelper: proc "system" (
		this: ^IBrowserService2,
		punkSrc: ^IUnknown,
		lprectBorder: ^RECT,
		bUseHmonitor: BOOL,
	) -> HRESULT,
	v_CheckZoneCrossing: proc "system" (this: ^IBrowserService2, pidl: ^ITEMIDLIST) -> HRESULT,
}
IID_IBrowserService2 :: GUID{0x68BD21CC, 0x438B, 0x11D2, {0xA5, 0x60, 0x00, 0xA0, 0xC9, 0x2D, 0xBF, 0xE8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ibrowserservice3 ]]
IBrowserService3 :: struct #raw_union {
	#subtype IBrowserService2: IBrowserService2,
	using Vtbl: ^IBrowserService3_Vtbl,
}
IBrowserService3_Vtbl :: struct {
	using IBrowserService2_Vtbl: IBrowserService2_Vtbl,
	_PositionViewWindow: proc "system" (this: ^IBrowserService3, hwnd: HWND, prc: ^RECT) -> HRESULT,
	IEParseDisplayNameEx: proc "system" (
		this: ^IBrowserService3,
		uiCP: u32,
		pwszPath: PWSTR,
		dwFlags: u32,
		ppidlOut: ^ITEMIDLIST,
	) -> HRESULT,
}
IID_IBrowserService3 :: GUID{0x27D7CE21, 0x762D, 0x48F3, {0x86, 0xF3, 0x40, 0xE2, 0xFD, 0x37, 0x49, 0xC4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ibrowserservice4 ]]
IBrowserService4 :: struct #raw_union {
	#subtype IBrowserService3: IBrowserService3,
	using Vtbl: ^IBrowserService4_Vtbl,
}
IBrowserService4_Vtbl :: struct {
	using IBrowserService3_Vtbl: IBrowserService3_Vtbl,
	ActivateView: proc "system" (this: ^IBrowserService4, fPendingView: BOOL) -> HRESULT,
	SaveViewState: proc "system" (this: ^IBrowserService4) -> HRESULT,
	_ResizeAllBorders: proc "system" (this: ^IBrowserService4) -> HRESULT,
}
IID_IBrowserService4 :: GUID{0x639F1BFF, 0xE135, 0x4096, {0xAB, 0xD8, 0xE0, 0xF5, 0x04, 0xD6, 0x49, 0xA4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icategorizer ]]
ICategorizer :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICategorizer_Vtbl,
}
ICategorizer_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDescription: proc "system" (this: ^ICategorizer, pszDesc: PWSTR, cch: u32) -> HRESULT,
	GetCategory: proc "system" (this: ^ICategorizer, cidl: u32, apidl: [^]ITEMIDLIST, rgCategoryIds: [^]u32) -> HRESULT,
	GetCategoryInfo: proc "system" (this: ^ICategorizer, dwCategoryId: u32, pci: ^CATEGORY_INFO) -> HRESULT,
	CompareCategory: proc "system" (
		this: ^ICategorizer,
		csfFlags: CATSORT_FLAGS,
		dwCategoryId1: u32,
		dwCategoryId2: u32,
	) -> HRESULT,
}
IID_ICategorizer :: GUID{0xA3B14589, 0x9174, 0x49A8, {0x89, 0xA3, 0x06, 0xA1, 0xAE, 0x2B, 0x9B, 0xA7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icategoryprovider ]]
ICategoryProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICategoryProvider_Vtbl,
}
ICategoryProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CanCategorizeOnSCID: proc "system" (this: ^ICategoryProvider, #by_ptr pscid: PROPERTYKEY) -> HRESULT,
	GetDefaultCategory: proc "system" (this: ^ICategoryProvider, pguid: ^GUID, pscid: ^PROPERTYKEY) -> HRESULT,
	GetCategoryForSCID: proc "system" (this: ^ICategoryProvider, #by_ptr pscid: PROPERTYKEY, pguid: ^GUID) -> HRESULT,
	EnumCategories: proc "system" (this: ^ICategoryProvider, penum: ^^IEnumGUID) -> HRESULT,
	GetCategoryName: proc "system" (this: ^ICategoryProvider, #by_ptr pguid: GUID, pszName: PWSTR, cch: u32) -> HRESULT,
	CreateCategory: proc "system" (this: ^ICategoryProvider, #by_ptr pguid: GUID, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
}
IID_ICategoryProvider :: GUID{0x9AF64809, 0x5864, 0x4C26, {0xA7, 0x20, 0xC1, 0xF7, 0x8C, 0x08, 0x6E, 0xE3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-icdburn ]]
ICDBurn :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICDBurn_Vtbl,
}
ICDBurn_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetRecorderDriveLetter: proc "system" (this: ^ICDBurn, pszDrive: PWSTR, cch: u32) -> HRESULT,
	Burn: proc "system" (this: ^ICDBurn, hwnd: HWND) -> HRESULT,
	HasRecordableDrive: proc "system" (this: ^ICDBurn, pfHasRecorder: ^BOOL) -> HRESULT,
}
IID_ICDBurn :: GUID{0x3D73A659, 0xE5D0, 0x4D42, {0xAF, 0xC0, 0x51, 0x21, 0xBA, 0x42, 0x5C, 0x8D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-icdburnext ]]
ICDBurnExt :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICDBurnExt_Vtbl,
}
ICDBurnExt_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetSupportedActionTypes: proc "system" (this: ^ICDBurnExt, pdwActions: ^u32) -> HRESULT,
}
IID_ICDBurnExt :: GUID{0x2271DCCA, 0x74FC, 0x4414, {0x8F, 0xB7, 0xC5, 0x6B, 0x05, 0xAC, 0xE2, 0xD7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icolumnmanager ]]
IColumnManager :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IColumnManager_Vtbl,
}
IColumnManager_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetColumnInfo: proc "system" (
		this: ^IColumnManager,
		#by_ptr propkey: PROPERTYKEY,
		#by_ptr pcmci: CM_COLUMNINFO,
	) -> HRESULT,
	GetColumnInfo: proc "system" (this: ^IColumnManager, #by_ptr propkey: PROPERTYKEY, pcmci: ^CM_COLUMNINFO) -> HRESULT,
	GetColumnCount: proc "system" (this: ^IColumnManager, dwFlags: CM_ENUM_FLAGS, puCount: ^u32) -> HRESULT,
	GetColumns: proc "system" (
		this: ^IColumnManager,
		dwFlags: CM_ENUM_FLAGS,
		rgkeyOrder: [^]PROPERTYKEY,
		cColumns: u32,
	) -> HRESULT,
	SetColumns: proc "system" (this: ^IColumnManager, rgkeyOrder: [^]PROPERTYKEY, cVisible: u32) -> HRESULT,
}
IID_IColumnManager :: GUID{0xD8EC27BB, 0x3F3B, 0x4042, {0xB1, 0x0A, 0x4A, 0xCF, 0xD9, 0x24, 0xD4, 0x53}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-icolumnprovider ]]
IColumnProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IColumnProvider_Vtbl,
}
IColumnProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IColumnProvider, psci: ^SHCOLUMNINIT) -> HRESULT,
	GetColumnInfo: proc "system" (this: ^IColumnProvider, dwIndex: u32, psci: ^SHCOLUMNINFO) -> HRESULT,
	GetItemData: proc "system" (
		this: ^IColumnProvider,
		pscid: ^PROPERTYKEY,
		pscd: ^SHCOLUMNDATA,
		pvarData: ^VARIANT,
	) -> HRESULT,
}
IID_IColumnProvider :: GUID{0xE8025004, 0x1C42, 0x11D2, {0xBE, 0x2C, 0x00, 0xA0, 0xC9, 0xA8, 0x3D, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser ]]
ICommDlgBrowser :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICommDlgBrowser_Vtbl,
}
ICommDlgBrowser_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnDefaultCommand: proc "system" (this: ^ICommDlgBrowser, ppshv: ^IShellView) -> HRESULT,
	OnStateChange: proc "system" (this: ^ICommDlgBrowser, ppshv: ^IShellView, uChange: u32) -> HRESULT,
	IncludeObject: proc "system" (this: ^ICommDlgBrowser, ppshv: ^IShellView, pidl: ^ITEMIDLIST) -> HRESULT,
}
IID_ICommDlgBrowser :: GUID{0x000214F1, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icommdlgbrowser2 ]]
ICommDlgBrowser2 :: struct #raw_union {
	#subtype ICommDlgBrowser: ICommDlgBrowser,
	using Vtbl: ^ICommDlgBrowser2_Vtbl,
}
ICommDlgBrowser2_Vtbl :: struct {
	using ICommDlgBrowser_Vtbl: ICommDlgBrowser_Vtbl,
	Notify: proc "system" (this: ^ICommDlgBrowser2, ppshv: ^IShellView, dwNotifyType: u32) -> HRESULT,
	GetDefaultMenuText: proc "system" (this: ^ICommDlgBrowser2, ppshv: ^IShellView, pszText: PWSTR, cchMax: i32) -> HRESULT,
	GetViewFlags: proc "system" (this: ^ICommDlgBrowser2, pdwFlags: ^u32) -> HRESULT,
}
IID_ICommDlgBrowser2 :: GUID{0x10339516, 0x2894, 0x11D2, {0x90, 0x39, 0x00, 0xC0, 0x4F, 0x8E, 0xEB, 0x3E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-icommdlgbrowser3 ]]
ICommDlgBrowser3 :: struct #raw_union {
	#subtype ICommDlgBrowser2: ICommDlgBrowser2,
	using Vtbl: ^ICommDlgBrowser3_Vtbl,
}
ICommDlgBrowser3_Vtbl :: struct {
	using ICommDlgBrowser2_Vtbl: ICommDlgBrowser2_Vtbl,
	OnColumnClicked: proc "system" (this: ^ICommDlgBrowser3, ppshv: ^IShellView, iColumn: i32) -> HRESULT,
	GetCurrentFilter: proc "system" (this: ^ICommDlgBrowser3, pszFileSpec: PWSTR, cchFileSpec: i32) -> HRESULT,
	OnPreViewCreated: proc "system" (this: ^ICommDlgBrowser3, ppshv: ^IShellView) -> HRESULT,
}
IID_ICommDlgBrowser3 :: GUID{0xC8AD25A1, 0x3294, 0x41EE, {0x81, 0x65, 0x71, 0x17, 0x4B, 0xD0, 0x1C, 0x57}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-icomputerinfochangenotify ]]
IComputerInfoChangeNotify :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IComputerInfoChangeNotify_Vtbl,
}
IComputerInfoChangeNotify_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ComputerInfoChanged: proc "system" (this: ^IComputerInfoChangeNotify) -> HRESULT,
}
IID_IComputerInfoChangeNotify :: GUID{0x0DF60D92, 0x6818, 0x46D6, {0xB3, 0x58, 0xD6, 0x61, 0x70, 0xDD, 0xE4, 0x66}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-iconnectablecredentialprovidercredential ]]
IConnectableCredentialProviderCredential :: struct #raw_union {
	#subtype ICredentialProviderCredential: ICredentialProviderCredential,
	using Vtbl: ^IConnectableCredentialProviderCredential_Vtbl,
}
IConnectableCredentialProviderCredential_Vtbl :: struct {
	using ICredentialProviderCredential_Vtbl: ICredentialProviderCredential_Vtbl,
	Connect: proc "system" (
		this: ^IConnectableCredentialProviderCredential,
		pqcws: ^IQueryContinueWithStatus,
	) -> HRESULT,
	Disconnect: proc "system" (this: ^IConnectableCredentialProviderCredential) -> HRESULT,
}
IID_IConnectableCredentialProviderCredential :: GUID{0x9387928B, 0xAC75, 0x4BF9, {0x8A, 0xB2, 0x2B, 0x93, 0xC4, 0xA5, 0x52, 0x90}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontactmanagerinterop ]]
IContactManagerInterop :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IContactManagerInterop_Vtbl,
}
IContactManagerInterop_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ShowContactCardForWindow: proc "system" (
		this: ^IContactManagerInterop,
		appWindow: HWND,
		contact: ^IUnknown,
		#by_ptr selection: RECT,
		preferredPlacement: FLYOUT_PLACEMENT,
	) -> HRESULT,
}
IID_IContactManagerInterop :: GUID{0x99EACBA7, 0xE073, 0x43B6, {0xA8, 0x96, 0x55, 0xAF, 0xE4, 0x8A, 0x08, 0x33}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenu ]]
IContextMenu :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IContextMenu_Vtbl,
}
IContextMenu_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryContextMenu: proc "system" (
		this: ^IContextMenu,
		hmenu: HMENU,
		indexMenu: u32,
		idCmdFirst: u32,
		idCmdLast: u32,
		uFlags: u32,
	) -> HRESULT,
	InvokeCommand: proc "system" (this: ^IContextMenu, pici: ^CMINVOKECOMMANDINFO) -> HRESULT,
	GetCommandString: proc "system" (
		this: ^IContextMenu,
		idCmd: uintptr,
		uType: u32,
		pReserved: ^u32,
		pszName: PSTR,
		cchMax: u32,
	) -> HRESULT,
}
IID_IContextMenu :: GUID{0x000214E4, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenu2 ]]
IContextMenu2 :: struct #raw_union {
	#subtype IContextMenu: IContextMenu,
	using Vtbl: ^IContextMenu2_Vtbl,
}
IContextMenu2_Vtbl :: struct {
	using IContextMenu_Vtbl: IContextMenu_Vtbl,
	HandleMenuMsg: proc "system" (this: ^IContextMenu2, uMsg: u32, wParam: WPARAM, lParam: LPARAM) -> HRESULT,
}
IID_IContextMenu2 :: GUID{0x000214F4, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenu3 ]]
IContextMenu3 :: struct #raw_union {
	#subtype IContextMenu2: IContextMenu2,
	using Vtbl: ^IContextMenu3_Vtbl,
}
IContextMenu3_Vtbl :: struct {
	using IContextMenu2_Vtbl: IContextMenu2_Vtbl,
	HandleMenuMsg2: proc "system" (
		this: ^IContextMenu3,
		uMsg: u32,
		wParam: WPARAM,
		lParam: LPARAM,
		plResult: ^LRESULT,
	) -> HRESULT,
}
IID_IContextMenu3 :: GUID{0xBCFCE0A0, 0xEC17, 0x11D0, {0x8D, 0x10, 0x00, 0xA0, 0xC9, 0x0F, 0x27, 0x19}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenucb ]]
IContextMenuCB :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IContextMenuCB_Vtbl,
}
IContextMenuCB_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CallBack: proc "system" (
		this: ^IContextMenuCB,
		psf: ^IShellFolder,
		hwndOwner: HWND,
		pdtobj: ^IDataObject,
		uMsg: u32,
		wParam: WPARAM,
		lParam: LPARAM,
	) -> HRESULT,
}
IID_IContextMenuCB :: GUID{0x3409E930, 0x5A39, 0x11D1, {0x83, 0xFA, 0x00, 0xA0, 0xC9, 0x0D, 0xC8, 0x49}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icontextmenusite ]]
IContextMenuSite :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IContextMenuSite_Vtbl,
}
IContextMenuSite_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	DoContextMenuPopup: proc "system" (this: ^IContextMenuSite, punkContextMenu: ^IUnknown, fFlags: u32, pt: POINT) -> HRESULT,
}
IID_IContextMenuSite :: GUID{0x0811AEBE, 0x0B87, 0x4C54, {0x9E, 0x72, 0x54, 0x8C, 0xF6, 0x49, 0x01, 0x6B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-icopyhooka ]]
ICopyHookA :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICopyHookA_Vtbl,
}
ICopyHookA_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CopyCallback: proc "system" (
		this: ^ICopyHookA,
		hwnd: HWND,
		wFunc: u32,
		wFlags: u32,
		pszSrcFile: PSTR,
		dwSrcAttribs: u32,
		pszDestFile: PSTR,
		dwDestAttribs: u32,
	) -> u32,
}
IID_ICopyHookA :: GUID{0x000214EF, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-icopyhookw ]]
ICopyHookW :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICopyHookW_Vtbl,
}
ICopyHookW_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CopyCallback: proc "system" (
		this: ^ICopyHookW,
		hwnd: HWND,
		wFunc: u32,
		wFlags: u32,
		pszSrcFile: PWSTR,
		dwSrcAttribs: u32,
		pszDestFile: PWSTR,
		dwDestAttribs: u32,
	) -> u32,
}
IID_ICopyHookW :: GUID{0x000214FC, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icreateprocessinputs ]]
ICreateProcessInputs :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICreateProcessInputs_Vtbl,
}
ICreateProcessInputs_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCreateFlags: proc "system" (this: ^ICreateProcessInputs, pdwCreationFlags: ^u32) -> HRESULT,
	SetCreateFlags: proc "system" (this: ^ICreateProcessInputs, dwCreationFlags: u32) -> HRESULT,
	AddCreateFlags: proc "system" (this: ^ICreateProcessInputs, dwCreationFlags: u32) -> HRESULT,
	SetHotKey: proc "system" (this: ^ICreateProcessInputs, wHotKey: u16) -> HRESULT,
	AddStartupFlags: proc "system" (this: ^ICreateProcessInputs, dwStartupInfoFlags: u32) -> HRESULT,
	SetTitle: proc "system" (this: ^ICreateProcessInputs, pszTitle: PWSTR) -> HRESULT,
	SetEnvironmentVariable: proc "system" (this: ^ICreateProcessInputs, pszName: PWSTR, pszValue: PWSTR) -> HRESULT,
}
IID_ICreateProcessInputs :: GUID{0xF6EF6140, 0xE26F, 0x4D82, {0xBA, 0xC4, 0xE9, 0xBA, 0x5F, 0xD2, 0x39, 0xA8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icreatingprocess ]]
ICreatingProcess :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICreatingProcess_Vtbl,
}
ICreatingProcess_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnCreating: proc "system" (this: ^ICreatingProcess, pcpi: ^ICreateProcessInputs) -> HRESULT,
}
IID_ICreatingProcess :: GUID{0xC2B937A9, 0x3110, 0x4398, {0x8A, 0x56, 0xF3, 0x4C, 0x63, 0x42, 0xD2, 0x44}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovider ]]
ICredentialProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProvider_Vtbl,
}
ICredentialProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetUsageScenario: proc "system" (
		this: ^ICredentialProvider,
		cpus: CREDENTIAL_PROVIDER_USAGE_SCENARIO,
		dwFlags: u32,
	) -> HRESULT,
	SetSerialization: proc "system" (
		this: ^ICredentialProvider,
		#by_ptr pcpcs: CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION,
	) -> HRESULT,
	Advise: proc "system" (
		this: ^ICredentialProvider,
		pcpe: ^ICredentialProviderEvents,
		upAdviseContext: uintptr,
	) -> HRESULT,
	UnAdvise: proc "system" (this: ^ICredentialProvider) -> HRESULT,
	GetFieldDescriptorCount: proc "system" (this: ^ICredentialProvider, pdwCount: ^u32) -> HRESULT,
	GetFieldDescriptorAt: proc "system" (
		this: ^ICredentialProvider,
		dwIndex: u32,
		ppcpfd: ^CREDENTIAL_PROVIDER_FIELD_DESCRIPTOR,
	) -> HRESULT,
	GetCredentialCount: proc "system" (
		this: ^ICredentialProvider,
		pdwCount: ^u32,
		pdwDefault: ^u32,
		pbAutoLogonWithDefault: ^BOOL,
	) -> HRESULT,
	GetCredentialAt: proc "system" (
		this: ^ICredentialProvider,
		dwIndex: u32,
		ppcpc: ^^ICredentialProviderCredential,
	) -> HRESULT,
}
IID_ICredentialProvider :: GUID{0xD27C3481, 0x5A1C, 0x45B2, {0x8A, 0xAA, 0xC2, 0x0E, 0xBB, 0xE8, 0x22, 0x9E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential ]]
ICredentialProviderCredential :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProviderCredential_Vtbl,
}
ICredentialProviderCredential_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Advise: proc "system" (
		this: ^ICredentialProviderCredential,
		pcpce: ^ICredentialProviderCredentialEvents,
	) -> HRESULT,
	UnAdvise: proc "system" (this: ^ICredentialProviderCredential) -> HRESULT,
	SetSelected: proc "system" (this: ^ICredentialProviderCredential, pbAutoLogon: ^BOOL) -> HRESULT,
	SetDeselected: proc "system" (this: ^ICredentialProviderCredential) -> HRESULT,
	GetFieldState: proc "system" (
		this: ^ICredentialProviderCredential,
		dwFieldID: u32,
		pcpfs: ^CREDENTIAL_PROVIDER_FIELD_STATE,
		pcpfis: ^CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE,
	) -> HRESULT,
	GetStringValue: proc "system" (this: ^ICredentialProviderCredential, dwFieldID: u32, ppsz: ^PWSTR) -> HRESULT,
	GetBitmapValue: proc "system" (this: ^ICredentialProviderCredential, dwFieldID: u32, phbmp: ^HBITMAP) -> HRESULT,
	GetCheckboxValue: proc "system" (
		this: ^ICredentialProviderCredential,
		dwFieldID: u32,
		pbChecked: ^BOOL,
		ppszLabel: ^PWSTR,
	) -> HRESULT,
	GetSubmitButtonValue: proc "system" (this: ^ICredentialProviderCredential, dwFieldID: u32, pdwAdjacentTo: ^u32) -> HRESULT,
	GetComboBoxValueCount: proc "system" (
		this: ^ICredentialProviderCredential,
		dwFieldID: u32,
		pcItems: ^u32,
		pdwSelectedItem: ^u32,
	) -> HRESULT,
	GetComboBoxValueAt: proc "system" (
		this: ^ICredentialProviderCredential,
		dwFieldID: u32,
		dwItem: u32,
		ppszItem: ^PWSTR,
	) -> HRESULT,
	SetStringValue: proc "system" (this: ^ICredentialProviderCredential, dwFieldID: u32, psz: PWSTR) -> HRESULT,
	SetCheckboxValue: proc "system" (this: ^ICredentialProviderCredential, dwFieldID: u32, bChecked: BOOL) -> HRESULT,
	SetComboBoxSelectedValue: proc "system" (this: ^ICredentialProviderCredential, dwFieldID: u32, dwSelectedItem: u32) -> HRESULT,
	CommandLinkClicked: proc "system" (this: ^ICredentialProviderCredential, dwFieldID: u32) -> HRESULT,
	GetSerialization: proc "system" (
		this: ^ICredentialProviderCredential,
		pcpgsr: ^CREDENTIAL_PROVIDER_GET_SERIALIZATION_RESPONSE,
		pcpcs: ^CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION,
		ppszOptionalStatusText: ^PWSTR,
		pcpsiOptionalStatusIcon: ^CREDENTIAL_PROVIDER_STATUS_ICON,
	) -> HRESULT,
	ReportResult: proc "system" (
		this: ^ICredentialProviderCredential,
		ntsStatus: NTSTATUS,
		ntsSubstatus: NTSTATUS,
		ppszOptionalStatusText: ^PWSTR,
		pcpsiOptionalStatusIcon: ^CREDENTIAL_PROVIDER_STATUS_ICON,
	) -> HRESULT,
}
IID_ICredentialProviderCredential :: GUID{0x63913A93, 0x40C1, 0x481A, {0x81, 0x8D, 0x40, 0x72, 0xFF, 0x8C, 0x70, 0xCC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidercredential2 ]]
ICredentialProviderCredential2 :: struct #raw_union {
	#subtype ICredentialProviderCredential: ICredentialProviderCredential,
	using Vtbl: ^ICredentialProviderCredential2_Vtbl,
}
ICredentialProviderCredential2_Vtbl :: struct {
	using ICredentialProviderCredential_Vtbl: ICredentialProviderCredential_Vtbl,
	GetUserSid: proc "system" (this: ^ICredentialProviderCredential2, sid: ^PWSTR) -> HRESULT,
}
IID_ICredentialProviderCredential2 :: GUID{0xFD672C54, 0x40EA, 0x4D6E, {0x9B, 0x49, 0xCF, 0xB1, 0xA7, 0x50, 0x7B, 0xD7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents ]]
ICredentialProviderCredentialEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProviderCredentialEvents_Vtbl,
}
ICredentialProviderCredentialEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetFieldState: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		cpfs: CREDENTIAL_PROVIDER_FIELD_STATE,
	) -> HRESULT,
	SetFieldInteractiveState: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		cpfis: CREDENTIAL_PROVIDER_FIELD_INTERACTIVE_STATE,
	) -> HRESULT,
	SetFieldString: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		psz: PWSTR,
	) -> HRESULT,
	SetFieldCheckbox: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		bChecked: BOOL,
		pszLabel: PWSTR,
	) -> HRESULT,
	SetFieldBitmap: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		hbmp: HBITMAP,
	) -> HRESULT,
	SetFieldComboBoxSelectedItem: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		dwSelectedItem: u32,
	) -> HRESULT,
	DeleteFieldComboBoxItem: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		dwItem: u32,
	) -> HRESULT,
	AppendFieldComboBoxItem: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		pszItem: PWSTR,
	) -> HRESULT,
	SetFieldSubmitButton: proc "system" (
		this: ^ICredentialProviderCredentialEvents,
		pcpc: ^ICredentialProviderCredential,
		dwFieldID: u32,
		dwAdjacentTo: u32,
	) -> HRESULT,
	OnCreatingWindow: proc "system" (this: ^ICredentialProviderCredentialEvents, phwndOwner: ^HWND) -> HRESULT,
}
IID_ICredentialProviderCredentialEvents :: GUID{0xFA6FA76B, 0x66B7, 0x4B11, {0x95, 0xF1, 0x86, 0x17, 0x11, 0x18, 0xE8, 0x16}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialevents2 ]]
ICredentialProviderCredentialEvents2 :: struct #raw_union {
	#subtype ICredentialProviderCredentialEvents: ICredentialProviderCredentialEvents,
	using Vtbl: ^ICredentialProviderCredentialEvents2_Vtbl,
}
ICredentialProviderCredentialEvents2_Vtbl :: struct {
	using ICredentialProviderCredentialEvents_Vtbl: ICredentialProviderCredentialEvents_Vtbl,
	BeginFieldUpdates: proc "system" (this: ^ICredentialProviderCredentialEvents2) -> HRESULT,
	EndFieldUpdates: proc "system" (this: ^ICredentialProviderCredentialEvents2) -> HRESULT,
	SetFieldOptions: proc "system" (
		this: ^ICredentialProviderCredentialEvents2,
		credential: ^ICredentialProviderCredential,
		fieldID: u32,
		options: CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS,
	) -> HRESULT,
}
IID_ICredentialProviderCredentialEvents2 :: GUID{0xB53C00B6, 0x9922, 0x4B78, {0xB1, 0xF4, 0xDD, 0xFE, 0x77, 0x4D, 0xC3, 0x9B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidercredentialwithfieldoptions ]]
ICredentialProviderCredentialWithFieldOptions :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProviderCredentialWithFieldOptions_Vtbl,
}
ICredentialProviderCredentialWithFieldOptions_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetFieldOptions: proc "system" (
		this: ^ICredentialProviderCredentialWithFieldOptions,
		fieldID: u32,
		options: ^CREDENTIAL_PROVIDER_CREDENTIAL_FIELD_OPTIONS,
	) -> HRESULT,
}
IID_ICredentialProviderCredentialWithFieldOptions :: GUID{0xDBC6FB30, 0xC843, 0x49E3, {0xA6, 0x45, 0x57, 0x3E, 0x6F, 0x39, 0x44, 0x6A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialproviderevents ]]
ICredentialProviderEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProviderEvents_Vtbl,
}
ICredentialProviderEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CredentialsChanged: proc "system" (this: ^ICredentialProviderEvents, upAdviseContext: uintptr) -> HRESULT,
}
IID_ICredentialProviderEvents :: GUID{0x34201E5A, 0xA787, 0x41A3, {0xA5, 0xA4, 0xBD, 0x6D, 0xCF, 0x2A, 0x85, 0x4E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialproviderfilter ]]
ICredentialProviderFilter :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProviderFilter_Vtbl,
}
ICredentialProviderFilter_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Filter: proc "system" (
		this: ^ICredentialProviderFilter,
		cpus: CREDENTIAL_PROVIDER_USAGE_SCENARIO,
		dwFlags: u32,
		rgclsidProviders: [^]GUID,
		rgbAllow: [^]BOOL,
		cProviders: u32,
	) -> HRESULT,
	UpdateRemoteCredential: proc "system" (
		this: ^ICredentialProviderFilter,
		#by_ptr pcpcsIn: CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION,
		pcpcsOut: ^CREDENTIAL_PROVIDER_CREDENTIAL_SERIALIZATION,
	) -> HRESULT,
}
IID_ICredentialProviderFilter :: GUID{0xA5DA53F9, 0xD475, 0x4080, {0xA1, 0x20, 0x91, 0x0C, 0x4A, 0x73, 0x98, 0x80}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovidersetuserarray ]]
ICredentialProviderSetUserArray :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProviderSetUserArray_Vtbl,
}
ICredentialProviderSetUserArray_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetUserArray: proc "system" (
		this: ^ICredentialProviderSetUserArray,
		users: ^ICredentialProviderUserArray,
	) -> HRESULT,
}
IID_ICredentialProviderSetUserArray :: GUID{0x095C1484, 0x1C0C, 0x4388, {0x9C, 0x6D, 0x50, 0x0E, 0x61, 0xBF, 0x84, 0xBD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovideruser ]]
ICredentialProviderUser :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProviderUser_Vtbl,
}
ICredentialProviderUser_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetSid: proc "system" (this: ^ICredentialProviderUser, sid: ^PWSTR) -> HRESULT,
	GetProviderID: proc "system" (this: ^ICredentialProviderUser, providerID: ^GUID) -> HRESULT,
	GetStringValue: proc "system" (
		this: ^ICredentialProviderUser,
		#by_ptr key: PROPERTYKEY,
		stringValue: ^PWSTR,
	) -> HRESULT,
	GetValue: proc "system" (
		this: ^ICredentialProviderUser,
		#by_ptr key: PROPERTYKEY,
		value: ^PROPVARIANT,
	) -> HRESULT,
}
IID_ICredentialProviderUser :: GUID{0x13793285, 0x3EA6, 0x40FD, {0xB4, 0x20, 0x15, 0xF4, 0x7D, 0xA4, 0x1F, 0xBB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-icredentialprovideruserarray ]]
ICredentialProviderUserArray :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICredentialProviderUserArray_Vtbl,
}
ICredentialProviderUserArray_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetProviderFilter: proc "system" (
		this: ^ICredentialProviderUserArray,
		#by_ptr guidProviderToFilterTo: GUID,
	) -> HRESULT,
	GetAccountOptions: proc "system" (
		this: ^ICredentialProviderUserArray,
		credentialProviderAccountOptions: ^CREDENTIAL_PROVIDER_ACCOUNT_OPTIONS,
	) -> HRESULT,
	GetCount: proc "system" (this: ^ICredentialProviderUserArray, userCount: ^u32) -> HRESULT,
	GetAt: proc "system" (
		this: ^ICredentialProviderUserArray,
		userIndex: u32,
		user: ^^ICredentialProviderUser,
	) -> HRESULT,
}
IID_ICredentialProviderUserArray :: GUID{0x90C119AE, 0x0F18, 0x4520, {0xA1, 0xF1, 0x11, 0x43, 0x66, 0xA4, 0x0F, 0xE8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icurrentitem ]]
ICurrentItem :: struct #raw_union {
	#subtype IRelatedItem: IRelatedItem,
	using Vtbl: ^ICurrentItem_Vtbl,
}
ICurrentItem_Vtbl :: struct {
	using IRelatedItem_Vtbl: IRelatedItem_Vtbl,
}
IID_ICurrentItem :: GUID{0x240A7174, 0xD653, 0x4A1D, {0xA6, 0xD3, 0xD4, 0x94, 0x3C, 0xFB, 0xFE, 0x3D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-icurrentworkingdirectory ]]
ICurrentWorkingDirectory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICurrentWorkingDirectory_Vtbl,
}
ICurrentWorkingDirectory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDirectory: proc "system" (this: ^ICurrentWorkingDirectory, pwzPath: PWSTR, cchSize: u32) -> HRESULT,
	SetDirectory: proc "system" (this: ^ICurrentWorkingDirectory, pwzPath: PWSTR) -> HRESULT,
}
IID_ICurrentWorkingDirectory :: GUID{0x91956D21, 0x9276, 0x11D1, {0x92, 0x1A, 0x00, 0x60, 0x97, 0xDF, 0x5B, 0xD4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-icustomdestinationlist ]]
ICustomDestinationList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICustomDestinationList_Vtbl,
}
ICustomDestinationList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAppID: proc "system" (this: ^ICustomDestinationList, pszAppID: PWSTR) -> HRESULT,
	BeginList: proc "system" (
		this: ^ICustomDestinationList,
		pcMinSlots: ^u32,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	AppendCategory: proc "system" (this: ^ICustomDestinationList, pszCategory: PWSTR, poa: ^IObjectArray) -> HRESULT,
	AppendKnownCategory: proc "system" (this: ^ICustomDestinationList, category: KNOWNDESTCATEGORY) -> HRESULT,
	AddUserTasks: proc "system" (this: ^ICustomDestinationList, poa: ^IObjectArray) -> HRESULT,
	CommitList: proc "system" (this: ^ICustomDestinationList) -> HRESULT,
	GetRemovedDestinations: proc "system" (this: ^ICustomDestinationList, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	DeleteList: proc "system" (this: ^ICustomDestinationList, pszAppID: PWSTR) -> HRESULT,
	AbortList: proc "system" (this: ^ICustomDestinationList) -> HRESULT,
}
IID_ICustomDestinationList :: GUID{0x6332DEBF, 0x87B5, 0x4670, {0x90, 0xC0, 0x5E, 0x57, 0xB4, 0x08, 0xA4, 0x9E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-idataobjectasynccapability ]]
IDataObjectAsyncCapability :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDataObjectAsyncCapability_Vtbl,
}
IDataObjectAsyncCapability_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAsyncMode: proc "system" (this: ^IDataObjectAsyncCapability, fDoOpAsync: BOOL) -> HRESULT,
	GetAsyncMode: proc "system" (this: ^IDataObjectAsyncCapability, pfIsOpAsync: ^BOOL) -> HRESULT,
	StartOperation: proc "system" (this: ^IDataObjectAsyncCapability, pbcReserved: ^IBindCtx) -> HRESULT,
	InOperation: proc "system" (this: ^IDataObjectAsyncCapability, pfInAsyncOp: ^BOOL) -> HRESULT,
	EndOperation: proc "system" (
		this: ^IDataObjectAsyncCapability,
		hResult: HRESULT,
		pbcReserved: ^IBindCtx,
		dwEffects: u32,
	) -> HRESULT,
}
IID_IDataObjectAsyncCapability :: GUID{0x3D8B0590, 0xF691, 0x11D2, {0x8E, 0xA9, 0x00, 0x60, 0x97, 0xDF, 0x5B, 0xD4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idataobjectprovider ]]
IDataObjectProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDataObjectProvider_Vtbl,
}
IDataObjectProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDataObject: proc "system" (this: ^IDataObjectProvider, dataObject: ^^IDataObject) -> HRESULT,
	SetDataObject: proc "system" (this: ^IDataObjectProvider, dataObject: ^IDataObject) -> HRESULT,
}
IID_IDataObjectProvider :: GUID{0x3D25F6D6, 0x4B2A, 0x433C, {0x91, 0x84, 0x7C, 0x33, 0xAD, 0x35, 0xD0, 0x01}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idatatransfermanagerinterop ]]
IDataTransferManagerInterop :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDataTransferManagerInterop_Vtbl,
}
IDataTransferManagerInterop_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetForWindow: proc "system" (
		this: ^IDataTransferManagerInterop,
		appWindow: HWND,
		#by_ptr riid: GUID,
		dataTransferManager: rawptr,
	) -> HRESULT,
	ShowShareUIForWindow: proc "system" (this: ^IDataTransferManagerInterop, appWindow: HWND) -> HRESULT,
}
IID_IDataTransferManagerInterop :: GUID{0x3A3DCD6C, 0x3EAB, 0x43DC, {0xBC, 0xDE, 0x45, 0x67, 0x1C, 0xE8, 0x00, 0xC8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idefaultextracticoninit ]]
IDefaultExtractIconInit :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDefaultExtractIconInit_Vtbl,
}
IDefaultExtractIconInit_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetFlags: proc "system" (this: ^IDefaultExtractIconInit, uFlags: u32) -> HRESULT,
	SetKey: proc "system" (this: ^IDefaultExtractIconInit, hkey: HKEY) -> HRESULT,
	SetNormalIcon: proc "system" (this: ^IDefaultExtractIconInit, pszFile: PWSTR, iIcon: i32) -> HRESULT,
	SetOpenIcon: proc "system" (this: ^IDefaultExtractIconInit, pszFile: PWSTR, iIcon: i32) -> HRESULT,
	SetShortcutIcon: proc "system" (this: ^IDefaultExtractIconInit, pszFile: PWSTR, iIcon: i32) -> HRESULT,
	SetDefaultIcon: proc "system" (this: ^IDefaultExtractIconInit, pszFile: PWSTR, iIcon: i32) -> HRESULT,
}
IID_IDefaultExtractIconInit :: GUID{0x41DED17D, 0xD6B3, 0x4261, {0x99, 0x7D, 0x88, 0xC6, 0x0E, 0x4B, 0x1D, 0x58}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idefaultfoldermenuinitialize ]]
IDefaultFolderMenuInitialize :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDefaultFolderMenuInitialize_Vtbl,
}
IDefaultFolderMenuInitialize_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (
		this: ^IDefaultFolderMenuInitialize,
		hwnd: HWND,
		pcmcb: ^IContextMenuCB,
		pidlFolder: ^ITEMIDLIST,
		psf: ^IShellFolder,
		cidl: u32,
		apidl: [^]ITEMIDLIST,
		punkAssociation: ^IUnknown,
		cKeys: u32,
		aKeys: ^HKEY,
	) -> HRESULT,
	SetMenuRestrictions: proc "system" (
		this: ^IDefaultFolderMenuInitialize,
		dfmrValues: DEFAULT_FOLDER_MENU_RESTRICTIONS,
	) -> HRESULT,
	GetMenuRestrictions: proc "system" (
		this: ^IDefaultFolderMenuInitialize,
		dfmrMask: DEFAULT_FOLDER_MENU_RESTRICTIONS,
		pdfmrValues: ^DEFAULT_FOLDER_MENU_RESTRICTIONS,
	) -> HRESULT,
	SetHandlerClsid: proc "system" (this: ^IDefaultFolderMenuInitialize, #by_ptr rclsid: GUID) -> HRESULT,
}
IID_IDefaultFolderMenuInitialize :: GUID{0x7690AA79, 0xF8FC, 0x4615, {0xA3, 0x27, 0x36, 0xF7, 0xD1, 0x8F, 0x5D, 0x91}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idelegatefolder ]]
IDelegateFolder :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDelegateFolder_Vtbl,
}
IDelegateFolder_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetItemAlloc: proc "system" (this: ^IDelegateFolder, pmalloc: ^IMalloc) -> HRESULT,
}
IID_IDelegateFolder :: GUID{0xADD8BA80, 0x002B, 0x11D0, {0x8F, 0x0F, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idelegateitem ]]
IDelegateItem :: struct #raw_union {
	#subtype IRelatedItem: IRelatedItem,
	using Vtbl: ^IDelegateItem_Vtbl,
}
IDelegateItem_Vtbl :: struct {
	using IRelatedItem_Vtbl: IRelatedItem_Vtbl,
}
IID_IDelegateItem :: GUID{0x3C5A1C94, 0xC951, 0x4CB7, {0xBB, 0x6D, 0x3B, 0x93, 0xF3, 0x0C, 0xCE, 0x93}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ideskband ]]
IDeskBand :: struct #raw_union {
	#subtype IDockingWindow: IDockingWindow,
	using Vtbl: ^IDeskBand_Vtbl,
}
IDeskBand_Vtbl :: struct {
	using IDockingWindow_Vtbl: IDockingWindow_Vtbl,
	GetBandInfo: proc "system" (this: ^IDeskBand, dwBandID: u32, dwViewMode: u32, pdbi: ^DESKBANDINFO) -> HRESULT,
}
IID_IDeskBand :: GUID{0xEB0FE172, 0x1A3A, 0x11D0, {0x89, 0xB3, 0x00, 0xA0, 0xC9, 0x0A, 0x90, 0xAC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ideskband2 ]]
IDeskBand2 :: struct #raw_union {
	#subtype IDeskBand: IDeskBand,
	using Vtbl: ^IDeskBand2_Vtbl,
}
IDeskBand2_Vtbl :: struct {
	using IDeskBand_Vtbl: IDeskBand_Vtbl,
	CanRenderComposited: proc "system" (this: ^IDeskBand2, pfCanRenderComposited: ^BOOL) -> HRESULT,
	SetCompositionState: proc "system" (this: ^IDeskBand2, fCompositionEnabled: BOOL) -> HRESULT,
	GetCompositionState: proc "system" (this: ^IDeskBand2, pfCompositionEnabled: ^BOOL) -> HRESULT,
}
IID_IDeskBand2 :: GUID{0x79D16DE4, 0xABEE, 0x4021, {0x8D, 0x9D, 0x91, 0x69, 0xB2, 0x61, 0xD6, 0x57}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ideskbandinfo ]]
IDeskBandInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDeskBandInfo_Vtbl,
}
IDeskBandInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDefaultBandWidth: proc "system" (this: ^IDeskBandInfo, dwBandID: u32, dwViewMode: u32, pnWidth: ^i32) -> HRESULT,
}
IID_IDeskBandInfo :: GUID{0x77E425FC, 0xCBF9, 0x4307, {0xBA, 0x6A, 0xBB, 0x57, 0x27, 0x74, 0x56, 0x61}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ideskbar ]]
IDeskBar :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IDeskBar_Vtbl,
}
IDeskBar_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	SetClient: proc "system" (this: ^IDeskBar, punkClient: ^IUnknown) -> HRESULT,
	GetClient: proc "system" (this: ^IDeskBar, ppunkClient: ^^IUnknown) -> HRESULT,
	OnPosRectChangeDB: proc "system" (this: ^IDeskBar, prc: ^RECT) -> HRESULT,
}
IID_IDeskBar :: GUID{0xEB0FE173, 0x1A3A, 0x11D0, {0x89, 0xB3, 0x00, 0xA0, 0xC9, 0x0A, 0x90, 0xAC}}

IDeskBarClient :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IDeskBarClient_Vtbl,
}
IDeskBarClient_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	SetDeskBarSite: proc "system" (this: ^IDeskBarClient, punkSite: ^IUnknown) -> HRESULT,
	SetModeDBC: proc "system" (this: ^IDeskBarClient, dwMode: u32) -> HRESULT,
	UIActivateDBC: proc "system" (this: ^IDeskBarClient, dwState: u32) -> HRESULT,
	GetSize: proc "system" (this: ^IDeskBarClient, dwWhich: u32, prc: ^RECT) -> HRESULT,
}
IID_IDeskBarClient :: GUID{0xEB0FE175, 0x1A3A, 0x11D0, {0x89, 0xB3, 0x00, 0xA0, 0xC9, 0x0A, 0x90, 0xAC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-idesktopgadget ]]
IDesktopGadget :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDesktopGadget_Vtbl,
}
IDesktopGadget_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RunGadget: proc "system" (this: ^IDesktopGadget, gadgetPath: PWSTR) -> HRESULT,
}
IID_IDesktopGadget :: GUID{0xC1646BC4, 0xF298, 0x4F91, {0xA2, 0x04, 0xEB, 0x2D, 0xD1, 0x70, 0x9D, 0x1A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idesktopwallpaper ]]
IDesktopWallpaper :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDesktopWallpaper_Vtbl,
}
IDesktopWallpaper_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetWallpaper: proc "system" (this: ^IDesktopWallpaper, monitorID: PWSTR, wallpaper: PWSTR) -> HRESULT,
	GetWallpaper: proc "system" (this: ^IDesktopWallpaper, monitorID: PWSTR, wallpaper: ^PWSTR) -> HRESULT,
	GetMonitorDevicePathAt: proc "system" (this: ^IDesktopWallpaper, monitorIndex: u32, monitorID: ^PWSTR) -> HRESULT,
	GetMonitorDevicePathCount: proc "system" (this: ^IDesktopWallpaper, count: ^u32) -> HRESULT,
	GetMonitorRECT: proc "system" (this: ^IDesktopWallpaper, monitorID: PWSTR, displayRect: ^RECT) -> HRESULT,
	SetBackgroundColor: proc "system" (this: ^IDesktopWallpaper, color: COLORREF) -> HRESULT,
	GetBackgroundColor: proc "system" (this: ^IDesktopWallpaper, color: ^COLORREF) -> HRESULT,
	SetPosition: proc "system" (this: ^IDesktopWallpaper, position: DESKTOP_WALLPAPER_POSITION) -> HRESULT,
	GetPosition: proc "system" (this: ^IDesktopWallpaper, position: ^DESKTOP_WALLPAPER_POSITION) -> HRESULT,
	SetSlideshow: proc "system" (this: ^IDesktopWallpaper, items: ^IShellItemArray) -> HRESULT,
	GetSlideshow: proc "system" (this: ^IDesktopWallpaper, items: ^^IShellItemArray) -> HRESULT,
	SetSlideshowOptions: proc "system" (
		this: ^IDesktopWallpaper,
		options: DESKTOP_SLIDESHOW_OPTIONS,
		slideshowTick: u32,
	) -> HRESULT,
	GetSlideshowOptions: proc "system" (
		this: ^IDesktopWallpaper,
		options: ^DESKTOP_SLIDESHOW_OPTIONS,
		slideshowTick: ^u32,
	) -> HRESULT,
	AdvanceSlideshow: proc "system" (
		this: ^IDesktopWallpaper,
		monitorID: PWSTR,
		direction: DESKTOP_SLIDESHOW_DIRECTION,
	) -> HRESULT,
	GetStatus: proc "system" (this: ^IDesktopWallpaper, state: ^DESKTOP_SLIDESHOW_STATE) -> HRESULT,
	Enable: proc "system" (this: ^IDesktopWallpaper, enable: BOOL) -> HRESULT,
}
IID_IDesktopWallpaper :: GUID{0xB92B56A9, 0x8B55, 0x4E14, {0x9A, 0x89, 0x01, 0x99, 0xBB, 0xB6, 0xF9, 0x3B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idestinationstreamfactory ]]
IDestinationStreamFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDestinationStreamFactory_Vtbl,
}
IDestinationStreamFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDestinationStream: proc "system" (this: ^IDestinationStreamFactory, ppstm: ^^IStream) -> HRESULT,
}
IID_IDestinationStreamFactory :: GUID{0x8A87781B, 0x39A7, 0x4A1F, {0xAA, 0xB3, 0xA3, 0x9B, 0x9C, 0x34, 0xA7, 0xD9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idisplayitem ]]
IDisplayItem :: struct #raw_union {
	#subtype IRelatedItem: IRelatedItem,
	using Vtbl: ^IDisplayItem_Vtbl,
}
IDisplayItem_Vtbl :: struct {
	using IRelatedItem_Vtbl: IRelatedItem_Vtbl,
}
IID_IDisplayItem :: GUID{0xC6FD5997, 0x9F6B, 0x4888, {0x87, 0x03, 0x94, 0xE8, 0x0E, 0x8C, 0xDE, 0x3F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idockingwindow ]]
IDockingWindow :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IDockingWindow_Vtbl,
}
IDockingWindow_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	ShowDW: proc "system" (this: ^IDockingWindow, fShow: BOOL) -> HRESULT,
	CloseDW: proc "system" (this: ^IDockingWindow, dwReserved: u32) -> HRESULT,
	ResizeBorderDW: proc "system" (
		this: ^IDockingWindow,
		prcBorder: ^RECT,
		punkToolbarSite: ^IUnknown,
		fReserved: BOOL,
	) -> HRESULT,
}
IID_IDockingWindow :: GUID{0x012DD920, 0x7B26, 0x11D0, {0x8C, 0xA9, 0x00, 0xA0, 0xC9, 0x2D, 0xBF, 0xE8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-idockingwindowframe ]]
IDockingWindowFrame :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IDockingWindowFrame_Vtbl,
}
IDockingWindowFrame_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	AddToolbar: proc "system" (
		this: ^IDockingWindowFrame,
		punkSrc: ^IUnknown,
		pwszItem: PWSTR,
		dwAddFlags: u32,
	) -> HRESULT,
	RemoveToolbar: proc "system" (this: ^IDockingWindowFrame, punkSrc: ^IUnknown, dwRemoveFlags: u32) -> HRESULT,
	FindToolbar: proc "system" (this: ^IDockingWindowFrame, pwszItem: PWSTR, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
}
IID_IDockingWindowFrame :: GUID{0x47D2657A, 0x7B27, 0x11D0, {0x8C, 0xA9, 0x00, 0xA0, 0xC9, 0x2D, 0xBF, 0xE8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-idockingwindowsite ]]
IDockingWindowSite :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IDockingWindowSite_Vtbl,
}
IDockingWindowSite_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	GetBorderDW: proc "system" (this: ^IDockingWindowSite, punkObj: ^IUnknown, prcBorder: ^RECT) -> HRESULT,
	RequestBorderSpaceDW: proc "system" (this: ^IDockingWindowSite, punkObj: ^IUnknown, pbw: ^RECT) -> HRESULT,
	SetBorderSpaceDW: proc "system" (this: ^IDockingWindowSite, punkObj: ^IUnknown, pbw: ^RECT) -> HRESULT,
}
IID_IDockingWindowSite :: GUID{0x2A342FC2, 0x7B26, 0x11D0, {0x8C, 0xA9, 0x00, 0xA0, 0xC9, 0x2D, 0xBF, 0xE8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-idocviewsite ]]
IDocViewSite :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDocViewSite_Vtbl,
}
IDocViewSite_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnSetTitle: proc "system" (this: ^IDocViewSite, pvTitle: ^VARIANT) -> HRESULT,
}
IID_IDocViewSite :: GUID{0x87D605E0, 0xC511, 0x11CF, {0x89, 0xA9, 0x00, 0xA0, 0xC9, 0x05, 0x41, 0x29}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idragsourcehelper ]]
IDragSourceHelper :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDragSourceHelper_Vtbl,
}
IDragSourceHelper_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	InitializeFromBitmap: proc "system" (this: ^IDragSourceHelper, pshdi: ^SHDRAGIMAGE, pDataObject: ^IDataObject) -> HRESULT,
	InitializeFromWindow: proc "system" (this: ^IDragSourceHelper, hwnd: HWND, ppt: ^POINT, pDataObject: ^IDataObject) -> HRESULT,
}
IID_IDragSourceHelper :: GUID{0xDE5BF786, 0x477A, 0x11D2, {0x83, 0x9D, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-idragsourcehelper2 ]]
IDragSourceHelper2 :: struct #raw_union {
	#subtype IDragSourceHelper: IDragSourceHelper,
	using Vtbl: ^IDragSourceHelper2_Vtbl,
}
IDragSourceHelper2_Vtbl :: struct {
	using IDragSourceHelper_Vtbl: IDragSourceHelper_Vtbl,
	SetFlags: proc "system" (this: ^IDragSourceHelper2, dwFlags: u32) -> HRESULT,
}
IID_IDragSourceHelper2 :: GUID{0x83E07D0D, 0x0C5F, 0x4163, {0xBF, 0x1A, 0x60, 0xB2, 0x74, 0x05, 0x1E, 0x40}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idroptargethelper ]]
IDropTargetHelper :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDropTargetHelper_Vtbl,
}
IDropTargetHelper_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	DragEnter: proc "system" (
		this: ^IDropTargetHelper,
		hwndTarget: HWND,
		pDataObject: ^IDataObject,
		ppt: ^POINT,
		dwEffect: DROPEFFECT,
	) -> HRESULT,
	DragLeave: proc "system" (this: ^IDropTargetHelper) -> HRESULT,
	DragOver: proc "system" (this: ^IDropTargetHelper, ppt: ^POINT, dwEffect: DROPEFFECT) -> HRESULT,
	Drop: proc "system" (
		this: ^IDropTargetHelper,
		pDataObject: ^IDataObject,
		ppt: ^POINT,
		dwEffect: DROPEFFECT,
	) -> HRESULT,
	Show: proc "system" (this: ^IDropTargetHelper, fShow: BOOL) -> HRESULT,
}
IID_IDropTargetHelper :: GUID{0x4657278B, 0x411B, 0x11D2, {0x83, 0x9A, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-idynamichwhandler ]]
IDynamicHWHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDynamicHWHandler_Vtbl,
}
IDynamicHWHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDynamicInfo: proc "system" (
		this: ^IDynamicHWHandler,
		pszDeviceID: PWSTR,
		dwContentType: u32,
		ppszAction: ^PWSTR,
	) -> HRESULT,
}
IID_IDynamicHWHandler :: GUID{0xDC2601D7, 0x059E, 0x42FC, {0xA0, 0x9D, 0x2A, 0xFD, 0x21, 0xB6, 0xD5, 0xF7}}

IENamespaceTreeControl :: struct {
}
IID_IENamespaceTreeControl :: GUID{0xACE52D03, 0xE5CD, 0x4B20, {0x82, 0xFF, 0xE7, 0x1B, 0x11, 0xBE, 0xAE, 0x1D}}

IEnumACString :: struct #raw_union {
	#subtype IEnumString: IEnumString,
	using Vtbl: ^IEnumACString_Vtbl,
}
IEnumACString_Vtbl :: struct {
	using IEnumString_Vtbl: IEnumString_Vtbl,
	NextItem: proc "system" (this: ^IEnumACString, pszUrl: PWSTR, cchMax: u32, pulSortIndex: ^u32) -> HRESULT,
	SetEnumOptions: proc "system" (this: ^IEnumACString, dwOptions: u32) -> HRESULT,
	GetEnumOptions: proc "system" (this: ^IEnumACString, pdwOptions: ^u32) -> HRESULT,
}
IID_IEnumACString :: GUID{0x8E74C210, 0xCF9D, 0x4EAF, {0xA4, 0x03, 0x73, 0x56, 0x42, 0x8F, 0x0A, 0x5A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumassochandlers ]]
IEnumAssocHandlers :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumAssocHandlers_Vtbl,
}
IEnumAssocHandlers_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumAssocHandlers,
		celt: u32,
		rgelt: [^]^IAssocHandler,
		pceltFetched: ^u32,
	) -> HRESULT,
}
IID_IEnumAssocHandlers :: GUID{0x973810AE, 0x9599, 0x4B88, {0x9E, 0x4D, 0x6E, 0xE9, 0x8C, 0x95, 0x52, 0xDA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ienumerableview ]]
IEnumerableView :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumerableView_Vtbl,
}
IEnumerableView_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetEnumReadyCallback: proc "system" (this: ^IEnumerableView, percb: ^IEnumReadyCallback) -> HRESULT,
	CreateEnumIDListFromContents: proc "system" (
		this: ^IEnumerableView,
		pidlFolder: ^ITEMIDLIST,
		dwEnumFlags: u32,
		ppEnumIDList: ^^IEnumIDList,
	) -> HRESULT,
}
IID_IEnumerableView :: GUID{0x8C8BF236, 0x1AEC, 0x495F, {0x98, 0x94, 0x91, 0xD5, 0x7C, 0x3C, 0x68, 0x6F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumexplorercommand ]]
IEnumExplorerCommand :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumExplorerCommand_Vtbl,
}
IEnumExplorerCommand_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumExplorerCommand,
		celt: u32,
		pUICommand: [^]^IExplorerCommand,
		pceltFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumExplorerCommand, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumExplorerCommand) -> HRESULT,
	Clone: proc "system" (this: ^IEnumExplorerCommand, ppenum: ^^IEnumExplorerCommand) -> HRESULT,
}
IID_IEnumExplorerCommand :: GUID{0xA88826F8, 0x186F, 0x4987, {0xAA, 0xDE, 0xEA, 0x0C, 0xEF, 0x8F, 0xBF, 0xE8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumextrasearch ]]
IEnumExtraSearch :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumExtraSearch_Vtbl,
}
IEnumExtraSearch_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumExtraSearch, celt: u32, rgelt: [^]EXTRASEARCH, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumExtraSearch, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumExtraSearch) -> HRESULT,
	Clone: proc "system" (this: ^IEnumExtraSearch, ppenum: ^^IEnumExtraSearch) -> HRESULT,
}
IID_IEnumExtraSearch :: GUID{0x0E700BE1, 0x9DB6, 0x11D1, {0xA1, 0xCE, 0x00, 0xC0, 0x4F, 0xD7, 0x5D, 0x13}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumfullidlist ]]
IEnumFullIDList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumFullIDList_Vtbl,
}
IEnumFullIDList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumFullIDList, celt: u32, rgelt: [^]ITEMIDLIST, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumFullIDList, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumFullIDList) -> HRESULT,
	Clone: proc "system" (this: ^IEnumFullIDList, ppenum: ^^IEnumFullIDList) -> HRESULT,
}
IID_IEnumFullIDList :: GUID{0xD0191542, 0x7954, 0x4908, {0xBC, 0x06, 0xB2, 0x36, 0x0B, 0xBE, 0x45, 0xBA}}

IEnumHLITEM :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumHLITEM_Vtbl,
}
IEnumHLITEM_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumHLITEM, celt: u32, rgelt: ^HLITEM, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumHLITEM, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumHLITEM) -> HRESULT,
	Clone: proc "system" (this: ^IEnumHLITEM, ppienumhlitem: ^^IEnumHLITEM) -> HRESULT,
}
IID_IEnumHLITEM :: GUID{0x79EAC9C6, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumidlist ]]
IEnumIDList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumIDList_Vtbl,
}
IEnumIDList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumIDList, celt: u32, rgelt: [^]ITEMIDLIST, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumIDList, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumIDList) -> HRESULT,
	Clone: proc "system" (this: ^IEnumIDList, ppenum: ^^IEnumIDList) -> HRESULT,
}
IID_IEnumIDList :: GUID{0x000214F2, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumobjects ]]
IEnumObjects :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumObjects_Vtbl,
}
IEnumObjects_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumObjects,
		celt: u32,
		#by_ptr riid: GUID,
		rgelt: rawptr,
		pceltFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumObjects, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumObjects) -> HRESULT,
	Clone: proc "system" (this: ^IEnumObjects, ppenum: ^^IEnumObjects) -> HRESULT,
}
IID_IEnumObjects :: GUID{0x2C1C7E2E, 0x2D0E, 0x4059, {0x83, 0x1E, 0x1E, 0x6F, 0x82, 0x33, 0x5C, 0x2E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/nn-shappmgr-ienumpublishedapps ]]
IEnumPublishedApps :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumPublishedApps_Vtbl,
}
IEnumPublishedApps_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumPublishedApps, pia: ^^IPublishedApp) -> HRESULT,
	Reset: proc "system" (this: ^IEnumPublishedApps) -> HRESULT,
}
IID_IEnumPublishedApps :: GUID{0x0B124F8C, 0x91F0, 0x11D1, {0xB8, 0xB5, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ienumreadycallback ]]
IEnumReadyCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumReadyCallback_Vtbl,
}
IEnumReadyCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnumReady: proc "system" (this: ^IEnumReadyCallback) -> HRESULT,
}
IID_IEnumReadyCallback :: GUID{0x61E00D45, 0x8FFF, 0x4E60, {0x92, 0x4E, 0x65, 0x37, 0xB6, 0x16, 0x12, 0xDD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumresources ]]
IEnumResources :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumResources_Vtbl,
}
IEnumResources_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumResources,
		celt: u32,
		psir: [^]SHELL_ITEM_RESOURCE,
		pceltFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumResources, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumResources) -> HRESULT,
	Clone: proc "system" (this: ^IEnumResources, ppenumr: ^^IEnumResources) -> HRESULT,
}
IID_IEnumResources :: GUID{0x2DD81FE3, 0xA83C, 0x4DA9, {0xA3, 0x30, 0x47, 0x24, 0x9D, 0x34, 0x5B, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumshellitems ]]
IEnumShellItems :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumShellItems_Vtbl,
}
IEnumShellItems_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumShellItems, celt: u32, rgelt: [^]^IShellItem, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^IEnumShellItems, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumShellItems) -> HRESULT,
	Clone: proc "system" (this: ^IEnumShellItems, ppenum: ^^IEnumShellItems) -> HRESULT,
}
IID_IEnumShellItems :: GUID{0x70629033, 0xE363, 0x4A28, {0xA5, 0x67, 0x0D, 0xB7, 0x80, 0x06, 0xE6, 0xD7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-ienumsyncmgrconflict ]]
IEnumSyncMgrConflict :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumSyncMgrConflict_Vtbl,
}
IEnumSyncMgrConflict_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumSyncMgrConflict,
		celt: u32,
		rgelt: [^]^ISyncMgrConflict,
		pceltFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumSyncMgrConflict, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumSyncMgrConflict) -> HRESULT,
	Clone: proc "system" (this: ^IEnumSyncMgrConflict, ppenum: ^^IEnumSyncMgrConflict) -> HRESULT,
}
IID_IEnumSyncMgrConflict :: GUID{0x82705914, 0xDDA3, 0x4893, {0xBA, 0x99, 0x49, 0xDE, 0x6C, 0x8C, 0x80, 0x36}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-ienumsyncmgrevents ]]
IEnumSyncMgrEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumSyncMgrEvents_Vtbl,
}
IEnumSyncMgrEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumSyncMgrEvents,
		celt: u32,
		rgelt: [^]^ISyncMgrEvent,
		pceltFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumSyncMgrEvents, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumSyncMgrEvents) -> HRESULT,
	Clone: proc "system" (this: ^IEnumSyncMgrEvents, ppenum: ^^IEnumSyncMgrEvents) -> HRESULT,
}
IID_IEnumSyncMgrEvents :: GUID{0xC81A1D4E, 0x8CF7, 0x4683, {0x80, 0xE0, 0xBC, 0xAE, 0x88, 0xD6, 0x77, 0xB6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-ienumsyncmgrsyncitems ]]
IEnumSyncMgrSyncItems :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumSyncMgrSyncItems_Vtbl,
}
IEnumSyncMgrSyncItems_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumSyncMgrSyncItems,
		celt: u32,
		rgelt: [^]^ISyncMgrSyncItem,
		pceltFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumSyncMgrSyncItems, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumSyncMgrSyncItems) -> HRESULT,
	Clone: proc "system" (this: ^IEnumSyncMgrSyncItems, ppenum: ^^IEnumSyncMgrSyncItems) -> HRESULT,
}
IID_IEnumSyncMgrSyncItems :: GUID{0x54B3ABF3, 0xF085, 0x4181, {0xB5, 0x46, 0xE2, 0x9C, 0x40, 0x3C, 0x72, 0x6B}}

IEnumTravelLogEntry :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumTravelLogEntry_Vtbl,
}
IEnumTravelLogEntry_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumTravelLogEntry,
		cElt: u32,
		rgElt: [^]^ITravelLogEntry,
		pcEltFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumTravelLogEntry, cElt: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumTravelLogEntry) -> HRESULT,
	Clone: proc "system" (this: ^IEnumTravelLogEntry, ppEnum: ^^IEnumTravelLogEntry) -> HRESULT,
}
IID_IEnumTravelLogEntry :: GUID{0x7EBFDD85, 0xAD18, 0x11D3, {0xA4, 0xC5, 0x00, 0xC0, 0x4F, 0x72, 0xD6, 0xB8}}

IEPDNFLAGS :: enum i32 {
	BINDINGUI = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-ieshortcutflags ]]
IESHORTCUTFLAGS :: enum i32 {
	NEWBROWSER = 1,
	OPENNEWTAB = 2,
	FORCENAVIGATE = 4,
	BACKGROUNDTAB = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexecutecommand ]]
IExecuteCommand :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExecuteCommand_Vtbl,
}
IExecuteCommand_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetKeyState: proc "system" (this: ^IExecuteCommand, grfKeyState: u32) -> HRESULT,
	SetParameters: proc "system" (this: ^IExecuteCommand, pszParameters: PWSTR) -> HRESULT,
	SetPosition: proc "system" (this: ^IExecuteCommand, pt: POINT) -> HRESULT,
	SetShowWindow: proc "system" (this: ^IExecuteCommand, nShow: i32) -> HRESULT,
	SetNoShowUI: proc "system" (this: ^IExecuteCommand, fNoShowUI: BOOL) -> HRESULT,
	SetDirectory: proc "system" (this: ^IExecuteCommand, pszDirectory: PWSTR) -> HRESULT,
	Execute: proc "system" (this: ^IExecuteCommand) -> HRESULT,
}
IID_IExecuteCommand :: GUID{0x7F9185B0, 0xCB92, 0x43C5, {0x80, 0xA9, 0x92, 0x27, 0x7A, 0x4F, 0x7B, 0x54}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexecutecommandapplicationhostenvironment ]]
IExecuteCommandApplicationHostEnvironment :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExecuteCommandApplicationHostEnvironment_Vtbl,
}
IExecuteCommandApplicationHostEnvironment_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetValue: proc "system" (this: ^IExecuteCommandApplicationHostEnvironment, pahe: ^AHE_TYPE) -> HRESULT,
}
IID_IExecuteCommandApplicationHostEnvironment :: GUID{0x18B21AA9, 0xE184, 0x4FF0, {0x9F, 0x5E, 0xF8, 0x82, 0xD0, 0x37, 0x71, 0xB3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexecutecommandhost ]]
IExecuteCommandHost :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExecuteCommandHost_Vtbl,
}
IExecuteCommandHost_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetUIMode: proc "system" (this: ^IExecuteCommandHost, pUIMode: ^EC_HOST_UI_MODE) -> HRESULT,
}
IID_IExecuteCommandHost :: GUID{0x4B6832A2, 0x5F04, 0x4C9D, {0xB8, 0x9D, 0x72, 0x7A, 0x15, 0xD1, 0x03, 0xE7}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-iexpdispsupport ]]
IExpDispSupport :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExpDispSupport_Vtbl,
}
IExpDispSupport_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	FindConnectionPoint: proc "system" (this: ^IExpDispSupport, #by_ptr riid: GUID, ppccp: ^^IConnectionPoint) -> HRESULT,
	OnTranslateAccelerator: proc "system" (this: ^IExpDispSupport, pMsg: ^MSG, grfModifiers: u32) -> HRESULT,
	OnInvoke: proc "system" (
		this: ^IExpDispSupport,
		dispidMember: i32,
		#by_ptr iid: GUID,
		lcid: u32,
		wFlags: u16,
		pdispparams: ^DISPPARAMS,
		pVarResult: ^VARIANT,
		pexcepinfo: ^EXCEPINFO,
		puArgErr: ^u32,
	) -> HRESULT,
}
IID_IExpDispSupport :: GUID{0x0D7D1D00, 0x6FC0, 0x11D0, {0xA9, 0x74, 0x00, 0xC0, 0x4F, 0xD7, 0x05, 0xA2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-iexpdispsupportxp ]]
IExpDispSupportXP :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExpDispSupportXP_Vtbl,
}
IExpDispSupportXP_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	FindCIE4ConnectionPoint: proc "system" (this: ^IExpDispSupportXP, #by_ptr riid: GUID, ppccp: ^^CIE4ConnectionPoint) -> HRESULT,
	OnTranslateAccelerator: proc "system" (this: ^IExpDispSupportXP, pMsg: ^MSG, grfModifiers: u32) -> HRESULT,
	OnInvoke: proc "system" (
		this: ^IExpDispSupportXP,
		dispidMember: i32,
		#by_ptr iid: GUID,
		lcid: u32,
		wFlags: u16,
		pdispparams: ^DISPPARAMS,
		pVarResult: ^VARIANT,
		pexcepinfo: ^EXCEPINFO,
		puArgErr: ^u32,
	) -> HRESULT,
}
IID_IExpDispSupportXP :: GUID{0x2F0DD58C, 0xF789, 0x4F14, {0x99, 0xFB, 0x92, 0x93, 0xB3, 0xC9, 0xC2, 0x12}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorerbrowser ]]
IExplorerBrowser :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExplorerBrowser_Vtbl,
}
IExplorerBrowser_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (
		this: ^IExplorerBrowser,
		hwndParent: HWND,
		#by_ptr prc: RECT,
		pfs: ^FOLDERSETTINGS,
	) -> HRESULT,
	Destroy: proc "system" (this: ^IExplorerBrowser) -> HRESULT,
	SetRect: proc "system" (this: ^IExplorerBrowser, phdwp: ^HDWP, rcBrowser: RECT) -> HRESULT,
	SetPropertyBag: proc "system" (this: ^IExplorerBrowser, pszPropertyBag: PWSTR) -> HRESULT,
	SetEmptyText: proc "system" (this: ^IExplorerBrowser, pszEmptyText: PWSTR) -> HRESULT,
	SetFolderSettings: proc "system" (this: ^IExplorerBrowser, #by_ptr pfs: FOLDERSETTINGS) -> HRESULT,
	Advise: proc "system" (this: ^IExplorerBrowser, psbe: ^IExplorerBrowserEvents, pdwCookie: ^u32) -> HRESULT,
	Unadvise: proc "system" (this: ^IExplorerBrowser, dwCookie: u32) -> HRESULT,
	SetOptions: proc "system" (this: ^IExplorerBrowser, dwFlag: EXPLORER_BROWSER_OPTIONS) -> HRESULT,
	GetOptions: proc "system" (this: ^IExplorerBrowser, pdwFlag: ^EXPLORER_BROWSER_OPTIONS) -> HRESULT,
	BrowseToIDList: proc "system" (this: ^IExplorerBrowser, pidl: ^ITEMIDLIST, uFlags: u32) -> HRESULT,
	BrowseToObject: proc "system" (this: ^IExplorerBrowser, punk: ^IUnknown, uFlags: u32) -> HRESULT,
	FillFromObject: proc "system" (
		this: ^IExplorerBrowser,
		punk: ^IUnknown,
		dwFlags: EXPLORER_BROWSER_FILL_FLAGS,
	) -> HRESULT,
	RemoveAll: proc "system" (this: ^IExplorerBrowser) -> HRESULT,
	GetCurrentView: proc "system" (this: ^IExplorerBrowser, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
}
IID_IExplorerBrowser :: GUID{0xDFD3B6B5, 0xC10C, 0x4BE9, {0x85, 0xF6, 0xA6, 0x69, 0x69, 0xF4, 0x02, 0xF6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorerbrowserevents ]]
IExplorerBrowserEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExplorerBrowserEvents_Vtbl,
}
IExplorerBrowserEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnNavigationPending: proc "system" (this: ^IExplorerBrowserEvents, pidlFolder: ^ITEMIDLIST) -> HRESULT,
	OnViewCreated: proc "system" (this: ^IExplorerBrowserEvents, psv: ^IShellView) -> HRESULT,
	OnNavigationComplete: proc "system" (this: ^IExplorerBrowserEvents, pidlFolder: ^ITEMIDLIST) -> HRESULT,
	OnNavigationFailed: proc "system" (this: ^IExplorerBrowserEvents, pidlFolder: ^ITEMIDLIST) -> HRESULT,
}
IID_IExplorerBrowserEvents :: GUID{0x361BBDC7, 0xE6EE, 0x4E13, {0xBE, 0x58, 0x58, 0xE2, 0x24, 0x0C, 0x81, 0x0F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorercommand ]]
IExplorerCommand :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExplorerCommand_Vtbl,
}
IExplorerCommand_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetTitle: proc "system" (this: ^IExplorerCommand, psiItemArray: ^IShellItemArray, ppszName: ^PWSTR) -> HRESULT,
	GetIcon: proc "system" (this: ^IExplorerCommand, psiItemArray: ^IShellItemArray, ppszIcon: ^PWSTR) -> HRESULT,
	GetToolTip: proc "system" (
		this: ^IExplorerCommand,
		psiItemArray: ^IShellItemArray,
		ppszInfotip: ^PWSTR,
	) -> HRESULT,
	GetCanonicalName: proc "system" (this: ^IExplorerCommand, pguidCommandName: ^GUID) -> HRESULT,
	GetState: proc "system" (
		this: ^IExplorerCommand,
		psiItemArray: ^IShellItemArray,
		fOkToBeSlow: BOOL,
		pCmdState: ^u32,
	) -> HRESULT,
	Invoke: proc "system" (this: ^IExplorerCommand, psiItemArray: ^IShellItemArray, pbc: ^IBindCtx) -> HRESULT,
	GetFlags: proc "system" (this: ^IExplorerCommand, pFlags: ^u32) -> HRESULT,
	EnumSubCommands: proc "system" (this: ^IExplorerCommand, ppEnum: ^^IEnumExplorerCommand) -> HRESULT,
}
IID_IExplorerCommand :: GUID{0xA08CE4D0, 0xFA25, 0x44AB, {0xB5, 0x7C, 0xC7, 0xB1, 0xC3, 0x23, 0xE0, 0xB9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorercommandprovider ]]
IExplorerCommandProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExplorerCommandProvider_Vtbl,
}
IExplorerCommandProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCommands: proc "system" (
		this: ^IExplorerCommandProvider,
		punkSite: ^IUnknown,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetCommand: proc "system" (
		this: ^IExplorerCommandProvider,
		#by_ptr rguidCommandId: GUID,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
}
IID_IExplorerCommandProvider :: GUID{0x64961751, 0x0835, 0x43C0, {0x8F, 0xFE, 0xD5, 0x76, 0x86, 0x53, 0x0E, 0x64}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorercommandstate ]]
IExplorerCommandState :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExplorerCommandState_Vtbl,
}
IExplorerCommandState_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetState: proc "system" (
		this: ^IExplorerCommandState,
		psiItemArray: ^IShellItemArray,
		fOkToBeSlow: BOOL,
		pCmdState: ^u32,
	) -> HRESULT,
}
IID_IExplorerCommandState :: GUID{0xBDDACB60, 0x7657, 0x47AE, {0x84, 0x45, 0xD2, 0x3E, 0x1A, 0xCF, 0x82, 0xAE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iexplorerpanevisibility ]]
IExplorerPaneVisibility :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExplorerPaneVisibility_Vtbl,
}
IExplorerPaneVisibility_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetPaneState: proc "system" (this: ^IExplorerPaneVisibility, #by_ptr ep: GUID, peps: ^u32) -> HRESULT,
}
IID_IExplorerPaneVisibility :: GUID{0xE07010EC, 0xBC17, 0x44C0, {0x97, 0xB0, 0x46, 0xC7, 0xC9, 0x5B, 0x9E, 0xDC}}

IExtensionServices :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExtensionServices_Vtbl,
}
IExtensionServices_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAdditionalHeaders: proc "system" (this: ^IExtensionServices, pwzAdditionalHeaders: PWSTR) -> HRESULT,
	SetAuthenticateData: proc "system" (this: ^IExtensionServices, phwnd: HWND, pwzUsername: PWSTR, pwzPassword: PWSTR) -> HRESULT,
}
IID_IExtensionServices :: GUID{0x79EAC9CB, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iextracticona ]]
IExtractIconA :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExtractIconA_Vtbl,
}
IExtractIconA_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetIconLocation: proc "system" (
		this: ^IExtractIconA,
		uFlags: u32,
		pszIconFile: PSTR,
		cchMax: u32,
		piIndex: ^i32,
		pwFlags: ^u32,
	) -> HRESULT,
	Extract: proc "system" (
		this: ^IExtractIconA,
		pszFile: PSTR,
		nIconIndex: u32,
		phiconLarge: ^HICON,
		phiconSmall: ^HICON,
		nIconSize: u32,
	) -> HRESULT,
}
IID_IExtractIconA :: GUID{0x000214EB, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iextracticonw ]]
IExtractIconW :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExtractIconW_Vtbl,
}
IExtractIconW_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetIconLocation: proc "system" (
		this: ^IExtractIconW,
		uFlags: u32,
		pszIconFile: PWSTR,
		cchMax: u32,
		piIndex: ^i32,
		pwFlags: ^u32,
	) -> HRESULT,
	Extract: proc "system" (
		this: ^IExtractIconW,
		pszFile: PWSTR,
		nIconIndex: u32,
		phiconLarge: ^HICON,
		phiconSmall: ^HICON,
		nIconSize: u32,
	) -> HRESULT,
}
IID_IExtractIconW :: GUID{0x000214FA, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iextractimage ]]
IExtractImage :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IExtractImage_Vtbl,
}
IExtractImage_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetLocation: proc "system" (
		this: ^IExtractImage,
		pszPathBuffer: PWSTR,
		cch: u32,
		pdwPriority: ^u32,
		#by_ptr prgSize: SIZE,
		dwRecClrDepth: u32,
		pdwFlags: ^u32,
	) -> HRESULT,
	Extract: proc "system" (this: ^IExtractImage, phBmpThumbnail: ^HBITMAP) -> HRESULT,
}
IID_IExtractImage :: GUID{0xBB2E617C, 0x0920, 0x11D1, {0x9A, 0x0B, 0x00, 0xC0, 0x4F, 0xC2, 0xD6, 0xC1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iextractimage2 ]]
IExtractImage2 :: struct #raw_union {
	#subtype IExtractImage: IExtractImage,
	using Vtbl: ^IExtractImage2_Vtbl,
}
IExtractImage2_Vtbl :: struct {
	using IExtractImage_Vtbl: IExtractImage_Vtbl,
	GetDateStamp: proc "system" (this: ^IExtractImage2, pDateStamp: ^FILETIME) -> HRESULT,
}
IID_IExtractImage2 :: GUID{0x953BB1EE, 0x93B4, 0x11D1, {0x98, 0xA3, 0x00, 0xC0, 0x4F, 0xB6, 0x87, 0xDA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifiledialog ]]
IFileDialog :: struct #raw_union {
	#subtype IModalWindow: IModalWindow,
	using Vtbl: ^IFileDialog_Vtbl,
}
IFileDialog_Vtbl :: struct {
	using IModalWindow_Vtbl: IModalWindow_Vtbl,
	SetFileTypes: proc "system" (this: ^IFileDialog, cFileTypes: u32, rgFilterSpec: [^]COMDLG_FILTERSPEC) -> HRESULT,
	SetFileTypeIndex: proc "system" (this: ^IFileDialog, iFileType: u32) -> HRESULT,
	GetFileTypeIndex: proc "system" (this: ^IFileDialog, piFileType: ^u32) -> HRESULT,
	Advise: proc "system" (this: ^IFileDialog, pfde: ^IFileDialogEvents, pdwCookie: ^u32) -> HRESULT,
	Unadvise: proc "system" (this: ^IFileDialog, dwCookie: u32) -> HRESULT,
	SetOptions: proc "system" (this: ^IFileDialog, fos: FILEOPENDIALOGOPTIONS) -> HRESULT,
	GetOptions: proc "system" (this: ^IFileDialog, pfos: ^FILEOPENDIALOGOPTIONS) -> HRESULT,
	SetDefaultFolder: proc "system" (this: ^IFileDialog, psi: ^IShellItem) -> HRESULT,
	SetFolder: proc "system" (this: ^IFileDialog, psi: ^IShellItem) -> HRESULT,
	GetFolder: proc "system" (this: ^IFileDialog, ppsi: ^^IShellItem) -> HRESULT,
	GetCurrentSelection: proc "system" (this: ^IFileDialog, ppsi: ^^IShellItem) -> HRESULT,
	SetFileName: proc "system" (this: ^IFileDialog, pszName: PWSTR) -> HRESULT,
	GetFileName: proc "system" (this: ^IFileDialog, pszName: ^PWSTR) -> HRESULT,
	SetTitle: proc "system" (this: ^IFileDialog, pszTitle: PWSTR) -> HRESULT,
	SetOkButtonLabel: proc "system" (this: ^IFileDialog, pszText: PWSTR) -> HRESULT,
	SetFileNameLabel: proc "system" (this: ^IFileDialog, pszLabel: PWSTR) -> HRESULT,
	GetResult: proc "system" (this: ^IFileDialog, ppsi: ^^IShellItem) -> HRESULT,
	AddPlace: proc "system" (this: ^IFileDialog, psi: ^IShellItem, fdap: FDAP) -> HRESULT,
	SetDefaultExtension: proc "system" (this: ^IFileDialog, pszDefaultExtension: PWSTR) -> HRESULT,
	Close: proc "system" (this: ^IFileDialog, hr: HRESULT) -> HRESULT,
	SetClientGuid: proc "system" (this: ^IFileDialog, #by_ptr guid: GUID) -> HRESULT,
	ClearClientData: proc "system" (this: ^IFileDialog) -> HRESULT,
	SetFilter: proc "system" (this: ^IFileDialog, pFilter: ^IShellItemFilter) -> HRESULT,
}
IID_IFileDialog :: GUID{0x42F85136, 0xDB7E, 0x439C, {0x85, 0xF1, 0xE4, 0x07, 0x5D, 0x13, 0x5F, 0xC8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifiledialog2 ]]
IFileDialog2 :: struct #raw_union {
	#subtype IFileDialog: IFileDialog,
	using Vtbl: ^IFileDialog2_Vtbl,
}
IFileDialog2_Vtbl :: struct {
	using IFileDialog_Vtbl: IFileDialog_Vtbl,
	SetCancelButtonLabel: proc "system" (this: ^IFileDialog2, pszLabel: PWSTR) -> HRESULT,
	SetNavigationRoot: proc "system" (this: ^IFileDialog2, psi: ^IShellItem) -> HRESULT,
}
IID_IFileDialog2 :: GUID{0x61744FC7, 0x85B5, 0x4791, {0xA9, 0xB0, 0x27, 0x22, 0x76, 0x30, 0x9B, 0x13}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifiledialogcontrolevents ]]
IFileDialogControlEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFileDialogControlEvents_Vtbl,
}
IFileDialogControlEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnItemSelected: proc "system" (
		this: ^IFileDialogControlEvents,
		pfdc: ^IFileDialogCustomize,
		dwIDCtl: u32,
		dwIDItem: u32,
	) -> HRESULT,
	OnButtonClicked: proc "system" (this: ^IFileDialogControlEvents, pfdc: ^IFileDialogCustomize, dwIDCtl: u32) -> HRESULT,
	OnCheckButtonToggled: proc "system" (
		this: ^IFileDialogControlEvents,
		pfdc: ^IFileDialogCustomize,
		dwIDCtl: u32,
		bChecked: BOOL,
	) -> HRESULT,
	OnControlActivating: proc "system" (this: ^IFileDialogControlEvents, pfdc: ^IFileDialogCustomize, dwIDCtl: u32) -> HRESULT,
}
IID_IFileDialogControlEvents :: GUID{0x36116642, 0xD713, 0x4B97, {0x9B, 0x83, 0x74, 0x84, 0xA9, 0xD0, 0x04, 0x33}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifiledialogcustomize ]]
IFileDialogCustomize :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFileDialogCustomize_Vtbl,
}
IFileDialogCustomize_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnableOpenDropDown: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32) -> HRESULT,
	AddMenu: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pszLabel: PWSTR) -> HRESULT,
	AddPushButton: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pszLabel: PWSTR) -> HRESULT,
	AddComboBox: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32) -> HRESULT,
	AddRadioButtonList: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32) -> HRESULT,
	AddCheckButton: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pszLabel: PWSTR, bChecked: BOOL) -> HRESULT,
	AddEditBox: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pszText: PWSTR) -> HRESULT,
	AddSeparator: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32) -> HRESULT,
	AddText: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pszText: PWSTR) -> HRESULT,
	SetControlLabel: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pszLabel: PWSTR) -> HRESULT,
	GetControlState: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pdwState: ^CDCONTROLSTATEF) -> HRESULT,
	SetControlState: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, dwState: CDCONTROLSTATEF) -> HRESULT,
	GetEditBoxText: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, ppszText: ^u16) -> HRESULT,
	SetEditBoxText: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pszText: PWSTR) -> HRESULT,
	GetCheckButtonState: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pbChecked: ^BOOL) -> HRESULT,
	SetCheckButtonState: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, bChecked: BOOL) -> HRESULT,
	AddControlItem: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, dwIDItem: u32, pszLabel: PWSTR) -> HRESULT,
	RemoveControlItem: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, dwIDItem: u32) -> HRESULT,
	RemoveAllControlItems: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32) -> HRESULT,
	GetControlItemState: proc "system" (
		this: ^IFileDialogCustomize,
		dwIDCtl: u32,
		dwIDItem: u32,
		pdwState: ^CDCONTROLSTATEF,
	) -> HRESULT,
	SetControlItemState: proc "system" (
		this: ^IFileDialogCustomize,
		dwIDCtl: u32,
		dwIDItem: u32,
		dwState: CDCONTROLSTATEF,
	) -> HRESULT,
	GetSelectedControlItem: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pdwIDItem: ^u32) -> HRESULT,
	SetSelectedControlItem: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, dwIDItem: u32) -> HRESULT,
	StartVisualGroup: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, pszLabel: PWSTR) -> HRESULT,
	EndVisualGroup: proc "system" (this: ^IFileDialogCustomize) -> HRESULT,
	MakeProminent: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32) -> HRESULT,
	SetControlItemText: proc "system" (this: ^IFileDialogCustomize, dwIDCtl: u32, dwIDItem: u32, pszLabel: PWSTR) -> HRESULT,
}
IID_IFileDialogCustomize :: GUID{0xE6FDD21A, 0x163F, 0x4975, {0x9C, 0x8C, 0xA6, 0x9F, 0x1B, 0xA3, 0x70, 0x34}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifiledialogevents ]]
IFileDialogEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFileDialogEvents_Vtbl,
}
IFileDialogEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnFileOk: proc "system" (this: ^IFileDialogEvents, pfd: ^IFileDialog) -> HRESULT,
	OnFolderChanging: proc "system" (this: ^IFileDialogEvents, pfd: ^IFileDialog, psiFolder: ^IShellItem) -> HRESULT,
	OnFolderChange: proc "system" (this: ^IFileDialogEvents, pfd: ^IFileDialog) -> HRESULT,
	OnSelectionChange: proc "system" (this: ^IFileDialogEvents, pfd: ^IFileDialog) -> HRESULT,
	OnShareViolation: proc "system" (
		this: ^IFileDialogEvents,
		pfd: ^IFileDialog,
		psi: ^IShellItem,
		pResponse: ^FDE_SHAREVIOLATION_RESPONSE,
	) -> HRESULT,
	OnTypeChange: proc "system" (this: ^IFileDialogEvents, pfd: ^IFileDialog) -> HRESULT,
	OnOverwrite: proc "system" (
		this: ^IFileDialogEvents,
		pfd: ^IFileDialog,
		psi: ^IShellItem,
		pResponse: ^FDE_OVERWRITE_RESPONSE,
	) -> HRESULT,
}
IID_IFileDialogEvents :: GUID{0x973510DB, 0x7D7F, 0x452B, {0x89, 0x75, 0x74, 0xA8, 0x58, 0x28, 0xD3, 0x54}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifileisinuse ]]
IFileIsInUse :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFileIsInUse_Vtbl,
}
IFileIsInUse_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetAppName: proc "system" (this: ^IFileIsInUse, ppszName: ^PWSTR) -> HRESULT,
	GetUsage: proc "system" (this: ^IFileIsInUse, pfut: ^FILE_USAGE_TYPE) -> HRESULT,
	GetCapabilities: proc "system" (this: ^IFileIsInUse, pdwCapFlags: ^u32) -> HRESULT,
	GetSwitchToHWND: proc "system" (this: ^IFileIsInUse, phwnd: ^HWND) -> HRESULT,
	CloseFile: proc "system" (this: ^IFileIsInUse) -> HRESULT,
}
IID_IFileIsInUse :: GUID{0x64A1CBF0, 0x3A1A, 0x4461, {0x91, 0x58, 0x37, 0x69, 0x69, 0x69, 0x39, 0x50}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifileopendialog ]]
IFileOpenDialog :: struct #raw_union {
	#subtype IFileDialog: IFileDialog,
	using Vtbl: ^IFileOpenDialog_Vtbl,
}
IFileOpenDialog_Vtbl :: struct {
	using IFileDialog_Vtbl: IFileDialog_Vtbl,
	GetResults: proc "system" (this: ^IFileOpenDialog, ppenum: ^^IShellItemArray) -> HRESULT,
	GetSelectedItems: proc "system" (this: ^IFileOpenDialog, ppsai: ^^IShellItemArray) -> HRESULT,
}
IID_IFileOpenDialog :: GUID{0xD57C7288, 0xD4AD, 0x4768, {0xBE, 0x02, 0x9D, 0x96, 0x95, 0x32, 0xD9, 0x60}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifileoperation ]]
IFileOperation :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFileOperation_Vtbl,
}
IFileOperation_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Advise: proc "system" (this: ^IFileOperation, pfops: ^IFileOperationProgressSink, pdwCookie: ^u32) -> HRESULT,
	Unadvise: proc "system" (this: ^IFileOperation, dwCookie: u32) -> HRESULT,
	SetOperationFlags: proc "system" (this: ^IFileOperation, dwOperationFlags: FILEOPERATION_FLAGS) -> HRESULT,
	SetProgressMessage: proc "system" (this: ^IFileOperation, pszMessage: PWSTR) -> HRESULT,
	SetProgressDialog: proc "system" (this: ^IFileOperation, popd: ^IOperationsProgressDialog) -> HRESULT,
	SetProperties: proc "system" (this: ^IFileOperation, pproparray: ^IPropertyChangeArray) -> HRESULT,
	SetOwnerWindow: proc "system" (this: ^IFileOperation, hwndOwner: HWND) -> HRESULT,
	ApplyPropertiesToItem: proc "system" (this: ^IFileOperation, psiItem: ^IShellItem) -> HRESULT,
	ApplyPropertiesToItems: proc "system" (this: ^IFileOperation, punkItems: ^IUnknown) -> HRESULT,
	RenameItem: proc "system" (
		this: ^IFileOperation,
		psiItem: ^IShellItem,
		pszNewName: PWSTR,
		pfopsItem: ^IFileOperationProgressSink,
	) -> HRESULT,
	RenameItems: proc "system" (this: ^IFileOperation, pUnkItems: ^IUnknown, pszNewName: PWSTR) -> HRESULT,
	MoveItem: proc "system" (
		this: ^IFileOperation,
		psiItem: ^IShellItem,
		psiDestinationFolder: ^IShellItem,
		pszNewName: PWSTR,
		pfopsItem: ^IFileOperationProgressSink,
	) -> HRESULT,
	MoveItems: proc "system" (
		this: ^IFileOperation,
		punkItems: ^IUnknown,
		psiDestinationFolder: ^IShellItem,
	) -> HRESULT,
	CopyItem: proc "system" (
		this: ^IFileOperation,
		psiItem: ^IShellItem,
		psiDestinationFolder: ^IShellItem,
		pszCopyName: PWSTR,
		pfopsItem: ^IFileOperationProgressSink,
	) -> HRESULT,
	CopyItems: proc "system" (
		this: ^IFileOperation,
		punkItems: ^IUnknown,
		psiDestinationFolder: ^IShellItem,
	) -> HRESULT,
	DeleteItem: proc "system" (
		this: ^IFileOperation,
		psiItem: ^IShellItem,
		pfopsItem: ^IFileOperationProgressSink,
	) -> HRESULT,
	DeleteItems: proc "system" (this: ^IFileOperation, punkItems: ^IUnknown) -> HRESULT,
	NewItem: proc "system" (
		this: ^IFileOperation,
		psiDestinationFolder: ^IShellItem,
		dwFileAttributes: u32,
		pszName: PWSTR,
		pszTemplateName: PWSTR,
		pfopsItem: ^IFileOperationProgressSink,
	) -> HRESULT,
	PerformOperations: proc "system" (this: ^IFileOperation) -> HRESULT,
	GetAnyOperationsAborted: proc "system" (this: ^IFileOperation, pfAnyOperationsAborted: ^BOOL) -> HRESULT,
}
IID_IFileOperation :: GUID{0x947AAB5F, 0x0A5C, 0x4C13, {0xB4, 0xD6, 0x4B, 0xF7, 0x83, 0x6F, 0xC9, 0xF8}}

IFileOperation2 :: struct #raw_union {
	#subtype IFileOperation: IFileOperation,
	using Vtbl: ^IFileOperation2_Vtbl,
}
IFileOperation2_Vtbl :: struct {
	using IFileOperation_Vtbl: IFileOperation_Vtbl,
	SetOperationFlags2: proc "system" (this: ^IFileOperation2, operationFlags2: FILE_OPERATION_FLAGS2) -> HRESULT,
}
IID_IFileOperation2 :: GUID{0xCD8F23C1, 0x8F61, 0x4916, {0x90, 0x9D, 0x55, 0xBD, 0xD0, 0x91, 0x87, 0x53}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifileoperationprogresssink ]]
IFileOperationProgressSink :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFileOperationProgressSink_Vtbl,
}
IFileOperationProgressSink_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	StartOperations: proc "system" (this: ^IFileOperationProgressSink) -> HRESULT,
	FinishOperations: proc "system" (this: ^IFileOperationProgressSink, hrResult: HRESULT) -> HRESULT,
	PreRenameItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiItem: ^IShellItem,
		pszNewName: PWSTR,
	) -> HRESULT,
	PostRenameItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiItem: ^IShellItem,
		pszNewName: PWSTR,
		hrRename: HRESULT,
		psiNewlyCreated: ^IShellItem,
	) -> HRESULT,
	PreMoveItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiItem: ^IShellItem,
		psiDestinationFolder: ^IShellItem,
		pszNewName: PWSTR,
	) -> HRESULT,
	PostMoveItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiItem: ^IShellItem,
		psiDestinationFolder: ^IShellItem,
		pszNewName: PWSTR,
		hrMove: HRESULT,
		psiNewlyCreated: ^IShellItem,
	) -> HRESULT,
	PreCopyItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiItem: ^IShellItem,
		psiDestinationFolder: ^IShellItem,
		pszNewName: PWSTR,
	) -> HRESULT,
	PostCopyItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiItem: ^IShellItem,
		psiDestinationFolder: ^IShellItem,
		pszNewName: PWSTR,
		hrCopy: HRESULT,
		psiNewlyCreated: ^IShellItem,
	) -> HRESULT,
	PreDeleteItem: proc "system" (this: ^IFileOperationProgressSink, dwFlags: u32, psiItem: ^IShellItem) -> HRESULT,
	PostDeleteItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiItem: ^IShellItem,
		hrDelete: HRESULT,
		psiNewlyCreated: ^IShellItem,
	) -> HRESULT,
	PreNewItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiDestinationFolder: ^IShellItem,
		pszNewName: PWSTR,
	) -> HRESULT,
	PostNewItem: proc "system" (
		this: ^IFileOperationProgressSink,
		dwFlags: u32,
		psiDestinationFolder: ^IShellItem,
		pszNewName: PWSTR,
		pszTemplateName: PWSTR,
		dwFileAttributes: u32,
		hrNew: HRESULT,
		psiNewItem: ^IShellItem,
	) -> HRESULT,
	UpdateProgress: proc "system" (this: ^IFileOperationProgressSink, iWorkTotal: u32, iWorkSoFar: u32) -> HRESULT,
	ResetTimer: proc "system" (this: ^IFileOperationProgressSink) -> HRESULT,
	PauseTimer: proc "system" (this: ^IFileOperationProgressSink) -> HRESULT,
	ResumeTimer: proc "system" (this: ^IFileOperationProgressSink) -> HRESULT,
}
IID_IFileOperationProgressSink :: GUID{0x04B0F1A7, 0x9490, 0x44BC, {0x96, 0xE1, 0x42, 0x96, 0xA3, 0x12, 0x52, 0xE2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifilesavedialog ]]
IFileSaveDialog :: struct #raw_union {
	#subtype IFileDialog: IFileDialog,
	using Vtbl: ^IFileSaveDialog_Vtbl,
}
IFileSaveDialog_Vtbl :: struct {
	using IFileDialog_Vtbl: IFileDialog_Vtbl,
	SetSaveAsItem: proc "system" (this: ^IFileSaveDialog, psi: ^IShellItem) -> HRESULT,
	SetProperties: proc "system" (this: ^IFileSaveDialog, pStore: ^IPropertyStore) -> HRESULT,
	SetCollectedProperties: proc "system" (
		this: ^IFileSaveDialog,
		pList: ^IPropertyDescriptionList,
		fAppendDefault: BOOL,
	) -> HRESULT,
	GetProperties: proc "system" (this: ^IFileSaveDialog, ppStore: ^^IPropertyStore) -> HRESULT,
	ApplyProperties: proc "system" (
		this: ^IFileSaveDialog,
		psi: ^IShellItem,
		pStore: ^IPropertyStore,
		hwnd: HWND,
		pSink: ^IFileOperationProgressSink,
	) -> HRESULT,
}
IID_IFileSaveDialog :: GUID{0x84BCCD23, 0x5FDE, 0x4CDB, {0xAE, 0xA4, 0xAF, 0x64, 0xB8, 0x3D, 0x78, 0xAB}}

IFileSearchBand :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IFileSearchBand_Vtbl,
}
IFileSearchBand_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	SetFocus: proc "system" (this: ^IFileSearchBand) -> HRESULT,
	SetSearchParameters: proc "system" (
		this: ^IFileSearchBand,
		pbstrSearchID: ^BSTR,
		bNavToResults: VARIANT_BOOL,
		pvarScope: ^VARIANT,
		pvarQueryFile: ^VARIANT,
	) -> HRESULT,
	get_SearchID: proc "system" (this: ^IFileSearchBand, pbstrSearchID: ^BSTR) -> HRESULT,
	get_Scope: proc "system" (this: ^IFileSearchBand, pvarScope: ^VARIANT) -> HRESULT,
	get_QueryFile: proc "system" (this: ^IFileSearchBand, pvarFile: ^VARIANT) -> HRESULT,
}
IID_IFileSearchBand :: GUID{0x2D91EEA1, 0x9932, 0x11D2, {0xBE, 0x86, 0x00, 0xA0, 0xC9, 0xA8, 0x3D, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifilesyncmergehandler ]]
IFileSyncMergeHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFileSyncMergeHandler_Vtbl,
}
IFileSyncMergeHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Merge: proc "system" (
		this: ^IFileSyncMergeHandler,
		localFilePath: PWSTR,
		serverFilePath: PWSTR,
		updateStatus: ^MERGE_UPDATE_STATUS,
	) -> HRESULT,
	ShowResolveConflictUIAsync: proc "system" (
		this: ^IFileSyncMergeHandler,
		localFilePath: PWSTR,
		monitorToDisplayOn: HMONITOR,
	) -> HRESULT,
}
IID_IFileSyncMergeHandler :: GUID{0xD97B5AAC, 0xC792, 0x433C, {0x97, 0x5D, 0x35, 0xC4, 0xEA, 0xDC, 0x7A, 0x9D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifilesystembinddata ]]
IFileSystemBindData :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFileSystemBindData_Vtbl,
}
IFileSystemBindData_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetFindData: proc "system" (this: ^IFileSystemBindData, #by_ptr pfd: WIN32_FIND_DATAW) -> HRESULT,
	GetFindData: proc "system" (this: ^IFileSystemBindData, pfd: ^WIN32_FIND_DATAW) -> HRESULT,
}
IID_IFileSystemBindData :: GUID{0x01E18D10, 0x4D8B, 0x11D2, {0x85, 0x5D, 0x00, 0x60, 0x08, 0x05, 0x93, 0x67}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifilesystembinddata2 ]]
IFileSystemBindData2 :: struct #raw_union {
	#subtype IFileSystemBindData: IFileSystemBindData,
	using Vtbl: ^IFileSystemBindData2_Vtbl,
}
IFileSystemBindData2_Vtbl :: struct {
	using IFileSystemBindData_Vtbl: IFileSystemBindData_Vtbl,
	SetFileID: proc "system" (this: ^IFileSystemBindData2, liFileID: i64) -> HRESULT,
	GetFileID: proc "system" (this: ^IFileSystemBindData2, pliFileID: ^i64) -> HRESULT,
	SetJunctionCLSID: proc "system" (this: ^IFileSystemBindData2, #by_ptr clsid: GUID) -> HRESULT,
	GetJunctionCLSID: proc "system" (this: ^IFileSystemBindData2, pclsid: ^GUID) -> HRESULT,
}
IID_IFileSystemBindData2 :: GUID{0x3ACF075F, 0x71DB, 0x4AFA, {0x81, 0xF0, 0x3F, 0xC4, 0xFD, 0xF2, 0xA5, 0xB8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifolderbandpriv ]]
IFolderBandPriv :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFolderBandPriv_Vtbl,
}
IFolderBandPriv_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetCascade: proc "system" (this: ^IFolderBandPriv, fCascade: BOOL) -> HRESULT,
	SetAccelerators: proc "system" (this: ^IFolderBandPriv, fAccelerators: BOOL) -> HRESULT,
	SetNoIcons: proc "system" (this: ^IFolderBandPriv, fNoIcons: BOOL) -> HRESULT,
	SetNoText: proc "system" (this: ^IFolderBandPriv, fNoText: BOOL) -> HRESULT,
}
IID_IFolderBandPriv :: GUID{0x47C01F95, 0xE185, 0x412C, {0xB5, 0xC5, 0x4F, 0x27, 0xDF, 0x96, 0x5A, 0xEA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifolderfilter ]]
IFolderFilter :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFolderFilter_Vtbl,
}
IFolderFilter_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ShouldShow: proc "system" (
		this: ^IFolderFilter,
		psf: ^IShellFolder,
		pidlFolder: ^ITEMIDLIST,
		pidlItem: ^ITEMIDLIST,
	) -> HRESULT,
	GetEnumFlags: proc "system" (
		this: ^IFolderFilter,
		psf: ^IShellFolder,
		pidlFolder: ^ITEMIDLIST,
		phwnd: ^HWND,
		pgrfFlags: ^u32,
	) -> HRESULT,
}
IID_IFolderFilter :: GUID{0x9CC22886, 0xDC8E, 0x11D2, {0xB1, 0xD0, 0x00, 0xC0, 0x4F, 0x8E, 0xEB, 0x3E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifolderfiltersite ]]
IFolderFilterSite :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFolderFilterSite_Vtbl,
}
IFolderFilterSite_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetFilter: proc "system" (this: ^IFolderFilterSite, punk: ^IUnknown) -> HRESULT,
}
IID_IFolderFilterSite :: GUID{0xC0A651F5, 0xB48B, 0x11D2, {0xB5, 0xED, 0x00, 0x60, 0x97, 0xC6, 0x86, 0xF6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifolderview ]]
IFolderView :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFolderView_Vtbl,
}
IFolderView_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCurrentViewMode: proc "system" (this: ^IFolderView, pViewMode: ^u32) -> HRESULT,
	SetCurrentViewMode: proc "system" (this: ^IFolderView, ViewMode: u32) -> HRESULT,
	GetFolder: proc "system" (this: ^IFolderView, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	Item: proc "system" (this: ^IFolderView, iItemIndex: i32, ppidl: ^ITEMIDLIST) -> HRESULT,
	ItemCount: proc "system" (this: ^IFolderView, uFlags: SVGIO, pcItems: ^i32) -> HRESULT,
	Items: proc "system" (this: ^IFolderView, uFlags: SVGIO, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetSelectionMarkedItem: proc "system" (this: ^IFolderView, piItem: ^i32) -> HRESULT,
	GetFocusedItem: proc "system" (this: ^IFolderView, piItem: ^i32) -> HRESULT,
	GetItemPosition: proc "system" (this: ^IFolderView, pidl: ^ITEMIDLIST, ppt: ^POINT) -> HRESULT,
	GetSpacing: proc "system" (this: ^IFolderView, ppt: ^POINT) -> HRESULT,
	GetDefaultSpacing: proc "system" (this: ^IFolderView, ppt: ^POINT) -> HRESULT,
	GetAutoArrange: proc "system" (this: ^IFolderView) -> HRESULT,
	SelectItem: proc "system" (this: ^IFolderView, iItem: i32, dwFlags: u32) -> HRESULT,
	SelectAndPositionItems: proc "system" (this: ^IFolderView, cidl: u32, apidl: [^]ITEMIDLIST, apt: [^]POINT, dwFlags: u32) -> HRESULT,
}
IID_IFolderView :: GUID{0xCDE725B0, 0xCCC9, 0x4519, {0x91, 0x7E, 0x32, 0x5D, 0x72, 0xFA, 0xB4, 0xCE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifolderview2 ]]
IFolderView2 :: struct #raw_union {
	#subtype IFolderView: IFolderView,
	using Vtbl: ^IFolderView2_Vtbl,
}
IFolderView2_Vtbl :: struct {
	using IFolderView_Vtbl: IFolderView_Vtbl,
	SetGroupBy: proc "system" (this: ^IFolderView2, #by_ptr key: PROPERTYKEY, fAscending: BOOL) -> HRESULT,
	GetGroupBy: proc "system" (this: ^IFolderView2, pkey: ^PROPERTYKEY, pfAscending: ^BOOL) -> HRESULT,
	SetViewProperty: proc "system" (
		this: ^IFolderView2,
		pidl: ^ITEMIDLIST,
		#by_ptr propkey: PROPERTYKEY,
		#by_ptr propvar: PROPVARIANT,
	) -> HRESULT,
	GetViewProperty: proc "system" (
		this: ^IFolderView2,
		pidl: ^ITEMIDLIST,
		#by_ptr propkey: PROPERTYKEY,
		ppropvar: ^PROPVARIANT,
	) -> HRESULT,
	SetTileViewProperties: proc "system" (this: ^IFolderView2, pidl: ^ITEMIDLIST, pszPropList: PWSTR) -> HRESULT,
	SetExtendedTileViewProperties: proc "system" (this: ^IFolderView2, pidl: ^ITEMIDLIST, pszPropList: PWSTR) -> HRESULT,
	SetText: proc "system" (this: ^IFolderView2, iType: FVTEXTTYPE, pwszText: PWSTR) -> HRESULT,
	SetCurrentFolderFlags: proc "system" (this: ^IFolderView2, dwMask: u32, dwFlags: u32) -> HRESULT,
	GetCurrentFolderFlags: proc "system" (this: ^IFolderView2, pdwFlags: ^u32) -> HRESULT,
	GetSortColumnCount: proc "system" (this: ^IFolderView2, pcColumns: ^i32) -> HRESULT,
	SetSortColumns: proc "system" (this: ^IFolderView2, rgSortColumns: [^]SORTCOLUMN, cColumns: i32) -> HRESULT,
	GetSortColumns: proc "system" (this: ^IFolderView2, rgSortColumns: [^]SORTCOLUMN, cColumns: i32) -> HRESULT,
	GetItem: proc "system" (this: ^IFolderView2, iItem: i32, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetVisibleItem: proc "system" (this: ^IFolderView2, iStart: i32, fPrevious: BOOL, piItem: ^i32) -> HRESULT,
	GetSelectedItem: proc "system" (this: ^IFolderView2, iStart: i32, piItem: ^i32) -> HRESULT,
	GetSelection: proc "system" (this: ^IFolderView2, fNoneImpliesFolder: BOOL, ppsia: ^^IShellItemArray) -> HRESULT,
	GetSelectionState: proc "system" (this: ^IFolderView2, pidl: ^ITEMIDLIST, pdwFlags: ^u32) -> HRESULT,
	InvokeVerbOnSelection: proc "system" (this: ^IFolderView2, pszVerb: PSTR) -> HRESULT,
	SetViewModeAndIconSize: proc "system" (this: ^IFolderView2, uViewMode: FOLDERVIEWMODE, iImageSize: i32) -> HRESULT,
	GetViewModeAndIconSize: proc "system" (this: ^IFolderView2, puViewMode: ^FOLDERVIEWMODE, piImageSize: ^i32) -> HRESULT,
	SetGroupSubsetCount: proc "system" (this: ^IFolderView2, cVisibleRows: u32) -> HRESULT,
	GetGroupSubsetCount: proc "system" (this: ^IFolderView2, pcVisibleRows: ^u32) -> HRESULT,
	SetRedraw: proc "system" (this: ^IFolderView2, fRedrawOn: BOOL) -> HRESULT,
	IsMoveInSameFolder: proc "system" (this: ^IFolderView2) -> HRESULT,
	DoRename: proc "system" (this: ^IFolderView2) -> HRESULT,
}
IID_IFolderView2 :: GUID{0x1AF3A467, 0x214F, 0x4298, {0x90, 0x8E, 0x06, 0xB0, 0x3E, 0x0B, 0x39, 0xF9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifolderviewhost ]]
IFolderViewHost :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFolderViewHost_Vtbl,
}
IFolderViewHost_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IFolderViewHost, hwndParent: HWND, pdo: ^IDataObject, prc: ^RECT) -> HRESULT,
}
IID_IFolderViewHost :: GUID{0x1EA58F02, 0xD55A, 0x411D, {0xB0, 0x9E, 0x9E, 0x65, 0xAC, 0x21, 0x60, 0x5B}}

IFolderViewOC :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IFolderViewOC_Vtbl,
}
IFolderViewOC_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	SetFolderView: proc "system" (this: ^IFolderViewOC, pdisp: ^IDispatch) -> HRESULT,
}
IID_IFolderViewOC :: GUID{0x9BA05970, 0xF6A8, 0x11CF, {0xA4, 0x42, 0x00, 0xA0, 0xC9, 0x0A, 0x8F, 0x39}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ifolderviewoptions ]]
IFolderViewOptions :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFolderViewOptions_Vtbl,
}
IFolderViewOptions_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetFolderViewOptions: proc "system" (
		this: ^IFolderViewOptions,
		fvoMask: FOLDERVIEWOPTIONS,
		fvoFlags: FOLDERVIEWOPTIONS,
	) -> HRESULT,
	GetFolderViewOptions: proc "system" (this: ^IFolderViewOptions, pfvoFlags: ^FOLDERVIEWOPTIONS) -> HRESULT,
}
IID_IFolderViewOptions :: GUID{0x3CC974D2, 0xB302, 0x4D36, {0xAD, 0x3E, 0x06, 0xD9, 0x3F, 0x69, 0x5D, 0x3F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ifolderviewsettings ]]
IFolderViewSettings :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFolderViewSettings_Vtbl,
}
IFolderViewSettings_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetColumnPropertyList: proc "system" (this: ^IFolderViewSettings, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetGroupByProperty: proc "system" (this: ^IFolderViewSettings, pkey: ^PROPERTYKEY, pfGroupAscending: ^BOOL) -> HRESULT,
	GetViewMode: proc "system" (this: ^IFolderViewSettings, plvm: ^FOLDERLOGICALVIEWMODE) -> HRESULT,
	GetIconSize: proc "system" (this: ^IFolderViewSettings, puIconSize: ^u32) -> HRESULT,
	GetFolderFlags: proc "system" (
		this: ^IFolderViewSettings,
		pfolderMask: ^FOLDERFLAGS,
		pfolderFlags: ^FOLDERFLAGS,
	) -> HRESULT,
	GetSortColumns: proc "system" (
		this: ^IFolderViewSettings,
		rgSortColumns: [^]SORTCOLUMN,
		cColumnsIn: u32,
		pcColumnsOut: ^u32,
	) -> HRESULT,
	GetGroupSubsetCount: proc "system" (this: ^IFolderViewSettings, pcVisibleRows: ^u32) -> HRESULT,
}
IID_IFolderViewSettings :: GUID{0xAE8C987D, 0x8797, 0x4ED3, {0xBE, 0x72, 0x2A, 0x47, 0xDD, 0x93, 0x8D, 0xB0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpane ]]
IFrameworkInputPane :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFrameworkInputPane_Vtbl,
}
IFrameworkInputPane_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Advise: proc "system" (
		this: ^IFrameworkInputPane,
		pWindow: ^IUnknown,
		pHandler: ^IFrameworkInputPaneHandler,
		pdwCookie: ^u32,
	) -> HRESULT,
	AdviseWithHWND: proc "system" (
		this: ^IFrameworkInputPane,
		hwnd: HWND,
		pHandler: ^IFrameworkInputPaneHandler,
		pdwCookie: ^u32,
	) -> HRESULT,
	Unadvise: proc "system" (this: ^IFrameworkInputPane, dwCookie: u32) -> HRESULT,
	Location: proc "system" (this: ^IFrameworkInputPane, prcInputPaneScreenLocation: ^RECT) -> HRESULT,
}
IID_IFrameworkInputPane :: GUID{0x5752238B, 0x24F0, 0x495A, {0x82, 0xF1, 0x2F, 0xD5, 0x93, 0x05, 0x67, 0x96}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iframeworkinputpanehandler ]]
IFrameworkInputPaneHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IFrameworkInputPaneHandler_Vtbl,
}
IFrameworkInputPaneHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Showing: proc "system" (
		this: ^IFrameworkInputPaneHandler,
		prcInputPaneScreenLocation: ^RECT,
		fEnsureFocusedElementInView: BOOL,
	) -> HRESULT,
	Hiding: proc "system" (this: ^IFrameworkInputPaneHandler, fEnsureFocusedElementInView: BOOL) -> HRESULT,
}
IID_IFrameworkInputPaneHandler :: GUID{0x226C537B, 0x1E76, 0x4D9E, {0xA7, 0x60, 0x33, 0xDB, 0x29, 0x92, 0x2F, 0x18}}

IGetServiceIds :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IGetServiceIds_Vtbl,
}
IGetServiceIds_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetServiceIds: proc "system" (this: ^IGetServiceIds, serviceIdCount: ^u32, serviceIds: [^]GUID) -> HRESULT,
}
IID_IGetServiceIds :: GUID{0x4A073526, 0x6103, 0x4E21, {0xB7, 0xBC, 0xF5, 0x19, 0xD1, 0x52, 0x4E, 0x5D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ihandleractivationhost ]]
IHandlerActivationHost :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHandlerActivationHost_Vtbl,
}
IHandlerActivationHost_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	BeforeCoCreateInstance: proc "system" (
		this: ^IHandlerActivationHost,
		#by_ptr clsidHandler: GUID,
		itemsBeingActivated: ^IShellItemArray,
		handlerInfo: ^IHandlerInfo,
	) -> HRESULT,
	BeforeCreateProcess: proc "system" (
		this: ^IHandlerActivationHost,
		applicationPath: PWSTR,
		commandLine: PWSTR,
		handlerInfo: ^IHandlerInfo,
	) -> HRESULT,
}
IID_IHandlerActivationHost :: GUID{0x35094A87, 0x8BB1, 0x4237, {0x96, 0xC6, 0xC4, 0x17, 0xEE, 0xBD, 0xB0, 0x78}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ihandlerinfo ]]
IHandlerInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHandlerInfo_Vtbl,
}
IHandlerInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetApplicationDisplayName: proc "system" (this: ^IHandlerInfo, value: ^PWSTR) -> HRESULT,
	GetApplicationPublisher: proc "system" (this: ^IHandlerInfo, value: ^PWSTR) -> HRESULT,
	GetApplicationIconReference: proc "system" (this: ^IHandlerInfo, value: ^PWSTR) -> HRESULT,
}
IID_IHandlerInfo :: GUID{0x997706EF, 0xF880, 0x453B, {0x81, 0x18, 0x39, 0xE1, 0xA2, 0xD2, 0x65, 0x5A}}

IHandlerInfo2 :: struct #raw_union {
	#subtype IHandlerInfo: IHandlerInfo,
	using Vtbl: ^IHandlerInfo2_Vtbl,
}
IHandlerInfo2_Vtbl :: struct {
	using IHandlerInfo_Vtbl: IHandlerInfo_Vtbl,
	GetApplicationId: proc "system" (this: ^IHandlerInfo2, value: ^PWSTR) -> HRESULT,
}
IID_IHandlerInfo2 :: GUID{0x31CCA04C, 0x04D3, 0x4EA9, {0x90, 0xDE, 0x97, 0xB1, 0x5E, 0x87, 0xA5, 0x32}}

IHlink :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHlink_Vtbl,
}
IHlink_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetHlinkSite: proc "system" (this: ^IHlink, pihlSite: ^IHlinkSite, dwSiteData: u32) -> HRESULT,
	GetHlinkSite: proc "system" (this: ^IHlink, ppihlSite: ^^IHlinkSite, pdwSiteData: ^u32) -> HRESULT,
	SetMonikerReference: proc "system" (this: ^IHlink, grfHLSETF: u32, pimkTarget: ^IMoniker, pwzLocation: PWSTR) -> HRESULT,
	GetMonikerReference: proc "system" (this: ^IHlink, dwWhichRef: u32, ppimkTarget: ^^IMoniker, ppwzLocation: ^PWSTR) -> HRESULT,
	SetStringReference: proc "system" (this: ^IHlink, grfHLSETF: u32, pwzTarget: PWSTR, pwzLocation: PWSTR) -> HRESULT,
	GetStringReference: proc "system" (this: ^IHlink, dwWhichRef: u32, ppwzTarget: ^PWSTR, ppwzLocation: ^PWSTR) -> HRESULT,
	SetFriendlyName: proc "system" (this: ^IHlink, pwzFriendlyName: PWSTR) -> HRESULT,
	GetFriendlyName: proc "system" (this: ^IHlink, grfHLFNAMEF: u32, ppwzFriendlyName: ^PWSTR) -> HRESULT,
	SetTargetFrameName: proc "system" (this: ^IHlink, pwzTargetFrameName: PWSTR) -> HRESULT,
	GetTargetFrameName: proc "system" (this: ^IHlink, ppwzTargetFrameName: ^PWSTR) -> HRESULT,
	GetMiscStatus: proc "system" (this: ^IHlink, pdwStatus: ^u32) -> HRESULT,
	Navigate: proc "system" (
		this: ^IHlink,
		grfHLNF: u32,
		pibc: ^IBindCtx,
		pibsc: ^IBindStatusCallback,
		pihlbc: ^IHlinkBrowseContext,
	) -> HRESULT,
	SetAdditionalParams: proc "system" (this: ^IHlink, pwzAdditionalParams: PWSTR) -> HRESULT,
	GetAdditionalParams: proc "system" (this: ^IHlink, ppwzAdditionalParams: ^PWSTR) -> HRESULT,
}
IID_IHlink :: GUID{0x79EAC9C3, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

IHlinkBrowseContext :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHlinkBrowseContext_Vtbl,
}
IHlinkBrowseContext_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Register: proc "system" (
		this: ^IHlinkBrowseContext,
		reserved: u32,
		piunk: ^IUnknown,
		pimk: ^IMoniker,
		pdwRegister: ^u32,
	) -> HRESULT,
	GetObject: proc "system" (
		this: ^IHlinkBrowseContext,
		pimk: ^IMoniker,
		fBindIfRootRegistered: BOOL,
		ppiunk: ^^IUnknown,
	) -> HRESULT,
	Revoke: proc "system" (this: ^IHlinkBrowseContext, dwRegister: u32) -> HRESULT,
	SetBrowseWindowInfo: proc "system" (this: ^IHlinkBrowseContext, phlbwi: ^HLBWINFO) -> HRESULT,
	GetBrowseWindowInfo: proc "system" (this: ^IHlinkBrowseContext, phlbwi: ^HLBWINFO) -> HRESULT,
	SetInitialHlink: proc "system" (
		this: ^IHlinkBrowseContext,
		pimkTarget: ^IMoniker,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
	) -> HRESULT,
	OnNavigateHlink: proc "system" (
		this: ^IHlinkBrowseContext,
		grfHLNF: u32,
		pimkTarget: ^IMoniker,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
		puHLID: ^u32,
	) -> HRESULT,
	UpdateHlink: proc "system" (
		this: ^IHlinkBrowseContext,
		uHLID: u32,
		pimkTarget: ^IMoniker,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
	) -> HRESULT,
	EnumNavigationStack: proc "system" (
		this: ^IHlinkBrowseContext,
		dwReserved: u32,
		grfHLFNAMEF: u32,
		ppienumhlitem: ^^IEnumHLITEM,
	) -> HRESULT,
	QueryHlink: proc "system" (this: ^IHlinkBrowseContext, grfHLQF: u32, uHLID: u32) -> HRESULT,
	GetHlink: proc "system" (this: ^IHlinkBrowseContext, uHLID: u32, ppihl: ^^IHlink) -> HRESULT,
	SetCurrentHlink: proc "system" (this: ^IHlinkBrowseContext, uHLID: u32) -> HRESULT,
	Clone: proc "system" (
		this: ^IHlinkBrowseContext,
		piunkOuter: ^IUnknown,
		#by_ptr riid: GUID,
		ppiunkObj: ^^IUnknown,
	) -> HRESULT,
	Close: proc "system" (this: ^IHlinkBrowseContext, reserved: u32) -> HRESULT,
}
IID_IHlinkBrowseContext :: GUID{0x79EAC9C7, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

IHlinkFrame :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHlinkFrame_Vtbl,
}
IHlinkFrame_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetBrowseContext: proc "system" (this: ^IHlinkFrame, pihlbc: ^IHlinkBrowseContext) -> HRESULT,
	GetBrowseContext: proc "system" (this: ^IHlinkFrame, ppihlbc: ^^IHlinkBrowseContext) -> HRESULT,
	Navigate: proc "system" (
		this: ^IHlinkFrame,
		grfHLNF: u32,
		pbc: ^IBindCtx,
		pibsc: ^IBindStatusCallback,
		pihlNavigate: ^IHlink,
	) -> HRESULT,
	OnNavigate: proc "system" (
		this: ^IHlinkFrame,
		grfHLNF: u32,
		pimkTarget: ^IMoniker,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
		dwreserved: u32,
	) -> HRESULT,
	UpdateHlink: proc "system" (
		this: ^IHlinkFrame,
		uHLID: u32,
		pimkTarget: ^IMoniker,
		pwzLocation: PWSTR,
		pwzFriendlyName: PWSTR,
	) -> HRESULT,
}
IID_IHlinkFrame :: GUID{0x79EAC9C5, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

IHlinkSite :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHlinkSite_Vtbl,
}
IHlinkSite_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryService: proc "system" (
		this: ^IHlinkSite,
		dwSiteData: u32,
		#by_ptr guidService: GUID,
		#by_ptr riid: GUID,
		ppiunk: ^^IUnknown,
	) -> HRESULT,
	GetMoniker: proc "system" (this: ^IHlinkSite, dwSiteData: u32, dwAssign: u32, dwWhich: u32, ppimk: ^^IMoniker) -> HRESULT,
	ReadyToNavigate: proc "system" (this: ^IHlinkSite, dwSiteData: u32, dwReserved: u32) -> HRESULT,
	OnNavigationComplete: proc "system" (
		this: ^IHlinkSite,
		dwSiteData: u32,
		dwreserved: u32,
		hrError: HRESULT,
		pwzError: PWSTR,
	) -> HRESULT,
}
IID_IHlinkSite :: GUID{0x79EAC9C2, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

IHlinkTarget :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHlinkTarget_Vtbl,
}
IHlinkTarget_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetBrowseContext: proc "system" (this: ^IHlinkTarget, pihlbc: ^IHlinkBrowseContext) -> HRESULT,
	GetBrowseContext: proc "system" (this: ^IHlinkTarget, ppihlbc: ^^IHlinkBrowseContext) -> HRESULT,
	Navigate: proc "system" (this: ^IHlinkTarget, grfHLNF: u32, pwzJumpLocation: PWSTR) -> HRESULT,
	GetMoniker: proc "system" (
		this: ^IHlinkTarget,
		pwzLocation: PWSTR,
		dwAssign: u32,
		ppimkLocation: ^^IMoniker,
	) -> HRESULT,
	GetFriendlyName: proc "system" (this: ^IHlinkTarget, pwzLocation: PWSTR, ppwzFriendlyName: ^PWSTR) -> HRESULT,
}
IID_IHlinkTarget :: GUID{0x79EAC9C4, 0xBAF9, 0x11CE, {0x8C, 0x82, 0x00, 0xAA, 0x00, 0x4B, 0xA9, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ihomegroup ]]
IHomeGroup :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHomeGroup_Vtbl,
}
IHomeGroup_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	IsMember: proc "system" (this: ^IHomeGroup, member: ^BOOL) -> HRESULT,
	ShowSharingWizard: proc "system" (this: ^IHomeGroup, owner: HWND, sharingchoices: ^HOMEGROUPSHARINGCHOICES) -> HRESULT,
}
IID_IHomeGroup :: GUID{0x7A3BD1D9, 0x35A9, 0x4FB3, {0xA4, 0x67, 0xF4, 0x8C, 0xAC, 0x35, 0xE2, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ihweventhandler ]]
IHWEventHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IHWEventHandler_Vtbl,
}
IHWEventHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IHWEventHandler, pszParams: PWSTR) -> HRESULT,
	HandleEvent: proc "system" (
		this: ^IHWEventHandler,
		pszDeviceID: PWSTR,
		pszAltDeviceID: PWSTR,
		pszEventType: PWSTR,
	) -> HRESULT,
	HandleEventWithContent: proc "system" (
		this: ^IHWEventHandler,
		pszDeviceID: PWSTR,
		pszAltDeviceID: PWSTR,
		pszEventType: PWSTR,
		pszContentTypeHandler: PWSTR,
		pdataobject: ^IDataObject,
	) -> HRESULT,
}
IID_IHWEventHandler :: GUID{0xC1FB73D0, 0xEC3A, 0x4BA2, {0xB5, 0x12, 0x8C, 0xDB, 0x91, 0x87, 0xB6, 0xD1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ihweventhandler2 ]]
IHWEventHandler2 :: struct #raw_union {
	#subtype IHWEventHandler: IHWEventHandler,
	using Vtbl: ^IHWEventHandler2_Vtbl,
}
IHWEventHandler2_Vtbl :: struct {
	using IHWEventHandler_Vtbl: IHWEventHandler_Vtbl,
	HandleEventWithHWND: proc "system" (
		this: ^IHWEventHandler2,
		pszDeviceID: PWSTR,
		pszAltDeviceID: PWSTR,
		pszEventType: PWSTR,
		hwndOwner: HWND,
	) -> HRESULT,
}
IID_IHWEventHandler2 :: GUID{0xCFCC809F, 0x295D, 0x42E8, {0x9F, 0xFC, 0x42, 0x4B, 0x33, 0xC4, 0x87, 0xE6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iidentityname ]]
IIdentityName :: struct #raw_union {
	#subtype IRelatedItem: IRelatedItem,
	using Vtbl: ^IIdentityName_Vtbl,
}
IIdentityName_Vtbl :: struct {
	using IRelatedItem_Vtbl: IRelatedItem_Vtbl,
}
IID_IIdentityName :: GUID{0x7D903FCA, 0xD6F9, 0x4810, {0x83, 0x32, 0x94, 0x6C, 0x01, 0x77, 0xE2, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iimagerecompress ]]
IImageRecompress :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IImageRecompress_Vtbl,
}
IImageRecompress_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RecompressImage: proc "system" (
		this: ^IImageRecompress,
		psi: ^IShellItem,
		cx: i32,
		cy: i32,
		iQuality: i32,
		pstg: ^IStorage,
		ppstrmOut: ^^IStream,
	) -> HRESULT,
}
IID_IImageRecompress :: GUID{0x505F1513, 0x6B3E, 0x4892, {0xA2, 0x72, 0x59, 0xF8, 0x88, 0x9A, 0x4D, 0x3E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializecommand ]]
IInitializeCommand :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInitializeCommand_Vtbl,
}
IInitializeCommand_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IInitializeCommand, pszCommandName: PWSTR, ppb: ^IPropertyBag) -> HRESULT,
}
IID_IInitializeCommand :: GUID{0x85075ACF, 0x231F, 0x40EA, {0x96, 0x10, 0xD2, 0x6B, 0x7B, 0x58, 0xF6, 0x38}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iinitializenetworkfolder ]]
IInitializeNetworkFolder :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInitializeNetworkFolder_Vtbl,
}
IInitializeNetworkFolder_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (
		this: ^IInitializeNetworkFolder,
		pidl: ^ITEMIDLIST,
		pidlTarget: ^ITEMIDLIST,
		uDisplayType: u32,
		pszResName: PWSTR,
		pszProvider: PWSTR,
	) -> HRESULT,
}
IID_IInitializeNetworkFolder :: GUID{0x6E0F9881, 0x42A8, 0x4F2A, {0x97, 0xF8, 0x8A, 0xF4, 0xE0, 0x26, 0xD9, 0x2D}}

IInitializeObject :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInitializeObject_Vtbl,
}
IInitializeObject_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IInitializeObject) -> HRESULT,
}
IID_IInitializeObject :: GUID{0x4622AD16, 0xFF23, 0x11D0, {0x8D, 0x34, 0x00, 0xA0, 0xC9, 0x0F, 0x27, 0x19}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializewithbindctx ]]
IInitializeWithBindCtx :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInitializeWithBindCtx_Vtbl,
}
IInitializeWithBindCtx_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IInitializeWithBindCtx, pbc: ^IBindCtx) -> HRESULT,
}
IID_IInitializeWithBindCtx :: GUID{0x71C0D2BC, 0x726D, 0x45CC, {0xA6, 0xC0, 0x2E, 0x31, 0xC1, 0xDB, 0x21, 0x59}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializewithitem ]]
IInitializeWithItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInitializeWithItem_Vtbl,
}
IInitializeWithItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IInitializeWithItem, psi: ^IShellItem, grfMode: u32) -> HRESULT,
}
IID_IInitializeWithItem :: GUID{0x7F73BE3F, 0xFB79, 0x493C, {0xA6, 0xC7, 0x7E, 0xE1, 0x4E, 0x24, 0x58, 0x41}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializewithpropertystore ]]
IInitializeWithPropertyStore :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInitializeWithPropertyStore_Vtbl,
}
IInitializeWithPropertyStore_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IInitializeWithPropertyStore, pps: ^IPropertyStore) -> HRESULT,
}
IID_IInitializeWithPropertyStore :: GUID{0xC3E12EB5, 0x7D8D, 0x44F8, {0xB6, 0xDD, 0x0E, 0x77, 0xB3, 0x4D, 0x6D, 0xE4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinitializewithwindow ]]
IInitializeWithWindow :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInitializeWithWindow_Vtbl,
}
IInitializeWithWindow_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IInitializeWithWindow, hwnd: HWND) -> HRESULT,
}
IID_IInitializeWithWindow :: GUID{0x3E68D4BD, 0x7135, 0x4D10, {0x80, 0x18, 0x9F, 0xB6, 0xD9, 0xF3, 0x3F, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinputobject ]]
IInputObject :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInputObject_Vtbl,
}
IInputObject_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	UIActivateIO: proc "system" (this: ^IInputObject, fActivate: BOOL, pMsg: ^MSG) -> HRESULT,
	HasFocusIO: proc "system" (this: ^IInputObject) -> HRESULT,
	TranslateAcceleratorIO: proc "system" (this: ^IInputObject, pMsg: ^MSG) -> HRESULT,
}
IID_IInputObject :: GUID{0x68284FAA, 0x6A48, 0x11D0, {0x8C, 0x78, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xB4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinputobject2 ]]
IInputObject2 :: struct #raw_union {
	#subtype IInputObject: IInputObject,
	using Vtbl: ^IInputObject2_Vtbl,
}
IInputObject2_Vtbl :: struct {
	using IInputObject_Vtbl: IInputObject_Vtbl,
	TranslateAcceleratorGlobal: proc "system" (this: ^IInputObject2, pMsg: ^MSG) -> HRESULT,
}
IID_IInputObject2 :: GUID{0x6915C085, 0x510B, 0x44CD, {0x94, 0xAF, 0x28, 0xDF, 0xA5, 0x6C, 0xF9, 0x2B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iinputobjectsite ]]
IInputObjectSite :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInputObjectSite_Vtbl,
}
IInputObjectSite_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnFocusChangeIS: proc "system" (this: ^IInputObjectSite, punkObj: ^IUnknown, fSetFocus: BOOL) -> HRESULT,
}
IID_IInputObjectSite :: GUID{0xF1DB8392, 0x7331, 0x11D0, {0x8C, 0x99, 0x00, 0xA0, 0xC9, 0x2D, 0xBF, 0xE8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nn-inputpanelconfiguration-iinputpanelconfiguration ]]
IInputPanelConfiguration :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInputPanelConfiguration_Vtbl,
}
IInputPanelConfiguration_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnableFocusTracking: proc "system" (this: ^IInputPanelConfiguration) -> HRESULT,
}
IID_IInputPanelConfiguration :: GUID{0x41C81592, 0x514C, 0x48BD, {0xA2, 0x2E, 0xE6, 0xAF, 0x63, 0x85, 0x21, 0xA6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/inputpanelconfiguration/nn-inputpanelconfiguration-iinputpanelinvocationconfiguration ]]
IInputPanelInvocationConfiguration :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInputPanelInvocationConfiguration_Vtbl,
}
IInputPanelInvocationConfiguration_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RequireTouchInEditControl: proc "system" (this: ^IInputPanelInvocationConfiguration) -> HRESULT,
}
IID_IInputPanelInvocationConfiguration :: GUID{0xA213F136, 0x3B45, 0x4362, {0xA3, 0x32, 0xEF, 0xB6, 0x54, 0x7C, 0xD4, 0x32}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iinsertitem ]]
IInsertItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IInsertItem_Vtbl,
}
IInsertItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	InsertItem: proc "system" (this: ^IInsertItem, pidl: ^ITEMIDLIST) -> HRESULT,
}
IID_IInsertItem :: GUID{0xD2B57227, 0x3D23, 0x4B95, {0x93, 0xC0, 0x49, 0x2B, 0xD4, 0x54, 0xC3, 0x56}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iiocancelinformation ]]
IIOCancelInformation :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IIOCancelInformation_Vtbl,
}
IIOCancelInformation_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetCancelInformation: proc "system" (this: ^IIOCancelInformation, dwThreadID: u32, uMsgCancel: u32) -> HRESULT,
	GetCancelInformation: proc "system" (this: ^IIOCancelInformation, pdwThreadID: ^u32, puMsgCancel: ^u32) -> HRESULT,
}
IID_IIOCancelInformation :: GUID{0xF5B0BF81, 0x8CB5, 0x4B1B, {0x94, 0x49, 0x1A, 0x15, 0x9E, 0x0C, 0x73, 0x3C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iitemnamelimits ]]
IItemNameLimits :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IItemNameLimits_Vtbl,
}
IItemNameLimits_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetValidCharacters: proc "system" (this: ^IItemNameLimits, ppwszValidChars: ^PWSTR, ppwszInvalidChars: ^PWSTR) -> HRESULT,
	GetMaxLength: proc "system" (this: ^IItemNameLimits, pszName: PWSTR, piMaxNameLen: ^i32) -> HRESULT,
}
IID_IItemNameLimits :: GUID{0x1DF0D7F1, 0xB267, 0x4D28, {0x8B, 0x10, 0x12, 0xE2, 0x32, 0x02, 0xA5, 0xC4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iknownfolder ]]
IKnownFolder :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IKnownFolder_Vtbl,
}
IKnownFolder_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetId: proc "system" (this: ^IKnownFolder, pkfid: ^GUID) -> HRESULT,
	GetCategory: proc "system" (this: ^IKnownFolder, pCategory: ^KF_CATEGORY) -> HRESULT,
	GetShellItem: proc "system" (this: ^IKnownFolder, dwFlags: u32, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetPath: proc "system" (this: ^IKnownFolder, dwFlags: u32, ppszPath: ^PWSTR) -> HRESULT,
	SetPath: proc "system" (this: ^IKnownFolder, dwFlags: u32, pszPath: PWSTR) -> HRESULT,
	GetIDList: proc "system" (this: ^IKnownFolder, dwFlags: u32, ppidl: ^ITEMIDLIST) -> HRESULT,
	GetFolderType: proc "system" (this: ^IKnownFolder, pftid: ^GUID) -> HRESULT,
	GetRedirectionCapabilities: proc "system" (this: ^IKnownFolder, pCapabilities: ^u32) -> HRESULT,
	GetFolderDefinition: proc "system" (this: ^IKnownFolder, pKFD: ^KNOWNFOLDER_DEFINITION) -> HRESULT,
}
IID_IKnownFolder :: GUID{0x3AA7AF7E, 0x9B36, 0x420C, {0xA8, 0xE3, 0xF7, 0x7D, 0x46, 0x74, 0xA4, 0x88}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iknownfoldermanager ]]
IKnownFolderManager :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IKnownFolderManager_Vtbl,
}
IKnownFolderManager_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	FolderIdFromCsidl: proc "system" (this: ^IKnownFolderManager, nCsidl: i32, pfid: ^GUID) -> HRESULT,
	FolderIdToCsidl: proc "system" (this: ^IKnownFolderManager, #by_ptr rfid: GUID, pnCsidl: ^i32) -> HRESULT,
	GetFolderIds: proc "system" (this: ^IKnownFolderManager, ppKFId: [^]GUID, pCount: ^u32) -> HRESULT,
	GetFolder: proc "system" (this: ^IKnownFolderManager, #by_ptr rfid: GUID, ppkf: ^^IKnownFolder) -> HRESULT,
	GetFolderByName: proc "system" (this: ^IKnownFolderManager, pszCanonicalName: PWSTR, ppkf: ^^IKnownFolder) -> HRESULT,
	RegisterFolder: proc "system" (
		this: ^IKnownFolderManager,
		#by_ptr rfid: GUID,
		#by_ptr pKFD: KNOWNFOLDER_DEFINITION,
	) -> HRESULT,
	UnregisterFolder: proc "system" (this: ^IKnownFolderManager, #by_ptr rfid: GUID) -> HRESULT,
	FindFolderFromPath: proc "system" (
		this: ^IKnownFolderManager,
		pszPath: PWSTR,
		mode: FFFP_MODE,
		ppkf: ^^IKnownFolder,
	) -> HRESULT,
	FindFolderFromIDList: proc "system" (this: ^IKnownFolderManager, pidl: ^ITEMIDLIST, ppkf: ^^IKnownFolder) -> HRESULT,
	Redirect: proc "system" (
		this: ^IKnownFolderManager,
		#by_ptr rfid: GUID,
		hwnd: HWND,
		flags: u32,
		pszTargetPath: PWSTR,
		cFolders: u32,
		pExclusion: [^]GUID,
		ppszError: ^PWSTR,
	) -> HRESULT,
}
IID_IKnownFolderManager :: GUID{0x8BE2D872, 0x86AA, 0x4D47, {0xB7, 0x76, 0x32, 0xCC, 0xA4, 0x0C, 0x70, 0x18}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ilaunchsourceappusermodelid ]]
ILaunchSourceAppUserModelId :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILaunchSourceAppUserModelId_Vtbl,
}
ILaunchSourceAppUserModelId_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetAppUserModelId: proc "system" (this: ^ILaunchSourceAppUserModelId, launchingApp: ^PWSTR) -> HRESULT,
}
IID_ILaunchSourceAppUserModelId :: GUID{0x989191AC, 0x28FF, 0x4CF0, {0x95, 0x84, 0xE0, 0xD0, 0x78, 0xBC, 0x23, 0x96}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ilaunchsourceviewsizepreference ]]
ILaunchSourceViewSizePreference :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILaunchSourceViewSizePreference_Vtbl,
}
ILaunchSourceViewSizePreference_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetSourceViewToPosition: proc "system" (this: ^ILaunchSourceViewSizePreference, hwnd: ^HWND) -> HRESULT,
	GetSourceViewSizePreference: proc "system" (
		this: ^ILaunchSourceViewSizePreference,
		sourceSizeAfterLaunch: ^APPLICATION_VIEW_SIZE_PREFERENCE,
	) -> HRESULT,
}
IID_ILaunchSourceViewSizePreference :: GUID{0xE5AA01F7, 0x1FB8, 0x4830, {0x87, 0x20, 0x4E, 0x67, 0x34, 0xCB, 0xD5, 0xF3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ilaunchtargetmonitor ]]
ILaunchTargetMonitor :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILaunchTargetMonitor_Vtbl,
}
ILaunchTargetMonitor_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetMonitor: proc "system" (this: ^ILaunchTargetMonitor, monitor: ^HMONITOR) -> HRESULT,
}
IID_ILaunchTargetMonitor :: GUID{0x266FBC7E, 0x490D, 0x46ED, {0xA9, 0x6B, 0x22, 0x74, 0xDB, 0x25, 0x20, 0x03}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ilaunchtargetviewsizepreference ]]
ILaunchTargetViewSizePreference :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILaunchTargetViewSizePreference_Vtbl,
}
ILaunchTargetViewSizePreference_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetTargetViewSizePreference: proc "system" (
		this: ^ILaunchTargetViewSizePreference,
		targetSizeOnLaunch: ^APPLICATION_VIEW_SIZE_PREFERENCE,
	) -> HRESULT,
}
IID_ILaunchTargetViewSizePreference :: GUID{0x2F0666C6, 0x12F7, 0x4360, {0xB5, 0x11, 0xA3, 0x94, 0xA0, 0x55, 0x37, 0x25}}

ILaunchUIContext :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILaunchUIContext_Vtbl,
}
ILaunchUIContext_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAssociatedWindow: proc "system" (this: ^ILaunchUIContext, value: HWND) -> HRESULT,
	SetTabGroupingPreference: proc "system" (this: ^ILaunchUIContext, value: u32) -> HRESULT,
}
IID_ILaunchUIContext :: GUID{0x1791E8F6, 0x21C7, 0x4340, {0x88, 0x2A, 0xA6, 0xA9, 0x3E, 0x3F, 0xD7, 0x3B}}

ILaunchUIContextProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILaunchUIContextProvider_Vtbl,
}
ILaunchUIContextProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	UpdateContext: proc "system" (this: ^ILaunchUIContextProvider, _context: ^ILaunchUIContext) -> HRESULT,
}
IID_ILaunchUIContextProvider :: GUID{0x0D12C4C8, 0xA3D9, 0x4E24, {0x94, 0xC1, 0x0E, 0x20, 0xC5, 0xA9, 0x56, 0xC4}}

ImageProperties :: struct {
}
IID_ImageProperties :: GUID{0x7AB770C7, 0x0E23, 0x4D7A, {0x8A, 0xA2, 0x19, 0xBF, 0xAD, 0x47, 0x98, 0x29}}

ImageRecompress :: struct {
}
IID_ImageRecompress :: GUID{0x6E33091C, 0xD2F8, 0x4740, {0xB5, 0x5E, 0x2E, 0x11, 0xD1, 0x47, 0x7A, 0x2C}}

ImageTranscode :: struct {
}
IID_ImageTranscode :: GUID{0x17B75166, 0x928F, 0x417D, {0x96, 0x85, 0x64, 0xAA, 0x13, 0x55, 0x65, 0xC1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-imenuband ]]
IMenuBand :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMenuBand_Vtbl,
}
IMenuBand_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	IsMenuMessage: proc "system" (this: ^IMenuBand, pmsg: ^MSG) -> HRESULT,
	TranslateMenuMessage: proc "system" (this: ^IMenuBand, pmsg: ^MSG, plRet: ^LRESULT) -> HRESULT,
}
IID_IMenuBand :: GUID{0x568804CD, 0xCBD7, 0x11D0, {0x98, 0x16, 0x00, 0xC0, 0x4F, 0xD9, 0x19, 0x72}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-imenupopup ]]
IMenuPopup :: struct #raw_union {
	#subtype IDeskBar: IDeskBar,
	using Vtbl: ^IMenuPopup_Vtbl,
}
IMenuPopup_Vtbl :: struct {
	using IDeskBar_Vtbl: IDeskBar_Vtbl,
	Popup: proc "system" (this: ^IMenuPopup, ppt: ^POINTL, prcExclude: ^RECTL, dwFlags: i32) -> HRESULT,
	OnSelect: proc "system" (this: ^IMenuPopup, dwSelectType: u32) -> HRESULT,
	SetSubMenu: proc "system" (this: ^IMenuPopup, pmp: ^IMenuPopup, fSet: BOOL) -> HRESULT,
}
IID_IMenuPopup :: GUID{0xD1E7AFEB, 0x6A2E, 0x11D0, {0x8C, 0x78, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xB4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-imodalwindow ]]
IModalWindow :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IModalWindow_Vtbl,
}
IModalWindow_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Show: proc "system" (this: ^IModalWindow, hwndOwner: HWND) -> HRESULT,
}
IID_IModalWindow :: GUID{0xB4DB1657, 0x70D7, 0x485E, {0x8E, 0x3E, 0x6F, 0xCB, 0x5A, 0x5C, 0x18, 0x02}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-inamedpropertybag ]]
INamedPropertyBag :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INamedPropertyBag_Vtbl,
}
INamedPropertyBag_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ReadPropertyNPB: proc "system" (
		this: ^INamedPropertyBag,
		pszBagname: PWSTR,
		pszPropName: PWSTR,
		pVar: ^PROPVARIANT,
	) -> HRESULT,
	WritePropertyNPB: proc "system" (
		this: ^INamedPropertyBag,
		pszBagname: PWSTR,
		pszPropName: PWSTR,
		pVar: ^PROPVARIANT,
	) -> HRESULT,
	RemovePropertyNPB: proc "system" (this: ^INamedPropertyBag, pszBagname: PWSTR, pszPropName: PWSTR) -> HRESULT,
}
IID_INamedPropertyBag :: GUID{0xFB700430, 0x952C, 0x11D1, {0x94, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreeaccessible ]]
INameSpaceTreeAccessible :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INameSpaceTreeAccessible_Vtbl,
}
INameSpaceTreeAccessible_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnGetDefaultAccessibilityAction: proc "system" (
		this: ^INameSpaceTreeAccessible,
		psi: ^IShellItem,
		pbstrDefaultAction: ^BSTR,
	) -> HRESULT,
	OnDoDefaultAccessibilityAction: proc "system" (this: ^INameSpaceTreeAccessible, psi: ^IShellItem) -> HRESULT,
	OnGetAccessibilityRole: proc "system" (this: ^INameSpaceTreeAccessible, psi: ^IShellItem, pvarRole: ^VARIANT) -> HRESULT,
}
IID_INameSpaceTreeAccessible :: GUID{0x71F312DE, 0x43ED, 0x4190, {0x84, 0x77, 0xE9, 0x53, 0x6B, 0x82, 0x35, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrol ]]
INameSpaceTreeControl :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INameSpaceTreeControl_Vtbl,
}
INameSpaceTreeControl_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^INameSpaceTreeControl, hwndParent: HWND, prc: ^RECT, nsctsFlags: u32) -> HRESULT,
	TreeAdvise: proc "system" (this: ^INameSpaceTreeControl, punk: ^IUnknown, pdwCookie: ^u32) -> HRESULT,
	TreeUnadvise: proc "system" (this: ^INameSpaceTreeControl, dwCookie: u32) -> HRESULT,
	AppendRoot: proc "system" (
		this: ^INameSpaceTreeControl,
		psiRoot: ^IShellItem,
		grfEnumFlags: u32,
		grfRootStyle: u32,
		pif: ^IShellItemFilter,
	) -> HRESULT,
	InsertRoot: proc "system" (
		this: ^INameSpaceTreeControl,
		iIndex: i32,
		psiRoot: ^IShellItem,
		grfEnumFlags: u32,
		grfRootStyle: u32,
		pif: ^IShellItemFilter,
	) -> HRESULT,
	RemoveRoot: proc "system" (this: ^INameSpaceTreeControl, psiRoot: ^IShellItem) -> HRESULT,
	RemoveAllRoots: proc "system" (this: ^INameSpaceTreeControl) -> HRESULT,
	GetRootItems: proc "system" (this: ^INameSpaceTreeControl, ppsiaRootItems: ^^IShellItemArray) -> HRESULT,
	SetItemState: proc "system" (
		this: ^INameSpaceTreeControl,
		psi: ^IShellItem,
		nstcisMask: u32,
		nstcisFlags: u32,
	) -> HRESULT,
	GetItemState: proc "system" (
		this: ^INameSpaceTreeControl,
		psi: ^IShellItem,
		nstcisMask: u32,
		pnstcisFlags: ^u32,
	) -> HRESULT,
	GetSelectedItems: proc "system" (this: ^INameSpaceTreeControl, psiaItems: ^^IShellItemArray) -> HRESULT,
	GetItemCustomState: proc "system" (this: ^INameSpaceTreeControl, psi: ^IShellItem, piStateNumber: ^i32) -> HRESULT,
	SetItemCustomState: proc "system" (this: ^INameSpaceTreeControl, psi: ^IShellItem, iStateNumber: i32) -> HRESULT,
	EnsureItemVisible: proc "system" (this: ^INameSpaceTreeControl, psi: ^IShellItem) -> HRESULT,
	SetTheme: proc "system" (this: ^INameSpaceTreeControl, pszTheme: PWSTR) -> HRESULT,
	GetNextItem: proc "system" (
		this: ^INameSpaceTreeControl,
		psi: ^IShellItem,
		nstcgi: NSTCGNI,
		ppsiNext: ^^IShellItem,
	) -> HRESULT,
	HitTest: proc "system" (this: ^INameSpaceTreeControl, ppt: ^POINT, ppsiOut: ^^IShellItem) -> HRESULT,
	GetItemRect: proc "system" (this: ^INameSpaceTreeControl, psi: ^IShellItem, prect: ^RECT) -> HRESULT,
	CollapseAll: proc "system" (this: ^INameSpaceTreeControl) -> HRESULT,
}
IID_INameSpaceTreeControl :: GUID{0x028212A3, 0xB627, 0x47E9, {0x88, 0x56, 0xC1, 0x42, 0x65, 0x55, 0x4E, 0x4F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreecontrol2 ]]
INameSpaceTreeControl2 :: struct #raw_union {
	#subtype INameSpaceTreeControl: INameSpaceTreeControl,
	using Vtbl: ^INameSpaceTreeControl2_Vtbl,
}
INameSpaceTreeControl2_Vtbl :: struct {
	using INameSpaceTreeControl_Vtbl: INameSpaceTreeControl_Vtbl,
	SetControlStyle: proc "system" (this: ^INameSpaceTreeControl2, nstcsMask: u32, nstcsStyle: u32) -> HRESULT,
	GetControlStyle: proc "system" (this: ^INameSpaceTreeControl2, nstcsMask: u32, pnstcsStyle: ^u32) -> HRESULT,
	SetControlStyle2: proc "system" (
		this: ^INameSpaceTreeControl2,
		nstcsMask: NSTCSTYLE2,
		nstcsStyle: NSTCSTYLE2,
	) -> HRESULT,
	GetControlStyle2: proc "system" (
		this: ^INameSpaceTreeControl2,
		nstcsMask: NSTCSTYLE2,
		pnstcsStyle: ^NSTCSTYLE2,
	) -> HRESULT,
}
IID_INameSpaceTreeControl2 :: GUID{0x7CC7AED8, 0x290E, 0x49BC, {0x89, 0x45, 0xC1, 0x40, 0x1C, 0xC9, 0x30, 0x6C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreecontrolcustomdraw ]]
INameSpaceTreeControlCustomDraw :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INameSpaceTreeControlCustomDraw_Vtbl,
}
INameSpaceTreeControlCustomDraw_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	PrePaint: proc "system" (this: ^INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ^RECT, plres: ^LRESULT) -> HRESULT,
	PostPaint: proc "system" (this: ^INameSpaceTreeControlCustomDraw, hdc: HDC, prc: ^RECT) -> HRESULT,
	ItemPrePaint: proc "system" (
		this: ^INameSpaceTreeControlCustomDraw,
		hdc: HDC,
		prc: ^RECT,
		pnstccdItem: ^NSTCCUSTOMDRAW,
		pclrText: ^COLORREF,
		pclrTextBk: ^COLORREF,
		plres: ^LRESULT,
	) -> HRESULT,
	ItemPostPaint: proc "system" (
		this: ^INameSpaceTreeControlCustomDraw,
		hdc: HDC,
		prc: ^RECT,
		pnstccdItem: ^NSTCCUSTOMDRAW,
	) -> HRESULT,
}
IID_INameSpaceTreeControlCustomDraw :: GUID{0x2D3BA758, 0x33EE, 0x42D5, {0xBB, 0x7B, 0x5F, 0x34, 0x31, 0xD8, 0x6C, 0x78}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreecontroldrophandler ]]
INameSpaceTreeControlDropHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INameSpaceTreeControlDropHandler_Vtbl,
}
INameSpaceTreeControlDropHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnDragEnter: proc "system" (
		this: ^INameSpaceTreeControlDropHandler,
		psiOver: ^IShellItem,
		psiaData: ^IShellItemArray,
		fOutsideSource: BOOL,
		grfKeyState: u32,
		pdwEffect: ^u32,
	) -> HRESULT,
	OnDragOver: proc "system" (
		this: ^INameSpaceTreeControlDropHandler,
		psiOver: ^IShellItem,
		psiaData: ^IShellItemArray,
		grfKeyState: u32,
		pdwEffect: ^u32,
	) -> HRESULT,
	OnDragPosition: proc "system" (
		this: ^INameSpaceTreeControlDropHandler,
		psiOver: ^IShellItem,
		psiaData: ^IShellItemArray,
		iNewPosition: i32,
		iOldPosition: i32,
	) -> HRESULT,
	OnDrop: proc "system" (
		this: ^INameSpaceTreeControlDropHandler,
		psiOver: ^IShellItem,
		psiaData: ^IShellItemArray,
		iPosition: i32,
		grfKeyState: u32,
		pdwEffect: ^u32,
	) -> HRESULT,
	OnDropPosition: proc "system" (
		this: ^INameSpaceTreeControlDropHandler,
		psiOver: ^IShellItem,
		psiaData: ^IShellItemArray,
		iNewPosition: i32,
		iOldPosition: i32,
	) -> HRESULT,
	OnDragLeave: proc "system" (this: ^INameSpaceTreeControlDropHandler, psiOver: ^IShellItem) -> HRESULT,
}
IID_INameSpaceTreeControlDropHandler :: GUID{0xF9C665D6, 0xC2F2, 0x4C19, {0xBF, 0x33, 0x83, 0x22, 0xD7, 0x35, 0x2F, 0x51}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-inamespacetreecontrolevents ]]
INameSpaceTreeControlEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INameSpaceTreeControlEvents_Vtbl,
}
INameSpaceTreeControlEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnItemClick: proc "system" (
		this: ^INameSpaceTreeControlEvents,
		psi: ^IShellItem,
		nstceHitTest: u32,
		nstceClickType: u32,
	) -> HRESULT,
	OnPropertyItemCommit: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem) -> HRESULT,
	OnItemStateChanging: proc "system" (
		this: ^INameSpaceTreeControlEvents,
		psi: ^IShellItem,
		nstcisMask: u32,
		nstcisState: u32,
	) -> HRESULT,
	OnItemStateChanged: proc "system" (
		this: ^INameSpaceTreeControlEvents,
		psi: ^IShellItem,
		nstcisMask: u32,
		nstcisState: u32,
	) -> HRESULT,
	OnSelectionChanged: proc "system" (this: ^INameSpaceTreeControlEvents, psiaSelection: ^IShellItemArray) -> HRESULT,
	OnKeyboardInput: proc "system" (this: ^INameSpaceTreeControlEvents, uMsg: u32, wParam: WPARAM, lParam: LPARAM) -> HRESULT,
	OnBeforeExpand: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem) -> HRESULT,
	OnAfterExpand: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem) -> HRESULT,
	OnBeginLabelEdit: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem) -> HRESULT,
	OnEndLabelEdit: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem) -> HRESULT,
	OnGetToolTip: proc "system" (
		this: ^INameSpaceTreeControlEvents,
		psi: ^IShellItem,
		pszTip: PWSTR,
		cchTip: i32,
	) -> HRESULT,
	OnBeforeItemDelete: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem) -> HRESULT,
	OnItemAdded: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem, fIsRoot: BOOL) -> HRESULT,
	OnItemDeleted: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem, fIsRoot: BOOL) -> HRESULT,
	OnBeforeContextMenu: proc "system" (
		this: ^INameSpaceTreeControlEvents,
		psi: ^IShellItem,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	OnAfterContextMenu: proc "system" (
		this: ^INameSpaceTreeControlEvents,
		psi: ^IShellItem,
		pcmIn: ^IContextMenu,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	OnBeforeStateImageChange: proc "system" (this: ^INameSpaceTreeControlEvents, psi: ^IShellItem) -> HRESULT,
	OnGetDefaultIconIndex: proc "system" (
		this: ^INameSpaceTreeControlEvents,
		psi: ^IShellItem,
		piDefaultIcon: ^i32,
		piOpenIcon: ^i32,
	) -> HRESULT,
}
IID_INameSpaceTreeControlEvents :: GUID{0x93D77985, 0xB3D8, 0x4484, {0x83, 0x18, 0x67, 0x2C, 0xDD, 0xA0, 0x02, 0xCE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacetreecontrolfoldercapabilities ]]
INameSpaceTreeControlFolderCapabilities :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INameSpaceTreeControlFolderCapabilities_Vtbl,
}
INameSpaceTreeControlFolderCapabilities_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetFolderCapabilities: proc "system" (
		this: ^INameSpaceTreeControlFolderCapabilities,
		nfcMask: NSTCFOLDERCAPABILITIES,
		pnfcValue: ^NSTCFOLDERCAPABILITIES,
	) -> HRESULT,
}
IID_INameSpaceTreeControlFolderCapabilities :: GUID{0xE9701183, 0xE6B3, 0x4FF2, {0x85, 0x68, 0x81, 0x36, 0x15, 0xFE, 0xC7, 0xBE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalk ]]
INamespaceWalk :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INamespaceWalk_Vtbl,
}
INamespaceWalk_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Walk: proc "system" (
		this: ^INamespaceWalk,
		punkToWalk: ^IUnknown,
		dwFlags: u32,
		cDepth: i32,
		pnswcb: ^INamespaceWalkCB,
	) -> HRESULT,
	GetIDArrayResult: proc "system" (this: ^INamespaceWalk, pcItems: ^u32, prgpidl: [^]ITEMIDLIST) -> HRESULT,
}
IID_INamespaceWalk :: GUID{0x57CED8A7, 0x3F4A, 0x432C, {0x93, 0x50, 0x30, 0xF2, 0x44, 0x83, 0xF7, 0x4F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb ]]
INamespaceWalkCB :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INamespaceWalkCB_Vtbl,
}
INamespaceWalkCB_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	FoundItem: proc "system" (this: ^INamespaceWalkCB, psf: ^IShellFolder, pidl: ^ITEMIDLIST) -> HRESULT,
	EnterFolder: proc "system" (this: ^INamespaceWalkCB, psf: ^IShellFolder, pidl: ^ITEMIDLIST) -> HRESULT,
	LeaveFolder: proc "system" (this: ^INamespaceWalkCB, psf: ^IShellFolder, pidl: ^ITEMIDLIST) -> HRESULT,
	InitializeProgressDialog: proc "system" (this: ^INamespaceWalkCB, ppszTitle: ^PWSTR, ppszCancel: ^PWSTR) -> HRESULT,
}
IID_INamespaceWalkCB :: GUID{0xD92995F8, 0xCF5E, 0x4A76, {0xBF, 0x59, 0xEA, 0xD3, 0x9E, 0xA2, 0xB9, 0x7E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inamespacewalkcb2 ]]
INamespaceWalkCB2 :: struct #raw_union {
	#subtype INamespaceWalkCB: INamespaceWalkCB,
	using Vtbl: ^INamespaceWalkCB2_Vtbl,
}
INamespaceWalkCB2_Vtbl :: struct {
	using INamespaceWalkCB_Vtbl: INamespaceWalkCB_Vtbl,
	WalkComplete: proc "system" (this: ^INamespaceWalkCB2, hr: HRESULT) -> HRESULT,
}
IID_INamespaceWalkCB2 :: GUID{0x7AC7492B, 0xC38E, 0x438A, {0x87, 0xDB, 0x68, 0x73, 0x78, 0x44, 0xFF, 0x70}}

INetworkFolderInternal :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INetworkFolderInternal_Vtbl,
}
INetworkFolderInternal_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetResourceDisplayType: proc "system" (this: ^INetworkFolderInternal, displayType: ^u32) -> HRESULT,
	GetIDList: proc "system" (this: ^INetworkFolderInternal, idList: ^ITEMIDLIST) -> HRESULT,
	GetProvider: proc "system" (
		this: ^INetworkFolderInternal,
		itemIdCount: u32,
		itemIds: [^]ITEMIDLIST,
		providerMaxLength: u32,
		provider: PWSTR,
	) -> HRESULT,
}
IID_INetworkFolderInternal :: GUID{0xCEB38218, 0xC971, 0x47BB, {0xA7, 0x03, 0xF0, 0xBC, 0x99, 0xCC, 0xDB, 0x81}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inewmenuclient ]]
INewMenuClient :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INewMenuClient_Vtbl,
}
INewMenuClient_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	IncludeItems: proc "system" (this: ^INewMenuClient, pflags: ^i32) -> HRESULT,
	SelectAndEditItem: proc "system" (this: ^INewMenuClient, pidlItem: ^ITEMIDLIST, flags: i32) -> HRESULT,
}
IID_INewMenuClient :: GUID{0xDCB07FDC, 0x3BB5, 0x451C, {0x90, 0xBE, 0x96, 0x66, 0x44, 0xFE, 0xD7, 0xB0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-inewshortcuthooka ]]
INewShortcutHookA :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INewShortcutHookA_Vtbl,
}
INewShortcutHookA_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetReferent: proc "system" (this: ^INewShortcutHookA, pcszReferent: PSTR, hwnd: HWND) -> HRESULT,
	GetReferent: proc "system" (this: ^INewShortcutHookA, pszReferent: PSTR, cchReferent: i32) -> HRESULT,
	SetFolder: proc "system" (this: ^INewShortcutHookA, pcszFolder: PSTR) -> HRESULT,
	GetFolder: proc "system" (this: ^INewShortcutHookA, pszFolder: PSTR, cchFolder: i32) -> HRESULT,
	GetName: proc "system" (this: ^INewShortcutHookA, pszName: PSTR, cchName: i32) -> HRESULT,
	GetExtension: proc "system" (this: ^INewShortcutHookA, pszExtension: PSTR, cchExtension: i32) -> HRESULT,
}
IID_INewShortcutHookA :: GUID{0x000214E1, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-inewshortcuthookw ]]
INewShortcutHookW :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INewShortcutHookW_Vtbl,
}
INewShortcutHookW_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetReferent: proc "system" (this: ^INewShortcutHookW, pcszReferent: PWSTR, hwnd: HWND) -> HRESULT,
	GetReferent: proc "system" (this: ^INewShortcutHookW, pszReferent: PWSTR, cchReferent: i32) -> HRESULT,
	SetFolder: proc "system" (this: ^INewShortcutHookW, pcszFolder: PWSTR) -> HRESULT,
	GetFolder: proc "system" (this: ^INewShortcutHookW, pszFolder: PWSTR, cchFolder: i32) -> HRESULT,
	GetName: proc "system" (this: ^INewShortcutHookW, pszName: PWSTR, cchName: i32) -> HRESULT,
	GetExtension: proc "system" (this: ^INewShortcutHookW, pszExtension: PWSTR, cchExtension: i32) -> HRESULT,
}
IID_INewShortcutHookW :: GUID{0x000214F7, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

INewWDEvents :: struct #raw_union {
	#subtype IWebWizardHost: IWebWizardHost,
	using Vtbl: ^INewWDEvents_Vtbl,
}
INewWDEvents_Vtbl :: struct {
	using IWebWizardHost_Vtbl: IWebWizardHost_Vtbl,
	PassportAuthenticate: proc "system" (this: ^INewWDEvents, bstrSignInUrl: BSTR, pvfAuthenitcated: ^VARIANT_BOOL) -> HRESULT,
}
IID_INewWDEvents :: GUID{0x0751C551, 0x7568, 0x41C9, {0x8E, 0x5B, 0xE2, 0x2E, 0x38, 0x91, 0x92, 0x36}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-inewwindowmanager ]]
INewWindowManager :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INewWindowManager_Vtbl,
}
INewWindowManager_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EvaluateNewWindow: proc "system" (
		this: ^INewWindowManager,
		pszUrl: PWSTR,
		pszName: PWSTR,
		pszUrlContext: PWSTR,
		pszFeatures: PWSTR,
		fReplace: BOOL,
		dwFlags: u32,
		dwUserActionTime: u32,
	) -> HRESULT,
}
IID_INewWindowManager :: GUID{0xD2BC4C84, 0x3F72, 0x4A52, {0xA6, 0x04, 0x7B, 0xCB, 0xF3, 0x98, 0x2C, 0xBB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/reconcil/nn-reconcil-inotifyreplica ]]
INotifyReplica :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^INotifyReplica_Vtbl,
}
INotifyReplica_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	YouAreAReplica: proc "system" (
		this: ^INotifyReplica,
		ulcOtherReplicas: u32,
		rgpmkOtherReplicas: [^]^IMoniker,
	) -> HRESULT,
}
IID_INotifyReplica :: GUID{0x99180163, 0xDA16, 0x101A, {0x93, 0x5C, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00}}

InputPanelConfiguration :: struct {
}
IID_InputPanelConfiguration :: GUID{0x2853ADD3, 0xF096, 0x4C63, {0xA7, 0x8F, 0x7F, 0xA3, 0xEA, 0x83, 0x7F, 0xB7}}

InternetExplorer :: struct {
}
IID_InternetExplorer :: GUID{0x0002DF01, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

InternetExplorerMedium :: struct {
}
IID_InternetExplorerMedium :: GUID{0xD5E8041D, 0x920F, 0x45E9, {0xB8, 0xFB, 0xB1, 0xDE, 0xB8, 0x2C, 0x6E, 0x5E}}

InternetPrintOrdering :: struct {
}
IID_InternetPrintOrdering :: GUID{0xADD36AA8, 0x751A, 0x4579, {0xA2, 0x66, 0xD6, 0x6F, 0x52, 0x02, 0xCC, 0xBB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectprovider ]]
IObjectProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectProvider_Vtbl,
}
IObjectProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryObject: proc "system" (
		this: ^IObjectProvider,
		#by_ptr guidObject: GUID,
		#by_ptr riid: GUID,
		ppvOut: rawptr,
	) -> HRESULT,
}
IID_IObjectProvider :: GUID{0xA6087428, 0x3BE3, 0x4D73, {0xB3, 0x08, 0x7C, 0x04, 0xA5, 0x40, 0xBF, 0x1A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithappusermodelid ]]
IObjectWithAppUserModelID :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectWithAppUserModelID_Vtbl,
}
IObjectWithAppUserModelID_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetAppID: proc "system" (this: ^IObjectWithAppUserModelID, pszAppID: PWSTR) -> HRESULT,
	GetAppID: proc "system" (this: ^IObjectWithAppUserModelID, ppszAppID: ^PWSTR) -> HRESULT,
}
IID_IObjectWithAppUserModelID :: GUID{0x36DB0196, 0x9665, 0x46D1, {0x9B, 0xA7, 0xD3, 0x70, 0x9E, 0xEC, 0xF9, 0xED}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithbackreferences ]]
IObjectWithBackReferences :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectWithBackReferences_Vtbl,
}
IObjectWithBackReferences_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RemoveBackReferences: proc "system" (this: ^IObjectWithBackReferences) -> HRESULT,
}
IID_IObjectWithBackReferences :: GUID{0x321A6A6A, 0xD61F, 0x4BF3, {0x97, 0xAE, 0x14, 0xBE, 0x29, 0x86, 0xBB, 0x36}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithcancelevent ]]
IObjectWithCancelEvent :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectWithCancelEvent_Vtbl,
}
IObjectWithCancelEvent_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCancelEvent: proc "system" (this: ^IObjectWithCancelEvent, phEvent: ^HANDLE) -> HRESULT,
}
IID_IObjectWithCancelEvent :: GUID{0xF279B885, 0x0AE9, 0x4B85, {0xAC, 0x06, 0xDD, 0xEC, 0xF9, 0x40, 0x89, 0x41}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithfolderenummode ]]
IObjectWithFolderEnumMode :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectWithFolderEnumMode_Vtbl,
}
IObjectWithFolderEnumMode_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetMode: proc "system" (this: ^IObjectWithFolderEnumMode, feMode: FOLDER_ENUM_MODE) -> HRESULT,
	GetMode: proc "system" (this: ^IObjectWithFolderEnumMode, pfeMode: ^FOLDER_ENUM_MODE) -> HRESULT,
}
IID_IObjectWithFolderEnumMode :: GUID{0x6A9D9026, 0x0E6E, 0x464C, {0xB0, 0x00, 0x42, 0xEC, 0xC0, 0x7D, 0xE6, 0x73}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithprogid ]]
IObjectWithProgID :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectWithProgID_Vtbl,
}
IObjectWithProgID_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetProgID: proc "system" (this: ^IObjectWithProgID, pszProgID: PWSTR) -> HRESULT,
	GetProgID: proc "system" (this: ^IObjectWithProgID, ppszProgID: ^PWSTR) -> HRESULT,
}
IID_IObjectWithProgID :: GUID{0x71E806FB, 0x8DEE, 0x46FC, {0xBF, 0x8C, 0x77, 0x48, 0xA8, 0xA1, 0xAE, 0x13}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iobjectwithselection ]]
IObjectWithSelection :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectWithSelection_Vtbl,
}
IObjectWithSelection_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetSelection: proc "system" (this: ^IObjectWithSelection, psia: ^IShellItemArray) -> HRESULT,
	GetSelection: proc "system" (this: ^IObjectWithSelection, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
}
IID_IObjectWithSelection :: GUID{0x1C9CD5BB, 0x98E9, 0x4491, {0xA6, 0x0F, 0x31, 0xAA, 0xCC, 0x72, 0xB8, 0x3C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iobjmgr ]]
IObjMgr :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjMgr_Vtbl,
}
IObjMgr_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Append: proc "system" (this: ^IObjMgr, punk: ^IUnknown) -> HRESULT,
	Remove: proc "system" (this: ^IObjMgr, punk: ^IUnknown) -> HRESULT,
}
IID_IObjMgr :: GUID{0x00BB2761, 0x6A77, 0x11D0, {0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iopencontrolpanel ]]
IOpenControlPanel :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOpenControlPanel_Vtbl,
}
IOpenControlPanel_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Open: proc "system" (this: ^IOpenControlPanel, pszName: PWSTR, pszPage: PWSTR, punkSite: ^IUnknown) -> HRESULT,
	GetPath: proc "system" (this: ^IOpenControlPanel, pszName: PWSTR, pszPath: PWSTR, cchPath: u32) -> HRESULT,
	GetCurrentView: proc "system" (this: ^IOpenControlPanel, pView: ^CPVIEW) -> HRESULT,
}
IID_IOpenControlPanel :: GUID{0xD11AD862, 0x66DE, 0x4DF4, {0xBF, 0x6C, 0x1F, 0x56, 0x21, 0x99, 0x6A, 0xF1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iopensearchsource ]]
IOpenSearchSource :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOpenSearchSource_Vtbl,
}
IOpenSearchSource_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetResults: proc "system" (
		this: ^IOpenSearchSource,
		hwnd: HWND,
		pszQuery: PWSTR,
		dwStartIndex: u32,
		dwCount: u32,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
}
IID_IOpenSearchSource :: GUID{0xF0EE7333, 0xE6FC, 0x479B, {0x9F, 0x25, 0xA8, 0x60, 0xC2, 0x34, 0xA3, 0x8E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ioperationsprogressdialog ]]
IOperationsProgressDialog :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOperationsProgressDialog_Vtbl,
}
IOperationsProgressDialog_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	StartProgressDialog: proc "system" (this: ^IOperationsProgressDialog, hwndOwner: HWND, flags: u32) -> HRESULT,
	StopProgressDialog: proc "system" (this: ^IOperationsProgressDialog) -> HRESULT,
	SetOperation: proc "system" (this: ^IOperationsProgressDialog, action: SPACTION) -> HRESULT,
	SetMode: proc "system" (this: ^IOperationsProgressDialog, mode: u32) -> HRESULT,
	UpdateProgress: proc "system" (
		this: ^IOperationsProgressDialog,
		ullPointsCurrent: u64,
		ullPointsTotal: u64,
		ullSizeCurrent: u64,
		ullSizeTotal: u64,
		ullItemsCurrent: u64,
		ullItemsTotal: u64,
	) -> HRESULT,
	UpdateLocations: proc "system" (
		this: ^IOperationsProgressDialog,
		psiSource: ^IShellItem,
		psiTarget: ^IShellItem,
		psiItem: ^IShellItem,
	) -> HRESULT,
	ResetTimer: proc "system" (this: ^IOperationsProgressDialog) -> HRESULT,
	PauseTimer: proc "system" (this: ^IOperationsProgressDialog) -> HRESULT,
	ResumeTimer: proc "system" (this: ^IOperationsProgressDialog) -> HRESULT,
	GetMilliseconds: proc "system" (this: ^IOperationsProgressDialog, pullElapsed: ^u64, pullRemaining: ^u64) -> HRESULT,
	GetOperationStatus: proc "system" (this: ^IOperationsProgressDialog, popstatus: ^PDOPSTATUS) -> HRESULT,
}
IID_IOperationsProgressDialog :: GUID{0x0C9FB851, 0xE5C9, 0x43EB, {0xA3, 0x70, 0xF0, 0x67, 0x7B, 0x13, 0x87, 0x4C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipackagedebugsettings ]]
IPackageDebugSettings :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPackageDebugSettings_Vtbl,
}
IPackageDebugSettings_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnableDebugging: proc "system" (
		this: ^IPackageDebugSettings,
		packageFullName: PWSTR,
		debuggerCommandLine: PWSTR,
		environment: PWSTR,
	) -> HRESULT,
	DisableDebugging: proc "system" (this: ^IPackageDebugSettings, packageFullName: PWSTR) -> HRESULT,
	Suspend: proc "system" (this: ^IPackageDebugSettings, packageFullName: PWSTR) -> HRESULT,
	Resume: proc "system" (this: ^IPackageDebugSettings, packageFullName: PWSTR) -> HRESULT,
	TerminateAllProcesses: proc "system" (this: ^IPackageDebugSettings, packageFullName: PWSTR) -> HRESULT,
	SetTargetSessionId: proc "system" (this: ^IPackageDebugSettings, sessionId: u32) -> HRESULT,
	EnumerateBackgroundTasks: proc "system" (
		this: ^IPackageDebugSettings,
		packageFullName: PWSTR,
		taskCount: ^u32,
		taskIds: ^GUID,
		#by_ptr taskNames: PWSTR,
	) -> HRESULT,
	ActivateBackgroundTask: proc "system" (this: ^IPackageDebugSettings, #by_ptr taskId: GUID) -> HRESULT,
	StartServicing: proc "system" (this: ^IPackageDebugSettings, packageFullName: PWSTR) -> HRESULT,
	StopServicing: proc "system" (this: ^IPackageDebugSettings, packageFullName: PWSTR) -> HRESULT,
	StartSessionRedirection: proc "system" (this: ^IPackageDebugSettings, packageFullName: PWSTR, sessionId: u32) -> HRESULT,
	StopSessionRedirection: proc "system" (this: ^IPackageDebugSettings, packageFullName: PWSTR) -> HRESULT,
	GetPackageExecutionState: proc "system" (
		this: ^IPackageDebugSettings,
		packageFullName: PWSTR,
		packageExecutionState: ^PACKAGE_EXECUTION_STATE,
	) -> HRESULT,
	RegisterForPackageStateChanges: proc "system" (
		this: ^IPackageDebugSettings,
		packageFullName: PWSTR,
		pPackageExecutionStateChangeNotification: ^IPackageExecutionStateChangeNotification,
		pdwCookie: ^u32,
	) -> HRESULT,
	UnregisterForPackageStateChanges: proc "system" (this: ^IPackageDebugSettings, dwCookie: u32) -> HRESULT,
}
IID_IPackageDebugSettings :: GUID{0xF27C3930, 0x8029, 0x4AD1, {0x94, 0xE3, 0x3D, 0xBA, 0x41, 0x78, 0x10, 0xC1}}

IPackageDebugSettings2 :: struct #raw_union {
	#subtype IPackageDebugSettings: IPackageDebugSettings,
	using Vtbl: ^IPackageDebugSettings2_Vtbl,
}
IPackageDebugSettings2_Vtbl :: struct {
	using IPackageDebugSettings_Vtbl: IPackageDebugSettings_Vtbl,
	EnumerateApps: proc "system" (
		this: ^IPackageDebugSettings2,
		packageFullName: PWSTR,
		appCount: ^u32,
		appUserModelIds: ^PWSTR,
		appDisplayNames: ^PWSTR,
	) -> HRESULT,
}
IID_IPackageDebugSettings2 :: GUID{0x6E3194BB, 0xAB82, 0x4D22, {0x93, 0xF5, 0xFA, 0xBD, 0xA4, 0x0E, 0x7B, 0x16}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipackageexecutionstatechangenotification ]]
IPackageExecutionStateChangeNotification :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPackageExecutionStateChangeNotification_Vtbl,
}
IPackageExecutionStateChangeNotification_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnStateChanged: proc "system" (
		this: ^IPackageExecutionStateChangeNotification,
		pszPackageFullName: PWSTR,
		pesNewState: PACKAGE_EXECUTION_STATE,
	) -> HRESULT,
}
IID_IPackageExecutionStateChangeNotification :: GUID{0x1BB12A62, 0x2AD8, 0x432B, {0x8C, 0xCF, 0x0C, 0x2C, 0x52, 0xAF, 0xCD, 0x5B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iparentanditem ]]
IParentAndItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IParentAndItem_Vtbl,
}
IParentAndItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetParentAndItem: proc "system" (
		this: ^IParentAndItem,
		pidlParent: ^ITEMIDLIST,
		psf: ^IShellFolder,
		pidlChild: ^ITEMIDLIST,
	) -> HRESULT,
	GetParentAndItem: proc "system" (
		this: ^IParentAndItem,
		ppidlParent: ^ITEMIDLIST,
		ppsf: ^^IShellFolder,
		ppidlChild: ^ITEMIDLIST,
	) -> HRESULT,
}
IID_IParentAndItem :: GUID{0xB3A4B685, 0xB685, 0x4805, {0x99, 0xD9, 0x5D, 0xEA, 0xD2, 0x87, 0x32, 0x36}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iparseandcreateitem ]]
IParseAndCreateItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IParseAndCreateItem_Vtbl,
}
IParseAndCreateItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetItem: proc "system" (this: ^IParseAndCreateItem, psi: ^IShellItem) -> HRESULT,
	GetItem: proc "system" (this: ^IParseAndCreateItem, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
}
IID_IParseAndCreateItem :: GUID{0x67EFED0E, 0xE827, 0x4408, {0xB4, 0x93, 0x78, 0xF3, 0x98, 0x2B, 0x68, 0x5C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipersistfolder ]]
IPersistFolder :: struct #raw_union {
	#subtype IPersist: IPersist,
	using Vtbl: ^IPersistFolder_Vtbl,
}
IPersistFolder_Vtbl :: struct {
	using IPersist_Vtbl: IPersist_Vtbl,
	Initialize: proc "system" (this: ^IPersistFolder, pidl: ^ITEMIDLIST) -> HRESULT,
}
IID_IPersistFolder :: GUID{0x000214EA, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipersistfolder2 ]]
IPersistFolder2 :: struct #raw_union {
	#subtype IPersistFolder: IPersistFolder,
	using Vtbl: ^IPersistFolder2_Vtbl,
}
IPersistFolder2_Vtbl :: struct {
	using IPersistFolder_Vtbl: IPersistFolder_Vtbl,
	GetCurFolder: proc "system" (this: ^IPersistFolder2, ppidl: ^ITEMIDLIST) -> HRESULT,
}
IID_IPersistFolder2 :: GUID{0x1AC3D9F0, 0x175C, 0x11D1, {0x95, 0xBE, 0x00, 0x60, 0x97, 0x97, 0xEA, 0x4F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipersistfolder3 ]]
IPersistFolder3 :: struct #raw_union {
	#subtype IPersistFolder2: IPersistFolder2,
	using Vtbl: ^IPersistFolder3_Vtbl,
}
IPersistFolder3_Vtbl :: struct {
	using IPersistFolder2_Vtbl: IPersistFolder2_Vtbl,
	InitializeEx: proc "system" (
		this: ^IPersistFolder3,
		pbc: ^IBindCtx,
		pidlRoot: ^ITEMIDLIST,
		#by_ptr ppfti: PERSIST_FOLDER_TARGET_INFO,
	) -> HRESULT,
	GetFolderTargetInfo: proc "system" (this: ^IPersistFolder3, ppfti: ^PERSIST_FOLDER_TARGET_INFO) -> HRESULT,
}
IID_IPersistFolder3 :: GUID{0xCEF04FDF, 0xFE72, 0x11D2, {0x87, 0xA5, 0x00, 0xC0, 0x4F, 0x68, 0x37, 0xCF}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipersistidlist ]]
IPersistIDList :: struct #raw_union {
	#subtype IPersist: IPersist,
	using Vtbl: ^IPersistIDList_Vtbl,
}
IPersistIDList_Vtbl :: struct {
	using IPersist_Vtbl: IPersist_Vtbl,
	SetIDList: proc "system" (this: ^IPersistIDList, pidl: ^ITEMIDLIST) -> HRESULT,
	GetIDList: proc "system" (this: ^IPersistIDList, ppidl: ^ITEMIDLIST) -> HRESULT,
}
IID_IPersistIDList :: GUID{0x1079ACFC, 0x29BD, 0x11D3, {0x8E, 0x0D, 0x00, 0xC0, 0x4F, 0x68, 0x37, 0xD5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipreviewhandler ]]
IPreviewHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPreviewHandler_Vtbl,
}
IPreviewHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetWindow: proc "system" (this: ^IPreviewHandler, hwnd: HWND, #by_ptr prc: RECT) -> HRESULT,
	SetRect: proc "system" (this: ^IPreviewHandler, #by_ptr prc: RECT) -> HRESULT,
	DoPreview: proc "system" (this: ^IPreviewHandler) -> HRESULT,
	Unload: proc "system" (this: ^IPreviewHandler) -> HRESULT,
	SetFocus: proc "system" (this: ^IPreviewHandler) -> HRESULT,
	QueryFocus: proc "system" (this: ^IPreviewHandler, phwnd: ^HWND) -> HRESULT,
	TranslateAccelerator: proc "system" (this: ^IPreviewHandler, pmsg: ^MSG) -> HRESULT,
}
IID_IPreviewHandler :: GUID{0x8895B1C6, 0xB41F, 0x4C1C, {0xA5, 0x62, 0x0D, 0x56, 0x42, 0x50, 0x83, 0x6F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipreviewhandlerframe ]]
IPreviewHandlerFrame :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPreviewHandlerFrame_Vtbl,
}
IPreviewHandlerFrame_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetWindowContext: proc "system" (this: ^IPreviewHandlerFrame, pinfo: ^PREVIEWHANDLERFRAMEINFO) -> HRESULT,
	TranslateAccelerator: proc "system" (this: ^IPreviewHandlerFrame, pmsg: ^MSG) -> HRESULT,
}
IID_IPreviewHandlerFrame :: GUID{0xFEC87AAF, 0x35F9, 0x447A, {0xAD, 0xB7, 0x20, 0x23, 0x44, 0x91, 0x40, 0x1A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipreviewhandlervisuals ]]
IPreviewHandlerVisuals :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPreviewHandlerVisuals_Vtbl,
}
IPreviewHandlerVisuals_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetBackgroundColor: proc "system" (this: ^IPreviewHandlerVisuals, color: COLORREF) -> HRESULT,
	SetFont: proc "system" (this: ^IPreviewHandlerVisuals, #by_ptr plf: LOGFONTW) -> HRESULT,
	SetTextColor: proc "system" (this: ^IPreviewHandlerVisuals, color: COLORREF) -> HRESULT,
}
IID_IPreviewHandlerVisuals :: GUID{0x196BF9A5, 0xB346, 0x4EF0, {0xAA, 0x1E, 0x5D, 0xCD, 0xB7, 0x67, 0x68, 0xB1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ipreviewitem ]]
IPreviewItem :: struct #raw_union {
	#subtype IRelatedItem: IRelatedItem,
	using Vtbl: ^IPreviewItem_Vtbl,
}
IPreviewItem_Vtbl :: struct {
	using IRelatedItem_Vtbl: IRelatedItem_Vtbl,
}
IID_IPreviewItem :: GUID{0x36149969, 0x0A8F, 0x49C8, {0x8B, 0x00, 0x4A, 0xEC, 0xB2, 0x02, 0x22, 0xFB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ipreviousversionsinfo ]]
IPreviousVersionsInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPreviousVersionsInfo_Vtbl,
}
IPreviousVersionsInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AreSnapshotsAvailable: proc "system" (
		this: ^IPreviousVersionsInfo,
		pszPath: PWSTR,
		fOkToBeSlow: BOOL,
		pfAvailable: ^BOOL,
	) -> HRESULT,
}
IID_IPreviousVersionsInfo :: GUID{0x76E54780, 0xAD74, 0x48E3, {0xA6, 0x95, 0x3B, 0xA9, 0xA0, 0xAF, 0xF1, 0x0D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iprofferservice ]]
IProfferService :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IProfferService_Vtbl,
}
IProfferService_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ProfferService: proc "system" (
		this: ^IProfferService,
		#by_ptr serviceId: GUID,
		serviceProvider: ^IServiceProvider,
		cookie: ^u32,
	) -> HRESULT,
	RevokeService: proc "system" (this: ^IProfferService, cookie: u32) -> HRESULT,
}
IID_IProfferService :: GUID{0xCB728B20, 0xF786, 0x11CE, {0x92, 0xAD, 0x00, 0xAA, 0x00, 0xA7, 0x4C, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iprogressdialog ]]
IProgressDialog :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IProgressDialog_Vtbl,
}
IProgressDialog_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	StartProgressDialog: proc "system" (
		this: ^IProgressDialog,
		hwndParent: HWND,
		punkEnableModless: ^IUnknown,
		dwFlags: u32,
		pvResevered: rawptr,
	) -> HRESULT,
	StopProgressDialog: proc "system" (this: ^IProgressDialog) -> HRESULT,
	SetTitle: proc "system" (this: ^IProgressDialog, pwzTitle: PWSTR) -> HRESULT,
	SetAnimation: proc "system" (this: ^IProgressDialog, hInstAnimation: HINSTANCE, idAnimation: u32) -> HRESULT,
	HasUserCancelled: proc "system" (this: ^IProgressDialog) -> BOOL,
	SetProgress: proc "system" (this: ^IProgressDialog, dwCompleted: u32, dwTotal: u32) -> HRESULT,
	SetProgress64: proc "system" (this: ^IProgressDialog, ullCompleted: u64, ullTotal: u64) -> HRESULT,
	SetLine: proc "system" (
		this: ^IProgressDialog,
		dwLineNum: u32,
		pwzString: PWSTR,
		fCompactPath: BOOL,
		pvResevered: rawptr,
	) -> HRESULT,
	SetCancelMsg: proc "system" (this: ^IProgressDialog, pwzCancelMsg: PWSTR, pvResevered: rawptr) -> HRESULT,
	Timer: proc "system" (this: ^IProgressDialog, dwTimerAction: u32, pvResevered: rawptr) -> HRESULT,
}
IID_IProgressDialog :: GUID{0xEBBC7C04, 0x315E, 0x11D2, {0xB6, 0x2F, 0x00, 0x60, 0x97, 0xDF, 0x5B, 0xD4}}

IPropertyKeyStore :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPropertyKeyStore_Vtbl,
}
IPropertyKeyStore_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetKeyCount: proc "system" (this: ^IPropertyKeyStore, keyCount: ^i32) -> HRESULT,
	GetKeyAt: proc "system" (this: ^IPropertyKeyStore, index: i32, pkey: ^PROPERTYKEY) -> HRESULT,
	AppendKey: proc "system" (this: ^IPropertyKeyStore, #by_ptr key: PROPERTYKEY) -> HRESULT,
	DeleteKey: proc "system" (this: ^IPropertyKeyStore, index: i32) -> HRESULT,
	IsKeyInStore: proc "system" (this: ^IPropertyKeyStore, #by_ptr key: PROPERTYKEY) -> HRESULT,
	RemoveKey: proc "system" (this: ^IPropertyKeyStore, #by_ptr key: PROPERTYKEY) -> HRESULT,
}
IID_IPropertyKeyStore :: GUID{0x75BD59AA, 0xF23B, 0x4963, {0xAB, 0xA4, 0x0B, 0x35, 0x57, 0x52, 0xA9, 0x1B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/nn-shappmgr-ipublishedapp ]]
IPublishedApp :: struct #raw_union {
	#subtype IShellApp: IShellApp,
	using Vtbl: ^IPublishedApp_Vtbl,
}
IPublishedApp_Vtbl :: struct {
	using IShellApp_Vtbl: IShellApp_Vtbl,
	Install: proc "system" (this: ^IPublishedApp, pstInstall: ^SYSTEMTIME) -> HRESULT,
	GetPublishedAppInfo: proc "system" (this: ^IPublishedApp, ppai: ^PUBAPPINFO) -> HRESULT,
	Unschedule: proc "system" (this: ^IPublishedApp) -> HRESULT,
}
IID_IPublishedApp :: GUID{0x1BC752E0, 0x9046, 0x11D1, {0xB8, 0xB3, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/nn-shappmgr-ipublishedapp2 ]]
IPublishedApp2 :: struct #raw_union {
	#subtype IPublishedApp: IPublishedApp,
	using Vtbl: ^IPublishedApp2_Vtbl,
}
IPublishedApp2_Vtbl :: struct {
	using IPublishedApp_Vtbl: IPublishedApp_Vtbl,
	Install2: proc "system" (this: ^IPublishedApp2, pstInstall: ^SYSTEMTIME, hwndParent: HWND) -> HRESULT,
}
IID_IPublishedApp2 :: GUID{0x12B81347, 0x1B3A, 0x4A04, {0xAA, 0x61, 0x3F, 0x76, 0x8B, 0x67, 0xFD, 0x7E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/nn-shlwapi-iqueryassociations ]]
IQueryAssociations :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IQueryAssociations_Vtbl,
}
IQueryAssociations_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Init: proc "system" (
		this: ^IQueryAssociations,
		flags: ASSOCF,
		pszAssoc: PWSTR,
		hkProgid: HKEY,
		hwnd: HWND,
	) -> HRESULT,
	GetString: proc "system" (
		this: ^IQueryAssociations,
		flags: ASSOCF,
		str: ASSOCSTR,
		pszExtra: PWSTR,
		pszOut: PWSTR,
		pcchOut: ^u32,
	) -> HRESULT,
	GetKey: proc "system" (
		this: ^IQueryAssociations,
		flags: ASSOCF,
		key: ASSOCKEY,
		pszExtra: PWSTR,
		phkeyOut: ^HKEY,
	) -> HRESULT,
	GetData: proc "system" (
		this: ^IQueryAssociations,
		flags: ASSOCF,
		data: ASSOCDATA,
		pszExtra: PWSTR,
		pvOut: rawptr,
		pcbOut: ^u32,
	) -> HRESULT,
	GetEnum: proc "system" (
		this: ^IQueryAssociations,
		flags: ASSOCF,
		assocenum: ASSOCENUM,
		pszExtra: PWSTR,
		#by_ptr riid: GUID,
		ppvOut: rawptr,
	) -> HRESULT,
}
IID_IQueryAssociations :: GUID{0xC46CA590, 0x3C3F, 0x11D2, {0xBE, 0xE6, 0x00, 0x00, 0xF8, 0x05, 0xCA, 0x57}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iquerycancelautoplay ]]
IQueryCancelAutoPlay :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IQueryCancelAutoPlay_Vtbl,
}
IQueryCancelAutoPlay_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AllowAutoPlay: proc "system" (
		this: ^IQueryCancelAutoPlay,
		pszPath: PWSTR,
		dwContentType: u32,
		pszLabel: PWSTR,
		dwSerialNumber: u32,
	) -> HRESULT,
}
IID_IQueryCancelAutoPlay :: GUID{0xDDEFE873, 0x6997, 0x4E68, {0xBE, 0x26, 0x39, 0xB6, 0x33, 0xAD, 0xBE, 0x12}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iquerycodepage ]]
IQueryCodePage :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IQueryCodePage_Vtbl,
}
IQueryCodePage_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCodePage: proc "system" (this: ^IQueryCodePage, puiCodePage: ^u32) -> HRESULT,
	SetCodePage: proc "system" (this: ^IQueryCodePage, uiCodePage: u32) -> HRESULT,
}
IID_IQueryCodePage :: GUID{0xC7B236CE, 0xEE80, 0x11D0, {0x98, 0x5F, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iquerycontinue ]]
IQueryContinue :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IQueryContinue_Vtbl,
}
IQueryContinue_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryContinue: proc "system" (this: ^IQueryContinue) -> HRESULT,
}
IID_IQueryContinue :: GUID{0x7307055C, 0xB24A, 0x486B, {0x9F, 0x25, 0x16, 0x3E, 0x59, 0x7A, 0x28, 0xA9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/credentialprovider/nn-credentialprovider-iquerycontinuewithstatus ]]
IQueryContinueWithStatus :: struct #raw_union {
	#subtype IQueryContinue: IQueryContinue,
	using Vtbl: ^IQueryContinueWithStatus_Vtbl,
}
IQueryContinueWithStatus_Vtbl :: struct {
	using IQueryContinue_Vtbl: IQueryContinue_Vtbl,
	SetStatusMessage: proc "system" (this: ^IQueryContinueWithStatus, psz: PWSTR) -> HRESULT,
}
IID_IQueryContinueWithStatus :: GUID{0x9090BE5B, 0x502B, 0x41FB, {0xBC, 0xCC, 0x00, 0x49, 0xA6, 0xC7, 0x25, 0x4B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iqueryinfo ]]
IQueryInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IQueryInfo_Vtbl,
}
IQueryInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetInfoTip: proc "system" (this: ^IQueryInfo, dwFlags: QITIPF_FLAGS, ppwszTip: ^PWSTR) -> HRESULT,
	GetInfoFlags: proc "system" (this: ^IQueryInfo, pdwFlags: ^u32) -> HRESULT,
}
IID_IQueryInfo :: GUID{0x00021500, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iregtreeitem ]]
IRegTreeItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRegTreeItem_Vtbl,
}
IRegTreeItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCheckState: proc "system" (this: ^IRegTreeItem, pbCheck: ^BOOL) -> HRESULT,
	SetCheckState: proc "system" (this: ^IRegTreeItem, bCheck: BOOL) -> HRESULT,
}
IID_IRegTreeItem :: GUID{0xA9521922, 0x0812, 0x4D44, {0x9E, 0xC3, 0x7F, 0xD3, 0x8C, 0x72, 0x6F, 0x3D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-irelateditem ]]
IRelatedItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRelatedItem_Vtbl,
}
IRelatedItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetItemIDList: proc "system" (this: ^IRelatedItem, ppidl: ^ITEMIDLIST) -> HRESULT,
	GetItem: proc "system" (this: ^IRelatedItem, ppsi: ^^IShellItem) -> HRESULT,
}
IID_IRelatedItem :: GUID{0xA73CE67A, 0x8AB1, 0x44F1, {0x8D, 0x43, 0xD2, 0xFC, 0xBF, 0x6B, 0x1C, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iremotecomputer ]]
IRemoteComputer :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRemoteComputer_Vtbl,
}
IRemoteComputer_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (this: ^IRemoteComputer, pszMachine: PWSTR, bEnumerating: BOOL) -> HRESULT,
}
IID_IRemoteComputer :: GUID{0x000214FE, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iresolveshelllink ]]
IResolveShellLink :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IResolveShellLink_Vtbl,
}
IResolveShellLink_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ResolveShellLink: proc "system" (this: ^IResolveShellLink, punkLink: ^IUnknown, hwnd: HWND, fFlags: u32) -> HRESULT,
}
IID_IResolveShellLink :: GUID{0x5CD52983, 0x9449, 0x11D2, {0x96, 0x3A, 0x00, 0xC0, 0x4F, 0x79, 0xAD, 0xF0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iresultsfolder ]]
IResultsFolder :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IResultsFolder_Vtbl,
}
IResultsFolder_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AddItem: proc "system" (this: ^IResultsFolder, psi: ^IShellItem) -> HRESULT,
	AddIDList: proc "system" (this: ^IResultsFolder, pidl: ^ITEMIDLIST, ppidlAdded: ^ITEMIDLIST) -> HRESULT,
	RemoveItem: proc "system" (this: ^IResultsFolder, psi: ^IShellItem) -> HRESULT,
	RemoveIDList: proc "system" (this: ^IResultsFolder, pidl: ^ITEMIDLIST) -> HRESULT,
	RemoveAll: proc "system" (this: ^IResultsFolder) -> HRESULT,
}
IID_IResultsFolder :: GUID{0x96E5AE6D, 0x6AE1, 0x4B1C, {0x90, 0x0C, 0xC6, 0x48, 0x0E, 0xAA, 0x88, 0x28}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-irunnabletask ]]
IRunnableTask :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRunnableTask_Vtbl,
}
IRunnableTask_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Run: proc "system" (this: ^IRunnableTask) -> HRESULT,
	Kill: proc "system" (this: ^IRunnableTask, bWait: BOOL) -> HRESULT,
	Suspend: proc "system" (this: ^IRunnableTask) -> HRESULT,
	Resume: proc "system" (this: ^IRunnableTask) -> HRESULT,
	IsRunning: proc "system" (this: ^IRunnableTask) -> u32,
}
IID_IRunnableTask :: GUID{0x85788D00, 0x6807, 0x11D0, {0xB8, 0x10, 0x00, 0xC0, 0x4F, 0xD7, 0x06, 0xEC}}

IScriptErrorList :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IScriptErrorList_Vtbl,
}
IScriptErrorList_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	advanceError: proc "system" (this: ^IScriptErrorList) -> HRESULT,
	retreatError: proc "system" (this: ^IScriptErrorList) -> HRESULT,
	canAdvanceError: proc "system" (this: ^IScriptErrorList, pfCanAdvance: ^BOOL) -> HRESULT,
	canRetreatError: proc "system" (this: ^IScriptErrorList, pfCanRetreat: ^BOOL) -> HRESULT,
	getErrorLine: proc "system" (this: ^IScriptErrorList, plLine: ^i32) -> HRESULT,
	getErrorChar: proc "system" (this: ^IScriptErrorList, plChar: ^i32) -> HRESULT,
	getErrorCode: proc "system" (this: ^IScriptErrorList, plCode: ^i32) -> HRESULT,
	getErrorMsg: proc "system" (this: ^IScriptErrorList, pstr: ^BSTR) -> HRESULT,
	getErrorUrl: proc "system" (this: ^IScriptErrorList, pstr: ^BSTR) -> HRESULT,
	getAlwaysShowLockState: proc "system" (this: ^IScriptErrorList, pfAlwaysShowLocked: ^BOOL) -> HRESULT,
	getDetailsPaneOpen: proc "system" (this: ^IScriptErrorList, pfDetailsPaneOpen: ^BOOL) -> HRESULT,
	setDetailsPaneOpen: proc "system" (this: ^IScriptErrorList, fDetailsPaneOpen: BOOL) -> HRESULT,
	getPerErrorDisplay: proc "system" (this: ^IScriptErrorList, pfPerErrorDisplay: ^BOOL) -> HRESULT,
	setPerErrorDisplay: proc "system" (this: ^IScriptErrorList, fPerErrorDisplay: BOOL) -> HRESULT,
}
IID_IScriptErrorList :: GUID{0xF3470F24, 0x15FD, 0x11D2, {0xBB, 0x2E, 0x00, 0x80, 0x5F, 0xF7, 0xEF, 0xCA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-isearchboxinfo ]]
ISearchBoxInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISearchBoxInfo_Vtbl,
}
ISearchBoxInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCondition: proc "system" (this: ^ISearchBoxInfo, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetText: proc "system" (this: ^ISearchBoxInfo, ppsz: ^PWSTR) -> HRESULT,
}
IID_ISearchBoxInfo :: GUID{0x6AF6E03F, 0xD664, 0x4EF4, {0x96, 0x26, 0xF7, 0xE0, 0xED, 0x36, 0x75, 0x5E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-isearchcontext ]]
ISearchContext :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISearchContext_Vtbl,
}
ISearchContext_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetSearchUrl: proc "system" (this: ^ISearchContext, pbstrSearchUrl: ^BSTR) -> HRESULT,
	GetSearchText: proc "system" (this: ^ISearchContext, pbstrSearchText: ^BSTR) -> HRESULT,
	GetSearchStyle: proc "system" (this: ^ISearchContext, pdwSearchStyle: ^u32) -> HRESULT,
}
IID_ISearchContext :: GUID{0x09F656A2, 0x41AF, 0x480C, {0x88, 0xF7, 0x16, 0xCC, 0x0D, 0x16, 0x46, 0x15}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-isearchfolderitemfactory ]]
ISearchFolderItemFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISearchFolderItemFactory_Vtbl,
}
ISearchFolderItemFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetDisplayName: proc "system" (this: ^ISearchFolderItemFactory, pszDisplayName: PWSTR) -> HRESULT,
	SetFolderTypeID: proc "system" (this: ^ISearchFolderItemFactory, ftid: GUID) -> HRESULT,
	SetFolderLogicalViewMode: proc "system" (this: ^ISearchFolderItemFactory, flvm: FOLDERLOGICALVIEWMODE) -> HRESULT,
	SetIconSize: proc "system" (this: ^ISearchFolderItemFactory, iIconSize: i32) -> HRESULT,
	SetVisibleColumns: proc "system" (
		this: ^ISearchFolderItemFactory,
		cVisibleColumns: u32,
		rgKey: [^]PROPERTYKEY,
	) -> HRESULT,
	SetSortColumns: proc "system" (
		this: ^ISearchFolderItemFactory,
		cSortColumns: u32,
		rgSortColumns: [^]SORTCOLUMN,
	) -> HRESULT,
	SetGroupColumn: proc "system" (this: ^ISearchFolderItemFactory, #by_ptr keyGroup: PROPERTYKEY) -> HRESULT,
	SetStacks: proc "system" (
		this: ^ISearchFolderItemFactory,
		cStackKeys: u32,
		rgStackKeys: [^]PROPERTYKEY,
	) -> HRESULT,
	SetScope: proc "system" (this: ^ISearchFolderItemFactory, psiaScope: ^IShellItemArray) -> HRESULT,
	SetCondition: proc "system" (this: ^ISearchFolderItemFactory, pCondition: ^ICondition) -> HRESULT,
	GetShellItem: proc "system" (this: ^ISearchFolderItemFactory, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetIDList: proc "system" (this: ^ISearchFolderItemFactory, ppidl: ^ITEMIDLIST) -> HRESULT,
}
IID_ISearchFolderItemFactory :: GUID{0xA0FFBC28, 0x5482, 0x4366, {0xBE, 0x27, 0x3E, 0x81, 0xE7, 0x8E, 0x06, 0xC2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-isharedbitmap ]]
ISharedBitmap :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISharedBitmap_Vtbl,
}
ISharedBitmap_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetSharedBitmap: proc "system" (this: ^ISharedBitmap, phbm: ^HBITMAP) -> HRESULT,
	GetSize: proc "system" (this: ^ISharedBitmap, pSize: ^SIZE) -> HRESULT,
	GetFormat: proc "system" (this: ^ISharedBitmap, pat: ^WTS_ALPHATYPE) -> HRESULT,
	InitializeBitmap: proc "system" (this: ^ISharedBitmap, hbm: HBITMAP, wtsAT: WTS_ALPHATYPE) -> HRESULT,
	Detach: proc "system" (this: ^ISharedBitmap, phbm: ^HBITMAP) -> HRESULT,
}
IID_ISharedBitmap :: GUID{0x091162A4, 0xBC96, 0x411F, {0xAA, 0xE8, 0xC5, 0x12, 0x2C, 0xD0, 0x33, 0x63}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-isharingconfigurationmanager ]]
ISharingConfigurationManager :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISharingConfigurationManager_Vtbl,
}
ISharingConfigurationManager_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateShare: proc "system" (this: ^ISharingConfigurationManager, dsid: DEF_SHARE_ID, role: SHARE_ROLE) -> HRESULT,
	DeleteShare: proc "system" (this: ^ISharingConfigurationManager, dsid: DEF_SHARE_ID) -> HRESULT,
	ShareExists: proc "system" (this: ^ISharingConfigurationManager, dsid: DEF_SHARE_ID) -> HRESULT,
	GetSharePermissions: proc "system" (
		this: ^ISharingConfigurationManager,
		dsid: DEF_SHARE_ID,
		pRole: ^SHARE_ROLE,
	) -> HRESULT,
	SharePrinters: proc "system" (this: ^ISharingConfigurationManager) -> HRESULT,
	StopSharingPrinters: proc "system" (this: ^ISharingConfigurationManager) -> HRESULT,
	ArePrintersShared: proc "system" (this: ^ISharingConfigurationManager) -> HRESULT,
}
IID_ISharingConfigurationManager :: GUID{0xB4CD448A, 0x9C86, 0x4466, {0x92, 0x01, 0x2E, 0x62, 0x10, 0x5B, 0x87, 0xAE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/nn-shappmgr-ishellapp ]]
IShellApp :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellApp_Vtbl,
}
IShellApp_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetAppInfo: proc "system" (this: ^IShellApp, pai: ^APPINFODATA) -> HRESULT,
	GetPossibleActions: proc "system" (this: ^IShellApp, pdwActions: ^u32) -> HRESULT,
	GetSlowAppInfo: proc "system" (this: ^IShellApp, psaid: ^SLOWAPPINFO) -> HRESULT,
	GetCachedSlowAppInfo: proc "system" (this: ^IShellApp, psaid: ^SLOWAPPINFO) -> HRESULT,
	IsInstalled: proc "system" (this: ^IShellApp) -> HRESULT,
}
IID_IShellApp :: GUID{0xA3E14960, 0x935F, 0x11D1, {0xB8, 0xB8, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellbrowser ]]
IShellBrowser :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IShellBrowser_Vtbl,
}
IShellBrowser_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	InsertMenusSB: proc "system" (
		this: ^IShellBrowser,
		hmenuShared: HMENU,
		lpMenuWidths: ^OLEMENUGROUPWIDTHS,
	) -> HRESULT,
	SetMenuSB: proc "system" (
		this: ^IShellBrowser,
		hmenuShared: HMENU,
		holemenuRes: int,
		hwndActiveObject: HWND,
	) -> HRESULT,
	RemoveMenusSB: proc "system" (this: ^IShellBrowser, hmenuShared: HMENU) -> HRESULT,
	SetStatusTextSB: proc "system" (this: ^IShellBrowser, pszStatusText: PWSTR) -> HRESULT,
	EnableModelessSB: proc "system" (this: ^IShellBrowser, fEnable: BOOL) -> HRESULT,
	TranslateAcceleratorSB: proc "system" (this: ^IShellBrowser, pmsg: ^MSG, wID: u16) -> HRESULT,
	BrowseObject: proc "system" (this: ^IShellBrowser, pidl: ^ITEMIDLIST, wFlags: u32) -> HRESULT,
	GetViewStateStream: proc "system" (this: ^IShellBrowser, grfMode: u32, ppStrm: ^^IStream) -> HRESULT,
	GetControlWindow: proc "system" (this: ^IShellBrowser, id: u32, phwnd: ^HWND) -> HRESULT,
	SendControlMsg: proc "system" (
		this: ^IShellBrowser,
		id: u32,
		uMsg: u32,
		wParam: WPARAM,
		lParam: LPARAM,
		pret: ^LRESULT,
	) -> HRESULT,
	QueryActiveShellView: proc "system" (this: ^IShellBrowser, ppshv: ^^IShellView) -> HRESULT,
	OnViewWindowActive: proc "system" (this: ^IShellBrowser, pshv: ^IShellView) -> HRESULT,
	SetToolbarItems: proc "system" (this: ^IShellBrowser, lpButtons: [^]TBBUTTON, nButtons: u32, uFlags: u32) -> HRESULT,
}
IID_IShellBrowser :: GUID{0x000214E2, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishellchangenotify ]]
IShellChangeNotify :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellChangeNotify_Vtbl,
}
IShellChangeNotify_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnChange: proc "system" (this: ^IShellChangeNotify, lEvent: i32, pidl1: ^ITEMIDLIST, pidl2: ^ITEMIDLIST) -> HRESULT,
}
IID_IShellChangeNotify :: GUID{0xD82BE2B1, 0x5764, 0x11D0, {0xA9, 0x6E, 0x00, 0xC0, 0x4F, 0xD7, 0x05, 0xA2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishelldetails ]]
IShellDetails :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellDetails_Vtbl,
}
IShellDetails_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetDetailsOf: proc "system" (this: ^IShellDetails, pidl: ^ITEMIDLIST, iColumn: u32, pDetails: ^SHELLDETAILS) -> HRESULT,
	ColumnClick: proc "system" (this: ^IShellDetails, iColumn: u32) -> HRESULT,
}
IID_IShellDetails :: GUID{0x000214EC, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ishelldispatch ]]
IShellDispatch :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IShellDispatch_Vtbl,
}
IShellDispatch_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Application: proc "system" (this: ^IShellDispatch, ppid: ^^IDispatch) -> HRESULT,
	get_Parent: proc "system" (this: ^IShellDispatch, ppid: ^^IDispatch) -> HRESULT,
	NameSpace: proc "system" (this: ^IShellDispatch, vDir: VARIANT, ppsdf: ^^Folder) -> HRESULT,
	BrowseForFolder: proc "system" (
		this: ^IShellDispatch,
		Hwnd: i32,
		Title: BSTR,
		Options: i32,
		RootFolder: VARIANT,
		ppsdf: ^^Folder,
	) -> HRESULT,
	Windows: proc "system" (this: ^IShellDispatch, ppid: ^^IDispatch) -> HRESULT,
	Open: proc "system" (this: ^IShellDispatch, vDir: VARIANT) -> HRESULT,
	Explore: proc "system" (this: ^IShellDispatch, vDir: VARIANT) -> HRESULT,
	MinimizeAll: proc "system" (this: ^IShellDispatch) -> HRESULT,
	UndoMinimizeALL: proc "system" (this: ^IShellDispatch) -> HRESULT,
	FileRun: proc "system" (this: ^IShellDispatch) -> HRESULT,
	CascadeWindows: proc "system" (this: ^IShellDispatch) -> HRESULT,
	TileVertically: proc "system" (this: ^IShellDispatch) -> HRESULT,
	TileHorizontally: proc "system" (this: ^IShellDispatch) -> HRESULT,
	ShutdownWindows: proc "system" (this: ^IShellDispatch) -> HRESULT,
	Suspend: proc "system" (this: ^IShellDispatch) -> HRESULT,
	EjectPC: proc "system" (this: ^IShellDispatch) -> HRESULT,
	SetTime: proc "system" (this: ^IShellDispatch) -> HRESULT,
	TrayProperties: proc "system" (this: ^IShellDispatch) -> HRESULT,
	Help: proc "system" (this: ^IShellDispatch) -> HRESULT,
	FindFiles: proc "system" (this: ^IShellDispatch) -> HRESULT,
	FindComputer: proc "system" (this: ^IShellDispatch) -> HRESULT,
	RefreshMenu: proc "system" (this: ^IShellDispatch) -> HRESULT,
	ControlPanelItem: proc "system" (this: ^IShellDispatch, bstrDir: BSTR) -> HRESULT,
}
IID_IShellDispatch :: GUID{0xD8F015C0, 0xC278, 0x11CE, {0xA4, 0x9E, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ishelldispatch2-object ]]
IShellDispatch2 :: struct #raw_union {
	#subtype IShellDispatch: IShellDispatch,
	using Vtbl: ^IShellDispatch2_Vtbl,
}
IShellDispatch2_Vtbl :: struct {
	using IShellDispatch_Vtbl: IShellDispatch_Vtbl,
	IsRestricted: proc "system" (this: ^IShellDispatch2, Group: BSTR, Restriction: BSTR, plRestrictValue: ^i32) -> HRESULT,
	ShellExecute: proc "system" (
		this: ^IShellDispatch2,
		File: BSTR,
		vArgs: VARIANT,
		vDir: VARIANT,
		vOperation: VARIANT,
		vShow: VARIANT,
	) -> HRESULT,
	FindPrinter: proc "system" (this: ^IShellDispatch2, name: BSTR, location: BSTR, model: BSTR) -> HRESULT,
	GetSystemInformation: proc "system" (this: ^IShellDispatch2, name: BSTR, pv: ^VARIANT) -> HRESULT,
	ServiceStart: proc "system" (
		this: ^IShellDispatch2,
		ServiceName: BSTR,
		Persistent: VARIANT,
		pSuccess: ^VARIANT,
	) -> HRESULT,
	ServiceStop: proc "system" (
		this: ^IShellDispatch2,
		ServiceName: BSTR,
		Persistent: VARIANT,
		pSuccess: ^VARIANT,
	) -> HRESULT,
	IsServiceRunning: proc "system" (this: ^IShellDispatch2, ServiceName: BSTR, pRunning: ^VARIANT) -> HRESULT,
	CanStartStopService: proc "system" (this: ^IShellDispatch2, ServiceName: BSTR, pCanStartStop: ^VARIANT) -> HRESULT,
	ShowBrowserBar: proc "system" (this: ^IShellDispatch2, bstrClsid: BSTR, bShow: VARIANT, pSuccess: ^VARIANT) -> HRESULT,
}
IID_IShellDispatch2 :: GUID{0xA4C6892C, 0x3BA9, 0x11D2, {0x9D, 0xEA, 0x00, 0xC0, 0x4F, 0xB1, 0x61, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ishelldispatch3 ]]
IShellDispatch3 :: struct #raw_union {
	#subtype IShellDispatch2: IShellDispatch2,
	using Vtbl: ^IShellDispatch3_Vtbl,
}
IShellDispatch3_Vtbl :: struct {
	using IShellDispatch2_Vtbl: IShellDispatch2_Vtbl,
	AddToRecent: proc "system" (this: ^IShellDispatch3, varFile: VARIANT, bstrCategory: BSTR) -> HRESULT,
}
IID_IShellDispatch3 :: GUID{0x177160CA, 0xBB5A, 0x411C, {0x84, 0x1D, 0xBD, 0x38, 0xFA, 0xCD, 0xEA, 0xA0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ishelldispatch4 ]]
IShellDispatch4 :: struct #raw_union {
	#subtype IShellDispatch3: IShellDispatch3,
	using Vtbl: ^IShellDispatch4_Vtbl,
}
IShellDispatch4_Vtbl :: struct {
	using IShellDispatch3_Vtbl: IShellDispatch3_Vtbl,
	WindowsSecurity: proc "system" (this: ^IShellDispatch4) -> HRESULT,
	ToggleDesktop: proc "system" (this: ^IShellDispatch4) -> HRESULT,
	ExplorerPolicy: proc "system" (this: ^IShellDispatch4, bstrPolicyName: BSTR, pValue: ^VARIANT) -> HRESULT,
	GetSetting: proc "system" (this: ^IShellDispatch4, lSetting: i32, pResult: ^VARIANT_BOOL) -> HRESULT,
}
IID_IShellDispatch4 :: GUID{0xEFD84B2D, 0x4BCF, 0x4298, {0xBE, 0x25, 0xEB, 0x54, 0x2A, 0x59, 0xFB, 0xDA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ishelldispatch5 ]]
IShellDispatch5 :: struct #raw_union {
	#subtype IShellDispatch4: IShellDispatch4,
	using Vtbl: ^IShellDispatch5_Vtbl,
}
IShellDispatch5_Vtbl :: struct {
	using IShellDispatch4_Vtbl: IShellDispatch4_Vtbl,
	WindowSwitcher: proc "system" (this: ^IShellDispatch5) -> HRESULT,
}
IID_IShellDispatch5 :: GUID{0x866738B9, 0x6CF2, 0x4DE8, {0x87, 0x67, 0xF7, 0x94, 0xEB, 0xE7, 0x4F, 0x4E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ishelldispatch6 ]]
IShellDispatch6 :: struct #raw_union {
	#subtype IShellDispatch5: IShellDispatch5,
	using Vtbl: ^IShellDispatch6_Vtbl,
}
IShellDispatch6_Vtbl :: struct {
	using IShellDispatch5_Vtbl: IShellDispatch5_Vtbl,
	SearchCommand: proc "system" (this: ^IShellDispatch6) -> HRESULT,
}
IID_IShellDispatch6 :: GUID{0x286E6F1B, 0x7113, 0x4355, {0x95, 0x62, 0x96, 0xB7, 0xE9, 0xD6, 0x4C, 0x54}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellextinit ]]
IShellExtInit :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellExtInit_Vtbl,
}
IShellExtInit_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (
		this: ^IShellExtInit,
		pidlFolder: ^ITEMIDLIST,
		pdtobj: ^IDataObject,
		hkeyProgID: HKEY,
	) -> HRESULT,
}
IID_IShellExtInit :: GUID{0x000214E8, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

IShellFavoritesNameSpace :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IShellFavoritesNameSpace_Vtbl,
}
IShellFavoritesNameSpace_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	MoveSelectionUp: proc "system" (this: ^IShellFavoritesNameSpace) -> HRESULT,
	MoveSelectionDown: proc "system" (this: ^IShellFavoritesNameSpace) -> HRESULT,
	ResetSort: proc "system" (this: ^IShellFavoritesNameSpace) -> HRESULT,
	NewFolder: proc "system" (this: ^IShellFavoritesNameSpace) -> HRESULT,
	Synchronize: proc "system" (this: ^IShellFavoritesNameSpace) -> HRESULT,
	Import: proc "system" (this: ^IShellFavoritesNameSpace) -> HRESULT,
	Export: proc "system" (this: ^IShellFavoritesNameSpace) -> HRESULT,
	InvokeContextMenuCommand: proc "system" (this: ^IShellFavoritesNameSpace, strCommand: BSTR) -> HRESULT,
	MoveSelectionTo: proc "system" (this: ^IShellFavoritesNameSpace) -> HRESULT,
	get_SubscriptionsEnabled: proc "system" (this: ^IShellFavoritesNameSpace, pBool: ^VARIANT_BOOL) -> HRESULT,
	CreateSubscriptionForSelection: proc "system" (this: ^IShellFavoritesNameSpace, pBool: ^VARIANT_BOOL) -> HRESULT,
	DeleteSubscriptionForSelection: proc "system" (this: ^IShellFavoritesNameSpace, pBool: ^VARIANT_BOOL) -> HRESULT,
	SetRoot: proc "system" (this: ^IShellFavoritesNameSpace, bstrFullPath: BSTR) -> HRESULT,
}
IID_IShellFavoritesNameSpace :: GUID{0x55136804, 0xB2DE, 0x11D1, {0xB9, 0xF2, 0x00, 0xA0, 0xC9, 0x8B, 0xC5, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellfolder ]]
IShellFolder :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellFolder_Vtbl,
}
IShellFolder_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ParseDisplayName: proc "system" (
		this: ^IShellFolder,
		hwnd: HWND,
		pbc: ^IBindCtx,
		pszDisplayName: PWSTR,
		pchEaten: ^u32,
		ppidl: ^ITEMIDLIST,
		pdwAttributes: ^u32,
	) -> HRESULT,
	EnumObjects: proc "system" (this: ^IShellFolder, hwnd: HWND, grfFlags: u32, ppenumIDList: ^^IEnumIDList) -> HRESULT,
	BindToObject: proc "system" (
		this: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		pbc: ^IBindCtx,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	BindToStorage: proc "system" (
		this: ^IShellFolder,
		pidl: ^ITEMIDLIST,
		pbc: ^IBindCtx,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	CompareIDs: proc "system" (this: ^IShellFolder, lParam: LPARAM, pidl1: ^ITEMIDLIST, pidl2: ^ITEMIDLIST) -> HRESULT,
	CreateViewObject: proc "system" (this: ^IShellFolder, hwndOwner: HWND, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetAttributesOf: proc "system" (this: ^IShellFolder, cidl: u32, apidl: [^]ITEMIDLIST, rgfInOut: ^u32) -> HRESULT,
	GetUIObjectOf: proc "system" (
		this: ^IShellFolder,
		hwndOwner: HWND,
		cidl: u32,
		apidl: [^]ITEMIDLIST,
		#by_ptr riid: GUID,
		rgfReserved: ^u32,
		ppv: rawptr,
	) -> HRESULT,
	GetDisplayNameOf: proc "system" (this: ^IShellFolder, pidl: ^ITEMIDLIST, uFlags: SHGDNF, pName: ^STRRET) -> HRESULT,
	SetNameOf: proc "system" (
		this: ^IShellFolder,
		hwnd: HWND,
		pidl: ^ITEMIDLIST,
		pszName: PWSTR,
		uFlags: SHGDNF,
		ppidlOut: ^ITEMIDLIST,
	) -> HRESULT,
}
IID_IShellFolder :: GUID{0x000214E6, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellfolder2 ]]
IShellFolder2 :: struct #raw_union {
	#subtype IShellFolder: IShellFolder,
	using Vtbl: ^IShellFolder2_Vtbl,
}
IShellFolder2_Vtbl :: struct {
	using IShellFolder_Vtbl: IShellFolder_Vtbl,
	GetDefaultSearchGUID: proc "system" (this: ^IShellFolder2, pguid: ^GUID) -> HRESULT,
	EnumSearches: proc "system" (this: ^IShellFolder2, ppenum: ^^IEnumExtraSearch) -> HRESULT,
	GetDefaultColumn: proc "system" (this: ^IShellFolder2, dwRes: u32, pSort: ^u32, pDisplay: ^u32) -> HRESULT,
	GetDefaultColumnState: proc "system" (this: ^IShellFolder2, iColumn: u32, pcsFlags: ^SHCOLSTATE) -> HRESULT,
	GetDetailsEx: proc "system" (
		this: ^IShellFolder2,
		pidl: ^ITEMIDLIST,
		#by_ptr pscid: PROPERTYKEY,
		pv: ^VARIANT,
	) -> HRESULT,
	GetDetailsOf: proc "system" (this: ^IShellFolder2, pidl: ^ITEMIDLIST, iColumn: u32, psd: ^SHELLDETAILS) -> HRESULT,
	MapColumnToSCID: proc "system" (this: ^IShellFolder2, iColumn: u32, pscid: ^PROPERTYKEY) -> HRESULT,
}
IID_IShellFolder2 :: GUID{0x93F2F68C, 0x1D1B, 0x11D3, {0xA3, 0x0E, 0x00, 0xC0, 0x4F, 0x79, 0xAB, 0xD1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-ishellfolderband ]]
IShellFolderBand :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellFolderBand_Vtbl,
}
IShellFolderBand_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	InitializeSFB: proc "system" (this: ^IShellFolderBand, psf: ^IShellFolder, pidl: ^ITEMIDLIST) -> HRESULT,
	SetBandInfoSFB: proc "system" (this: ^IShellFolderBand, pbi: ^BANDINFOSFB) -> HRESULT,
	GetBandInfoSFB: proc "system" (this: ^IShellFolderBand, pbi: ^BANDINFOSFB) -> HRESULT,
}
IID_IShellFolderBand :: GUID{0x7FE80CC8, 0xC247, 0x11D0, {0xB9, 0x3A, 0x00, 0xA0, 0xC9, 0x03, 0x12, 0xE1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishellfolderview ]]
IShellFolderView :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellFolderView_Vtbl,
}
IShellFolderView_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Rearrange: proc "system" (this: ^IShellFolderView, lParamSort: LPARAM) -> HRESULT,
	GetArrangeParam: proc "system" (this: ^IShellFolderView, plParamSort: ^LPARAM) -> HRESULT,
	ArrangeGrid: proc "system" (this: ^IShellFolderView) -> HRESULT,
	AutoArrange: proc "system" (this: ^IShellFolderView) -> HRESULT,
	GetAutoArrange: proc "system" (this: ^IShellFolderView) -> HRESULT,
	AddObject: proc "system" (this: ^IShellFolderView, pidl: ^ITEMIDLIST, puItem: ^u32) -> HRESULT,
	GetObject: proc "system" (this: ^IShellFolderView, ppidl: ^ITEMIDLIST, uItem: u32) -> HRESULT,
	RemoveObject: proc "system" (this: ^IShellFolderView, pidl: ^ITEMIDLIST, puItem: ^u32) -> HRESULT,
	GetObjectCount: proc "system" (this: ^IShellFolderView, puCount: ^u32) -> HRESULT,
	SetObjectCount: proc "system" (this: ^IShellFolderView, uCount: u32, dwFlags: u32) -> HRESULT,
	UpdateObject: proc "system" (
		this: ^IShellFolderView,
		pidlOld: ^ITEMIDLIST,
		pidlNew: ^ITEMIDLIST,
		puItem: ^u32,
	) -> HRESULT,
	RefreshObject: proc "system" (this: ^IShellFolderView, pidl: ^ITEMIDLIST, puItem: ^u32) -> HRESULT,
	SetRedraw: proc "system" (this: ^IShellFolderView, bRedraw: BOOL) -> HRESULT,
	GetSelectedCount: proc "system" (this: ^IShellFolderView, puSelected: ^u32) -> HRESULT,
	GetSelectedObjects: proc "system" (this: ^IShellFolderView, pppidl: ^ITEMIDLIST, puItems: ^u32) -> HRESULT,
	IsDropOnSource: proc "system" (this: ^IShellFolderView, pDropTarget: ^IDropTarget) -> HRESULT,
	GetDragPoint: proc "system" (this: ^IShellFolderView, ppt: ^POINT) -> HRESULT,
	GetDropPoint: proc "system" (this: ^IShellFolderView, ppt: ^POINT) -> HRESULT,
	MoveIcons: proc "system" (this: ^IShellFolderView, pDataObject: ^IDataObject) -> HRESULT,
	SetItemPos: proc "system" (this: ^IShellFolderView, pidl: ^ITEMIDLIST, ppt: ^POINT) -> HRESULT,
	IsBkDropTarget: proc "system" (this: ^IShellFolderView, pDropTarget: ^IDropTarget) -> HRESULT,
	SetClipboard: proc "system" (this: ^IShellFolderView, bMove: BOOL) -> HRESULT,
	SetPoints: proc "system" (this: ^IShellFolderView, pDataObject: ^IDataObject) -> HRESULT,
	GetItemSpacing: proc "system" (this: ^IShellFolderView, pSpacing: ^ITEMSPACING) -> HRESULT,
	SetCallback: proc "system" (
		this: ^IShellFolderView,
		pNewCB: ^IShellFolderViewCB,
		ppOldCB: ^^IShellFolderViewCB,
	) -> HRESULT,
	Select: proc "system" (this: ^IShellFolderView, dwFlags: SFVS_SELECT) -> HRESULT,
	QuerySupport: proc "system" (this: ^IShellFolderView, pdwSupport: ^u32) -> HRESULT,
	SetAutomationObject: proc "system" (this: ^IShellFolderView, pdisp: ^IDispatch) -> HRESULT,
}
IID_IShellFolderView :: GUID{0x37A378C0, 0xF82D, 0x11CE, {0xAE, 0x65, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishellfolderviewcb ]]
IShellFolderViewCB :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellFolderViewCB_Vtbl,
}
IShellFolderViewCB_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	MessageSFVCB: proc "system" (
		this: ^IShellFolderViewCB,
		uMsg: SFVM_MESSAGE_ID,
		wParam: WPARAM,
		lParam: LPARAM,
	) -> HRESULT,
}
IID_IShellFolderViewCB :: GUID{0x2047E320, 0xF2A9, 0x11CE, {0xAE, 0x65, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-ishellfolderviewdual ]]
IShellFolderViewDual :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IShellFolderViewDual_Vtbl,
}
IShellFolderViewDual_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Application: proc "system" (this: ^IShellFolderViewDual, ppid: ^^IDispatch) -> HRESULT,
	get_Parent: proc "system" (this: ^IShellFolderViewDual, ppid: ^^IDispatch) -> HRESULT,
	get_Folder: proc "system" (this: ^IShellFolderViewDual, ppid: ^^Folder) -> HRESULT,
	SelectedItems: proc "system" (this: ^IShellFolderViewDual, ppid: ^^FolderItems) -> HRESULT,
	get_FocusedItem: proc "system" (this: ^IShellFolderViewDual, ppid: ^^FolderItem) -> HRESULT,
	SelectItem: proc "system" (this: ^IShellFolderViewDual, pvfi: ^VARIANT, dwFlags: i32) -> HRESULT,
	PopupItemMenu: proc "system" (
		this: ^IShellFolderViewDual,
		pfi: ^FolderItem,
		vx: VARIANT,
		vy: VARIANT,
		pbs: ^BSTR,
	) -> HRESULT,
	get_Script: proc "system" (this: ^IShellFolderViewDual, ppDisp: ^^IDispatch) -> HRESULT,
	get_ViewOptions: proc "system" (this: ^IShellFolderViewDual, plViewOptions: ^i32) -> HRESULT,
}
IID_IShellFolderViewDual :: GUID{0xE7A1AF80, 0x4D96, 0x11CF, {0x96, 0x0C, 0x00, 0x80, 0xC7, 0xF4, 0xEE, 0x85}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-ishellfolderviewdual2 ]]
IShellFolderViewDual2 :: struct #raw_union {
	#subtype IShellFolderViewDual: IShellFolderViewDual,
	using Vtbl: ^IShellFolderViewDual2_Vtbl,
}
IShellFolderViewDual2_Vtbl :: struct {
	using IShellFolderViewDual_Vtbl: IShellFolderViewDual_Vtbl,
	get_CurrentViewMode: proc "system" (this: ^IShellFolderViewDual2, pViewMode: ^u32) -> HRESULT,
	put_CurrentViewMode: proc "system" (this: ^IShellFolderViewDual2, ViewMode: u32) -> HRESULT,
	SelectItemRelative: proc "system" (this: ^IShellFolderViewDual2, iRelative: i32) -> HRESULT,
}
IID_IShellFolderViewDual2 :: GUID{0x31C147B6, 0x0ADE, 0x4A3C, {0xB5, 0x14, 0xDD, 0xF9, 0x32, 0xEF, 0x6D, 0x17}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-ishellfolderviewdual3 ]]
IShellFolderViewDual3 :: struct #raw_union {
	#subtype IShellFolderViewDual2: IShellFolderViewDual2,
	using Vtbl: ^IShellFolderViewDual3_Vtbl,
}
IShellFolderViewDual3_Vtbl :: struct {
	using IShellFolderViewDual2_Vtbl: IShellFolderViewDual2_Vtbl,
	get_GroupBy: proc "system" (this: ^IShellFolderViewDual3, pbstrGroupBy: ^BSTR) -> HRESULT,
	put_GroupBy: proc "system" (this: ^IShellFolderViewDual3, bstrGroupBy: BSTR) -> HRESULT,
	get_FolderFlags: proc "system" (this: ^IShellFolderViewDual3, pdwFlags: ^u32) -> HRESULT,
	put_FolderFlags: proc "system" (this: ^IShellFolderViewDual3, dwFlags: u32) -> HRESULT,
	get_SortColumns: proc "system" (this: ^IShellFolderViewDual3, pbstrSortColumns: ^BSTR) -> HRESULT,
	put_SortColumns: proc "system" (this: ^IShellFolderViewDual3, bstrSortColumns: BSTR) -> HRESULT,
	put_IconSize: proc "system" (this: ^IShellFolderViewDual3, iIconSize: i32) -> HRESULT,
	get_IconSize: proc "system" (this: ^IShellFolderViewDual3, piIconSize: ^i32) -> HRESULT,
	FilterView: proc "system" (this: ^IShellFolderViewDual3, bstrFilterText: BSTR) -> HRESULT,
}
IID_IShellFolderViewDual3 :: GUID{0x29EC8E6C, 0x46D3, 0x411F, {0xBA, 0xAA, 0x61, 0x1A, 0x6C, 0x9C, 0xAC, 0x66}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellicon ]]
IShellIcon :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellIcon_Vtbl,
}
IShellIcon_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetIconOf: proc "system" (this: ^IShellIcon, pidl: ^ITEMIDLIST, flags: u32, pIconIndex: ^i32) -> HRESULT,
}
IID_IShellIcon :: GUID{0x000214E5, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishelliconoverlay ]]
IShellIconOverlay :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellIconOverlay_Vtbl,
}
IShellIconOverlay_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetOverlayIndex: proc "system" (this: ^IShellIconOverlay, pidl: ^ITEMIDLIST, pIndex: ^i32) -> HRESULT,
	GetOverlayIconIndex: proc "system" (this: ^IShellIconOverlay, pidl: ^ITEMIDLIST, pIconIndex: ^i32) -> HRESULT,
}
IID_IShellIconOverlay :: GUID{0x7D688A70, 0xC613, 0x11D0, {0x99, 0x9B, 0x00, 0xC0, 0x4F, 0xD6, 0x55, 0xE1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelliconoverlayidentifier ]]
IShellIconOverlayIdentifier :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellIconOverlayIdentifier_Vtbl,
}
IShellIconOverlayIdentifier_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	IsMemberOf: proc "system" (this: ^IShellIconOverlayIdentifier, pwszPath: PWSTR, dwAttrib: u32) -> HRESULT,
	GetOverlayInfo: proc "system" (
		this: ^IShellIconOverlayIdentifier,
		pwszIconFile: PWSTR,
		cchMax: i32,
		pIndex: ^i32,
		pdwFlags: ^u32,
	) -> HRESULT,
	GetPriority: proc "system" (this: ^IShellIconOverlayIdentifier, pPriority: ^i32) -> HRESULT,
}
IID_IShellIconOverlayIdentifier :: GUID{0x0C6C4200, 0xC589, 0x11D0, {0x99, 0x9A, 0x00, 0xC0, 0x4F, 0xD6, 0x55, 0xE1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-ishelliconoverlaymanager ]]
IShellIconOverlayManager :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellIconOverlayManager_Vtbl,
}
IShellIconOverlayManager_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetFileOverlayInfo: proc "system" (
		this: ^IShellIconOverlayManager,
		pwszPath: PWSTR,
		dwAttrib: u32,
		pIndex: ^i32,
		dwflags: u32,
	) -> HRESULT,
	GetReservedOverlayInfo: proc "system" (
		this: ^IShellIconOverlayManager,
		pwszPath: PWSTR,
		dwAttrib: u32,
		pIndex: ^i32,
		dwflags: u32,
		iReservedID: i32,
	) -> HRESULT,
	RefreshOverlayImages: proc "system" (this: ^IShellIconOverlayManager, dwFlags: u32) -> HRESULT,
	LoadNonloadedOverlayIdentifiers: proc "system" (this: ^IShellIconOverlayManager) -> HRESULT,
	OverlayIndexFromImageIndex: proc "system" (this: ^IShellIconOverlayManager, iImage: i32, piIndex: ^i32, fAdd: BOOL) -> HRESULT,
}
IID_IShellIconOverlayManager :: GUID{0xF10B5E34, 0xDD3B, 0x42A7, {0xAA, 0x7D, 0x2F, 0x4E, 0xC5, 0x4B, 0xB0, 0x9B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shimgdata/nn-shimgdata-ishellimagedataabort ]]
IShellImageDataAbort :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellImageDataAbort_Vtbl,
}
IShellImageDataAbort_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryAbort: proc "system" (this: ^IShellImageDataAbort) -> HRESULT,
}
IID_IShellImageDataAbort :: GUID{0x53FB8E58, 0x50C0, 0x4003, {0xB4, 0xAA, 0x0C, 0x8D, 0xF2, 0x8E, 0x7F, 0x3A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shimgdata/nn-shimgdata-ishellimagedatafactory ]]
IShellImageDataFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellImageDataFactory_Vtbl,
}
IShellImageDataFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateIShellImageData: proc "system" (this: ^IShellImageDataFactory, ppshimg: ^^IShellImageData) -> HRESULT,
	CreateImageFromFile: proc "system" (this: ^IShellImageDataFactory, pszPath: PWSTR, ppshimg: ^^IShellImageData) -> HRESULT,
	CreateImageFromStream: proc "system" (
		this: ^IShellImageDataFactory,
		pStream: ^IStream,
		ppshimg: ^^IShellImageData,
	) -> HRESULT,
	GetDataFormatFromPath: proc "system" (this: ^IShellImageDataFactory, pszPath: PWSTR, pDataFormat: ^GUID) -> HRESULT,
}
IID_IShellImageDataFactory :: GUID{0x9BE8ED5C, 0xEDAB, 0x4D75, {0x90, 0xF3, 0xBD, 0x5B, 0xDB, 0xB2, 0x1C, 0x82}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitem ]]
IShellItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellItem_Vtbl,
}
IShellItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	BindToHandler: proc "system" (
		this: ^IShellItem,
		pbc: ^IBindCtx,
		#by_ptr bhid: GUID,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetParent: proc "system" (this: ^IShellItem, ppsi: ^^IShellItem) -> HRESULT,
	GetDisplayName: proc "system" (this: ^IShellItem, sigdnName: SIGDN, ppszName: ^PWSTR) -> HRESULT,
	GetAttributes: proc "system" (this: ^IShellItem, sfgaoMask: SFGAO_FLAGS, psfgaoAttribs: ^SFGAO_FLAGS) -> HRESULT,
	Compare: proc "system" (this: ^IShellItem, psi: ^IShellItem, hint: u32, piOrder: ^i32) -> HRESULT,
}
IID_IShellItem :: GUID{0x43826D1E, 0xE718, 0x42EE, {0xBC, 0x55, 0xA1, 0xE2, 0x61, 0xC3, 0x7B, 0xFE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitem2 ]]
IShellItem2 :: struct #raw_union {
	#subtype IShellItem: IShellItem,
	using Vtbl: ^IShellItem2_Vtbl,
}
IShellItem2_Vtbl :: struct {
	using IShellItem_Vtbl: IShellItem_Vtbl,
	GetPropertyStore: proc "system" (
		this: ^IShellItem2,
		flags: GETPROPERTYSTOREFLAGS,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetPropertyStoreWithCreateObject: proc "system" (
		this: ^IShellItem2,
		flags: GETPROPERTYSTOREFLAGS,
		punkCreateObject: ^IUnknown,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetPropertyStoreForKeys: proc "system" (
		this: ^IShellItem2,
		rgKeys: [^]PROPERTYKEY,
		cKeys: u32,
		flags: GETPROPERTYSTOREFLAGS,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetPropertyDescriptionList: proc "system" (
		this: ^IShellItem2,
		#by_ptr keyType: PROPERTYKEY,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	Update: proc "system" (this: ^IShellItem2, pbc: ^IBindCtx) -> HRESULT,
	GetProperty: proc "system" (this: ^IShellItem2, #by_ptr key: PROPERTYKEY, ppropvar: ^PROPVARIANT) -> HRESULT,
	GetCLSID: proc "system" (this: ^IShellItem2, #by_ptr key: PROPERTYKEY, pclsid: ^GUID) -> HRESULT,
	GetFileTime: proc "system" (this: ^IShellItem2, #by_ptr key: PROPERTYKEY, pft: ^FILETIME) -> HRESULT,
	GetInt32: proc "system" (this: ^IShellItem2, #by_ptr key: PROPERTYKEY, pi: ^i32) -> HRESULT,
	GetString: proc "system" (this: ^IShellItem2, #by_ptr key: PROPERTYKEY, ppsz: ^PWSTR) -> HRESULT,
	GetUInt32: proc "system" (this: ^IShellItem2, #by_ptr key: PROPERTYKEY, pui: ^u32) -> HRESULT,
	GetUInt64: proc "system" (this: ^IShellItem2, #by_ptr key: PROPERTYKEY, pull: ^u64) -> HRESULT,
	GetBool: proc "system" (this: ^IShellItem2, #by_ptr key: PROPERTYKEY, pf: ^BOOL) -> HRESULT,
}
IID_IShellItem2 :: GUID{0x7E9FB0D3, 0x919F, 0x4307, {0xAB, 0x2E, 0x9B, 0x18, 0x60, 0x31, 0x0C, 0x93}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitemarray ]]
IShellItemArray :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellItemArray_Vtbl,
}
IShellItemArray_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	BindToHandler: proc "system" (
		this: ^IShellItemArray,
		pbc: ^IBindCtx,
		#by_ptr bhid: GUID,
		#by_ptr riid: GUID,
		ppvOut: rawptr,
	) -> HRESULT,
	GetPropertyStore: proc "system" (
		this: ^IShellItemArray,
		flags: GETPROPERTYSTOREFLAGS,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetPropertyDescriptionList: proc "system" (
		this: ^IShellItemArray,
		#by_ptr keyType: PROPERTYKEY,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetAttributes: proc "system" (
		this: ^IShellItemArray,
		AttribFlags: SIATTRIBFLAGS,
		sfgaoMask: SFGAO_FLAGS,
		psfgaoAttribs: ^SFGAO_FLAGS,
	) -> HRESULT,
	GetCount: proc "system" (this: ^IShellItemArray, pdwNumItems: ^u32) -> HRESULT,
	GetItemAt: proc "system" (this: ^IShellItemArray, dwIndex: u32, ppsi: ^^IShellItem) -> HRESULT,
	EnumItems: proc "system" (this: ^IShellItemArray, ppenumShellItems: ^^IEnumShellItems) -> HRESULT,
}
IID_IShellItemArray :: GUID{0xB63EA76D, 0x1F85, 0x456F, {0xA1, 0x9C, 0x48, 0x15, 0x9E, 0xFA, 0x85, 0x8B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitemfilter ]]
IShellItemFilter :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellItemFilter_Vtbl,
}
IShellItemFilter_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	IncludeItem: proc "system" (this: ^IShellItemFilter, psi: ^IShellItem) -> HRESULT,
	GetEnumFlagsForItem: proc "system" (this: ^IShellItemFilter, psi: ^IShellItem, pgrfFlags: ^u32) -> HRESULT,
}
IID_IShellItemFilter :: GUID{0x2659B475, 0xEEB8, 0x48B7, {0x8F, 0x07, 0xB3, 0x78, 0x81, 0x0F, 0x48, 0xCF}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitemimagefactory ]]
IShellItemImageFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellItemImageFactory_Vtbl,
}
IShellItemImageFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetImage: proc "system" (this: ^IShellItemImageFactory, size: SIZE, flags: SIIGBF, phbm: ^HBITMAP) -> HRESULT,
}
IID_IShellItemImageFactory :: GUID{0xBCC18B79, 0xBA16, 0x442F, {0x80, 0xC4, 0x8A, 0x59, 0xC3, 0x0C, 0x46, 0x3B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitemresources ]]
IShellItemResources :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellItemResources_Vtbl,
}
IShellItemResources_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetAttributes: proc "system" (this: ^IShellItemResources, pdwAttributes: ^u32) -> HRESULT,
	GetSize: proc "system" (this: ^IShellItemResources, pullSize: ^u64) -> HRESULT,
	GetTimes: proc "system" (
		this: ^IShellItemResources,
		pftCreation: ^FILETIME,
		pftWrite: ^FILETIME,
		pftAccess: ^FILETIME,
	) -> HRESULT,
	SetTimes: proc "system" (
		this: ^IShellItemResources,
		#by_ptr pftCreation: FILETIME,
		#by_ptr pftWrite: FILETIME,
		#by_ptr pftAccess: FILETIME,
	) -> HRESULT,
	GetResourceDescription: proc "system" (
		this: ^IShellItemResources,
		#by_ptr pcsir: SHELL_ITEM_RESOURCE,
		ppszDescription: ^PWSTR,
	) -> HRESULT,
	EnumResources: proc "system" (this: ^IShellItemResources, ppenumr: ^^IEnumResources) -> HRESULT,
	SupportsResource: proc "system" (this: ^IShellItemResources, #by_ptr pcsir: SHELL_ITEM_RESOURCE) -> HRESULT,
	OpenResource: proc "system" (
		this: ^IShellItemResources,
		#by_ptr pcsir: SHELL_ITEM_RESOURCE,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	CreateResource: proc "system" (
		this: ^IShellItemResources,
		#by_ptr pcsir: SHELL_ITEM_RESOURCE,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	MarkForDelete: proc "system" (this: ^IShellItemResources) -> HRESULT,
}
IID_IShellItemResources :: GUID{0xFF5693BE, 0x2CE0, 0x4D48, {0xB5, 0xC5, 0x40, 0x81, 0x7D, 0x1A, 0xCD, 0xB9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelllibrary ]]
IShellLibrary :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellLibrary_Vtbl,
}
IShellLibrary_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	LoadLibraryFromItem: proc "system" (this: ^IShellLibrary, psiLibrary: ^IShellItem, grfMode: u32) -> HRESULT,
	LoadLibraryFromKnownFolder: proc "system" (this: ^IShellLibrary, #by_ptr kfidLibrary: GUID, grfMode: u32) -> HRESULT,
	AddFolder: proc "system" (this: ^IShellLibrary, psiLocation: ^IShellItem) -> HRESULT,
	RemoveFolder: proc "system" (this: ^IShellLibrary, psiLocation: ^IShellItem) -> HRESULT,
	GetFolders: proc "system" (
		this: ^IShellLibrary,
		lff: LIBRARYFOLDERFILTER,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	ResolveFolder: proc "system" (
		this: ^IShellLibrary,
		psiFolderToResolve: ^IShellItem,
		dwTimeout: u32,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetDefaultSaveFolder: proc "system" (
		this: ^IShellLibrary,
		dsft: DEFAULTSAVEFOLDERTYPE,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	SetDefaultSaveFolder: proc "system" (this: ^IShellLibrary, dsft: DEFAULTSAVEFOLDERTYPE, psi: ^IShellItem) -> HRESULT,
	GetOptions: proc "system" (this: ^IShellLibrary, plofOptions: ^LIBRARYOPTIONFLAGS) -> HRESULT,
	SetOptions: proc "system" (
		this: ^IShellLibrary,
		lofMask: LIBRARYOPTIONFLAGS,
		lofOptions: LIBRARYOPTIONFLAGS,
	) -> HRESULT,
	GetFolderType: proc "system" (this: ^IShellLibrary, pftid: ^GUID) -> HRESULT,
	SetFolderType: proc "system" (this: ^IShellLibrary, #by_ptr ftid: GUID) -> HRESULT,
	GetIcon: proc "system" (this: ^IShellLibrary, ppszIcon: ^PWSTR) -> HRESULT,
	SetIcon: proc "system" (this: ^IShellLibrary, pszIcon: PWSTR) -> HRESULT,
	Commit: proc "system" (this: ^IShellLibrary) -> HRESULT,
	Save: proc "system" (
		this: ^IShellLibrary,
		psiFolderToSaveIn: ^IShellItem,
		pszLibraryName: PWSTR,
		lsf: LIBRARYSAVEFLAGS,
		ppsiSavedTo: ^^IShellItem,
	) -> HRESULT,
	SaveInKnownFolder: proc "system" (
		this: ^IShellLibrary,
		#by_ptr kfidToSaveIn: GUID,
		pszLibraryName: PWSTR,
		lsf: LIBRARYSAVEFLAGS,
		ppsiSavedTo: ^^IShellItem,
	) -> HRESULT,
}
IID_IShellLibrary :: GUID{0x11A66EFA, 0x382E, 0x451A, {0x92, 0x34, 0x1E, 0x0E, 0x12, 0xEF, 0x30, 0x85}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelllinka ]]
IShellLinkA :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellLinkA_Vtbl,
}
IShellLinkA_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetPath: proc "system" (this: ^IShellLinkA, pszFile: PSTR, cch: i32, pfd: ^WIN32_FIND_DATAA, fFlags: u32) -> HRESULT,
	GetIDList: proc "system" (this: ^IShellLinkA, ppidl: ^ITEMIDLIST) -> HRESULT,
	SetIDList: proc "system" (this: ^IShellLinkA, pidl: ^ITEMIDLIST) -> HRESULT,
	GetDescription: proc "system" (this: ^IShellLinkA, pszName: PSTR, cch: i32) -> HRESULT,
	SetDescription: proc "system" (this: ^IShellLinkA, pszName: PSTR) -> HRESULT,
	GetWorkingDirectory: proc "system" (this: ^IShellLinkA, pszDir: PSTR, cch: i32) -> HRESULT,
	SetWorkingDirectory: proc "system" (this: ^IShellLinkA, pszDir: PSTR) -> HRESULT,
	GetArguments: proc "system" (this: ^IShellLinkA, pszArgs: PSTR, cch: i32) -> HRESULT,
	SetArguments: proc "system" (this: ^IShellLinkA, pszArgs: PSTR) -> HRESULT,
	GetHotkey: proc "system" (this: ^IShellLinkA, pwHotkey: ^u16) -> HRESULT,
	SetHotkey: proc "system" (this: ^IShellLinkA, wHotkey: u16) -> HRESULT,
	GetShowCmd: proc "system" (this: ^IShellLinkA, piShowCmd: ^SHOW_WINDOW_CMD) -> HRESULT,
	SetShowCmd: proc "system" (this: ^IShellLinkA, iShowCmd: SHOW_WINDOW_CMD) -> HRESULT,
	GetIconLocation: proc "system" (this: ^IShellLinkA, pszIconPath: PSTR, cch: i32, piIcon: ^i32) -> HRESULT,
	SetIconLocation: proc "system" (this: ^IShellLinkA, pszIconPath: PSTR, iIcon: i32) -> HRESULT,
	SetRelativePath: proc "system" (this: ^IShellLinkA, pszPathRel: PSTR, dwReserved: u32) -> HRESULT,
	Resolve: proc "system" (this: ^IShellLinkA, hwnd: HWND, fFlags: u32) -> HRESULT,
	SetPath: proc "system" (this: ^IShellLinkA, pszFile: PSTR) -> HRESULT,
}
IID_IShellLinkA :: GUID{0x000214EE, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelllinkdatalist ]]
IShellLinkDataList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellLinkDataList_Vtbl,
}
IShellLinkDataList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AddDataBlock: proc "system" (this: ^IShellLinkDataList, pDataBlock: rawptr) -> HRESULT,
	CopyDataBlock: proc "system" (this: ^IShellLinkDataList, dwSig: u32, ppDataBlock: rawptr) -> HRESULT,
	RemoveDataBlock: proc "system" (this: ^IShellLinkDataList, dwSig: u32) -> HRESULT,
	GetFlags: proc "system" (this: ^IShellLinkDataList, pdwFlags: ^u32) -> HRESULT,
	SetFlags: proc "system" (this: ^IShellLinkDataList, dwFlags: u32) -> HRESULT,
}
IID_IShellLinkDataList :: GUID{0x45E2B4AE, 0xB1C3, 0x11D0, {0xB9, 0x2F, 0x00, 0xA0, 0xC9, 0x03, 0x12, 0xE1}}

IShellLinkDual :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IShellLinkDual_Vtbl,
}
IShellLinkDual_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Path: proc "system" (this: ^IShellLinkDual, pbs: ^BSTR) -> HRESULT,
	put_Path: proc "system" (this: ^IShellLinkDual, bs: BSTR) -> HRESULT,
	get_Description: proc "system" (this: ^IShellLinkDual, pbs: ^BSTR) -> HRESULT,
	put_Description: proc "system" (this: ^IShellLinkDual, bs: BSTR) -> HRESULT,
	get_WorkingDirectory: proc "system" (this: ^IShellLinkDual, pbs: ^BSTR) -> HRESULT,
	put_WorkingDirectory: proc "system" (this: ^IShellLinkDual, bs: BSTR) -> HRESULT,
	get_Arguments: proc "system" (this: ^IShellLinkDual, pbs: ^BSTR) -> HRESULT,
	put_Arguments: proc "system" (this: ^IShellLinkDual, bs: BSTR) -> HRESULT,
	get_Hotkey: proc "system" (this: ^IShellLinkDual, piHK: ^i32) -> HRESULT,
	put_Hotkey: proc "system" (this: ^IShellLinkDual, iHK: i32) -> HRESULT,
	get_ShowCommand: proc "system" (this: ^IShellLinkDual, piShowCommand: ^i32) -> HRESULT,
	put_ShowCommand: proc "system" (this: ^IShellLinkDual, iShowCommand: i32) -> HRESULT,
	Resolve: proc "system" (this: ^IShellLinkDual, fFlags: i32) -> HRESULT,
	GetIconLocation: proc "system" (this: ^IShellLinkDual, pbs: ^BSTR, piIcon: ^i32) -> HRESULT,
	SetIconLocation: proc "system" (this: ^IShellLinkDual, bs: BSTR, iIcon: i32) -> HRESULT,
	Save: proc "system" (this: ^IShellLinkDual, vWhere: VARIANT) -> HRESULT,
}
IID_IShellLinkDual :: GUID{0x88A05C00, 0xF000, 0x11CE, {0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ishelllinkdual2-object ]]
IShellLinkDual2 :: struct #raw_union {
	#subtype IShellLinkDual: IShellLinkDual,
	using Vtbl: ^IShellLinkDual2_Vtbl,
}
IShellLinkDual2_Vtbl :: struct {
	using IShellLinkDual_Vtbl: IShellLinkDual_Vtbl,
	get_Target: proc "system" (this: ^IShellLinkDual2, ppfi: ^^FolderItem) -> HRESULT,
}
IID_IShellLinkDual2 :: GUID{0x317EE249, 0xF12E, 0x11D2, {0xB1, 0xE4, 0x00, 0xC0, 0x4F, 0x8E, 0xEB, 0x3E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelllinkw ]]
IShellLinkW :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellLinkW_Vtbl,
}
IShellLinkW_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetPath: proc "system" (this: ^IShellLinkW, pszFile: PWSTR, cch: i32, pfd: ^WIN32_FIND_DATAW, fFlags: u32) -> HRESULT,
	GetIDList: proc "system" (this: ^IShellLinkW, ppidl: ^ITEMIDLIST) -> HRESULT,
	SetIDList: proc "system" (this: ^IShellLinkW, pidl: ^ITEMIDLIST) -> HRESULT,
	GetDescription: proc "system" (this: ^IShellLinkW, pszName: PWSTR, cch: i32) -> HRESULT,
	SetDescription: proc "system" (this: ^IShellLinkW, pszName: PWSTR) -> HRESULT,
	GetWorkingDirectory: proc "system" (this: ^IShellLinkW, pszDir: PWSTR, cch: i32) -> HRESULT,
	SetWorkingDirectory: proc "system" (this: ^IShellLinkW, pszDir: PWSTR) -> HRESULT,
	GetArguments: proc "system" (this: ^IShellLinkW, pszArgs: PWSTR, cch: i32) -> HRESULT,
	SetArguments: proc "system" (this: ^IShellLinkW, pszArgs: PWSTR) -> HRESULT,
	GetHotkey: proc "system" (this: ^IShellLinkW, pwHotkey: ^u16) -> HRESULT,
	SetHotkey: proc "system" (this: ^IShellLinkW, wHotkey: u16) -> HRESULT,
	GetShowCmd: proc "system" (this: ^IShellLinkW, piShowCmd: ^SHOW_WINDOW_CMD) -> HRESULT,
	SetShowCmd: proc "system" (this: ^IShellLinkW, iShowCmd: SHOW_WINDOW_CMD) -> HRESULT,
	GetIconLocation: proc "system" (this: ^IShellLinkW, pszIconPath: PWSTR, cch: i32, piIcon: ^i32) -> HRESULT,
	SetIconLocation: proc "system" (this: ^IShellLinkW, pszIconPath: PWSTR, iIcon: i32) -> HRESULT,
	SetRelativePath: proc "system" (this: ^IShellLinkW, pszPathRel: PWSTR, dwReserved: u32) -> HRESULT,
	Resolve: proc "system" (this: ^IShellLinkW, hwnd: HWND, fFlags: u32) -> HRESULT,
	SetPath: proc "system" (this: ^IShellLinkW, pszFile: PWSTR) -> HRESULT,
}
IID_IShellLinkW :: GUID{0x000214F9, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellmenu ]]
IShellMenu :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellMenu_Vtbl,
}
IShellMenu_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (
		this: ^IShellMenu,
		psmc: ^IShellMenuCallback,
		uId: u32,
		uIdAncestor: u32,
		dwFlags: u32,
	) -> HRESULT,
	GetMenuInfo: proc "system" (
		this: ^IShellMenu,
		ppsmc: ^^IShellMenuCallback,
		puId: ^u32,
		puIdAncestor: ^u32,
		pdwFlags: ^u32,
	) -> HRESULT,
	SetShellFolder: proc "system" (
		this: ^IShellMenu,
		psf: ^IShellFolder,
		pidlFolder: ^ITEMIDLIST,
		hKey: HKEY,
		dwFlags: u32,
	) -> HRESULT,
	GetShellFolder: proc "system" (
		this: ^IShellMenu,
		pdwFlags: ^u32,
		ppidl: ^ITEMIDLIST,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	SetMenu: proc "system" (this: ^IShellMenu, hmenu: HMENU, hwnd: HWND, dwFlags: u32) -> HRESULT,
	GetMenu: proc "system" (this: ^IShellMenu, phmenu: ^HMENU, phwnd: ^HWND, pdwFlags: ^u32) -> HRESULT,
	InvalidateItem: proc "system" (this: ^IShellMenu, psmd: ^SMDATA, dwFlags: u32) -> HRESULT,
	GetState: proc "system" (this: ^IShellMenu, psmd: ^SMDATA) -> HRESULT,
	SetMenuToolbar: proc "system" (this: ^IShellMenu, punk: ^IUnknown, dwFlags: u32) -> HRESULT,
}
IID_IShellMenu :: GUID{0xEE1F7637, 0xE138, 0x11D1, {0x83, 0x79, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellmenucallback ]]
IShellMenuCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellMenuCallback_Vtbl,
}
IShellMenuCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CallbackSM: proc "system" (
		this: ^IShellMenuCallback,
		psmd: ^SMDATA,
		uMsg: u32,
		wParam: WPARAM,
		lParam: LPARAM,
	) -> HRESULT,
}
IID_IShellMenuCallback :: GUID{0x4CA300A1, 0x9B8D, 0x11D1, {0x8B, 0x22, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}

IShellNameSpace :: struct #raw_union {
	#subtype IShellFavoritesNameSpace: IShellFavoritesNameSpace,
	using Vtbl: ^IShellNameSpace_Vtbl,
}
IShellNameSpace_Vtbl :: struct {
	using IShellFavoritesNameSpace_Vtbl: IShellFavoritesNameSpace_Vtbl,
	get_EnumOptions: proc "system" (this: ^IShellNameSpace, pgrfEnumFlags: ^i32) -> HRESULT,
	put_EnumOptions: proc "system" (this: ^IShellNameSpace, lVal: i32) -> HRESULT,
	get_SelectedItem: proc "system" (this: ^IShellNameSpace, pItem: ^^IDispatch) -> HRESULT,
	put_SelectedItem: proc "system" (this: ^IShellNameSpace, pItem: ^IDispatch) -> HRESULT,
	get_Root: proc "system" (this: ^IShellNameSpace, pvar: ^VARIANT) -> HRESULT,
	put_Root: proc "system" (this: ^IShellNameSpace, var: VARIANT) -> HRESULT,
	get_Depth: proc "system" (this: ^IShellNameSpace, piDepth: ^i32) -> HRESULT,
	put_Depth: proc "system" (this: ^IShellNameSpace, iDepth: i32) -> HRESULT,
	get_Mode: proc "system" (this: ^IShellNameSpace, puMode: ^u32) -> HRESULT,
	put_Mode: proc "system" (this: ^IShellNameSpace, uMode: u32) -> HRESULT,
	get_Flags: proc "system" (this: ^IShellNameSpace, pdwFlags: ^u32) -> HRESULT,
	put_Flags: proc "system" (this: ^IShellNameSpace, dwFlags: u32) -> HRESULT,
	put_TVFlags: proc "system" (this: ^IShellNameSpace, dwFlags: u32) -> HRESULT,
	get_TVFlags: proc "system" (this: ^IShellNameSpace, dwFlags: ^u32) -> HRESULT,
	get_Columns: proc "system" (this: ^IShellNameSpace, bstrColumns: ^BSTR) -> HRESULT,
	put_Columns: proc "system" (this: ^IShellNameSpace, bstrColumns: BSTR) -> HRESULT,
	get_CountViewTypes: proc "system" (this: ^IShellNameSpace, piTypes: ^i32) -> HRESULT,
	SetViewType: proc "system" (this: ^IShellNameSpace, iType: i32) -> HRESULT,
	SelectedItems: proc "system" (this: ^IShellNameSpace, ppid: ^^IDispatch) -> HRESULT,
	Expand: proc "system" (this: ^IShellNameSpace, var: VARIANT, iDepth: i32) -> HRESULT,
	UnselectAll: proc "system" (this: ^IShellNameSpace) -> HRESULT,
}
IID_IShellNameSpace :: GUID{0xE572D3C9, 0x37BE, 0x4AE2, {0x82, 0x5D, 0xD5, 0x21, 0x76, 0x3E, 0x31, 0x08}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellpropsheetext ]]
IShellPropSheetExt :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellPropSheetExt_Vtbl,
}
IShellPropSheetExt_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AddPages: proc "system" (
		this: ^IShellPropSheetExt,
		pfnAddPage: LPFNSVADDPROPSHEETPAGE,
		lParam: LPARAM,
	) -> HRESULT,
	ReplacePage: proc "system" (
		this: ^IShellPropSheetExt,
		uPageID: u32,
		pfnReplaceWith: LPFNSVADDPROPSHEETPAGE,
		lParam: LPARAM,
	) -> HRESULT,
}
IID_IShellPropSheetExt :: GUID{0x000214E9, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ishellrundll ]]
IShellRunDll :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellRunDll_Vtbl,
}
IShellRunDll_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Run: proc "system" (this: ^IShellRunDll, pszArgs: PWSTR) -> HRESULT,
}
IID_IShellRunDll :: GUID{0xFCE4BDE0, 0x4B68, 0x4B80, {0x8E, 0x9C, 0x74, 0x26, 0x31, 0x5A, 0x73, 0x88}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-ishellservice ]]
IShellService :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellService_Vtbl,
}
IShellService_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetOwner: proc "system" (this: ^IShellService, punkOwner: ^IUnknown) -> HRESULT,
}
IID_IShellService :: GUID{0x5836FB00, 0x8187, 0x11CF, {0xA1, 0x2B, 0x00, 0xAA, 0x00, 0x4A, 0xE8, 0x37}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishelltaskscheduler ]]
IShellTaskScheduler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IShellTaskScheduler_Vtbl,
}
IShellTaskScheduler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AddTask: proc "system" (
		this: ^IShellTaskScheduler,
		prt: ^IRunnableTask,
		#by_ptr rtoid: GUID,
		lParam: uintptr,
		dwPriority: u32,
	) -> HRESULT,
	RemoveTasks: proc "system" (
		this: ^IShellTaskScheduler,
		#by_ptr rtoid: GUID,
		lParam: uintptr,
		bWaitIfRunning: BOOL,
	) -> HRESULT,
	CountTasks: proc "system" (this: ^IShellTaskScheduler, #by_ptr rtoid: GUID) -> u32,
	Status: proc "system" (this: ^IShellTaskScheduler, dwReleaseStatus: u32, dwThreadTimeout: u32) -> HRESULT,
}
IID_IShellTaskScheduler :: GUID{0x6CCB7BE0, 0x6807, 0x11D0, {0xB8, 0x10, 0x00, 0xC0, 0x4F, 0xD7, 0x06, 0xEC}}

IShellUIHelper :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IShellUIHelper_Vtbl,
}
IShellUIHelper_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	ResetFirstBootMode: proc "system" (this: ^IShellUIHelper) -> HRESULT,
	ResetSafeMode: proc "system" (this: ^IShellUIHelper) -> HRESULT,
	RefreshOfflineDesktop: proc "system" (this: ^IShellUIHelper) -> HRESULT,
	AddFavorite: proc "system" (this: ^IShellUIHelper, URL: BSTR, Title: ^VARIANT) -> HRESULT,
	AddChannel: proc "system" (this: ^IShellUIHelper, URL: BSTR) -> HRESULT,
	AddDesktopComponent: proc "system" (
		this: ^IShellUIHelper,
		URL: BSTR,
		Type: BSTR,
		Left: ^VARIANT,
		Top: ^VARIANT,
		Width: ^VARIANT,
		Height: ^VARIANT,
	) -> HRESULT,
	IsSubscribed: proc "system" (this: ^IShellUIHelper, URL: BSTR, pBool: ^VARIANT_BOOL) -> HRESULT,
	NavigateAndFind: proc "system" (this: ^IShellUIHelper, URL: BSTR, strQuery: BSTR, varTargetFrame: ^VARIANT) -> HRESULT,
	ImportExportFavorites: proc "system" (this: ^IShellUIHelper, fImport: VARIANT_BOOL, strImpExpPath: BSTR) -> HRESULT,
	AutoCompleteSaveForm: proc "system" (this: ^IShellUIHelper, Form: ^VARIANT) -> HRESULT,
	AutoScan: proc "system" (
		this: ^IShellUIHelper,
		strSearch: BSTR,
		strFailureUrl: BSTR,
		pvarTargetFrame: ^VARIANT,
	) -> HRESULT,
	AutoCompleteAttach: proc "system" (this: ^IShellUIHelper, Reserved: ^VARIANT) -> HRESULT,
	ShowBrowserUI: proc "system" (this: ^IShellUIHelper, bstrName: BSTR, pvarIn: ^VARIANT, pvarOut: ^VARIANT) -> HRESULT,
}
IID_IShellUIHelper :: GUID{0x729FE2F8, 0x1EA8, 0x11D1, {0x8F, 0x85, 0x00, 0xC0, 0x4F, 0xC2, 0xFB, 0xE1}}

IShellUIHelper2 :: struct #raw_union {
	#subtype IShellUIHelper: IShellUIHelper,
	using Vtbl: ^IShellUIHelper2_Vtbl,
}
IShellUIHelper2_Vtbl :: struct {
	using IShellUIHelper_Vtbl: IShellUIHelper_Vtbl,
	AddSearchProvider: proc "system" (this: ^IShellUIHelper2, URL: BSTR) -> HRESULT,
	RunOnceShown: proc "system" (this: ^IShellUIHelper2) -> HRESULT,
	SkipRunOnce: proc "system" (this: ^IShellUIHelper2) -> HRESULT,
	CustomizeSettings: proc "system" (
		this: ^IShellUIHelper2,
		fSQM: VARIANT_BOOL,
		fPhishing: VARIANT_BOOL,
		bstrLocale: BSTR,
	) -> HRESULT,
	SqmEnabled: proc "system" (this: ^IShellUIHelper2, pfEnabled: ^VARIANT_BOOL) -> HRESULT,
	PhishingEnabled: proc "system" (this: ^IShellUIHelper2, pfEnabled: ^VARIANT_BOOL) -> HRESULT,
	BrandImageUri: proc "system" (this: ^IShellUIHelper2, pbstrUri: ^BSTR) -> HRESULT,
	SkipTabsWelcome: proc "system" (this: ^IShellUIHelper2) -> HRESULT,
	DiagnoseConnection: proc "system" (this: ^IShellUIHelper2) -> HRESULT,
	CustomizeClearType: proc "system" (this: ^IShellUIHelper2, fSet: VARIANT_BOOL) -> HRESULT,
	IsSearchProviderInstalled: proc "system" (this: ^IShellUIHelper2, URL: BSTR, pdwResult: ^u32) -> HRESULT,
	IsSearchMigrated: proc "system" (this: ^IShellUIHelper2, pfMigrated: ^VARIANT_BOOL) -> HRESULT,
	DefaultSearchProvider: proc "system" (this: ^IShellUIHelper2, pbstrName: ^BSTR) -> HRESULT,
	RunOnceRequiredSettingsComplete: proc "system" (this: ^IShellUIHelper2, fComplete: VARIANT_BOOL) -> HRESULT,
	RunOnceHasShown: proc "system" (this: ^IShellUIHelper2, pfShown: ^VARIANT_BOOL) -> HRESULT,
	SearchGuideUrl: proc "system" (this: ^IShellUIHelper2, pbstrUrl: ^BSTR) -> HRESULT,
}
IID_IShellUIHelper2 :: GUID{0xA7FE6EDA, 0x1932, 0x4281, {0xB8, 0x81, 0x87, 0xB3, 0x1B, 0x8B, 0xC5, 0x2C}}

IShellUIHelper3 :: struct #raw_union {
	#subtype IShellUIHelper2: IShellUIHelper2,
	using Vtbl: ^IShellUIHelper3_Vtbl,
}
IShellUIHelper3_Vtbl :: struct {
	using IShellUIHelper2_Vtbl: IShellUIHelper2_Vtbl,
	AddService: proc "system" (this: ^IShellUIHelper3, URL: BSTR) -> HRESULT,
	IsServiceInstalled: proc "system" (this: ^IShellUIHelper3, URL: BSTR, Verb: BSTR, pdwResult: ^u32) -> HRESULT,
	InPrivateFilteringEnabled: proc "system" (this: ^IShellUIHelper3, pfEnabled: ^VARIANT_BOOL) -> HRESULT,
	AddToFavoritesBar: proc "system" (this: ^IShellUIHelper3, URL: BSTR, Title: BSTR, Type: ^VARIANT) -> HRESULT,
	BuildNewTabPage: proc "system" (this: ^IShellUIHelper3) -> HRESULT,
	SetRecentlyClosedVisible: proc "system" (this: ^IShellUIHelper3, fVisible: VARIANT_BOOL) -> HRESULT,
	SetActivitiesVisible: proc "system" (this: ^IShellUIHelper3, fVisible: VARIANT_BOOL) -> HRESULT,
	ContentDiscoveryReset: proc "system" (this: ^IShellUIHelper3) -> HRESULT,
	IsSuggestedSitesEnabled: proc "system" (this: ^IShellUIHelper3, pfEnabled: ^VARIANT_BOOL) -> HRESULT,
	EnableSuggestedSites: proc "system" (this: ^IShellUIHelper3, fEnable: VARIANT_BOOL) -> HRESULT,
	NavigateToSuggestedSites: proc "system" (this: ^IShellUIHelper3, bstrRelativeUrl: BSTR) -> HRESULT,
	ShowTabsHelp: proc "system" (this: ^IShellUIHelper3) -> HRESULT,
	ShowInPrivateHelp: proc "system" (this: ^IShellUIHelper3) -> HRESULT,
}
IID_IShellUIHelper3 :: GUID{0x528DF2EC, 0xD419, 0x40BC, {0x9B, 0x6D, 0xDC, 0xDB, 0xF9, 0xC1, 0xB2, 0x5D}}

IShellUIHelper4 :: struct #raw_union {
	#subtype IShellUIHelper3: IShellUIHelper3,
	using Vtbl: ^IShellUIHelper4_Vtbl,
}
IShellUIHelper4_Vtbl :: struct {
	using IShellUIHelper3_Vtbl: IShellUIHelper3_Vtbl,
	msIsSiteMode: proc "system" (this: ^IShellUIHelper4, pfSiteMode: ^VARIANT_BOOL) -> HRESULT,
	msSiteModeShowThumbBar: proc "system" (this: ^IShellUIHelper4) -> HRESULT,
	msSiteModeAddThumbBarButton: proc "system" (
		this: ^IShellUIHelper4,
		bstrIconURL: BSTR,
		bstrTooltip: BSTR,
		pvarButtonID: ^VARIANT,
	) -> HRESULT,
	msSiteModeUpdateThumbBarButton: proc "system" (
		this: ^IShellUIHelper4,
		ButtonID: VARIANT,
		fEnabled: VARIANT_BOOL,
		fVisible: VARIANT_BOOL,
	) -> HRESULT,
	msSiteModeSetIconOverlay: proc "system" (this: ^IShellUIHelper4, IconUrl: BSTR, pvarDescription: ^VARIANT) -> HRESULT,
	msSiteModeClearIconOverlay: proc "system" (this: ^IShellUIHelper4) -> HRESULT,
	msAddSiteMode: proc "system" (this: ^IShellUIHelper4) -> HRESULT,
	msSiteModeCreateJumpList: proc "system" (this: ^IShellUIHelper4, bstrHeader: BSTR) -> HRESULT,
	msSiteModeAddJumpListItem: proc "system" (
		this: ^IShellUIHelper4,
		bstrName: BSTR,
		bstrActionUri: BSTR,
		bstrIconUri: BSTR,
		pvarWindowType: ^VARIANT,
	) -> HRESULT,
	msSiteModeClearJumpList: proc "system" (this: ^IShellUIHelper4) -> HRESULT,
	msSiteModeShowJumpList: proc "system" (this: ^IShellUIHelper4) -> HRESULT,
	msSiteModeAddButtonStyle: proc "system" (
		this: ^IShellUIHelper4,
		uiButtonID: VARIANT,
		bstrIconUrl: BSTR,
		bstrTooltip: BSTR,
		pvarStyleID: ^VARIANT,
	) -> HRESULT,
	msSiteModeShowButtonStyle: proc "system" (this: ^IShellUIHelper4, uiButtonID: VARIANT, uiStyleID: VARIANT) -> HRESULT,
	msSiteModeActivate: proc "system" (this: ^IShellUIHelper4) -> HRESULT,
	msIsSiteModeFirstRun: proc "system" (
		this: ^IShellUIHelper4,
		fPreserveState: VARIANT_BOOL,
		puiFirstRun: ^VARIANT,
	) -> HRESULT,
	msAddTrackingProtectionList: proc "system" (this: ^IShellUIHelper4, URL: BSTR, bstrFilterName: BSTR) -> HRESULT,
	msTrackingProtectionEnabled: proc "system" (this: ^IShellUIHelper4, pfEnabled: ^VARIANT_BOOL) -> HRESULT,
	msActiveXFilteringEnabled: proc "system" (this: ^IShellUIHelper4, pfEnabled: ^VARIANT_BOOL) -> HRESULT,
}
IID_IShellUIHelper4 :: GUID{0xB36E6A53, 0x8073, 0x499E, {0x82, 0x4C, 0xD7, 0x76, 0x33, 0x0A, 0x33, 0x3E}}

IShellUIHelper5 :: struct #raw_union {
	#subtype IShellUIHelper4: IShellUIHelper4,
	using Vtbl: ^IShellUIHelper5_Vtbl,
}
IShellUIHelper5_Vtbl :: struct {
	using IShellUIHelper4_Vtbl: IShellUIHelper4_Vtbl,
	msProvisionNetworks: proc "system" (this: ^IShellUIHelper5, bstrProvisioningXml: BSTR, puiResult: ^VARIANT) -> HRESULT,
	msReportSafeUrl: proc "system" (this: ^IShellUIHelper5) -> HRESULT,
	msSiteModeRefreshBadge: proc "system" (this: ^IShellUIHelper5) -> HRESULT,
	msSiteModeClearBadge: proc "system" (this: ^IShellUIHelper5) -> HRESULT,
	msDiagnoseConnectionUILess: proc "system" (this: ^IShellUIHelper5) -> HRESULT,
	msLaunchNetworkClientHelp: proc "system" (this: ^IShellUIHelper5) -> HRESULT,
	msChangeDefaultBrowser: proc "system" (this: ^IShellUIHelper5, fChange: VARIANT_BOOL) -> HRESULT,
}
IID_IShellUIHelper5 :: GUID{0xA2A08B09, 0x103D, 0x4D3F, {0xB9, 0x1C, 0xEA, 0x45, 0x5C, 0xA8, 0x2E, 0xFA}}

IShellUIHelper6 :: struct #raw_union {
	#subtype IShellUIHelper5: IShellUIHelper5,
	using Vtbl: ^IShellUIHelper6_Vtbl,
}
IShellUIHelper6_Vtbl :: struct {
	using IShellUIHelper5_Vtbl: IShellUIHelper5_Vtbl,
	msStopPeriodicTileUpdate: proc "system" (this: ^IShellUIHelper6) -> HRESULT,
	msStartPeriodicTileUpdate: proc "system" (
		this: ^IShellUIHelper6,
		pollingUris: VARIANT,
		startTime: VARIANT,
		uiUpdateRecurrence: VARIANT,
	) -> HRESULT,
	msStartPeriodicTileUpdateBatch: proc "system" (
		this: ^IShellUIHelper6,
		pollingUris: VARIANT,
		startTime: VARIANT,
		uiUpdateRecurrence: VARIANT,
	) -> HRESULT,
	msClearTile: proc "system" (this: ^IShellUIHelper6) -> HRESULT,
	msEnableTileNotificationQueue: proc "system" (this: ^IShellUIHelper6, fChange: VARIANT_BOOL) -> HRESULT,
	msPinnedSiteState: proc "system" (this: ^IShellUIHelper6, pvarSiteState: ^VARIANT) -> HRESULT,
	msEnableTileNotificationQueueForSquare150x150: proc "system" (this: ^IShellUIHelper6, fChange: VARIANT_BOOL) -> HRESULT,
	msEnableTileNotificationQueueForWide310x150: proc "system" (this: ^IShellUIHelper6, fChange: VARIANT_BOOL) -> HRESULT,
	msEnableTileNotificationQueueForSquare310x310: proc "system" (this: ^IShellUIHelper6, fChange: VARIANT_BOOL) -> HRESULT,
	msScheduledTileNotification: proc "system" (
		this: ^IShellUIHelper6,
		bstrNotificationXml: BSTR,
		bstrNotificationId: BSTR,
		bstrNotificationTag: BSTR,
		startTime: VARIANT,
		expirationTime: VARIANT,
	) -> HRESULT,
	msRemoveScheduledTileNotification: proc "system" (this: ^IShellUIHelper6, bstrNotificationId: BSTR) -> HRESULT,
	msStartPeriodicBadgeUpdate: proc "system" (
		this: ^IShellUIHelper6,
		pollingUri: BSTR,
		startTime: VARIANT,
		uiUpdateRecurrence: VARIANT,
	) -> HRESULT,
	msStopPeriodicBadgeUpdate: proc "system" (this: ^IShellUIHelper6) -> HRESULT,
	msLaunchInternetOptions: proc "system" (this: ^IShellUIHelper6) -> HRESULT,
}
IID_IShellUIHelper6 :: GUID{0x987A573E, 0x46EE, 0x4E89, {0x96, 0xAB, 0xDD, 0xF7, 0xF8, 0xFD, 0xC9, 0x8C}}

IShellUIHelper7 :: struct #raw_union {
	#subtype IShellUIHelper6: IShellUIHelper6,
	using Vtbl: ^IShellUIHelper7_Vtbl,
}
IShellUIHelper7_Vtbl :: struct {
	using IShellUIHelper6_Vtbl: IShellUIHelper6_Vtbl,
	SetExperimentalFlag: proc "system" (this: ^IShellUIHelper7, bstrFlagString: BSTR, vfFlag: VARIANT_BOOL) -> HRESULT,
	GetExperimentalFlag: proc "system" (this: ^IShellUIHelper7, bstrFlagString: BSTR, vfFlag: ^VARIANT_BOOL) -> HRESULT,
	SetExperimentalValue: proc "system" (this: ^IShellUIHelper7, bstrValueString: BSTR, dwValue: u32) -> HRESULT,
	GetExperimentalValue: proc "system" (this: ^IShellUIHelper7, bstrValueString: BSTR, pdwValue: ^u32) -> HRESULT,
	ResetAllExperimentalFlagsAndValues: proc "system" (this: ^IShellUIHelper7) -> HRESULT,
	GetNeedIEAutoLaunchFlag: proc "system" (this: ^IShellUIHelper7, bstrUrl: BSTR, flag: ^VARIANT_BOOL) -> HRESULT,
	SetNeedIEAutoLaunchFlag: proc "system" (this: ^IShellUIHelper7, bstrUrl: BSTR, flag: VARIANT_BOOL) -> HRESULT,
	HasNeedIEAutoLaunchFlag: proc "system" (this: ^IShellUIHelper7, bstrUrl: BSTR, exists: ^VARIANT_BOOL) -> HRESULT,
	LaunchIE: proc "system" (this: ^IShellUIHelper7, bstrUrl: BSTR, automated: VARIANT_BOOL) -> HRESULT,
}
IID_IShellUIHelper7 :: GUID{0x60E567C8, 0x9573, 0x4AB2, {0xA2, 0x64, 0x63, 0x7C, 0x6C, 0x16, 0x1C, 0xB1}}

IShellUIHelper8 :: struct #raw_union {
	#subtype IShellUIHelper7: IShellUIHelper7,
	using Vtbl: ^IShellUIHelper8_Vtbl,
}
IShellUIHelper8_Vtbl :: struct {
	using IShellUIHelper7_Vtbl: IShellUIHelper7_Vtbl,
	GetCVListData: proc "system" (this: ^IShellUIHelper8, pbstrResult: ^BSTR) -> HRESULT,
	GetCVListLocalData: proc "system" (this: ^IShellUIHelper8, pbstrResult: ^BSTR) -> HRESULT,
	GetEMIEListData: proc "system" (this: ^IShellUIHelper8, pbstrResult: ^BSTR) -> HRESULT,
	GetEMIEListLocalData: proc "system" (this: ^IShellUIHelper8, pbstrResult: ^BSTR) -> HRESULT,
	OpenFavoritesPane: proc "system" (this: ^IShellUIHelper8) -> HRESULT,
	OpenFavoritesSettings: proc "system" (this: ^IShellUIHelper8) -> HRESULT,
	LaunchInHVSI: proc "system" (this: ^IShellUIHelper8, bstrUrl: BSTR) -> HRESULT,
}
IID_IShellUIHelper8 :: GUID{0x66DEBCF2, 0x05B0, 0x4F07, {0xB4, 0x9B, 0xB9, 0x62, 0x41, 0xA6, 0x5D, 0xB2}}

IShellUIHelper9 :: struct #raw_union {
	#subtype IShellUIHelper8: IShellUIHelper8,
	using Vtbl: ^IShellUIHelper9_Vtbl,
}
IShellUIHelper9_Vtbl :: struct {
	using IShellUIHelper8_Vtbl: IShellUIHelper8_Vtbl,
	GetOSSku: proc "system" (this: ^IShellUIHelper9, pdwResult: ^u32) -> HRESULT,
}
IID_IShellUIHelper9 :: GUID{0x6CDF73B0, 0x7F2F, 0x451F, {0xBC, 0x0F, 0x63, 0xE0, 0xF3, 0x28, 0x4E, 0x54}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellview ]]
IShellView :: struct #raw_union {
	#subtype IOleWindow: IOleWindow,
	using Vtbl: ^IShellView_Vtbl,
}
IShellView_Vtbl :: struct {
	using IOleWindow_Vtbl: IOleWindow_Vtbl,
	TranslateAccelerator: proc "system" (this: ^IShellView, pmsg: ^MSG) -> HRESULT,
	EnableModeless: proc "system" (this: ^IShellView, fEnable: BOOL) -> HRESULT,
	UIActivate: proc "system" (this: ^IShellView, uState: u32) -> HRESULT,
	Refresh: proc "system" (this: ^IShellView) -> HRESULT,
	CreateViewWindow: proc "system" (
		this: ^IShellView,
		psvPrevious: ^IShellView,
		pfs: ^FOLDERSETTINGS,
		psb: ^IShellBrowser,
		prcView: ^RECT,
		phWnd: ^HWND,
	) -> HRESULT,
	DestroyViewWindow: proc "system" (this: ^IShellView) -> HRESULT,
	GetCurrentInfo: proc "system" (this: ^IShellView, pfs: ^FOLDERSETTINGS) -> HRESULT,
	AddPropertySheetPages: proc "system" (
		this: ^IShellView,
		dwReserved: u32,
		pfn: LPFNSVADDPROPSHEETPAGE,
		lparam: LPARAM,
	) -> HRESULT,
	SaveViewState: proc "system" (this: ^IShellView) -> HRESULT,
	SelectItem: proc "system" (this: ^IShellView, pidlItem: ^ITEMIDLIST, uFlags: u32) -> HRESULT,
	GetItemObject: proc "system" (this: ^IShellView, uItem: SVGIO, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
}
IID_IShellView :: GUID{0x000214E3, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellview2 ]]
IShellView2 :: struct #raw_union {
	#subtype IShellView: IShellView,
	using Vtbl: ^IShellView2_Vtbl,
}
IShellView2_Vtbl :: struct {
	using IShellView_Vtbl: IShellView_Vtbl,
	GetView: proc "system" (this: ^IShellView2, pvid: ^GUID, uView: u32) -> HRESULT,
	CreateViewWindow2: proc "system" (this: ^IShellView2, lpParams: ^SV2CVW2_PARAMS) -> HRESULT,
	HandleRename: proc "system" (this: ^IShellView2, pidlNew: ^ITEMIDLIST) -> HRESULT,
	SelectAndPositionItem: proc "system" (this: ^IShellView2, pidlItem: ^ITEMIDLIST, uFlags: u32, ppt: ^POINT) -> HRESULT,
}
IID_IShellView2 :: GUID{0x88E39E80, 0x3578, 0x11CF, {0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ishellview3 ]]
IShellView3 :: struct #raw_union {
	#subtype IShellView2: IShellView2,
	using Vtbl: ^IShellView3_Vtbl,
}
IShellView3_Vtbl :: struct {
	using IShellView2_Vtbl: IShellView2_Vtbl,
	CreateViewWindow3: proc "system" (
		this: ^IShellView3,
		psbOwner: ^IShellBrowser,
		psvPrev: ^IShellView,
		dwViewFlags: u32,
		dwMask: FOLDERFLAGS,
		dwFlags: FOLDERFLAGS,
		fvMode: FOLDERVIEWMODE,
		#by_ptr pvid: GUID,
		#by_ptr prcView: RECT,
		phwndView: ^HWND,
	) -> HRESULT,
}
IID_IShellView3 :: GUID{0xEC39FA88, 0xF8AF, 0x41C5, {0x84, 0x21, 0x38, 0xBE, 0xD2, 0x8F, 0x46, 0x73}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/exdisp/nn-exdisp-ishellwindows ]]
IShellWindows :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IShellWindows_Vtbl,
}
IShellWindows_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^IShellWindows, Count: ^i32) -> HRESULT,
	Item: proc "system" (this: ^IShellWindows, index: VARIANT, Folder: ^^IDispatch) -> HRESULT,
	_NewEnum: proc "system" (this: ^IShellWindows, ppunk: ^^IUnknown) -> HRESULT,
	Register: proc "system" (
		this: ^IShellWindows,
		pid: ^IDispatch,
		hwnd: i32,
		swClass: ShellWindowTypeConstants,
		plCookie: ^i32,
	) -> HRESULT,
	RegisterPending: proc "system" (
		this: ^IShellWindows,
		lThreadId: i32,
		pvarloc: ^VARIANT,
		pvarlocRoot: ^VARIANT,
		swClass: ShellWindowTypeConstants,
		plCookie: ^i32,
	) -> HRESULT,
	Revoke: proc "system" (this: ^IShellWindows, lCookie: i32) -> HRESULT,
	OnNavigate: proc "system" (this: ^IShellWindows, lCookie: i32, pvarLoc: ^VARIANT) -> HRESULT,
	OnActivated: proc "system" (this: ^IShellWindows, lCookie: i32, fActive: VARIANT_BOOL) -> HRESULT,
	FindWindowSW: proc "system" (
		this: ^IShellWindows,
		pvarLoc: ^VARIANT,
		pvarLocRoot: ^VARIANT,
		swClass: ShellWindowTypeConstants,
		phwnd: ^i32,
		swfwOptions: ShellWindowFindWindowOptions,
		ppdispOut: ^^IDispatch,
	) -> HRESULT,
	OnCreated: proc "system" (this: ^IShellWindows, lCookie: i32, punk: ^IUnknown) -> HRESULT,
	ProcessAttachDetach: proc "system" (this: ^IShellWindows, fAttach: VARIANT_BOOL) -> HRESULT,
}
IID_IShellWindows :: GUID{0x85CB6900, 0x4D95, 0x11CF, {0x96, 0x0C, 0x00, 0x80, 0xC7, 0xF4, 0xEE, 0x85}}

ISortColumnArray :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISortColumnArray_Vtbl,
}
ISortColumnArray_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCount: proc "system" (this: ^ISortColumnArray, columnCount: ^u32) -> HRESULT,
	GetAt: proc "system" (this: ^ISortColumnArray, index: u32, sortcolumn: ^SORTCOLUMN) -> HRESULT,
	GetSortType: proc "system" (this: ^ISortColumnArray, type: ^SORT_ORDER_TYPE) -> HRESULT,
}
IID_ISortColumnArray :: GUID{0x6DFC60FB, 0xF2E9, 0x459B, {0xBE, 0xB5, 0x28, 0x8F, 0x1A, 0x7C, 0x7D, 0x54}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-istartmenupinnedlist ]]
IStartMenuPinnedList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IStartMenuPinnedList_Vtbl,
}
IStartMenuPinnedList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RemoveFromList: proc "system" (this: ^IStartMenuPinnedList, pitem: ^IShellItem) -> HRESULT,
}
IID_IStartMenuPinnedList :: GUID{0x4CD19ADA, 0x25A5, 0x4A32, {0xB3, 0xB7, 0x34, 0x7B, 0xEE, 0x5B, 0xE3, 0x6B}}

IStorageProviderBanners :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IStorageProviderBanners_Vtbl,
}
IStorageProviderBanners_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetBanner: proc "system" (
		this: ^IStorageProviderBanners,
		providerIdentity: PWSTR,
		subscriptionId: PWSTR,
		contentId: PWSTR,
	) -> HRESULT,
	ClearBanner: proc "system" (
		this: ^IStorageProviderBanners,
		providerIdentity: PWSTR,
		subscriptionId: PWSTR,
	) -> HRESULT,
	ClearAllBanners: proc "system" (this: ^IStorageProviderBanners, providerIdentity: PWSTR) -> HRESULT,
	GetBanner: proc "system" (
		this: ^IStorageProviderBanners,
		providerIdentity: PWSTR,
		subscriptionId: PWSTR,
		contentId: ^PWSTR,
	) -> HRESULT,
}
IID_IStorageProviderBanners :: GUID{0x5EFB46D7, 0x47C0, 0x4B68, {0xAC, 0xDA, 0xDE, 0xD4, 0x7C, 0x90, 0xEC, 0x91}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/nn-shobjidl-istorageprovidercopyhook ]]
IStorageProviderCopyHook :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IStorageProviderCopyHook_Vtbl,
}
IStorageProviderCopyHook_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CopyCallback: proc "system" (
		this: ^IStorageProviderCopyHook,
		hwnd: HWND,
		operation: u32,
		flags: u32,
		srcFile: PWSTR,
		srcAttribs: u32,
		destFile: PWSTR,
		destAttribs: u32,
		result: ^u32,
	) -> HRESULT,
}
IID_IStorageProviderCopyHook :: GUID{0x7BF992A9, 0xAF7A, 0x4DBA, {0xB2, 0xE5, 0x4D, 0x08, 0x0B, 0x1E, 0xCB, 0xC6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/storageprovider/nn-storageprovider-istorageproviderhandler ]]
IStorageProviderHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IStorageProviderHandler_Vtbl,
}
IStorageProviderHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetPropertyHandlerFromPath: proc "system" (
		this: ^IStorageProviderHandler,
		path: PWSTR,
		propertyHandler: ^^IStorageProviderPropertyHandler,
	) -> HRESULT,
	GetPropertyHandlerFromUri: proc "system" (
		this: ^IStorageProviderHandler,
		uri: PWSTR,
		propertyHandler: ^^IStorageProviderPropertyHandler,
	) -> HRESULT,
	GetPropertyHandlerFromFileId: proc "system" (
		this: ^IStorageProviderHandler,
		fileId: PWSTR,
		propertyHandler: ^^IStorageProviderPropertyHandler,
	) -> HRESULT,
}
IID_IStorageProviderHandler :: GUID{0x162C6FB5, 0x44D3, 0x435B, {0x90, 0x3D, 0xE6, 0x13, 0xFA, 0x09, 0x3F, 0xB5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/storageprovider/nn-storageprovider-istorageproviderpropertyhandler ]]
IStorageProviderPropertyHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IStorageProviderPropertyHandler_Vtbl,
}
IStorageProviderPropertyHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RetrieveProperties: proc "system" (
		this: ^IStorageProviderPropertyHandler,
		propertiesToRetrieve: [^]PROPERTYKEY,
		propertiesToRetrieveCount: u32,
		retrievedProperties: ^^IPropertyStore,
	) -> HRESULT,
	SaveProperties: proc "system" (
		this: ^IStorageProviderPropertyHandler,
		propertiesToSave: ^IPropertyStore,
	) -> HRESULT,
}
IID_IStorageProviderPropertyHandler :: GUID{0x301DFBE5, 0x524C, 0x4B0F, {0x8B, 0x2D, 0x21, 0xC4, 0x0B, 0x3A, 0x29, 0x88}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-istreamasync ]]
IStreamAsync :: struct #raw_union {
	#subtype IStream: IStream,
	using Vtbl: ^IStreamAsync_Vtbl,
}
IStreamAsync_Vtbl :: struct {
	using IStream_Vtbl: IStream_Vtbl,
	ReadAsync: proc "system" (this: ^IStreamAsync, pv: rawptr, cb: u32, pcbRead: ^u32, lpOverlapped: ^OVERLAPPED) -> HRESULT,
	WriteAsync: proc "system" (
		this: ^IStreamAsync,
		lpBuffer: rawptr,
		cb: u32,
		pcbWritten: ^u32,
		lpOverlapped: ^OVERLAPPED,
	) -> HRESULT,
	OverlappedResult: proc "system" (
		this: ^IStreamAsync,
		lpOverlapped: ^OVERLAPPED,
		lpNumberOfBytesTransferred: ^u32,
		bWait: BOOL,
	) -> HRESULT,
	CancelIo: proc "system" (this: ^IStreamAsync) -> HRESULT,
}
IID_IStreamAsync :: GUID{0xFE0B6665, 0xE0CA, 0x49B9, {0xA1, 0x78, 0x2B, 0x5C, 0xB4, 0x8D, 0x92, 0xA5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-istreamunbufferedinfo ]]
IStreamUnbufferedInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IStreamUnbufferedInfo_Vtbl,
}
IStreamUnbufferedInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetSectorSize: proc "system" (this: ^IStreamUnbufferedInfo, pcbSectorSize: ^u32) -> HRESULT,
}
IID_IStreamUnbufferedInfo :: GUID{0x8A68FDDA, 0x1FDC, 0x4C20, {0x8C, 0xEB, 0x41, 0x66, 0x43, 0xB5, 0xA6, 0x25}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-isuspensiondependencymanager ]]
ISuspensionDependencyManager :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISuspensionDependencyManager_Vtbl,
}
ISuspensionDependencyManager_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RegisterAsChild: proc "system" (this: ^ISuspensionDependencyManager, processHandle: HANDLE) -> HRESULT,
	GroupChildWithParent: proc "system" (this: ^ISuspensionDependencyManager, childProcessHandle: HANDLE) -> HRESULT,
	UngroupChildFromParent: proc "system" (this: ^ISuspensionDependencyManager, childProcessHandle: HANDLE) -> HRESULT,
}
IID_ISuspensionDependencyManager :: GUID{0x52B83A42, 0x2543, 0x416A, {0x81, 0xD9, 0xC0, 0xDE, 0x79, 0x69, 0xC8, 0xB3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflict ]]
ISyncMgrConflict :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrConflict_Vtbl,
}
ISyncMgrConflict_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetProperty: proc "system" (
		this: ^ISyncMgrConflict,
		#by_ptr propkey: PROPERTYKEY,
		ppropvar: ^PROPVARIANT,
	) -> HRESULT,
	GetConflictIdInfo: proc "system" (this: ^ISyncMgrConflict, pConflictIdInfo: ^SYNCMGR_CONFLICT_ID_INFO) -> HRESULT,
	GetItemsArray: proc "system" (this: ^ISyncMgrConflict, ppArray: ^^ISyncMgrConflictItems) -> HRESULT,
	Resolve: proc "system" (this: ^ISyncMgrConflict, pResolveInfo: ^ISyncMgrConflictResolveInfo) -> HRESULT,
	GetResolutionHandler: proc "system" (this: ^ISyncMgrConflict, #by_ptr riid: GUID, ppvResolutionHandler: rawptr) -> HRESULT,
}
IID_ISyncMgrConflict :: GUID{0x9C204249, 0xC443, 0x4BA4, {0x85, 0xED, 0xC9, 0x72, 0x68, 0x1D, 0xB1, 0x37}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictfolder ]]
ISyncMgrConflictFolder :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrConflictFolder_Vtbl,
}
ISyncMgrConflictFolder_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetConflictIDList: proc "system" (
		this: ^ISyncMgrConflictFolder,
		pConflict: ^ISyncMgrConflict,
		ppidlConflict: ^ITEMIDLIST,
	) -> HRESULT,
}
IID_ISyncMgrConflictFolder :: GUID{0x59287F5E, 0xBC81, 0x4FCA, {0xA7, 0xF1, 0xE5, 0xA8, 0xEC, 0xDB, 0x1D, 0x69}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictitems ]]
ISyncMgrConflictItems :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrConflictItems_Vtbl,
}
ISyncMgrConflictItems_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCount: proc "system" (this: ^ISyncMgrConflictItems, pCount: ^u32) -> HRESULT,
	GetItem: proc "system" (
		this: ^ISyncMgrConflictItems,
		iIndex: u32,
		pItemInfo: ^CONFIRM_CONFLICT_ITEM,
	) -> HRESULT,
}
IID_ISyncMgrConflictItems :: GUID{0x9C7EAD52, 0x8023, 0x4936, {0xA4, 0xDB, 0xD2, 0xA9, 0xA9, 0x9E, 0x43, 0x6A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictpresenter ]]
ISyncMgrConflictPresenter :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrConflictPresenter_Vtbl,
}
ISyncMgrConflictPresenter_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	PresentConflict: proc "system" (
		this: ^ISyncMgrConflictPresenter,
		pConflict: ^ISyncMgrConflict,
		pResolveInfo: ^ISyncMgrConflictResolveInfo,
	) -> HRESULT,
}
IID_ISyncMgrConflictPresenter :: GUID{0x0B4F5353, 0xFD2B, 0x42CD, {0x87, 0x63, 0x47, 0x79, 0xF2, 0xD5, 0x08, 0xA3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictresolutionitems ]]
ISyncMgrConflictResolutionItems :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrConflictResolutionItems_Vtbl,
}
ISyncMgrConflictResolutionItems_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCount: proc "system" (this: ^ISyncMgrConflictResolutionItems, pCount: ^u32) -> HRESULT,
	GetItem: proc "system" (
		this: ^ISyncMgrConflictResolutionItems,
		iIndex: u32,
		pItemInfo: ^CONFIRM_CONFLICT_RESULT_INFO,
	) -> HRESULT,
}
IID_ISyncMgrConflictResolutionItems :: GUID{0x458725B9, 0x129D, 0x4135, {0xA9, 0x98, 0x9C, 0xEA, 0xFE, 0xC2, 0x70, 0x07}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictresolveinfo ]]
ISyncMgrConflictResolveInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrConflictResolveInfo_Vtbl,
}
ISyncMgrConflictResolveInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetIterationInfo: proc "system" (
		this: ^ISyncMgrConflictResolveInfo,
		pnCurrentConflict: ^u32,
		pcConflicts: ^u32,
		pcRemainingForApplyToAll: ^u32,
	) -> HRESULT,
	GetPresenterNextStep: proc "system" (
		this: ^ISyncMgrConflictResolveInfo,
		pnPresenterNextStep: ^SYNCMGR_PRESENTER_NEXT_STEP,
	) -> HRESULT,
	GetPresenterChoice: proc "system" (
		this: ^ISyncMgrConflictResolveInfo,
		pnPresenterChoice: ^SYNCMGR_PRESENTER_CHOICE,
		pfApplyToAll: ^BOOL,
	) -> HRESULT,
	GetItemChoiceCount: proc "system" (this: ^ISyncMgrConflictResolveInfo, pcChoices: ^u32) -> HRESULT,
	GetItemChoice: proc "system" (this: ^ISyncMgrConflictResolveInfo, iChoice: u32, piChoiceIndex: ^u32) -> HRESULT,
	SetPresenterNextStep: proc "system" (
		this: ^ISyncMgrConflictResolveInfo,
		nPresenterNextStep: SYNCMGR_PRESENTER_NEXT_STEP,
	) -> HRESULT,
	SetPresenterChoice: proc "system" (
		this: ^ISyncMgrConflictResolveInfo,
		nPresenterChoice: SYNCMGR_PRESENTER_CHOICE,
		fApplyToAll: BOOL,
	) -> HRESULT,
	SetItemChoices: proc "system" (
		this: ^ISyncMgrConflictResolveInfo,
		prgiConflictItemIndexes: ^u32,
		cChoices: u32,
	) -> HRESULT,
}
IID_ISyncMgrConflictResolveInfo :: GUID{0xC405A219, 0x25A2, 0x442E, {0x87, 0x43, 0xB8, 0x45, 0xA2, 0xCE, 0xE9, 0x3F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrconflictstore ]]
ISyncMgrConflictStore :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrConflictStore_Vtbl,
}
ISyncMgrConflictStore_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	EnumConflicts: proc "system" (
		this: ^ISyncMgrConflictStore,
		pszHandlerID: PWSTR,
		pszItemID: PWSTR,
		ppEnum: ^^IEnumSyncMgrConflict,
	) -> HRESULT,
	BindToConflict: proc "system" (
		this: ^ISyncMgrConflictStore,
		#by_ptr pConflictIdInfo: SYNCMGR_CONFLICT_ID_INFO,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	RemoveConflicts: proc "system" (
		this: ^ISyncMgrConflictStore,
		rgConflictIdInfo: [^]SYNCMGR_CONFLICT_ID_INFO,
		cConflicts: u32,
	) -> HRESULT,
	GetCount: proc "system" (
		this: ^ISyncMgrConflictStore,
		pszHandlerID: PWSTR,
		pszItemID: PWSTR,
		pnConflicts: ^u32,
	) -> HRESULT,
}
IID_ISyncMgrConflictStore :: GUID{0xCF8FC579, 0xC396, 0x4774, {0x85, 0xF1, 0xD9, 0x08, 0xA8, 0x31, 0x15, 0x6E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrcontrol ]]
ISyncMgrControl :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrControl_Vtbl,
}
ISyncMgrControl_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	StartHandlerSync: proc "system" (
		this: ^ISyncMgrControl,
		pszHandlerID: PWSTR,
		hwndOwner: HWND,
		punk: ^IUnknown,
		nSyncControlFlags: SYNCMGR_SYNC_CONTROL_FLAGS,
		pResult: ^ISyncMgrSyncResult,
	) -> HRESULT,
	StartItemSync: proc "system" (
		this: ^ISyncMgrControl,
		pszHandlerID: PWSTR,
		ppszItemIDs: [^]PWSTR,
		cItems: u32,
		hwndOwner: HWND,
		punk: ^IUnknown,
		nSyncControlFlags: SYNCMGR_SYNC_CONTROL_FLAGS,
		pResult: ^ISyncMgrSyncResult,
	) -> HRESULT,
	StartSyncAll: proc "system" (this: ^ISyncMgrControl, hwndOwner: HWND) -> HRESULT,
	StopHandlerSync: proc "system" (this: ^ISyncMgrControl, pszHandlerID: PWSTR) -> HRESULT,
	StopItemSync: proc "system" (
		this: ^ISyncMgrControl,
		pszHandlerID: PWSTR,
		ppszItemIDs: [^]PWSTR,
		cItems: u32,
	) -> HRESULT,
	StopSyncAll: proc "system" (this: ^ISyncMgrControl) -> HRESULT,
	UpdateHandlerCollection: proc "system" (
		this: ^ISyncMgrControl,
		#by_ptr rclsidCollectionID: GUID,
		nControlFlags: SYNCMGR_CONTROL_FLAGS,
	) -> HRESULT,
	UpdateHandler: proc "system" (
		this: ^ISyncMgrControl,
		pszHandlerID: PWSTR,
		nControlFlags: SYNCMGR_CONTROL_FLAGS,
	) -> HRESULT,
	UpdateItem: proc "system" (
		this: ^ISyncMgrControl,
		pszHandlerID: PWSTR,
		pszItemID: PWSTR,
		nControlFlags: SYNCMGR_CONTROL_FLAGS,
	) -> HRESULT,
	UpdateEvents: proc "system" (
		this: ^ISyncMgrControl,
		pszHandlerID: PWSTR,
		pszItemID: PWSTR,
		nControlFlags: SYNCMGR_CONTROL_FLAGS,
	) -> HRESULT,
	UpdateConflict: proc "system" (
		this: ^ISyncMgrControl,
		pszHandlerID: PWSTR,
		pszItemID: PWSTR,
		pConflict: ^ISyncMgrConflict,
		nReason: SYNCMGR_UPDATE_REASON,
	) -> HRESULT,
	UpdateConflicts: proc "system" (
		this: ^ISyncMgrControl,
		pszHandlerID: PWSTR,
		pszItemID: PWSTR,
		nControlFlags: SYNCMGR_CONTROL_FLAGS,
	) -> HRESULT,
	ActivateHandler: proc "system" (
		this: ^ISyncMgrControl,
		fActivate: BOOL,
		pszHandlerID: PWSTR,
		hwndOwner: HWND,
		nControlFlags: SYNCMGR_CONTROL_FLAGS,
	) -> HRESULT,
	EnableHandler: proc "system" (
		this: ^ISyncMgrControl,
		fEnable: BOOL,
		pszHandlerID: PWSTR,
		hwndOwner: HWND,
		nControlFlags: SYNCMGR_CONTROL_FLAGS,
	) -> HRESULT,
	EnableItem: proc "system" (
		this: ^ISyncMgrControl,
		fEnable: BOOL,
		pszHandlerID: PWSTR,
		pszItemID: PWSTR,
		hwndOwner: HWND,
		nControlFlags: SYNCMGR_CONTROL_FLAGS,
	) -> HRESULT,
}
IID_ISyncMgrControl :: GUID{0x9B63616C, 0x36B2, 0x46BC, {0x95, 0x9F, 0xC1, 0x59, 0x39, 0x52, 0xD1, 0x9B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/nn-mobsync-isyncmgrenumitems ]]
ISyncMgrEnumItems :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrEnumItems_Vtbl,
}
ISyncMgrEnumItems_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^ISyncMgrEnumItems, celt: u32, rgelt: [^]SYNCMGRITEM, pceltFetched: ^u32) -> HRESULT,
	Skip: proc "system" (this: ^ISyncMgrEnumItems, celt: u32) -> HRESULT,
	Reset: proc "system" (this: ^ISyncMgrEnumItems) -> HRESULT,
	Clone: proc "system" (this: ^ISyncMgrEnumItems, ppenum: ^^ISyncMgrEnumItems) -> HRESULT,
}
IID_ISyncMgrEnumItems :: GUID{0x6295DF2A, 0x35EE, 0x11D1, {0x87, 0x07, 0x00, 0xC0, 0x4F, 0xD9, 0x33, 0x27}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrevent ]]
ISyncMgrEvent :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrEvent_Vtbl,
}
ISyncMgrEvent_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetEventID: proc "system" (this: ^ISyncMgrEvent, pguidEventID: ^GUID) -> HRESULT,
	GetHandlerID: proc "system" (this: ^ISyncMgrEvent, ppszHandlerID: ^PWSTR) -> HRESULT,
	GetItemID: proc "system" (this: ^ISyncMgrEvent, ppszItemID: ^PWSTR) -> HRESULT,
	GetLevel: proc "system" (this: ^ISyncMgrEvent, pnLevel: ^SYNCMGR_EVENT_LEVEL) -> HRESULT,
	GetFlags: proc "system" (this: ^ISyncMgrEvent, pnFlags: ^SYNCMGR_EVENT_FLAGS) -> HRESULT,
	GetTime: proc "system" (this: ^ISyncMgrEvent, pfCreationTime: ^FILETIME) -> HRESULT,
	GetName: proc "system" (this: ^ISyncMgrEvent, ppszName: ^PWSTR) -> HRESULT,
	GetDescription: proc "system" (this: ^ISyncMgrEvent, ppszDescription: ^PWSTR) -> HRESULT,
	GetLinkText: proc "system" (this: ^ISyncMgrEvent, ppszLinkText: ^PWSTR) -> HRESULT,
	GetLinkReference: proc "system" (this: ^ISyncMgrEvent, ppszLinkReference: ^PWSTR) -> HRESULT,
	GetContext: proc "system" (this: ^ISyncMgrEvent, ppszContext: ^PWSTR) -> HRESULT,
}
IID_ISyncMgrEvent :: GUID{0xFEE0EF8B, 0x46BD, 0x4DB4, {0xB7, 0xE6, 0xFF, 0x2C, 0x68, 0x73, 0x13, 0xBC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgreventlinkuioperation ]]
ISyncMgrEventLinkUIOperation :: struct #raw_union {
	#subtype ISyncMgrUIOperation: ISyncMgrUIOperation,
	using Vtbl: ^ISyncMgrEventLinkUIOperation_Vtbl,
}
ISyncMgrEventLinkUIOperation_Vtbl :: struct {
	using ISyncMgrUIOperation_Vtbl: ISyncMgrUIOperation_Vtbl,
	Init: proc "system" (
		this: ^ISyncMgrEventLinkUIOperation,
		#by_ptr rguidEventID: GUID,
		pEvent: ^ISyncMgrEvent,
	) -> HRESULT,
}
IID_ISyncMgrEventLinkUIOperation :: GUID{0x64522E52, 0x848B, 0x4015, {0x89, 0xCE, 0x5A, 0x36, 0xF0, 0x0B, 0x94, 0xFF}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgreventstore ]]
ISyncMgrEventStore :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrEventStore_Vtbl,
}
ISyncMgrEventStore_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetEventEnumerator: proc "system" (this: ^ISyncMgrEventStore, ppenum: ^^IEnumSyncMgrEvents) -> HRESULT,
	GetEventCount: proc "system" (this: ^ISyncMgrEventStore, pcEvents: ^u32) -> HRESULT,
	GetEvent: proc "system" (
		this: ^ISyncMgrEventStore,
		#by_ptr rguidEventID: GUID,
		ppEvent: ^^ISyncMgrEvent,
	) -> HRESULT,
	RemoveEvent: proc "system" (this: ^ISyncMgrEventStore, pguidEventIDs: [^]GUID, cEvents: u32) -> HRESULT,
}
IID_ISyncMgrEventStore :: GUID{0x37E412F9, 0x016E, 0x44C2, {0x81, 0xFF, 0xDB, 0x3A, 0xDD, 0x77, 0x42, 0x66}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrhandler ]]
ISyncMgrHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrHandler_Vtbl,
}
ISyncMgrHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetName: proc "system" (this: ^ISyncMgrHandler, ppszName: ^PWSTR) -> HRESULT,
	GetHandlerInfo: proc "system" (this: ^ISyncMgrHandler, ppHandlerInfo: ^^ISyncMgrHandlerInfo) -> HRESULT,
	GetObject: proc "system" (
		this: ^ISyncMgrHandler,
		#by_ptr rguidObjectID: GUID,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetCapabilities: proc "system" (this: ^ISyncMgrHandler, pmCapabilities: ^SYNCMGR_HANDLER_CAPABILITIES) -> HRESULT,
	GetPolicies: proc "system" (this: ^ISyncMgrHandler, pmPolicies: ^SYNCMGR_HANDLER_POLICIES) -> HRESULT,
	Activate: proc "system" (this: ^ISyncMgrHandler, fActivate: BOOL) -> HRESULT,
	Enable: proc "system" (this: ^ISyncMgrHandler, fEnable: BOOL) -> HRESULT,
	Synchronize: proc "system" (
		this: ^ISyncMgrHandler,
		ppszItemIDs: [^]PWSTR,
		cItems: u32,
		hwndOwner: HWND,
		pSessionCreator: ^ISyncMgrSessionCreator,
		punk: ^IUnknown,
	) -> HRESULT,
}
IID_ISyncMgrHandler :: GUID{0x04EC2E43, 0xAC77, 0x49F9, {0x9B, 0x98, 0x03, 0x07, 0xEF, 0x7A, 0x72, 0xA2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrhandlercollection ]]
ISyncMgrHandlerCollection :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrHandlerCollection_Vtbl,
}
ISyncMgrHandlerCollection_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetHandlerEnumerator: proc "system" (this: ^ISyncMgrHandlerCollection, ppenum: ^^IEnumString) -> HRESULT,
	BindToHandler: proc "system" (
		this: ^ISyncMgrHandlerCollection,
		pszHandlerID: PWSTR,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
}
IID_ISyncMgrHandlerCollection :: GUID{0xA7F337A3, 0xD20B, 0x45CB, {0x9E, 0xD7, 0x87, 0xD0, 0x94, 0xCA, 0x50, 0x45}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrhandlerinfo ]]
ISyncMgrHandlerInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrHandlerInfo_Vtbl,
}
ISyncMgrHandlerInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetType: proc "system" (this: ^ISyncMgrHandlerInfo, pnType: ^SYNCMGR_HANDLER_TYPE) -> HRESULT,
	GetTypeLabel: proc "system" (this: ^ISyncMgrHandlerInfo, ppszTypeLabel: ^PWSTR) -> HRESULT,
	GetComment: proc "system" (this: ^ISyncMgrHandlerInfo, ppszComment: ^PWSTR) -> HRESULT,
	GetLastSyncTime: proc "system" (this: ^ISyncMgrHandlerInfo, pftLastSync: ^FILETIME) -> HRESULT,
	IsActive: proc "system" (this: ^ISyncMgrHandlerInfo) -> HRESULT,
	IsEnabled: proc "system" (this: ^ISyncMgrHandlerInfo) -> HRESULT,
	IsConnected: proc "system" (this: ^ISyncMgrHandlerInfo) -> HRESULT,
}
IID_ISyncMgrHandlerInfo :: GUID{0x4FF1D798, 0xECF7, 0x4524, {0xAA, 0x81, 0x1E, 0x36, 0x2A, 0x0A, 0xEF, 0x3A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/nn-mobsync-isyncmgrregister ]]
ISyncMgrRegister :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrRegister_Vtbl,
}
ISyncMgrRegister_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RegisterSyncMgrHandler: proc "system" (
		this: ^ISyncMgrRegister,
		#by_ptr clsidHandler: GUID,
		pwszDescription: PWSTR,
		dwSyncMgrRegisterFlags: u32,
	) -> HRESULT,
	UnregisterSyncMgrHandler: proc "system" (this: ^ISyncMgrRegister, #by_ptr clsidHandler: GUID, dwReserved: u32) -> HRESULT,
	GetHandlerRegistrationInfo: proc "system" (
		this: ^ISyncMgrRegister,
		#by_ptr clsidHandler: GUID,
		pdwSyncMgrRegisterFlags: ^u32,
	) -> HRESULT,
}
IID_ISyncMgrRegister :: GUID{0x6295DF42, 0x35EE, 0x11D1, {0x87, 0x07, 0x00, 0xC0, 0x4F, 0xD9, 0x33, 0x27}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrresolutionhandler ]]
ISyncMgrResolutionHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrResolutionHandler_Vtbl,
}
ISyncMgrResolutionHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	QueryAbilities: proc "system" (this: ^ISyncMgrResolutionHandler, pdwAbilities: ^u32) -> HRESULT,
	KeepOther: proc "system" (
		this: ^ISyncMgrResolutionHandler,
		psiOther: ^IShellItem,
		pFeedback: ^SYNCMGR_RESOLUTION_FEEDBACK,
	) -> HRESULT,
	KeepRecent: proc "system" (
		this: ^ISyncMgrResolutionHandler,
		pFeedback: ^SYNCMGR_RESOLUTION_FEEDBACK,
	) -> HRESULT,
	RemoveFromSyncSet: proc "system" (
		this: ^ISyncMgrResolutionHandler,
		pFeedback: ^SYNCMGR_RESOLUTION_FEEDBACK,
	) -> HRESULT,
	KeepItems: proc "system" (
		this: ^ISyncMgrResolutionHandler,
		pArray: ^ISyncMgrConflictResolutionItems,
		pFeedback: ^SYNCMGR_RESOLUTION_FEEDBACK,
	) -> HRESULT,
}
IID_ISyncMgrResolutionHandler :: GUID{0x40A3D052, 0x8BFF, 0x4C4B, {0xA3, 0x38, 0xD4, 0xA3, 0x95, 0x70, 0x0D, 0xE9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrschedulewizarduioperation ]]
ISyncMgrScheduleWizardUIOperation :: struct #raw_union {
	#subtype ISyncMgrUIOperation: ISyncMgrUIOperation,
	using Vtbl: ^ISyncMgrScheduleWizardUIOperation_Vtbl,
}
ISyncMgrScheduleWizardUIOperation_Vtbl :: struct {
	using ISyncMgrUIOperation_Vtbl: ISyncMgrUIOperation_Vtbl,
	InitWizard: proc "system" (this: ^ISyncMgrScheduleWizardUIOperation, pszHandlerID: PWSTR) -> HRESULT,
}
IID_ISyncMgrScheduleWizardUIOperation :: GUID{0x459A6C84, 0x21D2, 0x4DDC, {0x8A, 0x53, 0xF0, 0x23, 0xA4, 0x60, 0x66, 0xF2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsessioncreator ]]
ISyncMgrSessionCreator :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSessionCreator_Vtbl,
}
ISyncMgrSessionCreator_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateSession: proc "system" (
		this: ^ISyncMgrSessionCreator,
		pszHandlerID: PWSTR,
		ppszItemIDs: [^]PWSTR,
		cItems: u32,
		ppCallback: ^^ISyncMgrSyncCallback,
	) -> HRESULT,
}
IID_ISyncMgrSessionCreator :: GUID{0x17F48517, 0xF305, 0x4321, {0xA0, 0x8D, 0xB2, 0x5A, 0x83, 0x49, 0x18, 0xFD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsynccallback ]]
ISyncMgrSyncCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSyncCallback_Vtbl,
}
ISyncMgrSyncCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ReportProgress: proc "system" (
		this: ^ISyncMgrSyncCallback,
		pszItemID: PWSTR,
		pszProgressText: PWSTR,
		nStatus: SYNCMGR_PROGRESS_STATUS,
		uCurrentStep: u32,
		uMaxStep: u32,
		pnCancelRequest: ^SYNCMGR_CANCEL_REQUEST,
	) -> HRESULT,
	SetHandlerProgressText: proc "system" (
		this: ^ISyncMgrSyncCallback,
		pszProgressText: PWSTR,
		pnCancelRequest: ^SYNCMGR_CANCEL_REQUEST,
	) -> HRESULT,
	ReportEvent: proc "system" (
		this: ^ISyncMgrSyncCallback,
		pszItemID: PWSTR,
		nLevel: SYNCMGR_EVENT_LEVEL,
		nFlags: SYNCMGR_EVENT_FLAGS,
		pszName: PWSTR,
		pszDescription: PWSTR,
		pszLinkText: PWSTR,
		pszLinkReference: PWSTR,
		pszContext: PWSTR,
		pguidEventID: ^GUID,
	) -> HRESULT,
	CanContinue: proc "system" (this: ^ISyncMgrSyncCallback, pszItemID: PWSTR) -> HRESULT,
	QueryForAdditionalItems: proc "system" (
		this: ^ISyncMgrSyncCallback,
		ppenumItemIDs: ^^IEnumString,
		ppenumPunks: ^^IEnumUnknown,
	) -> HRESULT,
	AddItemToSession: proc "system" (this: ^ISyncMgrSyncCallback, pszItemID: PWSTR) -> HRESULT,
	AddIUnknownToSession: proc "system" (this: ^ISyncMgrSyncCallback, punk: ^IUnknown) -> HRESULT,
	ProposeItem: proc "system" (this: ^ISyncMgrSyncCallback, pNewItem: ^ISyncMgrSyncItem) -> HRESULT,
	CommitItem: proc "system" (this: ^ISyncMgrSyncCallback, pszItemID: PWSTR) -> HRESULT,
	ReportManualSync: proc "system" (this: ^ISyncMgrSyncCallback) -> HRESULT,
}
IID_ISyncMgrSyncCallback :: GUID{0x884CCD87, 0xB139, 0x4937, {0xA4, 0xBA, 0x4F, 0x8E, 0x19, 0x51, 0x3F, 0xBE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/nn-mobsync-isyncmgrsynchronize ]]
ISyncMgrSynchronize :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSynchronize_Vtbl,
}
ISyncMgrSynchronize_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (
		this: ^ISyncMgrSynchronize,
		dwReserved: u32,
		dwSyncMgrFlags: u32,
		cbCookie: u32,
		lpCookie: [^]u8,
	) -> HRESULT,
	GetHandlerInfo: proc "system" (this: ^ISyncMgrSynchronize, ppSyncMgrHandlerInfo: ^SYNCMGRHANDLERINFO) -> HRESULT,
	EnumSyncMgrItems: proc "system" (this: ^ISyncMgrSynchronize, ppSyncMgrEnumItems: ^^ISyncMgrEnumItems) -> HRESULT,
	GetItemObject: proc "system" (
		this: ^ISyncMgrSynchronize,
		#by_ptr ItemID: GUID,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	ShowProperties: proc "system" (this: ^ISyncMgrSynchronize, hWndParent: HWND, #by_ptr ItemID: GUID) -> HRESULT,
	SetProgressCallback: proc "system" (this: ^ISyncMgrSynchronize, lpCallBack: ^ISyncMgrSynchronizeCallback) -> HRESULT,
	PrepareForSync: proc "system" (
		this: ^ISyncMgrSynchronize,
		cbNumItems: u32,
		pItemIDs: [^]GUID,
		hWndParent: HWND,
		dwReserved: u32,
	) -> HRESULT,
	Synchronize: proc "system" (this: ^ISyncMgrSynchronize, hWndParent: HWND) -> HRESULT,
	SetItemStatus: proc "system" (this: ^ISyncMgrSynchronize, #by_ptr pItemID: GUID, dwSyncMgrStatus: u32) -> HRESULT,
	ShowError: proc "system" (this: ^ISyncMgrSynchronize, hWndParent: HWND, #by_ptr ErrorID: GUID) -> HRESULT,
}
IID_ISyncMgrSynchronize :: GUID{0x6295DF40, 0x35EE, 0x11D1, {0x87, 0x07, 0x00, 0xC0, 0x4F, 0xD9, 0x33, 0x27}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/nn-mobsync-isyncmgrsynchronizecallback ]]
ISyncMgrSynchronizeCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSynchronizeCallback_Vtbl,
}
ISyncMgrSynchronizeCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ShowPropertiesCompleted: proc "system" (this: ^ISyncMgrSynchronizeCallback, hr: HRESULT) -> HRESULT,
	PrepareForSyncCompleted: proc "system" (this: ^ISyncMgrSynchronizeCallback, hr: HRESULT) -> HRESULT,
	SynchronizeCompleted: proc "system" (this: ^ISyncMgrSynchronizeCallback, hr: HRESULT) -> HRESULT,
	ShowErrorCompleted: proc "system" (
		this: ^ISyncMgrSynchronizeCallback,
		hr: HRESULT,
		cItems: u32,
		pItemIDs: [^]GUID,
	) -> HRESULT,
	EnableModeless: proc "system" (this: ^ISyncMgrSynchronizeCallback, fEnable: BOOL) -> HRESULT,
	Progress: proc "system" (
		this: ^ISyncMgrSynchronizeCallback,
		#by_ptr ItemID: GUID,
		#by_ptr pSyncProgressItem: SYNCMGRPROGRESSITEM,
	) -> HRESULT,
	LogError: proc "system" (
		this: ^ISyncMgrSynchronizeCallback,
		dwErrorLevel: u32,
		pszErrorText: PWSTR,
		#by_ptr pSyncLogError: SYNCMGRLOGERRORINFO,
	) -> HRESULT,
	DeleteLogError: proc "system" (this: ^ISyncMgrSynchronizeCallback, #by_ptr ErrorID: GUID, dwReserved: u32) -> HRESULT,
	EstablishConnection: proc "system" (this: ^ISyncMgrSynchronizeCallback, pwszConnection: PWSTR, dwReserved: u32) -> HRESULT,
}
IID_ISyncMgrSynchronizeCallback :: GUID{0x6295DF41, 0x35EE, 0x11D1, {0x87, 0x07, 0x00, 0xC0, 0x4F, 0xD9, 0x33, 0x27}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/nn-mobsync-isyncmgrsynchronizeinvoke ]]
ISyncMgrSynchronizeInvoke :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSynchronizeInvoke_Vtbl,
}
ISyncMgrSynchronizeInvoke_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	UpdateItems: proc "system" (
		this: ^ISyncMgrSynchronizeInvoke,
		dwInvokeFlags: u32,
		#by_ptr clsid: GUID,
		cbCookie: u32,
		pCookie: [^]u8,
	) -> HRESULT,
	UpdateAll: proc "system" (this: ^ISyncMgrSynchronizeInvoke) -> HRESULT,
}
IID_ISyncMgrSynchronizeInvoke :: GUID{0x6295DF2C, 0x35EE, 0x11D1, {0x87, 0x07, 0x00, 0xC0, 0x4F, 0xD9, 0x33, 0x27}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsyncitem ]]
ISyncMgrSyncItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSyncItem_Vtbl,
}
ISyncMgrSyncItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetItemID: proc "system" (this: ^ISyncMgrSyncItem, ppszItemID: ^PWSTR) -> HRESULT,
	GetName: proc "system" (this: ^ISyncMgrSyncItem, ppszName: ^PWSTR) -> HRESULT,
	GetItemInfo: proc "system" (this: ^ISyncMgrSyncItem, ppItemInfo: ^^ISyncMgrSyncItemInfo) -> HRESULT,
	GetObject: proc "system" (
		this: ^ISyncMgrSyncItem,
		#by_ptr rguidObjectID: GUID,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	GetCapabilities: proc "system" (this: ^ISyncMgrSyncItem, pmCapabilities: ^SYNCMGR_ITEM_CAPABILITIES) -> HRESULT,
	GetPolicies: proc "system" (this: ^ISyncMgrSyncItem, pmPolicies: ^SYNCMGR_ITEM_POLICIES) -> HRESULT,
	Enable: proc "system" (this: ^ISyncMgrSyncItem, fEnable: BOOL) -> HRESULT,
	Delete: proc "system" (this: ^ISyncMgrSyncItem) -> HRESULT,
}
IID_ISyncMgrSyncItem :: GUID{0xB20B24CE, 0x2593, 0x4F04, {0xBD, 0x8B, 0x7A, 0xD6, 0xC4, 0x50, 0x51, 0xCD}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsyncitemcontainer ]]
ISyncMgrSyncItemContainer :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSyncItemContainer_Vtbl,
}
ISyncMgrSyncItemContainer_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetSyncItem: proc "system" (
		this: ^ISyncMgrSyncItemContainer,
		pszItemID: PWSTR,
		ppItem: ^^ISyncMgrSyncItem,
	) -> HRESULT,
	GetSyncItemEnumerator: proc "system" (this: ^ISyncMgrSyncItemContainer, ppenum: ^^IEnumSyncMgrSyncItems) -> HRESULT,
	GetSyncItemCount: proc "system" (this: ^ISyncMgrSyncItemContainer, pcItems: ^u32) -> HRESULT,
}
IID_ISyncMgrSyncItemContainer :: GUID{0x90701133, 0xBE32, 0x4129, {0xA6, 0x5C, 0x99, 0xE6, 0x16, 0xCA, 0xFF, 0xF4}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsynciteminfo ]]
ISyncMgrSyncItemInfo :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSyncItemInfo_Vtbl,
}
ISyncMgrSyncItemInfo_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetTypeLabel: proc "system" (this: ^ISyncMgrSyncItemInfo, ppszTypeLabel: ^PWSTR) -> HRESULT,
	GetComment: proc "system" (this: ^ISyncMgrSyncItemInfo, ppszComment: ^PWSTR) -> HRESULT,
	GetLastSyncTime: proc "system" (this: ^ISyncMgrSyncItemInfo, pftLastSync: ^FILETIME) -> HRESULT,
	IsEnabled: proc "system" (this: ^ISyncMgrSyncItemInfo) -> HRESULT,
	IsConnected: proc "system" (this: ^ISyncMgrSyncItemInfo) -> HRESULT,
}
IID_ISyncMgrSyncItemInfo :: GUID{0xE7FD9502, 0xBE0C, 0x4464, {0x90, 0xA1, 0x2B, 0x52, 0x77, 0x03, 0x12, 0x32}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgrsyncresult ]]
ISyncMgrSyncResult :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrSyncResult_Vtbl,
}
ISyncMgrSyncResult_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Result: proc "system" (
		this: ^ISyncMgrSyncResult,
		nStatus: SYNCMGR_PROGRESS_STATUS,
		cError: u32,
		cConflicts: u32,
	) -> HRESULT,
}
IID_ISyncMgrSyncResult :: GUID{0x2B90F17E, 0x5A3E, 0x4B33, {0xBB, 0x7F, 0x1B, 0xC4, 0x80, 0x56, 0xB9, 0x4D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/nn-syncmgr-isyncmgruioperation ]]
ISyncMgrUIOperation :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISyncMgrUIOperation_Vtbl,
}
ISyncMgrUIOperation_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Run: proc "system" (this: ^ISyncMgrUIOperation, hwndOwner: HWND) -> HRESULT,
}
IID_ISyncMgrUIOperation :: GUID{0xFC7CFA47, 0xDFE1, 0x45B5, {0xA0, 0x49, 0x8C, 0xFD, 0x82, 0xBE, 0xC2, 0x71}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itaskbarlist ]]
ITaskbarList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITaskbarList_Vtbl,
}
ITaskbarList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	HrInit: proc "system" (this: ^ITaskbarList) -> HRESULT,
	AddTab: proc "system" (this: ^ITaskbarList, hwnd: HWND) -> HRESULT,
	DeleteTab: proc "system" (this: ^ITaskbarList, hwnd: HWND) -> HRESULT,
	ActivateTab: proc "system" (this: ^ITaskbarList, hwnd: HWND) -> HRESULT,
	SetActiveAlt: proc "system" (this: ^ITaskbarList, hwnd: HWND) -> HRESULT,
}
IID_ITaskbarList :: GUID{0x56FDF342, 0xFD6D, 0x11D0, {0x95, 0x8A, 0x00, 0x60, 0x97, 0xC9, 0xA0, 0x90}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itaskbarlist2 ]]
ITaskbarList2 :: struct #raw_union {
	#subtype ITaskbarList: ITaskbarList,
	using Vtbl: ^ITaskbarList2_Vtbl,
}
ITaskbarList2_Vtbl :: struct {
	using ITaskbarList_Vtbl: ITaskbarList_Vtbl,
	MarkFullscreenWindow: proc "system" (this: ^ITaskbarList2, hwnd: HWND, fFullscreen: BOOL) -> HRESULT,
}
IID_ITaskbarList2 :: GUID{0x602D4995, 0xB13A, 0x429B, {0xA6, 0x6E, 0x19, 0x35, 0xE4, 0x4F, 0x43, 0x17}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itaskbarlist3 ]]
ITaskbarList3 :: struct #raw_union {
	#subtype ITaskbarList2: ITaskbarList2,
	using Vtbl: ^ITaskbarList3_Vtbl,
}
ITaskbarList3_Vtbl :: struct {
	using ITaskbarList2_Vtbl: ITaskbarList2_Vtbl,
	SetProgressValue: proc "system" (this: ^ITaskbarList3, hwnd: HWND, ullCompleted: u64, ullTotal: u64) -> HRESULT,
	SetProgressState: proc "system" (this: ^ITaskbarList3, hwnd: HWND, tbpFlags: TBPFLAG) -> HRESULT,
	RegisterTab: proc "system" (this: ^ITaskbarList3, hwndTab: HWND, hwndMDI: HWND) -> HRESULT,
	UnregisterTab: proc "system" (this: ^ITaskbarList3, hwndTab: HWND) -> HRESULT,
	SetTabOrder: proc "system" (this: ^ITaskbarList3, hwndTab: HWND, hwndInsertBefore: HWND) -> HRESULT,
	SetTabActive: proc "system" (this: ^ITaskbarList3, hwndTab: HWND, hwndMDI: HWND, dwReserved: u32) -> HRESULT,
	ThumbBarAddButtons: proc "system" (this: ^ITaskbarList3, hwnd: HWND, cButtons: u32, pButton: [^]THUMBBUTTON) -> HRESULT,
	ThumbBarUpdateButtons: proc "system" (this: ^ITaskbarList3, hwnd: HWND, cButtons: u32, pButton: [^]THUMBBUTTON) -> HRESULT,
	ThumbBarSetImageList: proc "system" (this: ^ITaskbarList3, hwnd: HWND, himl: HIMAGELIST) -> HRESULT,
	SetOverlayIcon: proc "system" (this: ^ITaskbarList3, hwnd: HWND, hIcon: HICON, pszDescription: PWSTR) -> HRESULT,
	SetThumbnailTooltip: proc "system" (this: ^ITaskbarList3, hwnd: HWND, pszTip: PWSTR) -> HRESULT,
	SetThumbnailClip: proc "system" (this: ^ITaskbarList3, hwnd: HWND, prcClip: ^RECT) -> HRESULT,
}
IID_ITaskbarList3 :: GUID{0xEA1AFB91, 0x9E28, 0x4B86, {0x90, 0xE9, 0x9E, 0x9F, 0x8A, 0x5E, 0xEF, 0xAF}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itaskbarlist4 ]]
ITaskbarList4 :: struct #raw_union {
	#subtype ITaskbarList3: ITaskbarList3,
	using Vtbl: ^ITaskbarList4_Vtbl,
}
ITaskbarList4_Vtbl :: struct {
	using ITaskbarList3_Vtbl: ITaskbarList3_Vtbl,
	SetTabProperties: proc "system" (this: ^ITaskbarList4, hwndTab: HWND, stpFlags: STPFLAG) -> HRESULT,
}
IID_ITaskbarList4 :: GUID{0xC43DC798, 0x95D1, 0x4BEA, {0x90, 0x30, 0xBB, 0x99, 0xE2, 0x98, 0x3A, 0x1A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-itemspacing ]]
ITEMSPACING :: struct {
	cxSmall: i32,
	cySmall: i32,
	cxLarge: i32,
	cyLarge: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-ithumbnailcache ]]
IThumbnailCache :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IThumbnailCache_Vtbl,
}
IThumbnailCache_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetThumbnail: proc "system" (
		this: ^IThumbnailCache,
		pShellItem: ^IShellItem,
		cxyRequestedThumbSize: u32,
		flags: WTS_FLAGS,
		ppvThumb: ^^ISharedBitmap,
		pOutFlags: ^WTS_CACHEFLAGS,
		pThumbnailID: ^WTS_THUMBNAILID,
	) -> HRESULT,
	GetThumbnailByID: proc "system" (
		this: ^IThumbnailCache,
		thumbnailID: WTS_THUMBNAILID,
		cxyRequestedThumbSize: u32,
		ppvThumb: ^^ISharedBitmap,
		pOutFlags: ^WTS_CACHEFLAGS,
	) -> HRESULT,
}
IID_IThumbnailCache :: GUID{0xF676C15D, 0x596A, 0x4CE2, {0x82, 0x34, 0x33, 0x99, 0x6F, 0x44, 0x5D, 0xB1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-ithumbnailcacheprimer ]]
IThumbnailCachePrimer :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IThumbnailCachePrimer_Vtbl,
}
IThumbnailCachePrimer_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	PageInThumbnail: proc "system" (
		this: ^IThumbnailCachePrimer,
		psi: ^IShellItem,
		wtsFlags: WTS_FLAGS,
		cxyRequestedThumbSize: u32,
	) -> HRESULT,
}
IID_IThumbnailCachePrimer :: GUID{0x0F03F8FE, 0x2B26, 0x46F0, {0x96, 0x5A, 0x21, 0x2A, 0xA8, 0xD6, 0x6B, 0x76}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-ithumbnailcapture ]]
IThumbnailCapture :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IThumbnailCapture_Vtbl,
}
IThumbnailCapture_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CaptureThumbnail: proc "system" (
		this: ^IThumbnailCapture,
		#by_ptr pMaxSize: SIZE,
		pHTMLDoc2: ^IUnknown,
		phbmThumbnail: ^HBITMAP,
	) -> HRESULT,
}
IID_IThumbnailCapture :: GUID{0x4EA39266, 0x7211, 0x409F, {0xB6, 0x22, 0xF6, 0x3D, 0xBD, 0x16, 0xC5, 0x33}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ithumbnailhandlerfactory ]]
IThumbnailHandlerFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IThumbnailHandlerFactory_Vtbl,
}
IThumbnailHandlerFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetThumbnailHandler: proc "system" (
		this: ^IThumbnailHandlerFactory,
		pidlChild: ^ITEMIDLIST,
		pbc: ^IBindCtx,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
}
IID_IThumbnailHandlerFactory :: GUID{0xE35B4B2E, 0x00DA, 0x4BC1, {0x9F, 0x13, 0x38, 0xBC, 0x11, 0xF5, 0xD4, 0x17}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-ithumbnailprovider ]]
IThumbnailProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IThumbnailProvider_Vtbl,
}
IThumbnailProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetThumbnail: proc "system" (this: ^IThumbnailProvider, cx: u32, phbmp: ^HBITMAP, pdwAlpha: ^WTS_ALPHATYPE) -> HRESULT,
}
IID_IThumbnailProvider :: GUID{0xE357FCCD, 0xA995, 0x4576, {0xB0, 0x1F, 0x23, 0x46, 0x30, 0x15, 0x4E, 0x96}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbcache/nn-thumbcache-ithumbnailsettings ]]
IThumbnailSettings :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IThumbnailSettings_Vtbl,
}
IThumbnailSettings_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetContext: proc "system" (this: ^IThumbnailSettings, dwContext: WTS_CONTEXTFLAGS) -> HRESULT,
}
IID_IThumbnailSettings :: GUID{0xF4376F00, 0xBEF5, 0x4D45, {0x80, 0xF3, 0x1E, 0x02, 0x3B, 0xBF, 0x12, 0x09}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbnailstreamcache/nn-thumbnailstreamcache-ithumbnailstreamcache ]]
IThumbnailStreamCache :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IThumbnailStreamCache_Vtbl,
}
IThumbnailStreamCache_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetThumbnailStream: proc "system" (
		this: ^IThumbnailStreamCache,
		path: PWSTR,
		cacheId: u64,
		options: ThumbnailStreamCacheOptions,
		requestedThumbnailSize: u32,
		thumbnailSize: ^SIZE,
		thumbnailStream: ^^IStream,
	) -> HRESULT,
	SetThumbnailStream: proc "system" (
		this: ^IThumbnailStreamCache,
		path: PWSTR,
		cacheId: u64,
		thumbnailSize: SIZE,
		thumbnailStream: ^IStream,
	) -> HRESULT,
}
IID_IThumbnailStreamCache :: GUID{0x90E11430, 0x9569, 0x41D8, {0xAE, 0x75, 0x6D, 0x4D, 0x2A, 0xE7, 0xCC, 0xA0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-itrackshellmenu ]]
ITrackShellMenu :: struct #raw_union {
	#subtype IShellMenu: IShellMenu,
	using Vtbl: ^ITrackShellMenu_Vtbl,
}
ITrackShellMenu_Vtbl :: struct {
	using IShellMenu_Vtbl: IShellMenu_Vtbl,
	SetObscured: proc "system" (this: ^ITrackShellMenu, hwndTB: HWND, punkBand: ^IUnknown, dwSMSetFlags: u32) -> HRESULT,
	Popup: proc "system" (this: ^ITrackShellMenu, hwnd: HWND, ppt: ^POINTL, prcExclude: ^RECTL, dwFlags: i32) -> HRESULT,
}
IID_ITrackShellMenu :: GUID{0x8278F932, 0x2A3E, 0x11D2, {0x83, 0x8F, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/imagetranscode/nn-imagetranscode-itranscodeimage ]]
ITranscodeImage :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITranscodeImage_Vtbl,
}
ITranscodeImage_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	TranscodeImage: proc "system" (
		this: ^ITranscodeImage,
		pShellItem: ^IShellItem,
		uiMaxWidth: u32,
		uiMaxHeight: u32,
		flags: u32,
		pvImage: ^IStream,
		puiWidth: ^u32,
		puiHeight: ^u32,
	) -> HRESULT,
}
IID_ITranscodeImage :: GUID{0xBAE86DDD, 0xDC11, 0x421C, {0xB7, 0xAB, 0xCC, 0x55, 0xD1, 0xD6, 0x5C, 0x44}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itransferadvisesink ]]
ITransferAdviseSink :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITransferAdviseSink_Vtbl,
}
ITransferAdviseSink_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	UpdateProgress: proc "system" (
		this: ^ITransferAdviseSink,
		ullSizeCurrent: u64,
		ullSizeTotal: u64,
		nFilesCurrent: i32,
		nFilesTotal: i32,
		nFoldersCurrent: i32,
		nFoldersTotal: i32,
	) -> HRESULT,
	UpdateTransferState: proc "system" (this: ^ITransferAdviseSink, ts: u32) -> HRESULT,
	ConfirmOverwrite: proc "system" (
		this: ^ITransferAdviseSink,
		psiSource: ^IShellItem,
		psiDestParent: ^IShellItem,
		pszName: PWSTR,
	) -> HRESULT,
	ConfirmEncryptionLoss: proc "system" (this: ^ITransferAdviseSink, psiSource: ^IShellItem) -> HRESULT,
	FileFailure: proc "system" (
		this: ^ITransferAdviseSink,
		psi: ^IShellItem,
		pszItem: PWSTR,
		hrError: HRESULT,
		pszRename: PWSTR,
		cchRename: u32,
	) -> HRESULT,
	SubStreamFailure: proc "system" (
		this: ^ITransferAdviseSink,
		psi: ^IShellItem,
		pszStreamName: PWSTR,
		hrError: HRESULT,
	) -> HRESULT,
	PropertyFailure: proc "system" (
		this: ^ITransferAdviseSink,
		psi: ^IShellItem,
		#by_ptr pkey: PROPERTYKEY,
		hrError: HRESULT,
	) -> HRESULT,
}
IID_ITransferAdviseSink :: GUID{0xD594D0D8, 0x8DA7, 0x457B, {0xB3, 0xB4, 0xCE, 0x5D, 0xBA, 0xAC, 0x0B, 0x88}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itransferdestination ]]
ITransferDestination :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITransferDestination_Vtbl,
}
ITransferDestination_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Advise: proc "system" (this: ^ITransferDestination, psink: ^ITransferAdviseSink, pdwCookie: ^u32) -> HRESULT,
	Unadvise: proc "system" (this: ^ITransferDestination, dwCookie: u32) -> HRESULT,
	CreateItem: proc "system" (
		this: ^ITransferDestination,
		pszName: PWSTR,
		dwAttributes: u32,
		ullSize: u64,
		flags: u32,
		#by_ptr riidItem: GUID,
		ppvItem: rawptr,
		#by_ptr riidResources: GUID,
		ppvResources: rawptr,
	) -> HRESULT,
}
IID_ITransferDestination :: GUID{0x48ADDD32, 0x3CA5, 0x4124, {0xAB, 0xE3, 0xB5, 0xA7, 0x25, 0x31, 0xB2, 0x07}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itransfermediumitem ]]
ITransferMediumItem :: struct #raw_union {
	#subtype IRelatedItem: IRelatedItem,
	using Vtbl: ^ITransferMediumItem_Vtbl,
}
ITransferMediumItem_Vtbl :: struct {
	using IRelatedItem_Vtbl: IRelatedItem_Vtbl,
}
IID_ITransferMediumItem :: GUID{0x77F295D5, 0x2D6F, 0x4E19, {0xB8, 0xAE, 0x32, 0x2F, 0x3E, 0x72, 0x1A, 0xB5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-itransfersource ]]
ITransferSource :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITransferSource_Vtbl,
}
ITransferSource_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Advise: proc "system" (this: ^ITransferSource, psink: ^ITransferAdviseSink, pdwCookie: ^u32) -> HRESULT,
	Unadvise: proc "system" (this: ^ITransferSource, dwCookie: u32) -> HRESULT,
	SetProperties: proc "system" (this: ^ITransferSource, pproparray: ^IPropertyChangeArray) -> HRESULT,
	OpenItem: proc "system" (
		this: ^ITransferSource,
		psi: ^IShellItem,
		flags: u32,
		#by_ptr riid: GUID,
		ppv: rawptr,
	) -> HRESULT,
	MoveItem: proc "system" (
		this: ^ITransferSource,
		psi: ^IShellItem,
		psiParentDst: ^IShellItem,
		pszNameDst: PWSTR,
		flags: u32,
		ppsiNew: ^^IShellItem,
	) -> HRESULT,
	RecycleItem: proc "system" (
		this: ^ITransferSource,
		psiSource: ^IShellItem,
		psiParentDest: ^IShellItem,
		flags: u32,
		ppsiNewDest: ^^IShellItem,
	) -> HRESULT,
	RemoveItem: proc "system" (this: ^ITransferSource, psiSource: ^IShellItem, flags: u32) -> HRESULT,
	RenameItem: proc "system" (
		this: ^ITransferSource,
		psiSource: ^IShellItem,
		pszNewName: PWSTR,
		flags: u32,
		ppsiNewDest: ^^IShellItem,
	) -> HRESULT,
	LinkItem: proc "system" (
		this: ^ITransferSource,
		psiSource: ^IShellItem,
		psiParentDest: ^IShellItem,
		pszNewName: PWSTR,
		flags: u32,
		ppsiNewDest: ^^IShellItem,
	) -> HRESULT,
	ApplyPropertiesToItem: proc "system" (this: ^ITransferSource, psiSource: ^IShellItem, ppsiNew: ^^IShellItem) -> HRESULT,
	GetDefaultDestinationName: proc "system" (
		this: ^ITransferSource,
		psiSource: ^IShellItem,
		psiParentDest: ^IShellItem,
		ppszDestinationName: ^PWSTR,
	) -> HRESULT,
	EnterFolder: proc "system" (this: ^ITransferSource, psiChildFolderDest: ^IShellItem) -> HRESULT,
	LeaveFolder: proc "system" (this: ^ITransferSource, psiChildFolderDest: ^IShellItem) -> HRESULT,
}
IID_ITransferSource :: GUID{0x00ADB003, 0xBDE9, 0x45C6, {0x8E, 0x29, 0xD0, 0x9F, 0x93, 0x53, 0xE1, 0x08}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-itravelentry ]]
ITravelEntry :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITravelEntry_Vtbl,
}
ITravelEntry_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Invoke: proc "system" (this: ^ITravelEntry, punk: ^IUnknown) -> HRESULT,
	Update: proc "system" (this: ^ITravelEntry, punk: ^IUnknown, fIsLocalAnchor: BOOL) -> HRESULT,
	GetPidl: proc "system" (this: ^ITravelEntry, ppidl: ^ITEMIDLIST) -> HRESULT,
}
IID_ITravelEntry :: GUID{0xF46EDB3B, 0xBC2F, 0x11D0, {0x94, 0x12, 0x00, 0xAA, 0x00, 0xA3, 0xEB, 0xD3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/nn-shdeprecated-itravellog ]]
ITravelLog :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITravelLog_Vtbl,
}
ITravelLog_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AddEntry: proc "system" (this: ^ITravelLog, punk: ^IUnknown, fIsLocalAnchor: BOOL) -> HRESULT,
	UpdateEntry: proc "system" (this: ^ITravelLog, punk: ^IUnknown, fIsLocalAnchor: BOOL) -> HRESULT,
	UpdateExternal: proc "system" (this: ^ITravelLog, punk: ^IUnknown, punkHLBrowseContext: ^IUnknown) -> HRESULT,
	Travel: proc "system" (this: ^ITravelLog, punk: ^IUnknown, iOffset: i32) -> HRESULT,
	GetTravelEntry: proc "system" (this: ^ITravelLog, punk: ^IUnknown, iOffset: i32, ppte: ^^ITravelEntry) -> HRESULT,
	FindTravelEntry: proc "system" (this: ^ITravelLog, punk: ^IUnknown, pidl: ^ITEMIDLIST, ppte: ^^ITravelEntry) -> HRESULT,
	GetToolTipText: proc "system" (
		this: ^ITravelLog,
		punk: ^IUnknown,
		iOffset: i32,
		idsTemplate: i32,
		pwzText: PWSTR,
		cchText: u32,
	) -> HRESULT,
	InsertMenuEntries: proc "system" (
		this: ^ITravelLog,
		punk: ^IUnknown,
		hmenu: HMENU,
		nPos: i32,
		idFirst: i32,
		idLast: i32,
		dwFlags: u32,
	) -> HRESULT,
	Clone: proc "system" (this: ^ITravelLog, pptl: ^^ITravelLog) -> HRESULT,
	CountEntries: proc "system" (this: ^ITravelLog, punk: ^IUnknown) -> u32,
	Revert: proc "system" (this: ^ITravelLog) -> HRESULT,
}
IID_ITravelLog :: GUID{0x66A9CB08, 0x4802, 0x11D2, {0xA5, 0x61, 0x00, 0xA0, 0xC9, 0x2D, 0xBF, 0xE8}}

ITravelLogClient :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITravelLogClient_Vtbl,
}
ITravelLogClient_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	FindWindowByIndex: proc "system" (this: ^ITravelLogClient, dwID: u32, ppunk: ^^IUnknown) -> HRESULT,
	GetWindowData: proc "system" (this: ^ITravelLogClient, pStream: ^IStream, pWinData: ^WINDOWDATA) -> HRESULT,
	LoadHistoryPosition: proc "system" (this: ^ITravelLogClient, pszUrlLocation: PWSTR, dwPosition: u32) -> HRESULT,
}
IID_ITravelLogClient :: GUID{0x241C033E, 0xE659, 0x43DA, {0xAA, 0x4D, 0x40, 0x86, 0xDB, 0xC4, 0x75, 0x8D}}

ITravelLogEntry :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITravelLogEntry_Vtbl,
}
ITravelLogEntry_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetTitle: proc "system" (this: ^ITravelLogEntry, ppszTitle: ^PWSTR) -> HRESULT,
	GetURL: proc "system" (this: ^ITravelLogEntry, ppszURL: ^PWSTR) -> HRESULT,
}
IID_ITravelLogEntry :: GUID{0x7EBFDD87, 0xAD18, 0x11D3, {0xA4, 0xC5, 0x00, 0xC0, 0x4F, 0x72, 0xD6, 0xB8}}

ITravelLogStg :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITravelLogStg_Vtbl,
}
ITravelLogStg_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	CreateEntry: proc "system" (
		this: ^ITravelLogStg,
		pszUrl: PWSTR,
		pszTitle: PWSTR,
		ptleRelativeTo: ^ITravelLogEntry,
		fPrepend: BOOL,
		pptle: ^^ITravelLogEntry,
	) -> HRESULT,
	TravelTo: proc "system" (this: ^ITravelLogStg, ptle: ^ITravelLogEntry) -> HRESULT,
	EnumEntries: proc "system" (this: ^ITravelLogStg, flags: TLENUMF, ppenum: ^^IEnumTravelLogEntry) -> HRESULT,
	FindEntries: proc "system" (
		this: ^ITravelLogStg,
		flags: TLENUMF,
		pszUrl: PWSTR,
		ppenum: ^^IEnumTravelLogEntry,
	) -> HRESULT,
	GetCount: proc "system" (this: ^ITravelLogStg, flags: TLENUMF, pcEntries: ^u32) -> HRESULT,
	RemoveEntry: proc "system" (this: ^ITravelLogStg, ptle: ^ITravelLogEntry) -> HRESULT,
	GetRelativeEntry: proc "system" (this: ^ITravelLogStg, iOffset: i32, ptle: ^^ITravelLogEntry) -> HRESULT,
}
IID_ITravelLogStg :: GUID{0x7EBFDD80, 0xAD18, 0x11D3, {0xA4, 0xC5, 0x00, 0xC0, 0x4F, 0x72, 0xD6, 0xB8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-itraydeskband ]]
ITrayDeskBand :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ITrayDeskBand_Vtbl,
}
ITrayDeskBand_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ShowDeskBand: proc "system" (this: ^ITrayDeskBand, #by_ptr clsid: GUID) -> HRESULT,
	HideDeskBand: proc "system" (this: ^ITrayDeskBand, #by_ptr clsid: GUID) -> HRESULT,
	IsDeskBandShown: proc "system" (this: ^ITrayDeskBand, #by_ptr clsid: GUID) -> HRESULT,
	DeskBandRegistrationChanged: proc "system" (this: ^ITrayDeskBand) -> HRESULT,
}
IID_ITrayDeskBand :: GUID{0x6D67E846, 0x5B9C, 0x4DB8, {0x9C, 0xBC, 0xDD, 0xE1, 0x2F, 0x42, 0x54, 0xF1}}

IUniformResourceLocatorA :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IUniformResourceLocatorA_Vtbl,
}
IUniformResourceLocatorA_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetURL: proc "system" (this: ^IUniformResourceLocatorA, pcszURL: PSTR, dwInFlags: u32) -> HRESULT,
	GetURL: proc "system" (this: ^IUniformResourceLocatorA, ppszURL: ^PSTR) -> HRESULT,
	InvokeCommand: proc "system" (this: ^IUniformResourceLocatorA, purlici: ^URLINVOKECOMMANDINFOA) -> HRESULT,
}
IID_IUniformResourceLocatorA :: GUID{0xFBF23B80, 0xE3F0, 0x101B, {0x84, 0x88, 0x00, 0xAA, 0x00, 0x3E, 0x56, 0xF8}}

IUniformResourceLocatorW :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IUniformResourceLocatorW_Vtbl,
}
IUniformResourceLocatorW_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetURL: proc "system" (this: ^IUniformResourceLocatorW, pcszURL: PWSTR, dwInFlags: u32) -> HRESULT,
	GetURL: proc "system" (this: ^IUniformResourceLocatorW, ppszURL: ^PWSTR) -> HRESULT,
	InvokeCommand: proc "system" (this: ^IUniformResourceLocatorW, purlici: ^URLINVOKECOMMANDINFOW) -> HRESULT,
}
IID_IUniformResourceLocatorW :: GUID{0xCABB0DA0, 0xDA57, 0x11CF, {0x99, 0x74, 0x00, 0x20, 0xAF, 0xD7, 0x97, 0x62}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iupdateidlist ]]
IUpdateIDList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IUpdateIDList_Vtbl,
}
IUpdateIDList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Update: proc "system" (
		this: ^IUpdateIDList,
		pbc: ^IBindCtx,
		pidlIn: ^ITEMIDLIST,
		ppidlOut: ^ITEMIDLIST,
	) -> HRESULT,
}
IID_IUpdateIDList :: GUID{0x6589B6D2, 0x5F8D, 0x4B9E, {0xB7, 0xE0, 0x23, 0xCD, 0xD9, 0x71, 0x7D, 0x8C}}

IURL_INVOKECOMMAND_FLAGS :: enum i32 {
	ALLOW_UI = 1,
	USE_DEFAULT_VERB = 2,
	DDEWAIT = 4,
	ASYNCOK = 8,
	LOG_USAGE = 16,
}

IURL_SETURL_FLAGS :: enum i32 {
	GUESS_PROTOCOL = 1,
	USE_DEFAULT_PROTOCOL = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iurlsearchhook ]]
IURLSearchHook :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IURLSearchHook_Vtbl,
}
IURLSearchHook_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Translate: proc "system" (this: ^IURLSearchHook, pwszSearchURL: PWSTR, cchBufferSize: u32) -> HRESULT,
}
IID_IURLSearchHook :: GUID{0xAC60F6A0, 0x0FD9, 0x11D0, {0x99, 0xCB, 0x00, 0xC0, 0x4F, 0xD6, 0x44, 0x97}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/nn-shlobj_core-iurlsearchhook2 ]]
IURLSearchHook2 :: struct #raw_union {
	#subtype IURLSearchHook: IURLSearchHook,
	using Vtbl: ^IURLSearchHook2_Vtbl,
}
IURLSearchHook2_Vtbl :: struct {
	using IURLSearchHook_Vtbl: IURLSearchHook_Vtbl,
	TranslateWithSearchContext: proc "system" (
		this: ^IURLSearchHook2,
		pwszSearchURL: PWSTR,
		cchBufferSize: u32,
		pSearchContext: ^ISearchContext,
	) -> HRESULT,
}
IID_IURLSearchHook2 :: GUID{0x5EE44DA4, 0x6D32, 0x46E3, {0x86, 0xBC, 0x07, 0x54, 0x0D, 0xED, 0xD0, 0xE0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iuseraccountchangecallback ]]
IUserAccountChangeCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IUserAccountChangeCallback_Vtbl,
}
IUserAccountChangeCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnPictureChange: proc "system" (this: ^IUserAccountChangeCallback, pszUserName: PWSTR) -> HRESULT,
}
IID_IUserAccountChangeCallback :: GUID{0xA561E69A, 0xB4B8, 0x4113, {0x91, 0xA5, 0x64, 0xC6, 0xBC, 0xCA, 0x34, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iusernotification ]]
IUserNotification :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IUserNotification_Vtbl,
}
IUserNotification_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetBalloonInfo: proc "system" (this: ^IUserNotification, pszTitle: PWSTR, pszText: PWSTR, dwInfoFlags: u32) -> HRESULT,
	SetBalloonRetry: proc "system" (this: ^IUserNotification, dwShowTime: u32, dwInterval: u32, cRetryCount: u32) -> HRESULT,
	SetIconInfo: proc "system" (this: ^IUserNotification, hIcon: HICON, pszToolTip: PWSTR) -> HRESULT,
	Show: proc "system" (
		this: ^IUserNotification,
		pqc: ^IQueryContinue,
		dwContinuePollInterval: u32,
	) -> HRESULT,
	PlaySound: proc "system" (this: ^IUserNotification, pszSoundName: PWSTR) -> HRESULT,
}
IID_IUserNotification :: GUID{0xBA9711BA, 0x5893, 0x4787, {0xA7, 0xE1, 0x41, 0x27, 0x71, 0x51, 0x55, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iusernotification2 ]]
IUserNotification2 :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IUserNotification2_Vtbl,
}
IUserNotification2_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetBalloonInfo: proc "system" (this: ^IUserNotification2, pszTitle: PWSTR, pszText: PWSTR, dwInfoFlags: u32) -> HRESULT,
	SetBalloonRetry: proc "system" (this: ^IUserNotification2, dwShowTime: u32, dwInterval: u32, cRetryCount: u32) -> HRESULT,
	SetIconInfo: proc "system" (this: ^IUserNotification2, hIcon: HICON, pszToolTip: PWSTR) -> HRESULT,
	Show: proc "system" (
		this: ^IUserNotification2,
		pqc: ^IQueryContinue,
		dwContinuePollInterval: u32,
		pSink: ^IUserNotificationCallback,
	) -> HRESULT,
	PlaySound: proc "system" (this: ^IUserNotification2, pszSoundName: PWSTR) -> HRESULT,
}
IID_IUserNotification2 :: GUID{0x215913CC, 0x57EB, 0x4FAB, {0xAB, 0x5A, 0xE5, 0xFA, 0x7B, 0xEA, 0x2A, 0x6C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iusernotificationcallback ]]
IUserNotificationCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IUserNotificationCallback_Vtbl,
}
IUserNotificationCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnBalloonUserClick: proc "system" (this: ^IUserNotificationCallback, pt: ^POINT) -> HRESULT,
	OnLeftClick: proc "system" (this: ^IUserNotificationCallback, pt: ^POINT) -> HRESULT,
	OnContextMenu: proc "system" (this: ^IUserNotificationCallback, pt: ^POINT) -> HRESULT,
}
IID_IUserNotificationCallback :: GUID{0x19108294, 0x0441, 0x4AFF, {0x80, 0x13, 0xFA, 0x0A, 0x73, 0x0B, 0x0B, 0xEA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iusetobrowseitem ]]
IUseToBrowseItem :: struct #raw_union {
	#subtype IRelatedItem: IRelatedItem,
	using Vtbl: ^IUseToBrowseItem_Vtbl,
}
IUseToBrowseItem_Vtbl :: struct {
	using IRelatedItem_Vtbl: IRelatedItem_Vtbl,
}
IID_IUseToBrowseItem :: GUID{0x05EDDA5C, 0x98A3, 0x4717, {0x8A, 0xDB, 0xC5, 0xE7, 0xDA, 0x99, 0x1E, 0xB1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-iviewstateidentityitem ]]
IViewStateIdentityItem :: struct #raw_union {
	#subtype IRelatedItem: IRelatedItem,
	using Vtbl: ^IViewStateIdentityItem_Vtbl,
}
IViewStateIdentityItem_Vtbl :: struct {
	using IRelatedItem_Vtbl: IRelatedItem_Vtbl,
}
IID_IViewStateIdentityItem :: GUID{0x9D264146, 0xA94F, 0x4195, {0x9F, 0x9F, 0x3B, 0xB1, 0x2C, 0xE0, 0xC9, 0x55}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ivirtualdesktopmanager ]]
IVirtualDesktopManager :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IVirtualDesktopManager_Vtbl,
}
IVirtualDesktopManager_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	IsWindowOnCurrentVirtualDesktop: proc "system" (
		this: ^IVirtualDesktopManager,
		topLevelWindow: HWND,
		onCurrentDesktop: ^BOOL,
	) -> HRESULT,
	GetWindowDesktopId: proc "system" (this: ^IVirtualDesktopManager, topLevelWindow: HWND, desktopId: ^GUID) -> HRESULT,
	MoveWindowToDesktop: proc "system" (
		this: ^IVirtualDesktopManager,
		topLevelWindow: HWND,
		#by_ptr desktopId: GUID,
	) -> HRESULT,
}
IID_IVirtualDesktopManager :: GUID{0xA5CD92FF, 0x29BE, 0x454C, {0x8D, 0x04, 0xD8, 0x28, 0x79, 0xFB, 0x3F, 0x1B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-ivisualproperties ]]
IVisualProperties :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IVisualProperties_Vtbl,
}
IVisualProperties_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetWatermark: proc "system" (this: ^IVisualProperties, hbmp: HBITMAP, vpwf: VPWATERMARKFLAGS) -> HRESULT,
	SetColor: proc "system" (this: ^IVisualProperties, vpcf: VPCOLORFLAGS, cr: COLORREF) -> HRESULT,
	GetColor: proc "system" (this: ^IVisualProperties, vpcf: VPCOLORFLAGS, pcr: ^COLORREF) -> HRESULT,
	SetItemHeight: proc "system" (this: ^IVisualProperties, cyItemInPixels: i32) -> HRESULT,
	GetItemHeight: proc "system" (this: ^IVisualProperties, cyItemInPixels: ^i32) -> HRESULT,
	SetFont: proc "system" (this: ^IVisualProperties, #by_ptr plf: LOGFONTW, bRedraw: BOOL) -> HRESULT,
	GetFont: proc "system" (this: ^IVisualProperties, plf: ^LOGFONTW) -> HRESULT,
	SetTheme: proc "system" (this: ^IVisualProperties, pszSubAppName: PWSTR, pszSubIdList: PWSTR) -> HRESULT,
}
IID_IVisualProperties :: GUID{0xE693CF68, 0xD967, 0x4112, {0x87, 0x63, 0x99, 0x17, 0x2A, 0xEE, 0x5E, 0x5A}}

IWebBrowser :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IWebBrowser_Vtbl,
}
IWebBrowser_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	GoBack: proc "system" (this: ^IWebBrowser) -> HRESULT,
	GoForward: proc "system" (this: ^IWebBrowser) -> HRESULT,
	GoHome: proc "system" (this: ^IWebBrowser) -> HRESULT,
	GoSearch: proc "system" (this: ^IWebBrowser) -> HRESULT,
	Navigate: proc "system" (
		this: ^IWebBrowser,
		URL: BSTR,
		Flags: ^VARIANT,
		TargetFrameName: ^VARIANT,
		PostData: ^VARIANT,
		Headers: ^VARIANT,
	) -> HRESULT,
	Refresh: proc "system" (this: ^IWebBrowser) -> HRESULT,
	Refresh2: proc "system" (this: ^IWebBrowser, Level: ^VARIANT) -> HRESULT,
	Stop: proc "system" (this: ^IWebBrowser) -> HRESULT,
	get_Application: proc "system" (this: ^IWebBrowser, ppDisp: ^^IDispatch) -> HRESULT,
	get_Parent: proc "system" (this: ^IWebBrowser, ppDisp: ^^IDispatch) -> HRESULT,
	get_Container: proc "system" (this: ^IWebBrowser, ppDisp: ^^IDispatch) -> HRESULT,
	get_Document: proc "system" (this: ^IWebBrowser, ppDisp: ^^IDispatch) -> HRESULT,
	get_TopLevelContainer: proc "system" (this: ^IWebBrowser, pBool: ^VARIANT_BOOL) -> HRESULT,
	get_Type: proc "system" (this: ^IWebBrowser, Type: ^BSTR) -> HRESULT,
	get_Left: proc "system" (this: ^IWebBrowser, pl: ^i32) -> HRESULT,
	put_Left: proc "system" (this: ^IWebBrowser, Left: i32) -> HRESULT,
	get_Top: proc "system" (this: ^IWebBrowser, pl: ^i32) -> HRESULT,
	put_Top: proc "system" (this: ^IWebBrowser, Top: i32) -> HRESULT,
	get_Width: proc "system" (this: ^IWebBrowser, pl: ^i32) -> HRESULT,
	put_Width: proc "system" (this: ^IWebBrowser, Width: i32) -> HRESULT,
	get_Height: proc "system" (this: ^IWebBrowser, pl: ^i32) -> HRESULT,
	put_Height: proc "system" (this: ^IWebBrowser, Height: i32) -> HRESULT,
	get_LocationName: proc "system" (this: ^IWebBrowser, LocationName: ^BSTR) -> HRESULT,
	get_LocationURL: proc "system" (this: ^IWebBrowser, LocationURL: ^BSTR) -> HRESULT,
	get_Busy: proc "system" (this: ^IWebBrowser, pBool: ^VARIANT_BOOL) -> HRESULT,
}
IID_IWebBrowser :: GUID{0xEAB22AC1, 0x30C1, 0x11CF, {0xA7, 0xEB, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/exdisp/nn-exdisp-iwebbrowser2 ]]
IWebBrowser2 :: struct #raw_union {
	#subtype IWebBrowserApp: IWebBrowserApp,
	using Vtbl: ^IWebBrowser2_Vtbl,
}
IWebBrowser2_Vtbl :: struct {
	using IWebBrowserApp_Vtbl: IWebBrowserApp_Vtbl,
	Navigate2: proc "system" (
		this: ^IWebBrowser2,
		URL: ^VARIANT,
		Flags: ^VARIANT,
		TargetFrameName: ^VARIANT,
		PostData: ^VARIANT,
		Headers: ^VARIANT,
	) -> HRESULT,
	QueryStatusWB: proc "system" (this: ^IWebBrowser2, cmdID: OLECMDID, pcmdf: ^OLECMDF) -> HRESULT,
	ExecWB: proc "system" (
		this: ^IWebBrowser2,
		cmdID: OLECMDID,
		cmdexecopt: OLECMDEXECOPT,
		pvaIn: ^VARIANT,
		pvaOut: ^VARIANT,
	) -> HRESULT,
	ShowBrowserBar: proc "system" (
		this: ^IWebBrowser2,
		pvaClsid: ^VARIANT,
		pvarShow: ^VARIANT,
		pvarSize: ^VARIANT,
	) -> HRESULT,
	get_ReadyState: proc "system" (this: ^IWebBrowser2, plReadyState: ^READYSTATE) -> HRESULT,
	get_Offline: proc "system" (this: ^IWebBrowser2, pbOffline: ^VARIANT_BOOL) -> HRESULT,
	put_Offline: proc "system" (this: ^IWebBrowser2, bOffline: VARIANT_BOOL) -> HRESULT,
	get_Silent: proc "system" (this: ^IWebBrowser2, pbSilent: ^VARIANT_BOOL) -> HRESULT,
	put_Silent: proc "system" (this: ^IWebBrowser2, bSilent: VARIANT_BOOL) -> HRESULT,
	get_RegisterAsBrowser: proc "system" (this: ^IWebBrowser2, pbRegister: ^VARIANT_BOOL) -> HRESULT,
	put_RegisterAsBrowser: proc "system" (this: ^IWebBrowser2, bRegister: VARIANT_BOOL) -> HRESULT,
	get_RegisterAsDropTarget: proc "system" (this: ^IWebBrowser2, pbRegister: ^VARIANT_BOOL) -> HRESULT,
	put_RegisterAsDropTarget: proc "system" (this: ^IWebBrowser2, bRegister: VARIANT_BOOL) -> HRESULT,
	get_TheaterMode: proc "system" (this: ^IWebBrowser2, pbRegister: ^VARIANT_BOOL) -> HRESULT,
	put_TheaterMode: proc "system" (this: ^IWebBrowser2, bRegister: VARIANT_BOOL) -> HRESULT,
	get_AddressBar: proc "system" (this: ^IWebBrowser2, Value: ^VARIANT_BOOL) -> HRESULT,
	put_AddressBar: proc "system" (this: ^IWebBrowser2, Value: VARIANT_BOOL) -> HRESULT,
	get_Resizable: proc "system" (this: ^IWebBrowser2, Value: ^VARIANT_BOOL) -> HRESULT,
	put_Resizable: proc "system" (this: ^IWebBrowser2, Value: VARIANT_BOOL) -> HRESULT,
}
IID_IWebBrowser2 :: GUID{0xD30C1661, 0xCDAF, 0x11D0, {0x8A, 0x3E, 0x00, 0xC0, 0x4F, 0xC9, 0xE2, 0x6E}}

IWebBrowserApp :: struct #raw_union {
	#subtype IWebBrowser: IWebBrowser,
	using Vtbl: ^IWebBrowserApp_Vtbl,
}
IWebBrowserApp_Vtbl :: struct {
	using IWebBrowser_Vtbl: IWebBrowser_Vtbl,
	Quit: proc "system" (this: ^IWebBrowserApp) -> HRESULT,
	ClientToWindow: proc "system" (this: ^IWebBrowserApp, pcx: ^i32, pcy: ^i32) -> HRESULT,
	PutProperty: proc "system" (this: ^IWebBrowserApp, Property: BSTR, vtValue: VARIANT) -> HRESULT,
	GetProperty: proc "system" (this: ^IWebBrowserApp, Property: BSTR, pvtValue: ^VARIANT) -> HRESULT,
	get_Name: proc "system" (this: ^IWebBrowserApp, Name: ^BSTR) -> HRESULT,
	get_HWND: proc "system" (this: ^IWebBrowserApp, pHWND: ^SHANDLE_PTR) -> HRESULT,
	get_FullName: proc "system" (this: ^IWebBrowserApp, FullName: ^BSTR) -> HRESULT,
	get_Path: proc "system" (this: ^IWebBrowserApp, Path: ^BSTR) -> HRESULT,
	get_Visible: proc "system" (this: ^IWebBrowserApp, pBool: ^VARIANT_BOOL) -> HRESULT,
	put_Visible: proc "system" (this: ^IWebBrowserApp, Value: VARIANT_BOOL) -> HRESULT,
	get_StatusBar: proc "system" (this: ^IWebBrowserApp, pBool: ^VARIANT_BOOL) -> HRESULT,
	put_StatusBar: proc "system" (this: ^IWebBrowserApp, Value: VARIANT_BOOL) -> HRESULT,
	get_StatusText: proc "system" (this: ^IWebBrowserApp, StatusText: ^BSTR) -> HRESULT,
	put_StatusText: proc "system" (this: ^IWebBrowserApp, StatusText: BSTR) -> HRESULT,
	get_ToolBar: proc "system" (this: ^IWebBrowserApp, Value: ^i32) -> HRESULT,
	put_ToolBar: proc "system" (this: ^IWebBrowserApp, Value: i32) -> HRESULT,
	get_MenuBar: proc "system" (this: ^IWebBrowserApp, Value: ^VARIANT_BOOL) -> HRESULT,
	put_MenuBar: proc "system" (this: ^IWebBrowserApp, Value: VARIANT_BOOL) -> HRESULT,
	get_FullScreen: proc "system" (this: ^IWebBrowserApp, pbFullScreen: ^VARIANT_BOOL) -> HRESULT,
	put_FullScreen: proc "system" (this: ^IWebBrowserApp, bFullScreen: VARIANT_BOOL) -> HRESULT,
}
IID_IWebBrowserApp :: GUID{0x0002DF05, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iwebwizardextension ]]
IWebWizardExtension :: struct #raw_union {
	#subtype IWizardExtension: IWizardExtension,
	using Vtbl: ^IWebWizardExtension_Vtbl,
}
IWebWizardExtension_Vtbl :: struct {
	using IWizardExtension_Vtbl: IWizardExtension_Vtbl,
	SetInitialURL: proc "system" (this: ^IWebWizardExtension, pszURL: PWSTR) -> HRESULT,
	SetErrorURL: proc "system" (this: ^IWebWizardExtension, pszErrorURL: PWSTR) -> HRESULT,
}
IID_IWebWizardExtension :: GUID{0x0E6B3F66, 0x98D1, 0x48C0, {0xA2, 0x22, 0xFB, 0xDE, 0x74, 0xE2, 0xFB, 0xC5}}

IWebWizardHost :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IWebWizardHost_Vtbl,
}
IWebWizardHost_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	FinalBack: proc "system" (this: ^IWebWizardHost) -> HRESULT,
	FinalNext: proc "system" (this: ^IWebWizardHost) -> HRESULT,
	Cancel: proc "system" (this: ^IWebWizardHost) -> HRESULT,
	put_Caption: proc "system" (this: ^IWebWizardHost, bstrCaption: BSTR) -> HRESULT,
	get_Caption: proc "system" (this: ^IWebWizardHost, pbstrCaption: ^BSTR) -> HRESULT,
	put_Property: proc "system" (this: ^IWebWizardHost, bstrPropertyName: BSTR, pvProperty: ^VARIANT) -> HRESULT,
	get_Property: proc "system" (this: ^IWebWizardHost, bstrPropertyName: BSTR, pvProperty: ^VARIANT) -> HRESULT,
	SetWizardButtons: proc "system" (
		this: ^IWebWizardHost,
		vfEnableBack: VARIANT_BOOL,
		vfEnableNext: VARIANT_BOOL,
		vfLastPage: VARIANT_BOOL,
	) -> HRESULT,
	SetHeaderText: proc "system" (this: ^IWebWizardHost, bstrHeaderTitle: BSTR, bstrHeaderSubtitle: BSTR) -> HRESULT,
}
IID_IWebWizardHost :: GUID{0x18BCC359, 0x4990, 0x4BFB, {0xB9, 0x51, 0x3C, 0x83, 0x70, 0x2B, 0xE5, 0xF9}}

IWebWizardHost2 :: struct #raw_union {
	#subtype IWebWizardHost: IWebWizardHost,
	using Vtbl: ^IWebWizardHost2_Vtbl,
}
IWebWizardHost2_Vtbl :: struct {
	using IWebWizardHost_Vtbl: IWebWizardHost_Vtbl,
	SignString: proc "system" (this: ^IWebWizardHost2, value: BSTR, signedValue: ^BSTR) -> HRESULT,
}
IID_IWebWizardHost2 :: GUID{0xF9C013DC, 0x3C23, 0x4041, {0x8E, 0x39, 0xCF, 0xB4, 0x02, 0xF7, 0xEA, 0x59}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iwizardextension ]]
IWizardExtension :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IWizardExtension_Vtbl,
}
IWizardExtension_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	AddPages: proc "system" (
		this: ^IWizardExtension,
		aPages: [^]HPROPSHEETPAGE,
		cPages: u32,
		pnPagesAdded: ^u32,
	) -> HRESULT,
	GetFirstPage: proc "system" (this: ^IWizardExtension, phpage: ^HPROPSHEETPAGE) -> HRESULT,
	GetLastPage: proc "system" (this: ^IWizardExtension, phpage: ^HPROPSHEETPAGE) -> HRESULT,
}
IID_IWizardExtension :: GUID{0xC02EA696, 0x86CC, 0x491E, {0x9B, 0x23, 0x74, 0x39, 0x4A, 0x04, 0x44, 0xA8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/nn-shobjidl-iwizardsite ]]
IWizardSite :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IWizardSite_Vtbl,
}
IWizardSite_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetPreviousPage: proc "system" (this: ^IWizardSite, phpage: ^HPROPSHEETPAGE) -> HRESULT,
	GetNextPage: proc "system" (this: ^IWizardSite, phpage: ^HPROPSHEETPAGE) -> HRESULT,
	GetCancelledPage: proc "system" (this: ^IWizardSite, phpage: ^HPROPSHEETPAGE) -> HRESULT,
}
IID_IWizardSite :: GUID{0x88960F5B, 0x422F, 0x4E7B, {0x80, 0x13, 0x73, 0x41, 0x53, 0x81, 0xC3, 0xC3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-kf_category ]]
KF_CATEGORY :: enum i32 {
	VIRTUAL = 1,
	FIXED = 2,
	COMMON = 3,
	PERUSER = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-known_folder_flag ]]
KNOWN_FOLDER_FLAG :: distinct bit_set[enum {
	FORCE_APP_DATA_REDIRECTION = 19,
	RETURN_FILTER_REDIRECTION_TARGET = 18,
	FORCE_PACKAGE_REDIRECTION = 17,
	NO_PACKAGE_REDIRECTION = 16,
	FORCE_APPCONTAINER_REDIRECTION = 17,
	NO_APPCONTAINER_REDIRECTION = 16,
	CREATE = 15,
	DONT_VERIFY = 14,
	DONT_UNEXPAND = 13,
	NO_ALIAS = 12,
	INIT = 11,
	DEFAULT_PATH = 10,
	NOT_PARENT_RELATIVE = 9,
	SIMPLE_IDLIST = 8,
	ALIAS_ONLY = 31,
}; i32]
KNOWN_FOLDER_FLAG_DEFAULT :: transmute(KNOWN_FOLDER_FLAG)i32(0)

KNOWNDESTCATEGORY :: enum i32 {
	FREQUENT = 1,
	RECENT = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-knownfolder_definition ]]
KNOWNFOLDER_DEFINITION :: struct {
	category: KF_CATEGORY,
	pszName: PWSTR,
	pszDescription: PWSTR,
	fidParent: GUID,
	pszRelativePath: PWSTR,
	pszParsingName: PWSTR,
	pszTooltip: PWSTR,
	pszLocalizedName: PWSTR,
	pszIcon: PWSTR,
	pszSecurity: PWSTR,
	dwAttributes: u32,
	kfdFlags: u32,
	ftidType: GUID,
}

KnownFolderManager :: struct {
}
IID_KnownFolderManager :: GUID{0x4DF0C730, 0xDF9D, 0x4AE3, {0x91, 0x53, 0xAA, 0x6B, 0x82, 0xE9, 0x79, 0x5A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-libraryfolderfilter ]]
LIBRARYFOLDERFILTER :: enum i32 {
	FORCEFILESYSTEM = 1,
	STORAGEITEMS = 2,
	ALLITEMS = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-librarymanagedialogoptions ]]
LIBRARYMANAGEDIALOGOPTIONS :: distinct bit_set[enum {
	ALLOWUNINDEXABLENETWORKLOCATIONS = 0,
}; i32]
LIBRARYMANAGEDIALOGOPTIONS_DEFAULT :: transmute(LIBRARYMANAGEDIALOGOPTIONS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-libraryoptionflags ]]
LIBRARYOPTIONFLAGS :: distinct bit_set[enum {
	PINNEDTONAVPANE = 0,
	MASK_ALL = 0,
}; i32]
LIBRARYOPTIONFLAGS_DEFAULT :: transmute(LIBRARYOPTIONFLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-librarysaveflags ]]
LIBRARYSAVEFLAGS :: distinct bit_set[enum {
	OVERRIDEEXISTING = 0,
	MAKEUNIQUENAME = 1,
}; i32]
LIBRARYSAVEFLAGS_FAILIFTHERE :: transmute(LIBRARYSAVEFLAGS)i32(0)

LocalThumbnailCache :: struct {
}
IID_LocalThumbnailCache :: GUID{0x50EF4544, 0xAC9F, 0x4A8E, {0xB2, 0x1B, 0x8A, 0x26, 0x18, 0x0D, 0xB1, 0x3F}}

LPFNDFMCALLBACK :: #type proc "system" (
	psf: ^IShellFolder,
	hwnd: HWND,
	pdtobj: ^IDataObject,
	uMsg: u32,
	wParam: WPARAM,
	lParam: LPARAM,
) -> HRESULT

LPFNVIEWCALLBACK :: #type proc "system" (
	psvOuter: ^IShellView,
	psf: ^IShellFolder,
	hwndMain: HWND,
	uMsg: u32,
	wParam: WPARAM,
	lParam: LPARAM,
) -> HRESULT

MailRecipient :: struct {
}
IID_MailRecipient :: GUID{0x9E56BE60, 0xC50F, 0x11CF, {0x9A, 0x2C, 0x00, 0xA0, 0xC9, 0x0A, 0x90, 0xCE}}

MENUBANDHANDLERCID :: enum i32 {
	BHANDCID_PIDLSELECT = 0,
}

MENUPOPUPPOPUPFLAGS :: enum i32 {
	SETFOCUS = 1,
	INITIALSELECT = 2,
	NOANIMATE = 4,
	KEYBOARD = 16,
	REPOSITION = 32,
	FORCEZORDER = 64,
	FINALSELECT = 128,
	TOP = 536870912,
	LEFT = 1073741824,
	RIGHT = 1610612736,
	BOTTOM = -2147483648,
	POS_MASK = -536870912,
	ALIGN_LEFT = 33554432,
	ALIGN_RIGHT = 67108864,
}

MENUPOPUPSELECT :: enum i32 {
	EXECUTE = 0,
	FULLCANCEL = 1,
	CANCELLEVEL = 2,
	SELECTLEFT = 3,
	SELECTRIGHT = 4,
	CHILDTRACKING = 5,
}

MERGE_UPDATE_STATUS :: enum i32 {
	COMPLETE = 0,
	USERINPUTNEEDED = 1,
	FAILED = 2,
}

MergedCategorizer :: struct {
}
IID_MergedCategorizer :: GUID{0x8E827C11, 0x33E7, 0x4BC1, {0xB2, 0x42, 0x8C, 0xD9, 0xA1, 0xC2, 0xB3, 0x04}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/intshcut/ne-intshcut-mimeassociationdialog_in_flags ]]
MIMEASSOCIATIONDIALOG_IN_FLAGS :: enum i32 {
	DLG_FL_REGISTER_ASSOC = 1,
}

MM_FLAGS :: distinct bit_set[enum {
	ADDSEPARATOR = 0,
	SUBMENUSHAVEIDS = 1,
	DONTREMOVESEPS = 2,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-monitor_app_visibility ]]
MONITOR_APP_VISIBILITY :: enum i32 {
	UNKNOWN = 0,
	NO_APP_VISIBLE = 1,
	APP_VISIBLE = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-multikeyhelpa ]]
MULTIKEYHELPA :: struct {
	mkSize: u32,
	mkKeylist: CHAR,
	szKeyphrase: [1]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-multikeyhelpw ]]
MULTIKEYHELPW :: struct {
	mkSize: u32,
	mkKeylist: u16,
	szKeyphrase: [1]u16,
}

NamespaceTreeControl :: struct {
}
IID_NamespaceTreeControl :: GUID{0xAE054212, 0x3535, 0x4430, {0x83, 0xED, 0xD5, 0x01, 0xAA, 0x66, 0x80, 0xE6}}

NamespaceWalker :: struct {
}
IID_NamespaceWalker :: GUID{0x72EB61E0, 0x8672, 0x4303, {0x91, 0x75, 0xF2, 0xE4, 0xC6, 0x8B, 0x2E, 0x7C}}

NAMESPACEWALKFLAG :: distinct bit_set[enum {
	NONE_IMPLIES_ALL = 0,
	ONE_IMPLIES_ALL = 1,
	DONT_TRAVERSE_LINKS = 2,
	DONT_ACCUMULATE_RESULT = 3,
	TRAVERSE_STREAM_JUNCTIONS = 4,
	FILESYSTEM_ONLY = 5,
	SHOW_PROGRESS = 6,
	FLAG_VIEWORDER = 7,
	IGNORE_AUTOPLAY_HIDA = 8,
	ASYNC = 9,
	DONT_RESOLVE_LINKS = 10,
	ACCUMULATE_FOLDERS = 11,
	DONT_SORT = 12,
	USE_TRANSFER_MEDIUM = 13,
	DONT_TRAVERSE_STREAM_JUNCTIONS = 14,
	ANY_IMPLIES_ALL = 15,
}; i32]
NAMESPACEWALKFLAG_DEFAULT :: transmute(NAMESPACEWALKFLAG)i32(0)

NATIVE_DISPLAY_ORIENTATION :: enum i32 {
	LANDSCAPE = 0,
	PORTRAIT = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-nc_address ]]
NC_ADDRESS :: struct {
	pAddrInfo: ^NET_ADDRESS_INFO,
	PortNumber: u16,
	PrefixLength: u8,
}

NetworkConnections :: struct {
}
IID_NetworkConnections :: GUID{0x7007ACC7, 0x3202, 0x11D1, {0xAA, 0xD2, 0x00, 0x80, 0x5F, 0xC1, 0x27, 0x0E}}

NetworkExplorerFolder :: struct {
}
IID_NetworkExplorerFolder :: GUID{0xF02C1A0D, 0xBE21, 0x4350, {0x88, 0xB0, 0x73, 0x67, 0xFC, 0x96, 0xEF, 0x3C}}

NetworkPlaces :: struct {
}
IID_NetworkPlaces :: GUID{0x208D2C60, 0x3AEA, 0x1069, {0xA2, 0xD7, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/cpl/ns-cpl-newcplinfoa ]]
NEWCPLINFOA :: struct #packed {
	dwSize: u32,
	dwFlags: u32,
	dwHelpContext: u32,
	lData: int,
	hIcon: HICON,
	szName: [32]CHAR,
	szInfo: [64]CHAR,
	szHelpFile: [128]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/cpl/ns-cpl-newcplinfow ]]
NEWCPLINFOW :: struct #packed {
	dwSize: u32,
	dwFlags: u32,
	dwHelpContext: u32,
	lData: int,
	hIcon: HICON,
	szName: [32]u16,
	szInfo: [64]u16,
	szHelpFile: [128]u16,
}

NewProcessCauseConstants :: enum i32 {
	ProtectedModeRedirect = 1,
}

NOTIFY_ICON_DATA_FLAGS :: distinct bit_set[enum {
	MESSAGE = 0,
	ICON = 1,
	TIP = 2,
	STATE = 3,
	INFO = 4,
	GUID = 5,
	REALTIME = 6,
	SHOWTIP = 7,
}; u32]

NOTIFY_ICON_INFOTIP_FLAGS :: distinct bit_set[enum {
	INFO = 0,
	WARNING = 1,
	USER = 2,
	NOSOUND = 4,
	LARGE_ICON = 5,
	RESPECT_QUIET_TIME = 7,
}; u32]
NOTIFY_ICON_INFOTIP_FLAGS_NONE :: transmute(NOTIFY_ICON_INFOTIP_FLAGS)u32(0x00000000)
NOTIFY_ICON_INFOTIP_FLAGS_ERROR :: transmute(NOTIFY_ICON_INFOTIP_FLAGS)u32(0x00000003)
NOTIFY_ICON_INFOTIP_FLAGS_ICON_MASK :: transmute(NOTIFY_ICON_INFOTIP_FLAGS)u32(0x0000000F)

NOTIFY_ICON_MESSAGE :: enum u32 {
	ADD = 0x00000000,
	MODIFY = 0x00000001,
	DELETE = 0x00000002,
	SETFOCUS = 0x00000003,
	SETVERSION = 0x00000004,
}

NOTIFY_ICON_STATE :: distinct bit_set[enum {
	HIDDEN = 0,
	SHAREDICON = 1,
}; u32]

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-notifyicondataa ]]
	NOTIFYICONDATAA :: struct {
		cbSize: u32,
		hWnd: HWND,
		uID: u32,
		uFlags: NOTIFY_ICON_DATA_FLAGS,
		uCallbackMessage: u32,
		hIcon: HICON,
		szTip: [128]CHAR,
		dwState: NOTIFY_ICON_STATE,
		dwStateMask: NOTIFY_ICON_STATE,
		szInfo: [256]CHAR,
		using _: struct #raw_union #packed {
			uTimeout: u32,
			uVersion: u32,
		},
		szInfoTitle: [64]CHAR,
		dwInfoFlags: NOTIFY_ICON_INFOTIP_FLAGS,
		guidItem: GUID,
		hBalloonIcon: HICON,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-notifyicondataa ]]
	NOTIFYICONDATAA :: struct #packed {
		cbSize: u32,
		hWnd: HWND,
		uID: u32,
		uFlags: NOTIFY_ICON_DATA_FLAGS,
		uCallbackMessage: u32,
		hIcon: HICON,
		szTip: [128]CHAR,
		dwState: NOTIFY_ICON_STATE,
		dwStateMask: NOTIFY_ICON_STATE,
		szInfo: [256]CHAR,
		using _: struct #raw_union #packed {
			uTimeout: u32,
			uVersion: u32,
		},
		szInfoTitle: [64]CHAR,
		dwInfoFlags: NOTIFY_ICON_INFOTIP_FLAGS,
		guidItem: GUID,
		hBalloonIcon: HICON,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-notifyicondataw ]]
	NOTIFYICONDATAW :: struct {
		cbSize: u32,
		hWnd: HWND,
		uID: u32,
		uFlags: NOTIFY_ICON_DATA_FLAGS,
		uCallbackMessage: u32,
		hIcon: HICON,
		szTip: [128]u16,
		dwState: NOTIFY_ICON_STATE,
		dwStateMask: NOTIFY_ICON_STATE,
		szInfo: [256]u16,
		using _: struct #raw_union #packed {
			uTimeout: u32,
			uVersion: u32,
		},
		szInfoTitle: [64]u16,
		dwInfoFlags: NOTIFY_ICON_INFOTIP_FLAGS,
		guidItem: GUID,
		hBalloonIcon: HICON,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-notifyicondataw ]]
	NOTIFYICONDATAW :: struct #packed {
		cbSize: u32,
		hWnd: HWND,
		uID: u32,
		uFlags: NOTIFY_ICON_DATA_FLAGS,
		uCallbackMessage: u32,
		hIcon: HICON,
		szTip: [128]u16,
		dwState: NOTIFY_ICON_STATE,
		dwStateMask: NOTIFY_ICON_STATE,
		szInfo: [256]u16,
		using _: struct #raw_union #packed {
			uTimeout: u32,
			uVersion: u32,
		},
		szInfoTitle: [64]u16,
		dwInfoFlags: NOTIFY_ICON_INFOTIP_FLAGS,
		guidItem: GUID,
		hBalloonIcon: HICON,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-notifyiconidentifier ]]
	NOTIFYICONIDENTIFIER :: struct {
		cbSize: u32,
		hWnd: HWND,
		uID: u32,
		guidItem: GUID,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-notifyiconidentifier ]]
	NOTIFYICONIDENTIFIER :: struct #packed {
		cbSize: u32,
		hWnd: HWND,
		uID: u32,
		guidItem: GUID,
	}
}

NPCredentialProvider :: struct {
}
IID_NPCredentialProvider :: GUID{0x3DD6BEC0, 0x8193, 0x4FFE, {0xAE, 0x25, 0xE0, 0x8E, 0x39, 0xEA, 0x40, 0x63}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-nresarray ]]
NRESARRAY :: struct {
	cItems: u32,
	nr: [1]NETRESOURCEA,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/ns-shobjidl-nstccustomdraw ]]
NSTCCUSTOMDRAW :: struct {
	psi: ^IShellItem,
	uItemState: u32,
	nstcis: u32,
	pszText: PWSTR,
	iImage: i32,
	himl: HIMAGELIST,
	iLevel: i32,
	iIndent: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-nstcfoldercapabilities ]]
NSTCFOLDERCAPABILITIES :: distinct bit_set[enum {
	PINNEDITEMFILTERING = 0,
	DELAY_REGISTER_NOTIFY = 1,
}; i32]
NSTCFOLDERCAPABILITIES_NONE :: transmute(NSTCFOLDERCAPABILITIES)i32(0)

NSTCGNI :: enum i32 {
	NEXT = 0,
	NEXTVISIBLE = 1,
	PREV = 2,
	PREVVISIBLE = 3,
	PARENT = 4,
	CHILD = 5,
	FIRSTVISIBLE = 6,
	LASTVISIBLE = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-nstcstyle2 ]]
NSTCSTYLE2 :: distinct bit_set[enum {
	STCS2_INTERRUPTNOTIFICATIONS = 0,
	STCS2_SHOWNULLSPACEMENU = 1,
	STCS2_DISPLAYPADDING = 2,
	STCS2_DISPLAYPINNEDONLY = 3,
	TSCS2_NOSINGLETONAUTOEXPAND = 4,
	TSCS2_NEVERINSERTNONENUMERATED = 5,
}; i32]
NSTCSTYLE2_STCS2_DEFAULT :: transmute(NSTCSTYLE2)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-nt_console_props ]]
NT_CONSOLE_PROPS :: struct #packed {
	dbh: DATABLOCK_HEADER,
	wFillAttribute: u16,
	wPopupFillAttribute: u16,
	dwScreenBufferSize: COORD,
	dwWindowSize: COORD,
	dwWindowOrigin: COORD,
	nFont: u32,
	nInputBufferSize: u32,
	dwFontSize: COORD,
	uFontFamily: u32,
	uFontWeight: u32,
	FaceName: [32]u16,
	uCursorSize: u32,
	bFullScreen: BOOL,
	bQuickEdit: BOOL,
	bInsertMode: BOOL,
	bAutoPosition: BOOL,
	uHistoryBufferSize: u32,
	uNumberOfHistoryBuffers: u32,
	bHistoryNoDup: BOOL,
	ColorTable: [16]COLORREF,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-nt_fe_console_props ]]
NT_FE_CONSOLE_PROPS :: struct #packed {
	dbh: DATABLOCK_HEADER,
	uCodePage: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-nwmf ]]
NWMF :: distinct bit_set[enum {
	UNLOADING = 0,
	USERINITED = 1,
	FIRST = 2,
	OVERRIDEKEY = 3,
	SHOWHELP = 4,
	HTMLDIALOG = 5,
	FROMDIALOGCHILD = 6,
	USERREQUESTED = 7,
	USERALLOWED = 8,
	FORCEWINDOW = 16,
	FORCETAB = 17,
	SUGGESTWINDOW = 18,
	SUGGESTTAB = 19,
	INACTIVETAB = 20,
}; i32]

OfflineFolderStatus :: enum i32 {
	INACTIVE = -1,
	ONLINE = 0,
	OFFLINE = 1,
	SERVERBACK = 2,
	DIRTYCACHE = 3,
}

OnexCredentialProvider :: struct {
}
IID_OnexCredentialProvider :: GUID{0x07AA0886, 0xCC8D, 0x4E19, {0xA4, 0x10, 0x1C, 0x75, 0xAF, 0x68, 0x6E, 0x62}}

OnexPlapSmartcardCredentialProvider :: struct {
}
IID_OnexPlapSmartcardCredentialProvider :: GUID{0x33C86CD6, 0x705F, 0x4BA1, {0x9A, 0xDB, 0x67, 0x07, 0x0B, 0x83, 0x77, 0x75}}

OPEN_AS_INFO_FLAGS :: distinct bit_set[enum {
	ALLOW_REGISTRATION = 0,
	REGISTER_EXT = 1,
	EXEC = 2,
	FORCE_REGISTRATION = 3,
	HIDE_REGISTRATION = 5,
	URL_PROTOCOL = 6,
	FILE_IS_URI = 7,
}; i32]

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-open_printer_props_infoa ]]
	OPEN_PRINTER_PROPS_INFOA :: struct {
		dwSize: u32,
		pszSheetName: PSTR,
		uSheetIndex: u32,
		dwFlags: u32,
		bModal: BOOL,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-open_printer_props_infoa ]]
	OPEN_PRINTER_PROPS_INFOA :: struct #packed {
		dwSize: u32,
		pszSheetName: PSTR,
		uSheetIndex: u32,
		dwFlags: u32,
		bModal: BOOL,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-open_printer_props_infow ]]
	OPEN_PRINTER_PROPS_INFOW :: struct {
		dwSize: u32,
		pszSheetName: PWSTR,
		uSheetIndex: u32,
		dwFlags: u32,
		bModal: BOOL,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-open_printer_props_infow ]]
	OPEN_PRINTER_PROPS_INFOW :: struct #packed {
		dwSize: u32,
		pszSheetName: PWSTR,
		uSheetIndex: u32,
		dwFlags: u32,
		bModal: BOOL,
	}
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-openasinfo ]]
OPENASINFO :: struct {
	pcszFile: PWSTR,
	pcszClass: PWSTR,
	oaifInFlags: OPEN_AS_INFO_FLAGS,
}

OpenControlPanel :: struct {
}
IID_OpenControlPanel :: GUID{0x06622D85, 0x6856, 0x4460, {0x8D, 0xE1, 0xA8, 0x19, 0x21, 0xB4, 0x1C, 0x4B}}

OS :: enum u32 {
	WINDOWS = 0x00000000,
	NT = 0x00000001,
	WIN95ORGREATER = 0x00000002,
	NT4ORGREATER = 0x00000003,
	WIN98ORGREATER = 0x00000005,
	WIN98_GOLD = 0x00000006,
	WIN2000ORGREATER = 0x00000007,
	WIN2000PRO = 0x00000008,
	WIN2000SERVER = 0x00000009,
	WIN2000ADVSERVER = 0x0000000A,
	WIN2000DATACENTER = 0x0000000B,
	WIN2000TERMINAL = 0x0000000C,
	EMBEDDED = 0x0000000D,
	TERMINALCLIENT = 0x0000000E,
	TERMINALREMOTEADMIN = 0x0000000F,
	WIN95_GOLD = 0x00000010,
	MEORGREATER = 0x00000011,
	XPORGREATER = 0x00000012,
	HOME = 0x00000013,
	PROFESSIONAL = 0x00000014,
	DATACENTER = 0x00000015,
	ADVSERVER = 0x00000016,
	SERVER = 0x00000017,
	TERMINALSERVER = 0x00000018,
	PERSONALTERMINALSERVER = 0x00000019,
	FASTUSERSWITCHING = 0x0000001A,
	WELCOMELOGONUI = 0x0000001B,
	DOMAINMEMBER = 0x0000001C,
	ANYSERVER = 0x0000001D,
	WOW6432 = 0x0000001E,
	WEBSERVER = 0x0000001F,
	SMALLBUSINESSSERVER = 0x00000020,
	TABLETPC = 0x00000021,
	SERVERADMINUI = 0x00000022,
	MEDIACENTER = 0x00000023,
	APPLIANCE = 0x00000024,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-package_execution_state ]]
PACKAGE_EXECUTION_STATE :: enum i32 {
	UNKNOWN = 0,
	RUNNING = 1,
	SUSPENDING = 2,
	SUSPENDED = 3,
	TERMINATED = 4,
}

PackageDebugSettings :: struct {
}
IID_PackageDebugSettings :: GUID{0xB1AEC16F, 0x2383, 0x4852, {0xB0, 0xE9, 0x8F, 0x0B, 0x1D, 0xC6, 0x6B, 0x4D}}

PAPPCONSTRAIN_CHANGE_ROUTINE :: #type proc "system" (Constrained: BOOLEAN, Context: rawptr)

PAPPCONSTRAIN_REGISTRATION :: int

PAPPSTATE_CHANGE_ROUTINE :: #type proc "system" (Quiesced: BOOLEAN, Context: rawptr)

PAPPSTATE_REGISTRATION :: int

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-parsedurla ]]
PARSEDURLA :: struct {
	cbSize: u32,
	pszProtocol: PSTR,
	cchProtocol: u32,
	pszSuffix: PSTR,
	cchSuffix: u32,
	nScheme: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-parsedurlw ]]
PARSEDURLW :: struct {
	cbSize: u32,
	pszProtocol: PWSTR,
	cchProtocol: u32,
	pszSuffix: PWSTR,
	cchSuffix: u32,
	nScheme: u32,
}

PasswordCredentialProvider :: struct {
}
IID_PasswordCredentialProvider :: GUID{0x60B78E88, 0xEAD8, 0x445C, {0x9C, 0xFD, 0x0B, 0x87, 0xF7, 0x4E, 0xA6, 0xCD}}

PATHCCH_OPTIONS :: distinct bit_set[enum {
	ALLOW_LONG_PATHS = 0,
	FORCE_ENABLE_LONG_NAME_PROCESS = 1,
	FORCE_DISABLE_LONG_NAME_PROCESS = 2,
	DO_NOT_NORMALIZE_SEGMENTS = 3,
	ENSURE_IS_EXTENDED_LENGTH_PATH = 4,
	ENSURE_TRAILING_SLASH = 5,
	CANONICALIZE_SLASHES = 6,
}; u32]
PATHCCH_OPTIONS_NONE :: transmute(PATHCCH_OPTIONS)u32(0x00000000)

PCS_RET :: distinct bit_set[enum {
	FATAL = 31,
	REPLACEDCHAR = 0,
	REMOVEDCHAR = 1,
	TRUNCATED = 2,
	PATHTOOLONG = 3,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-persist_folder_target_info ]]
PERSIST_FOLDER_TARGET_INFO :: struct {
	pidlTargetFolder: ^ITEMIDLIST,
	szTargetParsingName: [260]u16,
	szNetworkProvider: [260]u16,
	dwAttributes: u32,
	csidl: i32,
}

PFNCANSHAREFOLDERW :: #type proc "system" (pszPath: PWSTR) -> HRESULT

PFNSHOWSHAREFOLDERUIW :: #type proc "system" (hwndParent: HWND, pszPath: PWSTR) -> HRESULT

PID_INTSITE :: enum i32 {
	WHATSNEW = 2,
	AUTHOR = 3,
	LASTVISIT = 4,
	LASTMOD = 5,
	VISITCOUNT = 6,
	DESCRIPTION = 7,
	COMMENT = 8,
	FLAGS = 9,
	CONTENTLEN = 10,
	CONTENTCODE = 11,
	RECURSE = 12,
	WATCH = 13,
	SUBSCRIPTION = 14,
	URL = 15,
	TITLE = 16,
	CODEPAGE = 18,
	TRACKING = 19,
	ICONINDEX = 20,
	ICONFILE = 21,
	ROAMED = 34,
}

PID_IS :: enum i32 {
	URL = 2,
	NAME = 4,
	WORKINGDIR = 5,
	HOTKEY = 6,
	SHOWCMD = 7,
	ICONINDEX = 8,
	ICONFILE = 9,
	WHATSNEW = 10,
	AUTHOR = 11,
	DESCRIPTION = 12,
	COMMENT = 13,
	ROAMED = 15,
}

PIDISF_FLAGS :: distinct bit_set[enum {
	RECENTLYCHANGED = 0,
	CACHEDSTICKY = 1,
	CACHEIMAGES = 4,
	FOLLOWALLLINKS = 5,
}; i32]

PIDISM_OPTIONS :: enum i32 {
	GLOBAL = 0,
	WATCH = 1,
	DONTWATCH = 2,
}

PIDISR_INFO :: enum i32 {
	UP_TO_DATE = 0,
	NEEDS_ADD = 1,
	NEEDS_UPDATE = 2,
	NEEDS_DELETE = 3,
}

PINLogonCredentialProvider :: struct {
}
IID_PINLogonCredentialProvider :: GUID{0xCB82EA12, 0x9F71, 0x446D, {0x89, 0xE1, 0x8D, 0x09, 0x24, 0xE1, 0x25, 0x6E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-previewhandlerframeinfo ]]
PREVIEWHANDLERFRAMEINFO :: struct {
	haccel: HACCEL,
	cAccelEntries: u32,
}

PreviousVersions :: struct {
}
IID_PreviousVersions :: GUID{0x596AB062, 0xB4D2, 0x4215, {0x9F, 0x74, 0xE9, 0x10, 0x9B, 0x0A, 0x81, 0x53}}

PRF_FLAGS :: distinct bit_set[enum {
	VERIFYEXISTS = 0,
	FIRSTDIRDEF = 2,
	DONTFINDLNK = 3,
	REQUIREABSOLUTE = 4,
}; i32]
PRF_FLAGS_TRYPROGRAMEXTENSIONS :: transmute(PRF_FLAGS)i32(3)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/profinfo/ns-profinfo-profileinfoa ]]
PROFILEINFOA :: struct {
	dwSize: u32,
	dwFlags: u32,
	lpUserName: PSTR,
	lpProfilePath: PSTR,
	lpDefaultPath: PSTR,
	lpServerName: PSTR,
	lpPolicyPath: PSTR,
	hProfile: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/profinfo/ns-profinfo-profileinfow ]]
PROFILEINFOW :: struct {
	dwSize: u32,
	dwFlags: u32,
	lpUserName: PWSTR,
	lpProfilePath: PWSTR,
	lpDefaultPath: PWSTR,
	lpServerName: PWSTR,
	lpPolicyPath: PWSTR,
	hProfile: HANDLE,
}

PropertiesUI :: struct {
}
IID_PropertiesUI :: GUID{0xD912F8CF, 0x0396, 0x4915, {0x88, 0x4E, 0xFB, 0x42, 0x5D, 0x32, 0x94, 0x3B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/ns-shappmgr-pubappinfo ]]
PUBAPPINFO :: struct {
	cbSize: u32,
	dwMask: u32,
	pszSource: PWSTR,
	stAssigned: SYSTEMTIME,
	stPublished: SYSTEMTIME,
	stScheduled: SYSTEMTIME,
	stExpire: SYSTEMTIME,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/ne-shappmgr-pubappinfoflags ]]
PUBAPPINFOFLAGS :: enum i32 {
	SOURCE = 1,
	ASSIGNEDTIME = 2,
	PUBLISHEDTIME = 4,
	SCHEDULEDTIME = 8,
	EXPIRETIME = 16,
}

PublishDropTarget :: struct {
}
IID_PublishDropTarget :: GUID{0xCC6EEFFB, 0x43F6, 0x46C5, {0x96, 0x19, 0x51, 0xD5, 0x71, 0x96, 0x7F, 0x7D}}

PublishingWizard :: struct {
}
IID_PublishingWizard :: GUID{0x6B33163C, 0x76A5, 0x4B6C, {0xBF, 0x21, 0x45, 0xDE, 0x9C, 0xD5, 0x03, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-qcminfo ]]
QCMINFO :: struct {
	hmenu: HMENU,
	indexMenu: u32,
	idCmdFirst: u32,
	idCmdLast: u32,
	pIdMap: ^QCMINFO_IDMAP,
}

QCMINFO_IDMAP :: struct {
	nMaxIds: u32,
	pIdList: [1]QCMINFO_IDMAP_PLACEMENT,
}

QCMINFO_IDMAP_PLACEMENT :: struct {
	id: u32,
	fFlags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ns-shlwapi-qitab ]]
QITAB :: struct {
	piid: ^GUID,
	dwOffset: u32,
}

QITIPF_FLAGS :: distinct bit_set[enum {
	TIPF_USENAME = 0,
	TIPF_LINKNOTARGET = 1,
	TIPF_LINKUSETARGET = 2,
	TIPF_USESLOWTIP = 3,
	TIPF_SINGLELINE = 4,
	F_CACHED = 0,
	F_DONTEXPANDFOLDER = 1,
}; i32]
QITIPF_FLAGS_TIPF_DEFAULT :: transmute(QITIPF_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ne-shellapi-query_user_notification_state ]]
QUERY_USER_NOTIFICATION_STATE :: enum i32 {
	NOT_PRESENT = 1,
	BUSY = 2,
	RUNNING_D3D_FULL_SCREEN = 3,
	PRESENTATION_MODE = 4,
	ACCEPTS_NOTIFICATIONS = 5,
	QUIET_TIME = 6,
	APP = 7,
}

QueryCancelAutoPlay :: struct {
}
IID_QueryCancelAutoPlay :: GUID{0x331F1768, 0x05A9, 0x4DDD, {0xB8, 0x6E, 0xDA, 0xE3, 0x4D, 0xDC, 0x99, 0x8A}}

RASProvider :: struct {
}
IID_RASProvider :: GUID{0x5537E283, 0xB1E7, 0x4EF8, {0x9C, 0x6E, 0x7A, 0xB0, 0xAF, 0xE5, 0x05, 0x6D}}

RefreshConstants :: enum i32 {
	NORMAL = 0,
	IFEXPIRED = 1,
	COMPLETELY = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-restrictions ]]
RESTRICTIONS :: enum i32 {
	NONE = 0,
	NORUN = 1,
	NOCLOSE = 2,
	NOSAVESET = 4,
	NOFILEMENU = 8,
	NOSETFOLDERS = 16,
	NOSETTASKBAR = 32,
	NODESKTOP = 64,
	NOFIND = 128,
	NODRIVES = 256,
	NODRIVEAUTORUN = 512,
	NODRIVETYPEAUTORUN = 1024,
	NONETHOOD = 2048,
	STARTBANNER = 4096,
	RESTRICTRUN = 8192,
	NOPRINTERTABS = 16384,
	NOPRINTERDELETE = 32768,
	NOPRINTERADD = 65536,
	NOSTARTMENUSUBFOLDERS = 131072,
	MYDOCSONNET = 262144,
	NOEXITTODOS = 524288,
	ENFORCESHELLEXTSECURITY = 1048576,
	LINKRESOLVEIGNORELINKINFO = 2097152,
	NOCOMMONGROUPS = 4194304,
	SEPARATEDESKTOPPROCESS = 8388608,
	NOWEB = 16777216,
	NOTRAYCONTEXTMENU = 33554432,
	NOVIEWCONTEXTMENU = 67108864,
	NONETCONNECTDISCONNECT = 134217728,
	STARTMENULOGOFF = 268435456,
	NOSETTINGSASSIST = 536870912,
	NOINTERNETICON = 1073741825,
	NORECENTDOCSHISTORY = 1073741826,
	NORECENTDOCSMENU = 1073741827,
	NOACTIVEDESKTOP = 1073741828,
	NOACTIVEDESKTOPCHANGES = 1073741829,
	NOFAVORITESMENU = 1073741830,
	CLEARRECENTDOCSONEXIT = 1073741831,
	CLASSICSHELL = 1073741832,
	NOCUSTOMIZEWEBVIEW = 1073741833,
	NOHTMLWALLPAPER = 1073741840,
	NOCHANGINGWALLPAPER = 1073741841,
	NODESKCOMP = 1073741842,
	NOADDDESKCOMP = 1073741843,
	NODELDESKCOMP = 1073741844,
	NOCLOSEDESKCOMP = 1073741845,
	NOCLOSE_DRAGDROPBAND = 1073741846,
	NOMOVINGBAND = 1073741847,
	NOEDITDESKCOMP = 1073741848,
	NORESOLVESEARCH = 1073741849,
	NORESOLVETRACK = 1073741850,
	FORCECOPYACLWITHFILE = 1073741851,
	NOFORGETSOFTWAREUPDATE = 1073741853,
	NOSETACTIVEDESKTOP = 1073741854,
	NOUPDATEWINDOWS = 1073741855,
	NOCHANGESTARMENU = 1073741856,
	NOFOLDEROPTIONS = 1073741857,
	HASFINDCOMPUTERS = 1073741858,
	INTELLIMENUS = 1073741859,
	RUNDLGMEMCHECKBOX = 1073741860,
	ARP_ShowPostSetup = 1073741861,
	NOCSC = 1073741862,
	NOCONTROLPANEL = 1073741863,
	ENUMWORKGROUP = 1073741864,
	ARP_NOARP = 1073741865,
	ARP_NOREMOVEPAGE = 1073741866,
	ARP_NOADDPAGE = 1073741867,
	ARP_NOWINSETUPPAGE = 1073741868,
	GREYMSIADS = 1073741869,
	NOCHANGEMAPPEDDRIVELABEL = 1073741870,
	NOCHANGEMAPPEDDRIVECOMMENT = 1073741871,
	MaxRecentDocs = 1073741872,
	NONETWORKCONNECTIONS = 1073741873,
	FORCESTARTMENULOGOFF = 1073741874,
	NOWEBVIEW = 1073741875,
	NOCUSTOMIZETHISFOLDER = 1073741876,
	NOENCRYPTION = 1073741877,
	DONTSHOWSUPERHIDDEN = 1073741879,
	NOSHELLSEARCHBUTTON = 1073741880,
	NOHARDWARETAB = 1073741881,
	NORUNASINSTALLPROMPT = 1073741882,
	PROMPTRUNASINSTALLNETPATH = 1073741883,
	NOMANAGEMYCOMPUTERVERB = 1073741884,
	DISALLOWRUN = 1073741886,
	NOWELCOMESCREEN = 1073741887,
	RESTRICTCPL = 1073741888,
	DISALLOWCPL = 1073741889,
	NOSMBALLOONTIP = 1073741890,
	NOSMHELP = 1073741891,
	NOWINKEYS = 1073741892,
	NOENCRYPTONMOVE = 1073741893,
	NOLOCALMACHINERUN = 1073741894,
	NOCURRENTUSERRUN = 1073741895,
	NOLOCALMACHINERUNONCE = 1073741896,
	NOCURRENTUSERRUNONCE = 1073741897,
	FORCEACTIVEDESKTOPON = 1073741898,
	NOVIEWONDRIVE = 1073741900,
	NONETCRAWL = 1073741901,
	NOSHAREDDOCUMENTS = 1073741902,
	NOSMMYDOCS = 1073741903,
	NOSMMYPICS = 1073741904,
	ALLOWBITBUCKDRIVES = 1073741905,
	NONLEGACYSHELLMODE = 1073741906,
	NOCONTROLPANELBARRICADE = 1073741907,
	NOSTARTPAGE = 1073741908,
	NOAUTOTRAYNOTIFY = 1073741909,
	NOTASKGROUPING = 1073741910,
	NOCDBURNING = 1073741911,
	MYCOMPNOPROP = 1073741912,
	MYDOCSNOPROP = 1073741913,
	NOSTARTPANEL = 1073741914,
	NODISPLAYAPPEARANCEPAGE = 1073741915,
	NOTHEMESTAB = 1073741916,
	NOVISUALSTYLECHOICE = 1073741917,
	NOSIZECHOICE = 1073741918,
	NOCOLORCHOICE = 1073741919,
	SETVISUALSTYLE = 1073741920,
	STARTRUNNOHOMEPATH = 1073741921,
	NOUSERNAMEINSTARTPANEL = 1073741922,
	NOMYCOMPUTERICON = 1073741923,
	NOSMNETWORKPLACES = 1073741924,
	NOSMPINNEDLIST = 1073741925,
	NOSMMYMUSIC = 1073741926,
	NOSMEJECTPC = 1073741927,
	NOSMMOREPROGRAMS = 1073741928,
	NOSMMFUPROGRAMS = 1073741929,
	NOTRAYITEMSDISPLAY = 1073741930,
	NOTOOLBARSONTASKBAR = 1073741931,
	NOSMCONFIGUREPROGRAMS = 1073741935,
	HIDECLOCK = 1073741936,
	NOLOWDISKSPACECHECKS = 1073741937,
	NOENTIRENETWORK = 1073741938,
	NODESKTOPCLEANUP = 1073741939,
	BITBUCKNUKEONDELETE = 1073741940,
	BITBUCKCONFIRMDELETE = 1073741941,
	BITBUCKNOPROP = 1073741942,
	NODISPBACKGROUND = 1073741943,
	NODISPSCREENSAVEPG = 1073741944,
	NODISPSETTINGSPG = 1073741945,
	NODISPSCREENSAVEPREVIEW = 1073741946,
	NODISPLAYCPL = 1073741947,
	HIDERUNASVERB = 1073741948,
	NOTHUMBNAILCACHE = 1073741949,
	NOSTRCMPLOGICAL = 1073741950,
	NOPUBLISHWIZARD = 1073741951,
	NOONLINEPRINTSWIZARD = 1073741952,
	NOWEBSERVICES = 1073741953,
	ALLOWUNHASHEDWEBVIEW = 1073741954,
	ALLOWLEGACYWEBVIEW = 1073741955,
	REVERTWEBVIEWSECURITY = 1073741956,
	INHERITCONSOLEHANDLES = 1073741958,
	NOREMOTERECURSIVEEVENTS = 1073741961,
	NOREMOTECHANGENOTIFY = 1073741969,
	NOENUMENTIRENETWORK = 1073741971,
	NOINTERNETOPENWITH = 1073741973,
	DONTRETRYBADNETNAME = 1073741979,
	ALLOWFILECLSIDJUNCTIONS = 1073741980,
	NOUPNPINSTALL = 1073741981,
	ARP_DONTGROUPPATCHES = 1073741996,
	ARP_NOCHOOSEPROGRAMSPAGE = 1073741997,
	NODISCONNECT = 1090519041,
	NOSECURITY = 1090519042,
	NOFILEASSOCIATE = 1090519043,
	ALLOWCOMMENTTOGGLE = 1090519044,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/ne-shellscalingapi-scale_change_flags ]]
SCALE_CHANGE_FLAGS :: distinct bit_set[enum {
	SCALE = 0,
	PHYSICAL = 1,
}; i32]
SCALE_CHANGE_FLAGS_VALUE_NONE :: transmute(SCALE_CHANGE_FLAGS)i32(0)

ScheduledTasks :: struct {
}
IID_ScheduledTasks :: GUID{0xD6277990, 0x4C6A, 0x11CF, {0x8D, 0x87, 0x00, 0xAA, 0x00, 0x60, 0xF5, 0xBF}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-scnrt_status ]]
SCNRT_STATUS :: enum i32 {
	ENABLE = 0,
	DISABLE = 1,
}

SearchFolderItemFactory :: struct {
}
IID_SearchFolderItemFactory :: GUID{0x14010E02, 0xBBBD, 0x41F0, {0x88, 0xE3, 0xED, 0xA3, 0x71, 0x21, 0x65, 0x84}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/ne-shdeprecated-securelockcode ]]
SECURELOCKCODE :: enum i32 {
	NOCHANGE = -1,
	SET_UNSECURE = 0,
	SET_MIXED = 1,
	SET_SECUREUNKNOWNBIT = 2,
	SET_SECURE40BIT = 3,
	SET_SECURE56BIT = 4,
	SET_FORTEZZA = 5,
	SET_SECURE128BIT = 6,
	FIRSTSUGGEST = 7,
	SUGGEST_UNSECURE = 7,
	SUGGEST_MIXED = 8,
	SUGGEST_SECUREUNKNOWNBIT = 9,
	SUGGEST_SECURE40BIT = 10,
	SUGGEST_SECURE56BIT = 11,
	SUGGEST_FORTEZZA = 12,
	SUGGEST_SECURE128BIT = 13,
}

SecureLockIconConstants :: enum i32 {
	Unsecure = 0,
	Mixed = 1,
	SecureUnknownBits = 2,
	Secure40Bit = 3,
	Secure56Bit = 4,
	SecureFortezza = 5,
	Secure128Bit = 6,
}

SFBS_FLAGS :: enum i32 {
	ROUND_TO_NEAREST_DISPLAYED_DIGIT = 1,
	TRUNCATE_UNDISPLAYED_DECIMAL_DIGITS = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-sfv_create ]]
SFV_CREATE :: struct {
	cbSize: u32,
	pshf: ^IShellFolder,
	psvOuter: ^IShellView,
	psfvcb: ^IShellFolderViewCB,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-sfv_setitempos ]]
SFV_SETITEMPOS :: struct {
	pidl: ^ITEMIDLIST,
	pt: POINT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-sfvm_helptopic_data ]]
SFVM_HELPTOPIC_DATA :: struct {
	wszHelpFile: [260]u16,
	wszHelpTopic: [260]u16,
}

SFVM_MESSAGE_ID :: enum i32 {
	MERGEMENU = 1,
	INVOKECOMMAND = 2,
	GETHELPTEXT = 3,
	GETTOOLTIPTEXT = 4,
	GETBUTTONINFO = 5,
	GETBUTTONS = 6,
	INITMENUPOPUP = 7,
	FSNOTIFY = 14,
	WINDOWCREATED = 15,
	GETDETAILSOF = 23,
	COLUMNCLICK = 24,
	QUERYFSNOTIFY = 25,
	DEFITEMCOUNT = 26,
	DEFVIEWMODE = 27,
	UNMERGEMENU = 28,
	UPDATESTATUSBAR = 31,
	BACKGROUNDENUM = 32,
	DIDDRAGDROP = 36,
	SETISFV = 39,
	THISIDLIST = 41,
	ADDPROPERTYPAGES = 47,
	BACKGROUNDENUMDONE = 48,
	GETNOTIFY = 49,
	GETSORTDEFAULTS = 53,
	SIZE = 57,
	GETZONE = 58,
	GETPANE = 59,
	GETHELPTOPIC = 63,
	GETANIMATION = 68,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-sfvm_proppage_data ]]
SFVM_PROPPAGE_DATA :: struct {
	dwReserved: u32,
	pfn: LPFNSVADDPROPSHEETPAGE,
	lParam: LPARAM,
}

SFVS_SELECT :: enum i32 {
	NONE = 0,
	ALLITEMS = 1,
	INVERT = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-shard ]]
SHARD :: enum i32 {
	PIDL = 1,
	PATHA = 2,
	PATHW = 3,
	APPIDINFO = 4,
	APPIDINFOIDLIST = 5,
	LINK = 6,
	APPIDINFOLINK = 7,
	SHELLITEM = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shardappidinfo ]]
SHARDAPPIDINFO :: struct #packed {
	psi: ^IShellItem,
	pszAppID: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shardappidinfoidlist ]]
SHARDAPPIDINFOIDLIST :: struct #packed {
	pidl: ^ITEMIDLIST,
	pszAppID: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shardappidinfolink ]]
SHARDAPPIDINFOLINK :: struct #packed {
	psl: ^IShellLinkA,
	pszAppID: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-share_role ]]
SHARE_ROLE :: enum i32 {
	INVALID = -1,
	READER = 0,
	CONTRIBUTOR = 1,
	CO_OWNER = 2,
	OWNER = 3,
	CUSTOM = 4,
	MIXED = 5,
}

SharedBitmap :: struct {
}
IID_SharedBitmap :: GUID{0x4DB26476, 0x6787, 0x4046, {0xB8, 0x36, 0xE8, 0x41, 0x2A, 0x9E, 0x8A, 0x27}}

SharingConfigurationManager :: struct {
}
IID_SharingConfigurationManager :: GUID{0x49F371E1, 0x8C5C, 0x4D9C, {0x9A, 0x3B, 0x54, 0xA6, 0x82, 0x7F, 0x51, 0x3C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shchangedwordasidlist ]]
SHChangeDWORDAsIDList :: struct #packed {
	cb: u16,
	dwItem1: u32,
	dwItem2: u32,
	cbZero: u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shchangenotifyentry ]]
SHChangeNotifyEntry :: struct #packed {
	pidl: ^ITEMIDLIST,
	fRecursive: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shchangeproductkeyasidlist ]]
SHChangeProductKeyAsIDList :: struct #packed {
	cb: u16,
	wszProductKey: [39]u16,
	cbZero: u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shchangeupdateimageidlist ]]
SHChangeUpdateImageIDList :: struct #packed {
	cb: u16,
	iIconIndex: i32,
	iCurIndex: i32,
	uFlags: u32,
	dwProcessID: u32,
	szName: [260]u16,
	cbZero: u16,
}

SHCNE_ID :: distinct bit_set[enum {
	RENAMEITEM = 0,
	CREATE = 1,
	DELETE = 2,
	MKDIR = 3,
	RMDIR = 4,
	MEDIAINSERTED = 5,
	MEDIAREMOVED = 6,
	DRIVEREMOVED = 7,
	DRIVEADD = 8,
	NETSHARE = 9,
	NETUNSHARE = 10,
	ATTRIBUTES = 11,
	UPDATEDIR = 12,
	UPDATEITEM = 13,
	SERVERDISCONNECT = 14,
	UPDATEIMAGE = 15,
	DRIVEADDGUI = 16,
	RENAMEFOLDER = 17,
	FREESPACE = 18,
	EXTENDED_EVENT = 26,
	ASSOCCHANGED = 27,
	INTERRUPT = 31,
}; u32]
SHCNE_ID_DISKEVENTS :: transmute(SHCNE_ID)u32(0x0002381F)
SHCNE_ID_GLOBALEVENTS :: transmute(SHCNE_ID)u32(0x0C0581E0)
SHCNE_ID_ALLEVENTS :: transmute(SHCNE_ID)u32(0x7FFFFFFF)

SHCNF_FLAGS :: distinct bit_set[enum {
	PATHA = 0,
	PRINTERA = 1,
	FLUSH = 12,
	NOTIFYRECURSIVE = 16,
}; u32]
SHCNF_FLAGS_IDLIST :: transmute(SHCNF_FLAGS)u32(0x00000000)
SHCNF_FLAGS_DWORD :: transmute(SHCNF_FLAGS)u32(0x00000003)
SHCNF_FLAGS_PATHW :: transmute(SHCNF_FLAGS)u32(0x00000005)
SHCNF_FLAGS_PRINTERW :: transmute(SHCNF_FLAGS)u32(0x00000006)
SHCNF_FLAGS_TYPE :: transmute(SHCNF_FLAGS)u32(0x000000FF)
SHCNF_FLAGS_FLUSHNOWAIT :: transmute(SHCNF_FLAGS)u32(0x00003000)
SHCNF_FLAGS_PATH :: transmute(SHCNF_FLAGS)u32(0x00000005)
SHCNF_FLAGS_PRINTER :: transmute(SHCNF_FLAGS)u32(0x00000006)

SHCNRF_SOURCE :: distinct bit_set[enum {
	InterruptLevel = 0,
	ShellLevel = 1,
	RecursiveInterrupt = 12,
	NewDelivery = 15,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shcolumndata ]]
SHCOLUMNDATA :: struct {
	dwFlags: u32,
	dwFileAttributes: u32,
	dwReserved: u32,
	pwszExt: PWSTR,
	wszFile: [260]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shcolumninfo ]]
SHCOLUMNINFO :: struct #packed {
	scid: PROPERTYKEY,
	vt: VARENUM,
	fmt: u32,
	cChars: u32,
	csFlags: u32,
	wszTitle: [80]u16,
	wszDescription: [128]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shcolumninit ]]
SHCOLUMNINIT :: struct {
	dwFlags: u32,
	dwReserved: u32,
	wszFolder: [260]u16,
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shcreateprocessinfow ]]
	SHCREATEPROCESSINFOW :: struct {
		cbSize: u32,
		fMask: u32,
		hwnd: HWND,
		pszFile: PWSTR,
		pszParameters: PWSTR,
		pszCurrentDirectory: PWSTR,
		hUserToken: HANDLE,
		lpProcessAttributes: ^SECURITY_ATTRIBUTES,
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		bInheritHandles: BOOL,
		dwCreationFlags: u32,
		lpStartupInfo: ^STARTUPINFOW,
		lpProcessInformation: ^PROCESS_INFORMATION,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shcreateprocessinfow ]]
	SHCREATEPROCESSINFOW :: struct #packed {
		cbSize: u32,
		fMask: u32,
		hwnd: HWND,
		pszFile: PWSTR,
		pszParameters: PWSTR,
		pszCurrentDirectory: PWSTR,
		hUserToken: HANDLE,
		lpProcessAttributes: ^SECURITY_ATTRIBUTES,
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		bInheritHandles: BOOL,
		dwCreationFlags: u32,
		lpStartupInfo: ^STARTUPINFOW,
		lpProcessInformation: ^PROCESS_INFORMATION,
	}
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shdescriptionid ]]
SHDESCRIPTIONID :: struct {
	dwDescriptionId: SHDID_ID,
	clsid: GUID,
}

SHDID_ID :: enum i32 {
	ROOT_REGITEM = 1,
	FS_FILE = 2,
	FS_DIRECTORY = 3,
	FS_OTHER = 4,
	COMPUTER_DRIVE35 = 5,
	COMPUTER_DRIVE525 = 6,
	COMPUTER_REMOVABLE = 7,
	COMPUTER_FIXED = 8,
	COMPUTER_NETDRIVE = 9,
	COMPUTER_CDROM = 10,
	COMPUTER_RAMDISK = 11,
	COMPUTER_OTHER = 12,
	NET_DOMAIN = 13,
	NET_SERVER = 14,
	NET_SHARE = 15,
	NET_RESTOFNET = 16,
	NET_OTHER = 17,
	COMPUTER_IMAGING = 18,
	COMPUTER_AUDIO = 19,
	COMPUTER_SHAREDDOCS = 20,
	MOBILE_DEVICE = 21,
	REMOTE_DESKTOP_DRIVE = 22,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-shdragimage ]]
SHDRAGIMAGE :: struct {
	sizeDragImage: SIZE,
	ptOffset: POINT,
	hbmpDragImage: HBITMAP,
	crColorKey: COLORREF,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/shell ]]
Shell :: struct {
}
IID_Shell :: GUID{0x13709620, 0xC279, 0x11CE, {0xA4, 0x9E, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00}}

SHELL_AUTOCOMPLETE_FLAGS :: distinct bit_set[enum {
	FILESYSTEM = 0,
	URLHISTORY = 1,
	URLMRU = 2,
	USETAB = 3,
	FILESYS_ONLY = 4,
	FILESYS_DIRS = 5,
	VIRTUAL_NAMESPACE = 6,
	AUTOSUGGEST_FORCE_ON = 28,
	AUTOSUGGEST_FORCE_OFF = 29,
	AUTOAPPEND_FORCE_ON = 30,
	AUTOAPPEND_FORCE_OFF = 31,
}; u32]
SHELL_AUTOCOMPLETE_FLAGS_DEFAULT :: transmute(SHELL_AUTOCOMPLETE_FLAGS)u32(0x00000000)
SHELL_AUTOCOMPLETE_FLAGS_URLALL :: transmute(SHELL_AUTOCOMPLETE_FLAGS)u32(0x00000006)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-shell_item_resource ]]
SHELL_ITEM_RESOURCE :: struct {
	guidType: GUID,
	szName: [260]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-shell_link_data_flags ]]
SHELL_LINK_DATA_FLAGS :: distinct bit_set[enum {
	HAS_ID_LIST = 0,
	HAS_LINK_INFO = 1,
	HAS_NAME = 2,
	HAS_RELPATH = 3,
	HAS_WORKINGDIR = 4,
	HAS_ARGS = 5,
	HAS_ICONLOCATION = 6,
	UNICODE = 7,
	FORCE_NO_LINKINFO = 8,
	HAS_EXP_SZ = 9,
	RUN_IN_SEPARATE = 10,
	HAS_DARWINID = 12,
	RUNAS_USER = 13,
	HAS_EXP_ICON_SZ = 14,
	NO_PIDL_ALIAS = 15,
	FORCE_UNCNAME = 16,
	RUN_WITH_SHIMLAYER = 17,
	FORCE_NO_LINKTRACK = 18,
	ENABLE_TARGET_METADATA = 19,
	DISABLE_LINK_PATH_TRACKING = 20,
	DISABLE_KNOWNFOLDER_RELATIVE_TRACKING = 21,
	NO_KF_ALIAS = 22,
	ALLOW_LINK_TO_LINK = 23,
	UNALIAS_ON_SAVE = 24,
	PREFER_ENVIRONMENT_PATH = 25,
	KEEP_LOCAL_IDLIST_FOR_UNC_TARGET = 26,
	PERSIST_VOLUME_ID_RELATIVE = 27,
	RESERVED = 31,
}; i32]
SHELL_LINK_DATA_FLAGS_DEFAULT :: transmute(SHELL_LINK_DATA_FLAGS)i32(0)
SHELL_LINK_DATA_FLAGS_VALID :: transmute(SHELL_LINK_DATA_FLAGS)i32(268433407)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellscalingapi/ne-shellscalingapi-shell_ui_component ]]
SHELL_UI_COMPONENT :: enum i32 {
	TASKBARS = 0,
	NOTIFICATIONAREA = 1,
	DESKBAND = 2,
}

SHELLBROWSERSHOWCONTROL :: enum i32 {
	HIDE = 0,
	SHOW = 1,
	TOGGLE = 2,
	QUERY = 3,
}

ShellBrowserWindow :: struct {
}
IID_ShellBrowserWindow :: GUID{0xC08AFD90, 0xF2A1, 0x11D1, {0x84, 0x55, 0x00, 0xA0, 0xC9, 0x1F, 0x38, 0x80}}

ShellDesktop :: struct {
}
IID_ShellDesktop :: GUID{0x00021400, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

ShellDispatchInproc :: struct {
}
IID_ShellDispatchInproc :: GUID{0x0A89A860, 0xD7B1, 0x11CE, {0x83, 0x50, 0x44, 0x45, 0x53, 0x54, 0x00, 0x00}}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shellexecuteinfoa ]]
	SHELLEXECUTEINFOA :: struct {
		cbSize: u32,
		fMask: u32,
		hwnd: HWND,
		lpVerb: PSTR,
		lpFile: PSTR,
		lpParameters: PSTR,
		lpDirectory: PSTR,
		nShow: i32,
		hInstApp: HINSTANCE,
		lpIDList: rawptr,
		lpClass: PSTR,
		hkeyClass: HKEY,
		dwHotKey: u32,
		using _: struct #raw_union #packed {
			hIcon: HANDLE,
			hMonitor: HANDLE,
		},
		hProcess: HANDLE,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shellexecuteinfoa ]]
	SHELLEXECUTEINFOA :: struct #packed {
		cbSize: u32,
		fMask: u32,
		hwnd: HWND,
		lpVerb: PSTR,
		lpFile: PSTR,
		lpParameters: PSTR,
		lpDirectory: PSTR,
		nShow: i32,
		hInstApp: HINSTANCE,
		lpIDList: rawptr,
		lpClass: PSTR,
		hkeyClass: HKEY,
		dwHotKey: u32,
		using _: struct #raw_union #packed {
			hIcon: HANDLE,
			hMonitor: HANDLE,
		},
		hProcess: HANDLE,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shellexecuteinfow ]]
	SHELLEXECUTEINFOW :: struct {
		cbSize: u32,
		fMask: u32,
		hwnd: HWND,
		lpVerb: PWSTR,
		lpFile: PWSTR,
		lpParameters: PWSTR,
		lpDirectory: PWSTR,
		nShow: i32,
		hInstApp: HINSTANCE,
		lpIDList: rawptr,
		lpClass: PWSTR,
		hkeyClass: HKEY,
		dwHotKey: u32,
		using _: struct #raw_union #packed {
			hIcon: HANDLE,
			hMonitor: HANDLE,
		},
		hProcess: HANDLE,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shellexecuteinfow ]]
	SHELLEXECUTEINFOW :: struct #packed {
		cbSize: u32,
		fMask: u32,
		hwnd: HWND,
		lpVerb: PWSTR,
		lpFile: PWSTR,
		lpParameters: PWSTR,
		lpDirectory: PWSTR,
		nShow: i32,
		hInstApp: HINSTANCE,
		lpIDList: rawptr,
		lpClass: PWSTR,
		hkeyClass: HKEY,
		dwHotKey: u32,
		using _: struct #raw_union #packed {
			hIcon: HANDLE,
			hMonitor: HANDLE,
		},
		hProcess: HANDLE,
	}
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shellflagstate ]]
SHELLFLAGSTATE :: struct #packed {
	using _: bit_field i32 {
		fShowAllObjects: i32 | 1,
		fShowExtensions: i32 | 1,
		fNoConfirmRecycle: i32 | 1,
		fShowSysFiles: i32 | 1,
		fShowCompColor: i32 | 1,
		fDoubleClickInWebView: i32 | 1,
		fDesktopHTML: i32 | 1,
		fWin95Classic: i32 | 1,
		fDontPrettyPath: i32 | 1,
		fShowAttribCol: i32 | 1,
		fMapNetDrvBtn: i32 | 1,
		fShowInfoTip: i32 | 1,
		fHideIcons: i32 | 1,
		fAutoCheckSelect: i32 | 1,
		fIconsOnly: i32 | 1,
		fRestFlags: i32 | 1,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/shellfolderitem-object ]]
ShellFolderItem :: struct {
}
IID_ShellFolderItem :: GUID{0x2FE352EA, 0xFD1F, 0x11D2, {0xB1, 0xF4, 0x00, 0xC0, 0x4F, 0x8E, 0xEB, 0x3E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/shellfolderview ]]
ShellFolderView :: struct {
}
IID_ShellFolderView :: GUID{0x62112AA1, 0xEBE4, 0x11CF, {0xA5, 0xFB, 0x00, 0x20, 0xAF, 0xE7, 0x29, 0x2D}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/shellfolderviewoc-object ]]
ShellFolderViewOC :: struct {
}
IID_ShellFolderViewOC :: GUID{0x9BA05971, 0xF6A8, 0x11CF, {0xA4, 0x42, 0x00, 0xA0, 0xC9, 0x0A, 0x8F, 0x39}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/ne-shldisp-shellfolderviewoptions ]]
ShellFolderViewOptions :: enum i32 {
	SHOWALLOBJECTS = 1,
	SHOWEXTENSIONS = 2,
	SHOWCOMPCOLOR = 8,
	SHOWSYSFILES = 32,
	WIN95CLASSIC = 64,
	DOUBLECLICKINWEBVIEW = 128,
	DESKTOPHTML = 512,
}

ShellFSFolder :: struct {
}
IID_ShellFSFolder :: GUID{0xF3364BA0, 0x65B9, 0x11CE, {0xA9, 0xBA, 0x00, 0xAA, 0x00, 0x4A, 0xE8, 0x37}}

ShellImageDataFactory :: struct {
}
IID_ShellImageDataFactory :: GUID{0x66E4E4FB, 0xF385, 0x4DD0, {0x8D, 0x74, 0xA2, 0xEF, 0xD1, 0xBC, 0x61, 0x78}}

ShellItem :: struct {
}
IID_ShellItem :: GUID{0x9AC9FBE1, 0xE0A2, 0x4AD6, {0xB4, 0xEE, 0xE2, 0x12, 0x01, 0x3E, 0xA9, 0x17}}

ShellLibrary :: struct {
}
IID_ShellLibrary :: GUID{0xD9B3211D, 0xE57F, 0x4426, {0xAA, 0xEF, 0x30, 0xA8, 0x06, 0xAD, 0xD3, 0x97}}

ShellLink :: struct {
}
IID_ShellLink :: GUID{0x00021401, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/shelllinkobject-object ]]
ShellLinkObject :: struct {
}
IID_ShellLinkObject :: GUID{0x11219420, 0x1768, 0x11D1, {0x95, 0xBE, 0x00, 0x60, 0x97, 0x97, 0xEA, 0x4F}}

ShellNameSpace :: struct {
}
IID_ShellNameSpace :: GUID{0x55136805, 0xB2DE, 0x11D1, {0xB9, 0xF2, 0x00, 0xA0, 0xC9, 0x8B, 0xC5, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shldisp/ne-shldisp-shellspecialfolderconstants ]]
ShellSpecialFolderConstants :: enum i32 {
	DESKTOP = 0,
	PROGRAMS = 2,
	CONTROLS = 3,
	PRINTERS = 4,
	PERSONAL = 5,
	FAVORITES = 6,
	STARTUP = 7,
	RECENT = 8,
	SENDTO = 9,
	BITBUCKET = 10,
	STARTMENU = 11,
	DESKTOPDIRECTORY = 16,
	DRIVES = 17,
	NETWORK = 18,
	NETHOOD = 19,
	FONTS = 20,
	TEMPLATES = 21,
	COMMONSTARTMENU = 22,
	COMMONPROGRAMS = 23,
	COMMONSTARTUP = 24,
	COMMONDESKTOPDIR = 25,
	APPDATA = 26,
	PRINTHOOD = 27,
	LOCALAPPDATA = 28,
	ALTSTARTUP = 29,
	COMMONALTSTARTUP = 30,
	COMMONFAVORITES = 31,
	INTERNETCACHE = 32,
	COOKIES = 33,
	HISTORY = 34,
	COMMONAPPDATA = 35,
	WINDOWS = 36,
	SYSTEM = 37,
	PROGRAMFILES = 38,
	MYPICTURES = 39,
	PROFILE = 40,
	SYSTEMx86 = 41,
	PROGRAMFILESx86 = 48,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shellstatea ]]
SHELLSTATEA :: struct #packed {
	using _: bit_field i32 {
		fShowAllObjects: i32 | 1,
		fShowExtensions: i32 | 1,
		fNoConfirmRecycle: i32 | 1,
		fShowSysFiles: i32 | 1,
		fShowCompColor: i32 | 1,
		fDoubleClickInWebView: i32 | 1,
		fDesktopHTML: i32 | 1,
		fWin95Classic: i32 | 1,
		fDontPrettyPath: i32 | 1,
		fShowAttribCol: i32 | 1,
		fMapNetDrvBtn: i32 | 1,
		fShowInfoTip: i32 | 1,
		fHideIcons: i32 | 1,
		fWebView: i32 | 1,
		fFilter: i32 | 1,
		fShowSuperHidden: i32 | 1,
		fNoNetCrawling: i32 | 1,
	},
	dwWin95Unused: u32,
	uWin95Unused: u32,
	lParamSort: i32,
	iSortDirection: i32,
	version: u32,
	uNotUsed: u32,
	using _: bit_field i32 {
		fSepProcess: i32 | 1,
		fStartPanelOn: i32 | 1,
		fShowStartPage: i32 | 1,
		fAutoCheckSelect: i32 | 1,
		fIconsOnly: i32 | 1,
		fShowTypeOverlay: i32 | 1,
		fShowStatusBar: i32 | 1,
		fSpareFlags: i32 | 9,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shellstatew ]]
SHELLSTATEW :: struct #packed {
	using _: bit_field i32 {
		fShowAllObjects: i32 | 1,
		fShowExtensions: i32 | 1,
		fNoConfirmRecycle: i32 | 1,
		fShowSysFiles: i32 | 1,
		fShowCompColor: i32 | 1,
		fDoubleClickInWebView: i32 | 1,
		fDesktopHTML: i32 | 1,
		fWin95Classic: i32 | 1,
		fDontPrettyPath: i32 | 1,
		fShowAttribCol: i32 | 1,
		fMapNetDrvBtn: i32 | 1,
		fShowInfoTip: i32 | 1,
		fHideIcons: i32 | 1,
		fWebView: i32 | 1,
		fFilter: i32 | 1,
		fShowSuperHidden: i32 | 1,
		fNoNetCrawling: i32 | 1,
	},
	dwWin95Unused: u32,
	uWin95Unused: u32,
	lParamSort: i32,
	iSortDirection: i32,
	version: u32,
	uNotUsed: u32,
	using _: bit_field i32 {
		fSepProcess: i32 | 1,
		fStartPanelOn: i32 | 1,
		fShowStartPage: i32 | 1,
		fAutoCheckSelect: i32 | 1,
		fIconsOnly: i32 | 1,
		fShowTypeOverlay: i32 | 1,
		fShowStatusBar: i32 | 1,
		fSpareFlags: i32 | 9,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/shelluihelper ]]
ShellUIHelper :: struct {
}
IID_ShellUIHelper :: GUID{0x64AB4BB7, 0x111E, 0x11D1, {0x8F, 0x79, 0x00, 0xC0, 0x4F, 0xC2, 0xFB, 0xE1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/exdisp/ne-exdisp-shellwindowfindwindowoptions ]]
ShellWindowFindWindowOptions :: enum i32 {
	NEEDDISPATCH = 1,
	INCLUDEPENDING = 2,
	COOKIEPASSED = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/shellwindows ]]
ShellWindows :: struct {
}
IID_ShellWindows :: GUID{0x9BA05972, 0xF6A8, 0x11CF, {0xA4, 0x42, 0x00, 0xA0, 0xC9, 0x0A, 0x8F, 0x39}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/exdisp/ne-exdisp-shellwindowtypeconstants ]]
ShellWindowTypeConstants :: enum i32 {
	EXPLORER = 0,
	BROWSER = 1,
	_3RDPARTY = 2,
	CALLBACK = 4,
	DESKTOP = 8,
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileinfoa ]]
	SHFILEINFOA :: struct {
		hIcon: HICON,
		iIcon: i32,
		dwAttributes: u32,
		szDisplayName: [260]CHAR,
		szTypeName: [80]CHAR,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileinfoa ]]
	SHFILEINFOA :: struct #packed {
		hIcon: HICON,
		iIcon: i32,
		dwAttributes: u32,
		szDisplayName: [260]CHAR,
		szTypeName: [80]CHAR,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileinfow ]]
	SHFILEINFOW :: struct {
		hIcon: HICON,
		iIcon: i32,
		dwAttributes: u32,
		szDisplayName: [260]u16,
		szTypeName: [80]u16,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileinfow ]]
	SHFILEINFOW :: struct #packed {
		hIcon: HICON,
		iIcon: i32,
		dwAttributes: u32,
		szDisplayName: [260]u16,
		szTypeName: [80]u16,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileopstructa ]]
	SHFILEOPSTRUCTA :: struct {
		hwnd: HWND,
		wFunc: u32,
		pFrom: ^i8,
		pTo: ^i8,
		fFlags: u16,
		fAnyOperationsAborted: BOOL,
		hNameMappings: rawptr,
		lpszProgressTitle: PSTR,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileopstructa ]]
	SHFILEOPSTRUCTA :: struct #packed {
		hwnd: HWND,
		wFunc: u32,
		pFrom: ^i8,
		pTo: ^i8,
		fFlags: u16,
		fAnyOperationsAborted: BOOL,
		hNameMappings: rawptr,
		lpszProgressTitle: PSTR,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileopstructw ]]
	SHFILEOPSTRUCTW :: struct {
		hwnd: HWND,
		wFunc: u32,
		pFrom: PWSTR,
		pTo: PWSTR,
		fFlags: u16,
		fAnyOperationsAborted: BOOL,
		hNameMappings: rawptr,
		lpszProgressTitle: PWSTR,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shfileopstructw ]]
	SHFILEOPSTRUCTW :: struct #packed {
		hwnd: HWND,
		wFunc: u32,
		pFrom: PWSTR,
		pTo: PWSTR,
		fFlags: u16,
		fAnyOperationsAborted: BOOL,
		hNameMappings: rawptr,
		lpszProgressTitle: PWSTR,
	}
}

SHFMT_ID :: enum u32 {
	DEFAULT = 0x0000FFFF,
}

SHFMT_OPT :: distinct bit_set[enum {
	FULL = 0,
	SYSONLY = 1,
}; i32]
SHFMT_OPT_NONE :: transmute(SHFMT_OPT)i32(0)

SHFMT_RET :: enum u32 {
	ERROR = 0xFFFFFFFF,
	CANCEL = 0xFFFFFFFE,
	NOFORMAT = 0xFFFFFFFD,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-shfoldercustomsettings ]]
SHFOLDERCUSTOMSETTINGS :: struct {
	dwSize: u32,
	dwMask: u32,
	pvid: ^GUID,
	pszWebViewTemplate: PWSTR,
	cchWebViewTemplate: u32,
	pszWebViewTemplateVersion: PWSTR,
	pszInfoTip: PWSTR,
	cchInfoTip: u32,
	pclsid: ^GUID,
	dwFlags: u32,
	pszIconFile: PWSTR,
	cchIconFile: u32,
	iIconIndex: i32,
	pszLogo: PWSTR,
	cchLogo: u32,
}

SHGDFIL_FORMAT :: enum i32 {
	FINDDATA = 1,
	NETRESOURCE = 2,
	DESCRIPTIONID = 3,
}

SHGDNF :: enum u32 {
	NORMAL = 0x00000000,
	INFOLDER = 0x00000001,
	FOREDITING = 0x00001000,
	FORADDRESSBAR = 0x00004000,
	FORPARSING = 0x00008000,
}

SHGFI_FLAGS :: distinct bit_set[enum {
	ADDOVERLAYS = 5,
	ATTR_SPECIFIED = 17,
	ATTRIBUTES = 11,
	DISPLAYNAME = 9,
	EXETYPE = 13,
	ICON = 8,
	ICONLOCATION = 12,
	LINKOVERLAY = 15,
	OPENICON = 1,
	OVERLAYINDEX = 6,
	PIDL = 3,
	SELECTED = 16,
	SHELLICONSIZE = 2,
	SMALLICON = 0,
	SYSICONINDEX = 14,
	TYPENAME = 10,
	USEFILEATTRIBUTES = 4,
}; u32]
SHGFI_FLAGS_LARGEICON :: transmute(SHGFI_FLAGS)u32(0x00000000)

SHGFP_TYPE :: enum i32 {
	CURRENT = 0,
	DEFAULT = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-shglobalcounter ]]
SHGLOBALCOUNTER :: enum i32 {
	GLOBALCOUNTER_SEARCHMANAGER = 0,
	GLOBALCOUNTER_SEARCHOPTIONS = 1,
	GLOBALCOUNTER_FOLDERSETTINGSCHANGE = 2,
	GLOBALCOUNTER_RATINGS = 3,
	GLOBALCOUNTER_APPROVEDSITES = 4,
	GLOBALCOUNTER_RESTRICTIONS = 5,
	GLOBALCOUNTER_SHELLSETTINGSCHANGED = 6,
	GLOBALCOUNTER_SYSTEMPIDLCHANGE = 7,
	GLOBALCOUNTER_OVERLAYMANAGER = 8,
	GLOBALCOUNTER_QUERYASSOCIATIONS = 9,
	GLOBALCOUNTER_IESESSIONS = 10,
	GLOBALCOUNTER_IEONLY_SESSIONS = 11,
	GLOBALCOUNTER_APPLICATION_DESTINATIONS = 12,
	_UNUSED_RECYCLE_WAS_GLOBALCOUNTER_CSCSYNCINPROGRESS = 13,
	GLOBALCOUNTER_BITBUCKETNUMDELETERS = 14,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SHARES = 15,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_A = 16,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_B = 17,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_C = 18,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_D = 19,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_E = 20,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_F = 21,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_G = 22,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_H = 23,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_I = 24,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_J = 25,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_K = 26,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_L = 27,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_M = 28,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_N = 29,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_O = 30,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_P = 31,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Q = 32,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_R = 33,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_S = 34,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_T = 35,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_U = 36,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_V = 37,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_W = 38,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_X = 39,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Y = 40,
	GLOBALCOUNTER_RECYCLEDIRTYCOUNT_DRIVE_Z = 41,
	_UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEDIRTYCOUNT_SERVERDRIVE = 42,
	_UNUSED_RECYCLE_WAS_GLOBALCOUNTER_RECYCLEGLOBALDIRTYCOUNT = 43,
	GLOBALCOUNTER_RECYCLEBINENUM = 44,
	GLOBALCOUNTER_RECYCLEBINCORRUPTED = 45,
	GLOBALCOUNTER_RATINGS_STATECOUNTER = 46,
	GLOBALCOUNTER_PRIVATE_PROFILE_CACHE = 47,
	GLOBALCOUNTER_INTERNETTOOLBAR_LAYOUT = 48,
	GLOBALCOUNTER_FOLDERDEFINITION_CACHE = 49,
	GLOBALCOUNTER_COMMONPLACES_LIST_CACHE = 50,
	GLOBALCOUNTER_PRIVATE_PROFILE_CACHE_MACHINEWIDE = 51,
	GLOBALCOUNTER_ASSOCCHANGED = 52,
	GLOBALCOUNTER_APP_ITEMS_STATE_STORE_CACHE = 53,
	GLOBALCOUNTER_SETTINGSYNC_ENABLED = 54,
	GLOBALCOUNTER_APPSFOLDER_FILETYPEASSOCIATION_COUNTER = 55,
	GLOBALCOUNTER_USERINFOCHANGED = 56,
	GLOBALCOUNTER_SYNC_ENGINE_INFORMATION_CACHE_MACHINEWIDE = 57,
	GLOBALCOUNTER_BANNERS_DATAMODEL_CACHE_MACHINEWIDE = 58,
	GLOBALCOUNTER_MAXIMUMVALUE = 59,
}

SHGSI_FLAGS :: distinct bit_set[enum {
	ICON = 8,
	SYSICONINDEX = 14,
	LINKOVERLAY = 15,
	SELECTED = 16,
	SMALLICON = 0,
	SHELLICONSIZE = 2,
}; u32]
SHGSI_FLAGS_ICONLOCATION :: transmute(SHGSI_FLAGS)u32(0x00000000)
SHGSI_FLAGS_LARGEICON :: transmute(SHGSI_FLAGS)u32(0x00000000)

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shnamemappinga ]]
	SHNAMEMAPPINGA :: struct {
		pszOldPath: PSTR,
		pszNewPath: PSTR,
		cchOldPath: i32,
		cchNewPath: i32,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shnamemappinga ]]
	SHNAMEMAPPINGA :: struct #packed {
		pszOldPath: PSTR,
		pszNewPath: PSTR,
		cchOldPath: i32,
		cchNewPath: i32,
	}
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shnamemappingw ]]
	SHNAMEMAPPINGW :: struct {
		pszOldPath: PWSTR,
		pszNewPath: PWSTR,
		cchOldPath: i32,
		cchNewPath: i32,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shnamemappingw ]]
	SHNAMEMAPPINGW :: struct #packed {
		pszOldPath: PWSTR,
		pszNewPath: PWSTR,
		cchOldPath: i32,
		cchNewPath: i32,
	}
}

SHOP_TYPE :: distinct bit_set[enum {
	PRINTERNAME = 0,
	FILEPATH = 1,
	VOLUMEGUID = 2,
}; i32]

ShowInputPaneAnimationCoordinator :: struct {
}
IID_ShowInputPaneAnimationCoordinator :: GUID{0x1F046ABF, 0x3202, 0x4DC1, {0x8C, 0xB5, 0x3C, 0x67, 0x61, 0x7C, 0xE1, 0xFA}}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shqueryrbinfo ]]
	SHQUERYRBINFO :: struct {
		cbSize: u32,
		i64Size: i64,
		i64NumItems: i64,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shqueryrbinfo ]]
	SHQUERYRBINFO :: struct #packed {
		cbSize: u32,
		i64Size: i64,
		i64NumItems: i64,
	}
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-shregdel_flags ]]
SHREGDEL_FLAGS :: enum i32 {
	DEFAULT = 0,
	HKCU = 1,
	HKLM = 16,
	BOTH = 17,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-shregenum_flags ]]
SHREGENUM_FLAGS :: enum i32 {
	DEFAULT = 0,
	HKCU = 1,
	HKLM = 16,
	BOTH = 17,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ne-shellapi-shstockiconid ]]
SHSTOCKICONID :: enum i32 {
	DOCNOASSOC = 0,
	DOCASSOC = 1,
	APPLICATION = 2,
	FOLDER = 3,
	FOLDEROPEN = 4,
	DRIVE525 = 5,
	DRIVE35 = 6,
	DRIVEREMOVE = 7,
	DRIVEFIXED = 8,
	DRIVENET = 9,
	DRIVENETDISABLED = 10,
	DRIVECD = 11,
	DRIVERAM = 12,
	WORLD = 13,
	SERVER = 15,
	PRINTER = 16,
	MYNETWORK = 17,
	FIND = 22,
	HELP = 23,
	SHARE = 28,
	LINK = 29,
	SLOWFILE = 30,
	RECYCLER = 31,
	RECYCLERFULL = 32,
	MEDIACDAUDIO = 40,
	LOCK = 47,
	AUTOLIST = 49,
	PRINTERNET = 50,
	SERVERSHARE = 51,
	PRINTERFAX = 52,
	PRINTERFAXNET = 53,
	PRINTERFILE = 54,
	STACK = 55,
	MEDIASVCD = 56,
	STUFFEDFOLDER = 57,
	DRIVEUNKNOWN = 58,
	DRIVEDVD = 59,
	MEDIADVD = 60,
	MEDIADVDRAM = 61,
	MEDIADVDRW = 62,
	MEDIADVDR = 63,
	MEDIADVDROM = 64,
	MEDIACDAUDIOPLUS = 65,
	MEDIACDRW = 66,
	MEDIACDR = 67,
	MEDIACDBURN = 68,
	MEDIABLANKCD = 69,
	MEDIACDROM = 70,
	AUDIOFILES = 71,
	IMAGEFILES = 72,
	VIDEOFILES = 73,
	MIXEDFILES = 74,
	FOLDERBACK = 75,
	FOLDERFRONT = 76,
	SHIELD = 77,
	WARNING = 78,
	INFO = 79,
	ERROR = 80,
	KEY = 81,
	SOFTWARE = 82,
	RENAME = 83,
	DELETE = 84,
	MEDIAAUDIODVD = 85,
	MEDIAMOVIEDVD = 86,
	MEDIAENHANCEDCD = 87,
	MEDIAENHANCEDDVD = 88,
	MEDIAHDDVD = 89,
	MEDIABLURAY = 90,
	MEDIAVCD = 91,
	MEDIADVDPLUSR = 92,
	MEDIADVDPLUSRW = 93,
	DESKTOPPC = 94,
	MOBILEPC = 95,
	USERS = 96,
	MEDIASMARTMEDIA = 97,
	MEDIACOMPACTFLASH = 98,
	DEVICECELLPHONE = 99,
	DEVICECAMERA = 100,
	DEVICEVIDEOCAMERA = 101,
	DEVICEAUDIOPLAYER = 102,
	NETWORKCONNECT = 103,
	INTERNET = 104,
	ZIPFILE = 105,
	SETTINGS = 106,
	DRIVEHDDVD = 132,
	DRIVEBD = 133,
	MEDIAHDDVDROM = 134,
	MEDIAHDDVDR = 135,
	MEDIAHDDVDRAM = 136,
	MEDIABDROM = 137,
	MEDIABDR = 138,
	MEDIABDRE = 139,
	CLUSTEREDDRIVE = 140,
	MAX_ICONS = 181,
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shstockiconinfo ]]
	SHSTOCKICONINFO :: struct {
		cbSize: u32,
		hIcon: HICON,
		iSysImageIndex: i32,
		iIcon: i32,
		szPath: [260]u16,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shellapi/ns-shellapi-shstockiconinfo ]]
	SHSTOCKICONINFO :: struct #packed {
		cbSize: u32,
		hIcon: HICON,
		iSysImageIndex: i32,
		iIcon: i32,
		szPath: [260]u16,
	}
}

SIATTRIBFLAGS :: distinct bit_set[enum {
	AND = 0,
	OR = 1,
	ALLITEMS = 14,
}; i32]
SIATTRIBFLAGS_APPCOMPAT :: transmute(SIATTRIBFLAGS)i32(3)
SIATTRIBFLAGS_MASK :: transmute(SIATTRIBFLAGS)i32(3)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-sigdn ]]
SIGDN :: enum i32 {
	NORMALDISPLAY = 0,
	PARENTRELATIVEPARSING = -2147385343,
	DESKTOPABSOLUTEPARSING = -2147319808,
	PARENTRELATIVEEDITING = -2147282943,
	DESKTOPABSOLUTEEDITING = -2147172352,
	FILESYSPATH = -2147123200,
	URL = -2147057664,
	PARENTRELATIVEFORADDRESSBAR = -2146975743,
	PARENTRELATIVE = -2146959359,
	PARENTRELATIVEFORUI = -2146877439,
}

SIIGBF :: distinct bit_set[enum {
	BIGGERSIZEOK = 0,
	MEMORYONLY = 1,
	ICONONLY = 2,
	THUMBNAILONLY = 3,
	INCACHEONLY = 4,
	CROPTOSQUARE = 5,
	WIDETHUMBNAILS = 6,
	ICONBACKGROUND = 7,
	SCALEUP = 8,
}; i32]
SIIGBF_RESIZETOFIT :: transmute(SIIGBF)i32(0)

SimpleConflictPresenter :: struct {
}
IID_SimpleConflictPresenter :: GUID{0x7A0F6AB7, 0xED84, 0x46B6, {0xB4, 0x7E, 0x02, 0xAA, 0x15, 0x9A, 0x15, 0x2B}}

SizeCategorizer :: struct {
}
IID_SizeCategorizer :: GUID{0x55D7B852, 0xF6D1, 0x42F2, {0xAA, 0x75, 0x87, 0x28, 0xA1, 0xB2, 0xD2, 0x64}}

SLGP_FLAGS :: distinct bit_set[enum {
	SHORTPATH = 0,
	UNCPRIORITY = 1,
	RAWPATH = 2,
	RELATIVEPRIORITY = 3,
}; i32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shappmgr/ns-shappmgr-slowappinfo ]]
SLOWAPPINFO :: struct {
	ullSize: u64,
	ftLastUsed: FILETIME,
	iTimesUsed: i32,
	pszImage: PWSTR,
}

SLR_FLAGS :: distinct bit_set[enum {
	NO_UI = 0,
	ANY_MATCH = 1,
	UPDATE = 2,
	NOUPDATE = 3,
	NOSEARCH = 4,
	NOTRACK = 5,
	NOLINKINFO = 6,
	INVOKE_MSI = 7,
	OFFER_DELETE_WITHOUT_FILE = 9,
	KNOWNFOLDER = 10,
	MACHINE_IN_LOCAL_TARGET = 11,
	UPDATE_MACHINE_AND_SID = 12,
	NO_OBJECT_ID = 13,
}; i32]
SLR_FLAGS_NONE :: transmute(SLR_FLAGS)i32(0)
SLR_FLAGS_NO_UI_WITH_MSG_PUMP :: transmute(SLR_FLAGS)i32(257)

SmartcardCredentialProvider :: struct {
}
IID_SmartcardCredentialProvider :: GUID{0x8FD7E19C, 0x3BF7, 0x489B, {0xA7, 0x2C, 0x84, 0x6A, 0xB3, 0x67, 0x8C, 0x96}}

SmartcardPinProvider :: struct {
}
IID_SmartcardPinProvider :: GUID{0x94596C7E, 0x3744, 0x41CE, {0x89, 0x3E, 0xBB, 0xF0, 0x91, 0x22, 0xF7, 0x6A}}

SmartcardReaderSelectionProvider :: struct {
}
IID_SmartcardReaderSelectionProvider :: GUID{0x1B283861, 0x754F, 0x4022, {0xAD, 0x47, 0xA5, 0xEA, 0xAA, 0x61, 0x88, 0x94}}

SmartcardWinRTProvider :: struct {
}
IID_SmartcardWinRTProvider :: GUID{0x1EE7337F, 0x85AC, 0x45E2, {0xA2, 0x3C, 0x37, 0xC7, 0x53, 0x20, 0x97, 0x69}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-smcshchangenotifystruct ]]
SMCSHCHANGENOTIFYSTRUCT :: struct {
	lEvent: i32,
	pidl1: ^ITEMIDLIST,
	pidl2: ^ITEMIDLIST,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-smdata ]]
SMDATA :: struct {
	dwMask: u32,
	dwFlags: u32,
	hmenu: HMENU,
	hwnd: HWND,
	uId: u32,
	uIdParent: u32,
	uIdAncestor: u32,
	punk: ^IUnknown,
	pidlFolder: ^ITEMIDLIST,
	pidlItem: ^ITEMIDLIST,
	psf: ^IShellFolder,
	pvUserData: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-sminfo ]]
SMINFO :: struct {
	dwMask: u32,
	dwType: u32,
	dwFlags: u32,
	iIcon: i32,
}

SMINFOFLAGS :: enum i32 {
	ICON = 1,
	ACCELERATOR = 2,
	DROPTARGET = 4,
	SUBMENU = 8,
	CHECKED = 32,
	DROPCASCADE = 64,
	HIDDEN = 128,
	DISABLED = 256,
	TRACKPOPUP = 512,
	DEMOTED = 1024,
	ALTSTATE = 2048,
	DRAGNDROP = 4096,
	NEW = 8192,
}

SMINFOMASK :: enum i32 {
	TYPE = 1,
	FLAGS = 2,
	ICON = 4,
}

SMINFOTYPE :: enum i32 {
	SEPARATOR = 1,
	STRING = 2,
}

SORT_ORDER_TYPE :: enum i32 {
	DEFAULT = 0,
	IGNORE_FOLDERNESS = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-sortcolumn ]]
SORTCOLUMN :: struct {
	propkey: PROPERTYKEY,
	direction: SORTDIRECTION,
}

SORTDIRECTION :: enum i32 {
	DESCENDING = -1,
	ASCENDING = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-spaction ]]
SPACTION :: enum i32 {
	NONE = 0,
	MOVING = 1,
	COPYING = 2,
	RECYCLING = 3,
	APPLYINGATTRIBS = 4,
	DOWNLOADING = 5,
	SEARCHING_INTERNET = 6,
	CALCULATING = 7,
	UPLOADING = 8,
	SEARCHING_FILES = 9,
	DELETING = 10,
	RENAMING = 11,
	FORMATTING = 12,
	COPY_MOVING = 13,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-sptext ]]
SPTEXT :: enum i32 {
	ACTIONDESCRIPTION = 1,
	ACTIONDETAIL = 2,
}

SSF_MASK :: distinct bit_set[enum {
	SHOWALLOBJECTS = 0,
	SHOWEXTENSIONS = 1,
	HIDDENFILEEXTS = 2,
	SERVERADMINUI = 2,
	SHOWCOMPCOLOR = 3,
	SORTCOLUMNS = 4,
	SHOWSYSFILES = 5,
	DOUBLECLICKINWEBVIEW = 7,
	SHOWATTRIBCOL = 8,
	DESKTOPHTML = 9,
	WIN95CLASSIC = 10,
	DONTPRETTYPATH = 11,
	SHOWINFOTIP = 13,
	MAPNETDRVBUTTON = 12,
	NOCONFIRMRECYCLE = 15,
	HIDEICONS = 14,
	FILTER = 16,
	WEBVIEW = 17,
	SHOWSUPERHIDDEN = 18,
	SEPPROCESS = 19,
	NONETCRAWLING = 20,
	STARTPANELON = 21,
	SHOWSTARTPAGE = 22,
	AUTOCHECKSELECT = 23,
	ICONSONLY = 24,
	SHOWTYPEOVERLAY = 25,
	SHOWSTATUSBAR = 26,
}; u32]

StartMenuPin :: struct {
}
IID_StartMenuPin :: GUID{0xA2A9545D, 0xA0C2, 0x42B4, {0x97, 0x08, 0xA0, 0xB2, 0xBA, 0xDD, 0x77, 0xC8}}

STGOP :: enum i32 {
	MOVE = 1,
	COPY = 2,
	SYNC = 3,
	REMOVE = 5,
	RENAME = 6,
	APPLYPROPERTIES = 8,
	NEW = 10,
}

STORAGE_PROVIDER_FILE_FLAGS :: distinct bit_set[enum {
	DOWNLOAD_BY_DEFAULT = 0,
	CREATED_ON_THIS_DEVICE = 1,
}; i32]
STORAGE_PROVIDER_FILE_FLAGS_NONE :: transmute(STORAGE_PROVIDER_FILE_FLAGS)i32(0)

StorageProviderBanners :: struct {
}
IID_StorageProviderBanners :: GUID{0x7CCDF9F4, 0xE576, 0x455A, {0x8B, 0xC7, 0xF6, 0xEC, 0x68, 0xD6, 0xF0, 0x63}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-stpflag ]]
STPFLAG :: distinct bit_set[enum {
	USEAPPTHUMBNAILALWAYS = 0,
	USEAPPTHUMBNAILWHENACTIVE = 1,
	USEAPPPEEKALWAYS = 2,
	USEAPPPEEKWHENACTIVE = 3,
}; i32]
STPFLAG_NONE :: transmute(STPFLAG)i32(0)

SUBCLASSPROC :: #type proc "system" (
	hWnd: HWND,
	uMsg: u32,
	wParam: WPARAM,
	lParam: LPARAM,
	uIdSubclass: uintptr,
	dwRefData: uintptr,
) -> LRESULT

SuspensionDependencyManager :: struct {
}
IID_SuspensionDependencyManager :: GUID{0x6B273FC5, 0x61FD, 0x4918, {0x95, 0xA2, 0xC3, 0xB5, 0xE9, 0xD7, 0xF5, 0x81}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-sv2cvw2_params ]]
SV2CVW2_PARAMS :: struct {
	cbSize: u32,
	psvPrev: ^IShellView,
	pfs: ^FOLDERSETTINGS,
	psbOwner: ^IShellBrowser,
	prcView: ^RECT,
	pvid: ^GUID,
	hwndView: HWND,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-svuia_status ]]
SVUIA_STATUS :: enum i32 {
	DEACTIVATE = 0,
	ACTIVATE_NOFOCUS = 1,
	ACTIVATE_FOCUS = 2,
	INPLACEACTIVATE = 3,
}

SyncMgr :: struct {
}
IID_SyncMgr :: GUID{0x6295DF27, 0x35EE, 0x11D1, {0x87, 0x07, 0x00, 0xC0, 0x4F, 0xD9, 0x33, 0x27}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_cancel_request ]]
SYNCMGR_CANCEL_REQUEST :: enum i32 {
	NONE = 0,
	CANCEL_ITEM = 1,
	CANCEL_ALL = 2,
	MAX = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ns-syncmgr-syncmgr_conflict_id_info ]]
SYNCMGR_CONFLICT_ID_INFO :: struct {
	pblobID: ^BYTE_BLOB,
	pblobExtra: ^BYTE_BLOB,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_conflict_item_type ]]
SYNCMGR_CONFLICT_ITEM_TYPE :: enum i32 {
	UPDATED = 1,
	DELETED = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_control_flags ]]
SYNCMGR_CONTROL_FLAGS :: enum i32 {
	NONE = 0,
	NOWAIT = 0,
	WAIT = 1,
	NOUI = 2,
	VALID = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_event_flags ]]
SYNCMGR_EVENT_FLAGS :: enum i32 {
	NONE = 0,
	VALID = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_event_level ]]
SYNCMGR_EVENT_LEVEL :: enum i32 {
	INFORMATION = 1,
	WARNING = 2,
	ERROR = 3,
	MAX = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_handler_capabilities ]]
SYNCMGR_HANDLER_CAPABILITIES :: enum i32 {
	NONE = 0,
	PROVIDES_ICON = 1,
	EVENT_STORE = 2,
	CONFLICT_STORE = 4,
	SUPPORTS_CONCURRENT_SESSIONS = 16,
	CAN_BROWSE_CONTENT = 65536,
	CAN_SHOW_SCHEDULE = 131072,
	QUERY_BEFORE_ACTIVATE = 1048576,
	QUERY_BEFORE_DEACTIVATE = 2097152,
	QUERY_BEFORE_ENABLE = 4194304,
	QUERY_BEFORE_DISABLE = 8388608,
	VALID_MASK = 15925271,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_handler_policies ]]
SYNCMGR_HANDLER_POLICIES :: enum i32 {
	NONE = 0,
	PREVENT_ACTIVATE = 1,
	PREVENT_DEACTIVATE = 2,
	PREVENT_ENABLE = 4,
	PREVENT_DISABLE = 8,
	PREVENT_START_SYNC = 16,
	PREVENT_STOP_SYNC = 32,
	DISABLE_ENABLE = 256,
	DISABLE_DISABLE = 512,
	DISABLE_START_SYNC = 1024,
	DISABLE_STOP_SYNC = 2048,
	DISABLE_BROWSE = 4096,
	DISABLE_SCHEDULE = 8192,
	HIDDEN_BY_DEFAULT = 65536,
	BACKGROUND_SYNC_ONLY = 48,
	VALID_MASK = 77631,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_handler_type ]]
SYNCMGR_HANDLER_TYPE :: enum i32 {
	UNSPECIFIED = 0,
	APPLICATION = 1,
	DEVICE = 2,
	FOLDER = 3,
	SERVICE = 4,
	COMPUTER = 5,
	MIN = 0,
	MAX = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_item_capabilities ]]
SYNCMGR_ITEM_CAPABILITIES :: enum i32 {
	NONE = 0,
	PROVIDES_ICON = 1,
	EVENT_STORE = 2,
	CONFLICT_STORE = 4,
	CAN_DELETE = 16,
	CAN_BROWSE_CONTENT = 65536,
	QUERY_BEFORE_ENABLE = 1048576,
	QUERY_BEFORE_DISABLE = 2097152,
	QUERY_BEFORE_DELETE = 4194304,
	VALID_MASK = 7405591,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_item_policies ]]
SYNCMGR_ITEM_POLICIES :: enum i32 {
	NONE = 0,
	PREVENT_ENABLE = 1,
	PREVENT_DISABLE = 2,
	PREVENT_START_SYNC = 4,
	PREVENT_STOP_SYNC = 8,
	DISABLE_ENABLE = 16,
	DISABLE_DISABLE = 32,
	DISABLE_START_SYNC = 64,
	DISABLE_STOP_SYNC = 128,
	DISABLE_BROWSE = 256,
	DISABLE_DELETE = 512,
	HIDDEN_BY_DEFAULT = 65536,
	VALID_MASK = 66303,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_presenter_choice ]]
SYNCMGR_PRESENTER_CHOICE :: enum i32 {
	NO_CHOICE = 0,
	KEEP_ONE = 1,
	KEEP_MULTIPLE = 2,
	KEEP_RECENT = 3,
	REMOVE_FROM_SYNC_SET = 4,
	SKIP = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_presenter_next_step ]]
SYNCMGR_PRESENTER_NEXT_STEP :: enum i32 {
	CONTINUE = 0,
	DEFAULT = 1,
	CANCEL = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_progress_status ]]
SYNCMGR_PROGRESS_STATUS :: enum i32 {
	UPDATING = 1,
	UPDATING_INDETERMINATE = 2,
	SUCCEEDED = 3,
	FAILED = 4,
	CANCELED = 5,
	DISCONNECTED = 6,
	MAX = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_resolution_abilities ]]
SYNCMGR_RESOLUTION_ABILITIES :: enum i32 {
	KEEPOTHER = 1,
	KEEPRECENT = 2,
	REMOVEFROMSYNCSET = 4,
	KEEP_SINGLE = 8,
	KEEP_MULTIPLE = 16,
	VALID = 31,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_resolution_feedback ]]
SYNCMGR_RESOLUTION_FEEDBACK :: enum i32 {
	CONTINUE = 0,
	REFRESH = 1,
	CANCEL = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_sync_control_flags ]]
SYNCMGR_SYNC_CONTROL_FLAGS :: enum i32 {
	NONE = 0,
	IGNORE_IF_ALREADY_SYNCING = 1,
	VALID = 1,
}

SYNCMGR_UPDATE_REASON :: enum i32 {
	ADDED = 0,
	CHANGED = 1,
	REMOVED = 2,
	MAX = 2,
}

SyncMgrClient :: struct {
}
IID_SyncMgrClient :: GUID{0x1202DB60, 0x1DAC, 0x42C5, {0xAE, 0xD5, 0x1A, 0xBD, 0xD4, 0x32, 0x24, 0x8E}}

SyncMgrControl :: struct {
}
IID_SyncMgrControl :: GUID{0x1A1F4206, 0x0688, 0x4E7F, {0xBE, 0x03, 0xD8, 0x2E, 0xC6, 0x9D, 0xF9, 0xA5}}

SYNCMGRERRORFLAGS :: enum i32 {
	ENABLEJUMPTEXT = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrflag ]]
SYNCMGRFLAG :: enum i32 {
	CONNECT = 1,
	PENDINGDISCONNECT = 2,
	MANUAL = 3,
	IDLE = 4,
	INVOKE = 5,
	SCHEDULED = 6,
	EVENTMASK = 255,
	SETTINGS = 256,
	MAYBOTHERUSER = 512,
}

SyncMgrFolder :: struct {
}
IID_SyncMgrFolder :: GUID{0x9C73F5E5, 0x7AE7, 0x4E32, {0xA8, 0xE8, 0x8D, 0x23, 0xB8, 0x52, 0x55, 0xBF}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrhandlerflags ]]
SYNCMGRHANDLERFLAGS :: enum i32 {
	HASPROPERTIES = 1,
	MAYESTABLISHCONNECTION = 2,
	ALWAYSLISTHANDLER = 4,
	HIDDEN = 8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrhandlerinfo ]]
SYNCMGRHANDLERINFO :: struct {
	cbSize: u32,
	hIcon: HICON,
	SyncMgrHandlerFlags: u32,
	wszHandlerName: [32]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrinvokeflags ]]
SYNCMGRINVOKEFLAGS :: enum i32 {
	STARTSYNC = 2,
	MINIMIZED = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgritem ]]
SYNCMGRITEM :: struct {
	cbSize: u32,
	dwFlags: u32,
	ItemID: GUID,
	dwItemState: u32,
	hIcon: HICON,
	wszItemName: [128]u16,
	ftLastUpdate: FILETIME,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgritemflags ]]
SYNCMGRITEMFLAGS :: enum i32 {
	HASPROPERTIES = 1,
	TEMPORARY = 2,
	ROAMINGUSER = 4,
	LASTUPDATETIME = 8,
	MAYDELETEITEM = 16,
	HIDDEN = 32,
}

SYNCMGRITEMSTATE :: enum i32 {
	UNCHECKED = 0,
	CHECKED = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrlogerrorinfo ]]
SYNCMGRLOGERRORINFO :: struct {
	cbSize: u32,
	mask: u32,
	dwSyncMgrErrorFlags: u32,
	ErrorID: GUID,
	ItemID: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrloglevel ]]
SYNCMGRLOGLEVEL :: enum i32 {
	INFORMATION = 1,
	WARNING = 2,
	ERROR = 3,
	LOGLEVELMAX = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ns-mobsync-syncmgrprogressitem ]]
SYNCMGRPROGRESSITEM :: struct {
	cbSize: u32,
	mask: u32,
	lpcStatusText: PWSTR,
	dwStatusType: u32,
	iProgValue: i32,
	iMaxValue: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrregisterflags ]]
SYNCMGRREGISTERFLAGS :: enum i32 {
	CONNECT = 1,
	PENDINGDISCONNECT = 2,
	IDLE = 4,
}

SyncMgrScheduleWizard :: struct {
}
IID_SyncMgrScheduleWizard :: GUID{0x8D8B8E30, 0xC451, 0x421B, {0x85, 0x53, 0xD2, 0x97, 0x6A, 0xFA, 0x64, 0x8C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrstatus ]]
SYNCMGRSTATUS :: enum i32 {
	STOPPED = 0,
	SKIPPED = 1,
	PENDING = 2,
	UPDATING = 3,
	SUCCEEDED = 4,
	FAILED = 5,
	PAUSED = 6,
	RESUMING = 7,
	UPDATING_INDETERMINATE = 8,
	DELETED = 256,
}

SyncResultsFolder :: struct {
}
IID_SyncResultsFolder :: GUID{0x71D99464, 0x3B6B, 0x475C, {0xB2, 0x41, 0xE1, 0x58, 0x83, 0x20, 0x75, 0x29}}

SyncSetupFolder :: struct {
}
IID_SyncSetupFolder :: GUID{0x2E9E59C0, 0xB437, 0x4981, {0xA6, 0x47, 0x9C, 0x34, 0xB9, 0xB9, 0x08, 0x91}}

TaskbarList :: struct {
}
IID_TaskbarList :: GUID{0x56FDF344, 0xFD6D, 0x11D0, {0x95, 0x8A, 0x00, 0x60, 0x97, 0xC9, 0xA0, 0x90}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-tbinfo ]]
TBINFO :: struct {
	cbuttons: u32,
	uFlags: u32,
}

TBPFLAG :: distinct bit_set[enum {
	INDETERMINATE = 0,
	NORMAL = 1,
	ERROR = 2,
	PAUSED = 3,
}; i32]
TBPFLAG_NOPROGRESS :: transmute(TBPFLAG)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-thumbbutton ]]
THUMBBUTTON :: struct {
	dwMask: THUMBBUTTONMASK,
	iId: u32,
	iBitmap: u32,
	hIcon: HICON,
	szTip: [260]u16,
	dwFlags: THUMBBUTTONFLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-thumbbuttonflags ]]
THUMBBUTTONFLAGS :: distinct bit_set[enum {
	DISABLED = 0,
	DISMISSONCLICK = 1,
	NOBACKGROUND = 2,
	HIDDEN = 3,
	NONINTERACTIVE = 4,
}; i32]
THUMBBUTTONFLAGS_ENABLED :: transmute(THUMBBUTTONFLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-thumbbuttonmask ]]
THUMBBUTTONMASK :: distinct bit_set[enum {
	BITMAP = 0,
	ICON = 1,
	TOOLTIP = 2,
	FLAGS = 3,
}; i32]

ThumbnailStreamCache :: struct {
}
IID_ThumbnailStreamCache :: GUID{0xCBE0FED3, 0x4B91, 0x4E90, {0x83, 0x54, 0x8A, 0x8C, 0x84, 0xEC, 0x68, 0x72}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbnailstreamcache/ne-thumbnailstreamcache-thumbnailstreamcacheoptions ]]
ThumbnailStreamCacheOptions :: distinct bit_set[enum {
	ReturnOnlyIfCached = 0,
	ResizeThumbnail = 1,
	AllowSmallerSize = 2,
}; i32]
ThumbnailStreamCacheOptions_ExtractIfNotCached :: transmute(ThumbnailStreamCacheOptions)i32(0)

TI_FLAGS :: enum i32 {
	BITMAP = 1,
	JPEG = 2,
}

TimeCategorizer :: struct {
}
IID_TimeCategorizer :: GUID{0x3BB4118F, 0xDDFD, 0x4D30, {0xA3, 0x48, 0x9F, 0xB5, 0xD6, 0xBF, 0x1A, 0xFE}}

TLENUMF :: enum i32 {
	RELATIVE_INCLUDE_CURRENT = 1,
	RELATIVE_BACK = 16,
	RELATIVE_FORE = 32,
	INCLUDE_UNINVOKEABLE = 64,
	ABSOLUTE = 49,
	EXCLUDE_SUBFRAME_ENTRIES = 128,
	EXCLUDE_ABOUT_PAGES = 256,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shdeprecated/ns-shdeprecated-toolbaritem ]]
TOOLBARITEM :: struct {
	ptbar: ^IDockingWindow,
	rcBorderTool: RECT,
	pwszItem: PWSTR,
	fShow: BOOL,
	hMon: HMONITOR,
}

TrackShellMenu :: struct {
}
IID_TrackShellMenu :: GUID{0x8278F931, 0x2A3E, 0x11D2, {0x83, 0x8F, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/intshcut/ne-intshcut-translateurl_in_flags ]]
TRANSLATEURL_IN_FLAGS :: enum i32 {
	GUESS_PROTOCOL = 1,
	USE_DEFAULT_PROTOCOL = 2,
}

TrayBandSiteService :: struct {
}
IID_TrayBandSiteService :: GUID{0xF60AD0A0, 0xE5E1, 0x45CB, {0xB5, 0x1A, 0xE1, 0x5B, 0x9F, 0x8B, 0x29, 0x34}}

TrayDeskBand :: struct {
}
IID_TrayDeskBand :: GUID{0xE6442437, 0x6C68, 0x4F52, {0x94, 0xDD, 0x2C, 0xFE, 0xD2, 0x67, 0xEF, 0xB9}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-undock_reason ]]
UNDOCK_REASON :: enum i32 {
	RESOLUTION_CHANGE = 0,
	MONITOR_DISCONNECT = 1,
}

URL_PART :: enum i32 {
	NONE = 0,
	SCHEME = 1,
	HOSTNAME = 2,
	USERNAME = 3,
	PASSWORD = 4,
	PORT = 5,
	QUERY = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-url_scheme ]]
URL_SCHEME :: enum i32 {
	INVALID = -1,
	UNKNOWN = 0,
	FTP = 1,
	HTTP = 2,
	GOPHER = 3,
	MAILTO = 4,
	NEWS = 5,
	NNTP = 6,
	TELNET = 7,
	WAIS = 8,
	FILE = 9,
	MK = 10,
	HTTPS = 11,
	SHELL = 12,
	SNEWS = 13,
	LOCAL = 14,
	JAVASCRIPT = 15,
	VBSCRIPT = 16,
	ABOUT = 17,
	RES = 18,
	MSSHELLROOTED = 19,
	MSSHELLIDLIST = 20,
	MSHELP = 21,
	MSSHELLDEVICE = 22,
	WILDCARD = 23,
	SEARCH_MS = 24,
	SEARCH = 25,
	KNOWNFOLDER = 26,
	MAXVALUE = 27,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/intshcut/ne-intshcut-urlassociationdialog_in_flags ]]
URLASSOCIATIONDIALOG_IN_FLAGS :: enum i32 {
	USE_DEFAULT_NAME = 1,
	REGISTER_ASSOC = 2,
}

URLINVOKECOMMANDINFOA :: struct {
	dwcbSize: u32,
	dwFlags: u32,
	hwndParent: HWND,
	pcszVerb: PSTR,
}

URLINVOKECOMMANDINFOW :: struct {
	dwcbSize: u32,
	dwFlags: u32,
	hwndParent: HWND,
	pcszVerb: PWSTR,
}

URLIS :: enum i32 {
	URL = 0,
	OPAQUE = 1,
	NOHISTORY = 2,
	FILEURL = 3,
	APPLIABLE = 4,
	DIRECTORY = 5,
	HASQUERY = 6,
}

UserNotification :: struct {
}
IID_UserNotification :: GUID{0x0010890E, 0x8789, 0x413C, {0xAD, 0xBC, 0x48, 0xF5, 0xB5, 0x11, 0xB3, 0xAF}}

V1PasswordCredentialProvider :: struct {
}
IID_V1PasswordCredentialProvider :: GUID{0x6F45DC1E, 0x5384, 0x457A, {0xBC, 0x13, 0x2C, 0xD8, 0x1B, 0x0D, 0x28, 0xED}}

V1SmartcardCredentialProvider :: struct {
}
IID_V1SmartcardCredentialProvider :: GUID{0x8BF9A910, 0xA8FF, 0x457F, {0x99, 0x9F, 0xA5, 0xCA, 0x10, 0xB4, 0xA8, 0x85}}

V1WinBioCredentialProvider :: struct {
}
IID_V1WinBioCredentialProvider :: GUID{0xAC3AC249, 0xE820, 0x4343, {0xA6, 0x5B, 0x37, 0x7A, 0xC6, 0x34, 0xDC, 0x09}}

VALIDATEUNC_OPTION :: distinct bit_set[enum {
	CONNECT = 0,
	NOUI = 1,
	PRINT = 2,
	PERSIST = 3,
}; i32]
VALIDATEUNC_OPTION_VALID :: transmute(VALIDATEUNC_OPTION)i32(15)

VaultProvider :: struct {
}
IID_VaultProvider :: GUID{0x503739D0, 0x4C5E, 0x4CFD, {0xB3, 0xBA, 0xD8, 0x81, 0x33, 0x4F, 0x0D, 0xF2}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/virtualdesktopmanager ]]
VirtualDesktopManager :: struct {
}
IID_VirtualDesktopManager :: GUID{0xAA509086, 0x5CA9, 0x4C25, {0x8F, 0x95, 0x58, 0x9D, 0x3C, 0x07, 0xB4, 0x8A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-vpcolorflags ]]
VPCOLORFLAGS :: enum i32 {
	TEXT = 1,
	BACKGROUND = 2,
	SORTCOLUMN = 3,
	SUBTEXT = 4,
	TEXTBACKGROUND = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-vpwatermarkflags ]]
VPWATERMARKFLAGS :: distinct bit_set[enum {
	ALPHABLEND = 0,
}; i32]
VPWATERMARKFLAGS_DEFAULT :: transmute(VPWATERMARKFLAGS)i32(0)

WebBrowser :: struct {
}
IID_WebBrowser :: GUID{0x8856F961, 0x340A, 0x11D0, {0xA9, 0x6B, 0x00, 0xC0, 0x4F, 0xD7, 0x05, 0xA2}}

WebBrowser_V1 :: struct {
}
IID_WebBrowser_V1 :: GUID{0xEAB22AC3, 0x30C1, 0x11CF, {0xA7, 0xEB, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/webwizardhost ]]
WebWizardHost :: struct {
}
IID_WebWizardHost :: GUID{0xC827F149, 0x55C1, 0x4D28, {0x93, 0x5E, 0x57, 0xE4, 0x7C, 0xAE, 0xD9, 0x73}}

WinBioCredentialProvider :: struct {
}
IID_WinBioCredentialProvider :: GUID{0xBEC09223, 0xB018, 0x416D, {0xA0, 0xAC, 0x52, 0x39, 0x71, 0xB6, 0x39, 0xF5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/tlogstg/ns-tlogstg-windowdata ]]
WINDOWDATA :: struct {
	dwWindowID: u32,
	uiCP: u32,
	pidl: ^ITEMIDLIST,
	lpszUrl: PWSTR,
	lpszUrlLocation: PWSTR,
	lpszTitle: PWSTR,
}

WTS_ALPHATYPE :: enum i32 {
	UNKNOWN = 0,
	RGB = 1,
	ARGB = 2,
}

WTS_CACHEFLAGS :: distinct bit_set[enum {
	LOWQUALITY = 0,
	CACHED = 1,
}; i32]
WTS_CACHEFLAGS_DEFAULT :: transmute(WTS_CACHEFLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbcache/ne-thumbcache-wts_contextflags ]]
WTS_CONTEXTFLAGS :: distinct bit_set[enum {
	APPSTYLE = 0,
	SQUARE = 1,
	WIDE = 2,
	FAST = 3,
}; i32]
WTS_CONTEXTFLAGS_DEFAULT :: transmute(WTS_CONTEXTFLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbcache/ne-thumbcache-wts_flags ]]
WTS_FLAGS :: distinct bit_set[enum {
	INCACHEONLY = 0,
	FASTEXTRACT = 1,
	FORCEEXTRACTION = 2,
	SLOWRECLAIM = 3,
	EXTRACTDONOTCACHE = 5,
	SCALETOREQUESTEDSIZE = 6,
	SKIPFASTEXTRACT = 7,
	EXTRACTINPROC = 8,
	CROPTOSQUARE = 9,
	INSTANCESURROGATE = 10,
	REQUIRESURROGATE = 11,
	APPSTYLE = 13,
	WIDETHUMBNAILS = 14,
	IDEALCACHESIZEONLY = 15,
	SCALEUP = 16,
}; i32]
WTS_FLAGS_NONE :: transmute(WTS_FLAGS)i32(0)
WTS_FLAGS_EXTRACT :: transmute(WTS_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/thumbcache/ns-thumbcache-wts_thumbnailid ]]
WTS_THUMBNAILID :: struct {
	rgbKey: [16]u8,
}

ABE_BOTTOM :: 3
ABE_LEFT :: 0
ABE_RIGHT :: 2
ABE_TOP :: 1
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-activate ]]
ABM_ACTIVATE :: 6
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-getautohidebar ]]
ABM_GETAUTOHIDEBAR :: 7
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-getautohidebarex ]]
ABM_GETAUTOHIDEBAREX :: 11
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-getstate ]]
ABM_GETSTATE :: 4
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-gettaskbarpos ]]
ABM_GETTASKBARPOS :: 5
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-new ]]
ABM_NEW :: 0
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-querypos ]]
ABM_QUERYPOS :: 2
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-remove ]]
ABM_REMOVE :: 1
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-setautohidebar ]]
ABM_SETAUTOHIDEBAR :: 8
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-setautohidebarex ]]
ABM_SETAUTOHIDEBAREX :: 12
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-setpos ]]
ABM_SETPOS :: 3
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-setstate ]]
ABM_SETSTATE :: 10
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abm-windowposchanged ]]
ABM_WINDOWPOSCHANGED :: 9
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abn-fullscreenapp ]]
ABN_FULLSCREENAPP :: 2
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abn-poschanged ]]
ABN_POSCHANGED :: 1
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abn-statechange ]]
ABN_STATECHANGE :: 0
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/abn-windowarrange ]]
ABN_WINDOWARRANGE :: 3
ABS_ALWAYSONTOP :: 2
ABS_AUTOHIDE :: 1
ACDD_VISIBLE :: 1
AD_APPLY_BUFFERED_REFRESH :: 16
AD_APPLY_DYNAMICREFRESH :: 32
AD_APPLY_FORCE :: 8
AD_APPLY_HTMLGEN :: 2
AD_APPLY_REFRESH :: 4
AD_APPLY_SAVE :: 1
AD_GETWP_BMP :: 0
AD_GETWP_IMAGE :: 1
AD_GETWP_LAST_APPLIED :: 2
ADDURL_SILENT :: 1
APPNAMEBUFFERLEN :: 40
ARCONTENT_AUDIOCD :: 4
ARCONTENT_AUTOPLAYMUSIC :: 256
ARCONTENT_AUTOPLAYPIX :: 128
ARCONTENT_AUTOPLAYVIDEO :: 512
ARCONTENT_AUTORUNINF :: 2
ARCONTENT_BLANKBD :: 8192
ARCONTENT_BLANKCD :: 16
ARCONTENT_BLANKDVD :: 32
ARCONTENT_BLURAY :: 16384
ARCONTENT_CAMERASTORAGE :: 32768
ARCONTENT_CUSTOMEVENT :: 65536
ARCONTENT_DVDAUDIO :: 4096
ARCONTENT_DVDMOVIE :: 8
ARCONTENT_MASK :: 131070
ARCONTENT_NONE :: 0
ARCONTENT_PHASE_FINAL :: 1073741824
ARCONTENT_PHASE_MASK :: 1879048192
ARCONTENT_PHASE_PRESNIFF :: 268435456
ARCONTENT_PHASE_SNIFFING :: 536870912
ARCONTENT_PHASE_UNKNOWN :: 0
ARCONTENT_SVCD :: 2048
ARCONTENT_UNKNOWNCONTENT :: 64
ARCONTENT_VCD :: 1024
BFFM_ENABLEOK :: 1125
BFFM_INITIALIZED :: 1
BFFM_IUNKNOWN :: 5
BFFM_SELCHANGED :: 2
BFFM_SETEXPANDED :: 1130
BFFM_SETOKTEXT :: 1129
BFFM_SETSELECTION :: 1127
BFFM_SETSELECTIONA :: 1126
BFFM_SETSELECTIONW :: 1127
BFFM_SETSTATUSTEXT :: 1128
BFFM_SETSTATUSTEXTA :: 1124
BFFM_SETSTATUSTEXTW :: 1128
BFFM_VALIDATEFAILED :: 4
BFFM_VALIDATEFAILEDA :: 3
BFFM_VALIDATEFAILEDW :: 4
BHID_AssociationArray :: GUID{0xBEA9EF17, 0x82F1, 0x4F60, {0x92, 0x84, 0x4F, 0x8D, 0xB7, 0x5C, 0x3B, 0xE9}}
BHID_DataObject :: GUID{0xB8C0BD9F, 0xED24, 0x455C, {0x83, 0xE6, 0xD5, 0x39, 0x0C, 0x4F, 0xE8, 0xC4}}
BHID_EnumAssocHandlers :: GUID{0xB8AB0B9C, 0xC2EC, 0x4F7A, {0x91, 0x8D, 0x31, 0x49, 0x00, 0xE6, 0x28, 0x0A}}
BHID_EnumItems :: GUID{0x94F60519, 0x2850, 0x4924, {0xAA, 0x5A, 0xD1, 0x5E, 0x84, 0x86, 0x80, 0x39}}
BHID_FilePlaceholder :: GUID{0x8677DCEB, 0xAAE0, 0x4005, {0x8D, 0x3D, 0x54, 0x7F, 0xA8, 0x52, 0xF8, 0x25}}
BHID_Filter :: GUID{0x38D08778, 0xF557, 0x4690, {0x9E, 0xBF, 0xBA, 0x54, 0x70, 0x6A, 0xD8, 0xF7}}
BHID_LinkTargetItem :: GUID{0x3981E228, 0xF559, 0x11D3, {0x8E, 0x3A, 0x00, 0xC0, 0x4F, 0x68, 0x37, 0xD5}}
BHID_PropertyStore :: GUID{0x0384E1A4, 0x1523, 0x439C, {0xA4, 0xC8, 0xAB, 0x91, 0x10, 0x52, 0xF5, 0x86}}
BHID_RandomAccessStream :: GUID{0xF16FC93B, 0x77AE, 0x4CFE, {0xBD, 0xA7, 0xA8, 0x66, 0xEE, 0xA6, 0x87, 0x8D}}
BHID_SFObject :: GUID{0x3981E224, 0xF559, 0x11D3, {0x8E, 0x3A, 0x00, 0xC0, 0x4F, 0x68, 0x37, 0xD5}}
BHID_SFUIObject :: GUID{0x3981E225, 0xF559, 0x11D3, {0x8E, 0x3A, 0x00, 0xC0, 0x4F, 0x68, 0x37, 0xD5}}
BHID_SFViewObject :: GUID{0x3981E226, 0xF559, 0x11D3, {0x8E, 0x3A, 0x00, 0xC0, 0x4F, 0x68, 0x37, 0xD5}}
BHID_Storage :: GUID{0x3981E227, 0xF559, 0x11D3, {0x8E, 0x3A, 0x00, 0xC0, 0x4F, 0x68, 0x37, 0xD5}}
BHID_StorageEnum :: GUID{0x4621A4E3, 0xF0D6, 0x4773, {0x8A, 0x9C, 0x46, 0xE7, 0x7B, 0x17, 0x48, 0x40}}
BHID_StorageItem :: GUID{0x404E2109, 0x77D2, 0x4699, {0xA5, 0xA0, 0x4F, 0xDF, 0x10, 0xDB, 0x98, 0x37}}
BHID_Stream :: GUID{0x1CEBB3AB, 0x7C10, 0x499A, {0xA4, 0x17, 0x92, 0xCA, 0x16, 0xC4, 0xCB, 0x83}}
BHID_ThumbnailHandler :: GUID{0x7B2E650A, 0x8E20, 0x4F4A, {0xB0, 0x9E, 0x65, 0x97, 0xAF, 0xC7, 0x2F, 0xB0}}
BHID_Transfer :: GUID{0xD5E346A1, 0xF753, 0x4932, {0xB4, 0x03, 0x45, 0x74, 0x80, 0x0E, 0x24, 0x98}}
BIF_BROWSEFILEJUNCTIONS :: 65536
BIF_BROWSEFORCOMPUTER :: 4096
BIF_BROWSEFORPRINTER :: 8192
BIF_BROWSEINCLUDEFILES :: 16384
BIF_BROWSEINCLUDEURLS :: 128
BIF_DONTGOBELOWDOMAIN :: 2
BIF_EDITBOX :: 16
BIF_NEWDIALOGSTYLE :: 64
BIF_NONEWFOLDERBUTTON :: 512
BIF_NOTRANSLATETARGETS :: 1024
BIF_RETURNFSANCESTORS :: 8
BIF_RETURNONLYFSDIRS :: 1
BIF_SHAREABLE :: 32768
BIF_STATUSTEXT :: 4
BIF_UAHINT :: 256
BIF_VALIDATE :: 32
BIND_INTERRUPTABLE :: 4294967295
BMICON_LARGE :: 0
BMICON_SMALL :: 1
BSF_CANMAXIMIZE :: 1024
BSF_DELEGATEDNAVIGATION :: 65536
BSF_DONTSHOWNAVCANCELPAGE :: 16384
BSF_FEEDNAVIGATION :: 524288
BSF_FEEDSUBSCRIBED :: 1048576
BSF_HTMLNAVCANCELED :: 8192
BSF_MERGEDMENUS :: 262144
BSF_NAVNOHISTORY :: 4096
BSF_NOLOCALFILEWARNING :: 16
BSF_REGISTERASDROPTARGET :: 1
BSF_RESIZABLE :: 512
BSF_SETNAVIGATABLECODEPAGE :: 32768
BSF_THEATERMODE :: 2
BSF_TOPBROWSER :: 2048
BSF_TRUSTEDFORACTIVEX :: 131072
BSF_UISETBYAUTOMATION :: 256
BSIM_STATE :: 1
BSIM_STYLE :: 2
BSIS_ALWAYSGRIPPER :: 2
BSIS_AUTOGRIPPER :: 0
BSIS_FIXEDORDER :: 1024
BSIS_LEFTALIGN :: 4
BSIS_LOCKED :: 256
BSIS_NOCAPTION :: 64
BSIS_NOCONTEXTMENU :: 16
BSIS_NODROPTARGET :: 32
BSIS_NOGRIPPER :: 1
BSIS_PREFERNOLINEBREAK :: 128
BSIS_PRESERVEORDERDURINGLAYOUT :: 512
BSIS_SINGLECLICK :: 8
BSSF_NOTITLE :: 2
BSSF_UNDELETEABLE :: 4096
BSSF_VISIBLE :: 1
BUFFLEN :: 255
CABINETSTATE_VERSION :: 2
CAMERAROLL_E_NO_DOWNSAMPLING_REQUIRED :: -2144927456
CATID_BrowsableShellExt :: GUID{0x00021490, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CATID_BrowseInPlace :: GUID{0x00021491, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CATID_CommBand :: GUID{0x00021494, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CATID_DeskBand :: GUID{0x00021492, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CATID_FilePlaceholderMergeHandler :: GUID{0x3E9C9A51, 0xD4AA, 0x4870, {0xB4, 0x7C, 0x74, 0x24, 0xB4, 0x91, 0xF1, 0xCC}}
CATID_InfoBand :: GUID{0x00021493, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CATID_LocationFactory :: GUID{0x965C4D51, 0x8B76, 0x4E57, {0x80, 0xB7, 0x56, 0x4D, 0x2E, 0xA4, 0xB5, 0x5E}}
CATID_LocationProvider :: GUID{0x1B3CA474, 0x2614, 0x414B, {0xB8, 0x13, 0x1A, 0xCE, 0xCA, 0x3E, 0x3D, 0xD8}}
CATID_SearchableApplication :: GUID{0x366C292A, 0xD9B3, 0x4DBF, {0xBB, 0x70, 0xE6, 0x2E, 0xC3, 0xD0, 0xBB, 0xBF}}
CDB2GVF_ADDSHIELD :: 64
CDB2GVF_ALLOWPREVIEWPANE :: 4
CDB2GVF_ISFILESAVE :: 2
CDB2GVF_ISFOLDERPICKER :: 32
CDB2GVF_NOINCLUDEITEM :: 16
CDB2GVF_NOSELECTVERB :: 8
CDB2GVF_SHOWALLFILES :: 1
CDB2N_CONTEXTMENU_DONE :: 1
CDB2N_CONTEXTMENU_START :: 2
CDBOSC_KILLFOCUS :: 1
CDBOSC_RENAME :: 3
CDBOSC_SELCHANGE :: 2
CDBOSC_SETFOCUS :: 0
CDBOSC_STATECHANGE :: 4
CFSTR_AUTOPLAY_SHELLIDLISTS :: "Autoplay Enumerated IDList Array"
CFSTR_DROPDESCRIPTION :: "DropDescription"
CFSTR_FILE_ATTRIBUTES_ARRAY :: "File Attributes Array"
CFSTR_FILECONTENTS :: "FileContents"
CFSTR_FILEDESCRIPTOR :: "FileGroupDescriptorW"
CFSTR_FILEDESCRIPTORA :: "FileGroupDescriptor"
CFSTR_FILEDESCRIPTORW :: "FileGroupDescriptorW"
CFSTR_FILENAME :: "FileNameW"
CFSTR_FILENAMEA :: "FileName"
CFSTR_FILENAMEMAP :: "FileNameMapW"
CFSTR_FILENAMEMAPA :: "FileNameMap"
CFSTR_FILENAMEMAPW :: "FileNameMapW"
CFSTR_FILENAMEW :: "FileNameW"
CFSTR_INDRAGLOOP :: "InShellDragLoop"
CFSTR_INETURL :: "UniformResourceLocatorW"
CFSTR_INETURLA :: "UniformResourceLocator"
CFSTR_INETURLW :: "UniformResourceLocatorW"
CFSTR_INVOKECOMMAND_DROPPARAM :: "InvokeCommand DropParam"
CFSTR_LOGICALPERFORMEDDROPEFFECT :: "Logical Performed DropEffect"
CFSTR_MOUNTEDVOLUME :: "MountedVolume"
CFSTR_NETRESOURCES :: "Net Resource"
CFSTR_PASTESUCCEEDED :: "Paste Succeeded"
CFSTR_PERFORMEDDROPEFFECT :: "Performed DropEffect"
CFSTR_PERSISTEDDATAOBJECT :: "PersistedDataObject"
CFSTR_PREFERREDDROPEFFECT :: "Preferred DropEffect"
CFSTR_PRINTERGROUP :: "PrinterFriendlyName"
CFSTR_SHELLDROPHANDLER :: "DropHandlerCLSID"
CFSTR_SHELLIDLIST :: "Shell IDList Array"
CFSTR_SHELLIDLISTOFFSET :: "Shell Object Offsets"
CFSTR_SHELLURL :: "UniformResourceLocator"
CFSTR_TARGETCLSID :: "TargetCLSID"
CFSTR_UNTRUSTEDDRAGDROP :: "UntrustedDragDrop"
CFSTR_ZONEIDENTIFIER :: "ZoneIdentifier"
CGID_DefView :: GUID{0x4AF07F10, 0xD231, 0x11D0, {0xB9, 0x42, 0x00, 0xA0, 0xC9, 0x03, 0x12, 0xE1}}
CGID_Explorer :: GUID{0x000214D0, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CGID_ExplorerBarDoc :: GUID{0x000214D3, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CGID_MENUDESKBAR :: GUID{0x5C9F0A12, 0x959E, 0x11D0, {0xA3, 0xA4, 0x00, 0xA0, 0xC9, 0x08, 0x26, 0x36}}
CGID_ShellDocView :: GUID{0x000214D1, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CGID_ShellServiceObject :: GUID{0x000214D2, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
CGID_ShortCut :: GUID{0x93A68750, 0x951A, 0x11D1, {0x94, 0x6F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}}
CLOSEPROPS_DISCARD :: 1
CLOSEPROPS_NONE :: 0
CLSID_ACLCustomMRU :: GUID{0x6935DB93, 0x21E8, 0x4CCC, {0xBE, 0xB9, 0x9F, 0xE3, 0xC7, 0x7A, 0x29, 0x7A}}
CLSID_ACLHistory :: GUID{0x00BB2764, 0x6A77, 0x11D0, {0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62}}
CLSID_ACListISF :: GUID{0x03C036F1, 0xA186, 0x11D0, {0x82, 0x4A, 0x00, 0xAA, 0x00, 0x5B, 0x43, 0x83}}
CLSID_ACLMRU :: GUID{0x6756A641, 0xDE71, 0x11D0, {0x83, 0x1B, 0x00, 0xAA, 0x00, 0x5B, 0x43, 0x83}}
CLSID_ACLMulti :: GUID{0x00BB2765, 0x6A77, 0x11D0, {0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62}}
CLSID_ActiveDesktop :: GUID{0x75048700, 0xEF1F, 0x11D0, {0x98, 0x88, 0x00, 0x60, 0x97, 0xDE, 0xAC, 0xF9}}
CLSID_AutoComplete :: GUID{0x00BB2763, 0x6A77, 0x11D0, {0xA5, 0x35, 0x00, 0xC0, 0x4F, 0xD7, 0xD0, 0x62}}
CLSID_CAnchorBrowsePropertyPage :: GUID{0x3050F3BB, 0x98B5, 0x11CF, {0xBB, 0x82, 0x00, 0xAA, 0x00, 0xBD, 0xCE, 0x0B}}
CLSID_CDocBrowsePropertyPage :: GUID{0x3050F3B4, 0x98B5, 0x11CF, {0xBB, 0x82, 0x00, 0xAA, 0x00, 0xBD, 0xCE, 0x0B}}
CLSID_CFSIconOverlayManager :: GUID{0x63B51F81, 0xC868, 0x11D0, {0x99, 0x9C, 0x00, 0xC0, 0x4F, 0xD6, 0x55, 0xE1}}
CLSID_CImageBrowsePropertyPage :: GUID{0x3050F3B3, 0x98B5, 0x11CF, {0xBB, 0x82, 0x00, 0xAA, 0x00, 0xBD, 0xCE, 0x0B}}
CLSID_ControlPanel :: GUID{0x21EC2020, 0x3AEA, 0x1069, {0xA2, 0xDD, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D}}
CLSID_CUrlHistory :: GUID{0x3C374A40, 0xBAE4, 0x11CF, {0xBF, 0x7D, 0x00, 0xAA, 0x00, 0x69, 0x46, 0xEE}}
CLSID_CUrlHistoryBoth :: GUID{0x6659983C, 0x8476, 0x4EB4, {0xB7, 0x8C, 0xE5, 0x96, 0x8F, 0x32, 0x6B, 0xA0}}
CLSID_CURLSearchHook :: GUID{0xCFBFAE00, 0x17A6, 0x11D0, {0x99, 0xCB, 0x00, 0xC0, 0x4F, 0xD6, 0x44, 0x97}}
CLSID_DarwinAppPublisher :: GUID{0xCFCCC7A0, 0xA282, 0x11D1, {0x90, 0x82, 0x00, 0x60, 0x08, 0x05, 0x93, 0x82}}
CLSID_DocHostUIHandler :: GUID{0x7057E952, 0xBD1B, 0x11D1, {0x89, 0x19, 0x00, 0xC0, 0x4F, 0xC2, 0xC8, 0x36}}
CLSID_DragDropHelper :: GUID{0x4657278A, 0x411B, 0x11D2, {0x83, 0x9A, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}
CLSID_FileTypes :: GUID{0xB091E540, 0x83E3, 0x11CF, {0xA7, 0x13, 0x00, 0x20, 0xAF, 0xD7, 0x97, 0x62}}
CLSID_FolderItemsMultiLevel :: GUID{0x53C74826, 0xAB99, 0x4D33, {0xAC, 0xA4, 0x31, 0x17, 0xF5, 0x1D, 0x37, 0x88}}
CLSID_FolderShortcut :: GUID{0x0AFACED1, 0xE828, 0x11D1, {0x91, 0x87, 0xB5, 0x32, 0xF1, 0xE9, 0x57, 0x5D}}
CLSID_HWShellExecute :: GUID{0xFFB8655F, 0x81B9, 0x4FCE, {0xB8, 0x9C, 0x9A, 0x6B, 0xA7, 0x6D, 0x13, 0xE7}}
CLSID_Internet :: GUID{0x871C5380, 0x42A0, 0x1069, {0xA2, 0xEA, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D}}
CLSID_InternetButtons :: GUID{0x1E796980, 0x9CC5, 0x11D1, {0xA8, 0x3F, 0x00, 0xC0, 0x4F, 0xC9, 0x9D, 0x61}}
CLSID_InternetShortcut :: GUID{0xFBF23B40, 0xE3F0, 0x101B, {0x84, 0x88, 0x00, 0xAA, 0x00, 0x3E, 0x56, 0xF8}}
CLSID_ISFBand :: GUID{0xD82BE2B0, 0x5764, 0x11D0, {0xA9, 0x6E, 0x00, 0xC0, 0x4F, 0xD7, 0x05, 0xA2}}
CLSID_LinkColumnProvider :: GUID{0x24F14F02, 0x7B1C, 0x11D1, {0x83, 0x8F, 0x00, 0x00, 0xF8, 0x04, 0x61, 0xCF}}
CLSID_MenuBand :: GUID{0x5B4DAE26, 0xB807, 0x11D0, {0x98, 0x15, 0x00, 0xC0, 0x4F, 0xD9, 0x19, 0x72}}
CLSID_MenuBandSite :: GUID{0xE13EF4E4, 0xD2F2, 0x11D0, {0x98, 0x16, 0x00, 0xC0, 0x4F, 0xD9, 0x19, 0x72}}
CLSID_MenuToolbarBase :: GUID{0x40B96610, 0xB522, 0x11D1, {0xB3, 0xB4, 0x00, 0xAA, 0x00, 0x6E, 0xFD, 0xE7}}
CLSID_MSOButtons :: GUID{0x178F34B8, 0xA282, 0x11D2, {0x86, 0xC5, 0x00, 0xC0, 0x4F, 0x8E, 0xEA, 0x99}}
CLSID_MyComputer :: GUID{0x20D04FE0, 0x3AEA, 0x1069, {0xA2, 0xD8, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D}}
CLSID_MyDocuments :: GUID{0x450D8FBA, 0xAD25, 0x11D0, {0x98, 0xA8, 0x08, 0x00, 0x36, 0x1B, 0x11, 0x03}}
CLSID_NetworkDomain :: GUID{0x46E06680, 0x4BF0, 0x11D1, {0x83, 0xEE, 0x00, 0xA0, 0xC9, 0x0D, 0xC8, 0x49}}
CLSID_NetworkServer :: GUID{0xC0542A90, 0x4BF0, 0x11D1, {0x83, 0xEE, 0x00, 0xA0, 0xC9, 0x0D, 0xC8, 0x49}}
CLSID_NetworkShare :: GUID{0x54A754C0, 0x4BF0, 0x11D1, {0x83, 0xEE, 0x00, 0xA0, 0xC9, 0x0D, 0xC8, 0x49}}
CLSID_NewMenu :: GUID{0xD969A300, 0xE7FF, 0x11D0, {0xA9, 0x3B, 0x00, 0xA0, 0xC9, 0x0F, 0x27, 0x19}}
CLSID_Printers :: GUID{0x2227A280, 0x3AEA, 0x1069, {0xA2, 0xDE, 0x08, 0x00, 0x2B, 0x30, 0x30, 0x9D}}
CLSID_ProgressDialog :: GUID{0xF8383852, 0xFCD3, 0x11D1, {0xA6, 0xB9, 0x00, 0x60, 0x97, 0xDF, 0x5B, 0xD4}}
CLSID_QueryAssociations :: GUID{0xA07034FD, 0x6CAA, 0x4954, {0xAC, 0x3F, 0x97, 0xA2, 0x72, 0x16, 0xF9, 0x8A}}
CLSID_QuickLinks :: GUID{0x0E5CBF21, 0xD15F, 0x11D0, {0x83, 0x01, 0x00, 0xAA, 0x00, 0x5B, 0x43, 0x83}}
CLSID_RecycleBin :: GUID{0x645FF040, 0x5081, 0x101B, {0x9F, 0x08, 0x00, 0xAA, 0x00, 0x2F, 0x95, 0x4E}}
CLSID_ShellFldSetExt :: GUID{0x6D5313C0, 0x8C62, 0x11D1, {0xB2, 0xCD, 0x00, 0x60, 0x97, 0xDF, 0x8C, 0x11}}
CLSID_ShellThumbnailDiskCache :: GUID{0x1EBDCF80, 0xA200, 0x11D0, {0xA3, 0xA4, 0x00, 0xC0, 0x4F, 0xD7, 0x06, 0xEC}}
CLSID_ToolbarExtButtons :: GUID{0x2CE4B5D8, 0xA28F, 0x11D2, {0x86, 0xC5, 0x00, 0xC0, 0x4F, 0x8E, 0xEA, 0x99}}
CMDID_INTSHORTCUTCREATE :: 1
CMDSTR_NEWFOLDER :: "NewFolder"
CMDSTR_NEWFOLDERA :: "NewFolder"
CMDSTR_NEWFOLDERW :: "NewFolder"
CMDSTR_VIEWDETAILS :: "ViewDetails"
CMDSTR_VIEWDETAILSA :: "ViewDetails"
CMDSTR_VIEWDETAILSW :: "ViewDetails"
CMDSTR_VIEWLIST :: "ViewList"
CMDSTR_VIEWLISTA :: "ViewList"
CMDSTR_VIEWLISTW :: "ViewList"
CMF_ASYNCVERBSTATE :: 1024
CMF_CANRENAME :: 16
CMF_DEFAULTONLY :: 1
CMF_DISABLEDVERBS :: 512
CMF_DONOTPICKDEFAULT :: 8192
CMF_EXPLORE :: 4
CMF_EXTENDEDVERBS :: 256
CMF_INCLUDESTATIC :: 64
CMF_ITEMMENU :: 128
CMF_NODEFAULT :: 32
CMF_NORMAL :: 0
CMF_NOVERBS :: 8
CMF_OPTIMIZEFORINVOKE :: 2048
CMF_RESERVED :: 4294901760
CMF_SYNCCASCADEMENU :: 4096
CMF_VERBSONLY :: 2
CMIC_MASK_CONTROL_DOWN :: 1073741824
CMIC_MASK_PTINVOKE :: 536870912
CMIC_MASK_SHIFT_DOWN :: 268435456
COMP_ELEM_CHECKED :: 2
COMP_ELEM_CURITEMSTATE :: 16384
COMP_ELEM_DIRTY :: 4
COMP_ELEM_FRIENDLYNAME :: 1024
COMP_ELEM_NOSCROLL :: 8
COMP_ELEM_ORIGINAL_CSI :: 4096
COMP_ELEM_POS_LEFT :: 16
COMP_ELEM_POS_TOP :: 32
COMP_ELEM_POS_ZINDEX :: 256
COMP_ELEM_RESTORED_CSI :: 8192
COMP_ELEM_SIZE_HEIGHT :: 128
COMP_ELEM_SIZE_WIDTH :: 64
COMP_ELEM_SOURCE :: 512
COMP_ELEM_SUBSCRIBEDURL :: 2048
COMP_ELEM_TYPE :: 1
COMP_TYPE_CFHTML :: 4
COMP_TYPE_CONTROL :: 3
COMP_TYPE_HTMLDOC :: 0
COMP_TYPE_MAX :: 4
COMP_TYPE_PICTURE :: 1
COMP_TYPE_WEBSITE :: 2
COMPONENT_DEFAULT_LEFT :: 65535
COMPONENT_DEFAULT_TOP :: 65535
COMPONENT_TOP :: 1073741823
CONFLICT_RESOLUTION_CLSID_KEY :: "ConflictResolutionCLSID"
COPYENGINE_E_ACCESS_DENIED_DEST :: -2144927710
COPYENGINE_E_ACCESS_DENIED_SRC :: -2144927711
COPYENGINE_E_ACCESSDENIED_READONLY :: -2144927681
COPYENGINE_E_ALREADY_EXISTS_FOLDER :: -2144927700
COPYENGINE_E_ALREADY_EXISTS_NORMAL :: -2144927703
COPYENGINE_E_ALREADY_EXISTS_READONLY :: -2144927702
COPYENGINE_E_ALREADY_EXISTS_SYSTEM :: -2144927701
COPYENGINE_E_BLOCKED_BY_DLP_POLICY :: -2144927666
COPYENGINE_E_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE :: -2144927670
COPYENGINE_E_BLOCKED_BY_EDP_POLICY :: -2144927672
COPYENGINE_E_CANCELLED :: -2144927743
COPYENGINE_E_CANNOT_MOVE_FROM_RECYCLE_BIN :: -2144927677
COPYENGINE_E_CANNOT_MOVE_SHARED_FOLDER :: -2144927676
COPYENGINE_E_CANT_REACH_SOURCE :: -2144927691
COPYENGINE_E_DEST_IS_R_CD :: -2144927727
COPYENGINE_E_DEST_IS_R_DVD :: -2144927724
COPYENGINE_E_DEST_IS_RO_CD :: -2144927729
COPYENGINE_E_DEST_IS_RO_DVD :: -2144927726
COPYENGINE_E_DEST_IS_RW_CD :: -2144927728
COPYENGINE_E_DEST_IS_RW_DVD :: -2144927725
COPYENGINE_E_DEST_SAME_TREE :: -2144927734
COPYENGINE_E_DEST_SUBTREE :: -2144927735
COPYENGINE_E_DIFF_DIR :: -2144927740
COPYENGINE_E_DIR_NOT_EMPTY :: -2144927683
COPYENGINE_E_DISK_FULL :: -2144927694
COPYENGINE_E_DISK_FULL_CLEAN :: -2144927693
COPYENGINE_E_EA_LOSS :: -2144927698
COPYENGINE_E_EA_NOT_SUPPORTED :: -2144927692
COPYENGINE_E_ENCRYPTION_LOSS :: -2144927695
COPYENGINE_E_FAT_MAX_IN_ROOT :: -2144927682
COPYENGINE_E_FILE_IS_FLD_DEST :: -2144927732
COPYENGINE_E_FILE_TOO_LARGE :: -2144927731
COPYENGINE_E_FLD_IS_FILE_DEST :: -2144927733
COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_ERROR :: -2144927675
COPYENGINE_E_INTERNET_ITEM_STORAGE_PROVIDER_PAUSED :: -2144927674
COPYENGINE_E_INTERNET_ITEM_UNAVAILABLE :: -2144927678
COPYENGINE_E_INVALID_FILES_DEST :: -2144927716
COPYENGINE_E_INVALID_FILES_SRC :: -2144927717
COPYENGINE_E_MANY_SRC_1_DEST :: -2144927739
COPYENGINE_E_NET_DISCONNECT_DEST :: -2144927706
COPYENGINE_E_NET_DISCONNECT_SRC :: -2144927707
COPYENGINE_E_NEWFILE_NAME_TOO_LONG :: -2144927685
COPYENGINE_E_NEWFOLDER_NAME_TOO_LONG :: -2144927684
COPYENGINE_E_PATH_NOT_FOUND_DEST :: -2144927708
COPYENGINE_E_PATH_NOT_FOUND_SRC :: -2144927709
COPYENGINE_E_PATH_TOO_DEEP_DEST :: -2144927714
COPYENGINE_E_PATH_TOO_DEEP_SRC :: -2144927715
COPYENGINE_E_PROPERTIES_LOSS :: -2144927696
COPYENGINE_E_PROPERTY_LOSS :: -2144927697
COPYENGINE_E_RECYCLE_BIN_NOT_FOUND :: -2144927686
COPYENGINE_E_RECYCLE_FORCE_NUKE :: -2144927690
COPYENGINE_E_RECYCLE_PATH_TOO_LONG :: -2144927688
COPYENGINE_E_RECYCLE_SIZE_TOO_BIG :: -2144927689
COPYENGINE_E_RECYCLE_UNKNOWN_ERROR :: -2144927691
COPYENGINE_E_REDIRECTED_TO_WEBPAGE :: -2144927680
COPYENGINE_E_REMOVABLE_FULL :: -2144927730
COPYENGINE_E_REQUIRES_EDP_CONSENT :: -2144927673
COPYENGINE_E_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE :: -2144927671
COPYENGINE_E_REQUIRES_ELEVATION :: -2144927742
COPYENGINE_E_RMS_BLOCKED_BY_EDP_FOR_REMOVABLE_DRIVE :: -2144927668
COPYENGINE_E_RMS_REQUIRES_EDP_CONSENT_FOR_REMOVABLE_DRIVE :: -2144927669
COPYENGINE_E_ROOT_DIR_DEST :: -2144927712
COPYENGINE_E_ROOT_DIR_SRC :: -2144927713
COPYENGINE_E_SAME_FILE :: -2144927741
COPYENGINE_E_SERVER_BAD_FILE_TYPE :: -2144927679
COPYENGINE_E_SHARING_VIOLATION_DEST :: -2144927704
COPYENGINE_E_SHARING_VIOLATION_SRC :: -2144927705
COPYENGINE_E_SILENT_FAIL_BY_DLP_POLICY :: -2144927665
COPYENGINE_E_SRC_IS_R_CD :: -2144927721
COPYENGINE_E_SRC_IS_R_DVD :: -2144927718
COPYENGINE_E_SRC_IS_RO_CD :: -2144927723
COPYENGINE_E_SRC_IS_RO_DVD :: -2144927720
COPYENGINE_E_SRC_IS_RW_CD :: -2144927722
COPYENGINE_E_SRC_IS_RW_DVD :: -2144927719
COPYENGINE_E_STREAM_LOSS :: -2144927699
COPYENGINE_E_USER_CANCELLED :: -2144927744
COPYENGINE_E_WARNED_BY_DLP_POLICY :: -2144927667
COPYENGINE_S_ALREADY_DONE :: 2555914
COPYENGINE_S_CLOSE_PROGRAM :: 2555917
COPYENGINE_S_COLLISIONRESOLVED :: 2555918
COPYENGINE_S_DONT_PROCESS_CHILDREN :: 2555912
COPYENGINE_S_KEEP_BOTH :: 2555916
COPYENGINE_S_MERGE :: 2555910
COPYENGINE_S_NOT_HANDLED :: 2555907
COPYENGINE_S_PENDING :: 2555915
COPYENGINE_S_PENDING_DELETE :: 2555920
COPYENGINE_S_PROGRESS_PAUSE :: 2555919
COPYENGINE_S_USER_IGNORED :: 2555909
COPYENGINE_S_USER_RETRY :: 2555908
COPYENGINE_S_YES :: 2555905
CPFG_CREDENTIAL_PROVIDER_LABEL :: GUID{0x286BBFF3, 0xBAD4, 0x438F, {0xB0, 0x07, 0x79, 0xB7, 0x26, 0x7C, 0x3D, 0x48}}
CPFG_CREDENTIAL_PROVIDER_LOGO :: GUID{0x2D837775, 0xF6CD, 0x464E, {0xA7, 0x45, 0x48, 0x2F, 0xD0, 0xB4, 0x74, 0x93}}
CPFG_LOGON_PASSWORD :: GUID{0x60624CFA, 0xA477, 0x47B1, {0x8A, 0x8E, 0x3A, 0x4A, 0x19, 0x98, 0x18, 0x27}}
CPFG_LOGON_USERNAME :: GUID{0xDA15BBE8, 0x954D, 0x4FD3, {0xB0, 0xF4, 0x1F, 0xB5, 0xB9, 0x0B, 0x17, 0x4B}}
CPFG_SMARTCARD_PIN :: GUID{0x4FE5263B, 0x9181, 0x46C1, {0xB0, 0xA4, 0x9D, 0xED, 0xD4, 0xDB, 0x7D, 0xEA}}
CPFG_SMARTCARD_USERNAME :: GUID{0x3E1ECF69, 0x568C, 0x4D96, {0x9D, 0x59, 0x46, 0x44, 0x41, 0x74, 0xE2, 0xD6}}
CPFG_STANDALONE_SUBMIT_BUTTON :: GUID{0x0B7B0AD8, 0xCC36, 0x4D59, {0x80, 0x2B, 0x82, 0xF7, 0x14, 0xFA, 0x70, 0x22}}
CPFG_STYLE_LINK_AS_BUTTON :: GUID{0x088FA508, 0x94A6, 0x4430, {0xA4, 0xCB, 0x6F, 0xC6, 0xE3, 0xC0, 0xB9, 0xE2}}
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-dblclk ]]
CPL_DBLCLK :: 5
CPL_DYNAMIC_RES :: 0
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-exit ]]
CPL_EXIT :: 7
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-getcount ]]
CPL_GETCOUNT :: 2
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-init ]]
CPL_INIT :: 1
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-inquire ]]
CPL_INQUIRE :: 3
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-newinquire ]]
CPL_NEWINQUIRE :: 8
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-select ]]
CPL_SELECT :: 4
CPL_SETUP :: 200
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-startwparms ]]
CPL_STARTWPARMS :: 10
CPL_STARTWPARMSA :: 9
CPL_STARTWPARMSW :: 10
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/cpl-stop ]]
CPL_STOP :: 6
CPLPAGE_DISPLAY_BACKGROUND :: 1
CPLPAGE_KEYBOARD_SPEED :: 1
CPLPAGE_MOUSE_BUTTONS :: 1
CPLPAGE_MOUSE_PTRMOTION :: 2
CPLPAGE_MOUSE_WHEEL :: 3
CREDENTIAL_PROVIDER_NO_DEFAULT :: 4294967295
CSIDL_ADMINTOOLS :: 48
CSIDL_ALTSTARTUP :: 29
CSIDL_APPDATA :: 26
CSIDL_BITBUCKET :: 10
CSIDL_CDBURN_AREA :: 59
CSIDL_COMMON_ADMINTOOLS :: 47
CSIDL_COMMON_ALTSTARTUP :: 30
CSIDL_COMMON_APPDATA :: 35
CSIDL_COMMON_DESKTOPDIRECTORY :: 25
CSIDL_COMMON_DOCUMENTS :: 46
CSIDL_COMMON_FAVORITES :: 31
CSIDL_COMMON_MUSIC :: 53
CSIDL_COMMON_OEM_LINKS :: 58
CSIDL_COMMON_PICTURES :: 54
CSIDL_COMMON_PROGRAMS :: 23
CSIDL_COMMON_STARTMENU :: 22
CSIDL_COMMON_STARTUP :: 24
CSIDL_COMMON_TEMPLATES :: 45
CSIDL_COMMON_VIDEO :: 55
CSIDL_COMPUTERSNEARME :: 61
CSIDL_CONNECTIONS :: 49
CSIDL_CONTROLS :: 3
CSIDL_COOKIES :: 33
CSIDL_DESKTOP :: 0
CSIDL_DESKTOPDIRECTORY :: 16
CSIDL_DRIVES :: 17
CSIDL_FAVORITES :: 6
CSIDL_FLAG_CREATE :: 32768
CSIDL_FLAG_DONT_UNEXPAND :: 8192
CSIDL_FLAG_DONT_VERIFY :: 16384
CSIDL_FLAG_MASK :: 65280
CSIDL_FLAG_NO_ALIAS :: 4096
CSIDL_FLAG_PER_USER_INIT :: 2048
CSIDL_FLAG_PFTI_TRACKTARGET :: 16384
CSIDL_FONTS :: 20
CSIDL_HISTORY :: 34
CSIDL_INTERNET :: 1
CSIDL_INTERNET_CACHE :: 32
CSIDL_LOCAL_APPDATA :: 28
CSIDL_MYDOCUMENTS :: 5
CSIDL_MYMUSIC :: 13
CSIDL_MYPICTURES :: 39
CSIDL_MYVIDEO :: 14
CSIDL_NETHOOD :: 19
CSIDL_NETWORK :: 18
CSIDL_PERSONAL :: 5
CSIDL_PRINTERS :: 4
CSIDL_PRINTHOOD :: 27
CSIDL_PROFILE :: 40
CSIDL_PROGRAM_FILES :: 38
CSIDL_PROGRAM_FILES_COMMON :: 43
CSIDL_PROGRAM_FILES_COMMONX86 :: 44
CSIDL_PROGRAM_FILESX86 :: 42
CSIDL_PROGRAMS :: 2
CSIDL_RECENT :: 8
CSIDL_RESOURCES :: 56
CSIDL_RESOURCES_LOCALIZED :: 57
CSIDL_SENDTO :: 9
CSIDL_STARTMENU :: 11
CSIDL_STARTUP :: 7
CSIDL_SYSTEM :: 37
CSIDL_SYSTEMX86 :: 41
CSIDL_TEMPLATES :: 21
CSIDL_WINDOWS :: 36
CTF_COINIT :: 8
CTF_COINIT_MTA :: 4096
CTF_COINIT_STA :: 8
CTF_FREELIBANDEXIT :: 16
CTF_INHERITWOW64 :: 256
CTF_INSIST :: 1
CTF_KEYBOARD_LOCALE :: 1024
CTF_NOADDREFLIB :: 8192
CTF_OLEINITIALIZE :: 2048
CTF_PROCESS_REF :: 4
CTF_REF_COUNTED :: 32
CTF_THREAD_REF :: 2
CTF_UNUSED :: 128
CTF_WAIT_ALLOWCOM :: 64
CTF_WAIT_NO_REENTRANCY :: 512
DBC_GS_IDEAL :: 0
DBC_GS_SIZEDOWN :: 1
DBC_HIDE :: 0
DBC_SHOW :: 1
DBC_SHOWOBSCURE :: 2
DBCID_CLSIDOFBAR :: 2
DBCID_EMPTY :: 0
DBCID_GETBAR :: 4
DBCID_ONDRAG :: 1
DBCID_RESIZE :: 3
DBCID_UPDATESIZE :: 5
DBIF_VIEWMODE_FLOATING :: 2
DBIF_VIEWMODE_NORMAL :: 0
DBIF_VIEWMODE_TRANSPARENT :: 4
DBIF_VIEWMODE_VERTICAL :: 1
DBIM_ACTUAL :: 8
DBIM_BKCOLOR :: 64
DBIM_INTEGRAL :: 4
DBIM_MAXSIZE :: 2
DBIM_MINSIZE :: 1
DBIM_MODEFLAGS :: 32
DBIM_TITLE :: 16
DBIMF_ADDTOFRONT :: 512
DBIMF_ALWAYSGRIPPER :: 4096
DBIMF_BKCOLOR :: 64
DBIMF_BREAK :: 256
DBIMF_DEBOSSED :: 32
DBIMF_FIXED :: 1
DBIMF_FIXEDBMP :: 4
DBIMF_NOGRIPPER :: 2048
DBIMF_NOMARGINS :: 8192
DBIMF_NORMAL :: 0
DBIMF_TOPALIGN :: 1024
DBIMF_UNDELETEABLE :: 16
DBIMF_USECHEVRON :: 128
DBIMF_VARIABLEHEIGHT :: 8
DBPC_SELECTFIRST :: 4294967295
DI_GETDRAGIMAGE :: "ShellGetDragImage"
DISPID_BEGINDRAG :: 204
DISPID_CHECKSTATECHANGED :: 209
DISPID_COLUMNSCHANGED :: 212
DISPID_CONTENTSCHANGED :: 207
DISPID_CTRLMOUSEWHEEL :: 213
DISPID_DEFAULTVERBINVOKED :: 203
DISPID_ENTERPRESSED :: 200
DISPID_ENTERPRISEIDCHANGED :: 224
DISPID_EXPLORERWINDOWREADY :: 221
DISPID_FILELISTENUMDONE :: 201
DISPID_FILTERINVOKED :: 218
DISPID_FOCUSCHANGED :: 208
DISPID_FOLDERCHANGED :: 217
DISPID_IADCCTL_DEFAULTCAT :: 262
DISPID_IADCCTL_DIRTY :: 256
DISPID_IADCCTL_FORCEX86 :: 259
DISPID_IADCCTL_ONDOMAIN :: 261
DISPID_IADCCTL_PUBCAT :: 257
DISPID_IADCCTL_SHOWPOSTSETUP :: 260
DISPID_IADCCTL_SORT :: 258
DISPID_ICONSIZECHANGED :: 215
DISPID_INITIALENUMERATIONDONE :: 223
DISPID_NOITEMSTATE_CHANGED :: 206
DISPID_ORDERCHANGED :: 210
DISPID_SEARCHCOMMAND_ABORT :: 3
DISPID_SEARCHCOMMAND_COMPLETE :: 2
DISPID_SEARCHCOMMAND_ERROR :: 6
DISPID_SEARCHCOMMAND_PROGRESSTEXT :: 5
DISPID_SEARCHCOMMAND_RESTORE :: 7
DISPID_SEARCHCOMMAND_START :: 1
DISPID_SEARCHCOMMAND_UPDATE :: 4
DISPID_SELECTEDITEMCHANGED :: 220
DISPID_SELECTIONCHANGED :: 200
DISPID_SORTDONE :: 214
DISPID_UPDATEIMAGE :: 222
DISPID_VERBINVOKED :: 202
DISPID_VIEWMODECHANGED :: 205
DISPID_VIEWPAINTDONE :: 211
DISPID_WORDWHEELEDITED :: 219
DLG_SCRNSAVECONFIGURE :: 2003
DLLVER_BUILD_MASK :: 4294901760
DLLVER_MAJOR_MASK :: 18446462598732840960
DLLVER_MINOR_MASK :: 281470681743360
DLLVER_PLATFORM_NT :: 2
DLLVER_PLATFORM_WINDOWS :: 1
DLLVER_QFE_MASK :: 65535
DVASPECT_COPY :: 3
DVASPECT_LINK :: 4
DVASPECT_SHORTNAME :: 2
DWFAF_AUTOHIDE :: 16
DWFAF_GROUP1 :: 2
DWFAF_GROUP2 :: 4
DWFAF_HIDDEN :: 1
DWFRF_DELETECONFIGDATA :: 1
DWFRF_NORMAL :: 0
E_ACTIVATIONDENIED_SHELLERROR :: -2144927439
E_ACTIVATIONDENIED_SHELLNOTREADY :: -2144927436
E_ACTIVATIONDENIED_SHELLRESTART :: -2144927438
E_ACTIVATIONDENIED_UNEXPECTED :: -2144927437
E_ACTIVATIONDENIED_USERCLOSE :: -2144927440
E_FILE_PLACEHOLDER_NOT_INITIALIZED :: -2144927472
E_FILE_PLACEHOLDER_SERVER_TIMED_OUT :: -2144927470
E_FILE_PLACEHOLDER_STORAGEPROVIDER_NOT_FOUND :: -2144927469
E_FILE_PLACEHOLDER_VERSION_MISMATCH :: -2144927471
E_FLAGS :: -2147217408
E_IMAGEFEED_CHANGEDISABLED :: -2144926960
E_NOTVALIDFORANIMATEDIMAGE :: -2147221503
E_PREVIEWHANDLER_CORRUPT :: -2042494972
E_PREVIEWHANDLER_DRM_FAIL :: -2042494975
E_PREVIEWHANDLER_NOAUTH :: -2042494974
E_PREVIEWHANDLER_NOTFOUND :: -2042494973
E_SHELL_EXTENSION_BLOCKED :: -2144926975
E_TILE_NOTIFICATIONS_PLATFORM_FAILURE :: -2144927159
E_USERTILE_CHANGEDISABLED :: -2144927215
E_USERTILE_FILESIZE :: -2144927212
E_USERTILE_LARGEORDYNAMIC :: -2144927214
E_USERTILE_UNSUPPORTEDFILETYPE :: -2144927216
E_USERTILE_VIDEOFRAMESIZE :: -2144927213
EP_AdvQueryPane :: GUID{0xB4E9DB8B, 0x34BA, 0x4C39, {0xB5, 0xCC, 0x16, 0xA1, 0xBD, 0x2C, 0x41, 0x1C}}
EP_Commands :: GUID{0xD9745868, 0xCA5F, 0x4A76, {0x91, 0xCD, 0xF5, 0xA1, 0x29, 0xFB, 0xB0, 0x76}}
EP_Commands_Organize :: GUID{0x72E81700, 0xE3EC, 0x4660, {0xBF, 0x24, 0x3C, 0x3B, 0x7B, 0x64, 0x88, 0x06}}
EP_Commands_View :: GUID{0x21F7C32D, 0xEEAA, 0x439B, {0xBB, 0x51, 0x37, 0xB9, 0x6F, 0xD6, 0xA9, 0x43}}
EP_DetailsPane :: GUID{0x43ABF98B, 0x89B8, 0x472D, {0xB9, 0xCE, 0xE6, 0x9B, 0x82, 0x29, 0xF0, 0x19}}
EP_NavPane :: GUID{0xCB316B22, 0x25F7, 0x42B8, {0x8A, 0x09, 0x54, 0x0D, 0x23, 0xA4, 0x3C, 0x2F}}
EP_PreviewPane :: GUID{0x893C63D1, 0x45C8, 0x4D17, {0xBE, 0x19, 0x22, 0x3B, 0xE7, 0x1B, 0xE3, 0x65}}
EP_QueryPane :: GUID{0x65BCDE4F, 0x4F07, 0x4F27, {0x83, 0xA7, 0x1A, 0xFC, 0xA4, 0xDF, 0x7D, 0xDD}}
EP_Ribbon :: GUID{0xD27524A8, 0xC9F2, 0x4834, {0xA1, 0x06, 0xDF, 0x88, 0x89, 0xFD, 0x4F, 0x37}}
EP_StatusBar :: GUID{0x65FE56CE, 0x5CFE, 0x4BC4, {0xAD, 0x8A, 0x7A, 0xE3, 0xFE, 0x7E, 0x8F, 0x7C}}
EXECUTE_E_LAUNCH_APPLICATION :: -2144927487
EXP_DARWIN_ID_SIG :: 2684354566
EXP_PROPERTYSTORAGE_SIG :: 2684354569
EXP_SPECIAL_FOLDER_SIG :: 2684354565
EXP_SZ_ICON_SIG :: 2684354567
EXP_SZ_LINK_SIG :: 2684354561
FCIDM_BROWSERFIRST :: 40960
FCIDM_BROWSERLAST :: 48896
FCIDM_GLOBALFIRST :: 32768
FCIDM_GLOBALLAST :: 40959
FCIDM_MENU_EDIT :: 32832
FCIDM_MENU_EXPLORE :: 33104
FCIDM_MENU_FAVORITES :: 33136
FCIDM_MENU_FILE :: 32768
FCIDM_MENU_FIND :: 33088
FCIDM_MENU_HELP :: 33024
FCIDM_MENU_TOOLS :: 32960
FCIDM_MENU_TOOLS_SEP_GOTO :: 32961
FCIDM_MENU_VIEW :: 32896
FCIDM_MENU_VIEW_SEP_OPTIONS :: 32897
FCIDM_SHVIEWFIRST :: 0
FCIDM_SHVIEWLAST :: 32767
FCIDM_STATUS :: 40961
FCIDM_TOOLBAR :: 40960
FCS_FLAG_DRAGDROP :: 2
FCS_FORCEWRITE :: 2
FCS_READ :: 1
FCSM_CLSID :: 8
FCSM_FLAGS :: 64
FCSM_ICONFILE :: 16
FCSM_INFOTIP :: 4
FCSM_LOGO :: 32
FCSM_VIEWID :: 1
FCSM_WEBVIEWTEMPLATE :: 2
FCT_ADDTOEND :: 4
FCT_CONFIGABLE :: 2
FCT_MERGE :: 1
FCW_INTERNETBAR :: 6
FCW_PROGRESS :: 8
FCW_STATUS :: 1
FCW_TOOLBAR :: 2
FCW_TREE :: 3
FDTF_LONGDATE :: 4
FDTF_LONGTIME :: 8
FDTF_LTRDATE :: 256
FDTF_NOAUTOREADINGORDER :: 1024
FDTF_RELATIVE :: 16
FDTF_RTLDATE :: 512
FDTF_SHORTDATE :: 2
FDTF_SHORTTIME :: 1
FMTID_Briefcase :: GUID{0x328D8B21, 0x7729, 0x4BFC, {0x95, 0x4C, 0x90, 0x2B, 0x32, 0x9D, 0x56, 0xB0}}
FMTID_CustomImageProperties :: GUID{0x7ECD8B0E, 0xC136, 0x4A9B, {0x94, 0x11, 0x4E, 0xBD, 0x66, 0x73, 0xCC, 0xC3}}
FMTID_Displaced :: GUID{0x9B174B33, 0x40FF, 0x11D2, {0xA2, 0x7E, 0x00, 0xC0, 0x4F, 0xC3, 0x08, 0x71}}
FMTID_DRM :: GUID{0xAEAC19E4, 0x89AE, 0x4508, {0xB9, 0xB7, 0xBB, 0x86, 0x7A, 0xBE, 0xE2, 0xED}}
FMTID_ImageProperties :: GUID{0x14B81DA1, 0x0135, 0x4D31, {0x96, 0xD9, 0x6C, 0xBF, 0xC9, 0x67, 0x1A, 0x99}}
FMTID_InternetSite :: GUID{0x000214A1, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
FMTID_Intshcut :: GUID{0x000214A0, 0x0000, 0x0000, {0xC0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x46}}
FMTID_LibraryProperties :: GUID{0x5D76B67F, 0x9B3D, 0x44BB, {0xB6, 0xAE, 0x25, 0xDA, 0x4F, 0x63, 0x8A, 0x67}}
FMTID_Misc :: GUID{0x9B174B34, 0x40FF, 0x11D2, {0xA2, 0x7E, 0x00, 0xC0, 0x4F, 0xC3, 0x08, 0x71}}
FMTID_MUSIC :: GUID{0x56A3372E, 0xCE9C, 0x11D2, {0x9F, 0x0E, 0x00, 0x60, 0x97, 0xC6, 0x86, 0xF6}}
FMTID_Query :: GUID{0x49691C90, 0x7E17, 0x101A, {0xA9, 0x1C, 0x08, 0x00, 0x2B, 0x2E, 0xCD, 0xA9}}
FMTID_ShellDetails :: GUID{0x28636AA6, 0x953D, 0x11D2, {0xB5, 0xD6, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}
FMTID_Storage :: GUID{0xB725F130, 0x47EF, 0x101A, {0xA5, 0xF1, 0x02, 0x60, 0x8C, 0x9E, 0xEB, 0xAC}}
FMTID_Volume :: GUID{0x9B174B35, 0x40FF, 0x11D2, {0xA2, 0x7E, 0x00, 0xC0, 0x4F, 0xC3, 0x08, 0x71}}
FMTID_WebView :: GUID{0xF2275480, 0xF782, 0x4291, {0xBD, 0x94, 0xF1, 0x36, 0x93, 0x51, 0x3A, 0xEC}}
FO_COPY :: 2
FO_DELETE :: 3
FO_MOVE :: 1
FO_RENAME :: 4
FOLDERID_AccountPictures :: GUID{0x008CA0B1, 0x55B4, 0x4C56, {0xB8, 0xA8, 0x4D, 0xE4, 0xB2, 0x99, 0xD3, 0xBE}}
FOLDERID_AddNewPrograms :: GUID{0xDE61D971, 0x5EBC, 0x4F02, {0xA3, 0xA9, 0x6C, 0x82, 0x89, 0x5E, 0x5C, 0x04}}
FOLDERID_AdminTools :: GUID{0x724EF170, 0xA42D, 0x4FEF, {0x9F, 0x26, 0xB6, 0x0E, 0x84, 0x6F, 0xBA, 0x4F}}
FOLDERID_AllAppMods :: GUID{0x7AD67899, 0x66AF, 0x43BA, {0x91, 0x56, 0x6A, 0xAD, 0x42, 0xE6, 0xC5, 0x96}}
FOLDERID_AppCaptures :: GUID{0xEDC0FE71, 0x98D8, 0x4F4A, {0xB9, 0x20, 0xC8, 0xDC, 0x13, 0x3C, 0xB1, 0x65}}
FOLDERID_AppDataDesktop :: GUID{0xB2C5E279, 0x7ADD, 0x439F, {0xB2, 0x8C, 0xC4, 0x1F, 0xE1, 0xBB, 0xF6, 0x72}}
FOLDERID_AppDataDocuments :: GUID{0x7BE16610, 0x1F7F, 0x44AC, {0xBF, 0xF0, 0x83, 0xE1, 0x5F, 0x2F, 0xFC, 0xA1}}
FOLDERID_AppDataFavorites :: GUID{0x7CFBEFBC, 0xDE1F, 0x45AA, {0xB8, 0x43, 0xA5, 0x42, 0xAC, 0x53, 0x6C, 0xC9}}
FOLDERID_AppDataProgramData :: GUID{0x559D40A3, 0xA036, 0x40FA, {0xAF, 0x61, 0x84, 0xCB, 0x43, 0x0A, 0x4D, 0x34}}
FOLDERID_ApplicationShortcuts :: GUID{0xA3918781, 0xE5F2, 0x4890, {0xB3, 0xD9, 0xA7, 0xE5, 0x43, 0x32, 0x32, 0x8C}}
FOLDERID_AppsFolder :: GUID{0x1E87508D, 0x89C2, 0x42F0, {0x8A, 0x7E, 0x64, 0x5A, 0x0F, 0x50, 0xCA, 0x58}}
FOLDERID_AppUpdates :: GUID{0xA305CE99, 0xF527, 0x492B, {0x8B, 0x1A, 0x7E, 0x76, 0xFA, 0x98, 0xD6, 0xE4}}
FOLDERID_CameraRoll :: GUID{0xAB5FB87B, 0x7CE2, 0x4F83, {0x91, 0x5D, 0x55, 0x08, 0x46, 0xC9, 0x53, 0x7B}}
FOLDERID_CameraRollLibrary :: GUID{0x2B20DF75, 0x1EDA, 0x4039, {0x80, 0x97, 0x38, 0x79, 0x82, 0x27, 0xD5, 0xB7}}
FOLDERID_CDBurning :: GUID{0x9E52AB10, 0xF80D, 0x49DF, {0xAC, 0xB8, 0x43, 0x30, 0xF5, 0x68, 0x78, 0x55}}
FOLDERID_ChangeRemovePrograms :: GUID{0xDF7266AC, 0x9274, 0x4867, {0x8D, 0x55, 0x3B, 0xD6, 0x61, 0xDE, 0x87, 0x2D}}
FOLDERID_CommonAdminTools :: GUID{0xD0384E7D, 0xBAC3, 0x4797, {0x8F, 0x14, 0xCB, 0xA2, 0x29, 0xB3, 0x92, 0xB5}}
FOLDERID_CommonOEMLinks :: GUID{0xC1BAE2D0, 0x10DF, 0x4334, {0xBE, 0xDD, 0x7A, 0xA2, 0x0B, 0x22, 0x7A, 0x9D}}
FOLDERID_CommonPrograms :: GUID{0x0139D44E, 0x6AFE, 0x49F2, {0x86, 0x90, 0x3D, 0xAF, 0xCA, 0xE6, 0xFF, 0xB8}}
FOLDERID_CommonStartMenu :: GUID{0xA4115719, 0xD62E, 0x491D, {0xAA, 0x7C, 0xE7, 0x4B, 0x8B, 0xE3, 0xB0, 0x67}}
FOLDERID_CommonStartMenuPlaces :: GUID{0xA440879F, 0x87A0, 0x4F7D, {0xB7, 0x00, 0x02, 0x07, 0xB9, 0x66, 0x19, 0x4A}}
FOLDERID_CommonStartup :: GUID{0x82A5EA35, 0xD9CD, 0x47C5, {0x96, 0x29, 0xE1, 0x5D, 0x2F, 0x71, 0x4E, 0x6E}}
FOLDERID_CommonTemplates :: GUID{0xB94237E7, 0x57AC, 0x4347, {0x91, 0x51, 0xB0, 0x8C, 0x6C, 0x32, 0xD1, 0xF7}}
FOLDERID_ComputerFolder :: GUID{0x0AC0837C, 0xBBF8, 0x452A, {0x85, 0x0D, 0x79, 0xD0, 0x8E, 0x66, 0x7C, 0xA7}}
FOLDERID_ConflictFolder :: GUID{0x4BFEFB45, 0x347D, 0x4006, {0xA5, 0xBE, 0xAC, 0x0C, 0xB0, 0x56, 0x71, 0x92}}
FOLDERID_ConnectionsFolder :: GUID{0x6F0CD92B, 0x2E97, 0x45D1, {0x88, 0xFF, 0xB0, 0xD1, 0x86, 0xB8, 0xDE, 0xDD}}
FOLDERID_Contacts :: GUID{0x56784854, 0xC6CB, 0x462B, {0x81, 0x69, 0x88, 0xE3, 0x50, 0xAC, 0xB8, 0x82}}
FOLDERID_ControlPanelFolder :: GUID{0x82A74AEB, 0xAEB4, 0x465C, {0xA0, 0x14, 0xD0, 0x97, 0xEE, 0x34, 0x6D, 0x63}}
FOLDERID_Cookies :: GUID{0x2B0F765D, 0xC0E9, 0x4171, {0x90, 0x8E, 0x08, 0xA6, 0x11, 0xB8, 0x4F, 0xF6}}
FOLDERID_CurrentAppMods :: GUID{0x3DB40B20, 0x2A30, 0x4DBE, {0x91, 0x7E, 0x77, 0x1D, 0xD2, 0x1D, 0xD0, 0x99}}
FOLDERID_Desktop :: GUID{0xB4BFCC3A, 0xDB2C, 0x424C, {0xB0, 0x29, 0x7F, 0xE9, 0x9A, 0x87, 0xC6, 0x41}}
FOLDERID_DevelopmentFiles :: GUID{0xDBE8E08E, 0x3053, 0x4BBC, {0xB1, 0x83, 0x2A, 0x7B, 0x2B, 0x19, 0x1E, 0x59}}
FOLDERID_Device :: GUID{0x1C2AC1DC, 0x4358, 0x4B6C, {0x97, 0x33, 0xAF, 0x21, 0x15, 0x65, 0x76, 0xF0}}
FOLDERID_DeviceMetadataStore :: GUID{0x5CE4A5E9, 0xE4EB, 0x479D, {0xB8, 0x9F, 0x13, 0x0C, 0x02, 0x88, 0x61, 0x55}}
FOLDERID_Documents :: GUID{0xFDD39AD0, 0x238F, 0x46AF, {0xAD, 0xB4, 0x6C, 0x85, 0x48, 0x03, 0x69, 0xC7}}
FOLDERID_DocumentsLibrary :: GUID{0x7B0DB17D, 0x9CD2, 0x4A93, {0x97, 0x33, 0x46, 0xCC, 0x89, 0x02, 0x2E, 0x7C}}
FOLDERID_Downloads :: GUID{0x374DE290, 0x123F, 0x4565, {0x91, 0x64, 0x39, 0xC4, 0x92, 0x5E, 0x46, 0x7B}}
FOLDERID_Favorites :: GUID{0x1777F761, 0x68AD, 0x4D8A, {0x87, 0xBD, 0x30, 0xB7, 0x59, 0xFA, 0x33, 0xDD}}
FOLDERID_Fonts :: GUID{0xFD228CB7, 0xAE11, 0x4AE3, {0x86, 0x4C, 0x16, 0xF3, 0x91, 0x0A, 0xB8, 0xFE}}
FOLDERID_Games :: GUID{0xCAC52C1A, 0xB53D, 0x4EDC, {0x92, 0xD7, 0x6B, 0x2E, 0x8A, 0xC1, 0x94, 0x34}}
FOLDERID_GameTasks :: GUID{0x054FAE61, 0x4DD8, 0x4787, {0x80, 0xB6, 0x09, 0x02, 0x20, 0xC4, 0xB7, 0x00}}
FOLDERID_History :: GUID{0xD9DC8A3B, 0xB784, 0x432E, {0xA7, 0x81, 0x5A, 0x11, 0x30, 0xA7, 0x59, 0x63}}
FOLDERID_HomeGroup :: GUID{0x52528A6B, 0xB9E3, 0x4ADD, {0xB6, 0x0D, 0x58, 0x8C, 0x2D, 0xBA, 0x84, 0x2D}}
FOLDERID_HomeGroupCurrentUser :: GUID{0x9B74B6A3, 0x0DFD, 0x4F11, {0x9E, 0x78, 0x5F, 0x78, 0x00, 0xF2, 0xE7, 0x72}}
FOLDERID_ImplicitAppShortcuts :: GUID{0xBCB5256F, 0x79F6, 0x4CEE, {0xB7, 0x25, 0xDC, 0x34, 0xE4, 0x02, 0xFD, 0x46}}
FOLDERID_InternetCache :: GUID{0x352481E8, 0x33BE, 0x4251, {0xBA, 0x85, 0x60, 0x07, 0xCA, 0xED, 0xCF, 0x9D}}
FOLDERID_InternetFolder :: GUID{0x4D9F7874, 0x4E0C, 0x4904, {0x96, 0x7B, 0x40, 0xB0, 0xD2, 0x0C, 0x3E, 0x4B}}
FOLDERID_Libraries :: GUID{0x1B3EA5DC, 0xB587, 0x4786, {0xB4, 0xEF, 0xBD, 0x1D, 0xC3, 0x32, 0xAE, 0xAE}}
FOLDERID_Links :: GUID{0xBFB9D5E0, 0xC6A9, 0x404C, {0xB2, 0xB2, 0xAE, 0x6D, 0xB6, 0xAF, 0x49, 0x68}}
FOLDERID_LocalAppData :: GUID{0xF1B32785, 0x6FBA, 0x4FCF, {0x9D, 0x55, 0x7B, 0x8E, 0x7F, 0x15, 0x70, 0x91}}
FOLDERID_LocalAppDataLow :: GUID{0xA520A1A4, 0x1780, 0x4FF6, {0xBD, 0x18, 0x16, 0x73, 0x43, 0xC5, 0xAF, 0x16}}
FOLDERID_LocalDocuments :: GUID{0xF42EE2D3, 0x909F, 0x4907, {0x88, 0x71, 0x4C, 0x22, 0xFC, 0x0B, 0xF7, 0x56}}
FOLDERID_LocalDownloads :: GUID{0x7D83EE9B, 0x2244, 0x4E70, {0xB1, 0xF5, 0x53, 0x93, 0x04, 0x2A, 0xF1, 0xE4}}
FOLDERID_LocalizedResourcesDir :: GUID{0x2A00375E, 0x224C, 0x49DE, {0xB8, 0xD1, 0x44, 0x0D, 0xF7, 0xEF, 0x3D, 0xDC}}
FOLDERID_LocalMusic :: GUID{0xA0C69A99, 0x21C8, 0x4671, {0x87, 0x03, 0x79, 0x34, 0x16, 0x2F, 0xCF, 0x1D}}
FOLDERID_LocalPictures :: GUID{0x0DDD015D, 0xB06C, 0x45D5, {0x8C, 0x4C, 0xF5, 0x97, 0x13, 0x85, 0x46, 0x39}}
FOLDERID_LocalStorage :: GUID{0xB3EB08D3, 0xA1F3, 0x496B, {0x86, 0x5A, 0x42, 0xB5, 0x36, 0xCD, 0xA0, 0xEC}}
FOLDERID_LocalVideos :: GUID{0x35286A68, 0x3C57, 0x41A1, {0xBB, 0xB1, 0x0E, 0xAE, 0x73, 0xD7, 0x6C, 0x95}}
FOLDERID_Music :: GUID{0x4BD8D571, 0x6D19, 0x48D3, {0xBE, 0x97, 0x42, 0x22, 0x20, 0x08, 0x0E, 0x43}}
FOLDERID_MusicLibrary :: GUID{0x2112AB0A, 0xC86A, 0x4FFE, {0xA3, 0x68, 0x0D, 0xE9, 0x6E, 0x47, 0x01, 0x2E}}
FOLDERID_NetHood :: GUID{0xC5ABBF53, 0xE17F, 0x4121, {0x89, 0x00, 0x86, 0x62, 0x6F, 0xC2, 0xC9, 0x73}}
FOLDERID_NetworkFolder :: GUID{0xD20BEEC4, 0x5CA8, 0x4905, {0xAE, 0x3B, 0xBF, 0x25, 0x1E, 0xA0, 0x9B, 0x53}}
FOLDERID_Objects3D :: GUID{0x31C0DD25, 0x9439, 0x4F12, {0xBF, 0x41, 0x7F, 0xF4, 0xED, 0xA3, 0x87, 0x22}}
FOLDERID_OneDrive :: GUID{0xA52BBA46, 0xE9E1, 0x435F, {0xB3, 0xD9, 0x28, 0xDA, 0xA6, 0x48, 0xC0, 0xF6}}
FOLDERID_OriginalImages :: GUID{0x2C36C0AA, 0x5812, 0x4B87, {0xBF, 0xD0, 0x4C, 0xD0, 0xDF, 0xB1, 0x9B, 0x39}}
FOLDERID_PhotoAlbums :: GUID{0x69D2CF90, 0xFC33, 0x4FB7, {0x9A, 0x0C, 0xEB, 0xB0, 0xF0, 0xFC, 0xB4, 0x3C}}
FOLDERID_Pictures :: GUID{0x33E28130, 0x4E1E, 0x4676, {0x83, 0x5A, 0x98, 0x39, 0x5C, 0x3B, 0xC3, 0xBB}}
FOLDERID_PicturesLibrary :: GUID{0xA990AE9F, 0xA03B, 0x4E80, {0x94, 0xBC, 0x99, 0x12, 0xD7, 0x50, 0x41, 0x04}}
FOLDERID_Playlists :: GUID{0xDE92C1C7, 0x837F, 0x4F69, {0xA3, 0xBB, 0x86, 0xE6, 0x31, 0x20, 0x4A, 0x23}}
FOLDERID_PrintersFolder :: GUID{0x76FC4E2D, 0xD6AD, 0x4519, {0xA6, 0x63, 0x37, 0xBD, 0x56, 0x06, 0x81, 0x85}}
FOLDERID_PrintHood :: GUID{0x9274BD8D, 0xCFD1, 0x41C3, {0xB3, 0x5E, 0xB1, 0x3F, 0x55, 0xA7, 0x58, 0xF4}}
FOLDERID_Profile :: GUID{0x5E6C858F, 0x0E22, 0x4760, {0x9A, 0xFE, 0xEA, 0x33, 0x17, 0xB6, 0x71, 0x73}}
FOLDERID_ProgramData :: GUID{0x62AB5D82, 0xFDC1, 0x4DC3, {0xA9, 0xDD, 0x07, 0x0D, 0x1D, 0x49, 0x5D, 0x97}}
FOLDERID_ProgramFiles :: GUID{0x905E63B6, 0xC1BF, 0x494E, {0xB2, 0x9C, 0x65, 0xB7, 0x32, 0xD3, 0xD2, 0x1A}}
FOLDERID_ProgramFilesCommon :: GUID{0xF7F1ED05, 0x9F6D, 0x47A2, {0xAA, 0xAE, 0x29, 0xD3, 0x17, 0xC6, 0xF0, 0x66}}
FOLDERID_ProgramFilesCommonX64 :: GUID{0x6365D5A7, 0x0F0D, 0x45E5, {0x87, 0xF6, 0x0D, 0xA5, 0x6B, 0x6A, 0x4F, 0x7D}}
FOLDERID_ProgramFilesCommonX86 :: GUID{0xDE974D24, 0xD9C6, 0x4D3E, {0xBF, 0x91, 0xF4, 0x45, 0x51, 0x20, 0xB9, 0x17}}
FOLDERID_ProgramFilesX64 :: GUID{0x6D809377, 0x6AF0, 0x444B, {0x89, 0x57, 0xA3, 0x77, 0x3F, 0x02, 0x20, 0x0E}}
FOLDERID_ProgramFilesX86 :: GUID{0x7C5A40EF, 0xA0FB, 0x4BFC, {0x87, 0x4A, 0xC0, 0xF2, 0xE0, 0xB9, 0xFA, 0x8E}}
FOLDERID_Programs :: GUID{0xA77F5D77, 0x2E2B, 0x44C3, {0xA6, 0xA2, 0xAB, 0xA6, 0x01, 0x05, 0x4A, 0x51}}
FOLDERID_Public :: GUID{0xDFDF76A2, 0xC82A, 0x4D63, {0x90, 0x6A, 0x56, 0x44, 0xAC, 0x45, 0x73, 0x85}}
FOLDERID_PublicDesktop :: GUID{0xC4AA340D, 0xF20F, 0x4863, {0xAF, 0xEF, 0xF8, 0x7E, 0xF2, 0xE6, 0xBA, 0x25}}
FOLDERID_PublicDocuments :: GUID{0xED4824AF, 0xDCE4, 0x45A8, {0x81, 0xE2, 0xFC, 0x79, 0x65, 0x08, 0x36, 0x34}}
FOLDERID_PublicDownloads :: GUID{0x3D644C9B, 0x1FB8, 0x4F30, {0x9B, 0x45, 0xF6, 0x70, 0x23, 0x5F, 0x79, 0xC0}}
FOLDERID_PublicGameTasks :: GUID{0xDEBF2536, 0xE1A8, 0x4C59, {0xB6, 0xA2, 0x41, 0x45, 0x86, 0x47, 0x6A, 0xEA}}
FOLDERID_PublicLibraries :: GUID{0x48DAF80B, 0xE6CF, 0x4F4E, {0xB8, 0x00, 0x0E, 0x69, 0xD8, 0x4E, 0xE3, 0x84}}
FOLDERID_PublicMusic :: GUID{0x3214FAB5, 0x9757, 0x4298, {0xBB, 0x61, 0x92, 0xA9, 0xDE, 0xAA, 0x44, 0xFF}}
FOLDERID_PublicPictures :: GUID{0xB6EBFB86, 0x6907, 0x413C, {0x9A, 0xF7, 0x4F, 0xC2, 0xAB, 0xF0, 0x7C, 0xC5}}
FOLDERID_PublicRingtones :: GUID{0xE555AB60, 0x153B, 0x4D17, {0x9F, 0x04, 0xA5, 0xFE, 0x99, 0xFC, 0x15, 0xEC}}
FOLDERID_PublicUserTiles :: GUID{0x0482AF6C, 0x08F1, 0x4C34, {0x8C, 0x90, 0xE1, 0x7E, 0xC9, 0x8B, 0x1E, 0x17}}
FOLDERID_PublicVideos :: GUID{0x2400183A, 0x6185, 0x49FB, {0xA2, 0xD8, 0x4A, 0x39, 0x2A, 0x60, 0x2B, 0xA3}}
FOLDERID_QuickLaunch :: GUID{0x52A4F021, 0x7B75, 0x48A9, {0x9F, 0x6B, 0x4B, 0x87, 0xA2, 0x10, 0xBC, 0x8F}}
FOLDERID_Recent :: GUID{0xAE50C081, 0xEBD2, 0x438A, {0x86, 0x55, 0x8A, 0x09, 0x2E, 0x34, 0x98, 0x7A}}
FOLDERID_RecordedCalls :: GUID{0x2F8B40C2, 0x83ED, 0x48EE, {0xB3, 0x83, 0xA1, 0xF1, 0x57, 0xEC, 0x6F, 0x9A}}
FOLDERID_RecordedTVLibrary :: GUID{0x1A6FDBA2, 0xF42D, 0x4358, {0xA7, 0x98, 0xB7, 0x4D, 0x74, 0x59, 0x26, 0xC5}}
FOLDERID_RecycleBinFolder :: GUID{0xB7534046, 0x3ECB, 0x4C18, {0xBE, 0x4E, 0x64, 0xCD, 0x4C, 0xB7, 0xD6, 0xAC}}
FOLDERID_ResourceDir :: GUID{0x8AD10C31, 0x2ADB, 0x4296, {0xA8, 0xF7, 0xE4, 0x70, 0x12, 0x32, 0xC9, 0x72}}
FOLDERID_RetailDemo :: GUID{0x12D4C69E, 0x24AD, 0x4923, {0xBE, 0x19, 0x31, 0x32, 0x1C, 0x43, 0xA7, 0x67}}
FOLDERID_Ringtones :: GUID{0xC870044B, 0xF49E, 0x4126, {0xA9, 0xC3, 0xB5, 0x2A, 0x1F, 0xF4, 0x11, 0xE8}}
FOLDERID_RoamedTileImages :: GUID{0xAAA8D5A5, 0xF1D6, 0x4259, {0xBA, 0xA8, 0x78, 0xE7, 0xEF, 0x60, 0x83, 0x5E}}
FOLDERID_RoamingAppData :: GUID{0x3EB685DB, 0x65F9, 0x4CF6, {0xA0, 0x3A, 0xE3, 0xEF, 0x65, 0x72, 0x9F, 0x3D}}
FOLDERID_RoamingTiles :: GUID{0x00BCFC5A, 0xED94, 0x4E48, {0x96, 0xA1, 0x3F, 0x62, 0x17, 0xF2, 0x19, 0x90}}
FOLDERID_SampleMusic :: GUID{0xB250C668, 0xF57D, 0x4EE1, {0xA6, 0x3C, 0x29, 0x0E, 0xE7, 0xD1, 0xAA, 0x1F}}
FOLDERID_SamplePictures :: GUID{0xC4900540, 0x2379, 0x4C75, {0x84, 0x4B, 0x64, 0xE6, 0xFA, 0xF8, 0x71, 0x6B}}
FOLDERID_SamplePlaylists :: GUID{0x15CA69B3, 0x30EE, 0x49C1, {0xAC, 0xE1, 0x6B, 0x5E, 0xC3, 0x72, 0xAF, 0xB5}}
FOLDERID_SampleVideos :: GUID{0x859EAD94, 0x2E85, 0x48AD, {0xA7, 0x1A, 0x09, 0x69, 0xCB, 0x56, 0xA6, 0xCD}}
FOLDERID_SavedGames :: GUID{0x4C5C32FF, 0xBB9D, 0x43B0, {0xB5, 0xB4, 0x2D, 0x72, 0xE5, 0x4E, 0xAA, 0xA4}}
FOLDERID_SavedPictures :: GUID{0x3B193882, 0xD3AD, 0x4EAB, {0x96, 0x5A, 0x69, 0x82, 0x9D, 0x1F, 0xB5, 0x9F}}
FOLDERID_SavedPicturesLibrary :: GUID{0xE25B5812, 0xBE88, 0x4BD9, {0x94, 0xB0, 0x29, 0x23, 0x34, 0x77, 0xB6, 0xC3}}
FOLDERID_SavedSearches :: GUID{0x7D1D3A04, 0xDEBB, 0x4115, {0x95, 0xCF, 0x2F, 0x29, 0xDA, 0x29, 0x20, 0xDA}}
FOLDERID_Screenshots :: GUID{0xB7BEDE81, 0xDF94, 0x4682, {0xA7, 0xD8, 0x57, 0xA5, 0x26, 0x20, 0xB8, 0x6F}}
FOLDERID_SEARCH_CSC :: GUID{0xEE32E446, 0x31CA, 0x4ABA, {0x81, 0x4F, 0xA5, 0xEB, 0xD2, 0xFD, 0x6D, 0x5E}}
FOLDERID_SEARCH_MAPI :: GUID{0x98EC0E18, 0x2098, 0x4D44, {0x86, 0x44, 0x66, 0x97, 0x93, 0x15, 0xA2, 0x81}}
FOLDERID_SearchHistory :: GUID{0x0D4C3DB6, 0x03A3, 0x462F, {0xA0, 0xE6, 0x08, 0x92, 0x4C, 0x41, 0xB5, 0xD4}}
FOLDERID_SearchHome :: GUID{0x190337D1, 0xB8CA, 0x4121, {0xA6, 0x39, 0x6D, 0x47, 0x2D, 0x16, 0x97, 0x2A}}
FOLDERID_SearchTemplates :: GUID{0x7E636BFE, 0xDFA9, 0x4D5E, {0xB4, 0x56, 0xD7, 0xB3, 0x98, 0x51, 0xD8, 0xA9}}
FOLDERID_SendTo :: GUID{0x8983036C, 0x27C0, 0x404B, {0x8F, 0x08, 0x10, 0x2D, 0x10, 0xDC, 0xFD, 0x74}}
FOLDERID_SidebarDefaultParts :: GUID{0x7B396E54, 0x9EC5, 0x4300, {0xBE, 0x0A, 0x24, 0x82, 0xEB, 0xAE, 0x1A, 0x26}}
FOLDERID_SidebarParts :: GUID{0xA75D362E, 0x50FC, 0x4FB7, {0xAC, 0x2C, 0xA8, 0xBE, 0xAA, 0x31, 0x44, 0x93}}
FOLDERID_SkyDrive :: GUID{0xA52BBA46, 0xE9E1, 0x435F, {0xB3, 0xD9, 0x28, 0xDA, 0xA6, 0x48, 0xC0, 0xF6}}
FOLDERID_SkyDriveCameraRoll :: GUID{0x767E6811, 0x49CB, 0x4273, {0x87, 0xC2, 0x20, 0xF3, 0x55, 0xE1, 0x08, 0x5B}}
FOLDERID_SkyDriveDocuments :: GUID{0x24D89E24, 0x2F19, 0x4534, {0x9D, 0xDE, 0x6A, 0x66, 0x71, 0xFB, 0xB8, 0xFE}}
FOLDERID_SkyDriveMusic :: GUID{0xC3F2459E, 0x80D6, 0x45DC, {0xBF, 0xEF, 0x1F, 0x76, 0x9F, 0x2B, 0xE7, 0x30}}
FOLDERID_SkyDrivePictures :: GUID{0x339719B5, 0x8C47, 0x4894, {0x94, 0xC2, 0xD8, 0xF7, 0x7A, 0xDD, 0x44, 0xA6}}
FOLDERID_StartMenu :: GUID{0x625B53C3, 0xAB48, 0x4EC1, {0xBA, 0x1F, 0xA1, 0xEF, 0x41, 0x46, 0xFC, 0x19}}
FOLDERID_StartMenuAllPrograms :: GUID{0xF26305EF, 0x6948, 0x40B9, {0xB2, 0x55, 0x81, 0x45, 0x3D, 0x09, 0xC7, 0x85}}
FOLDERID_Startup :: GUID{0xB97D20BB, 0xF46A, 0x4C97, {0xBA, 0x10, 0x5E, 0x36, 0x08, 0x43, 0x08, 0x54}}
FOLDERID_SyncManagerFolder :: GUID{0x43668BF8, 0xC14E, 0x49B2, {0x97, 0xC9, 0x74, 0x77, 0x84, 0xD7, 0x84, 0xB7}}
FOLDERID_SyncResultsFolder :: GUID{0x289A9A43, 0xBE44, 0x4057, {0xA4, 0x1B, 0x58, 0x7A, 0x76, 0xD7, 0xE7, 0xF9}}
FOLDERID_SyncSetupFolder :: GUID{0x0F214138, 0xB1D3, 0x4A90, {0xBB, 0xA9, 0x27, 0xCB, 0xC0, 0xC5, 0x38, 0x9A}}
FOLDERID_System :: GUID{0x1AC14E77, 0x02E7, 0x4E5D, {0xB7, 0x44, 0x2E, 0xB1, 0xAE, 0x51, 0x98, 0xB7}}
FOLDERID_SystemX86 :: GUID{0xD65231B0, 0xB2F1, 0x4857, {0xA4, 0xCE, 0xA8, 0xE7, 0xC6, 0xEA, 0x7D, 0x27}}
FOLDERID_Templates :: GUID{0xA63293E8, 0x664E, 0x48DB, {0xA0, 0x79, 0xDF, 0x75, 0x9E, 0x05, 0x09, 0xF7}}
FOLDERID_UserPinned :: GUID{0x9E3995AB, 0x1F9C, 0x4F13, {0xB8, 0x27, 0x48, 0xB2, 0x4B, 0x6C, 0x71, 0x74}}
FOLDERID_UserProfiles :: GUID{0x0762D272, 0xC50A, 0x4BB0, {0xA3, 0x82, 0x69, 0x7D, 0xCD, 0x72, 0x9B, 0x80}}
FOLDERID_UserProgramFiles :: GUID{0x5CD7AEE2, 0x2219, 0x4A67, {0xB8, 0x5D, 0x6C, 0x9C, 0xE1, 0x56, 0x60, 0xCB}}
FOLDERID_UserProgramFilesCommon :: GUID{0xBCBD3057, 0xCA5C, 0x4622, {0xB4, 0x2D, 0xBC, 0x56, 0xDB, 0x0A, 0xE5, 0x16}}
FOLDERID_UsersFiles :: GUID{0xF3CE0F7C, 0x4901, 0x4ACC, {0x86, 0x48, 0xD5, 0xD4, 0x4B, 0x04, 0xEF, 0x8F}}
FOLDERID_UsersLibraries :: GUID{0xA302545D, 0xDEFF, 0x464B, {0xAB, 0xE8, 0x61, 0xC8, 0x64, 0x8D, 0x93, 0x9B}}
FOLDERID_Videos :: GUID{0x18989B1D, 0x99B5, 0x455B, {0x84, 0x1C, 0xAB, 0x7C, 0x74, 0xE4, 0xDD, 0xFC}}
FOLDERID_VideosLibrary :: GUID{0x491E922F, 0x5643, 0x4AF4, {0xA7, 0xEB, 0x4E, 0x7A, 0x13, 0x8D, 0x81, 0x74}}
FOLDERID_Windows :: GUID{0xF38BF404, 0x1D43, 0x42F2, {0x93, 0x05, 0x67, 0xDE, 0x0B, 0x28, 0xFC, 0x23}}
FOLDERTYPEID_AccountPictures :: GUID{0xDB2A5D8F, 0x06E6, 0x4007, {0xAB, 0xA6, 0xAF, 0x87, 0x7D, 0x52, 0x6E, 0xA6}}
FOLDERTYPEID_Communications :: GUID{0x91475FE5, 0x586B, 0x4EBA, {0x8D, 0x75, 0xD1, 0x74, 0x34, 0xB8, 0xCD, 0xF6}}
FOLDERTYPEID_CompressedFolder :: GUID{0x80213E82, 0xBCFD, 0x4C4F, {0x88, 0x17, 0xBB, 0x27, 0x60, 0x12, 0x67, 0xA9}}
FOLDERTYPEID_Contacts :: GUID{0xDE2B70EC, 0x9BF7, 0x4A93, {0xBD, 0x3D, 0x24, 0x3F, 0x78, 0x81, 0xD4, 0x92}}
FOLDERTYPEID_ControlPanelCategory :: GUID{0xDE4F0660, 0xFA10, 0x4B8F, {0xA4, 0x94, 0x06, 0x8B, 0x20, 0xB2, 0x23, 0x07}}
FOLDERTYPEID_ControlPanelClassic :: GUID{0x0C3794F3, 0xB545, 0x43AA, {0xA3, 0x29, 0xC3, 0x74, 0x30, 0xC5, 0x8D, 0x2A}}
FOLDERTYPEID_Documents :: GUID{0x7D49D726, 0x3C21, 0x4F05, {0x99, 0xAA, 0xFD, 0xC2, 0xC9, 0x47, 0x46, 0x56}}
FOLDERTYPEID_Downloads :: GUID{0x885A186E, 0xA440, 0x4ADA, {0x81, 0x2B, 0xDB, 0x87, 0x1B, 0x94, 0x22, 0x59}}
FOLDERTYPEID_Games :: GUID{0xB689B0D0, 0x76D3, 0x4CBB, {0x87, 0xF7, 0x58, 0x5D, 0x0E, 0x0C, 0xE0, 0x70}}
FOLDERTYPEID_Generic :: GUID{0x5C4F28B5, 0xF869, 0x4E84, {0x8E, 0x60, 0xF1, 0x1D, 0xB9, 0x7C, 0x5C, 0xC7}}
FOLDERTYPEID_GenericLibrary :: GUID{0x5F4EAB9A, 0x6833, 0x4F61, {0x89, 0x9D, 0x31, 0xCF, 0x46, 0x97, 0x9D, 0x49}}
FOLDERTYPEID_GenericSearchResults :: GUID{0x7FDE1A1E, 0x8B31, 0x49A5, {0x93, 0xB8, 0x6B, 0xE1, 0x4C, 0xFA, 0x49, 0x43}}
FOLDERTYPEID_Invalid :: GUID{0x57807898, 0x8C4F, 0x4462, {0xBB, 0x63, 0x71, 0x04, 0x23, 0x80, 0xB1, 0x09}}
FOLDERTYPEID_Music :: GUID{0x94D6DDCC, 0x4A68, 0x4175, {0xA3, 0x74, 0xBD, 0x58, 0x4A, 0x51, 0x0B, 0x78}}
FOLDERTYPEID_NetworkExplorer :: GUID{0x25CC242B, 0x9A7C, 0x4F51, {0x80, 0xE0, 0x7A, 0x29, 0x28, 0xFE, 0xBE, 0x42}}
FOLDERTYPEID_OpenSearch :: GUID{0x8FAF9629, 0x1980, 0x46FF, {0x80, 0x23, 0x9D, 0xCE, 0xAB, 0x9C, 0x3E, 0xE3}}
FOLDERTYPEID_OtherUsers :: GUID{0xB337FD00, 0x9DD5, 0x4635, {0xA6, 0xD4, 0xDA, 0x33, 0xFD, 0x10, 0x2B, 0x7A}}
FOLDERTYPEID_Pictures :: GUID{0xB3690E58, 0xE961, 0x423B, {0xB6, 0x87, 0x38, 0x6E, 0xBF, 0xD8, 0x32, 0x39}}
FOLDERTYPEID_Printers :: GUID{0x2C7BBEC6, 0xC844, 0x4A0A, {0x91, 0xFA, 0xCE, 0xF6, 0xF5, 0x9C, 0xFD, 0xA1}}
FOLDERTYPEID_PublishedItems :: GUID{0x7F2F5B96, 0xFF74, 0x41DA, {0xAF, 0xD8, 0x1C, 0x78, 0xA5, 0xF3, 0xAE, 0xA2}}
FOLDERTYPEID_RecordedTV :: GUID{0x5557A28F, 0x5DA6, 0x4F83, {0x88, 0x09, 0xC2, 0xC9, 0x8A, 0x11, 0xA6, 0xFA}}
FOLDERTYPEID_RecycleBin :: GUID{0xD6D9E004, 0xCD87, 0x442B, {0x9D, 0x57, 0x5E, 0x0A, 0xEB, 0x4F, 0x6F, 0x72}}
FOLDERTYPEID_SavedGames :: GUID{0xD0363307, 0x28CB, 0x4106, {0x9F, 0x23, 0x29, 0x56, 0xE3, 0xE5, 0xE0, 0xE7}}
FOLDERTYPEID_SearchConnector :: GUID{0x982725EE, 0x6F47, 0x479E, {0xB4, 0x47, 0x81, 0x2B, 0xFA, 0x7D, 0x2E, 0x8F}}
FOLDERTYPEID_Searches :: GUID{0x0B0BA2E3, 0x405F, 0x415E, {0xA6, 0xEE, 0xCA, 0xD6, 0x25, 0x20, 0x78, 0x53}}
FOLDERTYPEID_SearchHome :: GUID{0x834D8A44, 0x0974, 0x4ED6, {0x86, 0x6E, 0xF2, 0x03, 0xD8, 0x0B, 0x38, 0x10}}
FOLDERTYPEID_SoftwareExplorer :: GUID{0xD674391B, 0x52D9, 0x4E07, {0x83, 0x4E, 0x67, 0xC9, 0x86, 0x10, 0xF3, 0x9D}}
FOLDERTYPEID_StartMenu :: GUID{0xEF87B4CB, 0xF2CE, 0x4785, {0x86, 0x58, 0x4C, 0xA6, 0xC6, 0x3E, 0x38, 0xC6}}
FOLDERTYPEID_StorageProviderDocuments :: GUID{0xDD61BD66, 0x70E8, 0x48DD, {0x96, 0x55, 0x65, 0xC5, 0xE1, 0xAA, 0xC2, 0xD1}}
FOLDERTYPEID_StorageProviderGeneric :: GUID{0x4F01EBC5, 0x2385, 0x41F2, {0xA2, 0x8E, 0x2C, 0x5C, 0x91, 0xFB, 0x56, 0xE0}}
FOLDERTYPEID_StorageProviderMusic :: GUID{0x672ECD7E, 0xAF04, 0x4399, {0x87, 0x5C, 0x02, 0x90, 0x84, 0x5B, 0x62, 0x47}}
FOLDERTYPEID_StorageProviderPictures :: GUID{0x71D642A9, 0xF2B1, 0x42CD, {0xAD, 0x92, 0xEB, 0x93, 0x00, 0xC7, 0xCC, 0x0A}}
FOLDERTYPEID_StorageProviderVideos :: GUID{0x51294DA1, 0xD7B1, 0x485B, {0x9E, 0x9A, 0x17, 0xCF, 0xFE, 0x33, 0xE1, 0x87}}
FOLDERTYPEID_UserFiles :: GUID{0xCD0FC69B, 0x71E2, 0x46E5, {0x96, 0x90, 0x5B, 0xCD, 0x9F, 0x57, 0xAA, 0xB3}}
FOLDERTYPEID_UsersLibraries :: GUID{0xC4D98F09, 0x6124, 0x4FE0, {0x99, 0x42, 0x82, 0x64, 0x16, 0x08, 0x2D, 0xA9}}
FOLDERTYPEID_Videos :: GUID{0x5FA96407, 0x7E77, 0x483C, {0xAC, 0x93, 0x69, 0x1D, 0x05, 0x85, 0x0D, 0xE8}}
FVSIF_CANVIEWIT :: 1073741824
FVSIF_NEWFAILED :: 134217728
FVSIF_NEWFILE :: 2147483648
FVSIF_PINNED :: 2
FVSIF_RECT :: 1
GADOF_DIRTY :: 1
GCS_HELPTEXT :: 5
GCS_HELPTEXTA :: 1
GCS_HELPTEXTW :: 5
GCS_UNICODE :: 4
GCS_VALIDATE :: 6
GCS_VALIDATEA :: 2
GCS_VALIDATEW :: 6
GCS_VERB :: 4
GCS_VERBA :: 0
GCS_VERBICONW :: 20
GCS_VERBW :: 4
GCT_INVALID :: 0
GCT_LFNCHAR :: 1
GCT_SEPARATOR :: 8
GCT_SHORTCHAR :: 2
GCT_WILD :: 4
GETPROPS_NONE :: 0
GIL_ASYNC :: 32
GIL_CHECKSHIELD :: 512
GIL_DEFAULTICON :: 64
GIL_DONTCACHE :: 16
GIL_FORCENOSHIELD :: 1024
GIL_FORSHELL :: 2
GIL_FORSHORTCUT :: 128
GIL_NOTFILENAME :: 8
GIL_OPENICON :: 1
GIL_PERCLASS :: 4
GIL_PERINSTANCE :: 2
GIL_SHIELD :: 512
GIL_SIMULATEDOC :: 1
HLINK_E_FIRST :: -2147221248
HLINK_S_DONTHIDE :: 262400
HLINK_S_FIRST :: 262400
HLNF_ALLOW_AUTONAVIGATE :: 536870912
HLNF_CALLERUNTRUSTED :: 2097152
HLNF_DISABLEWINDOWRESTRICTIONS :: 8388608
HLNF_EXTERNALNAVIGATE :: 268435456
HLNF_NEWWINDOWSMANAGED :: 2147483648
HLNF_TRUSTEDFORACTIVEX :: 4194304
HLNF_TRUSTFIRSTDOWNLOAD :: 16777216
HLNF_UNTRUSTEDFORDOWNLOAD :: 33554432
HOMEGROUP_SECURITY_GROUP :: "HomeUsers"
HOMEGROUP_SECURITY_GROUP_MULTI :: "HUG"
ID_APP :: 100
IDC_OFFLINE_HAND :: 103
IDC_PANTOOL_HAND_CLOSED :: 105
IDC_PANTOOL_HAND_OPEN :: 104
IDD_WIZEXTN_FIRST :: 20480
IDD_WIZEXTN_LAST :: 20736
Identity_LocalUserProvider :: GUID{0xA198529B, 0x730F, 0x4089, {0xB6, 0x46, 0xA1, 0x25, 0x57, 0xF5, 0x66, 0x5E}}
IDO_SHGIOI_DEFAULT :: 4294967292
IDO_SHGIOI_LINK :: 268435454
IDO_SHGIOI_SHARE :: 268435455
IDO_SHGIOI_SLOWFILE :: 4294967293
IDS_DESCRIPTION :: 1
idsAppName :: 1007
idsBadOldPW :: 1006
idsChangePW :: 1005
idsDefKeyword :: 1010
idsDifferentPW :: 1004
idsHelpFile :: 1009
idsIniFile :: 1001
idsIsPassword :: 1000
idsNoHelpMemory :: 1008
idsPassword :: 1003
idsScreenSaver :: 1002
IEI_PRIORITY_MAX :: 2147483647
IEI_PRIORITY_MIN :: 0
IEIFLAG_ASPECT :: 4
IEIFLAG_ASYNC :: 1
IEIFLAG_CACHE :: 2
IEIFLAG_GLEAM :: 16
IEIFLAG_NOBORDER :: 256
IEIFLAG_NOSTAMP :: 128
IEIFLAG_OFFLINE :: 8
IEIFLAG_ORIGSIZE :: 64
IEIFLAG_QUALITY :: 512
IEIFLAG_REFRESH :: 1024
IEIFLAG_SCREEN :: 32
IEIT_PRIORITY_NORMAL :: 268435456
ILMM_IE4 :: 0
IMM_ACC_DOCKING_E_DOCKOCCUPIED :: -2144927183
IMM_ACC_DOCKING_E_INSUFFICIENTHEIGHT :: -2144927184
IMSC_E_SHELL_COMPONENT_STARTUP_FAILURE :: -2144927181
INTERNET_MAX_PATH_LENGTH :: 2048
INTERNET_MAX_SCHEME_LENGTH :: 32
IRTIR_TASK_FINISHED :: 4
IRTIR_TASK_NOT_RUNNING :: 0
IRTIR_TASK_PENDING :: 3
IRTIR_TASK_RUNNING :: 1
IRTIR_TASK_SUSPENDED :: 2
IS_E_EXEC_FAILED :: -2147213310
IS_FULLSCREEN :: 2
IS_NORMAL :: 1
IS_SPLIT :: 4
ISFB_MASK_BKCOLOR :: 2
ISFB_MASK_COLORS :: 32
ISFB_MASK_IDLIST :: 16
ISFB_MASK_SHELLFOLDER :: 8
ISFB_MASK_STATE :: 1
ISFB_MASK_VIEWMODE :: 4
ISFB_STATE_ALLOWRENAME :: 2
ISFB_STATE_BTNMINSIZE :: 256
ISFB_STATE_CHANNELBAR :: 16
ISFB_STATE_DEBOSSED :: 1
ISFB_STATE_DEFAULT :: 0
ISFB_STATE_FULLOPEN :: 64
ISFB_STATE_NONAMESORT :: 128
ISFB_STATE_NOSHOWTEXT :: 4
ISFB_STATE_QLINKSMODE :: 32
ISFBVIEWMODE_LARGEICONS :: 2
ISFBVIEWMODE_LOGOS :: 3
ISFBVIEWMODE_SMALLICONS :: 1
ISHCUTCMDID_COMMITHISTORY :: 2
ISHCUTCMDID_DOWNLOADICON :: 0
ISHCUTCMDID_INTSHORTCUTCREATE :: 1
ISHCUTCMDID_SETUSERAWURL :: 3
ISIOI_ICONFILE :: 1
ISIOI_ICONINDEX :: 2
ItemCount_Property_GUID :: GUID{0xABBF5C45, 0x5CCC, 0x47B7, {0xBB, 0x4E, 0x87, 0xCB, 0x87, 0xBB, 0xD1, 0x62}}
ItemIndex_Property_GUID :: GUID{0x92A053DA, 0x2969, 0x4021, {0xBF, 0x27, 0x51, 0x4C, 0xFC, 0x2E, 0x4A, 0x69}}
ITSAT_DEFAULT_PRIORITY :: 268435456
ITSAT_MAX_PRIORITY :: 2147483647
ITSAT_MIN_PRIORITY :: 0
ITSS_THREAD_TIMEOUT_NO_CHANGE :: 4294967294
ITSSFLAG_COMPLETE_ON_DESTROY :: 0
ITSSFLAG_FLAGS_MASK :: 3
ITSSFLAG_KILL_ON_DESTROY :: 1
LIBRARY_E_NO_ACCESSIBLE_LOCATION :: -2144927231
LIBRARY_E_NO_SAVE_LOCATION :: -2144927232
LINK_E_DELETE :: -2144927485
MAX_COLUMN_DESC_LEN :: 128
MAX_COLUMN_NAME_LEN :: 80
MAX_SYNCMGR_ID :: 64
MAX_SYNCMGR_NAME :: 128
MAX_SYNCMGR_PROGRESSTEXT :: 260
MAX_SYNCMGRHANDLERNAME :: 32
MAX_SYNCMGRITEMNAME :: 128
MAXFILELEN :: 13
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ncm-displayerrortip ]]
NCM_DISPLAYERRORTIP :: 1028
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ncm-getaddress ]]
NCM_GETADDRESS :: 1025
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ncm-getallowtype ]]
NCM_GETALLOWTYPE :: 1027
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/ncm-setallowtype ]]
NCM_SETALLOWTYPE :: 1026
NETCACHE_E_NEGATIVE_CACHE :: -2144927488
NIN_BALLOONHIDE :: 1027
NIN_BALLOONSHOW :: 1026
NIN_BALLOONTIMEOUT :: 1028
NIN_BALLOONUSERCLICK :: 1029
NIN_POPUPCLOSE :: 1031
NIN_POPUPOPEN :: 1030
NIN_SELECT :: 1024
NINF_KEY :: 1
NOTIFYICON_VERSION :: 3
NOTIFYICON_VERSION_4 :: 4
NSTCDHPOS_ONTOP :: -1
NT_CONSOLE_PROPS_SIG :: 2684354562
NT_FE_CONSOLE_PROPS_SIG :: 2684354564
NUM_POINTS :: 3
OF_CAP_CANCLOSE :: 2
OF_CAP_CANSWITCHTO :: 1
OFASI_EDIT :: 1
OFASI_OPENDESKTOP :: 2
OFFLINE_STATUS_INCOMPLETE :: 4
OFFLINE_STATUS_LOCAL :: 1
OFFLINE_STATUS_REMOTE :: 2
OI_ASYNC :: 4294962926
OI_DEFAULT :: 0
OPENPROPS_INHIBITPIF :: 32768
OPENPROPS_NONE :: 0
PANE_NAVIGATION :: 5
PANE_NONE :: 4294967295
PANE_OFFLINE :: 2
PANE_PRINTER :: 3
PANE_PRIVACY :: 7
PANE_PROGRESS :: 6
PANE_SSL :: 4
PANE_ZONE :: 1
PATHCCH_MAX_CCH :: 32768
PDTIMER_PAUSE :: 2
PDTIMER_RESET :: 1
PDTIMER_RESUME :: 3
PID_COMPUTERNAME :: 5
PID_CONTROLPANEL_CATEGORY :: 2
PID_DESCRIPTIONID :: 2
PID_DISPLACED_DATE :: 3
PID_DISPLACED_FROM :: 2
PID_DISPLAY_PROPERTIES :: 0
PID_FINDDATA :: 0
PID_HTMLINFOTIPFILE :: 5
PID_INTROTEXT :: 1
PID_LINK_TARGET :: 2
PID_LINK_TARGET_TYPE :: 3
PID_MISC_ACCESSCOUNT :: 3
PID_MISC_OWNER :: 4
PID_MISC_PICS :: 6
PID_MISC_STATUS :: 2
PID_NETRESOURCE :: 1
PID_NETWORKLOCATION :: 4
PID_QUERY_RANK :: 2
PID_SHARE_CSC_STATUS :: 2
PID_SYNC_COPY_IN :: 2
PID_VOLUME_CAPACITY :: 3
PID_VOLUME_FILESYSTEM :: 4
PID_VOLUME_FREE :: 2
PID_WHICHFOLDER :: 3
PIDASI_AVG_DATA_RATE :: 4
PIDASI_CHANNEL_COUNT :: 7
PIDASI_COMPRESSION :: 10
PIDASI_FORMAT :: 2
PIDASI_SAMPLE_RATE :: 5
PIDASI_SAMPLE_SIZE :: 6
PIDASI_STREAM_NAME :: 9
PIDASI_STREAM_NUMBER :: 8
PIDASI_TIMELENGTH :: 3
PIDDRSI_DESCRIPTION :: 3
PIDDRSI_PLAYCOUNT :: 4
PIDDRSI_PLAYEXPIRES :: 6
PIDDRSI_PLAYSTARTS :: 5
PIDDRSI_PROTECTED :: 2
PIDSI_ALBUM :: 4
PIDSI_ARTIST :: 2
PIDSI_COMMENT :: 6
PIDSI_GENRE :: 11
PIDSI_LYRICS :: 12
PIDSI_SONGTITLE :: 3
PIDSI_TRACK :: 7
PIDSI_YEAR :: 5
PIDVSI_COMPRESSION :: 10
PIDVSI_DATA_RATE :: 8
PIDVSI_FRAME_COUNT :: 5
PIDVSI_FRAME_HEIGHT :: 4
PIDVSI_FRAME_RATE :: 6
PIDVSI_FRAME_WIDTH :: 3
PIDVSI_SAMPLE_SIZE :: 9
PIDVSI_STREAM_NAME :: 2
PIDVSI_STREAM_NUMBER :: 11
PIDVSI_TIMELENGTH :: 7
PIFDEFFILESIZE :: 80
PIFDEFPATHSIZE :: 64
PIFMAXFILEPATH :: 260
PIFNAMESIZE :: 30
PIFPARAMSSIZE :: 64
PIFSHDATASIZE :: 64
PIFSHPROGSIZE :: 64
PIFSTARTLOCSIZE :: 63
PLATFORM_BROWSERONLY :: 1
PLATFORM_IE3 :: 1
PLATFORM_INTEGRATED :: 2
PLATFORM_UNKNOWN :: 0
PMSF_DONT_STRIP_SPACES :: 65536
PMSF_MULTIPLE :: 1
PMSF_NORMAL :: 0
PO_DELETE :: 19
PO_PORTCHANGE :: 32
PO_REN_PORT :: 52
PO_RENAME :: 20
PPCF_ADDARGUMENTS :: 3
PPCF_ADDQUOTES :: 1
PPCF_FORCEQUALIFY :: 64
PPCF_LONGESTPOSSIBLE :: 128
PPCF_NODIRECTORIES :: 16
PRINT_PROP_FORCE_NAME :: 1
PRINTACTION_DOCUMENTDEFAULTS :: 6
PRINTACTION_NETINSTALL :: 2
PRINTACTION_NETINSTALLLINK :: 3
PRINTACTION_OPEN :: 0
PRINTACTION_OPENNETPRN :: 5
PRINTACTION_PROPERTIES :: 1
PRINTACTION_SERVERPROPERTIES :: 7
PRINTACTION_TESTPAGE :: 4
PROGDLG_AUTOTIME :: 2
PROGDLG_MARQUEEPROGRESS :: 32
PROGDLG_MODAL :: 1
PROGDLG_NOCANCEL :: 64
PROGDLG_NOMINIMIZE :: 8
PROGDLG_NOPROGRESSBAR :: 16
PROGDLG_NORMAL :: 0
PROGDLG_NOTIME :: 4
PROP_CONTRACT_DELEGATE :: "ContractDelegate"
PROPSTR_EXTENSIONCOMPLETIONSTATE :: "ExtensionCompletionState"
PSGUID_AUDIO :: GUID{0x64440490, 0x4C8B, 0x11D1, {0x8B, 0x70, 0x08, 0x00, 0x36, 0xB1, 0x1A, 0x03}}
PSGUID_BRIEFCASE :: GUID{0x328D8B21, 0x7729, 0x4BFC, {0x95, 0x4C, 0x90, 0x2B, 0x32, 0x9D, 0x56, 0xB0}}
PSGUID_CONTROLPANEL :: GUID{0x305CA226, 0xD286, 0x468E, {0xB8, 0x48, 0x2B, 0x2E, 0x8E, 0x69, 0x7B, 0x74}}
PSGUID_CUSTOMIMAGEPROPERTIES :: GUID{0x7ECD8B0E, 0xC136, 0x4A9B, {0x94, 0x11, 0x4E, 0xBD, 0x66, 0x73, 0xCC, 0xC3}}
PSGUID_DISPLACED :: GUID{0x9B174B33, 0x40FF, 0x11D2, {0xA2, 0x7E, 0x00, 0xC0, 0x4F, 0xC3, 0x08, 0x71}}
PSGUID_DOCUMENTSUMMARYINFORMATION :: GUID{0xD5CDD502, 0x2E9C, 0x101B, {0x93, 0x97, 0x08, 0x00, 0x2B, 0x2C, 0xF9, 0xAE}}
PSGUID_DRM :: GUID{0xAEAC19E4, 0x89AE, 0x4508, {0xB9, 0xB7, 0xBB, 0x86, 0x7A, 0xBE, 0xE2, 0xED}}
PSGUID_IMAGEPROPERTIES :: GUID{0x14B81DA1, 0x0135, 0x4D31, {0x96, 0xD9, 0x6C, 0xBF, 0xC9, 0x67, 0x1A, 0x99}}
PSGUID_IMAGESUMMARYINFORMATION :: GUID{0x6444048F, 0x4C8B, 0x11D1, {0x8B, 0x70, 0x08, 0x00, 0x36, 0xB1, 0x1A, 0x03}}
PSGUID_LIBRARYPROPERTIES :: GUID{0x5D76B67F, 0x9B3D, 0x44BB, {0xB6, 0xAE, 0x25, 0xDA, 0x4F, 0x63, 0x8A, 0x67}}
PSGUID_LINK :: GUID{0xB9B4B3FC, 0x2B51, 0x4A42, {0xB5, 0xD8, 0x32, 0x41, 0x46, 0xAF, 0xCF, 0x25}}
PSGUID_MEDIAFILESUMMARYINFORMATION :: GUID{0x64440492, 0x4C8B, 0x11D1, {0x8B, 0x70, 0x08, 0x00, 0x36, 0xB1, 0x1A, 0x03}}
PSGUID_MISC :: GUID{0x9B174B34, 0x40FF, 0x11D2, {0xA2, 0x7E, 0x00, 0xC0, 0x4F, 0xC3, 0x08, 0x71}}
PSGUID_MUSIC :: GUID{0x56A3372E, 0xCE9C, 0x11D2, {0x9F, 0x0E, 0x00, 0x60, 0x97, 0xC6, 0x86, 0xF6}}
PSGUID_QUERY_D :: GUID{0x49691C90, 0x7E17, 0x101A, {0xA9, 0x1C, 0x08, 0x00, 0x2B, 0x2E, 0xCD, 0xA9}}
PSGUID_SHARE :: GUID{0xD8C3986F, 0x813B, 0x449C, {0x84, 0x5D, 0x87, 0xB9, 0x5D, 0x67, 0x4A, 0xDE}}
PSGUID_SHELLDETAILS :: GUID{0x28636AA6, 0x953D, 0x11D2, {0xB5, 0xD6, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}
PSGUID_SUMMARYINFORMATION :: GUID{0xF29F85E0, 0x4FF9, 0x1068, {0xAB, 0x91, 0x08, 0x00, 0x2B, 0x27, 0xB3, 0xD9}}
PSGUID_VIDEO :: GUID{0x64440491, 0x4C8B, 0x11D1, {0x8B, 0x70, 0x08, 0x00, 0x36, 0xB1, 0x1A, 0x03}}
PSGUID_VOLUME :: GUID{0x9B174B35, 0x40FF, 0x11D2, {0xA2, 0x7E, 0x00, 0xC0, 0x4F, 0xC3, 0x08, 0x71}}
PSGUID_WEBVIEW :: GUID{0xF2275480, 0xF782, 0x4291, {0xBD, 0x94, 0xF1, 0x36, 0x93, 0x51, 0x3A, 0xEC}}
QCMINFO_PLACE_AFTER :: 1
QCMINFO_PLACE_BEFORE :: 0
S_SYNCMGR_CANCELALL :: 262660
S_SYNCMGR_CANCELITEM :: 262659
S_SYNCMGR_ENUMITEMS :: 262673
S_SYNCMGR_ITEMDELETED :: 262672
S_SYNCMGR_MISSINGITEMS :: 262657
S_SYNCMGR_RETRYSYNC :: 262658
SBSP_ABSOLUTE :: 0
SBSP_ACTIVATE_NOFOCUS :: 524288
SBSP_ALLOW_AUTONAVIGATE :: 65536
SBSP_CALLERUNTRUSTED :: 8388608
SBSP_CREATENOHISTORY :: 1048576
SBSP_DEFBROWSER :: 0
SBSP_DEFMODE :: 0
SBSP_EXPLOREMODE :: 32
SBSP_FEEDNAVIGATION :: 536870912
SBSP_HELPMODE :: 64
SBSP_INITIATEDBYHLINKFRAME :: 2147483648
SBSP_KEEPSAMETEMPLATE :: 131072
SBSP_KEEPWORDWHEELTEXT :: 262144
SBSP_NAVIGATEBACK :: 16384
SBSP_NAVIGATEFORWARD :: 32768
SBSP_NEWBROWSER :: 2
SBSP_NOAUTOSELECT :: 67108864
SBSP_NOTRANSFERHIST :: 128
SBSP_OPENMODE :: 16
SBSP_PARENT :: 8192
SBSP_PLAYNOSOUND :: 2097152
SBSP_REDIRECT :: 1073741824
SBSP_RELATIVE :: 4096
SBSP_SAMEBROWSER :: 1
SBSP_TRUSTEDFORACTIVEX :: 268435456
SBSP_TRUSTFIRSTDOWNLOAD :: 16777216
SBSP_UNTRUSTEDFORDOWNLOAD :: 33554432
SBSP_WRITENOHISTORY :: 134217728
SCHEME_CREATE :: 128
SCHEME_DISPLAY :: 1
SCHEME_DONOTUSE :: 64
SCHEME_EDIT :: 2
SCHEME_GLOBAL :: 8
SCHEME_LOCAL :: 4
SCHEME_REFRESH :: 16
SCHEME_UPDATE :: 32
SCRM_VERIFYPW :: 32768
SE_ERR_ACCESSDENIED :: 5
SE_ERR_ASSOCINCOMPLETE :: 27
SE_ERR_DDEBUSY :: 30
SE_ERR_DDEFAIL :: 29
SE_ERR_DDETIMEOUT :: 28
SE_ERR_DLLNOTFOUND :: 32
SE_ERR_FNF :: 2
SE_ERR_NOASSOC :: 31
SE_ERR_OOM :: 8
SE_ERR_PNF :: 3
SE_ERR_SHARE :: 26
SEE_MASK_ASYNCOK :: 1048576
SEE_MASK_CLASSKEY :: 3
SEE_MASK_CLASSNAME :: 1
SEE_MASK_CONNECTNETDRV :: 128
SEE_MASK_DEFAULT :: 0
SEE_MASK_DOENVSUBST :: 512
SEE_MASK_FLAG_DDEWAIT :: 256
SEE_MASK_FLAG_HINST_IS_SITE :: 134217728
SEE_MASK_FLAG_LOG_USAGE :: 67108864
SEE_MASK_FLAG_NO_UI :: 1024
SEE_MASK_HMONITOR :: 2097152
SEE_MASK_HOTKEY :: 32
SEE_MASK_ICON :: 16
SEE_MASK_IDLIST :: 4
SEE_MASK_INVOKEIDLIST :: 12
SEE_MASK_NO_CONSOLE :: 32768
SEE_MASK_NOASYNC :: 256
SEE_MASK_NOCLOSEPROCESS :: 64
SEE_MASK_NOQUERYCLASSSTORE :: 16777216
SEE_MASK_NOZONECHECKS :: 8388608
SEE_MASK_UNICODE :: 16384
SEE_MASK_WAITFORINPUTIDLE :: 33554432
SelectedItemCount_Property_GUID :: GUID{0x8FE316D2, 0x0E52, 0x460A, {0x9C, 0x1E, 0x48, 0xF2, 0x73, 0xD4, 0x70, 0xA3}}
SETPROPS_NONE :: 0
SFBID_PIDLCHANGED :: 0
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/sfvm-addobject ]]
SFVM_ADDOBJECT :: 3
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/sfvm-getselectedobjects ]]
SFVM_GETSELECTEDOBJECTS :: 9
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/sfvm-rearrange ]]
SFVM_REARRANGE :: 1
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/sfvm-removeobject ]]
SFVM_REMOVEOBJECT :: 6
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/sfvm-setclipboard ]]
SFVM_SETCLIPBOARD :: 16
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/sfvm-setitempos ]]
SFVM_SETITEMPOS :: 14
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/sfvm-setpoints ]]
SFVM_SETPOINTS :: 23
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/sfvm-updateobject ]]
SFVM_UPDATEOBJECT :: 7
SFVSOC_INVALIDATE_ALL :: 1
SFVSOC_NOSCROLL :: 2
SHC_E_SHELL_COMPONENT_STARTUP_FAILURE :: -2144927180
SHCDF_UPDATEITEM :: 1
SHCIDS_ALLFIELDS :: -2147483648
SHCIDS_BITMASK :: -65536
SHCIDS_CANONICALONLY :: 268435456
SHCIDS_COLUMNMASK :: 65535
SHCNEE_MSI_CHANGE :: 4
SHCNEE_MSI_UNINSTALL :: 5
SHCNEE_ORDERCHANGED :: 2
SHELL_E_WRONG_BITDEPTH :: -2144927486
SHELLSTATEVERSION_IE4 :: 9
SHELLSTATEVERSION_WIN2K :: 10
SHERB_NOCONFIRMATION :: 1
SHERB_NOPROGRESSUI :: 2
SHERB_NOSOUND :: 4
SHGNLI_NOLNK :: 8
SHGNLI_NOLOCNAME :: 16
SHGNLI_NOUNIQUE :: 4
SHGNLI_PIDL :: 1
SHGNLI_PREFIXNAME :: 2
SHGNLI_USEURLEXT :: 32
SHGVSPB_ALLFOLDERS :: 8
SHGVSPB_ALLUSERS :: 2
SHGVSPB_INHERIT :: 16
SHGVSPB_NOAUTODEFAULTS :: 2147483648
SHGVSPB_PERFOLDER :: 4
SHGVSPB_PERUSER :: 1
SHGVSPB_ROAM :: 32
SHHLNF_NOAUTOSELECT :: 67108864
SHHLNF_WRITENOHISTORY :: 134217728
SHIL_EXTRALARGE :: 2
SHIL_JUMBO :: 4
SHIL_LARGE :: 0
SHIL_LAST :: 4
SHIL_SMALL :: 1
SHIL_SYSSMALL :: 3
SHIMGDEC_DEFAULT :: 0
SHIMGDEC_LOADFULL :: 2
SHIMGDEC_THUMBNAIL :: 1
SHIMGKEY_QUALITY :: "Compression"
SHIMGKEY_RAWFORMAT :: "RawDataFormat"
SHIMSTCAPFLAG_LOCKABLE :: 1
SHIMSTCAPFLAG_PURGEABLE :: 2
SHPPFW_ASKDIRCREATE :: 2
SHPPFW_DIRCREATE :: 1
SHPPFW_IGNOREFILENAME :: 4
SHPPFW_MEDIACHECKONLY :: 16
SHPPFW_NONE :: 0
SHPPFW_NOWRITECHECK :: 8
SHPWHF_ANYLOCATION :: 256
SHPWHF_NOFILESELECTOR :: 4
SHPWHF_NONETPLACECREATE :: 2
SHPWHF_NORECOMPRESS :: 1
SHPWHF_USEMRU :: 8
SHPWHF_VALIDATEVIAWEBFOLDERS :: 65536
SHREGSET_FORCE_HKCU :: 2
SHREGSET_FORCE_HKLM :: 8
SHREGSET_HKCU :: 1
SHREGSET_HKLM :: 4
SID_CommandsPropertyBag :: GUID{0x6E043250, 0x4416, 0x485C, {0xB1, 0x43, 0xE6, 0x2A, 0x76, 0x0D, 0x9F, 0xE5}}
SID_CtxQueryAssociations :: GUID{0xFAADFC40, 0xB777, 0x4B69, {0xAA, 0x81, 0x77, 0x03, 0x5E, 0xF0, 0xE6, 0xE8}}
SID_DefView :: GUID{0x6D12FE80, 0x7911, 0x11CF, {0x95, 0x34, 0x00, 0x00, 0xC0, 0x5B, 0xAE, 0x0B}}
SID_LaunchSourceAppUserModelId :: GUID{0x2CE78010, 0x74DB, 0x48BC, {0x9C, 0x6A, 0x10, 0xF3, 0x72, 0x49, 0x57, 0x23}}
SID_LaunchSourceViewSizePreference :: GUID{0x80605492, 0x67D9, 0x414F, {0xAF, 0x89, 0xA1, 0xCD, 0xF1, 0x24, 0x2B, 0xC1}}
SID_LaunchTargetViewSizePreference :: GUID{0x26DB2472, 0xB7B7, 0x406B, {0x97, 0x02, 0x73, 0x0A, 0x4E, 0x20, 0xD3, 0xBF}}
SID_MenuShellFolder :: GUID{0xA6C17EB4, 0x2D65, 0x11D2, {0x83, 0x8F, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}
SID_SCommandBarState :: GUID{0xB99EAA5C, 0x3850, 0x4400, {0xBC, 0x33, 0x2C, 0xE5, 0x34, 0x04, 0x8B, 0xF8}}
SID_SCommDlgBrowser :: GUID{0x80F30233, 0xB7DF, 0x11D2, {0xA3, 0x3B, 0x00, 0x60, 0x97, 0xDF, 0x5B, 0xD4}}
SID_SGetViewFromViewDual :: GUID{0x889A935D, 0x971E, 0x4B12, {0xB9, 0x0C, 0x24, 0xDF, 0xC9, 0xE1, 0xE5, 0xE8}}
SID_ShellExecuteNamedPropertyStore :: GUID{0xEB84ADA2, 0x00FF, 0x4992, {0x83, 0x24, 0xED, 0x5C, 0xE0, 0x61, 0xCB, 0x29}}
SID_SInPlaceBrowser :: GUID{0x1D2AE02B, 0x3655, 0x46CC, {0xB6, 0x3A, 0x28, 0x59, 0x88, 0x15, 0x3B, 0xCA}}
SID_SMenuBandBKContextMenu :: GUID{0x164BBD86, 0x1D0D, 0x4DE0, {0x9A, 0x3B, 0xD9, 0x72, 0x96, 0x47, 0xC2, 0xB8}}
SID_SMenuBandBottom :: GUID{0x743CA664, 0x0DEB, 0x11D1, {0x98, 0x25, 0x00, 0xC0, 0x4F, 0xD9, 0x19, 0x72}}
SID_SMenuBandBottomSelected :: GUID{0x165EBAF4, 0x6D51, 0x11D2, {0x83, 0xAD, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}
SID_SMenuBandChild :: GUID{0xED9CC020, 0x08B9, 0x11D1, {0x98, 0x23, 0x00, 0xC0, 0x4F, 0xD9, 0x19, 0x72}}
SID_SMenuBandContextMenuModifier :: GUID{0x39545874, 0x7162, 0x465E, {0xB7, 0x83, 0x2A, 0xA1, 0x87, 0x4F, 0xEF, 0x81}}
SID_SMenuBandParent :: GUID{0x8C278EEC, 0x3EAB, 0x11D1, {0x8C, 0xB0, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xD0}}
SID_SMenuBandTop :: GUID{0x9493A810, 0xEC38, 0x11D0, {0xBC, 0x46, 0x00, 0xAA, 0x00, 0x6C, 0xE2, 0xF5}}
SID_SMenuPopup :: GUID{0xD1E7AFEB, 0x6A2E, 0x11D0, {0x8C, 0x78, 0x00, 0xC0, 0x4F, 0xD9, 0x18, 0xB4}}
SID_SSearchBoxInfo :: GUID{0x142DAA61, 0x516B, 0x4713, {0xB4, 0x9C, 0xFB, 0x98, 0x5E, 0xF8, 0x29, 0x98}}
SID_STopLevelBrowser :: GUID{0x4C96BE40, 0x915C, 0x11CF, {0x99, 0xD3, 0x00, 0xAA, 0x00, 0x4A, 0xE8, 0x37}}
SID_STopWindow :: GUID{0x49E1B500, 0x4636, 0x11D3, {0x97, 0xF7, 0x00, 0xC0, 0x4F, 0x45, 0xD0, 0xB3}}
SID_URLExecutionContext :: GUID{0xFB5F8EBC, 0xBBB6, 0x4D10, {0xA4, 0x61, 0x77, 0x72, 0x91, 0xA0, 0x90, 0x30}}
SIOM_ICONINDEX :: 2
SIOM_OVERLAYINDEX :: 1
SIOM_RESERVED_DEFAULT :: 3
SIOM_RESERVED_LINK :: 1
SIOM_RESERVED_SHARED :: 0
SIOM_RESERVED_SLOWFILE :: 2
SMAE_CONTRACTED :: 2
SMAE_EXPANDED :: 1
SMAE_USER :: 4
SMAE_VALID :: 7
SMC_AUTOEXPANDCHANGE :: 66
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-chevronexpand ]]
SMC_CHEVRONEXPAND :: 25
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-chevrongettip ]]
SMC_CHEVRONGETTIP :: 47
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-create ]]
SMC_CREATE :: 2
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-defaulticon ]]
SMC_DEFAULTICON :: 22
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-demote ]]
SMC_DEMOTE :: 17
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-displaychevrontip ]]
SMC_DISPLAYCHEVRONTIP :: 42
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-exitmenu ]]
SMC_EXITMENU :: 3
SMC_GETAUTOEXPANDSTATE :: 65
SMC_GETBKCONTEXTMENU :: 68
SMC_GETCONTEXTMENUMODIFIER :: 67
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-getinfo ]]
SMC_GETINFO :: 5
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-getobject ]]
SMC_GETOBJECT :: 7
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-getsfinfo ]]
SMC_GETSFINFO :: 6
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-getsfobject ]]
SMC_GETSFOBJECT :: 8
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-initmenu ]]
SMC_INITMENU :: 1
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-newitem ]]
SMC_NEWITEM :: 23
SMC_OPEN :: 69
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-promote ]]
SMC_PROMOTE :: 18
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-refresh ]]
SMC_REFRESH :: 16
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-setsfobject ]]
SMC_SETSFOBJECT :: 45
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-sfddrestricted ]]
SMC_SFDDRESTRICTED :: 48
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-sfexec ]]
SMC_SFEXEC :: 9
SMC_SFEXEC_MIDDLE :: 49
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-sfselectitem ]]
SMC_SFSELECTITEM :: 10
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/smc-shchangenotify ]]
SMC_SHCHANGENOTIFY :: 46
SMDM_HMENU :: 2
SMDM_SHELLFOLDER :: 1
SMDM_TOOLBAR :: 4
SMINIT_AUTOEXPAND :: 256
SMINIT_AUTOTOOLTIP :: 512
SMINIT_CACHED :: 16
SMINIT_DEFAULT :: 0
SMINIT_DROPONCONTAINER :: 1024
SMINIT_HORIZONTAL :: 536870912
SMINIT_RESTRICT_DRAGDROP :: 2
SMINIT_TOPLEVEL :: 4
SMINIT_VERTICAL :: 268435456
SMINV_ID :: 8
SMINV_REFRESH :: 1
SMSET_BOTTOM :: 536870912
SMSET_DONTOWN :: 1
SMSET_TOP :: 268435456
SPMODE_BROWSER :: 8
SPMODE_DBMON :: 8192
SPMODE_DEBUGBREAK :: 512
SPMODE_DEBUGOUT :: 2
SPMODE_EVENT :: 32
SPMODE_EVENTTRACE :: 32768
SPMODE_FLUSH :: 16
SPMODE_FORMATTEXT :: 128
SPMODE_MEMWATCH :: 4096
SPMODE_MSGTRACE :: 1024
SPMODE_MSVM :: 64
SPMODE_MULTISTOP :: 16384
SPMODE_PERFTAGS :: 2048
SPMODE_PROFILE :: 256
SPMODE_SHELL :: 1
SPMODE_TEST :: 4
SRRF_NOEXPAND :: 268435456
SRRF_NOVIRT :: 1073741824
SRRF_RM_ANY :: 0
SRRF_RM_NORMAL :: 65536
SRRF_RM_SAFE :: 131072
SRRF_RM_SAFENETWORK :: 262144
SRRF_RT_ANY :: 65535
SRRF_RT_REG_BINARY :: 8
SRRF_RT_REG_DWORD :: 16
SRRF_RT_REG_EXPAND_SZ :: 4
SRRF_RT_REG_MULTI_SZ :: 32
SRRF_RT_REG_NONE :: 1
SRRF_RT_REG_QWORD :: 64
SRRF_RT_REG_SZ :: 2
SRRF_ZEROONFAILURE :: 536870912
SSM_CLEAR :: 0
SSM_REFRESH :: 2
SSM_SET :: 1
SSM_UPDATE :: 4
STIF_DEFAULT :: 0
STIF_SUPPORT_HEX :: 1
STORE_E_NEWER_VERSION_AVAILABLE :: -2144927484
STR_AVOID_DRIVE_RESTRICTION_POLICY :: "Avoid Drive Restriction Policy"
STR_BIND_DELEGATE_CREATE_OBJECT :: "Delegate Object Creation"
STR_BIND_FOLDER_ENUM_MODE :: "Folder Enum Mode"
STR_BIND_FOLDERS_READ_ONLY :: "Folders As Read Only"
STR_BIND_FORCE_FOLDER_SHORTCUT_RESOLVE :: "Force Folder Shortcut Resolve"
STR_DONT_PARSE_RELATIVE :: "Don't Parse Relative"
STR_DONT_RESOLVE_LINK :: "Don't Resolve Link"
STR_ENUM_ITEMS_FLAGS :: "SHCONTF"
STR_FILE_SYS_BIND_DATA :: "File System Bind Data"
STR_FILE_SYS_BIND_DATA_WIN7_FORMAT :: "Win7FileSystemIdList"
STR_GET_ASYNC_HANDLER :: "GetAsyncHandler"
STR_GPS_BESTEFFORT :: "GPS_BESTEFFORT"
STR_GPS_DELAYCREATION :: "GPS_DELAYCREATION"
STR_GPS_FASTPROPERTIESONLY :: "GPS_FASTPROPERTIESONLY"
STR_GPS_HANDLERPROPERTIESONLY :: "GPS_HANDLERPROPERTIESONLY"
STR_GPS_NO_OPLOCK :: "GPS_NO_OPLOCK"
STR_GPS_OPENSLOWITEM :: "GPS_OPENSLOWITEM"
STR_INTERNAL_NAVIGATE :: "Internal Navigation"
STR_INTERNETFOLDER_PARSE_ONLY_URLMON_BINDABLE :: "Validate URL"
STR_ITEM_CACHE_CONTEXT :: "ItemCacheContext"
STR_MYDOCS_CLSID :: "{450D8FBA-AD25-11D0-98A8-0800361B1103}"
STR_NO_VALIDATE_FILENAME_CHARS :: "NoValidateFilenameChars"
STR_PARSE_ALLOW_INTERNET_SHELL_FOLDERS ::
	"Allow binding to Internet shell folder handlers and negate STR_PARSE_PREFER_WEB_BROWSING"
STR_PARSE_AND_CREATE_ITEM :: "ParseAndCreateItem"
STR_PARSE_DONT_REQUIRE_VALIDATED_URLS :: "Do not require validated URLs"
STR_PARSE_EXPLICIT_ASSOCIATION_SUCCESSFUL :: "ExplicitAssociationSuccessful"
STR_PARSE_PARTIAL_IDLIST :: "ParseOriginalItem"
STR_PARSE_PREFER_FOLDER_BROWSING :: "Parse Prefer Folder Browsing"
STR_PARSE_PREFER_WEB_BROWSING :: "Do not bind to Internet shell folder handlers"
STR_PARSE_PROPERTYSTORE :: "DelegateNamedProperties"
STR_PARSE_SHELL_PROTOCOL_TO_FILE_OBJECTS :: "Parse Shell Protocol To File Objects"
STR_PARSE_SHOW_NET_DIAGNOSTICS_UI :: "Show network diagnostics UI"
STR_PARSE_SKIP_NET_CACHE :: "Skip Net Resource Cache"
STR_PARSE_TRANSLATE_ALIASES :: "Parse Translate Aliases"
STR_PARSE_WITH_EXPLICIT_ASSOCAPP :: "ExplicitAssociationApp"
STR_PARSE_WITH_EXPLICIT_PROGID :: "ExplicitProgid"
STR_PARSE_WITH_PROPERTIES :: "ParseWithProperties"
STR_PROPERTYBAG_PARAM :: "SHBindCtxPropertyBag"
STR_REFERRER_IDENTIFIER :: "Referrer Identifier"
STR_SKIP_BINDING_CLSID :: "Skip Binding CLSID"
STR_STORAGEITEM_CREATION_FLAGS :: "SHGETSTORAGEITEM"
STR_TAB_REUSE_IDENTIFIER :: "Tab Reuse Identifier"
STR_TRACK_CLSID :: "Track the CLSID"
SYNCMGR_OBJECTID_BrowseContent :: GUID{0x57CBB584, 0xE9B4, 0x47AE, {0xA1, 0x20, 0xC4, 0xDF, 0x33, 0x35, 0xDE, 0xE2}}
SYNCMGR_OBJECTID_ConflictStore :: GUID{0xD78181F4, 0x2389, 0x47E4, {0xA9, 0x60, 0x60, 0xBC, 0xC2, 0xED, 0x93, 0x0B}}
SYNCMGR_OBJECTID_EventLinkClick :: GUID{0x2203BDC1, 0x1AF1, 0x4082, {0x8C, 0x30, 0x28, 0x39, 0x9F, 0x41, 0x38, 0x4C}}
SYNCMGR_OBJECTID_EventStore :: GUID{0x4BEF34B9, 0xA786, 0x4075, {0xBA, 0x88, 0x0C, 0x2B, 0x9D, 0x89, 0xA9, 0x8F}}
SYNCMGR_OBJECTID_Icon :: GUID{0x6DBC85C3, 0x5D07, 0x4C72, {0xA7, 0x77, 0x7F, 0xEC, 0x78, 0x07, 0x2C, 0x06}}
SYNCMGR_OBJECTID_QueryBeforeActivate :: GUID{0xD882D80B, 0xE7AA, 0x49ED, {0x86, 0xB7, 0xE6, 0xE1, 0xF7, 0x14, 0xCD, 0xFE}}
SYNCMGR_OBJECTID_QueryBeforeDeactivate :: GUID{0xA0EFC282, 0x60E0, 0x460E, {0x93, 0x74, 0xEA, 0x88, 0x51, 0x3C, 0xFC, 0x80}}
SYNCMGR_OBJECTID_QueryBeforeDelete :: GUID{0xF76C3397, 0xAFB3, 0x45D7, {0xA5, 0x9F, 0x5A, 0x49, 0xE9, 0x05, 0x43, 0x7E}}
SYNCMGR_OBJECTID_QueryBeforeDisable :: GUID{0xBB5F64AA, 0xF004, 0x4EB5, {0x8E, 0x4D, 0x26, 0x75, 0x19, 0x66, 0x34, 0x4C}}
SYNCMGR_OBJECTID_QueryBeforeEnable :: GUID{0x04CBF7F0, 0x5BEB, 0x4DE1, {0xBC, 0x90, 0x90, 0x83, 0x45, 0xC4, 0x80, 0xF6}}
SYNCMGR_OBJECTID_ShowSchedule :: GUID{0xEDC6F3E3, 0x8441, 0x4109, {0xAD, 0xF3, 0x6C, 0x1C, 0xA0, 0xB7, 0xDE, 0x47}}
SYNCMGRHANDLERFLAG_MASK :: 15
SYNCMGRITEM_ITEMFLAGMASK :: 127
SYNCMGRLOGERROR_ERRORFLAGS :: 1
SYNCMGRLOGERROR_ERRORID :: 2
SYNCMGRLOGERROR_ITEMID :: 4
SYNCMGRPROGRESSITEM_MAXVALUE :: 8
SYNCMGRPROGRESSITEM_PROGVALUE :: 4
SYNCMGRPROGRESSITEM_STATUSTEXT :: 1
SYNCMGRPROGRESSITEM_STATUSTYPE :: 2
SYNCMGRREGISTERFLAGS_MASK :: 7
SZ_CONTENTTYPE_CDF :: "application/x-cdf"
SZ_CONTENTTYPE_CDFA :: "application/x-cdf"
SZ_CONTENTTYPE_CDFW :: "application/x-cdf"
SZ_CONTENTTYPE_HTML :: "text/html"
SZ_CONTENTTYPE_HTMLA :: "text/html"
SZ_CONTENTTYPE_HTMLW :: "text/html"
TBIF_APPEND :: 0
TBIF_DEFAULT :: 0
TBIF_INTERNETBAR :: 65536
TBIF_NOTOOLBAR :: 196608
TBIF_PREPEND :: 1
TBIF_REPLACE :: 2
TBIF_STANDARDTOOLBAR :: 131072
THBN_CLICKED :: 6144
TITLEBARNAMELEN :: 40
TLMENUF_BACK :: 16
TLMENUF_FORE :: 32
TLMENUF_INCLUDECURRENT :: 1
TLOG_BACK :: -1
TLOG_CURRENT :: 0
TLOG_FORE :: 1
URL_APPLY_DEFAULT :: 1
URL_APPLY_FORCEAPPLY :: 8
URL_APPLY_GUESSFILE :: 4
URL_APPLY_GUESSSCHEME :: 2
URL_BROWSER_MODE :: 33554432
URL_CONVERT_IF_DOSPATH :: 2097152
URL_DONT_ESCAPE_EXTRA_INFO :: 33554432
URL_DONT_SIMPLIFY :: 134217728
URL_DONT_UNESCAPE :: 131072
URL_DONT_UNESCAPE_EXTRA_INFO :: 33554432
URL_E_INVALID_SYNTAX :: -2147217407
URL_E_UNREGISTERED_PROTOCOL :: -2147217406
URL_ESCAPE_AS_UTF8 :: 262144
URL_ESCAPE_ASCII_URI_COMPONENT :: 524288
URL_ESCAPE_PERCENT :: 4096
URL_ESCAPE_SEGMENT_ONLY :: 8192
URL_ESCAPE_SPACES_ONLY :: 67108864
URL_ESCAPE_UNSAFE :: 536870912
URL_FILE_USE_PATHURL :: 65536
URL_INTERNAL_PATH :: 8388608
URL_NO_META :: 134217728
URL_PARTFLAG_KEEPSCHEME :: 1
URL_PLUGGABLE_PROTOCOL :: 1073741824
URL_UNESCAPE :: 268435456
URL_UNESCAPE_AS_UTF8 :: 262144
URL_UNESCAPE_HIGH_ANSI_ONLY :: 4194304
URL_UNESCAPE_INPLACE :: 1048576
URL_UNESCAPE_URI_COMPONENT :: 262144
URL_WININET_COMPATIBILITY :: 2147483648
VID_Content :: GUID{0x30C2C434, 0x0889, 0x4C8D, {0x98, 0x5D, 0xA9, 0xF7, 0x18, 0x30, 0xB0, 0xA9}}
VID_Details :: GUID{0x137E7700, 0x3573, 0x11CF, {0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62}}
VID_LargeIcons :: GUID{0x0057D0E0, 0x3573, 0x11CF, {0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62}}
VID_List :: GUID{0x0E1FA5E0, 0x3573, 0x11CF, {0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62}}
VID_SmallIcons :: GUID{0x089000C0, 0x3573, 0x11CF, {0xAE, 0x69, 0x08, 0x00, 0x2B, 0x2E, 0x12, 0x62}}
VID_Thumbnails :: GUID{0x8BEBB290, 0x52D0, 0x11D0, {0xB7, 0xF4, 0x00, 0xC0, 0x4F, 0xD7, 0x06, 0xEC}}
VID_ThumbStrip :: GUID{0x8EEFA624, 0xD1E9, 0x445B, {0x94, 0xB7, 0x74, 0xFB, 0xCE, 0x2E, 0xA1, 0x1A}}
VID_Tile :: GUID{0x65F125E5, 0x7BE1, 0x4810, {0xBA, 0x9D, 0xD2, 0x71, 0xC8, 0x43, 0x2C, 0xE3}}
VIEW_PRIORITY_CACHEHIT :: 80
VIEW_PRIORITY_CACHEMISS :: 48
VIEW_PRIORITY_DESPERATE :: 16
VIEW_PRIORITY_INHERIT :: 32
VIEW_PRIORITY_NONE :: 0
VIEW_PRIORITY_RESTRICTED :: 112
VIEW_PRIORITY_SHELLEXT :: 64
VIEW_PRIORITY_SHELLEXT_ASBACKUP :: 21
VIEW_PRIORITY_STALECACHEHIT :: 69
VIEW_PRIORITY_USEASDEFAULT :: 67
VOLUME_PREFIX :: "\\\\?\\Volume"
WC_NETADDRESS :: "msctls_netaddress"
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/wm-cpl-launch ]]
WM_CPL_LAUNCH :: 2024
// [[ Documentation; https://learn.microsoft.com/windows/win32/shell/wm-cpl-launched ]]
WM_CPL_LAUNCHED :: 2025
WPSTYLE_CENTER :: 0
WPSTYLE_CROPTOFIT :: 4
WPSTYLE_KEEPASPECT :: 3
WPSTYLE_MAX :: 6
WPSTYLE_SPAN :: 5
WPSTYLE_STRETCH :: 2
WPSTYLE_TILE :: 1
WTS_E_DATAFILEUNAVAILABLE :: -2147175932
WTS_E_EXTRACTIONBLOCKED :: -2147175930
WTS_E_EXTRACTIONPENDING :: -2147175931
WTS_E_EXTRACTIONTIMEDOUT :: -2147175935
WTS_E_FAILEDEXTRACTION :: -2147175936
WTS_E_FASTEXTRACTIONNOTSUPPORTED :: -2147175933
WTS_E_NOSTORAGEPROVIDERTHUMBNAILHANDLER :: -2147175929
WTS_E_SURROGATEUNAVAILABLE :: -2147175934

