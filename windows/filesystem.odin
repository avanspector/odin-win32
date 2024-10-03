package windows

foreign import advapi32 "system:advapi32.lib"
foreign import clfsw32 "system:clfsw32.lib"
foreign import kernel32 "system:kernel32.lib"
foreign import ktmw32 "system:ktmw32.lib"
foreign import netapi32 "system:netapi32.lib"
foreign import onecoreuap_apiset "system:onecoreuap_apiset.lib"
foreign import txfw32 "system:txfw32.lib"
foreign import version "system:version.lib"
foreign import wofutil "system:wofutil.lib"

@(default_calling_convention="system")
foreign advapi32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/nf-winefs-adduserstoencryptedfile ]]
	AddUsersToEncryptedFile :: proc(
		lpFileName: PWSTR,
		pEncryptionCertificates: ^ENCRYPTION_CERTIFICATE_LIST,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-closeencryptedfileraw ]]
	CloseEncryptedFileRaw :: proc(pvContext: rawptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-decryptfilea ]]
	DecryptFileA :: proc(lpFileName: PSTR, dwReserved: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-decryptfilew ]]
	DecryptFileW :: proc(lpFileName: PWSTR, dwReserved: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/nf-winefs-duplicateencryptioninfofile ]]
	DuplicateEncryptionInfoFile :: proc(
		SrcFileName: PWSTR,
		DstFileName: PWSTR,
		dwCreationDistribution: u32,
		dwAttributes: u32,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-encryptfilea ]]
	EncryptFileA :: proc(lpFileName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-encryptfilew ]]
	EncryptFileW :: proc(lpFileName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/nf-winefs-encryptiondisable ]]
	EncryptionDisable :: proc(DirPath: PWSTR, Disable: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-fileencryptionstatusa ]]
	FileEncryptionStatusA :: proc(lpFileName: PSTR, lpStatus: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-fileencryptionstatusw ]]
	FileEncryptionStatusW :: proc(lpFileName: PWSTR, lpStatus: ^u32) -> BOOL ---

	FreeEncryptedFileMetadata :: proc(pbMetadata: ^u8) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/nf-winefs-freeencryptioncertificatehashlist ]]
	FreeEncryptionCertificateHashList :: proc(pUsers: ^ENCRYPTION_CERTIFICATE_HASH_LIST) ---

	GetEncryptedFileMetadata :: proc(lpFileName: PWSTR, pcbMetadata: ^u32, ppbMetadata: ^u8) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openencryptedfilerawa ]]
	OpenEncryptedFileRawA :: proc(lpFileName: PSTR, ulFlags: u32, pvContext: rawptr) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openencryptedfileraww ]]
	OpenEncryptedFileRawW :: proc(lpFileName: PWSTR, ulFlags: u32, pvContext: rawptr) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/nf-winefs-queryrecoveryagentsonencryptedfile ]]
	QueryRecoveryAgentsOnEncryptedFile :: proc(lpFileName: PWSTR, pRecoveryAgents: ^ENCRYPTION_CERTIFICATE_HASH_LIST) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/nf-winefs-queryusersonencryptedfile ]]
	QueryUsersOnEncryptedFile :: proc(lpFileName: PWSTR, pUsers: ^ENCRYPTION_CERTIFICATE_HASH_LIST) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-readencryptedfileraw ]]
	ReadEncryptedFileRaw :: proc(
		pfExportCallback: PFE_EXPORT_FUNC,
		pvCallbackContext: rawptr,
		pvContext: rawptr,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/nf-winefs-removeusersfromencryptedfile ]]
	RemoveUsersFromEncryptedFile :: proc(lpFileName: PWSTR, pHashes: ^ENCRYPTION_CERTIFICATE_HASH_LIST) -> u32 ---

	SetEncryptedFileMetadata :: proc(
		lpFileName: PWSTR,
		pbOldMetadata: ^u8,
		pbNewMetadata: ^u8,
		pOwnerHash: ^ENCRYPTION_CERTIFICATE_HASH,
		dwOperation: u32,
		pCertificatesAdded: ^ENCRYPTION_CERTIFICATE_HASH_LIST,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/nf-winefs-setuserfileencryptionkey ]]
	SetUserFileEncryptionKey :: proc(pEncryptionCertificate: ^ENCRYPTION_CERTIFICATE) -> u32 ---

	SetUserFileEncryptionKeyEx :: proc(
		pEncryptionCertificate: ^ENCRYPTION_CERTIFICATE,
		dwCapabilities: u32,
		dwFlags: u32,
		pvReserved: rawptr,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writeencryptedfileraw ]]
	WriteEncryptedFileRaw :: proc(
		pfImportCallback: PFE_IMPORT_FUNC,
		pvCallbackContext: rawptr,
		pvContext: rawptr,
	) -> u32 ---
}

@(default_calling_convention="system")
foreign clfsw32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-addlogcontainer ]]
	AddLogContainer :: proc(hLog: HANDLE, pcbContainer: ^u64, pwszContainerPath: PWSTR, pReserved: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-addlogcontainerset ]]
	AddLogContainerSet :: proc(
		hLog: HANDLE,
		cContainer: u16,
		pcbContainer: ^u64,
		rgwszContainerPath: [^]PWSTR,
		pReserved: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-advancelogbase ]]
	AdvanceLogBase :: proc(pvMarshal: rawptr, plsnBase: ^CLS_LSN, fFlags: u32, pOverlapped: ^OVERLAPPED) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-alignreservedlog ]]
	AlignReservedLog :: proc(
		pvMarshal: rawptr,
		cReservedRecords: u32,
		rgcbReservation: ^i64,
		pcbAlignReservation: ^i64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-allocreservedlog ]]
	AllocReservedLog :: proc(pvMarshal: rawptr, cReservedRecords: u32, pcbAdjustment: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-closeandresetlogfile ]]
	CloseAndResetLogFile :: proc(hLog: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-createlogcontainerscancontext ]]
	CreateLogContainerScanContext :: proc(
		hLog: HANDLE,
		cFromContainer: u32,
		cContainers: u32,
		eScanMode: u8,
		pcxScan: ^CLS_SCAN_CONTEXT,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-createlogfile ]]
	CreateLogFile :: proc(
		pszLogFileName: PWSTR,
		fDesiredAccess: u32,
		dwShareMode: FILE_SHARE_MODE,
		psaLogFile: ^SECURITY_ATTRIBUTES,
		fCreateDisposition: FILE_CREATION_DISPOSITION,
		fFlagsAndAttributes: FILE_FLAGS_AND_ATTRIBUTES,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-createlogmarshallingarea ]]
	CreateLogMarshallingArea :: proc(
		hLog: HANDLE,
		pfnAllocBuffer: CLFS_BLOCK_ALLOCATION,
		pfnFreeBuffer: CLFS_BLOCK_DEALLOCATION,
		pvBlockAllocContext: rawptr,
		cbMarshallingBuffer: u32,
		cMaxWriteBuffers: u32,
		cMaxReadBuffers: u32,
		ppvMarshal: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-deletelogbyhandle ]]
	DeleteLogByHandle :: proc(hLog: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-deletelogfile ]]
	DeleteLogFile :: proc(pszLogFileName: PWSTR, pvReserved: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-deletelogmarshallingarea ]]
	DeleteLogMarshallingArea :: proc(pvMarshal: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-deregistermanageablelogclient ]]
	DeregisterManageableLogClient :: proc(hLog: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-flushlogbuffers ]]
	FlushLogBuffers :: proc(pvMarshal: rawptr, pOverlapped: ^OVERLAPPED) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-flushlogtolsn ]]
	FlushLogToLsn :: proc(
		pvMarshalContext: rawptr,
		plsnFlush: ^CLS_LSN,
		plsnLastFlushed: ^CLS_LSN,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-freereservedlog ]]
	FreeReservedLog :: proc(pvMarshal: rawptr, cReservedRecords: u32, pcbAdjustment: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-getlogcontainername ]]
	GetLogContainerName :: proc(
		hLog: HANDLE,
		cidLogicalContainer: u32,
		pwstrContainerName: PWSTR,
		cLenContainerName: u32,
		pcActualLenContainerName: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-getlogfileinformation ]]
	GetLogFileInformation :: proc(hLog: HANDLE, pinfoBuffer: ^CLS_INFORMATION, cbBuffer: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-getlogiostatistics ]]
	GetLogIoStatistics :: proc(
		hLog: HANDLE,
		pvStatsBuffer: rawptr,
		cbStatsBuffer: u32,
		eStatsClass: CLFS_IOSTATS_CLASS,
		pcbStatsWritten: ^u32,
	) -> BOOL ---

	GetLogReservationInfo :: proc(
		pvMarshal: rawptr,
		pcbRecordNumber: ^u32,
		pcbUserReservation: ^i64,
		pcbCommitReservation: ^i64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-getnextlogarchiveextent ]]
	GetNextLogArchiveExtent :: proc(
		pvArchiveContext: rawptr,
		rgadExtent: ^CLS_ARCHIVE_DESCRIPTOR,
		cDescriptors: u32,
		pcDescriptorsReturned: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-handlelogfull ]]
	HandleLogFull :: proc(hLog: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-installlogpolicy ]]
	InstallLogPolicy :: proc(hLog: HANDLE, pPolicy: ^CLFS_MGMT_POLICY) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-logtailadvancefailure ]]
	LogTailAdvanceFailure :: proc(hLog: HANDLE, dwReason: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-lsnblockoffset ]]
	LsnBlockOffset :: proc(#by_ptr plsn: CLS_LSN) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-lsncontainer ]]
	LsnContainer :: proc(#by_ptr plsn: CLS_LSN) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-lsncreate ]]
	LsnCreate :: proc(cidContainer: u32, offBlock: u32, cRecord: u32) -> CLS_LSN ---

	LsnEqual :: proc(#by_ptr plsn1: CLS_LSN, #by_ptr plsn2: CLS_LSN) -> BOOLEAN ---

	LsnGreater :: proc(#by_ptr plsn1: CLS_LSN, #by_ptr plsn2: CLS_LSN) -> BOOLEAN ---

	LsnIncrement :: proc(plsn: ^CLS_LSN) -> CLS_LSN ---

	LsnInvalid :: proc(#by_ptr plsn: CLS_LSN) -> BOOLEAN ---

	LsnLess :: proc(#by_ptr plsn1: CLS_LSN, #by_ptr plsn2: CLS_LSN) -> BOOLEAN ---

	LsnNull :: proc(#by_ptr plsn: CLS_LSN) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-lsnrecordsequence ]]
	LsnRecordSequence :: proc(#by_ptr plsn: CLS_LSN) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-preparelogarchive ]]
	PrepareLogArchive :: proc(
		hLog: HANDLE,
		pszBaseLogFileName: PWSTR,
		cLen: u32,
		plsnLow: ^CLS_LSN,
		plsnHigh: ^CLS_LSN,
		pcActualLength: ^u32,
		poffBaseLogFileData: ^u64,
		pcbBaseLogFileLength: ^u64,
		plsnBase: ^CLS_LSN,
		plsnLast: ^CLS_LSN,
		plsnCurrentArchiveTail: ^CLS_LSN,
		ppvArchiveContext: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-querylogpolicy ]]
	QueryLogPolicy :: proc(
		hLog: HANDLE,
		ePolicyType: CLFS_MGMT_POLICY_TYPE,
		pPolicyBuffer: ^CLFS_MGMT_POLICY,
		pcbPolicyBuffer: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-readlogarchivemetadata ]]
	ReadLogArchiveMetadata :: proc(
		pvArchiveContext: rawptr,
		cbOffset: u32,
		cbBytesToRead: u32,
		pbReadBuffer: ^u8,
		pcbBytesRead: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-readlognotification ]]
	ReadLogNotification :: proc(
		hLog: HANDLE,
		pNotification: ^CLFS_MGMT_NOTIFICATION,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-readlogrecord ]]
	ReadLogRecord :: proc(
		pvMarshal: rawptr,
		plsnFirst: ^CLS_LSN,
		eContextMode: CLFS_CONTEXT_MODE,
		ppvReadBuffer: rawptr,
		pcbReadBuffer: ^u32,
		peRecordType: ^u8,
		plsnUndoNext: ^CLS_LSN,
		plsnPrevious: ^CLS_LSN,
		ppvReadContext: rawptr,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-readlogrestartarea ]]
	ReadLogRestartArea :: proc(
		pvMarshal: rawptr,
		ppvRestartBuffer: rawptr,
		pcbRestartBuffer: ^u32,
		plsn: ^CLS_LSN,
		ppvContext: rawptr,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-readnextlogrecord ]]
	ReadNextLogRecord :: proc(
		pvReadContext: rawptr,
		ppvBuffer: rawptr,
		pcbBuffer: ^u32,
		peRecordType: ^u8,
		plsnUser: ^CLS_LSN,
		plsnUndoNext: ^CLS_LSN,
		plsnPrevious: ^CLS_LSN,
		plsnRecord: ^CLS_LSN,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-readpreviouslogrestartarea ]]
	ReadPreviousLogRestartArea :: proc(
		pvReadContext: rawptr,
		ppvRestartBuffer: rawptr,
		pcbRestartBuffer: ^u32,
		plsnRestart: ^CLS_LSN,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-registerforlogwritenotification ]]
	RegisterForLogWriteNotification :: proc(hLog: HANDLE, cbThreshold: u32, fEnable: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-registermanageablelogclient ]]
	RegisterManageableLogClient :: proc(hLog: HANDLE, pCallbacks: ^LOG_MANAGEMENT_CALLBACKS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-removelogcontainer ]]
	RemoveLogContainer :: proc(hLog: HANDLE, pwszContainerPath: PWSTR, fForce: BOOL, pReserved: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-removelogcontainerset ]]
	RemoveLogContainerSet :: proc(
		hLog: HANDLE,
		cContainer: u16,
		rgwszContainerPath: [^]PWSTR,
		fForce: BOOL,
		pReserved: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-removelogpolicy ]]
	RemoveLogPolicy :: proc(hLog: HANDLE, ePolicyType: CLFS_MGMT_POLICY_TYPE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-reserveandappendlog ]]
	ReserveAndAppendLog :: proc(
		pvMarshal: rawptr,
		rgWriteEntries: ^CLS_WRITE_ENTRY,
		cWriteEntries: u32,
		plsnUndoNext: ^CLS_LSN,
		plsnPrevious: ^CLS_LSN,
		cReserveRecords: u32,
		rgcbReservation: ^i64,
		fFlags: CLFS_FLAG,
		plsn: ^CLS_LSN,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-reserveandappendlogaligned ]]
	ReserveAndAppendLogAligned :: proc(
		pvMarshal: rawptr,
		rgWriteEntries: ^CLS_WRITE_ENTRY,
		cWriteEntries: u32,
		cbEntryAlignment: u32,
		plsnUndoNext: ^CLS_LSN,
		plsnPrevious: ^CLS_LSN,
		cReserveRecords: u32,
		rgcbReservation: ^i64,
		fFlags: CLFS_FLAG,
		plsn: ^CLS_LSN,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-scanlogcontainers ]]
	ScanLogContainers :: proc(pcxScan: ^CLS_SCAN_CONTEXT, eScanMode: u8, pReserved: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-setendoflog ]]
	SetEndOfLog :: proc(hLog: HANDLE, plsnEnd: ^CLS_LSN, lpOverlapped: ^OVERLAPPED) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-setlogarchivemode ]]
	SetLogArchiveMode :: proc(hLog: HANDLE, eMode: CLFS_LOG_ARCHIVE_MODE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-setlogarchivetail ]]
	SetLogArchiveTail :: proc(hLog: HANDLE, plsnArchiveTail: ^CLS_LSN, pReserved: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/nf-clfsmgmtw32-setlogfilesizewithpolicy ]]
	SetLogFileSizeWithPolicy :: proc(hLog: HANDLE, pDesiredSize: ^u64, pResultingSize: ^u64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-terminatelogarchive ]]
	TerminateLogArchive :: proc(pvArchiveContext: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-terminatereadlog ]]
	TerminateReadLog :: proc(pvCursorContext: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-truncatelog ]]
	TruncateLog :: proc(pvMarshal: rawptr, plsnEnd: ^CLS_LSN, lpOverlapped: ^OVERLAPPED) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-validatelog ]]
	ValidateLog :: proc(
		pszLogFileName: PWSTR,
		psaLogFile: ^SECURITY_ATTRIBUTES,
		pinfoBuffer: ^CLS_INFORMATION,
		pcbBuffer: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsw32/nf-clfsw32-writelogrestartarea ]]
	WriteLogRestartArea :: proc(
		pvMarshal: rawptr,
		pvRestartBuffer: rawptr,
		cbRestartBuffer: u32,
		plsnBase: ^CLS_LSN,
		fFlags: CLFS_FLAG,
		pcbWritten: ^u32,
		plsnNext: ^CLS_LSN,
		pOverlapped: ^OVERLAPPED,
	) -> BOOL ---
}

