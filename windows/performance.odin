package windows

foreign import advapi32 "system:advapi32.lib"
foreign import kernel32 "system:kernel32.lib"
foreign import loadperf "system:loadperf.lib"
foreign import pdh "system:pdh.lib"

@(default_calling_convention="system")
foreign advapi32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfaddcounters ]]
	PerfAddCounters :: proc(hQuery: HANDLE, pCounters: ^PERF_COUNTER_IDENTIFIER, cbCounters: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfclosequeryhandle ]]
	PerfCloseQueryHandle :: proc(hQuery: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfcreateinstance ]]
	PerfCreateInstance :: proc(
		ProviderHandle: HANDLE,
		#by_ptr CounterSetGuid: GUID,
		Name: PWSTR,
		Id: u32,
	) -> ^PERF_COUNTERSET_INSTANCE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfdecrementulongcountervalue ]]
	PerfDecrementULongCounterValue :: proc(
		Provider: HANDLE,
		Instance: ^PERF_COUNTERSET_INSTANCE,
		CounterId: u32,
		Value: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfdecrementulonglongcountervalue ]]
	PerfDecrementULongLongCounterValue :: proc(
		Provider: HANDLE,
		Instance: ^PERF_COUNTERSET_INSTANCE,
		CounterId: u32,
		Value: u64,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfdeletecounters ]]
	PerfDeleteCounters :: proc(hQuery: HANDLE, pCounters: ^PERF_COUNTER_IDENTIFIER, cbCounters: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfdeleteinstance ]]
	PerfDeleteInstance :: proc(Provider: HANDLE, InstanceBlock: ^PERF_COUNTERSET_INSTANCE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfenumeratecounterset ]]
	PerfEnumerateCounterSet :: proc(
		szMachine: PWSTR,
		pCounterSetIds: [^]GUID,
		cCounterSetIds: u32,
		pcCounterSetIdsActual: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfenumeratecountersetinstances ]]
	PerfEnumerateCounterSetInstances :: proc(
		szMachine: PWSTR,
		#by_ptr pCounterSetId: GUID,
		pInstances: ^PERF_INSTANCE_HEADER,
		cbInstances: u32,
		pcbInstancesActual: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfincrementulongcountervalue ]]
	PerfIncrementULongCounterValue :: proc(
		Provider: HANDLE,
		Instance: ^PERF_COUNTERSET_INSTANCE,
		CounterId: u32,
		Value: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfincrementulonglongcountervalue ]]
	PerfIncrementULongLongCounterValue :: proc(
		Provider: HANDLE,
		Instance: ^PERF_COUNTERSET_INSTANCE,
		CounterId: u32,
		Value: u64,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfopenqueryhandle ]]
	PerfOpenQueryHandle :: proc(szMachine: PWSTR, phQuery: ^HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfquerycounterdata ]]
	PerfQueryCounterData :: proc(
		hQuery: HANDLE,
		pCounterBlock: ^PERF_DATA_HEADER,
		cbCounterBlock: u32,
		pcbCounterBlockActual: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfquerycounterinfo ]]
	PerfQueryCounterInfo :: proc(
		hQuery: HANDLE,
		pCounters: ^PERF_COUNTER_IDENTIFIER,
		cbCounters: u32,
		pcbCountersActual: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfquerycountersetregistrationinfo ]]
	PerfQueryCounterSetRegistrationInfo :: proc(
		szMachine: PWSTR,
		#by_ptr pCounterSetId: GUID,
		requestCode: PerfRegInfoType,
		requestLangId: u32,
		pbRegInfo: ^u8,
		cbRegInfo: u32,
		pcbRegInfoActual: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfqueryinstance ]]
	PerfQueryInstance :: proc(
		ProviderHandle: HANDLE,
		#by_ptr CounterSetGuid: GUID,
		Name: PWSTR,
		Id: u32,
	) -> ^PERF_COUNTERSET_INSTANCE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfsetcounterrefvalue ]]
	PerfSetCounterRefValue :: proc(
		Provider: HANDLE,
		Instance: ^PERF_COUNTERSET_INSTANCE,
		CounterId: u32,
		Address: rawptr,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfsetcountersetinfo ]]
	PerfSetCounterSetInfo :: proc(ProviderHandle: HANDLE, Template: ^PERF_COUNTERSET_INFO, TemplateSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfsetulongcountervalue ]]
	PerfSetULongCounterValue :: proc(
		Provider: HANDLE,
		Instance: ^PERF_COUNTERSET_INSTANCE,
		CounterId: u32,
		Value: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfsetulonglongcountervalue ]]
	PerfSetULongLongCounterValue :: proc(
		Provider: HANDLE,
		Instance: ^PERF_COUNTERSET_INSTANCE,
		CounterId: u32,
		Value: u64,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfstartprovider ]]
	PerfStartProvider :: proc(ProviderGuid: ^GUID, ControlCallback: PERFLIBREQUEST, phProvider: ^HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfstartproviderex ]]
	PerfStartProviderEx :: proc(
		ProviderGuid: ^GUID,
		ProviderContext: ^PERF_PROVIDER_CONTEXT,
		Provider: ^HANDLE,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/nf-perflib-perfstopprovider ]]
	PerfStopProvider :: proc(ProviderHandle: HANDLE) -> u32 ---
}

@(default_calling_convention="system")
foreign kernel32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/profileapi/nf-profileapi-queryperformancecounter ]]
	QueryPerformanceCounter :: proc(lpPerformanceCount: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/profileapi/nf-profileapi-queryperformancefrequency ]]
	QueryPerformanceFrequency :: proc(lpFrequency: ^i64) -> BOOL ---
}

@(default_calling_convention="system")
foreign loadperf {
	BackupPerfRegistryToFileW :: proc(szFileName: PWSTR, szCommentString: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/loadperf/nf-loadperf-installperfdlla ]]
	InstallPerfDllA :: proc(szComputerName: PSTR, lpIniFile: PSTR, dwFlags: uintptr) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/loadperf/nf-loadperf-installperfdllw ]]
	InstallPerfDllW :: proc(szComputerName: PWSTR, lpIniFile: PWSTR, dwFlags: uintptr) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/loadperf/nf-loadperf-loadperfcountertextstringsa ]]
	LoadPerfCounterTextStringsA :: proc(lpCommandLine: PSTR, bQuietModeArg: BOOL) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/loadperf/nf-loadperf-loadperfcountertextstringsw ]]
	LoadPerfCounterTextStringsW :: proc(lpCommandLine: PWSTR, bQuietModeArg: BOOL) -> u32 ---

	RestorePerfRegistryFromFileW :: proc(szFileName: PWSTR, szLangId: PWSTR) -> u32 ---

	SetServiceAsTrustedA :: proc(szReserved: PSTR, szServiceName: PSTR) -> u32 ---

	SetServiceAsTrustedW :: proc(szReserved: PWSTR, szServiceName: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/loadperf/nf-loadperf-unloadperfcountertextstringsa ]]
	UnloadPerfCounterTextStringsA :: proc(lpCommandLine: PSTR, bQuietModeArg: BOOL) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/loadperf/nf-loadperf-unloadperfcountertextstringsw ]]
	UnloadPerfCounterTextStringsW :: proc(lpCommandLine: PWSTR, bQuietModeArg: BOOL) -> u32 ---

	UpdatePerfNameFilesA :: proc(
		szNewCtrFilePath: PSTR,
		szNewHlpFilePath: PSTR,
		szLanguageID: PSTR,
		dwFlags: uintptr,
	) -> u32 ---

	UpdatePerfNameFilesW :: proc(
		szNewCtrFilePath: PWSTR,
		szNewHlpFilePath: PWSTR,
		szLanguageID: PWSTR,
		dwFlags: uintptr,
	) -> u32 ---
}