@(default_calling_convention="system")
foreign kernel32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-arefileapisansi ]]
	AreFileApisANSI :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-areshortnamesenabled ]]
	AreShortNamesEnabled :: proc(Handle: HANDLE, Enabled: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-backupread ]]
	BackupRead :: proc(
		hFile: HANDLE,
		lpBuffer: ^u8,
		nNumberOfBytesToRead: u32,
		lpNumberOfBytesRead: ^u32,
		bAbort: BOOL,
		bProcessSecurity: BOOL,
		lpContext: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-backupseek ]]
	BackupSeek :: proc(
		hFile: HANDLE,
		dwLowBytesToSeek: u32,
		dwHighBytesToSeek: u32,
		lpdwLowByteSeeked: ^u32,
		lpdwHighByteSeeked: ^u32,
		lpContext: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-backupwrite ]]
	BackupWrite :: proc(
		hFile: HANDLE,
		lpBuffer: ^u8,
		nNumberOfBytesToWrite: u32,
		lpNumberOfBytesWritten: ^u32,
		bAbort: BOOL,
		bProcessSecurity: BOOL,
		lpContext: rawptr,
	) -> BOOL ---

	BuildIoRingFlushFile :: proc(
		ioRing: HIORING,
		fileRef: IORING_HANDLE_REF,
		flushMode: FILE_FLUSH_MODE,
		userData: uintptr,
		sqeFlags: IORING_SQE_FLAGS,
	) -> HRESULT ---

	BuildIoRingWriteFile :: proc(
		ioRing: HIORING,
		fileRef: IORING_HANDLE_REF,
		bufferRef: IORING_BUFFER_REF,
		numberOfBytesToWrite: u32,
		fileOffset: u64,
		writeFlags: FILE_WRITE_FLAGS,
		userData: uintptr,
		sqeFlags: IORING_SQE_FLAGS,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-checknamelegaldos8dot3a ]]
	CheckNameLegalDOS8Dot3A :: proc(
		lpName: PSTR,
		lpOemName: PSTR,
		OemNameSize: u32,
		pbNameContainsSpaces: ^BOOL,
		pbNameLegal: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-checknamelegaldos8dot3w ]]
	CheckNameLegalDOS8Dot3W :: proc(
		lpName: PWSTR,
		lpOemName: PSTR,
		OemNameSize: u32,
		pbNameContainsSpaces: ^BOOL,
		pbNameLegal: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-comparefiletime ]]
	CompareFileTime :: proc(#by_ptr lpFileTime1: FILETIME, #by_ptr lpFileTime2: FILETIME) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-copyfile2 ]]
	CopyFile2 :: proc(
		pwszExistingFileName: PWSTR,
		pwszNewFileName: PWSTR,
		pExtendedParameters: ^COPYFILE2_EXTENDED_PARAMETERS,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-copyfilea ]]
	CopyFileA :: proc(lpExistingFileName: PSTR, lpNewFileName: PSTR, bFailIfExists: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-copyfileexa ]]
	CopyFileExA :: proc(
		lpExistingFileName: PSTR,
		lpNewFileName: PSTR,
		lpProgressRoutine: LPPROGRESS_ROUTINE,
		lpData: rawptr,
		pbCancel: ^BOOL,
		dwCopyFlags: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-copyfileexw ]]
	CopyFileExW :: proc(
		lpExistingFileName: PWSTR,
		lpNewFileName: PWSTR,
		lpProgressRoutine: LPPROGRESS_ROUTINE,
		lpData: rawptr,
		pbCancel: ^BOOL,
		dwCopyFlags: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-copyfiletransacteda ]]
	CopyFileTransactedA :: proc(
		lpExistingFileName: PSTR,
		lpNewFileName: PSTR,
		lpProgressRoutine: LPPROGRESS_ROUTINE,
		lpData: rawptr,
		pbCancel: ^BOOL,
		dwCopyFlags: u32,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-copyfiletransactedw ]]
	CopyFileTransactedW :: proc(
		lpExistingFileName: PWSTR,
		lpNewFileName: PWSTR,
		lpProgressRoutine: LPPROGRESS_ROUTINE,
		lpData: rawptr,
		pbCancel: ^BOOL,
		dwCopyFlags: u32,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-copyfilew ]]
	CopyFileW :: proc(lpExistingFileName: PWSTR, lpNewFileName: PWSTR, bFailIfExists: BOOL) -> BOOL ---

	CopyLZFile :: proc(hfSource: i32, hfDest: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createdirectorya ]]
	CreateDirectoryA :: proc(lpPathName: PSTR, lpSecurityAttributes: ^SECURITY_ATTRIBUTES) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createdirectoryexa ]]
	CreateDirectoryExA :: proc(
		lpTemplateDirectory: PSTR,
		lpNewDirectory: PSTR,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createdirectoryexw ]]
	CreateDirectoryExW :: proc(
		lpTemplateDirectory: PWSTR,
		lpNewDirectory: PWSTR,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createdirectorytransacteda ]]
	CreateDirectoryTransactedA :: proc(
		lpTemplateDirectory: PSTR,
		lpNewDirectory: PSTR,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createdirectorytransactedw ]]
	CreateDirectoryTransactedW :: proc(
		lpTemplateDirectory: PWSTR,
		lpNewDirectory: PWSTR,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createdirectoryw ]]
	CreateDirectoryW :: proc(lpPathName: PWSTR, lpSecurityAttributes: ^SECURITY_ATTRIBUTES) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfile2 ]]
	CreateFile2 :: proc(
		lpFileName: PWSTR,
		dwDesiredAccess: u32,
		dwShareMode: FILE_SHARE_MODE,
		dwCreationDisposition: FILE_CREATION_DISPOSITION,
		pCreateExParams: ^CREATEFILE2_EXTENDED_PARAMETERS,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilea ]]
	CreateFileA :: proc(
		lpFileName: PSTR,
		dwDesiredAccess: u32,
		dwShareMode: FILE_SHARE_MODE,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		dwCreationDisposition: FILE_CREATION_DISPOSITION,
		dwFlagsAndAttributes: FILE_FLAGS_AND_ATTRIBUTES,
		hTemplateFile: HANDLE,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createfiletransacteda ]]
	CreateFileTransactedA :: proc(
		lpFileName: PSTR,
		dwDesiredAccess: u32,
		dwShareMode: FILE_SHARE_MODE,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		dwCreationDisposition: FILE_CREATION_DISPOSITION,
		dwFlagsAndAttributes: FILE_FLAGS_AND_ATTRIBUTES,
		hTemplateFile: HANDLE,
		hTransaction: HANDLE,
		pusMiniVersion: ^TXFS_MINIVERSION,
		lpExtendedParameter: rawptr,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createfiletransactedw ]]
	CreateFileTransactedW :: proc(
		lpFileName: PWSTR,
		dwDesiredAccess: u32,
		dwShareMode: FILE_SHARE_MODE,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		dwCreationDisposition: FILE_CREATION_DISPOSITION,
		dwFlagsAndAttributes: FILE_FLAGS_AND_ATTRIBUTES,
		hTemplateFile: HANDLE,
		hTransaction: HANDLE,
		pusMiniVersion: ^TXFS_MINIVERSION,
		lpExtendedParameter: rawptr,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-createfilew ]]
	CreateFileW :: proc(
		lpFileName: PWSTR,
		dwDesiredAccess: u32,
		dwShareMode: FILE_SHARE_MODE,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		dwCreationDisposition: FILE_CREATION_DISPOSITION,
		dwFlagsAndAttributes: FILE_FLAGS_AND_ATTRIBUTES,
		hTemplateFile: HANDLE,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createhardlinka ]]
	CreateHardLinkA :: proc(
		lpFileName: PSTR,
		lpExistingFileName: PSTR,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createhardlinktransacteda ]]
	CreateHardLinkTransactedA :: proc(
		lpFileName: PSTR,
		lpExistingFileName: PSTR,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createhardlinktransactedw ]]
	CreateHardLinkTransactedW :: proc(
		lpFileName: PWSTR,
		lpExistingFileName: PWSTR,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createhardlinkw ]]
	CreateHardLinkW :: proc(
		lpFileName: PWSTR,
		lpExistingFileName: PWSTR,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createsymboliclinka ]]
	CreateSymbolicLinkA :: proc(
		lpSymlinkFileName: PSTR,
		lpTargetFileName: PSTR,
		dwFlags: SYMBOLIC_LINK_FLAGS,
	) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createsymboliclinktransacteda ]]
	CreateSymbolicLinkTransactedA :: proc(
		lpSymlinkFileName: PSTR,
		lpTargetFileName: PSTR,
		dwFlags: SYMBOLIC_LINK_FLAGS,
		hTransaction: HANDLE,
	) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createsymboliclinktransactedw ]]
	CreateSymbolicLinkTransactedW :: proc(
		lpSymlinkFileName: PWSTR,
		lpTargetFileName: PWSTR,
		dwFlags: SYMBOLIC_LINK_FLAGS,
		hTransaction: HANDLE,
	) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createsymboliclinkw ]]
	CreateSymbolicLinkW :: proc(
		lpSymlinkFileName: PWSTR,
		lpTargetFileName: PWSTR,
		dwFlags: SYMBOLIC_LINK_FLAGS,
	) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createtapepartition ]]
	CreateTapePartition :: proc(
		hDevice: HANDLE,
		dwPartitionMethod: CREATE_TAPE_PARTITION_METHOD,
		dwCount: u32,
		dwSize: u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-definedosdevicea ]]
	DefineDosDeviceA :: proc(dwFlags: DEFINE_DOS_DEVICE_FLAGS, lpDeviceName: PSTR, lpTargetPath: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-definedosdevicew ]]
	DefineDosDeviceW :: proc(dwFlags: DEFINE_DOS_DEVICE_FLAGS, lpDeviceName: PWSTR, lpTargetPath: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-deletefilea ]]
	DeleteFileA :: proc(lpFileName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deletefiletransacteda ]]
	DeleteFileTransactedA :: proc(lpFileName: PSTR, hTransaction: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deletefiletransactedw ]]
	DeleteFileTransactedW :: proc(lpFileName: PWSTR, hTransaction: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-deletefilew ]]
	DeleteFileW :: proc(lpFileName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deletevolumemountpointa ]]
	DeleteVolumeMountPointA :: proc(lpszVolumeMountPoint: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-deletevolumemountpointw ]]
	DeleteVolumeMountPointW :: proc(lpszVolumeMountPoint: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-erasetape ]]
	EraseTape :: proc(hDevice: HANDLE, dwEraseType: ERASE_TAPE_TYPE, bImmediate: BOOL) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-filetimetolocalfiletime ]]
	FileTimeToLocalFileTime :: proc(#by_ptr lpFileTime: FILETIME, lpLocalFileTime: ^FILETIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findclose ]]
	FindClose :: proc(hFindFile: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findclosechangenotification ]]
	FindCloseChangeNotification :: proc(hChangeHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstchangenotificationa ]]
	FindFirstChangeNotificationA :: proc(lpPathName: PSTR, bWatchSubtree: BOOL, dwNotifyFilter: FILE_NOTIFY_CHANGE) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstchangenotificationw ]]
	FindFirstChangeNotificationW :: proc(lpPathName: PWSTR, bWatchSubtree: BOOL, dwNotifyFilter: FILE_NOTIFY_CHANGE) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstfilea ]]
	FindFirstFileA :: proc(lpFileName: PSTR, lpFindFileData: ^WIN32_FIND_DATAA) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstfileexa ]]
	FindFirstFileExA :: proc(
		lpFileName: PSTR,
		fInfoLevelId: FINDEX_INFO_LEVELS,
		lpFindFileData: rawptr,
		fSearchOp: FINDEX_SEARCH_OPS,
		lpSearchFilter: rawptr,
		dwAdditionalFlags: FIND_FIRST_EX_FLAGS,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstfileexw ]]
	FindFirstFileExW :: proc(
		lpFileName: PWSTR,
		fInfoLevelId: FINDEX_INFO_LEVELS,
		lpFindFileData: rawptr,
		fSearchOp: FINDEX_SEARCH_OPS,
		lpSearchFilter: rawptr,
		dwAdditionalFlags: FIND_FIRST_EX_FLAGS,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findfirstfilenametransactedw ]]
	FindFirstFileNameTransactedW :: proc(
		lpFileName: PWSTR,
		dwFlags: u32,
		StringLength: ^u32,
		LinkName: PWSTR,
		hTransaction: HANDLE,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstfilenamew ]]
	FindFirstFileNameW :: proc(lpFileName: PWSTR, dwFlags: u32, StringLength: ^u32, LinkName: PWSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findfirstfiletransacteda ]]
	FindFirstFileTransactedA :: proc(
		lpFileName: PSTR,
		fInfoLevelId: FINDEX_INFO_LEVELS,
		lpFindFileData: rawptr,
		fSearchOp: FINDEX_SEARCH_OPS,
		lpSearchFilter: rawptr,
		dwAdditionalFlags: u32,
		hTransaction: HANDLE,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findfirstfiletransactedw ]]
	FindFirstFileTransactedW :: proc(
		lpFileName: PWSTR,
		fInfoLevelId: FINDEX_INFO_LEVELS,
		lpFindFileData: rawptr,
		fSearchOp: FINDEX_SEARCH_OPS,
		lpSearchFilter: rawptr,
		dwAdditionalFlags: u32,
		hTransaction: HANDLE,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstfilew ]]
	FindFirstFileW :: proc(lpFileName: PWSTR, lpFindFileData: ^WIN32_FIND_DATAW) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findfirststreamtransactedw ]]
	FindFirstStreamTransactedW :: proc(
		lpFileName: PWSTR,
		InfoLevel: STREAM_INFO_LEVELS,
		lpFindStreamData: rawptr,
		dwFlags: u32,
		hTransaction: HANDLE,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirststreamw ]]
	FindFirstStreamW :: proc(
		lpFileName: PWSTR,
		InfoLevel: STREAM_INFO_LEVELS,
		lpFindStreamData: rawptr,
		dwFlags: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findfirstvolumea ]]
	FindFirstVolumeA :: proc(lpszVolumeName: PSTR, cchBufferLength: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findfirstvolumemountpointa ]]
	FindFirstVolumeMountPointA :: proc(lpszRootPathName: PSTR, lpszVolumeMountPoint: PSTR, cchBufferLength: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findfirstvolumemountpointw ]]
	FindFirstVolumeMountPointW :: proc(lpszRootPathName: PWSTR, lpszVolumeMountPoint: PWSTR, cchBufferLength: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findfirstvolumew ]]
	FindFirstVolumeW :: proc(lpszVolumeName: PWSTR, cchBufferLength: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findnextchangenotification ]]
	FindNextChangeNotification :: proc(hChangeHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findnextfilea ]]
	FindNextFileA :: proc(hFindFile: HANDLE, lpFindFileData: ^WIN32_FIND_DATAA) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findnextfilenamew ]]
	FindNextFileNameW :: proc(hFindStream: HANDLE, StringLength: ^u32, LinkName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findnextfilew ]]
	FindNextFileW :: proc(hFindFile: HANDLE, lpFindFileData: ^WIN32_FIND_DATAW) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findnextstreamw ]]
	FindNextStreamW :: proc(hFindStream: HANDLE, lpFindStreamData: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findnextvolumea ]]
	FindNextVolumeA :: proc(hFindVolume: HANDLE, lpszVolumeName: PSTR, cchBufferLength: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findnextvolumemountpointa ]]
	FindNextVolumeMountPointA :: proc(
		hFindVolumeMountPoint: HANDLE,
		lpszVolumeMountPoint: PSTR,
		cchBufferLength: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findnextvolumemountpointw ]]
	FindNextVolumeMountPointW :: proc(
		hFindVolumeMountPoint: HANDLE,
		lpszVolumeMountPoint: PWSTR,
		cchBufferLength: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findnextvolumew ]]
	FindNextVolumeW :: proc(hFindVolume: HANDLE, lpszVolumeName: PWSTR, cchBufferLength: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-findvolumeclose ]]
	FindVolumeClose :: proc(hFindVolume: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-findvolumemountpointclose ]]
	FindVolumeMountPointClose :: proc(hFindVolumeMountPoint: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-flushfilebuffers ]]
	FlushFileBuffers :: proc(hFile: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getbinarytypea ]]
	GetBinaryTypeA :: proc(lpApplicationName: PSTR, lpBinaryType: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getbinarytypew ]]
	GetBinaryTypeW :: proc(lpApplicationName: PWSTR, lpBinaryType: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getcompressedfilesizea ]]
	GetCompressedFileSizeA :: proc(lpFileName: PSTR, lpFileSizeHigh: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcompressedfilesizetransacteda ]]
	GetCompressedFileSizeTransactedA :: proc(lpFileName: PSTR, lpFileSizeHigh: ^u32, hTransaction: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcompressedfilesizetransactedw ]]
	GetCompressedFileSizeTransactedW :: proc(lpFileName: PWSTR, lpFileSizeHigh: ^u32, hTransaction: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getcompressedfilesizew ]]
	GetCompressedFileSizeW :: proc(lpFileName: PWSTR, lpFileSizeHigh: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getdiskfreespacea ]]
	GetDiskFreeSpaceA :: proc(
		lpRootPathName: PSTR,
		lpSectorsPerCluster: ^u32,
		lpBytesPerSector: ^u32,
		lpNumberOfFreeClusters: ^u32,
		lpTotalNumberOfClusters: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getdiskfreespaceexa ]]
	GetDiskFreeSpaceExA :: proc(
		lpDirectoryName: PSTR,
		lpFreeBytesAvailableToCaller: ^u64,
		lpTotalNumberOfBytes: ^u64,
		lpTotalNumberOfFreeBytes: ^u64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getdiskfreespaceexw ]]
	GetDiskFreeSpaceExW :: proc(
		lpDirectoryName: PWSTR,
		lpFreeBytesAvailableToCaller: ^u64,
		lpTotalNumberOfBytes: ^u64,
		lpTotalNumberOfFreeBytes: ^u64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getdiskfreespacew ]]
	GetDiskFreeSpaceW :: proc(
		lpRootPathName: PWSTR,
		lpSectorsPerCluster: ^u32,
		lpBytesPerSector: ^u32,
		lpNumberOfFreeClusters: ^u32,
		lpTotalNumberOfClusters: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getdiskspaceinformationa ]]
	GetDiskSpaceInformationA :: proc(rootPath: PSTR, diskSpaceInfo: ^DISK_SPACE_INFORMATION) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getdiskspaceinformationw ]]
	GetDiskSpaceInformationW :: proc(rootPath: PWSTR, diskSpaceInfo: ^DISK_SPACE_INFORMATION) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getdrivetypea ]]
	GetDriveTypeA :: proc(lpRootPathName: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getdrivetypew ]]
	GetDriveTypeW :: proc(lpRootPathName: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-getexpandednamea ]]
	GetExpandedNameA :: proc(lpszSource: PSTR, lpszBuffer: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-getexpandednamew ]]
	GetExpandedNameW :: proc(lpszSource: PWSTR, lpszBuffer: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfileattributesa ]]
	GetFileAttributesA :: proc(lpFileName: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfileattributesexa ]]
	GetFileAttributesExA :: proc(
		lpFileName: PSTR,
		fInfoLevelId: GET_FILEEX_INFO_LEVELS,
		lpFileInformation: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfileattributesexw ]]
	GetFileAttributesExW :: proc(
		lpFileName: PWSTR,
		fInfoLevelId: GET_FILEEX_INFO_LEVELS,
		lpFileInformation: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfileattributestransacteda ]]
	GetFileAttributesTransactedA :: proc(
		lpFileName: PSTR,
		fInfoLevelId: GET_FILEEX_INFO_LEVELS,
		lpFileInformation: rawptr,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfileattributestransactedw ]]
	GetFileAttributesTransactedW :: proc(
		lpFileName: PWSTR,
		fInfoLevelId: GET_FILEEX_INFO_LEVELS,
		lpFileInformation: rawptr,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfileattributesw ]]
	GetFileAttributesW :: proc(lpFileName: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfilebandwidthreservation ]]
	GetFileBandwidthReservation :: proc(
		hFile: HANDLE,
		lpPeriodMilliseconds: ^u32,
		lpBytesPerPeriod: ^u32,
		pDiscardable: ^BOOL,
		lpTransferSize: ^u32,
		lpNumOutstandingRequests: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfileinformationbyhandle ]]
	GetFileInformationByHandle :: proc(hFile: HANDLE, lpFileInformation: ^BY_HANDLE_FILE_INFORMATION) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfileinformationbyhandleex ]]
	GetFileInformationByHandleEx :: proc(
		hFile: HANDLE,
		FileInformationClass: FILE_INFO_BY_HANDLE_CLASS,
		lpFileInformation: rawptr,
		dwBufferSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfilesize ]]
	GetFileSize :: proc(hFile: HANDLE, lpFileSizeHigh: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfilesizeex ]]
	GetFileSizeEx :: proc(hFile: HANDLE, lpFileSize: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfiletime ]]
	GetFileTime :: proc(
		hFile: HANDLE,
		lpCreationTime: ^FILETIME,
		lpLastAccessTime: ^FILETIME,
		lpLastWriteTime: ^FILETIME,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfiletype ]]
	GetFileType :: proc(hFile: HANDLE) -> FILE_TYPE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfinalpathnamebyhandlea ]]
	GetFinalPathNameByHandleA :: proc(
		hFile: HANDLE,
		lpszFilePath: PSTR,
		cchFilePath: u32,
		dwFlags: GETFINALPATHNAMEBYHANDLE_FLAGS,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfinalpathnamebyhandlew ]]
	GetFinalPathNameByHandleW :: proc(
		hFile: HANDLE,
		lpszFilePath: PWSTR,
		cchFilePath: u32,
		dwFlags: GETFINALPATHNAMEBYHANDLE_FLAGS,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfullpathnamea ]]
	GetFullPathNameA :: proc(lpFileName: PSTR, nBufferLength: u32, lpBuffer: PSTR, lpFilePart: ^PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfullpathnametransacteda ]]
	GetFullPathNameTransactedA :: proc(
		lpFileName: PSTR,
		nBufferLength: u32,
		lpBuffer: PSTR,
		lpFilePart: ^PSTR,
		hTransaction: HANDLE,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfullpathnametransactedw ]]
	GetFullPathNameTransactedW :: proc(
		lpFileName: PWSTR,
		nBufferLength: u32,
		lpBuffer: PWSTR,
		lpFilePart: ^PWSTR,
		hTransaction: HANDLE,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getfullpathnamew ]]
	GetFullPathNameW :: proc(lpFileName: PWSTR, nBufferLength: u32, lpBuffer: PWSTR, lpFilePart: ^PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getlogicaldrives ]]
	GetLogicalDrives :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getlogicaldrivestringsa ]]
	GetLogicalDriveStringsA :: proc(nBufferLength: u32, lpBuffer: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getlogicaldrivestringsw ]]
	GetLogicalDriveStringsW :: proc(nBufferLength: u32, lpBuffer: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getlongpathnamea ]]
	GetLongPathNameA :: proc(lpszShortPath: PSTR, lpszLongPath: PSTR, cchBuffer: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getlongpathnametransacteda ]]
	GetLongPathNameTransactedA :: proc(lpszShortPath: PSTR, lpszLongPath: PSTR, cchBuffer: u32, hTransaction: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getlongpathnametransactedw ]]
	GetLongPathNameTransactedW :: proc(lpszShortPath: PWSTR, lpszLongPath: PWSTR, cchBuffer: u32, hTransaction: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getlongpathnamew ]]
	GetLongPathNameW :: proc(lpszShortPath: PWSTR, lpszLongPath: PWSTR, cchBuffer: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getshortpathnamea ]]
	GetShortPathNameA :: proc(lpszLongPath: PSTR, lpszShortPath: PSTR, cchBuffer: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getshortpathnamew ]]
	GetShortPathNameW :: proc(lpszLongPath: PWSTR, lpszShortPath: PWSTR, cchBuffer: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-gettapeparameters ]]
	GetTapeParameters :: proc(
		hDevice: HANDLE,
		dwOperation: GET_TAPE_DRIVE_PARAMETERS_OPERATION,
		lpdwSize: ^u32,
		lpTapeInformation: rawptr,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-gettapeposition ]]
	GetTapePosition :: proc(
		hDevice: HANDLE,
		dwPositionType: TAPE_POSITION_TYPE,
		lpdwPartition: ^u32,
		lpdwOffsetLow: ^u32,
		lpdwOffsetHigh: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-gettapestatus ]]
	GetTapeStatus :: proc(hDevice: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-gettempfilenamea ]]
	GetTempFileNameA :: proc(lpPathName: PSTR, lpPrefixString: PSTR, uUnique: u32, lpTempFileName: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-gettempfilenamew ]]
	GetTempFileNameW :: proc(lpPathName: PWSTR, lpPrefixString: PWSTR, uUnique: u32, lpTempFileName: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-gettemppath2a ]]
	GetTempPath2A :: proc(BufferLength: u32, Buffer: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-gettemppath2w ]]
	GetTempPath2W :: proc(BufferLength: u32, Buffer: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-gettemppatha ]]
	GetTempPathA :: proc(nBufferLength: u32, lpBuffer: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-gettemppathw ]]
	GetTempPathW :: proc(nBufferLength: u32, lpBuffer: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getvolumeinformationa ]]
	GetVolumeInformationA :: proc(
		lpRootPathName: PSTR,
		lpVolumeNameBuffer: PSTR,
		nVolumeNameSize: u32,
		lpVolumeSerialNumber: ^u32,
		lpMaximumComponentLength: ^u32,
		lpFileSystemFlags: ^u32,
		lpFileSystemNameBuffer: PSTR,
		nFileSystemNameSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getvolumeinformationbyhandlew ]]
	GetVolumeInformationByHandleW :: proc(
		hFile: HANDLE,
		lpVolumeNameBuffer: PWSTR,
		nVolumeNameSize: u32,
		lpVolumeSerialNumber: ^u32,
		lpMaximumComponentLength: ^u32,
		lpFileSystemFlags: ^u32,
		lpFileSystemNameBuffer: PWSTR,
		nFileSystemNameSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getvolumeinformationw ]]
	GetVolumeInformationW :: proc(
		lpRootPathName: PWSTR,
		lpVolumeNameBuffer: PWSTR,
		nVolumeNameSize: u32,
		lpVolumeSerialNumber: ^u32,
		lpMaximumComponentLength: ^u32,
		lpFileSystemFlags: ^u32,
		lpFileSystemNameBuffer: PWSTR,
		nFileSystemNameSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getvolumenameforvolumemountpointa ]]
	GetVolumeNameForVolumeMountPointA :: proc(lpszVolumeMountPoint: PSTR, lpszVolumeName: PSTR, cchBufferLength: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getvolumenameforvolumemountpointw ]]
	GetVolumeNameForVolumeMountPointW :: proc(lpszVolumeMountPoint: PWSTR, lpszVolumeName: PWSTR, cchBufferLength: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getvolumepathnamea ]]
	GetVolumePathNameA :: proc(lpszFileName: PSTR, lpszVolumePathName: PSTR, cchBufferLength: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getvolumepathnamesforvolumenamea ]]
	GetVolumePathNamesForVolumeNameA :: proc(
		lpszVolumeName: PSTR,
		lpszVolumePathNames: PSTR,
		cchBufferLength: u32,
		lpcchReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getvolumepathnamesforvolumenamew ]]
	GetVolumePathNamesForVolumeNameW :: proc(
		lpszVolumeName: PWSTR,
		lpszVolumePathNames: PWSTR,
		cchBufferLength: u32,
		lpcchReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getvolumepathnamew ]]
	GetVolumePathNameW :: proc(lpszFileName: PWSTR, lpszVolumePathName: PWSTR, cchBufferLength: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-localfiletimetofiletime ]]
	LocalFileTimeToFileTime :: proc(#by_ptr lpLocalFileTime: FILETIME, lpFileTime: ^FILETIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-lockfile ]]
	LockFile :: proc(
		hFile: HANDLE,
		dwFileOffsetLow: u32,
		dwFileOffsetHigh: u32,
		nNumberOfBytesToLockLow: u32,
		nNumberOfBytesToLockHigh: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-lockfileex ]]
	LockFileEx :: proc(
		hFile: HANDLE,
		dwFlags: LOCK_FILE_FLAGS,
		dwReserved: u32,
		nNumberOfBytesToLockLow: u32,
		nNumberOfBytesToLockHigh: u32,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-lzclose ]]
	LZClose :: proc(hFile: i32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-lzcopy ]]
	LZCopy :: proc(hfSource: i32, hfDest: i32) -> i32 ---

	LZDone :: proc() ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-lzinit ]]
	LZInit :: proc(hfSource: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-lzopenfilea ]]
	LZOpenFileA :: proc(lpFileName: PSTR, lpReOpenBuf: ^OFSTRUCT, wStyle: LZOPENFILE_STYLE) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-lzopenfilew ]]
	LZOpenFileW :: proc(lpFileName: PWSTR, lpReOpenBuf: ^OFSTRUCT, wStyle: LZOPENFILE_STYLE) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-lzread ]]
	LZRead :: proc(hFile: i32, lpBuffer: PSTR, cbRead: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lzexpand/nf-lzexpand-lzseek ]]
	LZSeek :: proc(hFile: i32, lOffset: i32, iOrigin: i32) -> i32 ---

	LZStart :: proc() -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-movefilea ]]
	MoveFileA :: proc(lpExistingFileName: PSTR, lpNewFileName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-movefileexa ]]
	MoveFileExA :: proc(lpExistingFileName: PSTR, lpNewFileName: PSTR, dwFlags: MOVE_FILE_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-movefileexw ]]
	MoveFileExW :: proc(lpExistingFileName: PWSTR, lpNewFileName: PWSTR, dwFlags: MOVE_FILE_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-movefiletransacteda ]]
	MoveFileTransactedA :: proc(
		lpExistingFileName: PSTR,
		lpNewFileName: PSTR,
		lpProgressRoutine: LPPROGRESS_ROUTINE,
		lpData: rawptr,
		dwFlags: MOVE_FILE_FLAGS,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-movefiletransactedw ]]
	MoveFileTransactedW :: proc(
		lpExistingFileName: PWSTR,
		lpNewFileName: PWSTR,
		lpProgressRoutine: LPPROGRESS_ROUTINE,
		lpData: rawptr,
		dwFlags: MOVE_FILE_FLAGS,
		hTransaction: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-movefilew ]]
	MoveFileW :: proc(lpExistingFileName: PWSTR, lpNewFileName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-movefilewithprogressa ]]
	MoveFileWithProgressA :: proc(
		lpExistingFileName: PSTR,
		lpNewFileName: PSTR,
		lpProgressRoutine: LPPROGRESS_ROUTINE,
		lpData: rawptr,
		dwFlags: MOVE_FILE_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-movefilewithprogressw ]]
	MoveFileWithProgressW :: proc(
		lpExistingFileName: PWSTR,
		lpNewFileName: PWSTR,
		lpProgressRoutine: LPPROGRESS_ROUTINE,
		lpData: rawptr,
		dwFlags: MOVE_FILE_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openfile ]]
	OpenFile :: proc(lpFileName: PSTR, lpReOpenBuff: ^OFSTRUCT, uStyle: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openfilebyid ]]
	OpenFileById :: proc(
		hVolumeHint: HANDLE,
		lpFileId: ^FILE_ID_DESCRIPTOR,
		dwDesiredAccess: u32,
		dwShareMode: FILE_SHARE_MODE,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		dwFlagsAndAttributes: FILE_FLAGS_AND_ATTRIBUTES,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-preparetape ]]
	PrepareTape :: proc(hDevice: HANDLE, dwOperation: PREPARE_TAPE_OPERATION, bImmediate: BOOL) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-querydosdevicea ]]
	QueryDosDeviceA :: proc(lpDeviceName: PSTR, lpTargetPath: PSTR, ucchMax: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-querydosdevicew ]]
	QueryDosDeviceW :: proc(lpDeviceName: PWSTR, lpTargetPath: PWSTR, ucchMax: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-readdirectorychangesexw ]]
	ReadDirectoryChangesExW :: proc(
		hDirectory: HANDLE,
		lpBuffer: rawptr,
		nBufferLength: u32,
		bWatchSubtree: BOOL,
		dwNotifyFilter: FILE_NOTIFY_CHANGE,
		lpBytesReturned: ^u32,
		lpOverlapped: ^OVERLAPPED,
		lpCompletionRoutine: LPOVERLAPPED_COMPLETION_ROUTINE,
		ReadDirectoryNotifyInformationClass: READ_DIRECTORY_NOTIFY_INFORMATION_CLASS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-readdirectorychangesw ]]
	ReadDirectoryChangesW :: proc(
		hDirectory: HANDLE,
		lpBuffer: rawptr,
		nBufferLength: u32,
		bWatchSubtree: BOOL,
		dwNotifyFilter: FILE_NOTIFY_CHANGE,
		lpBytesReturned: ^u32,
		lpOverlapped: ^OVERLAPPED,
		lpCompletionRoutine: LPOVERLAPPED_COMPLETION_ROUTINE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfile ]]
	ReadFile :: proc(
		hFile: HANDLE,
		lpBuffer: ^u8,
		nNumberOfBytesToRead: u32,
		lpNumberOfBytesRead: ^u32,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfileex ]]
	ReadFileEx :: proc(
		hFile: HANDLE,
		lpBuffer: ^u8,
		nNumberOfBytesToRead: u32,
		lpOverlapped: ^OVERLAPPED,
		lpCompletionRoutine: LPOVERLAPPED_COMPLETION_ROUTINE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-readfilescatter ]]
	ReadFileScatter :: proc(
		hFile: HANDLE,
		aSegmentArray: ^FILE_SEGMENT_ELEMENT,
		nNumberOfBytesToRead: u32,
		lpReserved: ^u32,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-removedirectorya ]]
	RemoveDirectoryA :: proc(lpPathName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-removedirectorytransacteda ]]
	RemoveDirectoryTransactedA :: proc(lpPathName: PSTR, hTransaction: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-removedirectorytransactedw ]]
	RemoveDirectoryTransactedW :: proc(lpPathName: PWSTR, hTransaction: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-removedirectoryw ]]
	RemoveDirectoryW :: proc(lpPathName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-reopenfile ]]
	ReOpenFile :: proc(
		hOriginalFile: HANDLE,
		dwDesiredAccess: u32,
		dwShareMode: FILE_SHARE_MODE,
		dwFlagsAndAttributes: FILE_FLAGS_AND_ATTRIBUTES,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-replacefilea ]]
	ReplaceFileA :: proc(
		lpReplacedFileName: PSTR,
		lpReplacementFileName: PSTR,
		lpBackupFileName: PSTR,
		dwReplaceFlags: REPLACE_FILE_FLAGS,
		lpExclude: rawptr,
		lpReserved: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-replacefilew ]]
	ReplaceFileW :: proc(
		lpReplacedFileName: PWSTR,
		lpReplacementFileName: PWSTR,
		lpBackupFileName: PWSTR,
		dwReplaceFlags: REPLACE_FILE_FLAGS,
		lpExclude: rawptr,
		lpReserved: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-searchpatha ]]
	SearchPathA :: proc(
		lpPath: PSTR,
		lpFileName: PSTR,
		lpExtension: PSTR,
		nBufferLength: u32,
		lpBuffer: PSTR,
		lpFilePart: ^PSTR,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-searchpathw ]]
	SearchPathW :: proc(
		lpPath: PWSTR,
		lpFileName: PWSTR,
		lpExtension: PWSTR,
		nBufferLength: u32,
		lpBuffer: PWSTR,
		lpFilePart: ^PWSTR,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setendoffile ]]
	SetEndOfFile :: proc(hFile: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfileapistoansi ]]
	SetFileApisToANSI :: proc() ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfileapistooem ]]
	SetFileApisToOEM :: proc() ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfileattributesa ]]
	SetFileAttributesA :: proc(lpFileName: PSTR, dwFileAttributes: FILE_FLAGS_AND_ATTRIBUTES) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfileattributestransacteda ]]
	SetFileAttributesTransactedA :: proc(lpFileName: PSTR, dwFileAttributes: u32, hTransaction: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfileattributestransactedw ]]
	SetFileAttributesTransactedW :: proc(lpFileName: PWSTR, dwFileAttributes: u32, hTransaction: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfileattributesw ]]
	SetFileAttributesW :: proc(lpFileName: PWSTR, dwFileAttributes: FILE_FLAGS_AND_ATTRIBUTES) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfilebandwidthreservation ]]
	SetFileBandwidthReservation :: proc(
		hFile: HANDLE,
		nPeriodMilliseconds: u32,
		nBytesPerPeriod: u32,
		bDiscardable: BOOL,
		lpTransferSize: ^u32,
		lpNumOutstandingRequests: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfilecompletionnotificationmodes ]]
	SetFileCompletionNotificationModes :: proc(FileHandle: HANDLE, Flags: u8) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfileinformationbyhandle ]]
	SetFileInformationByHandle :: proc(
		hFile: HANDLE,
		FileInformationClass: FILE_INFO_BY_HANDLE_CLASS,
		lpFileInformation: rawptr,
		dwBufferSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfileiooverlappedrange ]]
	SetFileIoOverlappedRange :: proc(FileHandle: HANDLE, OverlappedRangeStart: ^u8, Length: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfilepointer ]]
	SetFilePointer :: proc(
		hFile: HANDLE,
		lDistanceToMove: i32,
		lpDistanceToMoveHigh: ^i32,
		dwMoveMethod: SET_FILE_POINTER_MOVE_METHOD,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfilepointerex ]]
	SetFilePointerEx :: proc(
		hFile: HANDLE,
		liDistanceToMove: i64,
		lpNewFilePointer: ^i64,
		dwMoveMethod: SET_FILE_POINTER_MOVE_METHOD,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfileshortnamea ]]
	SetFileShortNameA :: proc(hFile: HANDLE, lpShortName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfileshortnamew ]]
	SetFileShortNameW :: proc(hFile: HANDLE, lpShortName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfiletime ]]
	SetFileTime :: proc(
		hFile: HANDLE,
		lpCreationTime: ^FILETIME,
		lpLastAccessTime: ^FILETIME,
		lpLastWriteTime: ^FILETIME,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-setfilevaliddata ]]
	SetFileValidData :: proc(hFile: HANDLE, ValidDataLength: i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setsearchpathmode ]]
	SetSearchPathMode :: proc(Flags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-settapeparameters ]]
	SetTapeParameters :: proc(
		hDevice: HANDLE,
		dwOperation: TAPE_INFORMATION_TYPE,
		lpTapeInformation: rawptr,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-settapeposition ]]
	SetTapePosition :: proc(
		hDevice: HANDLE,
		dwPositionMethod: TAPE_POSITION_METHOD,
		dwPartition: u32,
		dwOffsetLow: u32,
		dwOffsetHigh: u32,
		bImmediate: BOOL,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setvolumelabela ]]
	SetVolumeLabelA :: proc(lpRootPathName: PSTR, lpVolumeName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setvolumelabelw ]]
	SetVolumeLabelW :: proc(lpRootPathName: PWSTR, lpVolumeName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setvolumemountpointa ]]
	SetVolumeMountPointA :: proc(lpszVolumeMountPoint: PSTR, lpszVolumeName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setvolumemountpointw ]]
	SetVolumeMountPointW :: proc(lpszVolumeMountPoint: PWSTR, lpszVolumeName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-unlockfile ]]
	UnlockFile :: proc(
		hFile: HANDLE,
		dwFileOffsetLow: u32,
		dwFileOffsetHigh: u32,
		nNumberOfBytesToUnlockLow: u32,
		nNumberOfBytesToUnlockHigh: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-unlockfileex ]]
	UnlockFileEx :: proc(
		hFile: HANDLE,
		dwReserved: u32,
		nNumberOfBytesToUnlockLow: u32,
		nNumberOfBytesToUnlockHigh: u32,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-verlanguagenamea ]]
	VerLanguageNameA :: proc(wLang: u32, szLang: PSTR, cchLang: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-verlanguagenamew ]]
	VerLanguageNameW :: proc(wLang: u32, szLang: PWSTR, cchLang: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-wow64disablewow64fsredirection ]]
	Wow64DisableWow64FsRedirection :: proc(OldValue: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-wow64enablewow64fsredirection ]]
	Wow64EnableWow64FsRedirection :: proc(Wow64FsEnableRedirection: BOOLEAN) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-wow64revertwow64fsredirection ]]
	Wow64RevertWow64FsRedirection :: proc(OlValue: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-writefile ]]
	WriteFile :: proc(
		hFile: HANDLE,
		lpBuffer: ^u8,
		nNumberOfBytesToWrite: u32,
		lpNumberOfBytesWritten: ^u32,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-writefileex ]]
	WriteFileEx :: proc(
		hFile: HANDLE,
		lpBuffer: ^u8,
		nNumberOfBytesToWrite: u32,
		lpOverlapped: ^OVERLAPPED,
		lpCompletionRoutine: LPOVERLAPPED_COMPLETION_ROUTINE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-writefilegather ]]
	WriteFileGather :: proc(
		hFile: HANDLE,
		aSegmentArray: ^FILE_SEGMENT_ELEMENT,
		nNumberOfBytesToWrite: u32,
		lpReserved: ^u32,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-writetapemark ]]
	WriteTapemark :: proc(
		hDevice: HANDLE,
		dwTapemarkType: TAPEMARK_TYPE,
		dwTapemarkCount: u32,
		bImmediate: BOOL,
	) -> u32 ---
}

@(default_calling_convention="system")
foreign ktmw32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-commitcomplete ]]
	CommitComplete :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-commitenlistment ]]
	CommitEnlistment :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-committransaction ]]
	CommitTransaction :: proc(TransactionHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-committransactionasync ]]
	CommitTransactionAsync :: proc(TransactionHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-createenlistment ]]
	CreateEnlistment :: proc(
		lpEnlistmentAttributes: ^SECURITY_ATTRIBUTES,
		ResourceManagerHandle: HANDLE,
		TransactionHandle: HANDLE,
		NotificationMask: u32,
		CreateOptions: u32,
		EnlistmentKey: rawptr,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-createresourcemanager ]]
	CreateResourceManager :: proc(
		lpResourceManagerAttributes: ^SECURITY_ATTRIBUTES,
		ResourceManagerId: ^GUID,
		CreateOptions: u32,
		TmHandle: HANDLE,
		Description: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-createtransaction ]]
	CreateTransaction :: proc(
		lpTransactionAttributes: ^SECURITY_ATTRIBUTES,
		UOW: ^GUID,
		CreateOptions: u32,
		IsolationLevel: u32,
		IsolationFlags: u32,
		Timeout: u32,
		Description: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-createtransactionmanager ]]
	CreateTransactionManager :: proc(
		lpTransactionAttributes: ^SECURITY_ATTRIBUTES,
		LogFileName: PWSTR,
		CreateOptions: u32,
		CommitStrength: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-getcurrentclocktransactionmanager ]]
	GetCurrentClockTransactionManager :: proc(TransactionManagerHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-getenlistmentid ]]
	GetEnlistmentId :: proc(EnlistmentHandle: HANDLE, EnlistmentId: ^GUID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-getenlistmentrecoveryinformation ]]
	GetEnlistmentRecoveryInformation :: proc(EnlistmentHandle: HANDLE, BufferSize: u32, Buffer: rawptr, BufferUsed: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-getnotificationresourcemanager ]]
	GetNotificationResourceManager :: proc(
		ResourceManagerHandle: HANDLE,
		TransactionNotification: ^TRANSACTION_NOTIFICATION,
		NotificationLength: u32,
		dwMilliseconds: u32,
		ReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-getnotificationresourcemanagerasync ]]
	GetNotificationResourceManagerAsync :: proc(
		ResourceManagerHandle: HANDLE,
		TransactionNotification: ^TRANSACTION_NOTIFICATION,
		TransactionNotificationLength: u32,
		ReturnLength: ^u32,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-gettransactionid ]]
	GetTransactionId :: proc(TransactionHandle: HANDLE, TransactionId: ^GUID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-gettransactioninformation ]]
	GetTransactionInformation :: proc(
		TransactionHandle: HANDLE,
		Outcome: ^u32,
		IsolationLevel: ^u32,
		IsolationFlags: ^u32,
		Timeout: ^u32,
		BufferLength: u32,
		Description: PWSTR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-gettransactionmanagerid ]]
	GetTransactionManagerId :: proc(TransactionManagerHandle: HANDLE, TransactionManagerId: ^GUID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-openenlistment ]]
	OpenEnlistment :: proc(dwDesiredAccess: u32, ResourceManagerHandle: HANDLE, EnlistmentId: ^GUID) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-openresourcemanager ]]
	OpenResourceManager :: proc(dwDesiredAccess: u32, TmHandle: HANDLE, ResourceManagerId: ^GUID) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-opentransaction ]]
	OpenTransaction :: proc(dwDesiredAccess: u32, TransactionId: ^GUID) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-opentransactionmanager ]]
	OpenTransactionManager :: proc(LogFileName: PWSTR, DesiredAccess: u32, OpenOptions: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-opentransactionmanagerbyid ]]
	OpenTransactionManagerById :: proc(TransactionManagerId: ^GUID, DesiredAccess: u32, OpenOptions: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-preparecomplete ]]
	PrepareComplete :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-prepareenlistment ]]
	PrepareEnlistment :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-prepreparecomplete ]]
	PrePrepareComplete :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-preprepareenlistment ]]
	PrePrepareEnlistment :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-readonlyenlistment ]]
	ReadOnlyEnlistment :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-recoverenlistment ]]
	RecoverEnlistment :: proc(EnlistmentHandle: HANDLE, EnlistmentKey: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-recoverresourcemanager ]]
	RecoverResourceManager :: proc(ResourceManagerHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-recovertransactionmanager ]]
	RecoverTransactionManager :: proc(TransactionManagerHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-renametransactionmanager ]]
	RenameTransactionManager :: proc(LogFileName: PWSTR, ExistingTransactionManagerGuid: ^GUID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-rollbackcomplete ]]
	RollbackComplete :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-rollbackenlistment ]]
	RollbackEnlistment :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-rollbacktransaction ]]
	RollbackTransaction :: proc(TransactionHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-rollbacktransactionasync ]]
	RollbackTransactionAsync :: proc(TransactionHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-rollforwardtransactionmanager ]]
	RollforwardTransactionManager :: proc(TransactionManagerHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-setenlistmentrecoveryinformation ]]
	SetEnlistmentRecoveryInformation :: proc(EnlistmentHandle: HANDLE, BufferSize: u32, Buffer: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-setresourcemanagercompletionport ]]
	SetResourceManagerCompletionPort :: proc(
		ResourceManagerHandle: HANDLE,
		IoCompletionPortHandle: HANDLE,
		CompletionKey: uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-settransactioninformation ]]
	SetTransactionInformation :: proc(
		TransactionHandle: HANDLE,
		IsolationLevel: u32,
		IsolationFlags: u32,
		Timeout: u32,
		Description: PWSTR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-singlephasereject ]]
	SinglePhaseReject :: proc(EnlistmentHandle: HANDLE, TmVirtualClock: ^i64) -> BOOL ---
}

@(default_calling_convention="system")
foreign netapi32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netconnectionenum ]]
	NetConnectionEnum :: proc(
		servername: PWSTR,
		qualifier: PWSTR,
		level: u32,
		bufptr: ^u8,
		prefmaxlen: u32,
		entriesread: ^u32,
		totalentries: ^u32,
		resume_handle: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netfileclose ]]
	NetFileClose :: proc(servername: PWSTR, fileid: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netfileenum ]]
	NetFileEnum :: proc(
		servername: PWSTR,
		basepath: PWSTR,
		username: PWSTR,
		level: u32,
		bufptr: ^u8,
		prefmaxlen: u32,
		entriesread: ^u32,
		totalentries: ^u32,
		resume_handle: ^uintptr,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netfilegetinfo ]]
	NetFileGetInfo :: proc(servername: PWSTR, fileid: u32, level: u32, bufptr: ^u8) -> u32 ---

	NetServerAliasAdd :: proc(servername: PWSTR, level: u32, buf: ^u8) -> u32 ---

	NetServerAliasDel :: proc(servername: PWSTR, level: u32, buf: ^u8) -> u32 ---

	NetServerAliasEnum :: proc(
		servername: PWSTR,
		level: u32,
		bufptr: ^u8,
		prefmaxlen: u32,
		entriesread: ^u32,
		totalentries: ^u32,
		resumehandle: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netsessiondel ]]
	NetSessionDel :: proc(servername: PWSTR, UncClientName: PWSTR, username: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netsessionenum ]]
	NetSessionEnum :: proc(
		servername: PWSTR,
		UncClientName: PWSTR,
		username: PWSTR,
		level: u32,
		bufptr: ^u8,
		prefmaxlen: u32,
		entriesread: ^u32,
		totalentries: ^u32,
		resume_handle: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netsessiongetinfo ]]
	NetSessionGetInfo :: proc(servername: PWSTR, UncClientName: PWSTR, username: PWSTR, level: u32, bufptr: ^u8) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netshareadd ]]
	NetShareAdd :: proc(servername: PWSTR, level: u32, buf: ^u8, parm_err: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netsharecheck ]]
	NetShareCheck :: proc(servername: PWSTR, device: PWSTR, type: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netsharedel ]]
	NetShareDel :: proc(servername: PWSTR, netname: PWSTR, reserved: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netsharedelex ]]
	NetShareDelEx :: proc(servername: PWSTR, level: u32, buf: ^u8) -> u32 ---

	NetShareDelSticky :: proc(servername: PWSTR, netname: PWSTR, reserved: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netshareenum ]]
	NetShareEnum :: proc(
		servername: PWSTR,
		level: u32,
		bufptr: ^u8,
		prefmaxlen: u32,
		entriesread: ^u32,
		totalentries: ^u32,
		resume_handle: ^u32,
	) -> u32 ---

	NetShareEnumSticky :: proc(
		servername: PWSTR,
		level: u32,
		bufptr: ^u8,
		prefmaxlen: u32,
		entriesread: ^u32,
		totalentries: ^u32,
		resume_handle: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netsharegetinfo ]]
	NetShareGetInfo :: proc(servername: PWSTR, netname: PWSTR, level: u32, bufptr: ^u8) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/nf-lmshare-netsharesetinfo ]]
	NetShareSetInfo :: proc(servername: PWSTR, netname: PWSTR, level: u32, buf: ^u8, parm_err: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmstats/nf-lmstats-netstatisticsget ]]
	NetStatisticsGet :: proc(ServerName: ^i8, Service: ^i8, Level: u32, Options: u32, Buffer: ^u8) -> u32 ---
}

@(default_calling_convention="system")
foreign onecoreuap_apiset {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-copyfilefromappw ]]
	CopyFileFromAppW :: proc(lpExistingFileName: PWSTR, lpNewFileName: PWSTR, bFailIfExists: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-createdirectoryfromappw ]]
	CreateDirectoryFromAppW :: proc(lpPathName: PWSTR, lpSecurityAttributes: ^SECURITY_ATTRIBUTES) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-createfile2fromappw ]]
	CreateFile2FromAppW :: proc(
		lpFileName: PWSTR,
		dwDesiredAccess: u32,
		dwShareMode: u32,
		dwCreationDisposition: u32,
		pCreateExParams: ^CREATEFILE2_EXTENDED_PARAMETERS,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-createfilefromappw ]]
	CreateFileFromAppW :: proc(
		lpFileName: PWSTR,
		dwDesiredAccess: u32,
		dwShareMode: u32,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		dwCreationDisposition: u32,
		dwFlagsAndAttributes: u32,
		hTemplateFile: HANDLE,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-deletefilefromappw ]]
	DeleteFileFromAppW :: proc(lpFileName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-findfirstfileexfromappw ]]
	FindFirstFileExFromAppW :: proc(
		lpFileName: PWSTR,
		fInfoLevelId: FINDEX_INFO_LEVELS,
		lpFindFileData: rawptr,
		fSearchOp: FINDEX_SEARCH_OPS,
		lpSearchFilter: rawptr,
		dwAdditionalFlags: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-getfileattributesexfromappw ]]
	GetFileAttributesExFromAppW :: proc(
		lpFileName: PWSTR,
		fInfoLevelId: GET_FILEEX_INFO_LEVELS,
		lpFileInformation: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-movefilefromappw ]]
	MoveFileFromAppW :: proc(lpExistingFileName: PWSTR, lpNewFileName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-removedirectoryfromappw ]]
	RemoveDirectoryFromAppW :: proc(lpPathName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-replacefilefromappw ]]
	ReplaceFileFromAppW :: proc(
		lpReplacedFileName: PWSTR,
		lpReplacementFileName: PWSTR,
		lpBackupFileName: PWSTR,
		dwReplaceFlags: u32,
		lpExclude: rawptr,
		lpReserved: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapifromapp/nf-fileapifromapp-setfileattributesfromappw ]]
	SetFileAttributesFromAppW :: proc(lpFileName: PWSTR, dwFileAttributes: u32) -> BOOL ---
}

@(default_calling_convention="system")
foreign txfw32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/nf-txfw32-txfgetthreadminiversionforcreate ]]
	TxfGetThreadMiniVersionForCreate :: proc(MiniVersion: ^u16) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/nf-txfw32-txflogcreatefilereadcontext ]]
	TxfLogCreateFileReadContext :: proc(
		LogPath: PWSTR,
		BeginningLsn: CLS_LSN,
		EndingLsn: CLS_LSN,
		TxfFileId: ^TXF_ID,
		TxfLogContext: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/nf-txfw32-txflogcreaterangereadcontext ]]
	TxfLogCreateRangeReadContext :: proc(
		LogPath: PWSTR,
		BeginningLsn: CLS_LSN,
		EndingLsn: CLS_LSN,
		BeginningVirtualClock: ^i64,
		EndingVirtualClock: ^i64,
		RecordTypeMask: u32,
		TxfLogContext: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/nf-txfw32-txflogdestroyreadcontext ]]
	TxfLogDestroyReadContext :: proc(TxfLogContext: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/nf-txfw32-txflogreadrecords ]]
	TxfLogReadRecords :: proc(
		TxfLogContext: rawptr,
		BufferLength: u32,
		Buffer: rawptr,
		BytesUsed: ^u32,
		RecordCount: ^u32,
	) -> BOOL ---

	TxfLogRecordGetFileName :: proc(
		RecordBuffer: rawptr,
		RecordBufferLengthInBytes: u32,
		NameBuffer: PWSTR,
		NameBufferLengthInBytes: ^u32,
		TxfId: ^TXF_ID,
	) -> BOOL ---

	TxfLogRecordGetGenericType :: proc(
		RecordBuffer: rawptr,
		RecordBufferLengthInBytes: u32,
		GenericType: ^u32,
		VirtualClock: ^i64,
	) -> BOOL ---

	TxfReadMetadataInfo :: proc(
		FileHandle: HANDLE,
		TxfFileId: ^TXF_ID,
		LastLsn: ^CLS_LSN,
		TransactionState: ^u32,
		LockingTransaction: ^GUID,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/nf-txfw32-txfsetthreadminiversionforcreate ]]
	TxfSetThreadMiniVersionForCreate :: proc(MiniVersion: u16) ---
}

@(default_calling_convention="system")
foreign version {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfoa ]]
	GetFileVersionInfoA :: proc(lptstrFilename: PSTR, dwHandle: u32, dwLen: u32, lpData: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfoexa ]]
	GetFileVersionInfoExA :: proc(
		dwFlags: GET_FILE_VERSION_INFO_FLAGS,
		lpwstrFilename: PSTR,
		dwHandle: u32,
		dwLen: u32,
		lpData: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfoexw ]]
	GetFileVersionInfoExW :: proc(
		dwFlags: GET_FILE_VERSION_INFO_FLAGS,
		lpwstrFilename: PWSTR,
		dwHandle: u32,
		dwLen: u32,
		lpData: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfosizea ]]
	GetFileVersionInfoSizeA :: proc(lptstrFilename: PSTR, lpdwHandle: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfosizeexa ]]
	GetFileVersionInfoSizeExA :: proc(
		dwFlags: GET_FILE_VERSION_INFO_FLAGS,
		lpwstrFilename: PSTR,
		lpdwHandle: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfosizeexw ]]
	GetFileVersionInfoSizeExW :: proc(
		dwFlags: GET_FILE_VERSION_INFO_FLAGS,
		lpwstrFilename: PWSTR,
		lpdwHandle: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfosizew ]]
	GetFileVersionInfoSizeW :: proc(lptstrFilename: PWSTR, lpdwHandle: ^u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-getfileversioninfow ]]
	GetFileVersionInfoW :: proc(lptstrFilename: PWSTR, dwHandle: u32, dwLen: u32, lpData: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-verfindfilea ]]
	VerFindFileA :: proc(
		uFlags: VER_FIND_FILE_FLAGS,
		szFileName: PSTR,
		szWinDir: PSTR,
		szAppDir: PSTR,
		szCurDir: PSTR,
		puCurDirLen: ^u32,
		szDestDir: PSTR,
		puDestDirLen: ^u32,
	) -> VER_FIND_FILE_STATUS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-verfindfilew ]]
	VerFindFileW :: proc(
		uFlags: VER_FIND_FILE_FLAGS,
		szFileName: PWSTR,
		szWinDir: PWSTR,
		szAppDir: PWSTR,
		szCurDir: PWSTR,
		puCurDirLen: ^u32,
		szDestDir: PWSTR,
		puDestDirLen: ^u32,
	) -> VER_FIND_FILE_STATUS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-verinstallfilea ]]
	VerInstallFileA :: proc(
		uFlags: VER_INSTALL_FILE_FLAGS,
		szSrcFileName: PSTR,
		szDestFileName: PSTR,
		szSrcDir: PSTR,
		szDestDir: PSTR,
		szCurDir: PSTR,
		szTmpFile: PSTR,
		puTmpFileLen: ^u32,
	) -> VER_INSTALL_FILE_STATUS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-verinstallfilew ]]
	VerInstallFileW :: proc(
		uFlags: VER_INSTALL_FILE_FLAGS,
		szSrcFileName: PWSTR,
		szDestFileName: PWSTR,
		szSrcDir: PWSTR,
		szDestDir: PWSTR,
		szCurDir: PWSTR,
		szTmpFile: PWSTR,
		puTmpFileLen: ^u32,
	) -> VER_INSTALL_FILE_STATUS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-verqueryvaluea ]]
	VerQueryValueA :: proc(pBlock: rawptr, lpSubBlock: PSTR, lplpBuffer: rawptr, puLen: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winver/nf-winver-verqueryvaluew ]]
	VerQueryValueW :: proc(pBlock: rawptr, lpSubBlock: PWSTR, lplpBuffer: rawptr, puLen: ^u32) -> BOOL ---
}

@(default_calling_convention="system")
foreign wofutil {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofenumentries ]]
	WofEnumEntries :: proc(VolumeName: PWSTR, Provider: u32, EnumProc: WofEnumEntryProc, UserData: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-woffileenumfiles ]]
	WofFileEnumFiles :: proc(
		VolumeName: PWSTR,
		Algorithm: u32,
		EnumProc: WofEnumFilesProc,
		UserData: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofgetdriverversion ]]
	WofGetDriverVersion :: proc(FileOrVolumeHandle: HANDLE, Provider: u32, WofVersion: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofisexternalfile ]]
	WofIsExternalFile :: proc(
		FilePath: PWSTR,
		IsExternalFile: ^BOOL,
		Provider: ^u32,
		ExternalFileInfo: rawptr,
		BufferLength: ^u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofsetfiledatalocation ]]
	WofSetFileDataLocation :: proc(FileHandle: HANDLE, Provider: u32, ExternalFileInfo: rawptr, Length: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofshouldcompressbinaries ]]
	WofShouldCompressBinaries :: proc(Volume: PWSTR, Algorithm: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofwimaddentry ]]
	WofWimAddEntry :: proc(VolumeName: PWSTR, WimPath: PWSTR, WimType: u32, WimIndex: u32, DataSourceId: ^i64) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofwimenumfiles ]]
	WofWimEnumFiles :: proc(
		VolumeName: PWSTR,
		DataSourceId: i64,
		EnumProc: WofEnumFilesProc,
		UserData: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofwimremoveentry ]]
	WofWimRemoveEntry :: proc(VolumeName: PWSTR, DataSourceId: i64) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofwimsuspendentry ]]
	WofWimSuspendEntry :: proc(VolumeName: PWSTR, DataSourceId: i64) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/nf-wofapi-wofwimupdateentry ]]
	WofWimUpdateEntry :: proc(VolumeName: PWSTR, DataSourceId: i64, NewWimPath: PWSTR) -> HRESULT ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-by_handle_file_information ]]
BY_HANDLE_FILE_INFORMATION :: struct {
	dwFileAttributes: u32,
	ftCreationTime: FILETIME,
	ftLastAccessTime: FILETIME,
	ftLastWriteTime: FILETIME,
	dwVolumeSerialNumber: u32,
	nFileSizeHigh: u32,
	nFileSizeLow: u32,
	nNumberOfLinks: u32,
	nFileIndexHigh: u32,
	nFileIndexLow: u32,
}

CACHE_ACCESS_CHECK :: #type proc "system" (
	pSecurityDescriptor: PSECURITY_DESCRIPTOR,
	hClientToken: HANDLE,
	dwDesiredAccess: u32,
	GenericMapping: ^GENERIC_MAPPING,
	PrivilegeSet: ^PRIVILEGE_SET,
	PrivilegeSetLength: ^u32,
	GrantedAccess: ^u32,
	AccessStatus: ^BOOL,
) -> BOOL

CACHE_DESTROY_CALLBACK :: #type proc "system" (cb: u32, lpb: ^u8)

CACHE_KEY_COMPARE :: #type proc "system" (cbKey1: u32, lpbKey1: ^u8, cbKey2: u32, lpbKey2: ^u8) -> i32