@(default_calling_convention="system")
foreign pdh {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhaddcountera ]]
	PdhAddCounterA :: proc(
		hQuery: PDH_HQUERY,
		szFullCounterPath: PSTR,
		dwUserData: uintptr,
		phCounter: ^PDH_HCOUNTER,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhaddcounterw ]]
	PdhAddCounterW :: proc(
		hQuery: PDH_HQUERY,
		szFullCounterPath: PWSTR,
		dwUserData: uintptr,
		phCounter: ^PDH_HCOUNTER,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhaddenglishcountera ]]
	PdhAddEnglishCounterA :: proc(
		hQuery: PDH_HQUERY,
		szFullCounterPath: PSTR,
		dwUserData: uintptr,
		phCounter: ^PDH_HCOUNTER,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhaddenglishcounterw ]]
	PdhAddEnglishCounterW :: proc(
		hQuery: PDH_HQUERY,
		szFullCounterPath: PWSTR,
		dwUserData: uintptr,
		phCounter: ^PDH_HCOUNTER,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhbindinputdatasourcea ]]
	PdhBindInputDataSourceA :: proc(phDataSource: ^PDH_HLOG, LogFileNameList: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhbindinputdatasourcew ]]
	PdhBindInputDataSourceW :: proc(phDataSource: ^PDH_HLOG, LogFileNameList: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhbrowsecountersa ]]
	PdhBrowseCountersA :: proc(pBrowseDlgData: ^PDH_BROWSE_DLG_CONFIG_A) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhbrowsecountersha ]]
	PdhBrowseCountersHA :: proc(pBrowseDlgData: ^PDH_BROWSE_DLG_CONFIG_HA) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhbrowsecountershw ]]
	PdhBrowseCountersHW :: proc(pBrowseDlgData: ^PDH_BROWSE_DLG_CONFIG_HW) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhbrowsecountersw ]]
	PdhBrowseCountersW :: proc(pBrowseDlgData: ^PDH_BROWSE_DLG_CONFIG_W) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhcalculatecounterfromrawvalue ]]
	PdhCalculateCounterFromRawValue :: proc(
		hCounter: PDH_HCOUNTER,
		dwFormat: PDH_FMT,
		rawValue1: ^PDH_RAW_COUNTER,
		rawValue2: ^PDH_RAW_COUNTER,
		fmtValue: ^PDH_FMT_COUNTERVALUE,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhcloselog ]]
	PdhCloseLog :: proc(hLog: PDH_HLOG, dwFlags: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhclosequery ]]
	PdhCloseQuery :: proc(hQuery: PDH_HQUERY) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhcollectquerydata ]]
	PdhCollectQueryData :: proc(hQuery: PDH_HQUERY) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhcollectquerydataex ]]
	PdhCollectQueryDataEx :: proc(hQuery: PDH_HQUERY, dwIntervalTime: u32, hNewDataEvent: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhcollectquerydatawithtime ]]
	PdhCollectQueryDataWithTime :: proc(hQuery: PDH_HQUERY, pllTimeStamp: ^i64) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhcomputecounterstatistics ]]
	PdhComputeCounterStatistics :: proc(
		hCounter: PDH_HCOUNTER,
		dwFormat: PDH_FMT,
		dwFirstEntry: u32,
		dwNumEntries: u32,
		lpRawValueArray: ^PDH_RAW_COUNTER,
		data: ^PDH_STATISTICS,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhconnectmachinea ]]
	PdhConnectMachineA :: proc(szMachineName: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhconnectmachinew ]]
	PdhConnectMachineW :: proc(szMachineName: PWSTR) -> u32 ---

	PdhCreateSQLTablesA :: proc(szDataSource: PSTR) -> u32 ---

	PdhCreateSQLTablesW :: proc(szDataSource: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumlogsetnamesa ]]
	PdhEnumLogSetNamesA :: proc(szDataSource: PSTR, mszDataSetNameList: PSTR, pcchBufferLength: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumlogsetnamesw ]]
	PdhEnumLogSetNamesW :: proc(szDataSource: PWSTR, mszDataSetNameList: PWSTR, pcchBufferLength: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenummachinesa ]]
	PdhEnumMachinesA :: proc(szDataSource: PSTR, mszMachineList: PSTR, pcchBufferSize: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenummachinesha ]]
	PdhEnumMachinesHA :: proc(hDataSource: PDH_HLOG, mszMachineList: PSTR, pcchBufferSize: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenummachineshw ]]
	PdhEnumMachinesHW :: proc(hDataSource: PDH_HLOG, mszMachineList: PWSTR, pcchBufferSize: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenummachinesw ]]
	PdhEnumMachinesW :: proc(szDataSource: PWSTR, mszMachineList: PWSTR, pcchBufferSize: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsa ]]
	PdhEnumObjectItemsA :: proc(
		szDataSource: PSTR,
		szMachineName: PSTR,
		szObjectName: PSTR,
		mszCounterList: PSTR,
		pcchCounterListLength: ^u32,
		mszInstanceList: PSTR,
		pcchInstanceListLength: ^u32,
		dwDetailLevel: PERF_DETAIL,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsha ]]
	PdhEnumObjectItemsHA :: proc(
		hDataSource: PDH_HLOG,
		szMachineName: PSTR,
		szObjectName: PSTR,
		mszCounterList: PSTR,
		pcchCounterListLength: ^u32,
		mszInstanceList: PSTR,
		pcchInstanceListLength: ^u32,
		dwDetailLevel: PERF_DETAIL,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemshw ]]
	PdhEnumObjectItemsHW :: proc(
		hDataSource: PDH_HLOG,
		szMachineName: PWSTR,
		szObjectName: PWSTR,
		mszCounterList: PWSTR,
		pcchCounterListLength: ^u32,
		mszInstanceList: PWSTR,
		pcchInstanceListLength: ^u32,
		dwDetailLevel: PERF_DETAIL,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectitemsw ]]
	PdhEnumObjectItemsW :: proc(
		szDataSource: PWSTR,
		szMachineName: PWSTR,
		szObjectName: PWSTR,
		mszCounterList: PWSTR,
		pcchCounterListLength: ^u32,
		mszInstanceList: PWSTR,
		pcchInstanceListLength: ^u32,
		dwDetailLevel: PERF_DETAIL,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsa ]]
	PdhEnumObjectsA :: proc(
		szDataSource: PSTR,
		szMachineName: PSTR,
		mszObjectList: PSTR,
		pcchBufferSize: ^u32,
		dwDetailLevel: PERF_DETAIL,
		bRefresh: BOOL,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsha ]]
	PdhEnumObjectsHA :: proc(
		hDataSource: PDH_HLOG,
		szMachineName: PSTR,
		mszObjectList: PSTR,
		pcchBufferSize: ^u32,
		dwDetailLevel: PERF_DETAIL,
		bRefresh: BOOL,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectshw ]]
	PdhEnumObjectsHW :: proc(
		hDataSource: PDH_HLOG,
		szMachineName: PWSTR,
		mszObjectList: PWSTR,
		pcchBufferSize: ^u32,
		dwDetailLevel: PERF_DETAIL,
		bRefresh: BOOL,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhenumobjectsw ]]
	PdhEnumObjectsW :: proc(
		szDataSource: PWSTR,
		szMachineName: PWSTR,
		mszObjectList: PWSTR,
		pcchBufferSize: ^u32,
		dwDetailLevel: PERF_DETAIL,
		bRefresh: BOOL,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhexpandcounterpatha ]]
	PdhExpandCounterPathA :: proc(szWildCardPath: PSTR, mszExpandedPathList: PSTR, pcchPathListLength: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhexpandcounterpathw ]]
	PdhExpandCounterPathW :: proc(szWildCardPath: PWSTR, mszExpandedPathList: PWSTR, pcchPathListLength: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhexpandwildcardpatha ]]
	PdhExpandWildCardPathA :: proc(
		szDataSource: PSTR,
		szWildCardPath: PSTR,
		mszExpandedPathList: PSTR,
		pcchPathListLength: ^u32,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhexpandwildcardpathha ]]
	PdhExpandWildCardPathHA :: proc(
		hDataSource: PDH_HLOG,
		szWildCardPath: PSTR,
		mszExpandedPathList: PSTR,
		pcchPathListLength: ^u32,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhexpandwildcardpathhw ]]
	PdhExpandWildCardPathHW :: proc(
		hDataSource: PDH_HLOG,
		szWildCardPath: PWSTR,
		mszExpandedPathList: PWSTR,
		pcchPathListLength: ^u32,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhexpandwildcardpathw ]]
	PdhExpandWildCardPathW :: proc(
		szDataSource: PWSTR,
		szWildCardPath: PWSTR,
		mszExpandedPathList: PWSTR,
		pcchPathListLength: ^u32,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhformatfromrawvalue ]]
	PdhFormatFromRawValue :: proc(
		dwCounterType: u32,
		dwFormat: PDH_FMT,
		pTimeBase: ^i64,
		pRawValue1: ^PDH_RAW_COUNTER,
		pRawValue2: ^PDH_RAW_COUNTER,
		pFmtValue: ^PDH_FMT_COUNTERVALUE,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetcounterinfoa ]]
	PdhGetCounterInfoA :: proc(
		hCounter: PDH_HCOUNTER,
		bRetrieveExplainText: BOOLEAN,
		pdwBufferSize: ^u32,
		lpBuffer: ^PDH_COUNTER_INFO_A,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetcounterinfow ]]
	PdhGetCounterInfoW :: proc(
		hCounter: PDH_HCOUNTER,
		bRetrieveExplainText: BOOLEAN,
		pdwBufferSize: ^u32,
		lpBuffer: ^PDH_COUNTER_INFO_W,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetcountertimebase ]]
	PdhGetCounterTimeBase :: proc(hCounter: PDH_HCOUNTER, pTimeBase: ^i64) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdatasourcetimerangea ]]
	PdhGetDataSourceTimeRangeA :: proc(
		szDataSource: PSTR,
		pdwNumEntries: ^u32,
		pInfo: ^PDH_TIME_INFO,
		pdwBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdatasourcetimerangeh ]]
	PdhGetDataSourceTimeRangeH :: proc(
		hDataSource: PDH_HLOG,
		pdwNumEntries: ^u32,
		pInfo: ^PDH_TIME_INFO,
		pdwBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdatasourcetimerangew ]]
	PdhGetDataSourceTimeRangeW :: proc(
		szDataSource: PWSTR,
		pdwNumEntries: ^u32,
		pInfo: ^PDH_TIME_INFO,
		pdwBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdefaultperfcountera ]]
	PdhGetDefaultPerfCounterA :: proc(
		szDataSource: PSTR,
		szMachineName: PSTR,
		szObjectName: PSTR,
		szDefaultCounterName: PSTR,
		pcchBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdefaultperfcounterha ]]
	PdhGetDefaultPerfCounterHA :: proc(
		hDataSource: PDH_HLOG,
		szMachineName: PSTR,
		szObjectName: PSTR,
		szDefaultCounterName: PSTR,
		pcchBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdefaultperfcounterhw ]]
	PdhGetDefaultPerfCounterHW :: proc(
		hDataSource: PDH_HLOG,
		szMachineName: PWSTR,
		szObjectName: PWSTR,
		szDefaultCounterName: PWSTR,
		pcchBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdefaultperfcounterw ]]
	PdhGetDefaultPerfCounterW :: proc(
		szDataSource: PWSTR,
		szMachineName: PWSTR,
		szObjectName: PWSTR,
		szDefaultCounterName: PWSTR,
		pcchBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdefaultperfobjecta ]]
	PdhGetDefaultPerfObjectA :: proc(
		szDataSource: PSTR,
		szMachineName: PSTR,
		szDefaultObjectName: PSTR,
		pcchBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdefaultperfobjectha ]]
	PdhGetDefaultPerfObjectHA :: proc(
		hDataSource: PDH_HLOG,
		szMachineName: PSTR,
		szDefaultObjectName: PSTR,
		pcchBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdefaultperfobjecthw ]]
	PdhGetDefaultPerfObjectHW :: proc(
		hDataSource: PDH_HLOG,
		szMachineName: PWSTR,
		szDefaultObjectName: PWSTR,
		pcchBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdefaultperfobjectw ]]
	PdhGetDefaultPerfObjectW :: proc(
		szDataSource: PWSTR,
		szMachineName: PWSTR,
		szDefaultObjectName: PWSTR,
		pcchBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetdllversion ]]
	PdhGetDllVersion :: proc(lpdwVersion: ^PDH_DLL_VERSION) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetformattedcounterarraya ]]
	PdhGetFormattedCounterArrayA :: proc(
		hCounter: PDH_HCOUNTER,
		dwFormat: PDH_FMT,
		lpdwBufferSize: ^u32,
		lpdwItemCount: ^u32,
		ItemBuffer: ^PDH_FMT_COUNTERVALUE_ITEM_A,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetformattedcounterarrayw ]]
	PdhGetFormattedCounterArrayW :: proc(
		hCounter: PDH_HCOUNTER,
		dwFormat: PDH_FMT,
		lpdwBufferSize: ^u32,
		lpdwItemCount: ^u32,
		ItemBuffer: ^PDH_FMT_COUNTERVALUE_ITEM_W,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetformattedcountervalue ]]
	PdhGetFormattedCounterValue :: proc(
		hCounter: PDH_HCOUNTER,
		dwFormat: PDH_FMT,
		lpdwType: ^u32,
		pValue: ^PDH_FMT_COUNTERVALUE,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetlogfilesize ]]
	PdhGetLogFileSize :: proc(hLog: PDH_HLOG, llSize: ^i64) -> u32 ---

	PdhGetLogSetGUID :: proc(hLog: PDH_HLOG, pGuid: ^GUID, pRunId: ^i32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetrawcounterarraya ]]
	PdhGetRawCounterArrayA :: proc(
		hCounter: PDH_HCOUNTER,
		lpdwBufferSize: ^u32,
		lpdwItemCount: ^u32,
		ItemBuffer: ^PDH_RAW_COUNTER_ITEM_A,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetrawcounterarrayw ]]
	PdhGetRawCounterArrayW :: proc(
		hCounter: PDH_HCOUNTER,
		lpdwBufferSize: ^u32,
		lpdwItemCount: ^u32,
		ItemBuffer: ^PDH_RAW_COUNTER_ITEM_W,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhgetrawcountervalue ]]
	PdhGetRawCounterValue :: proc(hCounter: PDH_HCOUNTER, lpdwType: ^u32, pValue: ^PDH_RAW_COUNTER) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhisrealtimequery ]]
	PdhIsRealTimeQuery :: proc(hQuery: PDH_HQUERY) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhlookupperfindexbynamea ]]
	PdhLookupPerfIndexByNameA :: proc(szMachineName: PSTR, szNameBuffer: PSTR, pdwIndex: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhlookupperfindexbynamew ]]
	PdhLookupPerfIndexByNameW :: proc(szMachineName: PWSTR, szNameBuffer: PWSTR, pdwIndex: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhlookupperfnamebyindexa ]]
	PdhLookupPerfNameByIndexA :: proc(
		szMachineName: PSTR,
		dwNameIndex: u32,
		szNameBuffer: PSTR,
		pcchNameBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhlookupperfnamebyindexw ]]
	PdhLookupPerfNameByIndexW :: proc(
		szMachineName: PWSTR,
		dwNameIndex: u32,
		szNameBuffer: PWSTR,
		pcchNameBufferSize: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhmakecounterpatha ]]
	PdhMakeCounterPathA :: proc(
		pCounterPathElements: ^PDH_COUNTER_PATH_ELEMENTS_A,
		szFullPathBuffer: PSTR,
		pcchBufferSize: ^u32,
		dwFlags: PDH_PATH_FLAGS,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhmakecounterpathw ]]
	PdhMakeCounterPathW :: proc(
		pCounterPathElements: ^PDH_COUNTER_PATH_ELEMENTS_W,
		szFullPathBuffer: PWSTR,
		pcchBufferSize: ^u32,
		dwFlags: PDH_PATH_FLAGS,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhopenloga ]]
	PdhOpenLogA :: proc(
		szLogFileName: PSTR,
		dwAccessFlags: PDH_LOG,
		lpdwLogType: ^PDH_LOG_TYPE,
		hQuery: PDH_HQUERY,
		dwMaxSize: u32,
		szUserCaption: PSTR,
		phLog: ^PDH_HLOG,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhopenlogw ]]
	PdhOpenLogW :: proc(
		szLogFileName: PWSTR,
		dwAccessFlags: PDH_LOG,
		lpdwLogType: ^PDH_LOG_TYPE,
		hQuery: PDH_HQUERY,
		dwMaxSize: u32,
		szUserCaption: PWSTR,
		phLog: ^PDH_HLOG,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhopenquerya ]]
	PdhOpenQueryA :: proc(szDataSource: PSTR, dwUserData: uintptr, phQuery: ^PDH_HQUERY) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhopenqueryh ]]
	PdhOpenQueryH :: proc(hDataSource: PDH_HLOG, dwUserData: uintptr, phQuery: ^PDH_HQUERY) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhopenqueryw ]]
	PdhOpenQueryW :: proc(szDataSource: PWSTR, dwUserData: uintptr, phQuery: ^PDH_HQUERY) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhparsecounterpatha ]]
	PdhParseCounterPathA :: proc(
		szFullPathBuffer: PSTR,
		pCounterPathElements: ^PDH_COUNTER_PATH_ELEMENTS_A,
		pdwBufferSize: ^u32,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhparsecounterpathw ]]
	PdhParseCounterPathW :: proc(
		szFullPathBuffer: PWSTR,
		pCounterPathElements: ^PDH_COUNTER_PATH_ELEMENTS_W,
		pdwBufferSize: ^u32,
		dwFlags: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhparseinstancenamea ]]
	PdhParseInstanceNameA :: proc(
		szInstanceString: PSTR,
		szInstanceName: PSTR,
		pcchInstanceNameLength: ^u32,
		szParentName: PSTR,
		pcchParentNameLength: ^u32,
		lpIndex: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhparseinstancenamew ]]
	PdhParseInstanceNameW :: proc(
		szInstanceString: PWSTR,
		szInstanceName: PWSTR,
		pcchInstanceNameLength: ^u32,
		szParentName: PWSTR,
		pcchParentNameLength: ^u32,
		lpIndex: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhreadrawlogrecord ]]
	PdhReadRawLogRecord :: proc(
		hLog: PDH_HLOG,
		ftRecord: FILETIME,
		pRawLogRecord: ^PDH_RAW_LOG_RECORD,
		pdwBufferLength: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhremovecounter ]]
	PdhRemoveCounter :: proc(hCounter: PDH_HCOUNTER) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhselectdatasourcea ]]
	PdhSelectDataSourceA :: proc(
		hWndOwner: HWND,
		dwFlags: PDH_SELECT_DATA_SOURCE_FLAGS,
		szDataSource: PSTR,
		pcchBufferLength: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhselectdatasourcew ]]
	PdhSelectDataSourceW :: proc(
		hWndOwner: HWND,
		dwFlags: PDH_SELECT_DATA_SOURCE_FLAGS,
		szDataSource: PWSTR,
		pcchBufferLength: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhsetcounterscalefactor ]]
	PdhSetCounterScaleFactor :: proc(hCounter: PDH_HCOUNTER, lFactor: i32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhsetdefaultrealtimedatasource ]]
	PdhSetDefaultRealTimeDataSource :: proc(dwDataSourceId: REAL_TIME_DATA_SOURCE_ID_FLAGS) -> u32 ---

	PdhSetLogSetRunID :: proc(hLog: PDH_HLOG, RunId: i32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhsetquerytimerange ]]
	PdhSetQueryTimeRange :: proc(hQuery: PDH_HQUERY, pInfo: ^PDH_TIME_INFO) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhupdateloga ]]
	PdhUpdateLogA :: proc(hLog: PDH_HLOG, szUserString: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhupdatelogfilecatalog ]]
	PdhUpdateLogFileCatalog :: proc(hLog: PDH_HLOG) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhupdatelogw ]]
	PdhUpdateLogW :: proc(hLog: PDH_HLOG, szUserString: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhvalidatepatha ]]
	PdhValidatePathA :: proc(szFullPathBuffer: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhvalidatepathexa ]]
	PdhValidatePathExA :: proc(hDataSource: PDH_HLOG, szFullPathBuffer: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhvalidatepathexw ]]
	PdhValidatePathExW :: proc(hDataSource: PDH_HLOG, szFullPathBuffer: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/nf-pdh-pdhvalidatepathw ]]
	PdhValidatePathW :: proc(szFullPathBuffer: PWSTR) -> u32 ---

	PdhVerifySQLDBA :: proc(szDataSource: PSTR) -> u32 ---

	PdhVerifySQLDBW :: proc(szDataSource: PWSTR) -> u32 ---
}

ICounterItemUnion :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICounterItemUnion_Vtbl,
}
ICounterItemUnion_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_Value: proc "system" (this: ^ICounterItemUnion, pdblValue: ^f64) -> HRESULT,
	put_Color: proc "system" (this: ^ICounterItemUnion, Color: u32) -> HRESULT,
	get_Color: proc "system" (this: ^ICounterItemUnion, pColor: ^u32) -> HRESULT,
	put_Width: proc "system" (this: ^ICounterItemUnion, iWidth: i32) -> HRESULT,
	get_Width: proc "system" (this: ^ICounterItemUnion, piValue: ^i32) -> HRESULT,
	put_LineStyle: proc "system" (this: ^ICounterItemUnion, iLineStyle: i32) -> HRESULT,
	get_LineStyle: proc "system" (this: ^ICounterItemUnion, piValue: ^i32) -> HRESULT,
	put_ScaleFactor: proc "system" (this: ^ICounterItemUnion, iScale: i32) -> HRESULT,
	get_ScaleFactor: proc "system" (this: ^ICounterItemUnion, piValue: ^i32) -> HRESULT,
	get_Path: proc "system" (this: ^ICounterItemUnion, pstrValue: ^BSTR) -> HRESULT,
	GetValue: proc "system" (this: ^ICounterItemUnion, Value: ^f64, Status: ^i32) -> HRESULT,
	GetStatistics: proc "system" (this: ^ICounterItemUnion, Max: ^f64, Min: ^f64, Avg: ^f64, Status: ^i32) -> HRESULT,
	put_Selected: proc "system" (this: ^ICounterItemUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_Selected: proc "system" (this: ^ICounterItemUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_Visible: proc "system" (this: ^ICounterItemUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_Visible: proc "system" (this: ^ICounterItemUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	GetDataAt: proc "system" (
		this: ^ICounterItemUnion,
		iIndex: i32,
		iWhich: SysmonDataType,
		pVariant: ^VARIANT,
	) -> HRESULT,
}
IID__ICounterItemUnion :: GUID{0xDE1A6B74, 0x9182, 0x4C41, {0x8E, 0x2C, 0x24, 0xC2, 0xCD, 0x30, 0xEE, 0x83}}

ISystemMonitorUnion :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISystemMonitorUnion_Vtbl,
}
ISystemMonitorUnion_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_Appearance: proc "system" (this: ^ISystemMonitorUnion, iAppearance: ^i32) -> HRESULT,
	put_Appearance: proc "system" (this: ^ISystemMonitorUnion, iAppearance: i32) -> HRESULT,
	get_BackColor: proc "system" (this: ^ISystemMonitorUnion, pColor: ^u32) -> HRESULT,
	put_BackColor: proc "system" (this: ^ISystemMonitorUnion, Color: u32) -> HRESULT,
	get_BorderStyle: proc "system" (this: ^ISystemMonitorUnion, iBorderStyle: ^i32) -> HRESULT,
	put_BorderStyle: proc "system" (this: ^ISystemMonitorUnion, iBorderStyle: i32) -> HRESULT,
	get_ForeColor: proc "system" (this: ^ISystemMonitorUnion, pColor: ^u32) -> HRESULT,
	put_ForeColor: proc "system" (this: ^ISystemMonitorUnion, Color: u32) -> HRESULT,
	get_Font: proc "system" (this: ^ISystemMonitorUnion, ppFont: ^^IFontDisp) -> HRESULT,
	putref_Font: proc "system" (this: ^ISystemMonitorUnion, pFont: ^IFontDisp) -> HRESULT,
	get_Counters: proc "system" (this: ^ISystemMonitorUnion, ppICounters: ^^ICounters) -> HRESULT,
	put_ShowVerticalGrid: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowVerticalGrid: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowHorizontalGrid: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowHorizontalGrid: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowLegend: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowLegend: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowScaleLabels: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowScaleLabels: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowValueBar: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowValueBar: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_MaximumScale: proc "system" (this: ^ISystemMonitorUnion, iValue: i32) -> HRESULT,
	get_MaximumScale: proc "system" (this: ^ISystemMonitorUnion, piValue: ^i32) -> HRESULT,
	put_MinimumScale: proc "system" (this: ^ISystemMonitorUnion, iValue: i32) -> HRESULT,
	get_MinimumScale: proc "system" (this: ^ISystemMonitorUnion, piValue: ^i32) -> HRESULT,
	put_UpdateInterval: proc "system" (this: ^ISystemMonitorUnion, fValue: f32) -> HRESULT,
	get_UpdateInterval: proc "system" (this: ^ISystemMonitorUnion, pfValue: ^f32) -> HRESULT,
	put_DisplayType: proc "system" (this: ^ISystemMonitorUnion, eDisplayType: DisplayTypeConstants) -> HRESULT,
	get_DisplayType: proc "system" (this: ^ISystemMonitorUnion, peDisplayType: ^DisplayTypeConstants) -> HRESULT,
	put_ManualUpdate: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ManualUpdate: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_GraphTitle: proc "system" (this: ^ISystemMonitorUnion, bsTitle: BSTR) -> HRESULT,
	get_GraphTitle: proc "system" (this: ^ISystemMonitorUnion, pbsTitle: ^BSTR) -> HRESULT,
	put_YAxisLabel: proc "system" (this: ^ISystemMonitorUnion, bsTitle: BSTR) -> HRESULT,
	get_YAxisLabel: proc "system" (this: ^ISystemMonitorUnion, pbsTitle: ^BSTR) -> HRESULT,
	CollectSample: proc "system" (this: ^ISystemMonitorUnion) -> HRESULT,
	UpdateGraph: proc "system" (this: ^ISystemMonitorUnion) -> HRESULT,
	BrowseCounters: proc "system" (this: ^ISystemMonitorUnion) -> HRESULT,
	DisplayProperties: proc "system" (this: ^ISystemMonitorUnion) -> HRESULT,
	Counter: proc "system" (this: ^ISystemMonitorUnion, iIndex: i32, ppICounter: ^^ICounterItem) -> HRESULT,
	AddCounter: proc "system" (this: ^ISystemMonitorUnion, bsPath: BSTR, ppICounter: ^^ICounterItem) -> HRESULT,
	DeleteCounter: proc "system" (this: ^ISystemMonitorUnion, pCtr: ^ICounterItem) -> HRESULT,
	get_BackColorCtl: proc "system" (this: ^ISystemMonitorUnion, pColor: ^u32) -> HRESULT,
	put_BackColorCtl: proc "system" (this: ^ISystemMonitorUnion, Color: u32) -> HRESULT,
	put_LogFileName: proc "system" (this: ^ISystemMonitorUnion, bsFileName: BSTR) -> HRESULT,
	get_LogFileName: proc "system" (this: ^ISystemMonitorUnion, bsFileName: ^BSTR) -> HRESULT,
	put_LogViewStart: proc "system" (this: ^ISystemMonitorUnion, StartTime: f64) -> HRESULT,
	get_LogViewStart: proc "system" (this: ^ISystemMonitorUnion, StartTime: ^f64) -> HRESULT,
	put_LogViewStop: proc "system" (this: ^ISystemMonitorUnion, StopTime: f64) -> HRESULT,
	get_LogViewStop: proc "system" (this: ^ISystemMonitorUnion, StopTime: ^f64) -> HRESULT,
	get_GridColor: proc "system" (this: ^ISystemMonitorUnion, pColor: ^u32) -> HRESULT,
	put_GridColor: proc "system" (this: ^ISystemMonitorUnion, Color: u32) -> HRESULT,
	get_TimeBarColor: proc "system" (this: ^ISystemMonitorUnion, pColor: ^u32) -> HRESULT,
	put_TimeBarColor: proc "system" (this: ^ISystemMonitorUnion, Color: u32) -> HRESULT,
	get_Highlight: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_Highlight: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowToolbar: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowToolbar: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	Paste: proc "system" (this: ^ISystemMonitorUnion) -> HRESULT,
	Copy: proc "system" (this: ^ISystemMonitorUnion) -> HRESULT,
	Reset: proc "system" (this: ^ISystemMonitorUnion) -> HRESULT,
	put_ReadOnly: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ReadOnly: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ReportValueType: proc "system" (this: ^ISystemMonitorUnion, eReportValueType: ReportValueTypeConstants) -> HRESULT,
	get_ReportValueType: proc "system" (
		this: ^ISystemMonitorUnion,
		peReportValueType: ^ReportValueTypeConstants,
	) -> HRESULT,
	put_MonitorDuplicateInstances: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_MonitorDuplicateInstances: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_DisplayFilter: proc "system" (this: ^ISystemMonitorUnion, iValue: i32) -> HRESULT,
	get_DisplayFilter: proc "system" (this: ^ISystemMonitorUnion, piValue: ^i32) -> HRESULT,
	get_LogFiles: proc "system" (this: ^ISystemMonitorUnion, ppILogFiles: ^^ILogFiles) -> HRESULT,
	put_DataSourceType: proc "system" (this: ^ISystemMonitorUnion, eDataSourceType: DataSourceTypeConstants) -> HRESULT,
	get_DataSourceType: proc "system" (this: ^ISystemMonitorUnion, peDataSourceType: ^DataSourceTypeConstants) -> HRESULT,
	put_SqlDsnName: proc "system" (this: ^ISystemMonitorUnion, bsSqlDsnName: BSTR) -> HRESULT,
	get_SqlDsnName: proc "system" (this: ^ISystemMonitorUnion, bsSqlDsnName: ^BSTR) -> HRESULT,
	put_SqlLogSetName: proc "system" (this: ^ISystemMonitorUnion, bsSqlLogSetName: BSTR) -> HRESULT,
	get_SqlLogSetName: proc "system" (this: ^ISystemMonitorUnion, bsSqlLogSetName: ^BSTR) -> HRESULT,
	put_EnableDigitGrouping: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_EnableDigitGrouping: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_EnableToolTips: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_EnableToolTips: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowTimeAxisLabels: proc "system" (this: ^ISystemMonitorUnion, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowTimeAxisLabels: proc "system" (this: ^ISystemMonitorUnion, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ChartScroll: proc "system" (this: ^ISystemMonitorUnion, bScroll: VARIANT_BOOL) -> HRESULT,
	get_ChartScroll: proc "system" (this: ^ISystemMonitorUnion, pbScroll: ^VARIANT_BOOL) -> HRESULT,
	put_DataPointCount: proc "system" (this: ^ISystemMonitorUnion, iNewCount: i32) -> HRESULT,
	get_DataPointCount: proc "system" (this: ^ISystemMonitorUnion, piDataPointCount: ^i32) -> HRESULT,
	ScaleToFit: proc "system" (this: ^ISystemMonitorUnion, bSelectedCountersOnly: VARIANT_BOOL) -> HRESULT,
	SaveAs: proc "system" (
		this: ^ISystemMonitorUnion,
		bstrFileName: BSTR,
		eSysmonFileType: SysmonFileType,
	) -> HRESULT,
	Relog: proc "system" (
		this: ^ISystemMonitorUnion,
		bstrFileName: BSTR,
		eSysmonFileType: SysmonFileType,
		iFilter: i32,
	) -> HRESULT,
	ClearData: proc "system" (this: ^ISystemMonitorUnion) -> HRESULT,
	get_LogSourceStartTime: proc "system" (this: ^ISystemMonitorUnion, pDate: ^f64) -> HRESULT,
	get_LogSourceStopTime: proc "system" (this: ^ISystemMonitorUnion, pDate: ^f64) -> HRESULT,
	SetLogViewRange: proc "system" (this: ^ISystemMonitorUnion, StartTime: f64, StopTime: f64) -> HRESULT,
	GetLogViewRange: proc "system" (this: ^ISystemMonitorUnion, StartTime: ^f64, StopTime: ^f64) -> HRESULT,
	BatchingLock: proc "system" (
		this: ^ISystemMonitorUnion,
		fLock: VARIANT_BOOL,
		eBatchReason: SysmonBatchReason,
	) -> HRESULT,
	LoadSettings: proc "system" (this: ^ISystemMonitorUnion, bstrSettingFileName: BSTR) -> HRESULT,
}
IID__ISystemMonitorUnion :: GUID{0xC8A77338, 0x265F, 0x4DE5, {0xAA, 0x25, 0xC7, 0xDA, 0x1C, 0xE5, 0xA8, 0xF4}}

AppearPropPage :: struct {
}
IID_AppearPropPage :: GUID{0xE49741E9, 0x93A8, 0x4AB1, {0x8E, 0x96, 0xBF, 0x44, 0x82, 0x28, 0x2E, 0x9C}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-autopathformat ]]
AutoPathFormat :: enum i32 {
	None = 0,
	Pattern = 1,
	Computer = 2,
	MonthDayHour = 256,
	SerialNumber = 512,
	YearDayOfYear = 1024,
	YearMonth = 2048,
	YearMonthDay = 4096,
	YearMonthDayHour = 8192,
	MonthDayHourMinute = 16384,
}

BootTraceSession :: struct {
}
IID_BootTraceSession :: GUID{0x03837538, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

BootTraceSessionCollection :: struct {
}
IID_BootTraceSessionCollection :: GUID{0x03837539, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-clocktype ]]
ClockType :: enum i32 {
	TimeStamp = 0,
	Performance = 1,
	System = 2,
	Cycle = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-commitmode ]]
CommitMode :: enum i32 {
	CreateNew = 1,
	Modify = 2,
	CreateOrModify = 3,
	UpdateRunningInstance = 16,
	FlushTrace = 32,
	ValidateOnly = 4096,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/SysMon/counteritem ]]