CACHE_KEY_HASH :: #type proc "system" (lpbKey: ^u8, cbKey: u32) -> u32

CACHE_READ_CALLBACK :: #type proc "system" (cb: u32, lpb: ^u8, lpvContext: rawptr) -> BOOL

CLAIMMEDIALABEL :: #type proc "system" (pBuffer: ^u8, nBufferSize: u32, pLabelInfo: ^MediaLabelInfo) -> u32

CLAIMMEDIALABELEX :: #type proc "system" (pBuffer: ^u8, nBufferSize: u32, pLabelInfo: ^MediaLabelInfo, LabelGuid: ^GUID) -> u32

CLFS_BLOCK_ALLOCATION :: #type proc "system" (cbBufferLength: u32, pvUserContext: rawptr) -> rawptr

CLFS_BLOCK_DEALLOCATION :: #type proc "system" (pvBuffer: rawptr, pvUserContext: rawptr)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ne-clfs-clfs_context_mode ]]
CLFS_CONTEXT_MODE :: enum i32 {
	None = 0,
	UndoNext = 1,
	Previous = 2,
	Forward = 3,
}

CLFS_FLAG :: distinct bit_set[enum {
	FORCE_APPEND = 0,
	FORCE_FLUSH = 1,
	USE_RESERVATION = 2,
}; u32]
CLFS_FLAG_NO_FLAGS :: transmute(CLFS_FLAG)u32(0x00000000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ne-clfs-clfs_iostats_class ]]
CLFS_IOSTATS_CLASS :: enum i32 {
	Default = 0,
	Max = 65535,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ne-clfs-clfs_log_archive_mode ]]
CLFS_LOG_ARCHIVE_MODE :: enum i32 {
	Enabled = 1,
	Disabled = 2,
}

CLFS_LOG_NAME_INFORMATION :: struct {
	NameLengthInBytes: u16,
	Name: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmt/ns-clfsmgmt-clfs_mgmt_notification ]]
CLFS_MGMT_NOTIFICATION :: struct {
	Notification: CLFS_MGMT_NOTIFICATION_TYPE,
	Lsn: CLS_LSN,
	LogIsPinned: u16,
}

CLFS_MGMT_NOTIFICATION_TYPE :: enum i32 {
	AdvanceTailNotification = 0,
	LogFullHandlerNotification = 1,
	LogUnpinnedNotification = 2,
	LogWriteNotification = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmt/ns-clfsmgmt-clfs_mgmt_policy ]]
CLFS_MGMT_POLICY :: struct {
	Version: u32,
	LengthInBytes: u32,
	PolicyFlags: u32,
	PolicyType: CLFS_MGMT_POLICY_TYPE,
	PolicyParameters: struct #raw_union {
		MaximumSize: struct {
			Containers: u32,
		},
		MinimumSize: struct {
			Containers: u32,
		},
		NewContainerSize: struct {
			SizeInBytes: u32,
		},
		GrowthRate: struct {
			AbsoluteGrowthInContainers: u32,
			RelativeGrowthPercentage: u32,
		},
		LogTail: struct {
			MinimumAvailablePercentage: u32,
			MinimumAvailableContainers: u32,
		},
		AutoShrink: struct {
			Percentage: u32,
		},
		AutoGrow: struct {
			Enabled: u32,
		},
		NewContainerPrefix: struct {
			PrefixLengthInBytes: u16,
			PrefixString: [1]u16,
		},
		NewContainerSuffix: struct {
			NextContainerSuffix: u64,
		},
		NewContainerExtension: struct {
			ExtensionLengthInBytes: u16,
			ExtensionString: [1]u16,
		},
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmt/ne-clfsmgmt-clfs_mgmt_policy_type ]]
CLFS_MGMT_POLICY_TYPE :: enum i32 {
	MaximumSize = 0,
	MinimumSize = 1,
	NewContainerSize = 2,
	GrowthRate = 3,
	LogTail = 4,
	AutoShrink = 5,
	AutoGrow = 6,
	NewContainerPrefix = 7,
	NewContainerSuffix = 8,
	NewContainerExtension = 9,
	Invalid = 10,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-clfs_node_id ]]
CLFS_NODE_ID :: struct {
	cType: u32,
	cbNode: u32,
}

CLFS_PHYSICAL_LSN_INFORMATION :: struct {
	StreamIdentifier: u8,
	VirtualLsn: CLS_LSN,
	PhysicalLsn: CLS_LSN,
}

CLFS_STREAM_ID_INFORMATION :: struct {
	StreamIdentifier: u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_archive_descriptor ]]
CLS_ARCHIVE_DESCRIPTOR :: struct {
	coffLow: u64,
	coffHigh: u64,
	infoContainer: CLS_CONTAINER_INFORMATION,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_container_information ]]
CLS_CONTAINER_INFORMATION :: struct {
	FileAttributes: u32,
	CreationTime: u64,
	LastAccessTime: u64,
	LastWriteTime: u64,
	ContainerSize: i64,
	FileNameActualLength: u32,
	FileNameLength: u32,
	FileName: [256]u16,
	State: u32,
	PhysicalContainerId: u32,
	LogicalContainerId: u32,
}

CLS_CONTEXT_MODE :: enum i32 {
	None = 0,
	UndoNext = 1,
	Previous = 2,
	Forward = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_information ]]
CLS_INFORMATION :: struct {
	TotalAvailable: i64,
	CurrentAvailable: i64,
	TotalReservation: i64,
	BaseFileSize: u64,
	ContainerSize: u64,
	TotalContainers: u32,
	FreeContainers: u32,
	TotalClients: u32,
	Attributes: u32,
	FlushThreshold: u32,
	SectorSize: u32,
	MinArchiveTailLsn: CLS_LSN,
	BaseLsn: CLS_LSN,
	LastFlushedLsn: CLS_LSN,
	LastLsn: CLS_LSN,
	RestartLsn: CLS_LSN,
	Identity: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_io_statistics ]]
CLS_IO_STATISTICS :: struct {
	hdrIoStats: CLS_IO_STATISTICS_HEADER,
	cFlush: u64,
	cbFlush: u64,
	cMetaFlush: u64,
	cbMetaFlush: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_io_statistics_header ]]
CLS_IO_STATISTICS_HEADER :: struct {
	ubMajorVersion: u8,
	ubMinorVersion: u8,
	eStatsClass: CLFS_IOSTATS_CLASS,
	cbLength: u16,
	coffData: u32,
}

CLS_IOSTATS_CLASS :: enum i32 {
	Default = 0,
	Max = 65535,
}

CLS_LOG_INFORMATION_CLASS :: enum i32 {
	BasicInformation = 0,
	BasicInformationPhysical = 1,
	PhysicalNameInformation = 2,
	StreamIdentifierInformation = 3,
	SystemMarkingInformation = 4,
	PhysicalLsnInformation = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_lsn ]]
CLS_LSN :: struct {
	Internal: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_scan_context~r1 ]]
CLS_SCAN_CONTEXT :: struct {
	cidNode: CLFS_NODE_ID,
	hLog: HANDLE,
	cIndex: u32,
	cContainers: u32,
	cContainersReturned: u32,
	eScanMode: u8,
	pinfoContainer: ^CLS_CONTAINER_INFORMATION,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfs/ns-clfs-cls_write_entry ]]
CLS_WRITE_ENTRY :: struct {
	Buffer: rawptr,
	ByteLength: u32,
}

COMPRESSION_FORMAT :: enum u16 {
	NONE = 0x0000,
	DEFAULT = 0x0001,
	LZNT1 = 0x0002,
	XPRESS = 0x0003,
	XPRESS_HUFF = 0x0004,
	XP10 = 0x0005,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-connection_info_0 ]]
CONNECTION_INFO_0 :: struct {
	coni0_id: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-connection_info_1 ]]
CONNECTION_INFO_1 :: struct {
	coni1_id: u32,
	coni1_type: SHARE_TYPE,
	coni1_num_opens: u32,
	coni1_num_users: u32,
	coni1_time: u32,
	coni1_username: PWSTR,
	coni1_netname: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ne-winbase-copyfile2_copy_phase ]]
COPYFILE2_COPY_PHASE :: enum i32 {
	NONE = 0,
	PREPARE_SOURCE = 1,
	PREPARE_DEST = 2,
	READ_SOURCE = 3,
	WRITE_DESTINATION = 4,
	SERVER_COPY = 5,
	NAMEGRAFT_COPY = 6,
	MAX = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-copyfile2_extended_parameters ]]
COPYFILE2_EXTENDED_PARAMETERS :: struct {
	dwSize: u32,
	dwCopyFlags: u32,
	pfCancel: ^BOOL,
	pProgressRoutine: PCOPYFILE2_PROGRESS_ROUTINE,
	pvCallbackContext: rawptr,
}

COPYFILE2_EXTENDED_PARAMETERS_V2 :: struct {
	dwSize: u32,
	dwCopyFlags: u32,
	pfCancel: ^BOOL,
	pProgressRoutine: PCOPYFILE2_PROGRESS_ROUTINE,
	pvCallbackContext: rawptr,
	dwCopyFlagsV2: u32,
	ioDesiredSize: u32,
	ioDesiredRate: u32,
	reserved: [8]rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-copyfile2_message ]]
COPYFILE2_MESSAGE :: struct {
	Type: COPYFILE2_MESSAGE_TYPE,
	dwPadding: u32,
	Info: struct #raw_union {
		ChunkStarted: struct {
			dwStreamNumber: u32,
			dwReserved: u32,
			hSourceFile: HANDLE,
			hDestinationFile: HANDLE,
			uliChunkNumber: u64,
			uliChunkSize: u64,
			uliStreamSize: u64,
			uliTotalFileSize: u64,
		},
		ChunkFinished: struct {
			dwStreamNumber: u32,
			dwFlags: u32,
			hSourceFile: HANDLE,
			hDestinationFile: HANDLE,
			uliChunkNumber: u64,
			uliChunkSize: u64,
			uliStreamSize: u64,
			uliStreamBytesTransferred: u64,
			uliTotalFileSize: u64,
			uliTotalBytesTransferred: u64,
		},
		StreamStarted: struct {
			dwStreamNumber: u32,
			dwReserved: u32,
			hSourceFile: HANDLE,
			hDestinationFile: HANDLE,
			uliStreamSize: u64,
			uliTotalFileSize: u64,
		},
		StreamFinished: struct {
			dwStreamNumber: u32,
			dwReserved: u32,
			hSourceFile: HANDLE,
			hDestinationFile: HANDLE,
			uliStreamSize: u64,
			uliStreamBytesTransferred: u64,
			uliTotalFileSize: u64,
			uliTotalBytesTransferred: u64,
		},
		PollContinue: struct {
			dwReserved: u32,
		},
		Error: struct {
			CopyPhase: COPYFILE2_COPY_PHASE,
			dwStreamNumber: u32,
			hrFailure: HRESULT,
			dwReserved: u32,
			uliChunkNumber: u64,
			uliStreamSize: u64,
			uliStreamBytesTransferred: u64,
			uliTotalFileSize: u64,
			uliTotalBytesTransferred: u64,
		},
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ne-winbase-copyfile2_message_action ]]
COPYFILE2_MESSAGE_ACTION :: enum i32 {
	CONTINUE = 0,
	CANCEL = 1,
	STOP = 2,
	QUIET = 3,
	PAUSE = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ne-winbase-copyfile2_message_type ]]
COPYFILE2_MESSAGE_TYPE :: enum i32 {
	NONE = 0,
	CHUNK_STARTED = 1,
	CHUNK_FINISHED = 2,
	STREAM_STARTED = 3,
	STREAM_FINISHED = 4,
	POLL_CONTINUE = 5,
	ERROR = 6,
	MAX = 7,
}

CREATE_TAPE_PARTITION_METHOD :: enum u32 {
	FIXED_PARTITIONS = 0x00000000,
	INITIATOR_PARTITIONS = 0x00000002,
	SELECT_PARTITIONS = 0x00000001,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-createfile2_extended_parameters ]]
CREATEFILE2_EXTENDED_PARAMETERS :: struct {
	dwSize: u32,
	dwFileAttributes: u32,
	dwFileFlags: u32,
	dwSecurityQosFlags: u32,
	lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
	hTemplateFile: HANDLE,
}

DEFINE_DOS_DEVICE_FLAGS :: distinct bit_set[enum {
	RAW_TARGET_PATH = 0,
	REMOVE_DEFINITION = 1,
	EXACT_MATCH_ON_REMOVE = 2,
	NO_BROADCAST_SYSTEM = 3,
	LUID_BROADCAST_DRIVE = 4,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-disk_space_information ]]
DISK_SPACE_INFORMATION :: struct {
	ActualTotalAllocationUnits: u64,
	ActualAvailableAllocationUnits: u64,
	ActualPoolUnavailableAllocationUnits: u64,
	CallerTotalAllocationUnits: u64,
	CallerAvailableAllocationUnits: u64,
	CallerPoolUnavailableAllocationUnits: u64,
	UsedAllocationUnits: u64,
	TotalReservedAllocationUnits: u64,
	VolumeStorageReserveAllocationUnits: u64,
	AvailableCommittedAllocationUnits: u64,
	PoolAvailableAllocationUnits: u64,
	SectorsPerAllocationUnit: u32,
	BytesPerSector: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dskquota/ns-dskquota-diskquota_user_information ]]
DISKQUOTA_USER_INFORMATION :: struct {
	QuotaUsed: i64,
	QuotaThreshold: i64,
	QuotaLimit: i64,
}

DISKQUOTA_USERNAME_RESOLVE :: enum u32 {
	ASYNC = 0x00000002,
	NONE = 0x00000000,
	SYNC = 0x00000001,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-efs_certificate_blob ]]
EFS_CERTIFICATE_BLOB :: struct {
	dwCertEncodingType: u32,
	cbData: u32,
	pbData: ^u8,
}

EFS_COMPATIBILITY_INFO :: struct {
	EfsVersion: u32,
}

EFS_DECRYPTION_STATUS_INFO :: struct {
	dwDecryptionError: u32,
	dwHashOffset: u32,
	cbHash: u32,
}

EFS_ENCRYPTION_STATUS_INFO :: struct {
	bHasCurrentKey: BOOL,
	dwEncryptionError: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-efs_hash_blob ]]
EFS_HASH_BLOB :: struct {
	cbData: u32,
	pbData: ^u8,
}

EFS_KEY_INFO :: struct {
	dwVersion: u32,
	Entropy: u32,
	Algorithm: ALG_ID,
	KeyLength: u32,
}

EFS_PIN_BLOB :: struct {
	cbPadding: u32,
	cbData: u32,
	pbData: ^u8,
}

EFS_RPC_BLOB :: struct {
	cbData: u32,
	pbData: ^u8,
}

EFS_VERSION_INFO :: struct {
	EfsVersion: u32,
	SubVersion: u32,
}

ENCRYPTED_FILE_METADATA_SIGNATURE :: struct {
	dwEfsAccessType: u32,
	pCertificatesAdded: ^ENCRYPTION_CERTIFICATE_HASH_LIST,
	pEncryptionCertificate: ^ENCRYPTION_CERTIFICATE,
	pEfsStreamSignature: ^EFS_RPC_BLOB,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate ]]
ENCRYPTION_CERTIFICATE :: struct {
	cbTotalLength: u32,
	pUserSid: ^SID,
	pCertBlob: ^EFS_CERTIFICATE_BLOB,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate_hash ]]
ENCRYPTION_CERTIFICATE_HASH :: struct {
	cbTotalLength: u32,
	pUserSid: ^SID,
	pHash: ^EFS_HASH_BLOB,
	lpDisplayInformation: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate_hash_list ]]
ENCRYPTION_CERTIFICATE_HASH_LIST :: struct {
	nCert_Hash: u32,
	pUsers: ^ENCRYPTION_CERTIFICATE_HASH,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winefs/ns-winefs-encryption_certificate_list ]]
ENCRYPTION_CERTIFICATE_LIST :: struct {
	nUsers: u32,
	pUsers: ^ENCRYPTION_CERTIFICATE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/DevNotes/encryption_protector-structure ]]
ENCRYPTION_PROTECTOR :: struct {
	cbTotalLength: u32,
	pUserSid: ^SID,
	lpProtectorDescriptor: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/DevNotes/encryption_protector_list-structure ]]
ENCRYPTION_PROTECTOR_LIST :: struct {
	nProtectors: u32,
	pProtectors: ^ENCRYPTION_PROTECTOR,
}

ERASE_TAPE_TYPE :: enum u32 {
	LONG = 0x00000001,
	SHORT = 0x00000000,
}

FCACHE_CREATE_CALLBACK :: #type proc "system" (lpstrName: PSTR, lpvData: rawptr, cbFileSize: ^u32, cbFileSizeHigh: ^u32) -> HANDLE

FCACHE_RICHCREATE_CALLBACK :: #type proc "system" (
	lpstrName: PSTR,
	lpvData: rawptr,
	cbFileSize: ^u32,
	cbFileSizeHigh: ^u32,
	pfDidWeScanIt: ^BOOL,
	pfIsStuffed: ^BOOL,
	pfStoredWithDots: ^BOOL,
	pfStoredWithTerminatingDot: ^BOOL,
) -> HANDLE

FH_OVERLAPPED :: struct {
	Internal: uintptr,
	InternalHigh: uintptr,
	Offset: u32,
	OffsetHigh: u32,
	hEvent: HANDLE,
	pfnCompletion: PFN_IO_COMPLETION,
	Reserved1: uintptr,
	Reserved2: uintptr,
	Reserved3: uintptr,
	Reserved4: uintptr,
}

FILE_ACCESS_RIGHTS :: distinct bit_set[enum {
	FILE_READ_DATA = 0,
	FILE_LIST_DIRECTORY = 0,
	FILE_WRITE_DATA = 1,
	FILE_ADD_FILE = 1,
	FILE_APPEND_DATA = 2,
	FILE_ADD_SUBDIRECTORY = 2,
	FILE_CREATE_PIPE_INSTANCE = 2,
	FILE_READ_EA = 3,
	FILE_WRITE_EA = 4,
	FILE_EXECUTE = 5,
	FILE_TRAVERSE = 5,
	FILE_DELETE_CHILD = 6,
	FILE_READ_ATTRIBUTES = 7,
	FILE_WRITE_ATTRIBUTES = 8,
	DELETE = 16,
	READ_CONTROL = 17,
	WRITE_DAC = 18,
	WRITE_OWNER = 19,
	SYNCHRONIZE = 20,
	STANDARD_RIGHTS_READ = 17,
	STANDARD_RIGHTS_WRITE = 17,
	STANDARD_RIGHTS_EXECUTE = 17,
}; u32]
FILE_ACCESS_RIGHTS_STANDARD_RIGHTS_REQUIRED :: transmute(FILE_ACCESS_RIGHTS)u32(0x000F0000)
FILE_ACCESS_RIGHTS_STANDARD_RIGHTS_ALL :: transmute(FILE_ACCESS_RIGHTS)u32(0x001F0000)
FILE_ACCESS_RIGHTS_SPECIFIC_RIGHTS_ALL :: transmute(FILE_ACCESS_RIGHTS)u32(0x0000FFFF)
FILE_ACCESS_RIGHTS_FILE_ALL_ACCESS :: transmute(FILE_ACCESS_RIGHTS)u32(0x001F01FF)
FILE_ACCESS_RIGHTS_FILE_GENERIC_READ :: transmute(FILE_ACCESS_RIGHTS)u32(0x00120089)
FILE_ACCESS_RIGHTS_FILE_GENERIC_WRITE :: transmute(FILE_ACCESS_RIGHTS)u32(0x00120116)
FILE_ACCESS_RIGHTS_FILE_GENERIC_EXECUTE :: transmute(FILE_ACCESS_RIGHTS)u32(0x001200A0)

FILE_ACTION :: enum u32 {
	ADDED = 0x00000001,
	REMOVED = 0x00000002,
	MODIFIED = 0x00000003,
	RENAMED_OLD_NAME = 0x00000004,
	RENAMED_NEW_NAME = 0x00000005,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_alignment_info ]]
FILE_ALIGNMENT_INFO :: struct {
	AlignmentRequirement: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_allocation_info ]]
FILE_ALLOCATION_INFO :: struct {
	AllocationSize: i64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_attribute_tag_info ]]
FILE_ATTRIBUTE_TAG_INFO :: struct {
	FileAttributes: u32,
	ReparseTag: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_basic_info ]]
FILE_BASIC_INFO :: struct {
	CreationTime: i64,
	LastAccessTime: i64,
	LastWriteTime: i64,
	ChangeTime: i64,
	FileAttributes: u32,
}

FILE_CASE_SENSITIVE_INFO :: struct {
	Flags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_compression_info ]]
FILE_COMPRESSION_INFO :: struct {
	CompressedFileSize: i64,
	CompressionFormat: COMPRESSION_FORMAT,
	CompressionUnitShift: u8,
	ChunkShift: u8,
	ClusterShift: u8,
	Reserved: [3]u8,
}

FILE_CREATION_DISPOSITION :: enum u32 {
	CREATE_NEW = 0x00000001,
	CREATE_ALWAYS = 0x00000002,
	OPEN_EXISTING = 0x00000003,
	OPEN_ALWAYS = 0x00000004,
	TRUNCATE_EXISTING = 0x00000005,
}

FILE_DEVICE_TYPE :: enum u32 {
	CD_ROM = 0x00000002,
	DISK = 0x00000007,
	TAPE = 0x0000001F,
	DVD = 0x00000033,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_disposition_info ]]
FILE_DISPOSITION_INFO :: struct {
	DeleteFile: BOOLEAN,
}

FILE_DISPOSITION_INFO_EX :: struct {
	Flags: FILE_DISPOSITION_INFO_EX_FLAGS,
}

FILE_DISPOSITION_INFO_EX_FLAGS :: enum u32 {
	DO_NOT_DELETE = 0x00000000,
	DELETE = 0x00000001,
	POSIX_SEMANTICS = 0x00000002,
	FORCE_IMAGE_SECTION_CHECK = 0x00000004,
	ON_CLOSE = 0x00000008,
	IGNORE_READONLY_ATTRIBUTE = 0x00000010,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_end_of_file_info ]]
FILE_END_OF_FILE_INFO :: struct {
	EndOfFile: i64,
}

FILE_EXTENT :: struct {
	VolumeOffset: u64,
	ExtentLength: u64,
}

FILE_FLAGS_AND_ATTRIBUTES :: distinct bit_set[enum {
	FILE_ATTRIBUTE_READONLY = 0,
	FILE_ATTRIBUTE_HIDDEN = 1,
	FILE_ATTRIBUTE_SYSTEM = 2,
	FILE_ATTRIBUTE_DIRECTORY = 4,
	FILE_ATTRIBUTE_ARCHIVE = 5,
	FILE_ATTRIBUTE_DEVICE = 6,
	FILE_ATTRIBUTE_NORMAL = 7,
	FILE_ATTRIBUTE_TEMPORARY = 8,
	FILE_ATTRIBUTE_SPARSE_FILE = 9,
	FILE_ATTRIBUTE_REPARSE_POINT = 10,
	FILE_ATTRIBUTE_COMPRESSED = 11,
	FILE_ATTRIBUTE_OFFLINE = 12,
	FILE_ATTRIBUTE_NOT_CONTENT_INDEXED = 13,
	FILE_ATTRIBUTE_ENCRYPTED = 14,
	FILE_ATTRIBUTE_INTEGRITY_STREAM = 15,
	FILE_ATTRIBUTE_VIRTUAL = 16,
	FILE_ATTRIBUTE_NO_SCRUB_DATA = 17,
	FILE_ATTRIBUTE_EA = 18,
	FILE_ATTRIBUTE_PINNED = 19,
	FILE_ATTRIBUTE_UNPINNED = 20,
	FILE_ATTRIBUTE_RECALL_ON_OPEN = 18,
	FILE_ATTRIBUTE_RECALL_ON_DATA_ACCESS = 22,
	FILE_FLAG_WRITE_THROUGH = 31,
	FILE_FLAG_OVERLAPPED = 30,
	FILE_FLAG_NO_BUFFERING = 29,
	FILE_FLAG_RANDOM_ACCESS = 28,
	FILE_FLAG_SEQUENTIAL_SCAN = 27,
	FILE_FLAG_DELETE_ON_CLOSE = 26,
	FILE_FLAG_BACKUP_SEMANTICS = 25,
	FILE_FLAG_POSIX_SEMANTICS = 24,
	FILE_FLAG_SESSION_AWARE = 23,
	FILE_FLAG_OPEN_REPARSE_POINT = 21,
	FILE_FLAG_OPEN_NO_RECALL = 20,
	FILE_FLAG_FIRST_PIPE_INSTANCE = 19,
	PIPE_ACCESS_INBOUND = 0,
	PIPE_ACCESS_OUTBOUND = 1,
	SECURITY_IDENTIFICATION = 16,
	SECURITY_IMPERSONATION = 17,
	SECURITY_CONTEXT_TRACKING = 18,
	SECURITY_EFFECTIVE_ONLY = 19,
	SECURITY_SQOS_PRESENT = 20,
}; u32]
FILE_FLAGS_AND_ATTRIBUTES_PIPE_ACCESS_DUPLEX :: transmute(FILE_FLAGS_AND_ATTRIBUTES)u32(0x00000003)
FILE_FLAGS_AND_ATTRIBUTES_SECURITY_ANONYMOUS :: transmute(FILE_FLAGS_AND_ATTRIBUTES)u32(0x00000000)
FILE_FLAGS_AND_ATTRIBUTES_SECURITY_DELEGATION :: transmute(FILE_FLAGS_AND_ATTRIBUTES)u32(0x00030000)
FILE_FLAGS_AND_ATTRIBUTES_SECURITY_VALID_SQOS_FLAGS :: transmute(FILE_FLAGS_AND_ATTRIBUTES)u32(0x001F0000)

FILE_FLUSH_MODE :: enum i32 {
	DEFAULT = 0,
	DATA = 1,
	MIN_METADATA = 2,
	NO_SYNC = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_full_dir_info ]]