CounterItem :: struct {
}
IID_CounterItem :: GUID{0xC4D2D8E0, 0xD1DD, 0x11CE, {0x94, 0x0F, 0x00, 0x80, 0x29, 0x00, 0x43, 0x48}}

CounterItem2 :: struct {
}
IID_CounterItem2 :: GUID{0x43196C62, 0xC31F, 0x4CE3, {0xA0, 0x2E, 0x79, 0xEF, 0xE0, 0xF6, 0xA5, 0x25}}

CounterPathCallBack :: #type proc "system" (param0: uintptr) -> i32

CounterPropPage :: struct {
}
IID_CounterPropPage :: GUID{0xCF948561, 0xEDE8, 0x11CE, {0x94, 0x1E, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/SysMon/counters ]]
Counters :: struct {
}
IID_Counters :: GUID{0xB2B066D2, 0x2AAC, 0x11CF, {0x94, 0x2F, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

DataCollectorSet :: struct {
}
IID_DataCollectorSet :: GUID{0x03837521, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

DataCollectorSetCollection :: struct {
}
IID_DataCollectorSetCollection :: GUID{0x03837525, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-datacollectorsetstatus ]]
DataCollectorSetStatus :: enum i32 {
	Stopped = 0,
	Running = 1,
	Compiling = 2,
	Pending = 3,
	Undefined = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-datacollectortype ]]
DataCollectorType :: enum i32 {
	PerformanceCounter = 0,
	Trace = 1,
	Configuration = 2,
	Alert = 3,
	ApiTrace = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-datamanagersteps ]]
DataManagerSteps :: enum i32 {
	CreateReport = 1,
	RunRules = 2,
	CreateHtml = 4,
	FolderActions = 8,
	ResourceFreeing = 16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-datasourcetypeconstants ]]
DataSourceTypeConstants :: enum i32 {
	NullDataSource = -1,
	CurrentActivity = 1,
	LogFiles = 2,
	SqlLog = 3,
}

DICounterItem :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DICounterItem_Vtbl,
}
DICounterItem_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DICounterItem :: GUID{0xC08C4FF2, 0x0E2E, 0x11CF, {0x94, 0x2C, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

DILogFileItem :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DILogFileItem_Vtbl,
}
DILogFileItem_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DILogFileItem :: GUID{0x8D093FFC, 0xF777, 0x4917, {0x82, 0xD1, 0x83, 0x3F, 0xBC, 0x54, 0xC5, 0x8F}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-displaytypeconstants ]]
DisplayTypeConstants :: enum i32 {
	LineGraph = 1,
	Histogram = 2,
	Report = 3,
	ChartArea = 4,
	ChartStackedArea = 5,
}

DISystemMonitor :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DISystemMonitor_Vtbl,
}
DISystemMonitor_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DISystemMonitor :: GUID{0x13D73D81, 0xC32E, 0x11CF, {0x93, 0x98, 0x00, 0xAA, 0x00, 0xA3, 0xDD, 0xEA}}

DISystemMonitorEvents :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DISystemMonitorEvents_Vtbl,
}
DISystemMonitorEvents_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DISystemMonitorEvents :: GUID{0x84979930, 0x4AB3, 0x11CF, {0x94, 0x3A, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

DISystemMonitorInternal :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^DISystemMonitorInternal_Vtbl,
}
DISystemMonitorInternal_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
}
IID_DISystemMonitorInternal :: GUID{0x194EB242, 0xC32C, 0x11CF, {0x93, 0x98, 0x00, 0xAA, 0x00, 0xA3, 0xDD, 0xEA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-fileformat ]]
FileFormat :: enum i32 {
	CommaSeparated = 0,
	TabSeparated = 1,
	Sql = 2,
	Binary = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-folderactionsteps ]]
FolderActionSteps :: enum i32 {
	CreateCab = 1,
	DeleteData = 2,
	SendCab = 4,
	DeleteCab = 8,
	DeleteReport = 16,
}