FILE_FULL_DIR_INFO :: struct {
	NextEntryOffset: u32,
	FileIndex: u32,
	CreationTime: i64,
	LastAccessTime: i64,
	LastWriteTime: i64,
	ChangeTime: i64,
	EndOfFile: i64,
	AllocationSize: i64,
	FileAttributes: u32,
	FileNameLength: u32,
	EaSize: u32,
	FileName: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_id_128 ]]
FILE_ID_128 :: struct {
	Identifier: [16]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_both_dir_info ]]
FILE_ID_BOTH_DIR_INFO :: struct {
	NextEntryOffset: u32,
	FileIndex: u32,
	CreationTime: i64,
	LastAccessTime: i64,
	LastWriteTime: i64,
	ChangeTime: i64,
	EndOfFile: i64,
	AllocationSize: i64,
	FileAttributes: u32,
	FileNameLength: u32,
	EaSize: u32,
	ShortNameLength: i8,
	ShortName: [12]u16,
	FileId: i64,
	FileName: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_descriptor ]]
FILE_ID_DESCRIPTOR :: struct {
	dwSize: u32,
	Type: FILE_ID_TYPE,
	using _: struct #raw_union {
		FileId: i64,
		ObjectId: GUID,
		ExtendedFileId: FILE_ID_128,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_extd_dir_info ]]
FILE_ID_EXTD_DIR_INFO :: struct {
	NextEntryOffset: u32,
	FileIndex: u32,
	CreationTime: i64,
	LastAccessTime: i64,
	LastWriteTime: i64,
	ChangeTime: i64,
	EndOfFile: i64,
	AllocationSize: i64,
	FileAttributes: u32,
	FileNameLength: u32,
	EaSize: u32,
	ReparsePointTag: u32,
	FileId: FILE_ID_128,
	FileName: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_id_info ]]
FILE_ID_INFO :: struct {
	VolumeSerialNumber: u64,
	FileId: FILE_ID_128,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ne-winbase-file_id_type ]]
FILE_ID_TYPE :: enum i32 {
	FileIdType = 0,
	ObjectIdType = 1,
	ExtendedFileIdType = 2,
	MaximumFileIdType = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-file_info_2 ]]
FILE_INFO_2 :: struct {
	fi2_id: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-file_info_3 ]]
FILE_INFO_3 :: struct {
	fi3_id: u32,
	fi3_permissions: FILE_INFO_FLAGS_PERMISSIONS,
	fi3_num_locks: u32,
	fi3_pathname: PWSTR,
	fi3_username: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-file_info_by_handle_class ]]
FILE_INFO_BY_HANDLE_CLASS :: enum i32 {
	FileBasicInfo = 0,
	FileStandardInfo = 1,
	FileNameInfo = 2,
	FileRenameInfo = 3,
	FileDispositionInfo = 4,
	FileAllocationInfo = 5,
	FileEndOfFileInfo = 6,
	FileStreamInfo = 7,
	FileCompressionInfo = 8,
	FileAttributeTagInfo = 9,
	FileIdBothDirectoryInfo = 10,
	FileIdBothDirectoryRestartInfo = 11,
	FileIoPriorityHintInfo = 12,
	FileRemoteProtocolInfo = 13,
	FileFullDirectoryInfo = 14,
	FileFullDirectoryRestartInfo = 15,
	FileStorageInfo = 16,
	FileAlignmentInfo = 17,
	FileIdInfo = 18,
	FileIdExtdDirectoryInfo = 19,
	FileIdExtdDirectoryRestartInfo = 20,
	FileDispositionInfoEx = 21,
	FileRenameInfoEx = 22,
	FileCaseSensitiveInfo = 23,
	FileNormalizedNameInfo = 24,
	MaximumFileInfoByHandleClass = 25,
}

FILE_INFO_FLAGS_PERMISSIONS :: distinct bit_set[enum {
	READ = 0,
	WRITE = 1,
	CREATE = 2,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_io_priority_hint_info ]]
FILE_IO_PRIORITY_HINT_INFO :: struct {
	PriorityHint: PRIORITY_HINT,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_name_info ]]
FILE_NAME_INFO :: struct {
	FileNameLength: u32,
	FileName: [1]u16,
}

FILE_NOTIFY_CHANGE :: distinct bit_set[enum {
	FILE_NAME = 0,
	DIR_NAME = 1,
	ATTRIBUTES = 2,
	SIZE = 3,
	LAST_WRITE = 4,
	LAST_ACCESS = 5,
	CREATION = 6,
	SECURITY = 8,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_notify_extended_information ]]
FILE_NOTIFY_EXTENDED_INFORMATION :: struct {
	NextEntryOffset: u32,
	Action: FILE_ACTION,
	CreationTime: i64,
	LastModificationTime: i64,
	LastChangeTime: i64,
	LastAccessTime: i64,
	AllocatedLength: i64,
	FileSize: i64,
	FileAttributes: u32,
	using _: struct #raw_union {
		ReparsePointTag: u32,
		EaSize: u32,
	},
	FileId: i64,
	ParentFileId: i64,
	FileNameLength: u32,
	FileName: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_notify_information ]]
FILE_NOTIFY_INFORMATION :: struct {
	NextEntryOffset: u32,
	Action: FILE_ACTION,
	FileNameLength: u32,
	FileName: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_remote_protocol_info ]]
FILE_REMOTE_PROTOCOL_INFO :: struct {
	StructureVersion: u16,
	StructureSize: u16,
	Protocol: u32,
	ProtocolMajorVersion: u16,
	ProtocolMinorVersion: u16,
	ProtocolRevision: u16,
	Reserved: u16,
	Flags: u32,
	GenericReserved: struct {
		Reserved: [8]u32,
	},
	ProtocolSpecific: struct #raw_union {
		Smb2: struct {
			Server: struct {
				Capabilities: u32,
			},
			Share: struct {
				Capabilities: u32,
				ShareFlags: u32,
			},
		},
		Reserved: [16]u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_rename_info ]]
FILE_RENAME_INFO :: struct {
	using _: struct #raw_union {
		ReplaceIfExists: BOOLEAN,
		Flags: u32,
	},
	RootDirectory: HANDLE,
	FileNameLength: u32,
	FileName: [1]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-file_segment_element ]]
FILE_SEGMENT_ELEMENT :: struct #raw_union {
	Buffer: rawptr,
	Alignment: u64,
}

FILE_SHARE_MODE :: distinct bit_set[enum {
	DELETE = 2,
	READ = 0,
	WRITE = 1,
}; u32]
FILE_SHARE_MODE_NONE :: transmute(FILE_SHARE_MODE)u32(0x00000000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_standard_info ]]
FILE_STANDARD_INFO :: struct {
	AllocationSize: i64,
	EndOfFile: i64,
	NumberOfLinks: u32,
	DeletePending: BOOLEAN,
	Directory: BOOLEAN,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_storage_info ]]
FILE_STORAGE_INFO :: struct {
	LogicalBytesPerSector: u32,
	PhysicalBytesPerSectorForAtomicity: u32,
	PhysicalBytesPerSectorForPerformance: u32,
	FileSystemEffectivePhysicalBytesPerSectorForAtomicity: u32,
	Flags: u32,
	ByteOffsetForSectorAlignment: u32,
	ByteOffsetForPartitionAlignment: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-file_stream_info ]]
FILE_STREAM_INFO :: struct {
	NextEntryOffset: u32,
	StreamNameLength: u32,
	StreamSize: i64,
	StreamAllocationSize: i64,
	StreamName: [1]u16,
}

FILE_TYPE :: enum u32 {
	UNKNOWN = 0x00000000,
	DISK = 0x00000001,
	CHAR = 0x00000002,
	PIPE = 0x00000003,
	REMOTE = 0x00008000,
}

FILE_WRITE_FLAGS :: distinct bit_set[enum {
	WRITE_THROUGH = 0,
}; i32]
FILE_WRITE_FLAGS_NONE :: transmute(FILE_WRITE_FLAGS)i32(0)

FIND_FIRST_EX_FLAGS :: distinct bit_set[enum {
	CASE_SENSITIVE = 0,
	LARGE_FETCH = 1,
	ON_DISK_ENTRIES_ONLY = 2,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-findex_info_levels ]]
FINDEX_INFO_LEVELS :: enum i32 {
	Standard = 0,
	Basic = 1,
	MaxInfoLevel = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-findex_search_ops ]]
FINDEX_SEARCH_OPS :: enum i32 {
	NameMatch = 0,
	LimitToDirectories = 1,
	LimitToDevices = 2,
	MaxSearchOp = 3,
}

FIO_CONTEXT :: struct {
	m_dwTempHack: u32,
	m_dwSignature: u32,
	m_hFile: HANDLE,
	m_dwLinesOffset: u32,
	m_dwHeaderLength: u32,
}

GET_FILE_VERSION_INFO_FLAGS :: distinct bit_set[enum {
	LOCALISED = 0,
	NEUTRAL = 1,
	PREFETCHED = 2,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-get_fileex_info_levels ]]
GET_FILEEX_INFO_LEVELS :: enum i32 {
	InfoStandard = 0,
	MaxInfoLevel = 1,
}

GET_TAPE_DRIVE_PARAMETERS_OPERATION :: enum u32 {
	DRIVE_INFORMATION = 0x00000001,
	MEDIA_INFORMATION = 0x00000000,
}

GETFINALPATHNAMEBYHANDLE_FLAGS :: enum u32 {
	VOLUME_NAME_DOS = 0x00000000,
	VOLUME_NAME_GUID = 0x00000001,
	VOLUME_NAME_NT = 0x00000002,
	VOLUME_NAME_NONE = 0x00000004,
	FILE_NAME_NORMALIZED = 0x00000000,
	FILE_NAME_OPENED = 0x00000008,
}

HIORING :: rawptr

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dskquota/nn-dskquota-idiskquotacontrol ]]
IDiskQuotaControl :: struct #raw_union {
	#subtype IConnectionPointContainer: IConnectionPointContainer,
	using Vtbl: ^IDiskQuotaControl_Vtbl,
}
IDiskQuotaControl_Vtbl :: struct {
	using IConnectionPointContainer_Vtbl: IConnectionPointContainer_Vtbl,
	Initialize: proc "system" (this: ^IDiskQuotaControl, pszPath: PWSTR, bReadWrite: BOOL) -> HRESULT,
	SetQuotaState: proc "system" (this: ^IDiskQuotaControl, dwState: u32) -> HRESULT,
	GetQuotaState: proc "system" (this: ^IDiskQuotaControl, pdwState: ^u32) -> HRESULT,
	SetQuotaLogFlags: proc "system" (this: ^IDiskQuotaControl, dwFlags: u32) -> HRESULT,
	GetQuotaLogFlags: proc "system" (this: ^IDiskQuotaControl, pdwFlags: ^u32) -> HRESULT,
	SetDefaultQuotaThreshold: proc "system" (this: ^IDiskQuotaControl, llThreshold: i64) -> HRESULT,
	GetDefaultQuotaThreshold: proc "system" (this: ^IDiskQuotaControl, pllThreshold: ^i64) -> HRESULT,
	GetDefaultQuotaThresholdText: proc "system" (this: ^IDiskQuotaControl, pszText: PWSTR, cchText: u32) -> HRESULT,
	SetDefaultQuotaLimit: proc "system" (this: ^IDiskQuotaControl, llLimit: i64) -> HRESULT,
	GetDefaultQuotaLimit: proc "system" (this: ^IDiskQuotaControl, pllLimit: ^i64) -> HRESULT,
	GetDefaultQuotaLimitText: proc "system" (this: ^IDiskQuotaControl, pszText: PWSTR, cchText: u32) -> HRESULT,
	AddUserSid: proc "system" (
		this: ^IDiskQuotaControl,
		pUserSid: PSID,
		fNameResolution: DISKQUOTA_USERNAME_RESOLVE,
		ppUser: ^^IDiskQuotaUser,
	) -> HRESULT,
	AddUserName: proc "system" (
		this: ^IDiskQuotaControl,
		pszLogonName: PWSTR,
		fNameResolution: DISKQUOTA_USERNAME_RESOLVE,
		ppUser: ^^IDiskQuotaUser,
	) -> HRESULT,
	DeleteUser: proc "system" (this: ^IDiskQuotaControl, pUser: ^IDiskQuotaUser) -> HRESULT,
	FindUserSid: proc "system" (
		this: ^IDiskQuotaControl,
		pUserSid: PSID,
		fNameResolution: DISKQUOTA_USERNAME_RESOLVE,
		ppUser: ^^IDiskQuotaUser,
	) -> HRESULT,
	FindUserName: proc "system" (this: ^IDiskQuotaControl, pszLogonName: PWSTR, ppUser: ^^IDiskQuotaUser) -> HRESULT,
	CreateEnumUsers: proc "system" (
		this: ^IDiskQuotaControl,
		rgpUserSids: ^PSID,
		cpSids: u32,
		fNameResolution: DISKQUOTA_USERNAME_RESOLVE,
		ppEnum: ^^IEnumDiskQuotaUsers,
	) -> HRESULT,
	CreateUserBatch: proc "system" (this: ^IDiskQuotaControl, ppBatch: ^^IDiskQuotaUserBatch) -> HRESULT,
	InvalidateSidNameCache: proc "system" (this: ^IDiskQuotaControl) -> HRESULT,
	GiveUserNameResolutionPriority: proc "system" (this: ^IDiskQuotaControl, pUser: ^IDiskQuotaUser) -> HRESULT,
	ShutdownNameResolution: proc "system" (this: ^IDiskQuotaControl) -> HRESULT,
}
IID_IDiskQuotaControl :: GUID{0x7988B572, 0xEC89, 0x11CF, {0x9C, 0x00, 0x00, 0xAA, 0x00, 0xA1, 0x4F, 0x56}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dskquota/nn-dskquota-idiskquotaevents ]]
IDiskQuotaEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDiskQuotaEvents_Vtbl,
}
IDiskQuotaEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	OnUserNameChanged: proc "system" (this: ^IDiskQuotaEvents, pUser: ^IDiskQuotaUser) -> HRESULT,
}
IID_IDiskQuotaEvents :: GUID{0x7988B579, 0xEC89, 0x11CF, {0x9C, 0x00, 0x00, 0xAA, 0x00, 0xA1, 0x4F, 0x56}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dskquota/nn-dskquota-idiskquotauser ]]
IDiskQuotaUser :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDiskQuotaUser_Vtbl,
}
IDiskQuotaUser_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetID: proc "system" (this: ^IDiskQuotaUser, pulID: ^u32) -> HRESULT,
	GetName: proc "system" (
		this: ^IDiskQuotaUser,
		pszAccountContainer: PWSTR,
		cchAccountContainer: u32,
		pszLogonName: PWSTR,
		cchLogonName: u32,
		pszDisplayName: PWSTR,
		cchDisplayName: u32,
	) -> HRESULT,
	GetSidLength: proc "system" (this: ^IDiskQuotaUser, pdwLength: ^u32) -> HRESULT,
	GetSid: proc "system" (this: ^IDiskQuotaUser, pbSidBuffer: ^u8, cbSidBuffer: u32) -> HRESULT,
	GetQuotaThreshold: proc "system" (this: ^IDiskQuotaUser, pllThreshold: ^i64) -> HRESULT,
	GetQuotaThresholdText: proc "system" (this: ^IDiskQuotaUser, pszText: PWSTR, cchText: u32) -> HRESULT,
	GetQuotaLimit: proc "system" (this: ^IDiskQuotaUser, pllLimit: ^i64) -> HRESULT,
	GetQuotaLimitText: proc "system" (this: ^IDiskQuotaUser, pszText: PWSTR, cchText: u32) -> HRESULT,
	GetQuotaUsed: proc "system" (this: ^IDiskQuotaUser, pllUsed: ^i64) -> HRESULT,
	GetQuotaUsedText: proc "system" (this: ^IDiskQuotaUser, pszText: PWSTR, cchText: u32) -> HRESULT,
	GetQuotaInformation: proc "system" (this: ^IDiskQuotaUser, pbQuotaInfo: rawptr, cbQuotaInfo: u32) -> HRESULT,
	SetQuotaThreshold: proc "system" (this: ^IDiskQuotaUser, llThreshold: i64, fWriteThrough: BOOL) -> HRESULT,
	SetQuotaLimit: proc "system" (this: ^IDiskQuotaUser, llLimit: i64, fWriteThrough: BOOL) -> HRESULT,
	Invalidate: proc "system" (this: ^IDiskQuotaUser) -> HRESULT,
	GetAccountStatus: proc "system" (this: ^IDiskQuotaUser, pdwStatus: ^u32) -> HRESULT,
}
IID_IDiskQuotaUser :: GUID{0x7988B574, 0xEC89, 0x11CF, {0x9C, 0x00, 0x00, 0xAA, 0x00, 0xA1, 0x4F, 0x56}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dskquota/nn-dskquota-idiskquotauserbatch ]]
IDiskQuotaUserBatch :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IDiskQuotaUserBatch_Vtbl,
}
IDiskQuotaUserBatch_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Add: proc "system" (this: ^IDiskQuotaUserBatch, pUser: ^IDiskQuotaUser) -> HRESULT,
	Remove: proc "system" (this: ^IDiskQuotaUserBatch, pUser: ^IDiskQuotaUser) -> HRESULT,
	RemoveAll: proc "system" (this: ^IDiskQuotaUserBatch) -> HRESULT,
	FlushToDisk: proc "system" (this: ^IDiskQuotaUserBatch) -> HRESULT,
}
IID_IDiskQuotaUserBatch :: GUID{0x7988B576, 0xEC89, 0x11CF, {0x9C, 0x00, 0x00, 0xAA, 0x00, 0xA1, 0x4F, 0x56}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/dskquota/nn-dskquota-ienumdiskquotausers ]]
IEnumDiskQuotaUsers :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumDiskQuotaUsers_Vtbl,
}
IEnumDiskQuotaUsers_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (
		this: ^IEnumDiskQuotaUsers,
		cUsers: u32,
		rgUsers: ^^IDiskQuotaUser,
		pcUsersFetched: ^u32,
	) -> HRESULT,
	Skip: proc "system" (this: ^IEnumDiskQuotaUsers, cUsers: u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumDiskQuotaUsers) -> HRESULT,
	Clone: proc "system" (this: ^IEnumDiskQuotaUsers, ppEnum: ^^IEnumDiskQuotaUsers) -> HRESULT,
}
IID_IEnumDiskQuotaUsers :: GUID{0x7988B577, 0xEC89, 0x11CF, {0x9C, 0x00, 0x00, 0xAA, 0x00, 0xA1, 0x4F, 0x56}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntioring_x/ns-ntioring_x-ioring_buffer_info ]]
IORING_BUFFER_INFO :: struct {
	Address: rawptr,
	Length: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_buffer_ref ]]
IORING_BUFFER_REF :: struct {
	Kind: IORING_REF_KIND,
	Buffer: struct #raw_union {
		Address: rawptr,
		IndexAndOffset: IORING_REGISTERED_BUFFER,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_capabilities ]]
IORING_CAPABILITIES :: struct {
	MaxVersion: IORING_VERSION,
	MaxSubmissionQueueSize: u32,
	MaxCompletionQueueSize: u32,
	FeatureFlags: IORING_FEATURE_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_cqe ]]
IORING_CQE :: struct {
	UserData: uintptr,
	ResultCode: HRESULT,
	Information: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_create_advisory_flags ]]
IORING_CREATE_ADVISORY_FLAGS :: distinct bit_set[enum {}; i32]
IORING_CREATE_ADVISORY_FLAGS_NONE :: transmute(IORING_CREATE_ADVISORY_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_create_flags ]]
IORING_CREATE_FLAGS :: struct {
	Required: IORING_CREATE_REQUIRED_FLAGS,
	Advisory: IORING_CREATE_ADVISORY_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_create_required_flags ]]
IORING_CREATE_REQUIRED_FLAGS :: distinct bit_set[enum {}; i32]
IORING_CREATE_REQUIRED_FLAGS_NONE :: transmute(IORING_CREATE_REQUIRED_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_feature_flags ]]
IORING_FEATURE_FLAGS :: distinct bit_set[enum {
	UM_EMULATION = 0,
	SET_COMPLETION_EVENT = 1,
}; i32]
IORING_FEATURE_FLAGS_FLAGS_NONE :: transmute(IORING_FEATURE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_handle_ref ]]
IORING_HANDLE_REF :: struct {
	Kind: IORING_REF_KIND,
	Handle: struct #raw_union {
		Handle: HANDLE,
		Index: u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ns-ioringapi-ioring_info ]]
IORING_INFO :: struct {
	IoRingVersion: IORING_VERSION,
	Flags: IORING_CREATE_FLAGS,
	SubmissionQueueSize: u32,
	CompletionQueueSize: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_op_code ]]
IORING_OP_CODE :: enum i32 {
	NOP = 0,
	READ = 1,
	REGISTER_FILES = 2,
	REGISTER_BUFFERS = 3,
	CANCEL = 4,
	WRITE = 5,
	FLUSH = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_ref_kind ]]
IORING_REF_KIND :: enum i32 {
	RAW = 0,
	REGISTERED = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntioring_x/ns-ntioring_x-ioring_registered_buffer ]]
IORING_REGISTERED_BUFFER :: struct {
	BufferIndex: u32,
	Offset: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioringapi/ne-ioringapi-ioring_sqe_flags ]]
IORING_SQE_FLAGS :: distinct bit_set[enum {
	DRAIN_PRECEDING_OPS = 0,
}; i32]
IORING_SQE_FLAGS_NONE :: transmute(IORING_SQE_FLAGS)i32(0)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntioring_x/ne-ntioring_x-ioring_version ]]
IORING_VERSION :: enum i32 {
	INVALID = 0,
	_1 = 1,
	_2 = 2,
	_3 = 300,
}

KCRM_MARSHAL_HEADER :: struct {
	VersionMajor: u32,
	VersionMinor: u32,
	NumProtocols: u32,
	Unused: u32,
}

KCRM_PROTOCOL_BLOB :: struct {
	ProtocolId: GUID,
	StaticInfoLength: u32,
	TransactionIdInfoLength: u32,
	Unused1: u32,
	Unused2: u32,
}

KCRM_TRANSACTION_BLOB :: struct {
	UOW: GUID,
	TmIdentity: GUID,
	IsolationLevel: u32,
	IsolationFlags: u32,
	Timeout: u32,
	Description: [64]u16,
}

LOCK_FILE_FLAGS :: distinct bit_set[enum {
	EXCLUSIVE_LOCK = 1,
	FAIL_IMMEDIATELY = 0,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/clfsmgmtw32/ns-clfsmgmtw32-log_management_callbacks ]]
LOG_MANAGEMENT_CALLBACKS :: struct {
	CallbackContext: rawptr,
	AdvanceTailCallback: PLOG_TAIL_ADVANCE_CALLBACK,
	LogFullHandlerCallback: PLOG_FULL_HANDLER_CALLBACK,
	LogUnpinnedCallback: PLOG_UNPINNED_CALLBACK,
}

LPPROGRESS_ROUTINE :: #type proc "system" (
	TotalFileSize: i64,
	TotalBytesTransferred: i64,
	StreamSize: i64,
	StreamBytesTransferred: i64,
	dwStreamNumber: u32,
	dwCallbackReason: LPPROGRESS_ROUTINE_CALLBACK_REASON,
	hSourceFile: HANDLE,
	hDestinationFile: HANDLE,
	lpData: rawptr,
) -> u32

LPPROGRESS_ROUTINE_CALLBACK_REASON :: enum u32 {
	CHUNK_FINISHED = 0x00000000,
	STREAM_SWITCH = 0x00000001,
}

LZOPENFILE_STYLE :: distinct bit_set[enum {
	CANCEL = 11,
	CREATE = 12,
	DELETE = 9,
	EXIST = 14,
	PARSE = 8,
	PROMPT = 13,
	READWRITE = 1,
	REOPEN = 15,
	SHARE_DENY_NONE = 6,
	SHARE_DENY_WRITE = 5,
	SHARE_EXCLUSIVE = 4,
	WRITE = 0,
	VERIFY = 10,
}; u16]
LZOPENFILE_STYLE_READ :: transmute(LZOPENFILE_STYLE)u16(0x0000)
LZOPENFILE_STYLE_SHARE_DENY_READ :: transmute(LZOPENFILE_STYLE)u16(0x0030)
LZOPENFILE_STYLE_SHARE_COMPAT :: transmute(LZOPENFILE_STYLE)u16(0x0000)

MAXMEDIALABEL :: #type proc "system" (pMaxSize: ^u32) -> u32

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsmli/ns-ntmsmli-medialabelinfo ]]
MediaLabelInfo :: struct {
	LabelType: [64]u16,
	LabelIDSize: u32,
	LabelID: [256]u8,
	LabelAppDescr: [256]u16,
}

MOVE_FILE_FLAGS :: distinct bit_set[enum {
	COPY_ALLOWED = 1,
	CREATE_HARDLINK = 4,
	DELAY_UNTIL_REBOOT = 2,
	REPLACE_EXISTING = 0,
	WRITE_THROUGH = 3,
	FAIL_IF_NOT_TRACKABLE = 5,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/filehc/ns-filehc-name_cache_context ]]
NAME_CACHE_CONTEXT :: struct {
	m_dwSignature: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_allocation_information ]]
NTMS_ALLOCATION_INFORMATION :: struct {
	dwSize: u32,
	lpReserved: rawptr,
	AllocatedFrom: GUID,
}

NTMS_ASYNC_IO :: struct {
	OperationId: GUID,
	EventId: GUID,
	dwOperationType: u32,
	dwResult: u32,
	dwAsyncState: u32,
	hEvent: HANDLE,
	bOnStateChange: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_changerinformationa ]]
NTMS_CHANGERINFORMATIONA :: struct {
	Number: u32,
	ChangerType: GUID,
	szSerialNumber: [32]CHAR,
	szRevision: [32]CHAR,
	szDeviceName: [64]CHAR,
	ScsiPort: u16,
	ScsiBus: u16,
	ScsiTarget: u16,
	ScsiLun: u16,
	Library: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_changerinformationw ]]
NTMS_CHANGERINFORMATIONW :: struct {
	Number: u32,
	ChangerType: GUID,
	szSerialNumber: [32]u16,
	szRevision: [32]u16,
	szDeviceName: [64]u16,
	ScsiPort: u16,
	ScsiBus: u16,
	ScsiTarget: u16,
	ScsiLun: u16,
	Library: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_changertypeinformationa ]]
NTMS_CHANGERTYPEINFORMATIONA :: struct {
	szVendor: [128]CHAR,
	szProduct: [128]CHAR,
	DeviceType: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_changertypeinformationw ]]
NTMS_CHANGERTYPEINFORMATIONW :: struct {
	szVendor: [128]u16,
	szProduct: [128]u16,
	DeviceType: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_computerinformation ]]
NTMS_COMPUTERINFORMATION :: struct {
	dwLibRequestPurgeTime: u32,
	dwOpRequestPurgeTime: u32,
	dwLibRequestFlags: u32,
	dwOpRequestFlags: u32,
	dwMediaPoolPolicy: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_driveinformationa ]]
NTMS_DRIVEINFORMATIONA :: struct {
	Number: u32,
	State: NtmsDriveState,
	DriveType: GUID,
	szDeviceName: [64]CHAR,
	szSerialNumber: [32]CHAR,
	szRevision: [32]CHAR,
	ScsiPort: u16,
	ScsiBus: u16,
	ScsiTarget: u16,
	ScsiLun: u16,
	dwMountCount: u32,
	LastCleanedTs: SYSTEMTIME,
	SavedPartitionId: GUID,
	Library: GUID,
	Reserved: GUID,
	dwDeferDismountDelay: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_driveinformationw ]]
NTMS_DRIVEINFORMATIONW :: struct {
	Number: u32,
	State: NtmsDriveState,
	DriveType: GUID,
	szDeviceName: [64]u16,
	szSerialNumber: [32]u16,
	szRevision: [32]u16,
	ScsiPort: u16,
	ScsiBus: u16,
	ScsiTarget: u16,
	ScsiLun: u16,
	dwMountCount: u32,
	LastCleanedTs: SYSTEMTIME,
	SavedPartitionId: GUID,
	Library: GUID,
	Reserved: GUID,
	dwDeferDismountDelay: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_drivetypeinformationa ]]
NTMS_DRIVETYPEINFORMATIONA :: struct {
	szVendor: [128]CHAR,
	szProduct: [128]CHAR,
	NumberOfHeads: u32,
	DeviceType: FILE_DEVICE_TYPE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_drivetypeinformationw ]]
NTMS_DRIVETYPEINFORMATIONW :: struct {
	szVendor: [128]u16,
	szProduct: [128]u16,
	NumberOfHeads: u32,
	DeviceType: FILE_DEVICE_TYPE,
}

NTMS_FILESYSTEM_INFO :: struct {
	FileSystemType: [64]u16,
	VolumeName: [256]u16,
	SerialNumber: u32,
}

NTMS_I1_LIBRARYINFORMATION :: struct {
	LibraryType: u32,
	CleanerSlot: GUID,
	CleanerSlotDefault: GUID,
	LibrarySupportsDriveCleaning: BOOL,
	BarCodeReaderInstalled: BOOL,
	InventoryMethod: u32,
	dwCleanerUsesRemaining: u32,
	FirstDriveNumber: u32,
	dwNumberOfDrives: u32,
	FirstSlotNumber: u32,
	dwNumberOfSlots: u32,
	FirstDoorNumber: u32,
	dwNumberOfDoors: u32,
	FirstPortNumber: u32,
	dwNumberOfPorts: u32,
	FirstChangerNumber: u32,
	dwNumberOfChangers: u32,
	dwNumberOfMedia: u32,
	dwNumberOfMediaTypes: u32,
	dwNumberOfLibRequests: u32,
	Reserved: GUID,
}

NTMS_I1_LIBREQUESTINFORMATIONA :: struct {
	OperationCode: u32,
	OperationOption: u32,
	State: u32,
	PartitionId: GUID,
	DriveId: GUID,
	PhysMediaId: GUID,
	Library: GUID,
	SlotId: GUID,
	TimeQueued: SYSTEMTIME,
	TimeCompleted: SYSTEMTIME,
	szApplication: [64]CHAR,
	szUser: [64]CHAR,
	szComputer: [64]CHAR,
}

NTMS_I1_LIBREQUESTINFORMATIONW :: struct {
	OperationCode: u32,
	OperationOption: u32,
	State: u32,
	PartitionId: GUID,
	DriveId: GUID,
	PhysMediaId: GUID,
	Library: GUID,
	SlotId: GUID,
	TimeQueued: SYSTEMTIME,
	TimeCompleted: SYSTEMTIME,
	szApplication: [64]u16,
	szUser: [64]u16,
	szComputer: [64]u16,
}

NTMS_I1_OBJECTINFORMATIONA :: struct {
	dwSize: u32,
	dwType: u32,
	Created: SYSTEMTIME,
	Modified: SYSTEMTIME,
	ObjectGuid: GUID,
	Enabled: BOOL,
	dwOperationalState: u32,
	szName: [64]CHAR,
	szDescription: [127]CHAR,
	Info: struct #raw_union {
		Drive: NTMS_DRIVEINFORMATIONA,
		DriveType: NTMS_DRIVETYPEINFORMATIONA,
		Library: NTMS_I1_LIBRARYINFORMATION,
		Changer: NTMS_CHANGERINFORMATIONA,
		ChangerType: NTMS_CHANGERTYPEINFORMATIONA,
		StorageSlot: NTMS_STORAGESLOTINFORMATION,
		IEDoor: NTMS_IEDOORINFORMATION,
		IEPort: NTMS_IEPORTINFORMATION,
		PhysicalMedia: NTMS_I1_PMIDINFORMATIONA,
		LogicalMedia: NTMS_LMIDINFORMATION,
		Partition: NTMS_I1_PARTITIONINFORMATIONA,
		MediaPool: NTMS_MEDIAPOOLINFORMATION,
		MediaType: NTMS_MEDIATYPEINFORMATION,
		LibRequest: NTMS_I1_LIBREQUESTINFORMATIONA,
		OpRequest: NTMS_I1_OPREQUESTINFORMATIONA,
	},
}

NTMS_I1_OBJECTINFORMATIONW :: struct {
	dwSize: u32,
	dwType: u32,
	Created: SYSTEMTIME,
	Modified: SYSTEMTIME,
	ObjectGuid: GUID,
	Enabled: BOOL,
	dwOperationalState: u32,
	szName: [64]u16,
	szDescription: [127]u16,
	Info: struct #raw_union {
		Drive: NTMS_DRIVEINFORMATIONW,
		DriveType: NTMS_DRIVETYPEINFORMATIONW,
		Library: NTMS_I1_LIBRARYINFORMATION,
		Changer: NTMS_CHANGERINFORMATIONW,
		ChangerType: NTMS_CHANGERTYPEINFORMATIONW,
		StorageSlot: NTMS_STORAGESLOTINFORMATION,
		IEDoor: NTMS_IEDOORINFORMATION,
		IEPort: NTMS_IEPORTINFORMATION,
		PhysicalMedia: NTMS_I1_PMIDINFORMATIONW,
		LogicalMedia: NTMS_LMIDINFORMATION,
		Partition: NTMS_I1_PARTITIONINFORMATIONW,
		MediaPool: NTMS_MEDIAPOOLINFORMATION,
		MediaType: NTMS_MEDIATYPEINFORMATION,
		LibRequest: NTMS_I1_LIBREQUESTINFORMATIONW,
		OpRequest: NTMS_I1_OPREQUESTINFORMATIONW,
	},
}

NTMS_I1_OPREQUESTINFORMATIONA :: struct {
	Request: u32,
	Submitted: SYSTEMTIME,
	State: u32,
	szMessage: [127]CHAR,
	Arg1Type: u32,
	Arg1: GUID,
	Arg2Type: u32,
	Arg2: GUID,
	szApplication: [64]CHAR,
	szUser: [64]CHAR,
	szComputer: [64]CHAR,
}

NTMS_I1_OPREQUESTINFORMATIONW :: struct {
	Request: u32,
	Submitted: SYSTEMTIME,
	State: u32,
	szMessage: [127]u16,
	Arg1Type: u32,
	Arg1: GUID,
	Arg2Type: u32,
	Arg2: GUID,
	szApplication: [64]u16,
	szUser: [64]u16,
	szComputer: [64]u16,
}

NTMS_I1_PARTITIONINFORMATIONA :: struct {
	PhysicalMedia: GUID,
	LogicalMedia: GUID,
	State: u32,
	Side: u16,
	dwOmidLabelIdLength: u32,
	OmidLabelId: [255]u8,
	szOmidLabelType: [64]CHAR,
	szOmidLabelInfo: [256]CHAR,
	dwMountCount: u32,
	dwAllocateCount: u32,
}

NTMS_I1_PARTITIONINFORMATIONW :: struct {
	PhysicalMedia: GUID,
	LogicalMedia: GUID,
	State: u32,
	Side: u16,
	dwOmidLabelIdLength: u32,
	OmidLabelId: [255]u8,
	szOmidLabelType: [64]u16,
	szOmidLabelInfo: [256]u16,
	dwMountCount: u32,
	dwAllocateCount: u32,
}

NTMS_I1_PMIDINFORMATIONA :: struct {
	CurrentLibrary: GUID,
	MediaPool: GUID,
	Location: GUID,
	LocationType: u32,
	MediaType: GUID,
	HomeSlot: GUID,
	szBarCode: [64]CHAR,
	BarCodeState: u32,
	szSequenceNumber: [32]CHAR,
	MediaState: u32,
	dwNumberOfPartitions: u32,
}

NTMS_I1_PMIDINFORMATIONW :: struct {
	CurrentLibrary: GUID,
	MediaPool: GUID,
	Location: GUID,
	LocationType: u32,
	MediaType: GUID,
	HomeSlot: GUID,
	szBarCode: [64]u16,
	BarCodeState: u32,
	szSequenceNumber: [32]u16,
	MediaState: u32,
	dwNumberOfPartitions: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_iedoorinformation ]]
NTMS_IEDOORINFORMATION :: struct {
	Number: u32,
	State: NtmsDoorState,
	MaxOpenSecs: u16,
	Library: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_ieportinformation ]]
NTMS_IEPORTINFORMATION :: struct {
	Number: u32,
	Content: NtmsPortContent,
	Position: NtmsPortPosition,
	MaxExtendSecs: u16,
	Library: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_libraryinformation ]]
NTMS_LIBRARYINFORMATION :: struct {
	LibraryType: NtmsLibraryType,
	CleanerSlot: GUID,
	CleanerSlotDefault: GUID,
	LibrarySupportsDriveCleaning: BOOL,
	BarCodeReaderInstalled: BOOL,
	InventoryMethod: NtmsInventoryMethod,
	dwCleanerUsesRemaining: u32,
	FirstDriveNumber: u32,
	dwNumberOfDrives: u32,
	FirstSlotNumber: u32,
	dwNumberOfSlots: u32,
	FirstDoorNumber: u32,
	dwNumberOfDoors: u32,
	FirstPortNumber: u32,
	dwNumberOfPorts: u32,
	FirstChangerNumber: u32,
	dwNumberOfChangers: u32,
	dwNumberOfMedia: u32,
	dwNumberOfMediaTypes: u32,
	dwNumberOfLibRequests: u32,
	Reserved: GUID,
	AutoRecovery: BOOL,
	dwFlags: NtmsLibraryFlags,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_librequestinformationa ]]
NTMS_LIBREQUESTINFORMATIONA :: struct {
	OperationCode: NtmsLmOperation,
	OperationOption: u32,
	State: NtmsLmState,
	PartitionId: GUID,
	DriveId: GUID,
	PhysMediaId: GUID,
	Library: GUID,
	SlotId: GUID,
	TimeQueued: SYSTEMTIME,
	TimeCompleted: SYSTEMTIME,
	szApplication: [64]CHAR,
	szUser: [64]CHAR,
	szComputer: [64]CHAR,
	dwErrorCode: u32,
	WorkItemId: GUID,
	dwPriority: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_librequestinformationw ]]
NTMS_LIBREQUESTINFORMATIONW :: struct {
	OperationCode: NtmsLmOperation,
	OperationOption: u32,
	State: NtmsLmState,
	PartitionId: GUID,
	DriveId: GUID,
	PhysMediaId: GUID,
	Library: GUID,
	SlotId: GUID,
	TimeQueued: SYSTEMTIME,
	TimeCompleted: SYSTEMTIME,
	szApplication: [64]u16,
	szUser: [64]u16,
	szComputer: [64]u16,
	dwErrorCode: u32,
	WorkItemId: GUID,
	dwPriority: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_lmidinformation ]]
NTMS_LMIDINFORMATION :: struct {
	MediaPool: GUID,
	dwNumberOfPartitions: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_mediapoolinformation ]]
NTMS_MEDIAPOOLINFORMATION :: struct {
	PoolType: u32,
	MediaType: GUID,
	Parent: GUID,
	AllocationPolicy: u32,
	DeallocationPolicy: u32,
	dwMaxAllocates: u32,
	dwNumberOfPhysicalMedia: u32,
	dwNumberOfLogicalMedia: u32,
	dwNumberOfMediaPools: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_mediatypeinformation ]]
NTMS_MEDIATYPEINFORMATION :: struct {
	MediaType: u32,
	NumberOfSides: u32,
	ReadWriteCharacteristics: NtmsReadWriteCharacteristics,
	DeviceType: FILE_DEVICE_TYPE,
}

NTMS_MOUNT_INFORMATION :: struct {
	dwSize: u32,
	lpReserved: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_notificationinformation ]]
NTMS_NOTIFICATIONINFORMATION :: struct {
	dwOperation: NtmsNotificationOperations,
	ObjectId: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa ]]
NTMS_OBJECTINFORMATIONA :: struct {
	dwSize: u32,
	dwType: NtmsObjectsTypes,
	Created: SYSTEMTIME,
	Modified: SYSTEMTIME,
	ObjectGuid: GUID,
	Enabled: BOOL,
	dwOperationalState: NtmsOperationalState,
	szName: [64]CHAR,
	szDescription: [127]CHAR,
	Info: struct #raw_union {
		Drive: NTMS_DRIVEINFORMATIONA,
		DriveType: NTMS_DRIVETYPEINFORMATIONA,
		Library: NTMS_LIBRARYINFORMATION,
		Changer: NTMS_CHANGERINFORMATIONA,
		ChangerType: NTMS_CHANGERTYPEINFORMATIONA,
		StorageSlot: NTMS_STORAGESLOTINFORMATION,
		IEDoor: NTMS_IEDOORINFORMATION,
		IEPort: NTMS_IEPORTINFORMATION,
		PhysicalMedia: NTMS_PMIDINFORMATIONA,
		LogicalMedia: NTMS_LMIDINFORMATION,
		Partition: NTMS_PARTITIONINFORMATIONA,
		MediaPool: NTMS_MEDIAPOOLINFORMATION,
		MediaType: NTMS_MEDIATYPEINFORMATION,
		LibRequest: NTMS_LIBREQUESTINFORMATIONA,
		OpRequest: NTMS_OPREQUESTINFORMATIONA,
		Computer: NTMS_COMPUTERINFORMATION,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_objectinformationw ]]
NTMS_OBJECTINFORMATIONW :: struct {
	dwSize: u32,
	dwType: NtmsObjectsTypes,
	Created: SYSTEMTIME,
	Modified: SYSTEMTIME,
	ObjectGuid: GUID,
	Enabled: BOOL,
	dwOperationalState: NtmsOperationalState,
	szName: [64]u16,
	szDescription: [127]u16,
	Info: struct #raw_union {
		Drive: NTMS_DRIVEINFORMATIONW,
		DriveType: NTMS_DRIVETYPEINFORMATIONW,
		Library: NTMS_LIBRARYINFORMATION,
		Changer: NTMS_CHANGERINFORMATIONW,
		ChangerType: NTMS_CHANGERTYPEINFORMATIONW,
		StorageSlot: NTMS_STORAGESLOTINFORMATION,
		IEDoor: NTMS_IEDOORINFORMATION,
		IEPort: NTMS_IEPORTINFORMATION,
		PhysicalMedia: NTMS_PMIDINFORMATIONW,
		LogicalMedia: NTMS_LMIDINFORMATION,
		Partition: NTMS_PARTITIONINFORMATIONW,
		MediaPool: NTMS_MEDIAPOOLINFORMATION,
		MediaType: NTMS_MEDIATYPEINFORMATION,
		LibRequest: NTMS_LIBREQUESTINFORMATIONW,
		OpRequest: NTMS_OPREQUESTINFORMATIONW,
		Computer: NTMS_COMPUTERINFORMATION,
	},
}

NTMS_OMID_TYPE :: enum u32 {
	FILESYSTEM_INFO = 0x00000002,
	RAW_LABEL = 0x00000001,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_oprequestinformationa ]]
NTMS_OPREQUESTINFORMATIONA :: struct {
	Request: NtmsOpreqCommand,
	Submitted: SYSTEMTIME,
	State: NtmsOpreqState,
	szMessage: [256]CHAR,
	Arg1Type: NtmsObjectsTypes,
	Arg1: GUID,
	Arg2Type: NtmsObjectsTypes,
	Arg2: GUID,
	szApplication: [64]CHAR,
	szUser: [64]CHAR,
	szComputer: [64]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_oprequestinformationw ]]
NTMS_OPREQUESTINFORMATIONW :: struct {
	Request: NtmsOpreqCommand,
	Submitted: SYSTEMTIME,
	State: NtmsOpreqState,
	szMessage: [256]u16,
	Arg1Type: NtmsObjectsTypes,
	Arg1: GUID,
	Arg2Type: NtmsObjectsTypes,
	Arg2: GUID,
	szApplication: [64]u16,
	szUser: [64]u16,
	szComputer: [64]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_partitioninformationa ]]
NTMS_PARTITIONINFORMATIONA :: struct {
	PhysicalMedia: GUID,
	LogicalMedia: GUID,
	State: NtmsPartitionState,
	Side: u16,
	dwOmidLabelIdLength: u32,
	OmidLabelId: [255]u8,
	szOmidLabelType: [64]CHAR,
	szOmidLabelInfo: [256]CHAR,
	dwMountCount: u32,
	dwAllocateCount: u32,
	Capacity: i64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_partitioninformationw ]]
NTMS_PARTITIONINFORMATIONW :: struct {
	PhysicalMedia: GUID,
	LogicalMedia: GUID,
	State: NtmsPartitionState,
	Side: u16,
	dwOmidLabelIdLength: u32,
	OmidLabelId: [255]u8,
	szOmidLabelType: [64]u16,
	szOmidLabelInfo: [256]u16,
	dwMountCount: u32,
	dwAllocateCount: u32,
	Capacity: i64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_pmidinformationa ]]
NTMS_PMIDINFORMATIONA :: struct {
	CurrentLibrary: GUID,
	MediaPool: GUID,
	Location: GUID,
	LocationType: u32,
	MediaType: GUID,
	HomeSlot: GUID,
	szBarCode: [64]CHAR,
	BarCodeState: NtmsBarCodeState,
	szSequenceNumber: [32]CHAR,
	MediaState: NtmsMediaState,
	dwNumberOfPartitions: u32,
	dwMediaTypeCode: u32,
	dwDensityCode: u32,
	MountedPartition: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_pmidinformationw ]]
NTMS_PMIDINFORMATIONW :: struct {
	CurrentLibrary: GUID,
	MediaPool: GUID,
	Location: GUID,
	LocationType: u32,
	MediaType: GUID,
	HomeSlot: GUID,
	szBarCode: [64]u16,
	BarCodeState: NtmsBarCodeState,
	szSequenceNumber: [32]u16,
	MediaState: NtmsMediaState,
	dwNumberOfPartitions: u32,
	dwMediaTypeCode: u32,
	dwDensityCode: u32,
	MountedPartition: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ns-ntmsapi-ntms_storageslotinformation ]]
NTMS_STORAGESLOTINFORMATION :: struct {
	Number: u32,
	State: u32,
	Library: GUID,
}

NtmsAccessMask :: enum i32 {
	USE_ACCESS = 1,
	MODIFY_ACCESS = 2,
	CONTROL_ACCESS = 4,
}

NtmsAllocateOptions :: enum i32 {
	NEW = 1,
	NEXT = 2,
	ERROR_IF_UNAVAILABLE = 4,
}

NtmsAllocationPolicy :: enum i32 {
	TMS_ALLOCATE_FROMSCRATCH = 1,
}

NtmsAsyncOperations :: enum i32 {
	TMS_ASYNCOP_MOUNT = 1,
}

NtmsAsyncStatus :: enum i32 {
	QUEUED = 0,
	WAIT_RESOURCE = 1,
	WAIT_OPERATOR = 2,
	INPROCESS = 3,
	COMPLETE = 4,
}

NtmsBarCodeState :: enum i32 {
	OK = 1,
	UNREADABLE = 2,
}

NtmsCreateNtmsMediaOptions :: enum i32 {
	TMS_ERROR_ON_DUPLICATE = 1,
}

NtmsCreateOptions :: enum i32 {
	OPEN_EXISTING = 1,
	CREATE_NEW = 2,
	OPEN_ALWAYS = 3,
}

NtmsDeallocationPolicy :: enum i32 {
	TMS_DEALLOCATE_TOSCRATCH = 1,
}

NtmsDismountOptions :: enum i32 {
	DEFERRED = 1,
	IMMEDIATE = 2,
}

NtmsDoorState :: enum i32 {
	UNKNOWN = 0,
	CLOSED = 1,
	OPEN = 2,
}

NtmsDriveState :: enum i32 {
	DISMOUNTED = 0,
	MOUNTED = 1,
	LOADED = 2,
	UNLOADED = 5,
	BEING_CLEANED = 6,
	DISMOUNTABLE = 7,
}

NtmsDriveType :: enum i32 {
	TMS_UNKNOWN_DRIVE = 0,
}

NtmsEjectOperation :: enum i32 {
	START = 0,
	STOP = 1,
	QUEUE = 2,
	FORCE = 3,
	IMMEDIATE = 4,
	ASK_USER = 5,
}

NtmsEnumerateOption :: enum i32 {
	DEFAULT = 0,
	ROOTPOOL = 1,
}

NtmsInjectOperation :: enum i32 {
	START = 0,
	STOP = 1,
	RETRACT = 2,
	STARTMANY = 3,
}

NtmsInventoryMethod :: enum i32 {
	NONE = 0,
	FAST = 1,
	OMID = 2,
	DEFAULT = 3,
	SLOT = 4,
	STOP = 5,
	MAX = 6,
}

NtmsLibraryFlags :: enum i32 {
	FIXEDOFFLINE = 1,
	CLEANERPRESENT = 2,
	AUTODETECTCHANGE = 4,
	IGNORECLEANERUSESREMAINING = 8,
	RECOGNIZECLEANERBARCODE = 16,
}

NtmsLibraryType :: enum i32 {
	UNKNOWN = 0,
	OFFLINE = 1,
	ONLINE = 2,
	STANDALONE = 3,
}

NtmsLibRequestFlags :: enum i32 {
	NOAUTOPURGE = 1,
	NOFAILEDPURGE = 2,
}

NtmsLmOperation :: enum i32 {
	REMOVE = 0,
	DISABLECHANGER = 1,
	DISABLELIBRARY = 1,
	ENABLECHANGER = 2,
	ENABLELIBRARY = 2,
	DISABLEDRIVE = 3,
	ENABLEDRIVE = 4,
	DISABLEMEDIA = 5,
	ENABLEMEDIA = 6,
	UPDATEOMID = 7,
	INVENTORY = 8,
	DOORACCESS = 9,
	EJECT = 10,
	EJECTCLEANER = 11,
	INJECT = 12,
	INJECTCLEANER = 13,
	PROCESSOMID = 14,
	CLEANDRIVE = 15,
	DISMOUNT = 16,
	MOUNT = 17,
	WRITESCRATCH = 18,
	CLASSIFY = 19,
	RESERVECLEANER = 20,
	RELEASECLEANER = 21,
	MAXWORKITEM = 22,
}

NtmsLmState :: enum i32 {
	QUEUED = 0,
	INPROCESS = 1,
	PASSED = 2,
	FAILED = 3,
	INVALID = 4,
	WAITING = 5,
	DEFERRED = 6,
	DEFFERED = 6,
	CANCELLED = 7,
	STOPPED = 8,
}

NtmsMediaPoolPolicy :: enum i32 {
	PURGEOFFLINESCRATCH = 1,
	KEEPOFFLINEIMPORT = 2,
}

NtmsMediaState :: enum i32 {
	IDLE = 0,
	INUSE = 1,
	MOUNTED = 2,
	LOADED = 3,
	UNLOADED = 4,
	OPERROR = 5,
	OPREQ = 6,
}

NtmsMountOptions :: enum i32 {
	READ = 1,
	WRITE = 2,
	ERROR_NOT_AVAILABLE = 4,
	ERROR_IF_UNAVAILABLE = 4,
	ERROR_OFFLINE = 8,
	ERROR_IF_OFFLINE = 8,
	SPECIFIC_DRIVE = 16,
	NOWAIT = 32,
}

NtmsMountPriority :: enum i32 {
	DEFAULT = 0,
	HIGHEST = 15,
	HIGH = 7,
	NORMAL = 0,
	LOW = -7,
	LOWEST = -15,
}

NtmsNotificationOperations :: enum i32 {
	OBJ_UPDATE = 1,
	OBJ_INSERT = 2,
	OBJ_DELETE = 3,
	EVENT_SIGNAL = 4,
	EVENT_COMPLETE = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntmsapi/ne-ntmsapi-ntmsobjectstypes ]]
NtmsObjectsTypes :: enum i32 {
	UNKNOWN = 0,
	OBJECT = 1,
	CHANGER = 2,
	CHANGER_TYPE = 3,
	COMPUTER = 4,
	DRIVE = 5,
	DRIVE_TYPE = 6,
	IEDOOR = 7,
	IEPORT = 8,
	LIBRARY = 9,
	LIBREQUEST = 10,
	LOGICAL_MEDIA = 11,
	MEDIA_POOL = 12,
	MEDIA_TYPE = 13,
	PARTITION = 14,
	PHYSICAL_MEDIA = 15,
	STORAGESLOT = 16,
	OPREQUEST = 17,
	UI_DESTINATION = 18,
	NUMBER_OF_OBJECT_TYPES = 19,
}

NtmsOperationalState :: enum i32 {
	READY = 0,
	INITIALIZING = 10,
	NEEDS_SERVICE = 20,
	NOT_PRESENT = 21,
}