GeneralPropPage :: struct {
}
IID_GeneralPropPage :: GUID{0xC3E5D3D2, 0x1A03, 0x11CF, {0x94, 0x2D, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

GraphPropPage :: struct {
}
IID_GraphPropPage :: GUID{0xC3E5D3D3, 0x1A03, 0x11CF, {0x94, 0x2D, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ialertdatacollector ]]
IAlertDataCollector :: struct #raw_union {
	#subtype IDataCollector: IDataCollector,
	using Vtbl: ^IAlertDataCollector_Vtbl,
}
IAlertDataCollector_Vtbl :: struct {
	using IDataCollector_Vtbl: IDataCollector_Vtbl,
	get_AlertThresholds: proc "system" (this: ^IAlertDataCollector, alerts: ^SAFEARRAY) -> HRESULT,
	put_AlertThresholds: proc "system" (this: ^IAlertDataCollector, alerts: ^SAFEARRAY) -> HRESULT,
	get_EventLog: proc "system" (this: ^IAlertDataCollector, log: ^VARIANT_BOOL) -> HRESULT,
	put_EventLog: proc "system" (this: ^IAlertDataCollector, log: VARIANT_BOOL) -> HRESULT,
	get_SampleInterval: proc "system" (this: ^IAlertDataCollector, interval: ^u32) -> HRESULT,
	put_SampleInterval: proc "system" (this: ^IAlertDataCollector, interval: u32) -> HRESULT,
	get_Task: proc "system" (this: ^IAlertDataCollector, task: ^BSTR) -> HRESULT,
	put_Task: proc "system" (this: ^IAlertDataCollector, task: BSTR) -> HRESULT,
	get_TaskRunAsSelf: proc "system" (this: ^IAlertDataCollector, RunAsSelf: ^VARIANT_BOOL) -> HRESULT,
	put_TaskRunAsSelf: proc "system" (this: ^IAlertDataCollector, RunAsSelf: VARIANT_BOOL) -> HRESULT,
	get_TaskArguments: proc "system" (this: ^IAlertDataCollector, task: ^BSTR) -> HRESULT,
	put_TaskArguments: proc "system" (this: ^IAlertDataCollector, task: BSTR) -> HRESULT,
	get_TaskUserTextArguments: proc "system" (this: ^IAlertDataCollector, task: ^BSTR) -> HRESULT,
	put_TaskUserTextArguments: proc "system" (this: ^IAlertDataCollector, task: BSTR) -> HRESULT,
	get_TriggerDataCollectorSet: proc "system" (this: ^IAlertDataCollector, name: ^BSTR) -> HRESULT,
	put_TriggerDataCollectorSet: proc "system" (this: ^IAlertDataCollector, name: BSTR) -> HRESULT,
}
IID_IAlertDataCollector :: GUID{0x03837516, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-iapitracingdatacollector ]]
IApiTracingDataCollector :: struct #raw_union {
	#subtype IDataCollector: IDataCollector,
	using Vtbl: ^IApiTracingDataCollector_Vtbl,
}
IApiTracingDataCollector_Vtbl :: struct {
	using IDataCollector_Vtbl: IDataCollector_Vtbl,
	get_LogApiNamesOnly: proc "system" (this: ^IApiTracingDataCollector, logapinames: ^VARIANT_BOOL) -> HRESULT,
	put_LogApiNamesOnly: proc "system" (this: ^IApiTracingDataCollector, logapinames: VARIANT_BOOL) -> HRESULT,
	get_LogApisRecursively: proc "system" (this: ^IApiTracingDataCollector, logrecursively: ^VARIANT_BOOL) -> HRESULT,
	put_LogApisRecursively: proc "system" (this: ^IApiTracingDataCollector, logrecursively: VARIANT_BOOL) -> HRESULT,
	get_ExePath: proc "system" (this: ^IApiTracingDataCollector, exepath: ^BSTR) -> HRESULT,
	put_ExePath: proc "system" (this: ^IApiTracingDataCollector, exepath: BSTR) -> HRESULT,
	get_LogFilePath: proc "system" (this: ^IApiTracingDataCollector, logfilepath: ^BSTR) -> HRESULT,
	put_LogFilePath: proc "system" (this: ^IApiTracingDataCollector, logfilepath: BSTR) -> HRESULT,
	get_IncludeModules: proc "system" (this: ^IApiTracingDataCollector, includemodules: ^SAFEARRAY) -> HRESULT,
	put_IncludeModules: proc "system" (this: ^IApiTracingDataCollector, includemodules: ^SAFEARRAY) -> HRESULT,
	get_IncludeApis: proc "system" (this: ^IApiTracingDataCollector, includeapis: ^SAFEARRAY) -> HRESULT,
	put_IncludeApis: proc "system" (this: ^IApiTracingDataCollector, includeapis: ^SAFEARRAY) -> HRESULT,
	get_ExcludeApis: proc "system" (this: ^IApiTracingDataCollector, excludeapis: ^SAFEARRAY) -> HRESULT,
	put_ExcludeApis: proc "system" (this: ^IApiTracingDataCollector, excludeapis: ^SAFEARRAY) -> HRESULT,
}
IID_IApiTracingDataCollector :: GUID{0x0383751A, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-iconfigurationdatacollector ]]
IConfigurationDataCollector :: struct #raw_union {
	#subtype IDataCollector: IDataCollector,
	using Vtbl: ^IConfigurationDataCollector_Vtbl,
}
IConfigurationDataCollector_Vtbl :: struct {
	using IDataCollector_Vtbl: IDataCollector_Vtbl,
	get_FileMaxCount: proc "system" (this: ^IConfigurationDataCollector, count: ^u32) -> HRESULT,
	put_FileMaxCount: proc "system" (this: ^IConfigurationDataCollector, count: u32) -> HRESULT,
	get_FileMaxRecursiveDepth: proc "system" (this: ^IConfigurationDataCollector, depth: ^u32) -> HRESULT,
	put_FileMaxRecursiveDepth: proc "system" (this: ^IConfigurationDataCollector, depth: u32) -> HRESULT,
	get_FileMaxTotalSize: proc "system" (this: ^IConfigurationDataCollector, size: ^u32) -> HRESULT,
	put_FileMaxTotalSize: proc "system" (this: ^IConfigurationDataCollector, size: u32) -> HRESULT,
	get_Files: proc "system" (this: ^IConfigurationDataCollector, Files: ^SAFEARRAY) -> HRESULT,
	put_Files: proc "system" (this: ^IConfigurationDataCollector, Files: ^SAFEARRAY) -> HRESULT,
	get_ManagementQueries: proc "system" (this: ^IConfigurationDataCollector, Queries: ^SAFEARRAY) -> HRESULT,
	put_ManagementQueries: proc "system" (this: ^IConfigurationDataCollector, Queries: ^SAFEARRAY) -> HRESULT,
	get_QueryNetworkAdapters: proc "system" (this: ^IConfigurationDataCollector, network: ^VARIANT_BOOL) -> HRESULT,
	put_QueryNetworkAdapters: proc "system" (this: ^IConfigurationDataCollector, network: VARIANT_BOOL) -> HRESULT,
	get_RegistryKeys: proc "system" (this: ^IConfigurationDataCollector, query: ^SAFEARRAY) -> HRESULT,
	put_RegistryKeys: proc "system" (this: ^IConfigurationDataCollector, query: ^SAFEARRAY) -> HRESULT,
	get_RegistryMaxRecursiveDepth: proc "system" (this: ^IConfigurationDataCollector, depth: ^u32) -> HRESULT,
	put_RegistryMaxRecursiveDepth: proc "system" (this: ^IConfigurationDataCollector, depth: u32) -> HRESULT,
	get_SystemStateFile: proc "system" (this: ^IConfigurationDataCollector, FileName: ^BSTR) -> HRESULT,
	put_SystemStateFile: proc "system" (this: ^IConfigurationDataCollector, FileName: BSTR) -> HRESULT,
}
IID_IConfigurationDataCollector :: GUID{0x03837514, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

ICounterItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ICounterItem_Vtbl,
}
ICounterItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_Value: proc "system" (this: ^ICounterItem, pdblValue: ^f64) -> HRESULT,
	put_Color: proc "system" (this: ^ICounterItem, Color: u32) -> HRESULT,
	get_Color: proc "system" (this: ^ICounterItem, pColor: ^u32) -> HRESULT,
	put_Width: proc "system" (this: ^ICounterItem, iWidth: i32) -> HRESULT,
	get_Width: proc "system" (this: ^ICounterItem, piValue: ^i32) -> HRESULT,
	put_LineStyle: proc "system" (this: ^ICounterItem, iLineStyle: i32) -> HRESULT,
	get_LineStyle: proc "system" (this: ^ICounterItem, piValue: ^i32) -> HRESULT,
	put_ScaleFactor: proc "system" (this: ^ICounterItem, iScale: i32) -> HRESULT,
	get_ScaleFactor: proc "system" (this: ^ICounterItem, piValue: ^i32) -> HRESULT,
	get_Path: proc "system" (this: ^ICounterItem, pstrValue: ^BSTR) -> HRESULT,
	GetValue: proc "system" (this: ^ICounterItem, Value: ^f64, Status: ^i32) -> HRESULT,
	GetStatistics: proc "system" (this: ^ICounterItem, Max: ^f64, Min: ^f64, Avg: ^f64, Status: ^i32) -> HRESULT,
}
IID_ICounterItem :: GUID{0x771A9520, 0xEE28, 0x11CE, {0x94, 0x1E, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

ICounterItem2 :: struct #raw_union {
	#subtype ICounterItem: ICounterItem,
	using Vtbl: ^ICounterItem2_Vtbl,
}
ICounterItem2_Vtbl :: struct {
	using ICounterItem_Vtbl: ICounterItem_Vtbl,
	put_Selected: proc "system" (this: ^ICounterItem2, bState: VARIANT_BOOL) -> HRESULT,
	get_Selected: proc "system" (this: ^ICounterItem2, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_Visible: proc "system" (this: ^ICounterItem2, bState: VARIANT_BOOL) -> HRESULT,
	get_Visible: proc "system" (this: ^ICounterItem2, pbState: ^VARIANT_BOOL) -> HRESULT,
	GetDataAt: proc "system" (this: ^ICounterItem2, iIndex: i32, iWhich: SysmonDataType, pVariant: ^VARIANT) -> HRESULT,
}
IID_ICounterItem2 :: GUID{0xEEFCD4E1, 0xEA1C, 0x4435, {0xB7, 0xF4, 0xE3, 0x41, 0xBA, 0x03, 0xB4, 0xF9}}

ICounters :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^ICounters_Vtbl,
}
ICounters_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^ICounters, pLong: ^i32) -> HRESULT,
	get__NewEnum: proc "system" (this: ^ICounters, ppIunk: ^^IUnknown) -> HRESULT,
	get_Item: proc "system" (this: ^ICounters, index: VARIANT, ppI: ^^DICounterItem) -> HRESULT,
	Add: proc "system" (this: ^ICounters, pathname: BSTR, ppI: ^^DICounterItem) -> HRESULT,
	Remove: proc "system" (this: ^ICounters, index: VARIANT) -> HRESULT,
}
IID_ICounters :: GUID{0x79167962, 0x28FC, 0x11CF, {0x94, 0x2F, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-idatacollector ]]
IDataCollector :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IDataCollector_Vtbl,
}
IDataCollector_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_DataCollectorSet: proc "system" (this: ^IDataCollector, group: ^^IDataCollectorSet) -> HRESULT,
	put_DataCollectorSet: proc "system" (this: ^IDataCollector, group: ^IDataCollectorSet) -> HRESULT,
	get_DataCollectorType: proc "system" (this: ^IDataCollector, type: ^DataCollectorType) -> HRESULT,
	get_FileName: proc "system" (this: ^IDataCollector, name: ^BSTR) -> HRESULT,
	put_FileName: proc "system" (this: ^IDataCollector, name: BSTR) -> HRESULT,
	get_FileNameFormat: proc "system" (this: ^IDataCollector, format: ^AutoPathFormat) -> HRESULT,
	put_FileNameFormat: proc "system" (this: ^IDataCollector, format: AutoPathFormat) -> HRESULT,
	get_FileNameFormatPattern: proc "system" (this: ^IDataCollector, pattern: ^BSTR) -> HRESULT,
	put_FileNameFormatPattern: proc "system" (this: ^IDataCollector, pattern: BSTR) -> HRESULT,
	get_LatestOutputLocation: proc "system" (this: ^IDataCollector, path: ^BSTR) -> HRESULT,
	put_LatestOutputLocation: proc "system" (this: ^IDataCollector, path: BSTR) -> HRESULT,
	get_LogAppend: proc "system" (this: ^IDataCollector, append: ^VARIANT_BOOL) -> HRESULT,
	put_LogAppend: proc "system" (this: ^IDataCollector, append: VARIANT_BOOL) -> HRESULT,
	get_LogCircular: proc "system" (this: ^IDataCollector, circular: ^VARIANT_BOOL) -> HRESULT,
	put_LogCircular: proc "system" (this: ^IDataCollector, circular: VARIANT_BOOL) -> HRESULT,
	get_LogOverwrite: proc "system" (this: ^IDataCollector, overwrite: ^VARIANT_BOOL) -> HRESULT,
	put_LogOverwrite: proc "system" (this: ^IDataCollector, overwrite: VARIANT_BOOL) -> HRESULT,
	get_Name: proc "system" (this: ^IDataCollector, name: ^BSTR) -> HRESULT,
	put_Name: proc "system" (this: ^IDataCollector, name: BSTR) -> HRESULT,
	get_OutputLocation: proc "system" (this: ^IDataCollector, path: ^BSTR) -> HRESULT,
	get_Index: proc "system" (this: ^IDataCollector, index: ^i32) -> HRESULT,
	put_Index: proc "system" (this: ^IDataCollector, index: i32) -> HRESULT,
	get_Xml: proc "system" (this: ^IDataCollector, Xml: ^BSTR) -> HRESULT,
	SetXml: proc "system" (this: ^IDataCollector, Xml: BSTR, Validation: ^^IValueMap) -> HRESULT,
	CreateOutputLocation: proc "system" (this: ^IDataCollector, Latest: VARIANT_BOOL, Location: ^BSTR) -> HRESULT,
}
IID_IDataCollector :: GUID{0x038374FF, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-idatacollectorcollection ]]
IDataCollectorCollection :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IDataCollectorCollection_Vtbl,
}
IDataCollectorCollection_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^IDataCollectorCollection, retVal: ^i32) -> HRESULT,
	get_Item: proc "system" (
		this: ^IDataCollectorCollection,
		index: VARIANT,
		collector: ^^IDataCollector,
	) -> HRESULT,
	get__NewEnum: proc "system" (this: ^IDataCollectorCollection, retVal: ^^IUnknown) -> HRESULT,
	Add: proc "system" (this: ^IDataCollectorCollection, collector: ^IDataCollector) -> HRESULT,
	Remove: proc "system" (this: ^IDataCollectorCollection, collector: VARIANT) -> HRESULT,
	Clear: proc "system" (this: ^IDataCollectorCollection) -> HRESULT,
	AddRange: proc "system" (this: ^IDataCollectorCollection, collectors: ^IDataCollectorCollection) -> HRESULT,
	CreateDataCollectorFromXml: proc "system" (
		this: ^IDataCollectorCollection,
		bstrXml: BSTR,
		pValidation: ^^IValueMap,
		pCollector: ^^IDataCollector,
	) -> HRESULT,
	CreateDataCollector: proc "system" (
		this: ^IDataCollectorCollection,
		Type: DataCollectorType,
		Collector: ^^IDataCollector,
	) -> HRESULT,
}
IID_IDataCollectorCollection :: GUID{0x03837502, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-idatacollectorset ]]
IDataCollectorSet :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IDataCollectorSet_Vtbl,
}
IDataCollectorSet_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_DataCollectors: proc "system" (this: ^IDataCollectorSet, collectors: ^^IDataCollectorCollection) -> HRESULT,
	get_Duration: proc "system" (this: ^IDataCollectorSet, seconds: ^u32) -> HRESULT,
	put_Duration: proc "system" (this: ^IDataCollectorSet, seconds: u32) -> HRESULT,
	get_Description: proc "system" (this: ^IDataCollectorSet, description: ^BSTR) -> HRESULT,
	put_Description: proc "system" (this: ^IDataCollectorSet, description: BSTR) -> HRESULT,
	get_DescriptionUnresolved: proc "system" (this: ^IDataCollectorSet, Descr: ^BSTR) -> HRESULT,
	get_DisplayName: proc "system" (this: ^IDataCollectorSet, DisplayName: ^BSTR) -> HRESULT,
	put_DisplayName: proc "system" (this: ^IDataCollectorSet, DisplayName: BSTR) -> HRESULT,
	get_DisplayNameUnresolved: proc "system" (this: ^IDataCollectorSet, name: ^BSTR) -> HRESULT,
	get_Keywords: proc "system" (this: ^IDataCollectorSet, keywords: ^SAFEARRAY) -> HRESULT,
	put_Keywords: proc "system" (this: ^IDataCollectorSet, keywords: ^SAFEARRAY) -> HRESULT,
	get_LatestOutputLocation: proc "system" (this: ^IDataCollectorSet, path: ^BSTR) -> HRESULT,
	put_LatestOutputLocation: proc "system" (this: ^IDataCollectorSet, path: BSTR) -> HRESULT,
	get_Name: proc "system" (this: ^IDataCollectorSet, name: ^BSTR) -> HRESULT,
	get_OutputLocation: proc "system" (this: ^IDataCollectorSet, path: ^BSTR) -> HRESULT,
	get_RootPath: proc "system" (this: ^IDataCollectorSet, folder: ^BSTR) -> HRESULT,
	put_RootPath: proc "system" (this: ^IDataCollectorSet, folder: BSTR) -> HRESULT,
	get_Segment: proc "system" (this: ^IDataCollectorSet, segment: ^VARIANT_BOOL) -> HRESULT,
	put_Segment: proc "system" (this: ^IDataCollectorSet, segment: VARIANT_BOOL) -> HRESULT,
	get_SegmentMaxDuration: proc "system" (this: ^IDataCollectorSet, seconds: ^u32) -> HRESULT,
	put_SegmentMaxDuration: proc "system" (this: ^IDataCollectorSet, seconds: u32) -> HRESULT,
	get_SegmentMaxSize: proc "system" (this: ^IDataCollectorSet, size: ^u32) -> HRESULT,
	put_SegmentMaxSize: proc "system" (this: ^IDataCollectorSet, size: u32) -> HRESULT,
	get_SerialNumber: proc "system" (this: ^IDataCollectorSet, index: ^u32) -> HRESULT,
	put_SerialNumber: proc "system" (this: ^IDataCollectorSet, index: u32) -> HRESULT,
	get_Server: proc "system" (this: ^IDataCollectorSet, server: ^BSTR) -> HRESULT,
	get_Status: proc "system" (this: ^IDataCollectorSet, status: ^DataCollectorSetStatus) -> HRESULT,
	get_Subdirectory: proc "system" (this: ^IDataCollectorSet, folder: ^BSTR) -> HRESULT,
	put_Subdirectory: proc "system" (this: ^IDataCollectorSet, folder: BSTR) -> HRESULT,
	get_SubdirectoryFormat: proc "system" (this: ^IDataCollectorSet, format: ^AutoPathFormat) -> HRESULT,
	put_SubdirectoryFormat: proc "system" (this: ^IDataCollectorSet, format: AutoPathFormat) -> HRESULT,
	get_SubdirectoryFormatPattern: proc "system" (this: ^IDataCollectorSet, pattern: ^BSTR) -> HRESULT,
	put_SubdirectoryFormatPattern: proc "system" (this: ^IDataCollectorSet, pattern: BSTR) -> HRESULT,
	get_Task: proc "system" (this: ^IDataCollectorSet, task: ^BSTR) -> HRESULT,
	put_Task: proc "system" (this: ^IDataCollectorSet, task: BSTR) -> HRESULT,
	get_TaskRunAsSelf: proc "system" (this: ^IDataCollectorSet, RunAsSelf: ^VARIANT_BOOL) -> HRESULT,
	put_TaskRunAsSelf: proc "system" (this: ^IDataCollectorSet, RunAsSelf: VARIANT_BOOL) -> HRESULT,
	get_TaskArguments: proc "system" (this: ^IDataCollectorSet, task: ^BSTR) -> HRESULT,
	put_TaskArguments: proc "system" (this: ^IDataCollectorSet, task: BSTR) -> HRESULT,
	get_TaskUserTextArguments: proc "system" (this: ^IDataCollectorSet, UserText: ^BSTR) -> HRESULT,
	put_TaskUserTextArguments: proc "system" (this: ^IDataCollectorSet, UserText: BSTR) -> HRESULT,
	get_Schedules: proc "system" (this: ^IDataCollectorSet, ppSchedules: ^^IScheduleCollection) -> HRESULT,
	get_SchedulesEnabled: proc "system" (this: ^IDataCollectorSet, enabled: ^VARIANT_BOOL) -> HRESULT,
	put_SchedulesEnabled: proc "system" (this: ^IDataCollectorSet, enabled: VARIANT_BOOL) -> HRESULT,
	get_UserAccount: proc "system" (this: ^IDataCollectorSet, user: ^BSTR) -> HRESULT,
	get_Xml: proc "system" (this: ^IDataCollectorSet, xml: ^BSTR) -> HRESULT,
	get_Security: proc "system" (this: ^IDataCollectorSet, pbstrSecurity: ^BSTR) -> HRESULT,
	put_Security: proc "system" (this: ^IDataCollectorSet, bstrSecurity: BSTR) -> HRESULT,
	get_StopOnCompletion: proc "system" (this: ^IDataCollectorSet, Stop: ^VARIANT_BOOL) -> HRESULT,
	put_StopOnCompletion: proc "system" (this: ^IDataCollectorSet, Stop: VARIANT_BOOL) -> HRESULT,
	get_DataManager: proc "system" (this: ^IDataCollectorSet, DataManager: ^^IDataManager) -> HRESULT,
	SetCredentials: proc "system" (this: ^IDataCollectorSet, user: BSTR, password: BSTR) -> HRESULT,
	Query: proc "system" (this: ^IDataCollectorSet, name: BSTR, server: BSTR) -> HRESULT,
	Commit: proc "system" (
		this: ^IDataCollectorSet,
		name: BSTR,
		server: BSTR,
		mode: CommitMode,
		validation: ^^IValueMap,
	) -> HRESULT,
	Delete: proc "system" (this: ^IDataCollectorSet) -> HRESULT,
	Start: proc "system" (this: ^IDataCollectorSet, Synchronous: VARIANT_BOOL) -> HRESULT,
	Stop: proc "system" (this: ^IDataCollectorSet, Synchronous: VARIANT_BOOL) -> HRESULT,
	SetXml: proc "system" (this: ^IDataCollectorSet, xml: BSTR, validation: ^^IValueMap) -> HRESULT,
	SetValue: proc "system" (this: ^IDataCollectorSet, key: BSTR, value: BSTR) -> HRESULT,
	GetValue: proc "system" (this: ^IDataCollectorSet, key: BSTR, value: ^BSTR) -> HRESULT,
}
IID_IDataCollectorSet :: GUID{0x03837520, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-idatacollectorsetcollection ]]
IDataCollectorSetCollection :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IDataCollectorSetCollection_Vtbl,
}
IDataCollectorSetCollection_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^IDataCollectorSetCollection, retVal: ^i32) -> HRESULT,
	get_Item: proc "system" (
		this: ^IDataCollectorSetCollection,
		index: VARIANT,
		set: ^^IDataCollectorSet,
	) -> HRESULT,
	get__NewEnum: proc "system" (this: ^IDataCollectorSetCollection, retVal: ^^IUnknown) -> HRESULT,
	Add: proc "system" (this: ^IDataCollectorSetCollection, set: ^IDataCollectorSet) -> HRESULT,
	Remove: proc "system" (this: ^IDataCollectorSetCollection, set: VARIANT) -> HRESULT,
	Clear: proc "system" (this: ^IDataCollectorSetCollection) -> HRESULT,
	AddRange: proc "system" (this: ^IDataCollectorSetCollection, sets: ^IDataCollectorSetCollection) -> HRESULT,
	GetDataCollectorSets: proc "system" (this: ^IDataCollectorSetCollection, server: BSTR, filter: BSTR) -> HRESULT,
}
IID_IDataCollectorSetCollection :: GUID{0x03837524, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-idatamanager ]]
IDataManager :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IDataManager_Vtbl,
}
IDataManager_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Enabled: proc "system" (this: ^IDataManager, pfEnabled: ^VARIANT_BOOL) -> HRESULT,
	put_Enabled: proc "system" (this: ^IDataManager, fEnabled: VARIANT_BOOL) -> HRESULT,
	get_CheckBeforeRunning: proc "system" (this: ^IDataManager, pfCheck: ^VARIANT_BOOL) -> HRESULT,
	put_CheckBeforeRunning: proc "system" (this: ^IDataManager, fCheck: VARIANT_BOOL) -> HRESULT,
	get_MinFreeDisk: proc "system" (this: ^IDataManager, MinFreeDisk: ^u32) -> HRESULT,
	put_MinFreeDisk: proc "system" (this: ^IDataManager, MinFreeDisk: u32) -> HRESULT,
	get_MaxSize: proc "system" (this: ^IDataManager, pulMaxSize: ^u32) -> HRESULT,
	put_MaxSize: proc "system" (this: ^IDataManager, ulMaxSize: u32) -> HRESULT,
	get_MaxFolderCount: proc "system" (this: ^IDataManager, pulMaxFolderCount: ^u32) -> HRESULT,
	put_MaxFolderCount: proc "system" (this: ^IDataManager, ulMaxFolderCount: u32) -> HRESULT,
	get_ResourcePolicy: proc "system" (this: ^IDataManager, pPolicy: ^ResourcePolicy) -> HRESULT,
	put_ResourcePolicy: proc "system" (this: ^IDataManager, Policy: ResourcePolicy) -> HRESULT,
	get_FolderActions: proc "system" (this: ^IDataManager, Actions: ^^IFolderActionCollection) -> HRESULT,
	get_ReportSchema: proc "system" (this: ^IDataManager, ReportSchema: ^BSTR) -> HRESULT,
	put_ReportSchema: proc "system" (this: ^IDataManager, ReportSchema: BSTR) -> HRESULT,
	get_ReportFileName: proc "system" (this: ^IDataManager, pbstrFilename: ^BSTR) -> HRESULT,
	put_ReportFileName: proc "system" (this: ^IDataManager, pbstrFilename: BSTR) -> HRESULT,
	get_RuleTargetFileName: proc "system" (this: ^IDataManager, Filename: ^BSTR) -> HRESULT,
	put_RuleTargetFileName: proc "system" (this: ^IDataManager, Filename: BSTR) -> HRESULT,
	get_EventsFileName: proc "system" (this: ^IDataManager, pbstrFilename: ^BSTR) -> HRESULT,
	put_EventsFileName: proc "system" (this: ^IDataManager, pbstrFilename: BSTR) -> HRESULT,
	get_Rules: proc "system" (this: ^IDataManager, pbstrXml: ^BSTR) -> HRESULT,
	put_Rules: proc "system" (this: ^IDataManager, bstrXml: BSTR) -> HRESULT,
	Run: proc "system" (
		this: ^IDataManager,
		Steps: DataManagerSteps,
		bstrFolder: BSTR,
		Errors: ^^IValueMap,
	) -> HRESULT,
	Extract: proc "system" (this: ^IDataManager, CabFilename: BSTR, DestinationPath: BSTR) -> HRESULT,
}
IID_IDataManager :: GUID{0x03837541, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ifolderaction ]]
IFolderAction :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IFolderAction_Vtbl,
}
IFolderAction_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Age: proc "system" (this: ^IFolderAction, pulAge: ^u32) -> HRESULT,
	put_Age: proc "system" (this: ^IFolderAction, ulAge: u32) -> HRESULT,
	get_Size: proc "system" (this: ^IFolderAction, pulAge: ^u32) -> HRESULT,
	put_Size: proc "system" (this: ^IFolderAction, ulAge: u32) -> HRESULT,
	get_Actions: proc "system" (this: ^IFolderAction, Steps: ^FolderActionSteps) -> HRESULT,
	put_Actions: proc "system" (this: ^IFolderAction, Steps: FolderActionSteps) -> HRESULT,
	get_SendCabTo: proc "system" (this: ^IFolderAction, pbstrDestination: ^BSTR) -> HRESULT,
	put_SendCabTo: proc "system" (this: ^IFolderAction, bstrDestination: BSTR) -> HRESULT,
}
IID_IFolderAction :: GUID{0x03837543, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ifolderactioncollection ]]
IFolderActionCollection :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IFolderActionCollection_Vtbl,
}
IFolderActionCollection_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^IFolderActionCollection, Count: ^u32) -> HRESULT,
	get_Item: proc "system" (this: ^IFolderActionCollection, Index: VARIANT, Action: ^^IFolderAction) -> HRESULT,
	get__NewEnum: proc "system" (this: ^IFolderActionCollection, Enum: ^^IUnknown) -> HRESULT,
	Add: proc "system" (this: ^IFolderActionCollection, Action: ^IFolderAction) -> HRESULT,
	Remove: proc "system" (this: ^IFolderActionCollection, Index: VARIANT) -> HRESULT,
	Clear: proc "system" (this: ^IFolderActionCollection) -> HRESULT,
	AddRange: proc "system" (this: ^IFolderActionCollection, Actions: ^IFolderActionCollection) -> HRESULT,
	CreateFolderAction: proc "system" (this: ^IFolderActionCollection, FolderAction: ^^IFolderAction) -> HRESULT,
}
IID_IFolderActionCollection :: GUID{0x03837544, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

ILogFileItem :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ILogFileItem_Vtbl,
}
ILogFileItem_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_Path: proc "system" (this: ^ILogFileItem, pstrValue: ^BSTR) -> HRESULT,
}
IID_ILogFileItem :: GUID{0xD6B518DD, 0x05C7, 0x418A, {0x89, 0xE6, 0x4F, 0x9C, 0xE8, 0xC6, 0x84, 0x1E}}

ILogFiles :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^ILogFiles_Vtbl,
}
ILogFiles_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^ILogFiles, pLong: ^i32) -> HRESULT,
	get__NewEnum: proc "system" (this: ^ILogFiles, ppIunk: ^^IUnknown) -> HRESULT,
	get_Item: proc "system" (this: ^ILogFiles, index: VARIANT, ppI: ^^DILogFileItem) -> HRESULT,
	Add: proc "system" (this: ^ILogFiles, pathname: BSTR, ppI: ^^DILogFileItem) -> HRESULT,
	Remove: proc "system" (this: ^ILogFiles, index: VARIANT) -> HRESULT,
}
IID_ILogFiles :: GUID{0x6A2A97E6, 0x6851, 0x41EA, {0x87, 0xAD, 0x2A, 0x82, 0x25, 0x33, 0x58, 0x65}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-iperformancecounterdatacollector ]]
IPerformanceCounterDataCollector :: struct #raw_union {
	#subtype IDataCollector: IDataCollector,
	using Vtbl: ^IPerformanceCounterDataCollector_Vtbl,
}
IPerformanceCounterDataCollector_Vtbl :: struct {
	using IDataCollector_Vtbl: IDataCollector_Vtbl,
	get_DataSourceName: proc "system" (this: ^IPerformanceCounterDataCollector, dsn: ^BSTR) -> HRESULT,
	put_DataSourceName: proc "system" (this: ^IPerformanceCounterDataCollector, dsn: BSTR) -> HRESULT,
	get_PerformanceCounters: proc "system" (this: ^IPerformanceCounterDataCollector, counters: ^SAFEARRAY) -> HRESULT,
	put_PerformanceCounters: proc "system" (this: ^IPerformanceCounterDataCollector, counters: ^SAFEARRAY) -> HRESULT,
	get_LogFileFormat: proc "system" (this: ^IPerformanceCounterDataCollector, format: ^FileFormat) -> HRESULT,
	put_LogFileFormat: proc "system" (this: ^IPerformanceCounterDataCollector, format: FileFormat) -> HRESULT,
	get_SampleInterval: proc "system" (this: ^IPerformanceCounterDataCollector, interval: ^u32) -> HRESULT,
	put_SampleInterval: proc "system" (this: ^IPerformanceCounterDataCollector, interval: u32) -> HRESULT,
	get_SegmentMaxRecords: proc "system" (this: ^IPerformanceCounterDataCollector, records: ^u32) -> HRESULT,
	put_SegmentMaxRecords: proc "system" (this: ^IPerformanceCounterDataCollector, records: u32) -> HRESULT,
}
IID_IPerformanceCounterDataCollector :: GUID{0x03837506, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ischedule ]]
ISchedule :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^ISchedule_Vtbl,
}
ISchedule_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_StartDate: proc "system" (this: ^ISchedule, start: ^VARIANT) -> HRESULT,
	put_StartDate: proc "system" (this: ^ISchedule, start: VARIANT) -> HRESULT,
	get_EndDate: proc "system" (this: ^ISchedule, end: ^VARIANT) -> HRESULT,
	put_EndDate: proc "system" (this: ^ISchedule, end: VARIANT) -> HRESULT,
	get_StartTime: proc "system" (this: ^ISchedule, start: ^VARIANT) -> HRESULT,
	put_StartTime: proc "system" (this: ^ISchedule, start: VARIANT) -> HRESULT,
	get_Days: proc "system" (this: ^ISchedule, days: ^WeekDays) -> HRESULT,
	put_Days: proc "system" (this: ^ISchedule, days: WeekDays) -> HRESULT,
}
IID_ISchedule :: GUID{0x0383753A, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ischedulecollection ]]
IScheduleCollection :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IScheduleCollection_Vtbl,
}
IScheduleCollection_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^IScheduleCollection, retVal: ^i32) -> HRESULT,
	get_Item: proc "system" (this: ^IScheduleCollection, index: VARIANT, ppSchedule: ^^ISchedule) -> HRESULT,
	get__NewEnum: proc "system" (this: ^IScheduleCollection, ienum: ^^IUnknown) -> HRESULT,
	Add: proc "system" (this: ^IScheduleCollection, pSchedule: ^ISchedule) -> HRESULT,
	Remove: proc "system" (this: ^IScheduleCollection, vSchedule: VARIANT) -> HRESULT,
	Clear: proc "system" (this: ^IScheduleCollection) -> HRESULT,
	AddRange: proc "system" (this: ^IScheduleCollection, pSchedules: ^IScheduleCollection) -> HRESULT,
	CreateSchedule: proc "system" (this: ^IScheduleCollection, Schedule: ^^ISchedule) -> HRESULT,
}
IID_IScheduleCollection :: GUID{0x0383753D, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

ISystemMonitor :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISystemMonitor_Vtbl,
}
ISystemMonitor_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_Appearance: proc "system" (this: ^ISystemMonitor, iAppearance: ^i32) -> HRESULT,
	put_Appearance: proc "system" (this: ^ISystemMonitor, iAppearance: i32) -> HRESULT,
	get_BackColor: proc "system" (this: ^ISystemMonitor, pColor: ^u32) -> HRESULT,
	put_BackColor: proc "system" (this: ^ISystemMonitor, Color: u32) -> HRESULT,
	get_BorderStyle: proc "system" (this: ^ISystemMonitor, iBorderStyle: ^i32) -> HRESULT,
	put_BorderStyle: proc "system" (this: ^ISystemMonitor, iBorderStyle: i32) -> HRESULT,
	get_ForeColor: proc "system" (this: ^ISystemMonitor, pColor: ^u32) -> HRESULT,
	put_ForeColor: proc "system" (this: ^ISystemMonitor, Color: u32) -> HRESULT,
	get_Font: proc "system" (this: ^ISystemMonitor, ppFont: ^^IFontDisp) -> HRESULT,
	putref_Font: proc "system" (this: ^ISystemMonitor, pFont: ^IFontDisp) -> HRESULT,
	get_Counters: proc "system" (this: ^ISystemMonitor, ppICounters: ^^ICounters) -> HRESULT,
	put_ShowVerticalGrid: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowVerticalGrid: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowHorizontalGrid: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowHorizontalGrid: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowLegend: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowLegend: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowScaleLabels: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowScaleLabels: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowValueBar: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowValueBar: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_MaximumScale: proc "system" (this: ^ISystemMonitor, iValue: i32) -> HRESULT,
	get_MaximumScale: proc "system" (this: ^ISystemMonitor, piValue: ^i32) -> HRESULT,
	put_MinimumScale: proc "system" (this: ^ISystemMonitor, iValue: i32) -> HRESULT,
	get_MinimumScale: proc "system" (this: ^ISystemMonitor, piValue: ^i32) -> HRESULT,
	put_UpdateInterval: proc "system" (this: ^ISystemMonitor, fValue: f32) -> HRESULT,
	get_UpdateInterval: proc "system" (this: ^ISystemMonitor, pfValue: ^f32) -> HRESULT,
	put_DisplayType: proc "system" (this: ^ISystemMonitor, eDisplayType: DisplayTypeConstants) -> HRESULT,
	get_DisplayType: proc "system" (this: ^ISystemMonitor, peDisplayType: ^DisplayTypeConstants) -> HRESULT,
	put_ManualUpdate: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_ManualUpdate: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_GraphTitle: proc "system" (this: ^ISystemMonitor, bsTitle: BSTR) -> HRESULT,
	get_GraphTitle: proc "system" (this: ^ISystemMonitor, pbsTitle: ^BSTR) -> HRESULT,
	put_YAxisLabel: proc "system" (this: ^ISystemMonitor, bsTitle: BSTR) -> HRESULT,
	get_YAxisLabel: proc "system" (this: ^ISystemMonitor, pbsTitle: ^BSTR) -> HRESULT,
	CollectSample: proc "system" (this: ^ISystemMonitor) -> HRESULT,
	UpdateGraph: proc "system" (this: ^ISystemMonitor) -> HRESULT,
	BrowseCounters: proc "system" (this: ^ISystemMonitor) -> HRESULT,
	DisplayProperties: proc "system" (this: ^ISystemMonitor) -> HRESULT,
	Counter: proc "system" (this: ^ISystemMonitor, iIndex: i32, ppICounter: ^^ICounterItem) -> HRESULT,
	AddCounter: proc "system" (this: ^ISystemMonitor, bsPath: BSTR, ppICounter: ^^ICounterItem) -> HRESULT,
	DeleteCounter: proc "system" (this: ^ISystemMonitor, pCtr: ^ICounterItem) -> HRESULT,
	get_BackColorCtl: proc "system" (this: ^ISystemMonitor, pColor: ^u32) -> HRESULT,
	put_BackColorCtl: proc "system" (this: ^ISystemMonitor, Color: u32) -> HRESULT,
	put_LogFileName: proc "system" (this: ^ISystemMonitor, bsFileName: BSTR) -> HRESULT,
	get_LogFileName: proc "system" (this: ^ISystemMonitor, bsFileName: ^BSTR) -> HRESULT,
	put_LogViewStart: proc "system" (this: ^ISystemMonitor, StartTime: f64) -> HRESULT,
	get_LogViewStart: proc "system" (this: ^ISystemMonitor, StartTime: ^f64) -> HRESULT,
	put_LogViewStop: proc "system" (this: ^ISystemMonitor, StopTime: f64) -> HRESULT,
	get_LogViewStop: proc "system" (this: ^ISystemMonitor, StopTime: ^f64) -> HRESULT,
	get_GridColor: proc "system" (this: ^ISystemMonitor, pColor: ^u32) -> HRESULT,
	put_GridColor: proc "system" (this: ^ISystemMonitor, Color: u32) -> HRESULT,
	get_TimeBarColor: proc "system" (this: ^ISystemMonitor, pColor: ^u32) -> HRESULT,
	put_TimeBarColor: proc "system" (this: ^ISystemMonitor, Color: u32) -> HRESULT,
	get_Highlight: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_Highlight: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowToolbar: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowToolbar: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	Paste: proc "system" (this: ^ISystemMonitor) -> HRESULT,
	Copy: proc "system" (this: ^ISystemMonitor) -> HRESULT,
	Reset: proc "system" (this: ^ISystemMonitor) -> HRESULT,
	put_ReadOnly: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_ReadOnly: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ReportValueType: proc "system" (this: ^ISystemMonitor, eReportValueType: ReportValueTypeConstants) -> HRESULT,
	get_ReportValueType: proc "system" (this: ^ISystemMonitor, peReportValueType: ^ReportValueTypeConstants) -> HRESULT,
	put_MonitorDuplicateInstances: proc "system" (this: ^ISystemMonitor, bState: VARIANT_BOOL) -> HRESULT,
	get_MonitorDuplicateInstances: proc "system" (this: ^ISystemMonitor, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_DisplayFilter: proc "system" (this: ^ISystemMonitor, iValue: i32) -> HRESULT,
	get_DisplayFilter: proc "system" (this: ^ISystemMonitor, piValue: ^i32) -> HRESULT,
	get_LogFiles: proc "system" (this: ^ISystemMonitor, ppILogFiles: ^^ILogFiles) -> HRESULT,
	put_DataSourceType: proc "system" (this: ^ISystemMonitor, eDataSourceType: DataSourceTypeConstants) -> HRESULT,
	get_DataSourceType: proc "system" (this: ^ISystemMonitor, peDataSourceType: ^DataSourceTypeConstants) -> HRESULT,
	put_SqlDsnName: proc "system" (this: ^ISystemMonitor, bsSqlDsnName: BSTR) -> HRESULT,
	get_SqlDsnName: proc "system" (this: ^ISystemMonitor, bsSqlDsnName: ^BSTR) -> HRESULT,
	put_SqlLogSetName: proc "system" (this: ^ISystemMonitor, bsSqlLogSetName: BSTR) -> HRESULT,
	get_SqlLogSetName: proc "system" (this: ^ISystemMonitor, bsSqlLogSetName: ^BSTR) -> HRESULT,
}
IID_ISystemMonitor :: GUID{0x194EB241, 0xC32C, 0x11CF, {0x93, 0x98, 0x00, 0xAA, 0x00, 0xA3, 0xDD, 0xEA}}