NtmsOpreqCommand :: enum i32 {
	UNKNOWN = 0,
	NEWMEDIA = 1,
	CLEANER = 2,
	DEVICESERVICE = 3,
	MOVEMEDIA = 4,
	MESSAGE = 5,
}

NtmsOpreqState :: enum i32 {
	UNKNOWN = 0,
	SUBMITTED = 1,
	ACTIVE = 2,
	INPROGRESS = 3,
	REFUSED = 4,
	COMPLETE = 5,
}

NtmsOpRequestFlags :: enum i32 {
	NOAUTOPURGE = 1,
	NOFAILEDPURGE = 2,
	NOALERTS = 16,
	NOTRAYICON = 32,
}

NtmsPartitionState :: enum i32 {
	UNKNOWN = 0,
	UNPREPARED = 1,
	INCOMPATIBLE = 2,
	DECOMMISSIONED = 3,
	AVAILABLE = 4,
	ALLOCATED = 5,
	COMPLETE = 6,
	FOREIGN = 7,
	IMPORT = 8,
	RESERVED = 9,
}

NtmsPoolType :: enum i32 {
	UNKNOWN = 0,
	SCRATCH = 1,
	FOREIGN = 2,
	IMPORT = 3,
	APPLICATION = 1000,
}

NtmsPortContent :: enum i32 {
	UNKNOWN = 0,
	FULL = 1,
	EMPTY = 2,
}

NtmsPortPosition :: enum i32 {
	UNKNOWN = 0,
	EXTENDED = 1,
	RETRACTED = 2,
}

NtmsReadWriteCharacteristics :: enum i32 {
	UNKNOWN = 0,
	REWRITABLE = 1,
	WRITEONCE = 2,
	READONLY = 3,
}

NtmsSessionOptions :: enum i32 {
	TMS_SESSION_QUERYEXPEDITE = 1,
}

NtmsSlotState :: enum i32 {
	UNKNOWN = 0,
	FULL = 1,
	EMPTY = 2,
	NOTPRESENT = 3,
	NEEDSINVENTORY = 4,
}

NtmsUIOperations :: enum i32 {
	DEST_ADD = 1,
	DEST_DELETE = 2,
	DEST_DELETEALL = 3,
	OPERATION_MAX = 4,
}

NtmsUITypes :: enum i32 {
	INVALID = 0,
	INFO = 1,
	REQ = 2,
	ERR = 3,
	MAX = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-ofstruct ]]
OFSTRUCT :: struct {
	cBytes: u8,
	fFixedDisk: u8,
	nErrCode: u16,
	Reserved1: u16,
	Reserved2: u16,
	szPathName: [128]CHAR,
}

PCLFS_COMPLETION_ROUTINE :: #type proc "system" (pvOverlapped: rawptr, ulReserved: u32)

PCOPYFILE2_PROGRESS_ROUTINE :: #type proc "system" (
	#by_ptr pMessage: COPYFILE2_MESSAGE,
	pvCallbackContext: rawptr,
) -> COPYFILE2_MESSAGE_ACTION

PFE_EXPORT_FUNC :: #type proc "system" (pbData: ^u8, pvCallbackContext: rawptr, ulLength: u32) -> u32

PFE_IMPORT_FUNC :: #type proc "system" (pbData: ^u8, pvCallbackContext: rawptr, ulLength: ^u32) -> u32

PFN_IO_COMPLETION :: #type proc "system" (pContext: ^FIO_CONTEXT, lpo: ^FH_OVERLAPPED, cb: u32, dwCompletionStatus: u32)

PLOG_FULL_HANDLER_CALLBACK :: #type proc "system" (hLogFile: HANDLE, dwError: u32, fLogIsPinned: BOOL, pvClientContext: rawptr)

PLOG_TAIL_ADVANCE_CALLBACK :: #type proc "system" (hLogFile: HANDLE, lsnTarget: CLS_LSN, pvClientContext: rawptr)

PLOG_UNPINNED_CALLBACK :: #type proc "system" (hLogFile: HANDLE, pvClientContext: rawptr)

PREPARE_TAPE_OPERATION :: enum u32 {
	FORMAT = 0x00000005,
	LOAD = 0x00000000,
	LOCK = 0x00000003,
	TENSION = 0x00000002,
	UNLOAD = 0x00000001,
	UNLOCK = 0x00000004,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ne-winbase-priority_hint ]]
PRIORITY_HINT :: enum i32 {
	IoPriorityHintVeryLow = 0,
	IoPriorityHintLow = 1,
	IoPriorityHintNormal = 2,
	MaximumIoPriorityHintType = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ne-minwinbase-read_directory_notify_information_class ]]
READ_DIRECTORY_NOTIFY_INFORMATION_CLASS :: enum i32 {
	Information = 1,
	ExtendedInformation = 2,
	FullInformation = 3,
	MaximumInformation = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-reparse_guid_data_buffer ]]
REPARSE_GUID_DATA_BUFFER :: struct {
	ReparseTag: u32,
	ReparseDataLength: u16,
	Reserved: u16,
	ReparseGuid: GUID,
	GenericReparseBuffer: struct {
		DataBuffer: [1]u8,
	},
}

REPLACE_FILE_FLAGS :: distinct bit_set[enum {
	WRITE_THROUGH = 0,
	IGNORE_MERGE_ERRORS = 1,
	IGNORE_ACL_ERRORS = 2,
}; u32]

SERVER_ALIAS_INFO_0 :: struct {
	srvai0_alias: PWSTR,
	srvai0_target: PWSTR,
	srvai0_default: BOOLEAN,
	srvai0_reserved: u32,
}

SERVER_CERTIFICATE_INFO_0 :: struct {
	srvci0_name: PWSTR,
	srvci0_subject: PWSTR,
	srvci0_issuer: PWSTR,
	srvci0_thumbprint: PWSTR,
	srvci0_friendlyname: PWSTR,
	srvci0_notbefore: PWSTR,
	srvci0_notafter: PWSTR,
	srvci0_storelocation: PWSTR,
	srvci0_storename: PWSTR,
	srvci0_renewalchain: PWSTR,
	srvci0_type: u32,
	srvci0_flags: u32,
	srvci0_mapping_status: u32,
}

SERVER_CERTIFICATE_TYPE :: enum i32 {
	QUIC = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_0 ]]
SESSION_INFO_0 :: struct {
	sesi0_cname: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_1 ]]
SESSION_INFO_1 :: struct {
	sesi1_cname: PWSTR,
	sesi1_username: PWSTR,
	sesi1_num_opens: u32,
	sesi1_time: u32,
	sesi1_idle_time: u32,
	sesi1_user_flags: SESSION_INFO_USER_FLAGS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_10 ]]
SESSION_INFO_10 :: struct {
	sesi10_cname: PWSTR,
	sesi10_username: PWSTR,
	sesi10_time: u32,
	sesi10_idle_time: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_2 ]]
SESSION_INFO_2 :: struct {
	sesi2_cname: PWSTR,
	sesi2_username: PWSTR,
	sesi2_num_opens: u32,
	sesi2_time: u32,
	sesi2_idle_time: u32,
	sesi2_user_flags: SESSION_INFO_USER_FLAGS,
	sesi2_cltype_name: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-session_info_502 ]]
SESSION_INFO_502 :: struct {
	sesi502_cname: PWSTR,
	sesi502_username: PWSTR,
	sesi502_num_opens: u32,
	sesi502_time: u32,
	sesi502_idle_time: u32,
	sesi502_user_flags: SESSION_INFO_USER_FLAGS,
	sesi502_cltype_name: PWSTR,
	sesi502_transport: PWSTR,
}

SESSION_INFO_USER_FLAGS :: enum u32 {
	GUEST = 0x00000001,
	NOENCRYPTION = 0x00000002,
}

SET_FILE_POINTER_MOVE_METHOD :: enum u32 {
	BEGIN = 0x00000000,
	CURRENT = 0x00000001,
	END = 0x00000002,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_0 ]]
SHARE_INFO_0 :: struct {
	shi0_netname: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1 ]]
SHARE_INFO_1 :: struct {
	shi1_netname: PWSTR,
	shi1_type: SHARE_TYPE,
	shi1_remark: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1004 ]]
SHARE_INFO_1004 :: struct {
	shi1004_remark: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1005 ]]
SHARE_INFO_1005 :: struct {
	shi1005_flags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1006 ]]
SHARE_INFO_1006 :: struct {
	shi1006_max_uses: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_1501 ]]
SHARE_INFO_1501 :: struct {
	shi1501_reserved: u32,
	shi1501_security_descriptor: PSECURITY_DESCRIPTOR,
}

SHARE_INFO_1503 :: struct {
	shi1503_sharefilter: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_2 ]]
SHARE_INFO_2 :: struct {
	shi2_netname: PWSTR,
	shi2_type: SHARE_TYPE,
	shi2_remark: PWSTR,
	shi2_permissions: SHARE_INFO_PERMISSIONS,
	shi2_max_uses: u32,
	shi2_current_uses: u32,
	shi2_path: PWSTR,
	shi2_passwd: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_501 ]]
SHARE_INFO_501 :: struct {
	shi501_netname: PWSTR,
	shi501_type: SHARE_TYPE,
	shi501_remark: PWSTR,
	shi501_flags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_502 ]]
SHARE_INFO_502 :: struct {
	shi502_netname: PWSTR,
	shi502_type: SHARE_TYPE,
	shi502_remark: PWSTR,
	shi502_permissions: SHARE_INFO_PERMISSIONS,
	shi502_max_uses: u32,
	shi502_current_uses: u32,
	shi502_path: PWSTR,
	shi502_passwd: PWSTR,
	shi502_reserved: u32,
	shi502_security_descriptor: PSECURITY_DESCRIPTOR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmshare/ns-lmshare-share_info_503 ]]
SHARE_INFO_503 :: struct {
	shi503_netname: PWSTR,
	shi503_type: SHARE_TYPE,
	shi503_remark: PWSTR,
	shi503_permissions: SHARE_INFO_PERMISSIONS,
	shi503_max_uses: u32,
	shi503_current_uses: u32,
	shi503_path: PWSTR,
	shi503_passwd: PWSTR,
	shi503_servername: PWSTR,
	shi503_reserved: u32,
	shi503_security_descriptor: PSECURITY_DESCRIPTOR,
}

SHARE_INFO_PERMISSIONS :: enum u32 {
	READ = 0x00000001,
	WRITE = 0x00000002,
	CREATE = 0x00000004,
	EXEC = 0x00000008,
	DELETE = 0x00000010,
	ATRIB = 0x00000020,
	PERM = 0x00000040,
	ALL = 0x00008000,
}

SHARE_TYPE :: distinct bit_set[enum {
	PRINTQ = 0,
	DEVICE = 1,
	SPECIAL = 31,
	TEMPORARY = 30,
}; u32]
SHARE_TYPE_DISKTREE :: transmute(SHARE_TYPE)u32(0x00000000)
SHARE_TYPE_IPC :: transmute(SHARE_TYPE)u32(0x00000003)
SHARE_TYPE_MASK :: transmute(SHARE_TYPE)u32(0x000000FF)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmstats/ns-lmstats-stat_server_0 ]]
STAT_SERVER_0 :: struct {
	sts0_start: u32,
	sts0_fopens: u32,
	sts0_devopens: u32,
	sts0_jobsqueued: u32,
	sts0_sopens: u32,
	sts0_stimedout: u32,
	sts0_serrorout: u32,
	sts0_pwerrors: u32,
	sts0_permerrors: u32,
	sts0_syserrors: u32,
	sts0_bytessent_low: u32,
	sts0_bytessent_high: u32,
	sts0_bytesrcvd_low: u32,
	sts0_bytesrcvd_high: u32,
	sts0_avresponse: u32,
	sts0_reqbufneed: u32,
	sts0_bigbufneed: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/lmstats/ns-lmstats-stat_workstation_0~r1 ]]
STAT_WORKSTATION_0 :: struct {
	StatisticsStartTime: i64,
	BytesReceived: i64,
	SmbsReceived: i64,
	PagingReadBytesRequested: i64,
	NonPagingReadBytesRequested: i64,
	CacheReadBytesRequested: i64,
	NetworkReadBytesRequested: i64,
	BytesTransmitted: i64,
	SmbsTransmitted: i64,
	PagingWriteBytesRequested: i64,
	NonPagingWriteBytesRequested: i64,
	CacheWriteBytesRequested: i64,
	NetworkWriteBytesRequested: i64,
	InitiallyFailedOperations: u32,
	FailedCompletionOperations: u32,
	ReadOperations: u32,
	RandomReadOperations: u32,
	ReadSmbs: u32,
	LargeReadSmbs: u32,
	SmallReadSmbs: u32,
	WriteOperations: u32,
	RandomWriteOperations: u32,
	WriteSmbs: u32,
	LargeWriteSmbs: u32,
	SmallWriteSmbs: u32,
	RawReadsDenied: u32,
	RawWritesDenied: u32,
	NetworkErrors: u32,
	Sessions: u32,
	FailedSessions: u32,
	Reconnects: u32,
	CoreConnects: u32,
	Lanman20Connects: u32,
	Lanman21Connects: u32,
	LanmanNtConnects: u32,
	ServerDisconnects: u32,
	HungSessions: u32,
	UseCount: u32,
	FailedUseCount: u32,
	CurrentCommands: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_bus_type ]]
STORAGE_BUS_TYPE :: enum i32 {
	Unknown = 0,
	Scsi = 1,
	Atapi = 2,
	Ata = 3,
	_1394 = 4,
	Ssa = 5,
	Fibre = 6,
	Usb = 7,
	RAID = 8,
	iScsi = 9,
	Sas = 10,
	Sata = 11,
	Sd = 12,
	Mmc = 13,
	Virtual = 14,
	FileBackedVirtual = 15,
	Spaces = 16,
	Nvme = 17,
	SCM = 18,
	Ufs = 19,
	Max = 20,
	MaxReserved = 127,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/ne-fileapi-stream_info_levels ]]
STREAM_INFO_LEVELS :: enum i32 {
	Standard = 0,
	MaxInfoLevel = 1,
}

SYMBOLIC_LINK_FLAGS :: distinct bit_set[enum {
	DIRECTORY = 0,
	ALLOW_UNPRIVILEGED_CREATE = 1,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_erase ]]
TAPE_ERASE :: struct {
	Type: ERASE_TAPE_TYPE,
	Immediate: BOOLEAN,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_get_position ]]
TAPE_GET_POSITION :: struct {
	Type: TAPE_POSITION_TYPE,
	Partition: u32,
	Offset: i64,
}

TAPE_INFORMATION_TYPE :: enum u32 {
	DRIVE_INFORMATION = 0x00000001,
	MEDIA_INFORMATION = 0x00000000,
}

TAPE_POSITION_METHOD :: enum u32 {
	ABSOLUTE_BLOCK = 0x00000001,
	LOGICAL_BLOCK = 0x00000002,
	REWIND = 0x00000000,
	SPACE_END_OF_DATA = 0x00000004,
	SPACE_FILEMARKS = 0x00000006,
	SPACE_RELATIVE_BLOCKS = 0x00000005,
	SPACE_SEQUENTIAL_FMKS = 0x00000007,
	SPACE_SEQUENTIAL_SMKS = 0x00000009,
	SPACE_SETMARKS = 0x00000008,
}

TAPE_POSITION_TYPE :: enum u32 {
	ABSOLUTE_POSITION = 0x00000000,
	LOGICAL_POSITION = 0x00000001,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_prepare ]]
TAPE_PREPARE :: struct {
	Operation: PREPARE_TAPE_OPERATION,
	Immediate: BOOLEAN,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_set_position ]]
TAPE_SET_POSITION :: struct {
	Method: TAPE_POSITION_METHOD,
	Partition: u32,
	Offset: i64,
	Immediate: BOOLEAN,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_write_marks ]]
TAPE_WRITE_MARKS :: struct {
	Type: TAPEMARK_TYPE,
	Count: u32,
	Immediate: BOOLEAN,
}

TAPEMARK_TYPE :: enum u32 {
	FILEMARKS = 0x00000001,
	LONG_FILEMARKS = 0x00000003,
	SETMARKS = 0x00000000,
	SHORT_FILEMARKS = 0x00000002,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification ]]
TRANSACTION_NOTIFICATION :: struct {
	TransactionKey: rawptr,
	TransactionNotification: u32,
	TmVirtualClock: i64,
	ArgumentLength: u32,
}

TRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT :: struct {
	MarshalCookie: u32,
	UOW: GUID,
}

TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT :: struct {
	PropagationCookie: u32,
	UOW: GUID,
	TmIdentity: GUID,
	BufferLength: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification_recovery_argument ]]
TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT :: struct {
	EnlistmentId: GUID,
	UOW: GUID,
}

TRANSACTION_NOTIFICATION_SAVEPOINT_ARGUMENT :: struct {
	SavepointId: u32,
}

TRANSACTION_NOTIFICATION_TM_ONLINE_ARGUMENT :: struct {
	TmIdentity: GUID,
	Flags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-transaction_outcome ]]
TRANSACTION_OUTCOME :: enum i32 {
	Undetermined = 1,
	Committed = 2,
	Aborted = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_id ]]
TXF_ID :: struct #max_field_align(4) {
	using _: struct #max_field_align(4) {
		LowPart: i64,
		HighPart: i64,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_log_record_affected_file ]]
TXF_LOG_RECORD_AFFECTED_FILE :: struct #max_field_align(4) {
	Version: u16,
	RecordLength: u32,
	Flags: u32,
	TxfFileId: TXF_ID,
	KtmGuid: GUID,
	FileNameLength: u32,
	FileNameByteOffsetInStructure: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_log_record_base ]]
TXF_LOG_RECORD_BASE :: struct #max_field_align(4) {
	Version: u16,
	RecordType: TXF_LOG_RECORD_TYPE,
	RecordLength: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_log_record_truncate ]]
TXF_LOG_RECORD_TRUNCATE :: struct #max_field_align(4) {
	Version: u16,
	RecordType: u16,
	RecordLength: u32,
	Flags: u32,
	TxfFileId: TXF_ID,
	KtmGuid: GUID,
	NewFileSize: i64,
	FileNameLength: u32,
	FileNameByteOffsetInStructure: u32,
}

TXF_LOG_RECORD_TYPE :: enum u16 {
	AFFECTED_FILE = 0x0004,
	TRUNCATE = 0x0002,
	WRITE = 0x0001,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/txfw32/ns-txfw32-txf_log_record_write ]]
TXF_LOG_RECORD_WRITE :: struct #max_field_align(4) {
	Version: u16,
	RecordType: u16,
	RecordLength: u32,
	Flags: u32,
	TxfFileId: TXF_ID,
	KtmGuid: GUID,
	ByteOffsetInFile: i64,
	NumBytesWritten: u32,
	ByteOffsetInStructure: u32,
	FileNameLength: u32,
	FileNameByteOffsetInStructure: u32,
}

TXFS_MINIVERSION :: enum u32 {
	COMMITTED_VIEW = 0x00000000,
	DIRTY_VIEW = 0x0000FFFF,
	DEFAULT_VIEW = 0x0000FFFE,
}

VER_FIND_FILE_FLAGS :: enum u32 {
	FFF_ISSHAREDFILE = 0x00000001,
}

VER_FIND_FILE_STATUS :: distinct bit_set[enum {
	CURNEDEST = 0,
	FILEINUSE = 1,
	BUFFTOOSMALL = 2,
}; u32]

VER_INSTALL_FILE_FLAGS :: enum u32 {
	FORCEINSTALL = 0x00000001,
	DONTDELETEOLD = 0x00000002,
}

VER_INSTALL_FILE_STATUS :: distinct bit_set[enum {
	TEMPFILE = 0,
	MISMATCH = 1,
	SRCOLD = 2,
	DIFFLANG = 3,
	DIFFCODEPG = 4,
	DIFFTYPE = 5,
	WRITEPROT = 6,
	FILEINUSE = 7,
	OUTOFSPACE = 8,
	ACCESSVIOLATION = 9,
	SHARINGVIOLATION = 10,
	CANNOTCREATE = 11,
	CANNOTDELETE = 12,
	CANNOTRENAME = 13,
	CANNOTDELETECUR = 14,
	OUTOFMEMORY = 15,
	CANNOTREADSRC = 16,
	CANNOTREADDST = 17,
	BUFFTOOSMALL = 18,
	CANNOTLOADLZ32 = 19,
	CANNOTLOADCABINET = 20,
}; u32]

VOLUME_ALLOCATE_BC_STREAM_INPUT :: struct {
	Version: u32,
	RequestsPerPeriod: u32,
	Period: u32,
	RetryFailures: BOOLEAN,
	Discardable: BOOLEAN,
	Reserved1: [2]BOOLEAN,
	LowestByteOffset: u64,
	HighestByteOffset: u64,
	AccessType: u32,
	AccessMode: u32,
}

VOLUME_ALLOCATE_BC_STREAM_OUTPUT :: struct {
	RequestSize: u64,
	NumOutStandingRequests: u32,
}

VOLUME_ALLOCATION_HINT_INPUT :: struct {
	ClusterSize: u32,
	NumberOfClusters: u32,
	StartingClusterNumber: i64,
}

VOLUME_ALLOCATION_HINT_OUTPUT :: struct {
	Bitmap: [1]u32,
}

VOLUME_CRITICAL_IO :: struct {
	AccessType: u32,
	ExtentsCount: u32,
	Extents: [1]FILE_EXTENT,
}

VOLUME_FAILOVER_SET :: struct {
	NumberOfDisks: u32,
	DiskNumbers: [1]u32,
}

VOLUME_GET_BC_PROPERTIES_INPUT :: struct {
	Version: u32,
	Reserved1: u32,
	LowestByteOffset: u64,
	HighestByteOffset: u64,
	AccessType: u32,
	AccessMode: u32,
}

VOLUME_GET_BC_PROPERTIES_OUTPUT :: struct {
	MaximumRequestsPerPeriod: u32,
	MinimumPeriod: u32,
	MaximumRequestSize: u64,
	EstimatedTimePerRequest: u32,
	NumOutStandingRequests: u32,
	RequestSize: u64,
}

VOLUME_LOGICAL_OFFSET :: struct {
	LogicalOffset: i64,
}

VOLUME_NUMBER :: struct {
	VolumeNumber: u32,
	VolumeManagerName: [8]u16,
}

VOLUME_PHYSICAL_OFFSET :: struct {
	DiskNumber: u32,
	Offset: i64,
}

VOLUME_PHYSICAL_OFFSETS :: struct {
	NumberOfPhysicalOffsets: u32,
	PhysicalOffset: [1]VOLUME_PHYSICAL_OFFSET,
}

VOLUME_READ_PLEX_INPUT :: struct {
	ByteOffset: i64,
	Length: u32,
	PlexNumber: u32,
}

VOLUME_SET_GPT_ATTRIBUTES_INFORMATION :: struct {
	GptAttributes: u64,
	RevertOnClose: BOOLEAN,
	ApplyToAllConnectedVolumes: BOOLEAN,
	Reserved1: u16,
	Reserved2: u32,
}

VOLUME_SHRINK_INFO :: struct {
	VolumeSize: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/verrsrc/ns-verrsrc-vs_fixedfileinfo ]]
VS_FIXEDFILEINFO :: struct {
	dwSignature: u32,
	dwStrucVersion: u32,
	dwFileVersionMS: u32,
	dwFileVersionLS: u32,
	dwProductVersionMS: u32,
	dwProductVersionLS: u32,
	dwFileFlagsMask: u32,
	dwFileFlags: VS_FIXEDFILEINFO_FILE_FLAGS,
	dwFileOS: VS_FIXEDFILEINFO_FILE_OS,
	dwFileType: VS_FIXEDFILEINFO_FILE_TYPE,
	dwFileSubtype: VS_FIXEDFILEINFO_FILE_SUBTYPE,
	dwFileDateMS: u32,
	dwFileDateLS: u32,
}

VS_FIXEDFILEINFO_FILE_FLAGS :: distinct bit_set[enum {
	DEBUG = 0,
	PRERELEASE = 1,
	PATCHED = 2,
	PRIVATEBUILD = 3,
	INFOINFERRED = 4,
	SPECIALBUILD = 5,
}; u32]

VS_FIXEDFILEINFO_FILE_OS :: enum u32 {
	UNKNOWN = 0x00000000,
	DOS = 0x00010000,
	OS216 = 0x00020000,
	OS232 = 0x00030000,
	NT = 0x00040000,
	WINCE = 0x00050000,
	BASE = 0x00000000,
	WINDOWS16 = 0x00000001,
	PM16 = 0x00000002,
	PM32 = 0x00000003,
	WINDOWS32 = 0x00000004,
	DOS_WINDOWS16 = 0x00010001,
	DOS_WINDOWS32 = 0x00010004,
	OS216_PM16 = 0x00020002,
	OS232_PM32 = 0x00030003,
	NT_WINDOWS32 = 0x00040004,
}

VS_FIXEDFILEINFO_FILE_SUBTYPE :: enum i32 {
	UNKNOWN = 0,
	DRV_PRINTER = 1,
	DRV_KEYBOARD = 2,
	DRV_LANGUAGE = 3,
	DRV_DISPLAY = 4,
	DRV_MOUSE = 5,
	DRV_NETWORK = 6,
	DRV_SYSTEM = 7,
	DRV_INSTALLABLE = 8,
	DRV_SOUND = 9,
	DRV_COMM = 10,
	DRV_INPUTMETHOD = 11,
	DRV_VERSIONED_PRINTER = 12,
	FONT_RASTER = 1,
	FONT_VECTOR = 2,
	FONT_TRUETYPE = 3,
}

VS_FIXEDFILEINFO_FILE_TYPE :: enum i32 {
	UNKNOWN = 0,
	APP = 1,
	DLL = 2,
	DRV = 3,
	FONT = 4,
	VXD = 5,
	STATIC_LIB = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/ns-wofapi-wim_entry_info ]]
WIM_ENTRY_INFO :: struct {
	WimEntryInfoSize: u32,
	WimType: u32,
	DataSourceId: i64,
	WimGuid: GUID,
	WimPath: PWSTR,
	WimIndex: u32,
	Flags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/ns-wofapi-wim_external_file_info ]]
WIM_EXTERNAL_FILE_INFO :: struct {
	DataSourceId: i64,
	ResourceHash: [20]u8,
	Flags: u32,
}