ISystemMonitor2 :: struct #raw_union {
	#subtype ISystemMonitor: ISystemMonitor,
	using Vtbl: ^ISystemMonitor2_Vtbl,
}
ISystemMonitor2_Vtbl :: struct {
	using ISystemMonitor_Vtbl: ISystemMonitor_Vtbl,
	put_EnableDigitGrouping: proc "system" (this: ^ISystemMonitor2, bState: VARIANT_BOOL) -> HRESULT,
	get_EnableDigitGrouping: proc "system" (this: ^ISystemMonitor2, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_EnableToolTips: proc "system" (this: ^ISystemMonitor2, bState: VARIANT_BOOL) -> HRESULT,
	get_EnableToolTips: proc "system" (this: ^ISystemMonitor2, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ShowTimeAxisLabels: proc "system" (this: ^ISystemMonitor2, bState: VARIANT_BOOL) -> HRESULT,
	get_ShowTimeAxisLabels: proc "system" (this: ^ISystemMonitor2, pbState: ^VARIANT_BOOL) -> HRESULT,
	put_ChartScroll: proc "system" (this: ^ISystemMonitor2, bScroll: VARIANT_BOOL) -> HRESULT,
	get_ChartScroll: proc "system" (this: ^ISystemMonitor2, pbScroll: ^VARIANT_BOOL) -> HRESULT,
	put_DataPointCount: proc "system" (this: ^ISystemMonitor2, iNewCount: i32) -> HRESULT,
	get_DataPointCount: proc "system" (this: ^ISystemMonitor2, piDataPointCount: ^i32) -> HRESULT,
	ScaleToFit: proc "system" (this: ^ISystemMonitor2, bSelectedCountersOnly: VARIANT_BOOL) -> HRESULT,
	SaveAs: proc "system" (
		this: ^ISystemMonitor2,
		bstrFileName: BSTR,
		eSysmonFileType: SysmonFileType,
	) -> HRESULT,
	Relog: proc "system" (
		this: ^ISystemMonitor2,
		bstrFileName: BSTR,
		eSysmonFileType: SysmonFileType,
		iFilter: i32,
	) -> HRESULT,
	ClearData: proc "system" (this: ^ISystemMonitor2) -> HRESULT,
	get_LogSourceStartTime: proc "system" (this: ^ISystemMonitor2, pDate: ^f64) -> HRESULT,
	get_LogSourceStopTime: proc "system" (this: ^ISystemMonitor2, pDate: ^f64) -> HRESULT,
	SetLogViewRange: proc "system" (this: ^ISystemMonitor2, StartTime: f64, StopTime: f64) -> HRESULT,
	GetLogViewRange: proc "system" (this: ^ISystemMonitor2, StartTime: ^f64, StopTime: ^f64) -> HRESULT,
	BatchingLock: proc "system" (
		this: ^ISystemMonitor2,
		fLock: VARIANT_BOOL,
		eBatchReason: SysmonBatchReason,
	) -> HRESULT,
	LoadSettings: proc "system" (this: ^ISystemMonitor2, bstrSettingFileName: BSTR) -> HRESULT,
}
IID_ISystemMonitor2 :: GUID{0x08E3206A, 0x5FD2, 0x4FDE, {0xA8, 0xA5, 0x8C, 0xB3, 0xB6, 0x3D, 0x26, 0x77}}

ISystemMonitorEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISystemMonitorEvents_Vtbl,
}
ISystemMonitorEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnCounterSelected: proc "system" (this: ^ISystemMonitorEvents, Index: i32),
	OnCounterAdded: proc "system" (this: ^ISystemMonitorEvents, Index: i32),
	OnCounterDeleted: proc "system" (this: ^ISystemMonitorEvents, Index: i32),
	OnSampleCollected: proc "system" (this: ^ISystemMonitorEvents),
	OnDblClick: proc "system" (this: ^ISystemMonitorEvents, Index: i32),
}
IID_ISystemMonitorEvents :: GUID{0xEE660EA0, 0x4ABD, 0x11CF, {0x94, 0x3A, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-itracedatacollector ]]
ITraceDataCollector :: struct #raw_union {
	#subtype IDataCollector: IDataCollector,
	using Vtbl: ^ITraceDataCollector_Vtbl,
}
ITraceDataCollector_Vtbl :: struct {
	using IDataCollector_Vtbl: IDataCollector_Vtbl,
	get_BufferSize: proc "system" (this: ^ITraceDataCollector, size: ^u32) -> HRESULT,
	put_BufferSize: proc "system" (this: ^ITraceDataCollector, size: u32) -> HRESULT,
	get_BuffersLost: proc "system" (this: ^ITraceDataCollector, buffers: ^u32) -> HRESULT,
	put_BuffersLost: proc "system" (this: ^ITraceDataCollector, buffers: u32) -> HRESULT,
	get_BuffersWritten: proc "system" (this: ^ITraceDataCollector, buffers: ^u32) -> HRESULT,
	put_BuffersWritten: proc "system" (this: ^ITraceDataCollector, buffers: u32) -> HRESULT,
	get_ClockType: proc "system" (this: ^ITraceDataCollector, clock: ^ClockType) -> HRESULT,
	put_ClockType: proc "system" (this: ^ITraceDataCollector, clock: ClockType) -> HRESULT,
	get_EventsLost: proc "system" (this: ^ITraceDataCollector, events: ^u32) -> HRESULT,
	put_EventsLost: proc "system" (this: ^ITraceDataCollector, events: u32) -> HRESULT,
	get_ExtendedModes: proc "system" (this: ^ITraceDataCollector, mode: ^u32) -> HRESULT,
	put_ExtendedModes: proc "system" (this: ^ITraceDataCollector, mode: u32) -> HRESULT,
	get_FlushTimer: proc "system" (this: ^ITraceDataCollector, seconds: ^u32) -> HRESULT,
	put_FlushTimer: proc "system" (this: ^ITraceDataCollector, seconds: u32) -> HRESULT,
	get_FreeBuffers: proc "system" (this: ^ITraceDataCollector, buffers: ^u32) -> HRESULT,
	put_FreeBuffers: proc "system" (this: ^ITraceDataCollector, buffers: u32) -> HRESULT,
	get_Guid: proc "system" (this: ^ITraceDataCollector, guid: ^GUID) -> HRESULT,
	put_Guid: proc "system" (this: ^ITraceDataCollector, guid: GUID) -> HRESULT,
	get_IsKernelTrace: proc "system" (this: ^ITraceDataCollector, kernel: ^VARIANT_BOOL) -> HRESULT,
	get_MaximumBuffers: proc "system" (this: ^ITraceDataCollector, buffers: ^u32) -> HRESULT,
	put_MaximumBuffers: proc "system" (this: ^ITraceDataCollector, buffers: u32) -> HRESULT,
	get_MinimumBuffers: proc "system" (this: ^ITraceDataCollector, buffers: ^u32) -> HRESULT,
	put_MinimumBuffers: proc "system" (this: ^ITraceDataCollector, buffers: u32) -> HRESULT,
	get_NumberOfBuffers: proc "system" (this: ^ITraceDataCollector, buffers: ^u32) -> HRESULT,
	put_NumberOfBuffers: proc "system" (this: ^ITraceDataCollector, buffers: u32) -> HRESULT,
	get_PreallocateFile: proc "system" (this: ^ITraceDataCollector, allocate: ^VARIANT_BOOL) -> HRESULT,
	put_PreallocateFile: proc "system" (this: ^ITraceDataCollector, allocate: VARIANT_BOOL) -> HRESULT,
	get_ProcessMode: proc "system" (this: ^ITraceDataCollector, process: ^VARIANT_BOOL) -> HRESULT,
	put_ProcessMode: proc "system" (this: ^ITraceDataCollector, process: VARIANT_BOOL) -> HRESULT,
	get_RealTimeBuffersLost: proc "system" (this: ^ITraceDataCollector, buffers: ^u32) -> HRESULT,
	put_RealTimeBuffersLost: proc "system" (this: ^ITraceDataCollector, buffers: u32) -> HRESULT,
	get_SessionId: proc "system" (this: ^ITraceDataCollector, id: ^u64) -> HRESULT,
	put_SessionId: proc "system" (this: ^ITraceDataCollector, id: u64) -> HRESULT,
	get_SessionName: proc "system" (this: ^ITraceDataCollector, name: ^BSTR) -> HRESULT,
	put_SessionName: proc "system" (this: ^ITraceDataCollector, name: BSTR) -> HRESULT,
	get_SessionThreadId: proc "system" (this: ^ITraceDataCollector, tid: ^u32) -> HRESULT,
	put_SessionThreadId: proc "system" (this: ^ITraceDataCollector, tid: u32) -> HRESULT,
	get_StreamMode: proc "system" (this: ^ITraceDataCollector, mode: ^StreamMode) -> HRESULT,
	put_StreamMode: proc "system" (this: ^ITraceDataCollector, mode: StreamMode) -> HRESULT,
	get_TraceDataProviders: proc "system" (this: ^ITraceDataCollector, providers: ^^ITraceDataProviderCollection) -> HRESULT,
}
IID_ITraceDataCollector :: GUID{0x0383750B, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-itracedataprovider ]]
ITraceDataProvider :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^ITraceDataProvider_Vtbl,
}
ITraceDataProvider_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_DisplayName: proc "system" (this: ^ITraceDataProvider, name: ^BSTR) -> HRESULT,
	put_DisplayName: proc "system" (this: ^ITraceDataProvider, name: BSTR) -> HRESULT,
	get_Guid: proc "system" (this: ^ITraceDataProvider, guid: ^GUID) -> HRESULT,
	put_Guid: proc "system" (this: ^ITraceDataProvider, guid: GUID) -> HRESULT,
	get_Level: proc "system" (this: ^ITraceDataProvider, ppLevel: ^^IValueMap) -> HRESULT,
	get_KeywordsAny: proc "system" (this: ^ITraceDataProvider, ppKeywords: ^^IValueMap) -> HRESULT,
	get_KeywordsAll: proc "system" (this: ^ITraceDataProvider, ppKeywords: ^^IValueMap) -> HRESULT,
	get_Properties: proc "system" (this: ^ITraceDataProvider, ppProperties: ^^IValueMap) -> HRESULT,
	get_FilterEnabled: proc "system" (this: ^ITraceDataProvider, FilterEnabled: ^VARIANT_BOOL) -> HRESULT,
	put_FilterEnabled: proc "system" (this: ^ITraceDataProvider, FilterEnabled: VARIANT_BOOL) -> HRESULT,
	get_FilterType: proc "system" (this: ^ITraceDataProvider, pulType: ^u32) -> HRESULT,
	put_FilterType: proc "system" (this: ^ITraceDataProvider, ulType: u32) -> HRESULT,
	get_FilterData: proc "system" (this: ^ITraceDataProvider, ppData: ^SAFEARRAY) -> HRESULT,
	put_FilterData: proc "system" (this: ^ITraceDataProvider, pData: ^SAFEARRAY) -> HRESULT,
	Query: proc "system" (this: ^ITraceDataProvider, bstrName: BSTR, bstrServer: BSTR) -> HRESULT,
	Resolve: proc "system" (this: ^ITraceDataProvider, pFrom: ^IDispatch) -> HRESULT,
	SetSecurity: proc "system" (this: ^ITraceDataProvider, Sddl: BSTR) -> HRESULT,
	GetSecurity: proc "system" (this: ^ITraceDataProvider, SecurityInfo: u32, Sddl: ^BSTR) -> HRESULT,
	GetRegisteredProcesses: proc "system" (this: ^ITraceDataProvider, Processes: ^^IValueMap) -> HRESULT,
}
IID_ITraceDataProvider :: GUID{0x03837512, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-itracedataprovidercollection ]]
ITraceDataProviderCollection :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^ITraceDataProviderCollection_Vtbl,
}
ITraceDataProviderCollection_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^ITraceDataProviderCollection, retVal: ^i32) -> HRESULT,
	get_Item: proc "system" (
		this: ^ITraceDataProviderCollection,
		index: VARIANT,
		ppProvider: ^^ITraceDataProvider,
	) -> HRESULT,
	get__NewEnum: proc "system" (this: ^ITraceDataProviderCollection, retVal: ^^IUnknown) -> HRESULT,
	Add: proc "system" (this: ^ITraceDataProviderCollection, pProvider: ^ITraceDataProvider) -> HRESULT,
	Remove: proc "system" (this: ^ITraceDataProviderCollection, vProvider: VARIANT) -> HRESULT,
	Clear: proc "system" (this: ^ITraceDataProviderCollection) -> HRESULT,
	AddRange: proc "system" (
		this: ^ITraceDataProviderCollection,
		providers: ^ITraceDataProviderCollection,
	) -> HRESULT,
	CreateTraceDataProvider: proc "system" (this: ^ITraceDataProviderCollection, Provider: ^^ITraceDataProvider) -> HRESULT,
	GetTraceDataProviders: proc "system" (this: ^ITraceDataProviderCollection, server: BSTR) -> HRESULT,
	GetTraceDataProvidersByProcess: proc "system" (this: ^ITraceDataProviderCollection, Server: BSTR, Pid: u32) -> HRESULT,
}
IID_ITraceDataProviderCollection :: GUID{0x03837510, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ivaluemap ]]
IValueMap :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IValueMap_Vtbl,
}
IValueMap_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Count: proc "system" (this: ^IValueMap, retVal: ^i32) -> HRESULT,
	get_Item: proc "system" (this: ^IValueMap, index: VARIANT, value: ^^IValueMapItem) -> HRESULT,
	get__NewEnum: proc "system" (this: ^IValueMap, retVal: ^^IUnknown) -> HRESULT,
	get_Description: proc "system" (this: ^IValueMap, description: ^BSTR) -> HRESULT,
	put_Description: proc "system" (this: ^IValueMap, description: BSTR) -> HRESULT,
	get_Value: proc "system" (this: ^IValueMap, Value: ^VARIANT) -> HRESULT,
	put_Value: proc "system" (this: ^IValueMap, Value: VARIANT) -> HRESULT,
	get_ValueMapType: proc "system" (this: ^IValueMap, type: ^ValueMapType) -> HRESULT,
	put_ValueMapType: proc "system" (this: ^IValueMap, type: ValueMapType) -> HRESULT,
	Add: proc "system" (this: ^IValueMap, value: VARIANT) -> HRESULT,
	Remove: proc "system" (this: ^IValueMap, value: VARIANT) -> HRESULT,
	Clear: proc "system" (this: ^IValueMap) -> HRESULT,
	AddRange: proc "system" (this: ^IValueMap, _map: ^IValueMap) -> HRESULT,
	CreateValueMapItem: proc "system" (this: ^IValueMap, Item: ^^IValueMapItem) -> HRESULT,
}
IID_IValueMap :: GUID{0x03837534, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/nn-pla-ivaluemapitem ]]
IValueMapItem :: struct #raw_union {
	#subtype IDispatch: IDispatch,
	using Vtbl: ^IValueMapItem_Vtbl,
}
IValueMapItem_Vtbl :: struct {
	using IDispatch_Vtbl: IDispatch_Vtbl,
	get_Description: proc "system" (this: ^IValueMapItem, description: ^BSTR) -> HRESULT,
	put_Description: proc "system" (this: ^IValueMapItem, description: BSTR) -> HRESULT,
	get_Enabled: proc "system" (this: ^IValueMapItem, enabled: ^VARIANT_BOOL) -> HRESULT,
	put_Enabled: proc "system" (this: ^IValueMapItem, enabled: VARIANT_BOOL) -> HRESULT,
	get_Key: proc "system" (this: ^IValueMapItem, key: ^BSTR) -> HRESULT,
	put_Key: proc "system" (this: ^IValueMapItem, key: BSTR) -> HRESULT,
	get_Value: proc "system" (this: ^IValueMapItem, Value: ^VARIANT) -> HRESULT,
	put_Value: proc "system" (this: ^IValueMapItem, Value: VARIANT) -> HRESULT,
	get_ValueMapType: proc "system" (this: ^IValueMapItem, type: ^ValueMapType) -> HRESULT,
	put_ValueMapType: proc "system" (this: ^IValueMapItem, type: ValueMapType) -> HRESULT,
}
IID_IValueMapItem :: GUID{0x03837533, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

LegacyDataCollectorSet :: struct {
}
IID_LegacyDataCollectorSet :: GUID{0x03837526, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

LegacyDataCollectorSetCollection :: struct {
}
IID_LegacyDataCollectorSetCollection :: GUID{0x03837527, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

LegacyTraceSession :: struct {
}
IID_LegacyTraceSession :: GUID{0x03837528, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

LegacyTraceSessionCollection :: struct {
}
IID_LegacyTraceSessionCollection :: GUID{0x03837529, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/SysMon/logfileitem ]]
LogFileItem :: struct {
}
IID_LogFileItem :: GUID{0x16EC5BE8, 0xDF93, 0x4237, {0x94, 0xE4, 0x9E, 0xE9, 0x18, 0x11, 0x1D, 0x71}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/SysMon/logfiles ]]
LogFiles :: struct {
}
IID_LogFiles :: GUID{0x2735D9FD, 0xF6B9, 0x4F19, {0xA5, 0xD9, 0xE2, 0xD0, 0x68, 0x58, 0x4B, 0xC5}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_a ]]
PDH_BROWSE_DLG_CONFIG_A :: struct {
	using _: bit_field u32 {
		bIncludeInstanceIndex: u32 | 1,
		bSingleCounterPerAdd: u32 | 1,
		bSingleCounterPerDialog: u32 | 1,
		bLocalCountersOnly: u32 | 1,
		bWildCardInstances: u32 | 1,
		bHideDetailBox: u32 | 1,
		bInitializePath: u32 | 1,
		bDisableMachineSelection: u32 | 1,
		bIncludeCostlyObjects: u32 | 1,
		bShowObjectBrowser: u32 | 1,
		bReserved: u32 | 22,
	},
	hWndOwner: HWND,
	szDataSource: PSTR,
	szReturnPathBuffer: PSTR,
	cchReturnPathLength: u32,
	pCallBack: CounterPathCallBack,
	dwCallBackArg: uintptr,
	CallBackStatus: i32,
	dwDefaultDetailLevel: PERF_DETAIL,
	szDialogBoxCaption: PSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_ha ]]
PDH_BROWSE_DLG_CONFIG_HA :: struct {
	using _: bit_field u32 {
		bIncludeInstanceIndex: u32 | 1,
		bSingleCounterPerAdd: u32 | 1,
		bSingleCounterPerDialog: u32 | 1,
		bLocalCountersOnly: u32 | 1,
		bWildCardInstances: u32 | 1,
		bHideDetailBox: u32 | 1,
		bInitializePath: u32 | 1,
		bDisableMachineSelection: u32 | 1,
		bIncludeCostlyObjects: u32 | 1,
		bShowObjectBrowser: u32 | 1,
		bReserved: u32 | 22,
	},
	hWndOwner: HWND,
	hDataSource: PDH_HLOG,
	szReturnPathBuffer: PSTR,
	cchReturnPathLength: u32,
	pCallBack: CounterPathCallBack,
	dwCallBackArg: uintptr,
	CallBackStatus: i32,
	dwDefaultDetailLevel: PERF_DETAIL,
	szDialogBoxCaption: PSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_hw ]]
PDH_BROWSE_DLG_CONFIG_HW :: struct {
	using _: bit_field u32 {
		bIncludeInstanceIndex: u32 | 1,
		bSingleCounterPerAdd: u32 | 1,
		bSingleCounterPerDialog: u32 | 1,
		bLocalCountersOnly: u32 | 1,
		bWildCardInstances: u32 | 1,
		bHideDetailBox: u32 | 1,
		bInitializePath: u32 | 1,
		bDisableMachineSelection: u32 | 1,
		bIncludeCostlyObjects: u32 | 1,
		bShowObjectBrowser: u32 | 1,
		bReserved: u32 | 22,
	},
	hWndOwner: HWND,
	hDataSource: PDH_HLOG,
	szReturnPathBuffer: PWSTR,
	cchReturnPathLength: u32,
	pCallBack: CounterPathCallBack,
	dwCallBackArg: uintptr,
	CallBackStatus: i32,
	dwDefaultDetailLevel: PERF_DETAIL,
	szDialogBoxCaption: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_browse_dlg_config_w ]]
PDH_BROWSE_DLG_CONFIG_W :: struct {
	using _: bit_field u32 {
		bIncludeInstanceIndex: u32 | 1,
		bSingleCounterPerAdd: u32 | 1,
		bSingleCounterPerDialog: u32 | 1,
		bLocalCountersOnly: u32 | 1,
		bWildCardInstances: u32 | 1,
		bHideDetailBox: u32 | 1,
		bInitializePath: u32 | 1,
		bDisableMachineSelection: u32 | 1,
		bIncludeCostlyObjects: u32 | 1,
		bShowObjectBrowser: u32 | 1,
		bReserved: u32 | 22,
	},
	hWndOwner: HWND,
	szDataSource: PWSTR,
	szReturnPathBuffer: PWSTR,
	cchReturnPathLength: u32,
	pCallBack: CounterPathCallBack,
	dwCallBackArg: uintptr,
	CallBackStatus: i32,
	dwDefaultDetailLevel: PERF_DETAIL,
	szDialogBoxCaption: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_counter_info_a ]]
PDH_COUNTER_INFO_A :: struct {
	dwLength: u32,
	dwType: u32,
	CVersion: u32,
	CStatus: u32,
	lScale: i32,
	lDefaultScale: i32,
	dwUserData: uintptr,
	dwQueryUserData: uintptr,
	szFullPath: PSTR,
	using _: struct #raw_union {
		DataItemPath: PDH_DATA_ITEM_PATH_ELEMENTS_A,
		CounterPath: PDH_COUNTER_PATH_ELEMENTS_A,
		using _: struct {
			szMachineName: PSTR,
			szObjectName: PSTR,
			szInstanceName: PSTR,
			szParentInstance: PSTR,
			dwInstanceIndex: u32,
			szCounterName: PSTR,
		},
	},
	szExplainText: PSTR,
	DataBuffer: [1]u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_counter_info_w ]]
PDH_COUNTER_INFO_W :: struct {
	dwLength: u32,
	dwType: u32,
	CVersion: u32,
	CStatus: u32,
	lScale: i32,
	lDefaultScale: i32,
	dwUserData: uintptr,
	dwQueryUserData: uintptr,
	szFullPath: PWSTR,
	using _: struct #raw_union {
		DataItemPath: PDH_DATA_ITEM_PATH_ELEMENTS_W,
		CounterPath: PDH_COUNTER_PATH_ELEMENTS_W,
		using _: struct {
			szMachineName: PWSTR,
			szObjectName: PWSTR,
			szInstanceName: PWSTR,
			szParentInstance: PWSTR,
			dwInstanceIndex: u32,
			szCounterName: PWSTR,
		},
	},
	szExplainText: PWSTR,
	DataBuffer: [1]u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_counter_path_elements_a ]]
PDH_COUNTER_PATH_ELEMENTS_A :: struct {
	szMachineName: PSTR,
	szObjectName: PSTR,
	szInstanceName: PSTR,
	szParentInstance: PSTR,
	dwInstanceIndex: u32,
	szCounterName: PSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_counter_path_elements_w ]]
PDH_COUNTER_PATH_ELEMENTS_W :: struct {
	szMachineName: PWSTR,
	szObjectName: PWSTR,
	szInstanceName: PWSTR,
	szParentInstance: PWSTR,
	dwInstanceIndex: u32,
	szCounterName: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_data_item_path_elements_a ]]
PDH_DATA_ITEM_PATH_ELEMENTS_A :: struct {
	szMachineName: PSTR,
	ObjectGUID: GUID,
	dwItemId: u32,
	szInstanceName: PSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_data_item_path_elements_w ]]
PDH_DATA_ITEM_PATH_ELEMENTS_W :: struct {
	szMachineName: PWSTR,
	ObjectGUID: GUID,
	dwItemId: u32,
	szInstanceName: PWSTR,
}

PDH_DLL_VERSION :: enum u32 {
	CVERSION_WIN50 = 0x00000500,
	VERSION = 0x00000503,
}

PDH_FMT :: enum u32 {
	DOUBLE = 0x00000200,
	LARGE = 0x00000400,
	LONG = 0x00000100,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_fmt_countervalue ]]
PDH_FMT_COUNTERVALUE :: struct {
	CStatus: u32,
	using _: struct #raw_union {
		longValue: i32,
		doubleValue: f64,
		largeValue: i64,
		AnsiStringValue: PSTR,
		WideStringValue: PWSTR,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_fmt_countervalue_item_a ]]
PDH_FMT_COUNTERVALUE_ITEM_A :: struct {
	szName: PSTR,
	FmtValue: PDH_FMT_COUNTERVALUE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_fmt_countervalue_item_w ]]
PDH_FMT_COUNTERVALUE_ITEM_W :: struct {
	szName: PWSTR,
	FmtValue: PDH_FMT_COUNTERVALUE,
}

PDH_HCOUNTER :: rawptr

PDH_HLOG :: rawptr

PDH_HQUERY :: rawptr

PDH_LOG :: enum u32 {
	READ_ACCESS = 0x00010000,
	WRITE_ACCESS = 0x00020000,
	UPDATE_ACCESS = 0x00040000,
}

PDH_LOG_SERVICE_QUERY_INFO_A :: struct {
	dwSize: u32,
	dwFlags: u32,
	dwLogQuota: u32,
	szLogFileCaption: PSTR,
	szDefaultDir: PSTR,
	szBaseFileName: PSTR,
	dwFileType: u32,
	dwReserved: u32,
	using _: struct #raw_union {
		using _: struct {
			PdlAutoNameInterval: u32,
			PdlAutoNameUnits: u32,
			PdlCommandFilename: PSTR,
			PdlCounterList: PSTR,
			PdlAutoNameFormat: u32,
			PdlSampleInterval: u32,
			PdlLogStartTime: FILETIME,
			PdlLogEndTime: FILETIME,
		},
		using _: struct {
			TlNumberOfBuffers: u32,
			TlMinimumBuffers: u32,
			TlMaximumBuffers: u32,
			TlFreeBuffers: u32,
			TlBufferSize: u32,
			TlEventsLost: u32,
			TlLoggerThreadId: u32,
			TlBuffersWritten: u32,
			TlLogHandle: u32,
			TlLogFileName: PSTR,
		},
	},
}

PDH_LOG_SERVICE_QUERY_INFO_W :: struct {
	dwSize: u32,
	dwFlags: u32,
	dwLogQuota: u32,
	szLogFileCaption: PWSTR,
	szDefaultDir: PWSTR,
	szBaseFileName: PWSTR,
	dwFileType: u32,
	dwReserved: u32,
	using _: struct #raw_union {
		using _: struct {
			PdlAutoNameInterval: u32,
			PdlAutoNameUnits: u32,
			PdlCommandFilename: PWSTR,
			PdlCounterList: PWSTR,
			PdlAutoNameFormat: u32,
			PdlSampleInterval: u32,
			PdlLogStartTime: FILETIME,
			PdlLogEndTime: FILETIME,
		},
		using _: struct {
			TlNumberOfBuffers: u32,
			TlMinimumBuffers: u32,
			TlMaximumBuffers: u32,
			TlFreeBuffers: u32,
			TlBufferSize: u32,
			TlEventsLost: u32,
			TlLoggerThreadId: u32,
			TlBuffersWritten: u32,
			TlLogHandle: u32,
			TlLogFileName: PWSTR,
		},
	},
}

PDH_LOG_TYPE :: enum u32 {
	UNDEFINED = 0x00000000,
	CSV = 0x00000001,
	SQL = 0x00000007,
	TSV = 0x00000002,
	BINARY = 0x00000008,
	PERFMON = 0x00000006,
}

PDH_PATH_FLAGS :: enum u32 {
	RESULT = 0x00000001,
	INPUT = 0x00000002,
	NONE = 0x00000000,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_counter ]]
PDH_RAW_COUNTER :: struct {
	CStatus: u32,
	TimeStamp: FILETIME,
	FirstValue: i64,
	SecondValue: i64,
	MultiCount: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_counter_item_a ]]
PDH_RAW_COUNTER_ITEM_A :: struct {
	szName: PSTR,
	RawValue: PDH_RAW_COUNTER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_counter_item_w ]]
PDH_RAW_COUNTER_ITEM_W :: struct {
	szName: PWSTR,
	RawValue: PDH_RAW_COUNTER,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_raw_log_record ]]
PDH_RAW_LOG_RECORD :: struct {
	dwStructureSize: u32,
	dwRecordType: PDH_LOG_TYPE,
	dwItems: u32,
	RawBytes: [1]u8,
}

PDH_SELECT_DATA_SOURCE_FLAGS :: enum u32 {
	FILE_BROWSER_ONLY = 0x00000001,
	NONE = 0x00000000,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_statistics ]]
PDH_STATISTICS :: struct {
	dwFormat: u32,
	count: u32,
	min: PDH_FMT_COUNTERVALUE,
	max: PDH_FMT_COUNTERVALUE,
	mean: PDH_FMT_COUNTERVALUE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_time_info ]]
PDH_TIME_INFO :: struct {
	StartTime: i64,
	EndTime: i64,
	SampleCount: u32,
}

PERF_COUNTER_AGGREGATE_FUNC :: enum u32 {
	UNDEFINED = 0x00000000,
	TOTAL = 0x00000001,
	AVG = 0x00000002,
	MIN = 0x00000003,
	MAX = 0x00000004,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_counter_block ]]
PERF_COUNTER_BLOCK :: struct {
	ByteLength: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_data ]]
PERF_COUNTER_DATA :: struct {
	dwDataSize: u32,
	dwSize: u32,
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_counter_definition ]]
	PERF_COUNTER_DEFINITION :: struct {
		ByteLength: u32,
		CounterNameTitleIndex: u32,
		CounterNameTitle: u32,
		CounterHelpTitleIndex: u32,
		CounterHelpTitle: u32,
		DefaultScale: i32,
		DetailLevel: u32,
		CounterType: u32,
		CounterSize: u32,
		CounterOffset: u32,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_counter_definition ]]
	PERF_COUNTER_DEFINITION :: struct {
		ByteLength: u32,
		CounterNameTitleIndex: u32,
		CounterNameTitle: PWSTR,
		CounterHelpTitleIndex: u32,
		CounterHelpTitle: PWSTR,
		DefaultScale: i32,
		DetailLevel: u32,
		CounterType: u32,
		CounterSize: u32,
		CounterOffset: u32,
	}
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_header ]]
PERF_COUNTER_HEADER :: struct {
	dwStatus: u32,
	dwType: PerfCounterDataType,
	dwSize: u32,
	Reserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_identifier ]]
PERF_COUNTER_IDENTIFIER :: struct {
	CounterSetGuid: GUID,
	Status: u32,
	Size: u32,
	CounterId: u32,
	InstanceId: u32,
	Index: u32,
	Reserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_identity ]]
PERF_COUNTER_IDENTITY :: struct {
	CounterSetGuid: GUID,
	BufferSize: u32,
	CounterId: u32,
	InstanceId: u32,
	MachineOffset: u32,
	NameOffset: u32,
	Reserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_info ]]
PERF_COUNTER_INFO :: struct {
	CounterId: u32,
	Type: u32,
	Attrib: u64,
	Size: u32,
	DetailLevel: u32,
	Scale: i32,
	Offset: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counter_reg_info ]]
PERF_COUNTER_REG_INFO :: struct {
	CounterId: u32,
	Type: u32,
	Attrib: u64,
	DetailLevel: u32,
	DefaultScale: i32,
	BaseCounterId: u32,
	PerfTimeId: u32,
	PerfFreqId: u32,
	MultiId: u32,
	AggregateFunc: PERF_COUNTER_AGGREGATE_FUNC,
	Reserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counterset_info ]]
PERF_COUNTERSET_INFO :: struct {
	CounterSetGuid: GUID,
	ProviderGuid: GUID,
	NumCounters: u32,
	InstanceType: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counterset_instance ]]
PERF_COUNTERSET_INSTANCE :: struct {
	CounterSetGuid: GUID,
	dwSize: u32,
	InstanceId: u32,
	InstanceNameOffset: u32,
	InstanceNameSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_counterset_reg_info ]]
PERF_COUNTERSET_REG_INFO :: struct {
	CounterSetGuid: GUID,
	CounterSetType: u32,
	DetailLevel: u32,
	NumCounters: u32,
	InstanceType: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_data_block ]]
PERF_DATA_BLOCK :: struct {
	Signature: [4]u16,
	LittleEndian: u32,
	Version: u32,
	Revision: u32,
	TotalByteLength: u32,
	HeaderLength: u32,
	NumObjectTypes: u32,
	DefaultObject: i32,
	SystemTime: SYSTEMTIME,
	PerfTime: i64,
	PerfFreq: i64,
	PerfTime100nSec: i64,
	SystemNameLength: u32,
	SystemNameOffset: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_data_header ]]
PERF_DATA_HEADER :: struct {
	dwTotalSize: u32,
	dwNumCounters: u32,
	PerfTimeStamp: i64,
	PerfTime100NSec: i64,
	PerfFreq: i64,
	SystemTime: SYSTEMTIME,
}

PERF_DETAIL :: enum u32 {
	NOVICE = 0x00000064,
	ADVANCED = 0x000000C8,
	EXPERT = 0x0000012C,
	WIZARD = 0x00000190,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_instance_definition ]]
PERF_INSTANCE_DEFINITION :: struct {
	ByteLength: u32,
	ParentObjectTitleIndex: u32,
	ParentObjectInstance: u32,
	UniqueID: i32,
	NameOffset: u32,
	NameLength: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_instance_header ]]
PERF_INSTANCE_HEADER :: struct {
	Size: u32,
	InstanceId: u32,
}

PERF_MEM_ALLOC :: #type proc "system" (AllocSize: uintptr, pContext: rawptr) -> rawptr

PERF_MEM_FREE :: #type proc "system" (pBuffer: rawptr, pContext: rawptr)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_multi_counters ]]
PERF_MULTI_COUNTERS :: struct {
	dwSize: u32,
	dwCounters: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_multi_instances ]]
PERF_MULTI_INSTANCES :: struct {
	dwTotalSize: u32,
	dwInstances: u32,
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_object_type ]]
	PERF_OBJECT_TYPE :: struct {
		TotalByteLength: u32,
		DefinitionLength: u32,
		HeaderLength: u32,
		ObjectNameTitleIndex: u32,
		ObjectNameTitle: u32,
		ObjectHelpTitleIndex: u32,
		ObjectHelpTitle: u32,
		DetailLevel: u32,
		NumCounters: u32,
		DefaultCounter: i32,
		NumInstances: i32,
		CodePage: u32,
		PerfTime: i64,
		PerfFreq: i64,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winperf/ns-winperf-perf_object_type ]]
	PERF_OBJECT_TYPE :: struct {
		TotalByteLength: u32,
		DefinitionLength: u32,
		HeaderLength: u32,
		ObjectNameTitleIndex: u32,
		ObjectNameTitle: PWSTR,
		ObjectHelpTitleIndex: u32,
		ObjectHelpTitle: PWSTR,
		DetailLevel: u32,
		NumCounters: u32,
		DefaultCounter: i32,
		NumInstances: i32,
		CodePage: u32,
		PerfTime: i64,
		PerfFreq: i64,
	}
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_provider_context ]]
PERF_PROVIDER_CONTEXT :: struct {
	ContextSize: u32,
	Reserved: u32,
	ControlCallback: PERFLIBREQUEST,
	MemAllocRoutine: PERF_MEM_ALLOC,
	MemFreeRoutine: PERF_MEM_FREE,
	pMemContext: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_buffer_header ]]
PERF_STRING_BUFFER_HEADER :: struct {
	dwSize: u32,
	dwCounters: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ns-perflib-perf_string_counter_header ]]