WIN_STREAM_ID :: enum u32 {
	ALTERNATE_DATA = 0x00000004,
	DATA = 0x00000001,
	EA_DATA = 0x00000002,
	LINK = 0x00000005,
	OBJECT_ID = 0x00000007,
	PROPERTY_DATA = 0x00000006,
	REPARSE_DATA = 0x00000008,
	SECURITY_DATA = 0x00000003,
	SPARSE_BLOCK = 0x00000009,
	TXFS_DATA = 0x0000000A,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-win32_file_attribute_data ]]
WIN32_FILE_ATTRIBUTE_DATA :: struct {
	dwFileAttributes: u32,
	ftCreationTime: FILETIME,
	ftLastAccessTime: FILETIME,
	ftLastWriteTime: FILETIME,
	nFileSizeHigh: u32,
	nFileSizeLow: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-win32_find_dataa ]]
WIN32_FIND_DATAA :: struct {
	dwFileAttributes: u32,
	ftCreationTime: FILETIME,
	ftLastAccessTime: FILETIME,
	ftLastWriteTime: FILETIME,
	nFileSizeHigh: u32,
	nFileSizeLow: u32,
	dwReserved0: u32,
	dwReserved1: u32,
	cFileName: [260]CHAR,
	cAlternateFileName: [14]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-win32_find_dataw ]]
WIN32_FIND_DATAW :: struct {
	dwFileAttributes: u32,
	ftCreationTime: FILETIME,
	ftLastAccessTime: FILETIME,
	ftLastWriteTime: FILETIME,
	nFileSizeHigh: u32,
	nFileSizeLow: u32,
	dwReserved0: u32,
	dwReserved1: u32,
	cFileName: [260]u16,
	cAlternateFileName: [14]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-win32_find_stream_data ]]
WIN32_FIND_STREAM_DATA :: struct {
	StreamSize: i64,
	cStreamName: [296]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-win32_stream_id ]]
WIN32_STREAM_ID :: struct {
	dwStreamId: WIN_STREAM_ID,
	dwStreamAttributes: u32,
	Size: i64,
	dwStreamNameSize: u32,
	cStreamName: [1]u16,
}

WOF_FILE_COMPRESSION_INFO_V0 :: struct {
	Algorithm: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wofapi/ns-wofapi-wof_file_compression_info_v1 ]]
WOF_FILE_COMPRESSION_INFO_V1 :: struct {
	Algorithm: u32,
	Flags: u32,
}

WofEnumEntryProc :: #type proc "system" (EntryInfo: rawptr, UserData: rawptr) -> BOOL

WofEnumFilesProc :: #type proc "system" (FilePath: PWSTR, ExternalFileInfo: rawptr, UserData: rawptr) -> BOOL

FT_TYPES_DEFINITION_ :: 1
CLFS_BASELOG_EXTENSION :: ".blf"
CLFS_CONTAINER_RELATIVE_PREFIX :: "%BLF%\\"
CLFS_CONTAINER_STREAM_PREFIX :: "%BLF%:"
CLFS_FLAG_FILTER_INTERMEDIATE_LEVEL :: 16
CLFS_FLAG_FILTER_TOP_LEVEL :: 32
CLFS_FLAG_HIDDEN_SYSTEM_LOG :: 512
CLFS_FLAG_IGNORE_SHARE_ACCESS :: 64
CLFS_FLAG_MINIFILTER_LEVEL :: 256
CLFS_FLAG_NON_REENTRANT_FILTER :: 16
CLFS_FLAG_READ_IN_PROGRESS :: 128
CLFS_FLAG_REENTRANT_FILE_SYSTEM :: 8
CLFS_FLAG_REENTRANT_FILTER :: 32
CLFS_MARSHALLING_FLAG_DISABLE_BUFF_INIT :: 1
CLFS_MARSHALLING_FLAG_NONE :: 0
CLFS_MAX_CONTAINER_INFO :: 256
CLFS_MGMT_CLIENT_REGISTRATION_VERSION :: 1
CLFS_MGMT_POLICY_VERSION :: 1
CLFS_SCAN_BACKWARD :: 4
CLFS_SCAN_BUFFERED :: 32
CLFS_SCAN_CLOSE :: 8
CLFS_SCAN_FORWARD :: 2
CLFS_SCAN_INIT :: 1
CLFS_SCAN_INITIALIZED :: 16
ClfsClientRecord :: 3
ClfsContainerActive :: 4
ClfsContainerActivePendingDelete :: 8
ClfsContainerInactive :: 2
ClfsContainerInitializing :: 1
ClfsContainerPendingArchive :: 16
ClfsContainerPendingArchiveAndDelete :: 32
ClfsDataRecord :: 1
ClfsNullRecord :: 0
ClfsRestartRecord :: 2
ClsContainerActive :: 4
ClsContainerActivePendingDelete :: 8
ClsContainerInactive :: 2
ClsContainerInitializing :: 1
ClsContainerPendingArchive :: 16
ClsContainerPendingArchiveAndDelete :: 32
CLSID_DiskQuotaControl :: GUID{0x7988B571, 0xEC89, 0x11CF, {0x9C, 0x00, 0x00, 0xAA, 0x00, 0xA1, 0x4F, 0x56}}
CRM_PROTOCOL_DYNAMIC_MARSHAL_INFO :: 2
CRM_PROTOCOL_EXPLICIT_MARSHAL_ONLY :: 1
CRM_PROTOCOL_MAXIMUM_OPTION :: 3
CSC_CACHE_AUTO_REINT :: 16
CSC_CACHE_MANUAL_REINT :: 0
CSC_CACHE_NONE :: 48
CSC_CACHE_VDO :: 32
CSC_MASK :: 48
CSC_MASK_EXT :: 8240
CSV_BLOCK_AND_FILE_CACHE_CALLBACK_VERSION :: 2
CSV_BLOCK_CACHE_CALLBACK_VERSION :: 1
DISKQUOTA_FILESTATE_INCOMPLETE :: 256
DISKQUOTA_FILESTATE_MASK :: 768
DISKQUOTA_FILESTATE_REBUILDING :: 512
DISKQUOTA_LOGFLAG_USER_LIMIT :: 2
DISKQUOTA_LOGFLAG_USER_THRESHOLD :: 1
DISKQUOTA_STATE_DISABLED :: 0
DISKQUOTA_STATE_ENFORCE :: 2
DISKQUOTA_STATE_MASK :: 3
DISKQUOTA_STATE_TRACK :: 1
DISKQUOTA_USER_ACCOUNT_DELETED :: 2
DISKQUOTA_USER_ACCOUNT_INVALID :: 3
DISKQUOTA_USER_ACCOUNT_RESOLVED :: 0
DISKQUOTA_USER_ACCOUNT_UNAVAILABLE :: 1
DISKQUOTA_USER_ACCOUNT_UNKNOWN :: 4
DISKQUOTA_USER_ACCOUNT_UNRESOLVED :: 5
EA_CONTAINER_NAME :: "ContainerName"
EA_CONTAINER_SIZE :: "ContainerSize"
EFS_COMPATIBILITY_VERSION_NCRYPT_PROTECTOR :: 5
EFS_COMPATIBILITY_VERSION_PFILE_PROTECTOR :: 6
EFS_EFS_SUBVER_EFS_CERT :: 1
EFS_METADATA_ADD_USER :: 1
EFS_METADATA_GENERAL_OP :: 8
EFS_METADATA_REMOVE_USER :: 2
EFS_METADATA_REPLACE_USER :: 4
EFS_PFILE_SUBVER_APPX :: 3
EFS_PFILE_SUBVER_RMS :: 2
EFS_SUBVER_UNKNOWN :: 0
ENLISTMENT_MAXIMUM_OPTION :: 1
ENLISTMENT_OBJECT_PATH :: "\\Enlistment\\"
ENLISTMENT_SUPERIOR :: 1
FILE_PROVIDER_COMPRESSION_LZX :: 1
FILE_PROVIDER_COMPRESSION_XPRESS16K :: 3
FILE_PROVIDER_COMPRESSION_XPRESS4K :: 0
FILE_PROVIDER_COMPRESSION_XPRESS8K :: 2
INVALID_FILE_ATTRIBUTES :: 4294967295
INVALID_FILE_SIZE :: 4294967295
INVALID_SET_FILE_POINTER :: 4294967295
IOCTL_VOLUME_ALLOCATE_BC_STREAM :: 5685312
IOCTL_VOLUME_BASE :: 86
IOCTL_VOLUME_BC_VERSION :: 1
IOCTL_VOLUME_FREE_BC_STREAM :: 5685316
IOCTL_VOLUME_GET_BC_PROPERTIES :: 5652540
IOCTL_VOLUME_GET_CSVBLOCKCACHE_CALLBACK :: 5685352
// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winioctl/ni-winioctl-ioctl_volume_get_gpt_attributes ]]
IOCTL_VOLUME_GET_GPT_ATTRIBUTES :: 5636152
// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winioctl/ni-winioctl-ioctl_volume_get_volume_disk_extents ]]
IOCTL_VOLUME_GET_VOLUME_DISK_EXTENTS :: 5636096
// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winioctl/ni-winioctl-ioctl_volume_is_clustered ]]
IOCTL_VOLUME_IS_CLUSTERED :: 5636144
// [[ Documentation; https://learn.microsoft.com/windows/win32/FileIO/ioctl-volume-is-csv ]]
IOCTL_VOLUME_IS_CSV :: 5636192
IOCTL_VOLUME_IS_DYNAMIC :: 5636168
IOCTL_VOLUME_IS_IO_CAPABLE :: 5636116
IOCTL_VOLUME_IS_OFFLINE :: 5636112
IOCTL_VOLUME_IS_PARTITION :: 5636136
IOCTL_VOLUME_LOGICAL_TO_PHYSICAL :: 5636128
// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winioctl/ni-winioctl-ioctl_volume_offline ]]
IOCTL_VOLUME_OFFLINE :: 5685260
// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winioctl/ni-winioctl-ioctl_volume_online ]]
IOCTL_VOLUME_ONLINE :: 5685256
IOCTL_VOLUME_PHYSICAL_TO_LOGICAL :: 5636132
IOCTL_VOLUME_POST_ONLINE :: 5685348
IOCTL_VOLUME_PREPARE_FOR_CRITICAL_IO :: 5685324
IOCTL_VOLUME_PREPARE_FOR_SHRINK :: 5685340
IOCTL_VOLUME_QUERY_ALLOCATION_HINT :: 5652562
IOCTL_VOLUME_QUERY_FAILOVER_SET :: 5636120
IOCTL_VOLUME_QUERY_MINIMUM_SHRINK_SIZE :: 5652568
IOCTL_VOLUME_QUERY_VOLUME_NUMBER :: 5636124
IOCTL_VOLUME_READ_PLEX :: 5652526
IOCTL_VOLUME_SET_GPT_ATTRIBUTES :: 5636148
IOCTL_VOLUME_SUPPORTS_ONLINE_OFFLINE :: 5636100
IOCTL_VOLUME_UPDATE_PROPERTIES :: 5636180
KTM_MARSHAL_BLOB_VERSION_MAJOR :: 1
KTM_MARSHAL_BLOB_VERSION_MINOR :: 1
LOG_POLICY_OVERWRITE :: 1
LOG_POLICY_PERSIST :: 2
LZERROR_BADINHANDLE :: -1
LZERROR_BADOUTHANDLE :: -2
LZERROR_BADVALUE :: -7
LZERROR_GLOBALLOC :: -5
LZERROR_GLOBLOCK :: -6
LZERROR_READ :: -3
LZERROR_UNKNOWNALG :: -8
LZERROR_WRITE :: -4
MAX_RESOURCEMANAGER_DESCRIPTION_LENGTH :: 64
MAX_SID_SIZE :: 256
MAX_TRANSACTION_DESCRIPTION_LENGTH :: 64
MAXIMUM_REPARSE_DATA_BUFFER_SIZE :: 16384
NTMS_APPLICATIONNAME_LENGTH :: 64
NTMS_BARCODE_LENGTH :: 64
NTMS_COMPUTERNAME_LENGTH :: 64
NTMS_DESCRIPTION_LENGTH :: 127
NTMS_DEVICENAME_LENGTH :: 64
NTMS_I1_MESSAGE_LENGTH :: 127
NTMS_MAXATTR_LENGTH :: 65536
NTMS_MAXATTR_NAMELEN :: 32
NTMS_MESSAGE_LENGTH :: 256
NTMS_OBJECTNAME_LENGTH :: 64
NTMS_OMIDLABELID_LENGTH :: 255
NTMS_OMIDLABELINFO_LENGTH :: 256
NTMS_OMIDLABELTYPE_LENGTH :: 64
NTMS_POOLHIERARCHY_LENGTH :: 512
NTMS_PRODUCTNAME_LENGTH :: 128
NTMS_REVISION_LENGTH :: 32
NTMS_SEQUENCE_LENGTH :: 32
NTMS_SERIALNUMBER_LENGTH :: 32
NTMS_USERNAME_LENGTH :: 64
NTMS_VENDORNAME_LENGTH :: 128
NTMSMLI_MAXAPPDESCR :: 256
NTMSMLI_MAXIDSIZE :: 256
NTMSMLI_MAXTYPE :: 64
PARTITION_BASIC_DATA_GUID :: GUID{0xEBD0A0A2, 0xB9E5, 0x4433, {0x87, 0xC0, 0x68, 0xB6, 0xB7, 0x26, 0x99, 0xC7}}
PARTITION_BSP_GUID :: GUID{0x57434F53, 0x4DF9, 0x45B9, {0x8E, 0x9E, 0x23, 0x70, 0xF0, 0x06, 0x45, 0x7C}}
PARTITION_CLUSTER_GUID :: GUID{0xDB97DBA9, 0x0840, 0x4BAE, {0x97, 0xF0, 0xFF, 0xB9, 0xA3, 0x27, 0xC7, 0xE1}}
PARTITION_DPP_GUID :: GUID{0x57434F53, 0x94CB, 0x43F0, {0xA5, 0x33, 0xD7, 0x3C, 0x10, 0xCF, 0xA5, 0x7D}}
PARTITION_ENTRY_UNUSED_GUID :: GUID{0x00000000, 0x0000, 0x0000, {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}}
PARTITION_LDM_DATA_GUID :: GUID{0xAF9B60A0, 0x1431, 0x4F62, {0xBC, 0x68, 0x33, 0x11, 0x71, 0x4A, 0x69, 0xAD}}
PARTITION_LDM_METADATA_GUID :: GUID{0x5808C8AA, 0x7E8F, 0x42E0, {0x85, 0xD2, 0xE1, 0xE9, 0x04, 0x34, 0xCF, 0xB3}}
PARTITION_LEGACY_BL_GUID :: GUID{0x424CA0E2, 0x7CB2, 0x4FB9, {0x81, 0x43, 0xC5, 0x2A, 0x99, 0x39, 0x8B, 0xC6}}
PARTITION_LEGACY_BL_GUID_BACKUP :: GUID{0x424C3E6C, 0xD79F, 0x49CB, {0x93, 0x5D, 0x36, 0xD7, 0x14, 0x67, 0xA2, 0x88}}
PARTITION_MAIN_OS_GUID :: GUID{0x57434F53, 0x8F45, 0x405E, {0x8A, 0x23, 0x18, 0x6D, 0x8A, 0x43, 0x30, 0xD3}}
PARTITION_MSFT_RECOVERY_GUID :: GUID{0xDE94BBA4, 0x06D1, 0x4D40, {0xA1, 0x6A, 0xBF, 0xD5, 0x01, 0x79, 0xD6, 0xAC}}
PARTITION_MSFT_RESERVED_GUID :: GUID{0xE3C9E316, 0x0B5C, 0x4DB8, {0x81, 0x7D, 0xF9, 0x2D, 0xF0, 0x02, 0x15, 0xAE}}
PARTITION_MSFT_SNAPSHOT_GUID :: GUID{0xCADDEBF1, 0x4400, 0x4DE8, {0xB1, 0x03, 0x12, 0x11, 0x7D, 0xCF, 0x3C, 0xCF}}
PARTITION_OS_DATA_GUID :: GUID{0x57434F53, 0x23F2, 0x44D5, {0xA8, 0x30, 0x67, 0xBB, 0xDA, 0xA6, 0x09, 0xF9}}
PARTITION_PATCH_GUID :: GUID{0x8967A686, 0x96AA, 0x6AA8, {0x95, 0x89, 0xA8, 0x42, 0x56, 0x54, 0x10, 0x90}}
PARTITION_PRE_INSTALLED_GUID :: GUID{0x57434F53, 0x7FE0, 0x4196, {0x9B, 0x42, 0x42, 0x7B, 0x51, 0x64, 0x34, 0x84}}
PARTITION_SBL_CACHE_HDD_GUID :: GUID{0x03AAA829, 0xEBFC, 0x4E7E, {0xAA, 0xC9, 0xC4, 0xD7, 0x6C, 0x63, 0xB2, 0x4B}}
PARTITION_SBL_CACHE_SSD_GUID :: GUID{0xEEFF8352, 0xDD2A, 0x44DB, {0xAE, 0x83, 0xBE, 0xE1, 0xCF, 0x74, 0x81, 0xDC}}
PARTITION_SBL_CACHE_SSD_RESERVED_GUID :: GUID{0xDCC0C7C1, 0x55AD, 0x4F17, {0x9D, 0x43, 0x4B, 0xC7, 0x76, 0xE0, 0x11, 0x7E}}
PARTITION_SERVICING_FILES_GUID :: GUID{0x57434F53, 0x432E, 0x4014, {0xAE, 0x4C, 0x8D, 0xEA, 0xA9, 0xC0, 0x00, 0x6A}}
PARTITION_SERVICING_METADATA_GUID :: GUID{0x57434F53, 0xC691, 0x4A05, {0xBB, 0x4E, 0x70, 0x3D, 0xAF, 0xD2, 0x29, 0xCE}}
PARTITION_SERVICING_RESERVE_GUID :: GUID{0x57434F53, 0x4B81, 0x460B, {0xA3, 0x19, 0xFF, 0xB6, 0xFE, 0x13, 0x6D, 0x14}}
PARTITION_SERVICING_STAGING_ROOT_GUID :: GUID{0x57434F53, 0xE84D, 0x4E84, {0xAA, 0xF3, 0xEC, 0xBB, 0xBD, 0x04, 0xB9, 0xDF}}
PARTITION_SPACES_DATA_GUID :: GUID{0xE7ADDCB4, 0xDC34, 0x4539, {0x9A, 0x76, 0xEB, 0xBD, 0x07, 0xBE, 0x6F, 0x7E}}
PARTITION_SPACES_GUID :: GUID{0xE75CAF8F, 0xF680, 0x4CEE, {0xAF, 0xA3, 0xB0, 0x01, 0xE5, 0x6E, 0xFC, 0x2D}}
PARTITION_SYSTEM_GUID :: GUID{0xC12A7328, 0xF81F, 0x11D2, {0xBA, 0x4B, 0x00, 0xA0, 0xC9, 0x3E, 0xC9, 0x3B}}
PARTITION_WINDOWS_SYSTEM_GUID :: GUID{0x57434F53, 0xE3E3, 0x4631, {0xA5, 0xC5, 0x26, 0xD2, 0x24, 0x38, 0x73, 0xAA}}
RESOURCE_MANAGER_COMMUNICATION :: 2
RESOURCE_MANAGER_MAXIMUM_OPTION :: 3
RESOURCE_MANAGER_OBJECT_PATH :: "\\ResourceManager\\"
RESOURCE_MANAGER_VOLATILE :: 1
SESI1_NUM_ELEMENTS :: 8
SESI2_NUM_ELEMENTS :: 9
SHARE_CURRENT_USES_PARMNUM :: 7
SHARE_FILE_SD_PARMNUM :: 501
SHARE_MAX_USES_PARMNUM :: 6
SHARE_NETNAME_PARMNUM :: 1
SHARE_PASSWD_PARMNUM :: 9
SHARE_PATH_PARMNUM :: 8
SHARE_PERMISSIONS_PARMNUM :: 5
SHARE_QOS_POLICY_PARMNUM :: 504
SHARE_REMARK_PARMNUM :: 4
SHARE_SERVER_PARMNUM :: 503
SHARE_TYPE_PARMNUM :: 3
SHI_USES_UNLIMITED :: 4294967295
SHI1_NUM_ELEMENTS :: 4
SHI1005_FLAGS_ACCESS_BASED_DIRECTORY_ENUM :: 2048
SHI1005_FLAGS_ALLOW_NAMESPACE_CACHING :: 1024
SHI1005_FLAGS_CLUSTER_MANAGED :: 524288
SHI1005_FLAGS_COMPRESS_DATA :: 1048576
SHI1005_FLAGS_DFS :: 1
SHI1005_FLAGS_DFS_ROOT :: 2
SHI1005_FLAGS_DISABLE_CLIENT_BUFFERING :: 131072
SHI1005_FLAGS_DISABLE_DIRECTORY_HANDLE_LEASING :: 4194304
SHI1005_FLAGS_ENABLE_CA :: 16384
SHI1005_FLAGS_ENABLE_HASH :: 8192
SHI1005_FLAGS_ENCRYPT_DATA :: 32768
SHI1005_FLAGS_FORCE_LEVELII_OPLOCK :: 4096
SHI1005_FLAGS_FORCE_SHARED_DELETE :: 512
SHI1005_FLAGS_IDENTITY_REMOTING :: 262144
SHI1005_FLAGS_ISOLATED_TRANSPORT :: 2097152
SHI1005_FLAGS_RESERVED :: 65536
SHI1005_FLAGS_RESTRICT_EXCLUSIVE_OPENS :: 256
SHI2_NUM_ELEMENTS :: 10
STATSOPT_CLR :: 1
STYPE_RESERVED_ALL :: 1073741568
STYPE_RESERVED1 :: 16777216
STYPE_RESERVED2 :: 33554432
STYPE_RESERVED3 :: 67108864
STYPE_RESERVED4 :: 134217728
STYPE_RESERVED5 :: 1048576
TRANSACTION_DO_NOT_PROMOTE :: 1
TRANSACTION_MANAGER_COMMIT_DEFAULT :: 0
TRANSACTION_MANAGER_COMMIT_LOWEST :: 8
TRANSACTION_MANAGER_COMMIT_SYSTEM_HIVES :: 4
TRANSACTION_MANAGER_COMMIT_SYSTEM_VOLUME :: 2
TRANSACTION_MANAGER_CORRUPT_FOR_PROGRESS :: 32
TRANSACTION_MANAGER_CORRUPT_FOR_RECOVERY :: 16
TRANSACTION_MANAGER_MAXIMUM_OPTION :: 63
TRANSACTION_MANAGER_VOLATILE :: 1
TRANSACTION_MAXIMUM_OPTION :: 1
TRANSACTION_NOTIFICATION_TM_ONLINE_FLAG_IS_CLUSTERED :: 1
TRANSACTION_NOTIFY_COMMIT :: 4
TRANSACTION_NOTIFY_COMMIT_COMPLETE :: 64
TRANSACTION_NOTIFY_COMMIT_FINALIZE :: 1073741824
TRANSACTION_NOTIFY_COMMIT_REQUEST :: 67108864
TRANSACTION_NOTIFY_DELEGATE_COMMIT :: 1024
TRANSACTION_NOTIFY_ENLIST_MASK :: 262144
TRANSACTION_NOTIFY_ENLIST_PREPREPARE :: 4096
TRANSACTION_NOTIFY_INDOUBT :: 16384
TRANSACTION_NOTIFY_LAST_RECOVER :: 8192
TRANSACTION_NOTIFY_MARSHAL :: 131072
TRANSACTION_NOTIFY_MASK :: 1073741823
TRANSACTION_NOTIFY_PREPARE :: 2
TRANSACTION_NOTIFY_PREPARE_COMPLETE :: 32
TRANSACTION_NOTIFY_PREPREPARE :: 1
TRANSACTION_NOTIFY_PREPREPARE_COMPLETE :: 16
TRANSACTION_NOTIFY_PROMOTE :: 134217728
TRANSACTION_NOTIFY_PROMOTE_NEW :: 268435456
TRANSACTION_NOTIFY_PROPAGATE_PULL :: 32768
TRANSACTION_NOTIFY_PROPAGATE_PUSH :: 65536
TRANSACTION_NOTIFY_RECOVER :: 256
TRANSACTION_NOTIFY_RECOVER_QUERY :: 2048
TRANSACTION_NOTIFY_REQUEST_OUTCOME :: 536870912
TRANSACTION_NOTIFY_RM_DISCONNECTED :: 16777216
TRANSACTION_NOTIFY_ROLLBACK :: 8
TRANSACTION_NOTIFY_ROLLBACK_COMPLETE :: 128
TRANSACTION_NOTIFY_SINGLE_PHASE_COMMIT :: 512
TRANSACTION_NOTIFY_TM_ONLINE :: 33554432
TRANSACTION_OBJECT_PATH :: "\\Transaction\\"
TRANSACTIONMANAGER_OBJECT_PATH :: "\\TransactionManager\\"
TXF_LOG_RECORD_GENERIC_TYPE_ABORT :: 2
TXF_LOG_RECORD_GENERIC_TYPE_COMMIT :: 1
TXF_LOG_RECORD_GENERIC_TYPE_DATA :: 8
TXF_LOG_RECORD_GENERIC_TYPE_PREPARE :: 4
VS_FFI_FILEFLAGSMASK :: 63
VS_FFI_SIGNATURE :: -17890115
VS_FFI_STRUCVERSION :: 65536
VS_USER_DEFINED :: 100
VS_VERSION_INFO :: 1
WIM_BOOT_NOT_OS_WIM :: 0
WIM_BOOT_OS_WIM :: 1
WIM_ENTRY_FLAG_NOT_ACTIVE :: 1
WIM_ENTRY_FLAG_SUSPENDED :: 2
WIM_EXTERNAL_FILE_INFO_FLAG_NOT_ACTIVE :: 1
WIM_EXTERNAL_FILE_INFO_FLAG_SUSPENDED :: 2
WIM_PROVIDER_HASH_SIZE :: 20
WINEFS_SETUSERKEY_SET_CAPABILITIES :: 1
WOF_PROVIDER_FILE :: 2
WOF_PROVIDER_WIM :: 1