PERF_STRING_COUNTER_HEADER :: struct {
	dwCounterId: u32,
	dwOffset: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ne-perflib-perfcounterdatatype ]]
PerfCounterDataType :: enum i32 {
	ERROR_RETURN = 0,
	SINGLE_COUNTER = 1,
	MULTIPLE_COUNTERS = 2,
	MULTIPLE_INSTANCES = 4,
	COUNTERSET = 6,
}

PERFLIBREQUEST :: #type proc "system" (RequestCode: u32, Buffer: rawptr, BufferSize: u32) -> u32

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/perflib/ne-perflib-perfreginfotype ]]
PerfRegInfoType :: enum i32 {
	COUNTERSET_STRUCT = 1,
	COUNTER_STRUCT = 2,
	COUNTERSET_NAME_STRING = 3,
	COUNTERSET_HELP_STRING = 4,
	COUNTER_NAME_STRINGS = 5,
	COUNTER_HELP_STRINGS = 6,
	PROVIDER_NAME = 7,
	PROVIDER_GUID = 8,
	COUNTERSET_ENGLISH_NAME = 9,
	COUNTER_ENGLISH_NAMES = 10,
}

PLA_CABEXTRACT_CALLBACK :: #type proc "system" (FileName: PWSTR, Context: rawptr)

PM_CLOSE_PROC :: #type proc "system" () -> u32

PM_COLLECT_PROC :: #type proc "system" (pValueName: PWSTR, ppData: rawptr, pcbTotalBytes: ^u32, pNumObjectTypes: ^u32) -> u32

PM_OPEN_PROC :: #type proc "system" (pContext: PWSTR) -> u32

REAL_TIME_DATA_SOURCE_ID_FLAGS :: enum u32 {
	REGISTRY = 0x00000001,
	WBEM = 0x00000004,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-reportvaluetypeconstants ]]
ReportValueTypeConstants :: enum i32 {
	DefaultValue = 0,
	CurrentValue = 1,
	Average = 2,
	Minimum = 3,
	Maximum = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-resourcepolicy ]]
ResourcePolicy :: enum i32 {
	Largest = 0,
	Oldest = 1,
}

ServerDataCollectorSet :: struct {
}
IID_ServerDataCollectorSet :: GUID{0x03837531, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

ServerDataCollectorSetCollection :: struct {
}
IID_ServerDataCollectorSetCollection :: GUID{0x03837532, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

SourcePropPage :: struct {
}
IID_SourcePropPage :: GUID{0x0CF32AA1, 0x7571, 0x11D0, {0x93, 0xC4, 0x00, 0xAA, 0x00, 0xA3, 0xDD, 0xEA}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-streammode ]]
StreamMode :: enum i32 {
	File = 1,
	RealTime = 2,
	Both = 3,
	Buffering = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-sysmonbatchreason ]]
SysmonBatchReason :: enum i32 {
	None = 0,
	AddFiles = 1,
	AddCounters = 2,
	AddFilesAutoCounters = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-sysmondatatype ]]
SysmonDataType :: enum i32 {
	Avg = 1,
	Min = 2,
	Max = 3,
	Time = 4,
	Count = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/isysmon/ne-isysmon-sysmonfiletype ]]
SysmonFileType :: enum i32 {
	Html = 1,
	Report = 2,
	Csv = 3,
	Tsv = 4,
	Blg = 5,
	RetiredBlg = 6,
	Gif = 7,
}

SystemDataCollectorSet :: struct {
}
IID_SystemDataCollectorSet :: GUID{0x03837546, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

SystemDataCollectorSetCollection :: struct {
}
IID_SystemDataCollectorSetCollection :: GUID{0x03837547, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/SysMon/systemmonitor ]]
SystemMonitor :: struct {
}
IID_SystemMonitor :: GUID{0xC4D2D8E0, 0xD1DD, 0x11CE, {0x94, 0x0F, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}

SystemMonitor2 :: struct {
}
IID_SystemMonitor2 :: GUID{0x7F30578C, 0x5F38, 0x4612, {0xAC, 0xFE, 0x6E, 0xD0, 0x4C, 0x7B, 0x7A, 0xF8}}

TraceDataProvider :: struct {
}
IID_TraceDataProvider :: GUID{0x03837513, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

TraceDataProviderCollection :: struct {
}
IID_TraceDataProviderCollection :: GUID{0x03837511, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

TraceSession :: struct {
}
IID_TraceSession :: GUID{0x0383751C, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

TraceSessionCollection :: struct {
}
IID_TraceSessionCollection :: GUID{0x03837530, 0x098B, 0x11D8, {0x94, 0x14, 0x50, 0x50, 0x54, 0x50, 0x30, 0x30}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-valuemaptype ]]
ValueMapType :: enum i32 {
	Index = 1,
	Flag = 2,
	FlagArray = 3,
	Validation = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/pla/ne-pla-weekdays ]]
WeekDays :: enum i32 {
	RunOnce = 0,
	Sunday = 1,
	Monday = 2,
	Tuesday = 4,
	Wednesday = 8,
	Thursday = 16,
	Friday = 32,
	Saturday = 64,
	Everyday = 127,
}

DIID_DICounterItem :: GUID{0xC08C4FF2, 0x0E2E, 0x11CF, {0x94, 0x2C, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}
DIID_DILogFileItem :: GUID{0x8D093FFC, 0xF777, 0x4917, {0x82, 0xD1, 0x83, 0x3F, 0xBC, 0x54, 0xC5, 0x8F}}
DIID_DISystemMonitor :: GUID{0x13D73D81, 0xC32E, 0x11CF, {0x93, 0x98, 0x00, 0xAA, 0x00, 0xA3, 0xDD, 0xEA}}
DIID_DISystemMonitorEvents :: GUID{0x84979930, 0x4AB3, 0x11CF, {0x94, 0x3A, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}
DIID_DISystemMonitorInternal :: GUID{0x194EB242, 0xC32C, 0x11CF, {0x93, 0x98, 0x00, 0xAA, 0x00, 0xA3, 0xDD, 0xEA}}
H_WBEM_DATASOURCE :: -1
LIBID_SystemMonitor :: GUID{0x1B773E42, 0x2509, 0x11CF, {0x94, 0x2F, 0x00, 0x80, 0x29, 0x00, 0x43, 0x47}}
MAX_COUNTER_PATH :: 256
MAX_PERF_OBJECTS_IN_QUERY_FUNCTION :: 64
PDH_ACCESS_DENIED :: 3221228507
PDH_ASYNC_QUERY_TIMEOUT :: 2147485659
PDH_BINARY_LOG_CORRUPT :: 3221228535
PDH_CALC_NEGATIVE_DENOMINATOR :: 2147485654
PDH_CALC_NEGATIVE_TIMEBASE :: 2147485655
PDH_CALC_NEGATIVE_VALUE :: 2147485656
PDH_CANNOT_CONNECT_MACHINE :: 3221228483
PDH_CANNOT_CONNECT_WMI_SERVER :: 3221228520
PDH_CANNOT_READ_NAME_STRINGS :: 3221228488
PDH_CANNOT_SET_DEFAULT_REALTIME_DATASOURCE :: 2147485660
PDH_COUNTER_ALREADY_IN_QUERY :: 3221228534
PDH_CSTATUS_BAD_COUNTERNAME :: 3221228480
PDH_CSTATUS_INVALID_DATA :: 3221228474
PDH_CSTATUS_ITEM_NOT_VALIDATED :: 2147485651
PDH_CSTATUS_NEW_DATA :: 1
PDH_CSTATUS_NO_COUNTER :: 3221228473
PDH_CSTATUS_NO_COUNTERNAME :: 3221228479
PDH_CSTATUS_NO_INSTANCE :: 2147485649
PDH_CSTATUS_NO_MACHINE :: 2147485648
PDH_CSTATUS_NO_OBJECT :: 3221228472
PDH_CSTATUS_VALID_DATA :: 0
PDH_DATA_SOURCE_IS_LOG_FILE :: 3221228494
PDH_DATA_SOURCE_IS_REAL_TIME :: 3221228495
PDH_DIALOG_CANCELLED :: 2147485657
PDH_END_OF_LOG_FILE :: 2147485658
PDH_ENTRY_NOT_IN_LOG_FILE :: 3221228493
PDH_FILE_ALREADY_EXISTS :: 3221228498
PDH_FILE_NOT_FOUND :: 3221228497
PDH_FUNCTION_NOT_FOUND :: 3221228478
PDH_INCORRECT_APPEND_TIME :: 3221228539
PDH_INSUFFICIENT_BUFFER :: 3221228482
PDH_INVALID_ARGUMENT :: 3221228477
PDH_INVALID_BUFFER :: 3221228481
PDH_INVALID_DATA :: 3221228486
PDH_INVALID_DATASOURCE :: 3221228509
PDH_INVALID_HANDLE :: 3221228476
PDH_INVALID_INSTANCE :: 3221228485
PDH_INVALID_PATH :: 3221228484
PDH_INVALID_SQL_LOG_FORMAT :: 3221228533
PDH_INVALID_SQLDB :: 3221228510
PDH_LOG_FILE_CREATE_ERROR :: 3221228489
PDH_LOG_FILE_OPEN_ERROR :: 3221228490
PDH_LOG_FILE_TOO_SMALL :: 3221228508
PDH_LOG_SAMPLE_TOO_SMALL :: 3221228536
PDH_LOG_TYPE_NOT_FOUND :: 3221228491
PDH_LOG_TYPE_RETIRED_BIN :: 3
PDH_LOG_TYPE_TRACE_GENERIC :: 5
PDH_LOG_TYPE_TRACE_KERNEL :: 4
PDH_LOGSVC_NOT_OPENED :: 3221228505
PDH_LOGSVC_QUERY_NOT_FOUND :: 3221228504
PDH_MAX_COUNTER_NAME :: 1024
PDH_MAX_COUNTER_PATH :: 2048
PDH_MAX_DATASOURCE_PATH :: 1024
PDH_MAX_INSTANCE_NAME :: 1024
PDH_MAX_SCALE :: 7
PDH_MEMORY_ALLOCATION_FAILURE :: 3221228475
PDH_MIN_SCALE :: -7
PDH_MORE_DATA :: 2147485650
PDH_NO_COUNTERS :: 3221228511
PDH_NO_DATA :: 2147485653
PDH_NO_DIALOG_DATA :: 3221228487
PDH_NO_MORE_DATA :: 3221228492
PDH_NOEXPANDCOUNTERS :: 1
PDH_NOEXPANDINSTANCES :: 2
PDH_NOT_IMPLEMENTED :: 3221228499
PDH_OS_EARLIER_VERSION :: 3221228538
PDH_OS_LATER_VERSION :: 3221228537
PDH_PLA_COLLECTION_ALREADY_RUNNING :: 3221228521
PDH_PLA_COLLECTION_NOT_FOUND :: 3221228523
PDH_PLA_ERROR_ALREADY_EXISTS :: 3221228526
PDH_PLA_ERROR_FILEPATH :: 3221228528
PDH_PLA_ERROR_NAME_TOO_LONG :: 3221228532
PDH_PLA_ERROR_NOSTART :: 3221228525
PDH_PLA_ERROR_SCHEDULE_ELAPSED :: 3221228524
PDH_PLA_ERROR_SCHEDULE_OVERLAP :: 3221228522
PDH_PLA_ERROR_TYPE_MISMATCH :: 3221228527
PDH_PLA_SERVICE_ERROR :: 3221228529
PDH_PLA_VALIDATION_ERROR :: 3221228530
PDH_PLA_VALIDATION_WARNING :: 2147486707
PDH_QUERY_PERF_DATA_TIMEOUT :: 3221228542
PDH_REFRESHCOUNTERS :: 4
PDH_RETRY :: 2147485652
PDH_SQL_ALLOC_FAILED :: 3221228512
PDH_SQL_ALLOCCON_FAILED :: 3221228513
PDH_SQL_ALTER_DETAIL_FAILED :: 3221228541
PDH_SQL_BIND_FAILED :: 3221228519
PDH_SQL_CONNECT_FAILED :: 3221228518
PDH_SQL_EXEC_DIRECT_FAILED :: 3221228514
PDH_SQL_FETCH_FAILED :: 3221228515
PDH_SQL_MORE_RESULTS_FAILED :: 3221228517
PDH_SQL_ROWCOUNT_FAILED :: 3221228516
PDH_STRING_NOT_FOUND :: 3221228500
PDH_UNABLE_MAP_NAME_FILES :: 2147486677
PDH_UNABLE_READ_LOG_HEADER :: 3221228496
PDH_UNKNOWN_LOG_FORMAT :: 3221228502
PDH_UNKNOWN_LOGSVC_COMMAND :: 3221228503
PDH_UNMATCHED_APPEND_COUNTER :: 3221228540
PDH_WBEM_ERROR :: 3221228506
PERF_ADD_COUNTER :: 1
PERF_AGGREGATE_INSTANCE :: "_Total"
PERF_ATTRIB_BY_REFERENCE :: 1
PERF_ATTRIB_DISPLAY_AS_HEX :: 16
PERF_ATTRIB_DISPLAY_AS_REAL :: 8
PERF_ATTRIB_NO_DISPLAYABLE :: 2
PERF_ATTRIB_NO_GROUP_SEPARATOR :: 4
PERF_COLLECT_END :: 6
PERF_COLLECT_START :: 5
PERF_COUNTER_BASE :: 196608
PERF_COUNTER_ELAPSED :: 262144
PERF_COUNTER_FRACTION :: 131072
PERF_COUNTER_HISTOGRAM :: 393216
PERF_COUNTER_HISTOGRAM_TYPE :: 2147483648
PERF_COUNTER_PRECISION :: 458752
PERF_COUNTER_QUEUELEN :: 327680
PERF_COUNTER_RATE :: 65536
PERF_COUNTER_VALUE :: 0
PERF_COUNTERSET_FLAG_AGGREGATE :: 4
PERF_COUNTERSET_FLAG_HISTORY :: 8
PERF_COUNTERSET_FLAG_INSTANCE :: 16
PERF_COUNTERSET_FLAG_MULTIPLE :: 2
PERF_COUNTERSET_MULTI_INSTANCES :: 2
PERF_COUNTERSET_SINGLE_AGGREGATE :: 4
PERF_COUNTERSET_SINGLE_INSTANCE :: 0
PERF_DATA_REVISION :: 1
PERF_DATA_VERSION :: 1
PERF_DELTA_BASE :: 8388608
PERF_DELTA_COUNTER :: 4194304
PERF_DISPLAY_NO_SUFFIX :: 0
PERF_DISPLAY_NOSHOW :: 1073741824
PERF_DISPLAY_PER_SEC :: 268435456
PERF_DISPLAY_PERCENT :: 536870912
PERF_DISPLAY_SECONDS :: 805306368
PERF_ENUM_INSTANCES :: 3
PERF_FILTER :: 9
PERF_INVERSE_COUNTER :: 16777216
PERF_MAX_INSTANCE_NAME :: 1024
PERF_METADATA_MULTIPLE_INSTANCES :: -2
PERF_METADATA_NO_INSTANCES :: -3
PERF_MULTI_COUNTER :: 33554432
PERF_NO_INSTANCES :: -1
PERF_NO_UNIQUE_ID :: -1
PERF_NUMBER_DEC_1000 :: 131072
PERF_NUMBER_DECIMAL :: 65536
PERF_NUMBER_HEX :: 0
PERF_OBJECT_TIMER :: 2097152
PERF_PROVIDER_DRIVER :: 2
PERF_PROVIDER_KERNEL_MODE :: 1
PERF_PROVIDER_USER_MODE :: 0
PERF_REMOVE_COUNTER :: 2
PERF_SIZE_DWORD :: 0
PERF_SIZE_LARGE :: 256
PERF_SIZE_VARIABLE_LEN :: 768
PERF_SIZE_ZERO :: 512
PERF_TEXT_ASCII :: 65536
PERF_TEXT_UNICODE :: 0
PERF_TIMER_100NS :: 1048576
PERF_TIMER_TICK :: 0
PERF_TYPE_COUNTER :: 1024
PERF_TYPE_NUMBER :: 0
PERF_TYPE_TEXT :: 2048
PERF_TYPE_ZERO :: 3072
PERF_WILDCARD_COUNTER :: 4294967295
PERF_WILDCARD_INSTANCE :: "*"
PLA_CAPABILITY_AUTOLOGGER :: 32
PLA_CAPABILITY_LEGACY_SESSION :: 8
PLA_CAPABILITY_LEGACY_SVC :: 16
PLA_CAPABILITY_LOCAL :: 268435456
PLA_CAPABILITY_V1_SESSION :: 2
PLA_CAPABILITY_V1_SVC :: 1
PLA_CAPABILITY_V1_SYSTEM :: 4
PLAL_ALERT_CMD_LINE_A_NAME :: 512
PLAL_ALERT_CMD_LINE_C_NAME :: 1024
PLAL_ALERT_CMD_LINE_D_TIME :: 2048
PLAL_ALERT_CMD_LINE_L_VAL :: 4096
PLAL_ALERT_CMD_LINE_M_VAL :: 8192
PLAL_ALERT_CMD_LINE_MASK :: 32512
PLAL_ALERT_CMD_LINE_SINGLE :: 256
PLAL_ALERT_CMD_LINE_U_TEXT :: 16384
S_PDH :: GUID{0x04D66358, 0xC4A1, 0x419B, {0x80, 0x23, 0x23, 0xB7, 0x39, 0x02, 0xDE, 0x2C}}
WINPERF_LOG_DEBUG :: 2
WINPERF_LOG_NONE :: 0
WINPERF_LOG_USER :: 1
WINPERF_LOG_VERBOSE :: 3

