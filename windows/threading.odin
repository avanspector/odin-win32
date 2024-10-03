package windows

foreign import advapi32 "system:advapi32.lib"
foreign import avrt "system:avrt.lib"
foreign import kernel32 "system:kernel32.lib"
foreign import oleacc "system:oleacc.lib"
foreign import onecore "system:onecore.lib"
foreign import rtworkq "system:rtworkq.lib"
foreign import synchronization "system:synchronization.lib"
foreign import user32 "system:user32.lib"

@(default_calling_convention="system")
foreign advapi32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessasusera ]]
	CreateProcessAsUserA :: proc(
		hToken: HANDLE,
		lpApplicationName: PSTR,
		lpCommandLine: PSTR,
		lpProcessAttributes: ^SECURITY_ATTRIBUTES,
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		bInheritHandles: BOOL,
		dwCreationFlags: PROCESS_CREATION_FLAGS,
		lpEnvironment: rawptr,
		lpCurrentDirectory: PSTR,
		lpStartupInfo: ^STARTUPINFOA,
		lpProcessInformation: ^PROCESS_INFORMATION,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessasuserw ]]
	CreateProcessAsUserW :: proc(
		hToken: HANDLE,
		lpApplicationName: PWSTR,
		lpCommandLine: PWSTR,
		lpProcessAttributes: ^SECURITY_ATTRIBUTES,
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		bInheritHandles: BOOL,
		dwCreationFlags: PROCESS_CREATION_FLAGS,
		lpEnvironment: rawptr,
		lpCurrentDirectory: PWSTR,
		lpStartupInfo: ^STARTUPINFOW,
		lpProcessInformation: ^PROCESS_INFORMATION,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createprocesswithlogonw ]]
	CreateProcessWithLogonW :: proc(
		lpUsername: PWSTR,
		lpDomain: PWSTR,
		lpPassword: PWSTR,
		dwLogonFlags: CREATE_PROCESS_LOGON_FLAGS,
		lpApplicationName: PWSTR,
		lpCommandLine: PWSTR,
		dwCreationFlags: PROCESS_CREATION_FLAGS,
		lpEnvironment: rawptr,
		lpCurrentDirectory: PWSTR,
		lpStartupInfo: ^STARTUPINFOW,
		lpProcessInformation: ^PROCESS_INFORMATION,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createprocesswithtokenw ]]
	CreateProcessWithTokenW :: proc(
		hToken: HANDLE,
		dwLogonFlags: CREATE_PROCESS_LOGON_FLAGS,
		lpApplicationName: PWSTR,
		lpCommandLine: PWSTR,
		dwCreationFlags: PROCESS_CREATION_FLAGS,
		lpEnvironment: rawptr,
		lpCurrentDirectory: PWSTR,
		lpStartupInfo: ^STARTUPINFOW,
		lpProcessInformation: ^PROCESS_INFORMATION,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-openprocesstoken ]]
	OpenProcessToken :: proc(ProcessHandle: HANDLE, DesiredAccess: TOKEN_ACCESS_MASK, TokenHandle: ^HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-openthreadtoken ]]
	OpenThreadToken :: proc(
		ThreadHandle: HANDLE,
		DesiredAccess: TOKEN_ACCESS_MASK,
		OpenAsSelf: BOOL,
		TokenHandle: ^HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadtoken ]]
	SetThreadToken :: proc(Thread: ^HANDLE, Token: HANDLE) -> BOOL ---
}

@(default_calling_convention="system")
foreign avrt {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avquerysystemresponsiveness ]]
	AvQuerySystemResponsiveness :: proc(AvrtHandle: HANDLE, SystemResponsivenessValue: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avrevertmmthreadcharacteristics ]]
	AvRevertMmThreadCharacteristics :: proc(AvrtHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avrtcreatethreadorderinggroup ]]
	AvRtCreateThreadOrderingGroup :: proc(Context: ^HANDLE, Period: ^i64, ThreadOrderingGuid: ^GUID, Timeout: ^i64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avrtcreatethreadorderinggroupexa ]]
	AvRtCreateThreadOrderingGroupExA :: proc(
		Context: ^HANDLE,
		Period: ^i64,
		ThreadOrderingGuid: ^GUID,
		Timeout: ^i64,
		TaskName: PSTR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avrtcreatethreadorderinggroupexw ]]
	AvRtCreateThreadOrderingGroupExW :: proc(
		Context: ^HANDLE,
		Period: ^i64,
		ThreadOrderingGuid: ^GUID,
		Timeout: ^i64,
		TaskName: PWSTR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avrtdeletethreadorderinggroup ]]
	AvRtDeleteThreadOrderingGroup :: proc(Context: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avrtjointhreadorderinggroup ]]
	AvRtJoinThreadOrderingGroup :: proc(Context: ^HANDLE, ThreadOrderingGuid: ^GUID, Before: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avrtleavethreadorderinggroup ]]
	AvRtLeaveThreadOrderingGroup :: proc(Context: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avrtwaitonthreadorderinggroup ]]
	AvRtWaitOnThreadOrderingGroup :: proc(Context: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avsetmmmaxthreadcharacteristicsa ]]
	AvSetMmMaxThreadCharacteristicsA :: proc(FirstTask: PSTR, SecondTask: PSTR, TaskIndex: ^u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avsetmmmaxthreadcharacteristicsw ]]
	AvSetMmMaxThreadCharacteristicsW :: proc(FirstTask: PWSTR, SecondTask: PWSTR, TaskIndex: ^u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avsetmmthreadcharacteristicsa ]]
	AvSetMmThreadCharacteristicsA :: proc(TaskName: PSTR, TaskIndex: ^u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avsetmmthreadcharacteristicsw ]]
	AvSetMmThreadCharacteristicsW :: proc(TaskName: PWSTR, TaskIndex: ^u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/avrt/nf-avrt-avsetmmthreadpriority ]]
	AvSetMmThreadPriority :: proc(AvrtHandle: HANDLE, Priority: AVRT_PRIORITY) -> BOOL ---
}

@(default_calling_convention="system")
foreign kernel32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-acquiresrwlockexclusive ]]
	AcquireSRWLockExclusive :: proc(SRWLock: ^SRWLOCK) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-acquiresrwlockshared ]]
	AcquireSRWLockShared :: proc(SRWLock: ^SRWLOCK) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-addintegritylabeltoboundarydescriptor ]]
	AddIntegrityLabelToBoundaryDescriptor :: proc(BoundaryDescriptor: ^HANDLE, IntegrityLabel: PSID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/namespaceapi/nf-namespaceapi-addsidtoboundarydescriptor ]]
	AddSIDToBoundaryDescriptor :: proc(BoundaryDescriptor: ^HANDLE, RequiredSid: PSID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-callbackmayrunlong ]]
	CallbackMayRunLong :: proc(pci: PTP_CALLBACK_INSTANCE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-cancelthreadpoolio ]]
	CancelThreadpoolIo :: proc(pio: PTP_IO) ---

	CancelTimerQueueTimer :: proc(TimerQueue: HANDLE, Timer: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-cancelwaitabletimer ]]
	CancelWaitableTimer :: proc(hTimer: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-changetimerqueuetimer ]]
	ChangeTimerQueueTimer :: proc(TimerQueue: HANDLE, Timer: HANDLE, DueTime: u32, Period: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/namespaceapi/nf-namespaceapi-closeprivatenamespace ]]
	ClosePrivateNamespace :: proc(Handle: HANDLE, Flags: u32) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-closethreadpool ]]
	CloseThreadpool :: proc(ptpp: PTP_POOL) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroup ]]
	CloseThreadpoolCleanupGroup :: proc(ptpcg: PTP_CLEANUP_GROUP) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolcleanupgroupmembers ]]
	CloseThreadpoolCleanupGroupMembers :: proc(
		ptpcg: PTP_CLEANUP_GROUP,
		fCancelPendingCallbacks: BOOL,
		pvCleanupContext: rawptr,
	) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolio ]]
	CloseThreadpoolIo :: proc(pio: PTP_IO) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-closethreadpooltimer ]]
	CloseThreadpoolTimer :: proc(pti: PTP_TIMER) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolwait ]]
	CloseThreadpoolWait :: proc(pwa: PTP_WAIT) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-closethreadpoolwork ]]
	CloseThreadpoolWork :: proc(pwk: PTP_WORK) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-convertfibertothread ]]
	ConvertFiberToThread :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-convertthreadtofiber ]]
	ConvertThreadToFiber :: proc(lpParameter: rawptr) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-convertthreadtofiberex ]]
	ConvertThreadToFiberEx :: proc(lpParameter: rawptr, dwFlags: u32) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createboundarydescriptora ]]
	CreateBoundaryDescriptorA :: proc(Name: PSTR, Flags: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/namespaceapi/nf-namespaceapi-createboundarydescriptorw ]]
	CreateBoundaryDescriptorW :: proc(Name: PWSTR, Flags: u32) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createeventa ]]
	CreateEventA :: proc(
		lpEventAttributes: ^SECURITY_ATTRIBUTES,
		bManualReset: BOOL,
		bInitialState: BOOL,
		lpName: PSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createeventexa ]]
	CreateEventExA :: proc(
		lpEventAttributes: ^SECURITY_ATTRIBUTES,
		lpName: PSTR,
		dwFlags: CREATE_EVENT,
		dwDesiredAccess: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createeventexw ]]
	CreateEventExW :: proc(
		lpEventAttributes: ^SECURITY_ATTRIBUTES,
		lpName: PWSTR,
		dwFlags: CREATE_EVENT,
		dwDesiredAccess: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createeventw ]]
	CreateEventW :: proc(
		lpEventAttributes: ^SECURITY_ATTRIBUTES,
		bManualReset: BOOL,
		bInitialState: BOOL,
		lpName: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createfiber ]]
	CreateFiber :: proc(
		dwStackSize: uintptr,
		lpStartAddress: LPFIBER_START_ROUTINE,
		lpParameter: rawptr,
	) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createfiberex ]]
	CreateFiberEx :: proc(
		dwStackCommitSize: uintptr,
		dwStackReserveSize: uintptr,
		dwFlags: u32,
		lpStartAddress: LPFIBER_START_ROUTINE,
		lpParameter: rawptr,
	) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createmutexa ]]
	CreateMutexA :: proc(lpMutexAttributes: ^SECURITY_ATTRIBUTES, bInitialOwner: BOOL, lpName: PSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createmutexexa ]]
	CreateMutexExA :: proc(
		lpMutexAttributes: ^SECURITY_ATTRIBUTES,
		lpName: PSTR,
		dwFlags: u32,
		dwDesiredAccess: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createmutexexw ]]
	CreateMutexExW :: proc(
		lpMutexAttributes: ^SECURITY_ATTRIBUTES,
		lpName: PWSTR,
		dwFlags: u32,
		dwDesiredAccess: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createmutexw ]]
	CreateMutexW :: proc(lpMutexAttributes: ^SECURITY_ATTRIBUTES, bInitialOwner: BOOL, lpName: PWSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createprivatenamespacea ]]
	CreatePrivateNamespaceA :: proc(
		lpPrivateNamespaceAttributes: ^SECURITY_ATTRIBUTES,
		lpBoundaryDescriptor: rawptr,
		lpAliasPrefix: PSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/namespaceapi/nf-namespaceapi-createprivatenamespacew ]]
	CreatePrivateNamespaceW :: proc(
		lpPrivateNamespaceAttributes: ^SECURITY_ATTRIBUTES,
		lpBoundaryDescriptor: rawptr,
		lpAliasPrefix: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessa ]]
	CreateProcessA :: proc(
		lpApplicationName: PSTR,
		lpCommandLine: PSTR,
		lpProcessAttributes: ^SECURITY_ATTRIBUTES,
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		bInheritHandles: BOOL,
		dwCreationFlags: PROCESS_CREATION_FLAGS,
		lpEnvironment: rawptr,
		lpCurrentDirectory: PSTR,
		lpStartupInfo: ^STARTUPINFOA,
		lpProcessInformation: ^PROCESS_INFORMATION,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createprocessw ]]
	CreateProcessW :: proc(
		lpApplicationName: PWSTR,
		lpCommandLine: PWSTR,
		lpProcessAttributes: ^SECURITY_ATTRIBUTES,
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		bInheritHandles: BOOL,
		dwCreationFlags: PROCESS_CREATION_FLAGS,
		lpEnvironment: rawptr,
		lpCurrentDirectory: PWSTR,
		lpStartupInfo: ^STARTUPINFOW,
		lpProcessInformation: ^PROCESS_INFORMATION,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createremotethread ]]
	CreateRemoteThread :: proc(
		hProcess: HANDLE,
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		dwStackSize: uintptr,
		lpStartAddress: LPTHREAD_START_ROUTINE,
		lpParameter: rawptr,
		dwCreationFlags: u32,
		lpThreadId: ^u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createremotethreadex ]]
	CreateRemoteThreadEx :: proc(
		hProcess: HANDLE,
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		dwStackSize: uintptr,
		lpStartAddress: LPTHREAD_START_ROUTINE,
		lpParameter: rawptr,
		dwCreationFlags: u32,
		lpAttributeList: LPPROC_THREAD_ATTRIBUTE_LIST,
		lpThreadId: ^u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createsemaphorea ]]
	CreateSemaphoreA :: proc(
		lpSemaphoreAttributes: ^SECURITY_ATTRIBUTES,
		lInitialCount: i32,
		lMaximumCount: i32,
		lpName: PSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createsemaphoreexa ]]
	CreateSemaphoreExA :: proc(
		lpSemaphoreAttributes: ^SECURITY_ATTRIBUTES,
		lInitialCount: i32,
		lMaximumCount: i32,
		lpName: PSTR,
		dwFlags: u32,
		dwDesiredAccess: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createsemaphoreexw ]]
	CreateSemaphoreExW :: proc(
		lpSemaphoreAttributes: ^SECURITY_ATTRIBUTES,
		lInitialCount: i32,
		lMaximumCount: i32,
		lpName: PWSTR,
		dwFlags: u32,
		dwDesiredAccess: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createsemaphorew ]]
	CreateSemaphoreW :: proc(
		lpSemaphoreAttributes: ^SECURITY_ATTRIBUTES,
		lInitialCount: i32,
		lMaximumCount: i32,
		lpName: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-createthread ]]
	CreateThread :: proc(
		lpThreadAttributes: ^SECURITY_ATTRIBUTES,
		dwStackSize: uintptr,
		lpStartAddress: LPTHREAD_START_ROUTINE,
		lpParameter: rawptr,
		dwCreationFlags: THREAD_CREATION_FLAGS,
		lpThreadId: ^u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-createthreadpool ]]
	CreateThreadpool :: proc(reserved: rawptr) -> PTP_POOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolcleanupgroup ]]
	CreateThreadpoolCleanupGroup :: proc() -> PTP_CLEANUP_GROUP ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolio ]]
	CreateThreadpoolIo :: proc(
		fl: HANDLE,
		pfnio: PTP_WIN32_IO_CALLBACK,
		pv: rawptr,
		pcbe: ^TP_CALLBACK_ENVIRON_V3,
	) -> PTP_IO ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-createthreadpooltimer ]]
	CreateThreadpoolTimer :: proc(pfnti: PTP_TIMER_CALLBACK, pv: rawptr, pcbe: ^TP_CALLBACK_ENVIRON_V3) -> PTP_TIMER ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwait ]]
	CreateThreadpoolWait :: proc(pfnwa: PTP_WAIT_CALLBACK, pv: rawptr, pcbe: ^TP_CALLBACK_ENVIRON_V3) -> PTP_WAIT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-createthreadpoolwork ]]
	CreateThreadpoolWork :: proc(pfnwk: PTP_WORK_CALLBACK, pv: rawptr, pcbe: ^TP_CALLBACK_ENVIRON_V3) -> PTP_WORK ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueue ]]
	CreateTimerQueue :: proc() -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-createtimerqueuetimer ]]
	CreateTimerQueueTimer :: proc(
		phNewTimer: ^HANDLE,
		TimerQueue: HANDLE,
		Callback: WAITORTIMERCALLBACK,
		Parameter: rawptr,
		DueTime: u32,
		Period: u32,
		Flags: WORKER_THREAD_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createumscompletionlist ]]
	CreateUmsCompletionList :: proc(UmsCompletionList: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createumsthreadcontext ]]
	CreateUmsThreadContext :: proc(lpUmsThread: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createwaitabletimerw ]]
	CreateWaitableTimerA :: proc(
		lpTimerAttributes: ^SECURITY_ATTRIBUTES,
		bManualReset: BOOL,
		lpTimerName: PSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createwaitabletimerexw ]]
	CreateWaitableTimerExA :: proc(
		lpTimerAttributes: ^SECURITY_ATTRIBUTES,
		lpTimerName: PSTR,
		dwFlags: u32,
		dwDesiredAccess: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createwaitabletimerexw ]]
	CreateWaitableTimerExW :: proc(
		lpTimerAttributes: ^SECURITY_ATTRIBUTES,
		lpTimerName: PWSTR,
		dwFlags: u32,
		dwDesiredAccess: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-createwaitabletimerw ]]
	CreateWaitableTimerW :: proc(
		lpTimerAttributes: ^SECURITY_ATTRIBUTES,
		bManualReset: BOOL,
		lpTimerName: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/namespaceapi/nf-namespaceapi-deleteboundarydescriptor ]]
	DeleteBoundaryDescriptor :: proc(BoundaryDescriptor: HANDLE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-deletecriticalsection ]]
	DeleteCriticalSection :: proc(lpCriticalSection: ^CRITICAL_SECTION) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deletefiber ]]
	DeleteFiber :: proc(lpFiber: rawptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-deleteprocthreadattributelist ]]
	DeleteProcThreadAttributeList :: proc(lpAttributeList: LPPROC_THREAD_ATTRIBUTE_LIST) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-deletesynchronizationbarrier ]]
	DeleteSynchronizationBarrier :: proc(lpBarrier: ^SYNCHRONIZATION_BARRIER) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueue ]]
	DeleteTimerQueue :: proc(TimerQueue: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueueex ]]
	DeleteTimerQueueEx :: proc(TimerQueue: HANDLE, CompletionEvent: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-deletetimerqueuetimer ]]
	DeleteTimerQueueTimer :: proc(TimerQueue: HANDLE, Timer: HANDLE, CompletionEvent: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deleteumscompletionlist ]]
	DeleteUmsCompletionList :: proc(UmsCompletionList: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deleteumsthreadcontext ]]
	DeleteUmsThreadContext :: proc(UmsThread: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-dequeueumscompletionlistitems ]]
	DequeueUmsCompletionListItems :: proc(UmsCompletionList: rawptr, WaitTimeOut: u32, UmsThreadList: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-disassociatecurrentthreadfromcallback ]]
	DisassociateCurrentThreadFromCallback :: proc(pci: PTP_CALLBACK_INSTANCE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-entercriticalsection ]]
	EnterCriticalSection :: proc(lpCriticalSection: ^CRITICAL_SECTION) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-entersynchronizationbarrier ]]
	EnterSynchronizationBarrier :: proc(lpBarrier: ^SYNCHRONIZATION_BARRIER, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-enterumsschedulingmode ]]
	EnterUmsSchedulingMode :: proc(SchedulerStartupInfo: ^UMS_SCHEDULER_STARTUP_INFO) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-executeumsthread ]]
	ExecuteUmsThread :: proc(UmsThread: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitprocess ]]
	ExitProcess :: proc(uExitCode: u32) -> ! ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-exitthread ]]
	ExitThread :: proc(dwExitCode: u32) -> ! ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fibersapi/nf-fibersapi-flsalloc ]]
	FlsAlloc :: proc(lpCallback: PFLS_CALLBACK_FUNCTION) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fibersapi/nf-fibersapi-flsfree ]]
	FlsFree :: proc(dwFlsIndex: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fibersapi/nf-fibersapi-flsgetvalue ]]
	FlsGetValue :: proc(dwFlsIndex: u32) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fibersapi/nf-fibersapi-flssetvalue ]]
	FlsSetValue :: proc(dwFlsIndex: u32, lpFlsData: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-flushprocesswritebuffers ]]
	FlushProcessWriteBuffers :: proc() ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-freelibrarywhencallbackreturns ]]
	FreeLibraryWhenCallbackReturns :: proc(pci: PTP_CALLBACK_INSTANCE, mod: HMODULE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getactiveprocessorcount ]]
	GetActiveProcessorCount :: proc(GroupNumber: u16) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getactiveprocessorgroupcount ]]
	GetActiveProcessorGroupCount :: proc() -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess ]]
	GetCurrentProcess :: proc() -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessid ]]
	GetCurrentProcessId :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessornumber ]]
	GetCurrentProcessorNumber :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentprocessornumberex ]]
	GetCurrentProcessorNumberEx :: proc(ProcNumber: ^PROCESSOR_NUMBER) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentthread ]]
	GetCurrentThread :: proc() -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadid ]]
	GetCurrentThreadId :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getcurrentthreadstacklimits ]]
	GetCurrentThreadStackLimits :: proc(LowLimit: ^uintptr, HighLimit: ^uintptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getcurrentumsthread ]]
	GetCurrentUmsThread :: proc() -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getexitcodeprocess ]]
	GetExitCodeProcess :: proc(hProcess: HANDLE, lpExitCode: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getexitcodethread ]]
	GetExitCodeThread :: proc(hThread: HANDLE, lpExitCode: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getmachinetypeattributes ]]
	GetMachineTypeAttributes :: proc(Machine: u16, MachineTypeAttributes: ^MACHINE_ATTRIBUTES) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getmaximumprocessorcount ]]
	GetMaximumProcessorCount :: proc(GroupNumber: u16) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getmaximumprocessorgroupcount ]]
	GetMaximumProcessorGroupCount :: proc() -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnextumslistitem ]]
	GetNextUmsListItem :: proc(UmsContext: rawptr) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnumaavailablememorynode ]]
	GetNumaAvailableMemoryNode :: proc(Node: u8, AvailableBytes: ^u64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnumaavailablememorynodeex ]]
	GetNumaAvailableMemoryNodeEx :: proc(Node: u16, AvailableBytes: ^u64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/systemtopologyapi/nf-systemtopologyapi-getnumahighestnodenumber ]]
	GetNumaHighestNodeNumber :: proc(HighestNodeNumber: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnumanodenumberfromhandle ]]
	GetNumaNodeNumberFromHandle :: proc(hFile: HANDLE, NodeNumber: ^u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnumanodeprocessormask ]]
	GetNumaNodeProcessorMask :: proc(Node: u8, ProcessorMask: ^u64) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/systemtopologyapi/nf-systemtopologyapi-getnumanodeprocessormask2 ]]
	GetNumaNodeProcessorMask2 :: proc(
		NodeNumber: u16,
		ProcessorMasks: [^]GROUP_AFFINITY,
		ProcessorMaskCount: u16,
		RequiredMaskCount: ^u16,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/systemtopologyapi/nf-systemtopologyapi-getnumanodeprocessormaskex ]]
	GetNumaNodeProcessorMaskEx :: proc(Node: u16, ProcessorMask: ^GROUP_AFFINITY) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnumaprocessornode ]]
	GetNumaProcessorNode :: proc(Processor: u8, NodeNumber: ^u8) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnumaprocessornodeex ]]
	GetNumaProcessorNodeEx :: proc(Processor: ^PROCESSOR_NUMBER, NodeNumber: ^u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getnumaproximitynode ]]
	GetNumaProximityNode :: proc(ProximityId: u32, NodeNumber: ^u8) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/systemtopologyapi/nf-systemtopologyapi-getnumaproximitynodeex ]]
	GetNumaProximityNodeEx :: proc(ProximityId: u32, NodeNumber: ^u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getpriorityclass ]]
	GetPriorityClass :: proc(hProcess: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprocessaffinitymask ]]
	GetProcessAffinityMask :: proc(
		hProcess: HANDLE,
		lpProcessAffinityMask: ^uintptr,
		lpSystemAffinityMask: ^uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessdefaultcpusetmasks ]]
	GetProcessDefaultCpuSetMasks :: proc(
		Process: HANDLE,
		CpuSetMasks: [^]GROUP_AFFINITY,
		CpuSetMaskCount: u16,
		RequiredMaskCount: ^u16,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessdefaultcpusets ]]
	GetProcessDefaultCpuSets :: proc(Process: HANDLE, CpuSetIds: [^]u32, CpuSetIdCount: u32, RequiredIdCount: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprocessdeppolicy ]]
	GetProcessDEPPolicy :: proc(hProcess: HANDLE, lpFlags: ^u32, lpPermanent: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processtopologyapi/nf-processtopologyapi-getprocessgroupaffinity ]]
	GetProcessGroupAffinity :: proc(hProcess: HANDLE, GroupCount: ^u16, GroupArray: [^]u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocesshandlecount ]]
	GetProcessHandleCount :: proc(hProcess: HANDLE, pdwHandleCount: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessid ]]
	GetProcessId :: proc(Process: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessidofthread ]]
	GetProcessIdOfThread :: proc(Thread: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessinformation ]]
	GetProcessInformation :: proc(
		hProcess: HANDLE,
		ProcessInformationClass: PROCESS_INFORMATION_CLASS,
		ProcessInformation: rawptr,
		ProcessInformationSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getprocessiocounters ]]
	GetProcessIoCounters :: proc(hProcess: HANDLE, lpIoCounters: ^IO_COUNTERS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessmitigationpolicy ]]
	GetProcessMitigationPolicy :: proc(
		hProcess: HANDLE,
		MitigationPolicy: PROCESS_MITIGATION_POLICY,
		lpBuffer: rawptr,
		dwLength: uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocesspriorityboost ]]
	GetProcessPriorityBoost :: proc(hProcess: HANDLE, pDisablePriorityBoost: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessshutdownparameters ]]
	GetProcessShutdownParameters :: proc(lpdwLevel: ^u32, lpdwFlags: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocesstimes ]]
	GetProcessTimes :: proc(
		hProcess: HANDLE,
		lpCreationTime: ^FILETIME,
		lpExitTime: ^FILETIME,
		lpKernelTime: ^FILETIME,
		lpUserTime: ^FILETIME,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getprocessversion ]]
	GetProcessVersion :: proc(ProcessId: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getprocessworkingsetsize ]]
	GetProcessWorkingSetSize :: proc(
		hProcess: HANDLE,
		lpMinimumWorkingSetSize: ^uintptr,
		lpMaximumWorkingSetSize: ^uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getstartupinfow ]]
	GetStartupInfoA :: proc(lpStartupInfo: ^STARTUPINFOA) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getstartupinfow ]]
	GetStartupInfoW :: proc(lpStartupInfo: ^STARTUPINFOW) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getsystemtimes ]]
	GetSystemTimes :: proc(lpIdleTime: ^FILETIME, lpKernelTime: ^FILETIME, lpUserTime: ^FILETIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreaddescription ]]
	GetThreadDescription :: proc(hThread: HANDLE, ppszThreadDescription: ^PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processtopologyapi/nf-processtopologyapi-getthreadgroupaffinity ]]
	GetThreadGroupAffinity :: proc(hThread: HANDLE, GroupAffinity: ^GROUP_AFFINITY) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadid ]]
	GetThreadId :: proc(Thread: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadidealprocessorex ]]
	GetThreadIdealProcessorEx :: proc(hThread: HANDLE, lpIdealProcessor: ^PROCESSOR_NUMBER) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadinformation ]]
	GetThreadInformation :: proc(
		hThread: HANDLE,
		ThreadInformationClass: THREAD_INFORMATION_CLASS,
		ThreadInformation: rawptr,
		ThreadInformationSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadiopendingflag ]]
	GetThreadIOPendingFlag :: proc(hThread: HANDLE, lpIOIsPending: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadpriority ]]
	GetThreadPriority :: proc(hThread: HANDLE) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadpriorityboost ]]
	GetThreadPriorityBoost :: proc(hThread: HANDLE, pDisablePriorityBoost: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadselectedcpusetmasks ]]
	GetThreadSelectedCpuSetMasks :: proc(
		Thread: HANDLE,
		CpuSetMasks: [^]GROUP_AFFINITY,
		CpuSetMaskCount: u16,
		RequiredMaskCount: ^u16,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadselectedcpusets ]]
	GetThreadSelectedCpuSets :: proc(Thread: HANDLE, CpuSetIds: [^]u32, CpuSetIdCount: u32, RequiredIdCount: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getthreadtimes ]]
	GetThreadTimes :: proc(
		hThread: HANDLE,
		lpCreationTime: ^FILETIME,
		lpExitTime: ^FILETIME,
		lpKernelTime: ^FILETIME,
		lpUserTime: ^FILETIME,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getumscompletionlistevent ]]
	GetUmsCompletionListEvent :: proc(UmsCompletionList: rawptr, UmsCompletionEvent: ^HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getumssystemthreadinformation ]]
	GetUmsSystemThreadInformation :: proc(ThreadHandle: HANDLE, SystemThreadInfo: ^UMS_SYSTEM_THREAD_INFORMATION) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initializeconditionvariable ]]
	InitializeConditionVariable :: proc(ConditionVariable: ^CONDITION_VARIABLE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initializecriticalsection ]]
	InitializeCriticalSection :: proc(lpCriticalSection: ^CRITICAL_SECTION) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initializecriticalsectionandspincount ]]
	InitializeCriticalSectionAndSpinCount :: proc(lpCriticalSection: ^CRITICAL_SECTION, dwSpinCount: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initializecriticalsectionex ]]
	InitializeCriticalSectionEx :: proc(lpCriticalSection: ^CRITICAL_SECTION, dwSpinCount: u32, Flags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-initializeprocthreadattributelist ]]
	InitializeProcThreadAttributeList :: proc(
		lpAttributeList: LPPROC_THREAD_ATTRIBUTE_LIST,
		dwAttributeCount: u32,
		dwFlags: u32,
		lpSize: ^uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initializesrwlock ]]
	InitializeSRWLock :: proc(SRWLock: ^SRWLOCK) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initializesynchronizationbarrier ]]
	InitializeSynchronizationBarrier :: proc(lpBarrier: ^SYNCHRONIZATION_BARRIER, lTotalThreads: i32, lSpinCount: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initoncebegininitialize ]]
	InitOnceBeginInitialize :: proc(lpInitOnce: ^INIT_ONCE, dwFlags: u32, fPending: ^BOOL, lpContext: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initoncecomplete ]]
	InitOnceComplete :: proc(lpInitOnce: ^INIT_ONCE, dwFlags: u32, lpContext: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initonceexecuteonce ]]
	InitOnceExecuteOnce :: proc(InitOnce: ^INIT_ONCE, InitFn: PINIT_ONCE_FN, Parameter: rawptr, Context: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-initonceinitialize ]]
	InitOnceInitialize :: proc(InitOnce: ^INIT_ONCE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-isprocesscritical ]]
	IsProcessCritical :: proc(hProcess: HANDLE, Critical: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-isprocessorfeaturepresent ]]
	IsProcessorFeaturePresent :: proc(ProcessorFeature: PROCESSOR_FEATURE_ID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/fibersapi/nf-fibersapi-isthreadafiber ]]
	IsThreadAFiber :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-isthreadpooltimerset ]]
	IsThreadpoolTimerSet :: proc(pti: PTP_TIMER) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-iswow64process ]]
	IsWow64Process :: proc(hProcess: HANDLE, Wow64Process: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-iswow64process2 ]]
	IsWow64Process2 :: proc(
		hProcess: HANDLE,
		pProcessMachine: ^IMAGE_FILE_MACHINE,
		pNativeMachine: ^IMAGE_FILE_MACHINE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-leavecriticalsection ]]
	LeaveCriticalSection :: proc(lpCriticalSection: ^CRITICAL_SECTION) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-leavecriticalsectionwhencallbackreturns ]]
	LeaveCriticalSectionWhenCallbackReturns :: proc(pci: PTP_CALLBACK_INSTANCE, pcs: ^CRITICAL_SECTION) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openeventa ]]
	OpenEventA :: proc(
		dwDesiredAccess: SYNCHRONIZATION_ACCESS_RIGHTS,
		bInheritHandle: BOOL,
		lpName: PSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openeventw ]]
	OpenEventW :: proc(
		dwDesiredAccess: SYNCHRONIZATION_ACCESS_RIGHTS,
		bInheritHandle: BOOL,
		lpName: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openmutexw ]]
	OpenMutexW :: proc(
		dwDesiredAccess: SYNCHRONIZATION_ACCESS_RIGHTS,
		bInheritHandle: BOOL,
		lpName: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openprivatenamespacea ]]
	OpenPrivateNamespaceA :: proc(lpBoundaryDescriptor: rawptr, lpAliasPrefix: PSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/namespaceapi/nf-namespaceapi-openprivatenamespacew ]]
	OpenPrivateNamespaceW :: proc(lpBoundaryDescriptor: rawptr, lpAliasPrefix: PWSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-openprocess ]]
	OpenProcess :: proc(
		dwDesiredAccess: PROCESS_ACCESS_RIGHTS,
		bInheritHandle: BOOL,
		dwProcessId: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-opensemaphorew ]]
	OpenSemaphoreW :: proc(
		dwDesiredAccess: SYNCHRONIZATION_ACCESS_RIGHTS,
		bInheritHandle: BOOL,
		lpName: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-openthread ]]
	OpenThread :: proc(
		dwDesiredAccess: THREAD_ACCESS_RIGHTS,
		bInheritHandle: BOOL,
		dwThreadId: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openwaitabletimerw ]]
	OpenWaitableTimerA :: proc(dwDesiredAccess: u32, bInheritHandle: BOOL, lpTimerName: PSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-openwaitabletimerw ]]
	OpenWaitableTimerW :: proc(
		dwDesiredAccess: SYNCHRONIZATION_ACCESS_RIGHTS,
		bInheritHandle: BOOL,
		lpTimerName: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-pulseevent ]]
	PulseEvent :: proc(hEvent: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-queryfullprocessimagenamea ]]
	QueryFullProcessImageNameA :: proc(hProcess: HANDLE, dwFlags: PROCESS_NAME_FORMAT, lpExeName: PSTR, lpdwSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-queryfullprocessimagenamew ]]
	QueryFullProcessImageNameW :: proc(hProcess: HANDLE, dwFlags: PROCESS_NAME_FORMAT, lpExeName: PWSTR, lpdwSize: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-queryprocessaffinityupdatemode ]]
	QueryProcessAffinityUpdateMode :: proc(hProcess: HANDLE, lpdwFlags: ^PROCESS_AFFINITY_AUTO_UPDATE_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-queryprotectedpolicy ]]
	QueryProtectedPolicy :: proc(#by_ptr PolicyGuid: GUID, PolicyValue: ^uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-querythreadpoolstackinformation ]]
	QueryThreadpoolStackInformation :: proc(ptpp: PTP_POOL, ptpsi: ^TP_POOL_STACK_INFORMATION) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-queryumsthreadinformation ]]
	QueryUmsThreadInformation :: proc(
		UmsThread: rawptr,
		UmsThreadInfoClass: UMS_THREAD_INFO_CLASS,
		UmsThreadInformation: rawptr,
		UmsThreadInformationLength: u32,
		ReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-queueuserapc ]]
	QueueUserAPC :: proc(pfnAPC: PAPCFUNC, hThread: HANDLE, dwData: uintptr) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-queueuserapc2 ]]
	QueueUserAPC2 :: proc(ApcRoutine: PAPCFUNC, Thread: HANDLE, Data: uintptr, Flags: QUEUE_USER_APC_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoollegacyapiset/nf-threadpoollegacyapiset-queueuserworkitem ]]
	QueueUserWorkItem :: proc(Function: LPTHREAD_START_ROUTINE, Context: rawptr, Flags: WORKER_THREAD_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-registerwaitforsingleobject ]]
	RegisterWaitForSingleObject :: proc(
		phNewWaitObject: ^HANDLE,
		hObject: HANDLE,
		Callback: WAITORTIMERCALLBACK,
		Context: rawptr,
		dwMilliseconds: u32,
		dwFlags: WORKER_THREAD_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-releasemutex ]]
	ReleaseMutex :: proc(hMutex: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-releasemutexwhencallbackreturns ]]
	ReleaseMutexWhenCallbackReturns :: proc(pci: PTP_CALLBACK_INSTANCE, mut: HANDLE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-releasesemaphore ]]
	ReleaseSemaphore :: proc(hSemaphore: HANDLE, lReleaseCount: i32, lpPreviousCount: ^i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-releasesemaphorewhencallbackreturns ]]
	ReleaseSemaphoreWhenCallbackReturns :: proc(pci: PTP_CALLBACK_INSTANCE, sem: HANDLE, crel: u32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-releasesrwlockexclusive ]]
	ReleaseSRWLockExclusive :: proc(SRWLock: ^SRWLOCK) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-releasesrwlockshared ]]
	ReleaseSRWLockShared :: proc(SRWLock: ^SRWLOCK) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-resetevent ]]
	ResetEvent :: proc(hEvent: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-resumethread ]]
	ResumeThread :: proc(hThread: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-setcriticalsectionspincount ]]
	SetCriticalSectionSpinCount :: proc(lpCriticalSection: ^CRITICAL_SECTION, dwSpinCount: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-setevent ]]
	SetEvent :: proc(hEvent: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-seteventwhencallbackreturns ]]
	SetEventWhenCallbackReturns :: proc(pci: PTP_CALLBACK_INSTANCE, evt: HANDLE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setpriorityclass ]]
	SetPriorityClass :: proc(hProcess: HANDLE, dwPriorityClass: PROCESS_CREATION_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setprocessaffinitymask ]]
	SetProcessAffinityMask :: proc(hProcess: HANDLE, dwProcessAffinityMask: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessaffinityupdatemode ]]
	SetProcessAffinityUpdateMode :: proc(hProcess: HANDLE, dwFlags: PROCESS_AFFINITY_AUTO_UPDATE_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessdefaultcpusetmasks ]]
	SetProcessDefaultCpuSetMasks :: proc(Process: HANDLE, CpuSetMasks: [^]GROUP_AFFINITY, CpuSetMaskCount: u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessdefaultcpusets ]]
	SetProcessDefaultCpuSets :: proc(Process: HANDLE, CpuSetIds: [^]u32, CpuSetIdCount: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setprocessdeppolicy ]]
	SetProcessDEPPolicy :: proc(dwFlags: PROCESS_DEP_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessdynamicehcontinuationtargets ]]
	SetProcessDynamicEHContinuationTargets :: proc(
		Process: HANDLE,
		NumberOfTargets: u16,
		Targets: [^]PROCESS_DYNAMIC_EH_CONTINUATION_TARGET,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessdynamicenforcedcetcompatibleranges ]]
	SetProcessDynamicEnforcedCetCompatibleRanges :: proc(
		Process: HANDLE,
		NumberOfRanges: u16,
		Ranges: [^]PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessinformation ]]
	SetProcessInformation :: proc(
		hProcess: HANDLE,
		ProcessInformationClass: PROCESS_INFORMATION_CLASS,
		ProcessInformation: rawptr,
		ProcessInformationSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessmitigationpolicy ]]
	SetProcessMitigationPolicy :: proc(
		MitigationPolicy: PROCESS_MITIGATION_POLICY,
		lpBuffer: rawptr,
		dwLength: uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocesspriorityboost ]]
	SetProcessPriorityBoost :: proc(hProcess: HANDLE, bDisablePriorityBoost: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprocessshutdownparameters ]]
	SetProcessShutdownParameters :: proc(dwLevel: u32, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsize ]]
	SetProcessWorkingSetSize :: proc(
		hProcess: HANDLE,
		dwMinimumWorkingSetSize: uintptr,
		dwMaximumWorkingSetSize: uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setprotectedpolicy ]]
	SetProtectedPolicy :: proc(#by_ptr PolicyGuid: GUID, PolicyValue: uintptr, OldPolicyValue: ^uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setthreadaffinitymask ]]
	SetThreadAffinityMask :: proc(hThread: HANDLE, dwThreadAffinityMask: uintptr) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreaddescription ]]
	SetThreadDescription :: proc(hThread: HANDLE, lpThreadDescription: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processtopologyapi/nf-processtopologyapi-setthreadgroupaffinity ]]
	SetThreadGroupAffinity :: proc(
		hThread: HANDLE,
		#by_ptr GroupAffinity: GROUP_AFFINITY,
		PreviousGroupAffinity: ^GROUP_AFFINITY,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadidealprocessor ]]
	SetThreadIdealProcessor :: proc(hThread: HANDLE, dwIdealProcessor: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadidealprocessorex ]]
	SetThreadIdealProcessorEx :: proc(
		hThread: HANDLE,
		lpIdealProcessor: ^PROCESSOR_NUMBER,
		lpPreviousIdealProcessor: ^PROCESSOR_NUMBER,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadinformation ]]
	SetThreadInformation :: proc(
		hThread: HANDLE,
		ThreadInformationClass: THREAD_INFORMATION_CLASS,
		ThreadInformation: rawptr,
		ThreadInformationSize: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolstackinformation ]]
	SetThreadpoolStackInformation :: proc(ptpp: PTP_POOL, ptpsi: ^TP_POOL_STACK_INFORMATION) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolthreadmaximum ]]
	SetThreadpoolThreadMaximum :: proc(ptpp: PTP_POOL, cthrdMost: u32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolthreadminimum ]]
	SetThreadpoolThreadMinimum :: proc(ptpp: PTP_POOL, cthrdMic: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-setthreadpooltimer ]]
	SetThreadpoolTimer :: proc(pti: PTP_TIMER, pftDueTime: ^FILETIME, msPeriod: u32, msWindowLength: u32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-setthreadpooltimerex ]]
	SetThreadpoolTimerEx :: proc(pti: PTP_TIMER, pftDueTime: ^FILETIME, msPeriod: u32, msWindowLength: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwait ]]
	SetThreadpoolWait :: proc(pwa: PTP_WAIT, h: HANDLE, pftTimeout: ^FILETIME) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-setthreadpoolwaitex ]]
	SetThreadpoolWaitEx :: proc(pwa: PTP_WAIT, h: HANDLE, pftTimeout: ^FILETIME, Reserved: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadpriority ]]
	SetThreadPriority :: proc(hThread: HANDLE, nPriority: THREAD_PRIORITY) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadpriorityboost ]]
	SetThreadPriorityBoost :: proc(hThread: HANDLE, bDisablePriorityBoost: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadselectedcpusetmasks ]]
	SetThreadSelectedCpuSetMasks :: proc(Thread: HANDLE, CpuSetMasks: [^]GROUP_AFFINITY, CpuSetMaskCount: u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadselectedcpusets ]]
	SetThreadSelectedCpuSets :: proc(Thread: HANDLE, CpuSetIds: [^]u32, CpuSetIdCount: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setthreadstackguarantee ]]
	SetThreadStackGuarantee :: proc(StackSizeInBytes: ^u32) -> BOOL ---

	SetTimerQueueTimer :: proc(
		TimerQueue: HANDLE,
		Callback: WAITORTIMERCALLBACK,
		Parameter: rawptr,
		DueTime: u32,
		Period: u32,
		PreferIo: BOOL,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setumsthreadinformation ]]
	SetUmsThreadInformation :: proc(
		UmsThread: rawptr,
		UmsThreadInfoClass: UMS_THREAD_INFO_CLASS,
		UmsThreadInformation: rawptr,
		UmsThreadInformationLength: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-setwaitabletimer ]]
	SetWaitableTimer :: proc(
		hTimer: HANDLE,
		lpDueTime: ^i64,
		lPeriod: i32,
		pfnCompletionRoutine: PTIMERAPCROUTINE,
		lpArgToCompletionRoutine: rawptr,
		fResume: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-setwaitabletimerex ]]
	SetWaitableTimerEx :: proc(
		hTimer: HANDLE,
		lpDueTime: ^i64,
		lPeriod: i32,
		pfnCompletionRoutine: PTIMERAPCROUTINE,
		lpArgToCompletionRoutine: rawptr,
		WakeContext: ^REASON_CONTEXT,
		TolerableDelay: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-signalobjectandwait ]]
	SignalObjectAndWait :: proc(
		hObjectToSignal: HANDLE,
		hObjectToWaitOn: HANDLE,
		dwMilliseconds: u32,
		bAlertable: BOOL,
	) -> WAIT_EVENT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-sleep ]]
	Sleep :: proc(dwMilliseconds: u32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-sleepconditionvariablecs ]]
	SleepConditionVariableCS :: proc(
		ConditionVariable: ^CONDITION_VARIABLE,
		CriticalSection: ^CRITICAL_SECTION,
		dwMilliseconds: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-sleepconditionvariablesrw ]]
	SleepConditionVariableSRW :: proc(
		ConditionVariable: ^CONDITION_VARIABLE,
		SRWLock: ^SRWLOCK,
		dwMilliseconds: u32,
		Flags: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-sleepex ]]
	SleepEx :: proc(dwMilliseconds: u32, bAlertable: BOOL) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-startthreadpoolio ]]
	StartThreadpoolIo :: proc(pio: PTP_IO) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-submitthreadpoolwork ]]
	SubmitThreadpoolWork :: proc(pwk: PTP_WORK) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-suspendthread ]]
	SuspendThread :: proc(hThread: HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-switchtofiber ]]
	SwitchToFiber :: proc(lpFiber: rawptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-switchtothread ]]
	SwitchToThread :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-terminateprocess ]]
	TerminateProcess :: proc(hProcess: HANDLE, uExitCode: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-terminatethread ]]
	TerminateThread :: proc(hThread: HANDLE, dwExitCode: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-tlsalloc ]]
	TlsAlloc :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-tlsfree ]]
	TlsFree :: proc(dwTlsIndex: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-tlsgetvalue ]]
	TlsGetValue :: proc(dwTlsIndex: u32) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-tlssetvalue ]]
	TlsSetValue :: proc(dwTlsIndex: u32, lpTlsValue: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-tryacquiresrwlockexclusive ]]
	TryAcquireSRWLockExclusive :: proc(SRWLock: ^SRWLOCK) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-tryacquiresrwlockshared ]]
	TryAcquireSRWLockShared :: proc(SRWLock: ^SRWLOCK) -> BOOLEAN ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-tryentercriticalsection ]]
	TryEnterCriticalSection :: proc(lpCriticalSection: ^CRITICAL_SECTION) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-trysubmitthreadpoolcallback ]]
	TrySubmitThreadpoolCallback :: proc(pfns: PTP_SIMPLE_CALLBACK, pv: rawptr, pcbe: ^TP_CALLBACK_ENVIRON_V3) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-umsthreadyield ]]
	UmsThreadYield :: proc(SchedulerParam: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-unregisterwait ]]
	UnregisterWait :: proc(WaitHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/Sync/unregisterwaitex ]]
	UnregisterWaitEx :: proc(WaitHandle: HANDLE, CompletionEvent: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-updateprocthreadattribute ]]
	UpdateProcThreadAttribute :: proc(
		lpAttributeList: LPPROC_THREAD_ATTRIBUTE_LIST,
		dwFlags: u32,
		Attribute: uintptr,
		lpValue: rawptr,
		cbSize: uintptr,
		lpPreviousValue: rawptr,
		lpReturnSize: ^uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-waitformultipleobjects ]]
	WaitForMultipleObjects :: proc(nCount: u32, lpHandles: [^]HANDLE, bWaitAll: BOOL, dwMilliseconds: u32) -> WAIT_EVENT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-waitformultipleobjectsex ]]
	WaitForMultipleObjectsEx :: proc(
		nCount: u32,
		lpHandles: [^]HANDLE,
		bWaitAll: BOOL,
		dwMilliseconds: u32,
		bAlertable: BOOL,
	) -> WAIT_EVENT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-waitforsingleobject ]]
	WaitForSingleObject :: proc(hHandle: HANDLE, dwMilliseconds: u32) -> WAIT_EVENT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-waitforsingleobjectex ]]
	WaitForSingleObjectEx :: proc(hHandle: HANDLE, dwMilliseconds: u32, bAlertable: BOOL) -> WAIT_EVENT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpooliocallbacks ]]
	WaitForThreadpoolIoCallbacks :: proc(pio: PTP_IO, fCancelPendingCallbacks: BOOL) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpooltimercallbacks ]]
	WaitForThreadpoolTimerCallbacks :: proc(pti: PTP_TIMER, fCancelPendingCallbacks: BOOL) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolwaitcallbacks ]]
	WaitForThreadpoolWaitCallbacks :: proc(pwa: PTP_WAIT, fCancelPendingCallbacks: BOOL) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/threadpoolapiset/nf-threadpoolapiset-waitforthreadpoolworkcallbacks ]]
	WaitForThreadpoolWorkCallbacks :: proc(pwk: PTP_WORK, fCancelPendingCallbacks: BOOL) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-wakeallconditionvariable ]]
	WakeAllConditionVariable :: proc(ConditionVariable: ^CONDITION_VARIABLE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-wakeconditionvariable ]]
	WakeConditionVariable :: proc(ConditionVariable: ^CONDITION_VARIABLE) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-winexec ]]
	WinExec :: proc(lpCmdLine: PSTR, uCmdShow: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-wow64suspendthread ]]
	Wow64SuspendThread :: proc(hThread: HANDLE) -> u32 ---
}

@(default_calling_convention="system")
foreign oleacc {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/WinAuto/getprocesshandlefromhwnd ]]
	GetProcessHandleFromHwnd :: proc(hwnd: HWND) -> HANDLE ---
}

@(default_calling_convention="system")
foreign onecore {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wow64apiset/nf-wow64apiset-wow64setthreaddefaultguestmachine ]]
	Wow64SetThreadDefaultGuestMachine :: proc(Machine: u16) -> u16 ---
}

@(default_calling_convention="system")
foreign rtworkq {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqaddperiodiccallback ]]
	RtwqAddPeriodicCallback :: proc(Callback: RTWQPERIODICCALLBACK, _context: ^IUnknown, key: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqallocateserialworkqueue ]]
	RtwqAllocateSerialWorkQueue :: proc(workQueueIdIn: u32, workQueueIdOut: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqallocateworkqueue ]]
	RtwqAllocateWorkQueue :: proc(WorkQueueType: RTWQ_WORKQUEUE_TYPE, workQueueId: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqbeginregisterworkqueuewithmmcss ]]
	RtwqBeginRegisterWorkQueueWithMMCSS :: proc(
		workQueueId: u32,
		usageClass: PWSTR,
		dwTaskId: u32,
		lPriority: i32,
		doneCallback: ^IRtwqAsyncCallback,
		doneState: ^IUnknown,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqbeginunregisterworkqueuewithmmcss ]]
	RtwqBeginUnregisterWorkQueueWithMMCSS :: proc(workQueueId: u32, doneCallback: ^IRtwqAsyncCallback, doneState: ^IUnknown) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqcanceldeadline ]]
	RtwqCancelDeadline :: proc(pRequest: HANDLE) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqcancelworkitem ]]
	RtwqCancelWorkItem :: proc(Key: u64) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqcreateasyncresult ]]
	RtwqCreateAsyncResult :: proc(
		appObject: ^IUnknown,
		callback: ^IRtwqAsyncCallback,
		appState: ^IUnknown,
		asyncResult: ^^IRtwqAsyncResult,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqendregisterworkqueuewithmmcss ]]
	RtwqEndRegisterWorkQueueWithMMCSS :: proc(result: ^IRtwqAsyncResult, taskId: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqgetworkqueuemmcssclass ]]
	RtwqGetWorkQueueMMCSSClass :: proc(workQueueId: u32, usageClass: PWSTR, usageClassLength: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqgetworkqueuemmcsspriority ]]
	RtwqGetWorkQueueMMCSSPriority :: proc(workQueueId: u32, priority: ^i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqgetworkqueuemmcsstaskid ]]
	RtwqGetWorkQueueMMCSSTaskId :: proc(workQueueId: u32, taskId: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqinvokecallback ]]
	RtwqInvokeCallback :: proc(result: ^IRtwqAsyncResult) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqjoinworkqueue ]]
	RtwqJoinWorkQueue :: proc(workQueueId: u32, hFile: HANDLE, out: ^HANDLE) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqlockplatform ]]
	RtwqLockPlatform :: proc() -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqlocksharedworkqueue ]]
	RtwqLockSharedWorkQueue :: proc(usageClass: PWSTR, basePriority: i32, taskId: ^u32, id: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqlockworkqueue ]]
	RtwqLockWorkQueue :: proc(workQueueId: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqputwaitingworkitem ]]
	RtwqPutWaitingWorkItem :: proc(hEvent: HANDLE, lPriority: i32, result: ^IRtwqAsyncResult, key: ^u64) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqputworkitem ]]
	RtwqPutWorkItem :: proc(dwQueue: u32, lPriority: i32, result: ^IRtwqAsyncResult) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqregisterplatformevents ]]
	RtwqRegisterPlatformEvents :: proc(platformEvents: ^IRtwqPlatformEvents) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqregisterplatformwithmmcss ]]
	RtwqRegisterPlatformWithMMCSS :: proc(usageClass: PWSTR, taskId: ^u32, lPriority: i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqremoveperiodiccallback ]]
	RtwqRemovePeriodicCallback :: proc(dwKey: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqscheduleworkitem ]]
	RtwqScheduleWorkItem :: proc(result: ^IRtwqAsyncResult, Timeout: i64, key: ^u64) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqsetdeadline ]]
	RtwqSetDeadline :: proc(workQueueId: u32, deadlineInHNS: i64, pRequest: ^HANDLE) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqsetdeadline2 ]]
	RtwqSetDeadline2 :: proc(workQueueId: u32, deadlineInHNS: i64, preDeadlineInHNS: i64, pRequest: ^HANDLE) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqsetlongrunning ]]
	RtwqSetLongRunning :: proc(workQueueId: u32, enable: BOOL) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqshutdown ]]
	RtwqShutdown :: proc() -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqstartup ]]
	RtwqStartup :: proc() -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqunjoinworkqueue ]]
	RtwqUnjoinWorkQueue :: proc(workQueueId: u32, hFile: HANDLE) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqunlockplatform ]]
	RtwqUnlockPlatform :: proc() -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqunlockworkqueue ]]
	RtwqUnlockWorkQueue :: proc(workQueueId: u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqunregisterplatformevents ]]
	RtwqUnregisterPlatformEvents :: proc(platformEvents: ^IRtwqPlatformEvents) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nf-rtworkq-rtwqunregisterplatformfrommmcss ]]
	RtwqUnregisterPlatformFromMMCSS :: proc() -> HRESULT ---
}

@(default_calling_convention="system")
foreign synchronization {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-waitonaddress ]]
	WaitOnAddress :: proc(
		Address: rawptr,
		CompareAddress: rawptr,
		AddressSize: uintptr,
		dwMilliseconds: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-wakebyaddressall ]]
	WakeByAddressAll :: proc(Address: rawptr) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/synchapi/nf-synchapi-wakebyaddresssingle ]]
	WakeByAddressSingle :: proc(Address: rawptr) ---
}

@(default_calling_convention="system")
foreign user32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-attachthreadinput ]]
	AttachThreadInput :: proc(idAttach: u32, idAttachTo: u32, fAttach: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getguiresources ]]
	GetGuiResources :: proc(hProcess: HANDLE, uiFlags: GET_GUI_RESOURCES_FLAGS) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-isimmersiveprocess ]]
	IsImmersiveProcess :: proc(hProcess: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setprocessrestrictionexemption ]]
	SetProcessRestrictionExemption :: proc(fEnableExemption: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-waitforinputidle ]]
	WaitForInputIdle :: proc(hProcess: HANDLE, dwMilliseconds: u32) -> u32 ---
}

GetCurrentProcessToken :: #force_inline proc "system" () -> HANDLE {
	return HANDLE(transmute(uintptr)(int(-4)))
}

GetCurrentThreadToken :: #force_inline proc "system" () -> HANDLE {
	return HANDLE(transmute(uintptr)(int(-5)))
}

GetCurrentThreadEffectiveToken :: #force_inline proc "system" () -> HANDLE {
	return HANDLE(transmute(uintptr)(int(-6)))
}

APC_CALLBACK_FUNCTION :: #type proc "system" (param0: u32, param1: rawptr, param2: rawptr)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-app_memory_information ]]
APP_MEMORY_INFORMATION :: struct {
	AvailableCommit: u64,
	PrivateCommitUsage: u64,
	PeakPrivateCommitUsage: u64,
	TotalCommitUsage: u64,
}

AVRT_PRIORITY :: enum i32 {
	VERYLOW = -2,
	LOW = -1,
	NORMAL = 0,
	HIGH = 1,
	CRITICAL = 2,
}

CONDITION_VARIABLE :: struct {
	Ptr: rawptr,
}

CREATE_EVENT :: distinct bit_set[enum {
	INITIAL_SET = 1,
	MANUAL_RESET = 0,
}; u32]

CREATE_PROCESS_LOGON_FLAGS :: enum u32 {
	WITH_PROFILE = 0x00000001,
	NETCREDENTIALS_ONLY = 0x00000002,
}

CRITICAL_SECTION :: struct {
	DebugInfo: ^CRITICAL_SECTION_DEBUG,
	LockCount: i32,
	RecursionCount: i32,
	OwningThread: HANDLE,
	LockSemaphore: HANDLE,
	SpinCount: uintptr,
}

CRITICAL_SECTION_DEBUG :: struct {
	Type: u16,
	CreatorBackTraceIndex: u16,
	CriticalSection: ^CRITICAL_SECTION,
	ProcessLocksList: LIST_ENTRY,
	EntryCount: u32,
	ContentionCount: u32,
	Flags: u32,
	CreatorBackTraceIndexHigh: u16,
	Identifier: u16,
}

GET_GUI_RESOURCES_FLAGS :: enum u32 {
	GLOBAL = 0xFFFFFFFE,
	GDIOBJECTS = 0x00000000,
	GDIOBJECTS_PEAK = 0x00000002,
	USEROBJECTS = 0x00000001,
	USEROBJECTS_PEAK = 0x00000004,
}

INIT_ONCE :: struct #raw_union {
	Ptr: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-io_counters ]]
IO_COUNTERS :: struct {
	ReadOperationCount: u64,
	WriteOperationCount: u64,
	OtherOperationCount: u64,
	ReadTransferCount: u64,
	WriteTransferCount: u64,
	OtherTransferCount: u64,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nn-rtworkq-irtwqasynccallback ]]
IRtwqAsyncCallback :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRtwqAsyncCallback_Vtbl,
}
IRtwqAsyncCallback_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetParameters: proc "system" (this: ^IRtwqAsyncCallback, pdwFlags: ^u32, pdwQueue: ^u32) -> HRESULT,
	Invoke: proc "system" (this: ^IRtwqAsyncCallback, pAsyncResult: ^IRtwqAsyncResult) -> HRESULT,
}
IID_IRtwqAsyncCallback :: GUID{0xA27003CF, 0x2354, 0x4F2A, {0x8D, 0x6A, 0xAB, 0x7C, 0xFF, 0x15, 0x43, 0x7E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nn-rtworkq-irtwqasyncresult ]]
IRtwqAsyncResult :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRtwqAsyncResult_Vtbl,
}
IRtwqAsyncResult_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetState: proc "system" (this: ^IRtwqAsyncResult, ppunkState: ^^IUnknown) -> HRESULT,
	GetStatus: proc "system" (this: ^IRtwqAsyncResult) -> HRESULT,
	SetStatus: proc "system" (this: ^IRtwqAsyncResult, hrStatus: HRESULT) -> HRESULT,
	GetObject: proc "system" (this: ^IRtwqAsyncResult, ppObject: ^^IUnknown) -> HRESULT,
	GetStateNoAddRef: proc "system" (this: ^IRtwqAsyncResult) -> ^IUnknown,
}
IID_IRtwqAsyncResult :: GUID{0xAC6B7889, 0x0740, 0x4D51, {0x86, 0x19, 0x90, 0x59, 0x94, 0xA5, 0x5C, 0xC6}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/nn-rtworkq-irtwqplatformevents ]]
IRtwqPlatformEvents :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRtwqPlatformEvents_Vtbl,
}
IRtwqPlatformEvents_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	InitializationComplete: proc "system" (this: ^IRtwqPlatformEvents) -> HRESULT,
	ShutdownStart: proc "system" (this: ^IRtwqPlatformEvents) -> HRESULT,
	ShutdownComplete: proc "system" (this: ^IRtwqPlatformEvents) -> HRESULT,
}
IID_IRtwqPlatformEvents :: GUID{0x63D9255A, 0x7FF1, 0x4B61, {0x8F, 0xAF, 0xED, 0x64, 0x60, 0xDA, 0xCF, 0x2B}}

LPFIBER_START_ROUTINE :: #type proc "system" (lpFiberParameter: rawptr)

LPPROC_THREAD_ATTRIBUTE_LIST :: rawptr

LPTHREAD_START_ROUTINE :: #type proc "system" (lpThreadParameter: rawptr) -> u32

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-machine_attributes ]]
MACHINE_ATTRIBUTES :: distinct bit_set[enum {
	UserEnabled = 0,
	KernelEnabled = 1,
	Wow64Container = 2,
}; i32]

MEMORY_PRIORITY :: enum u32 {
	VERY_LOW = 0x00000001,
	LOW = 0x00000002,
	MEDIUM = 0x00000003,
	BELOW_NORMAL = 0x00000004,
	NORMAL = 0x00000005,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-memory_priority_information ]]
MEMORY_PRIORITY_INFORMATION :: struct {
	MemoryPriority: MEMORY_PRIORITY,
}

OVERRIDE_PREFETCH_PARAMETER :: struct {
	Value: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-peb ]]
PEB :: struct {
	Reserved1: [2]u8,
	BeingDebugged: u8,
	Reserved2: [1]u8,
	Reserved3: [2]rawptr,
	Ldr: ^PEB_LDR_DATA,
	ProcessParameters: ^RTL_USER_PROCESS_PARAMETERS,
	Reserved4: [3]rawptr,
	AtlThunkSListPtr: rawptr,
	Reserved5: rawptr,
	Reserved6: u32,
	Reserved7: rawptr,
	Reserved8: u32,
	AtlThunkSListPtr32: u32,
	Reserved9: [45]rawptr,
	Reserved10: [96]u8,
	PostProcessInitRoutine: PPS_POST_PROCESS_INIT_ROUTINE,
	Reserved11: [128]u8,
	Reserved12: [1]rawptr,
	SessionId: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-peb_ldr_data ]]
PEB_LDR_DATA :: struct {
	Reserved1: [8]u8,
	Reserved2: [3]rawptr,
	InMemoryOrderModuleList: LIST_ENTRY,
}

PFLS_CALLBACK_FUNCTION :: #type proc "system" (lpFlsData: rawptr)

PINIT_ONCE_FN :: #type proc "system" (InitOnce: ^INIT_ONCE, Parameter: rawptr, Context: rawptr) -> BOOL

POWER_REQUEST_CONTEXT_FLAGS :: enum u32 {
	DETAILED_STRING = 0x00000002,
	SIMPLE_STRING = 0x00000001,
}

PPS_POST_PROCESS_INIT_ROUTINE :: #type proc "system" ()

PROC_THREAD_ATTRIBUTE_NUM :: enum u32 {
	ParentProcess = 0x00000000,
	HandleList = 0x00000002,
	GroupAffinity = 0x00000003,
	PreferredNode = 0x00000004,
	IdealProcessor = 0x00000005,
	UmsThread = 0x00000006,
	MitigationPolicy = 0x00000007,
	SecurityCapabilities = 0x00000009,
	ProtectionLevel = 0x0000000B,
	JobList = 0x0000000D,
	ChildProcessPolicy = 0x0000000E,
	AllApplicationPackagesPolicy = 0x0000000F,
	Win32kFilter = 0x00000010,
	SafeOpenPromptOriginClaim = 0x00000011,
	DesktopAppPolicy = 0x00000012,
	PseudoConsole = 0x00000016,
	MitigationAuditPolicy = 0x00000018,
	MachineType = 0x00000019,
	ComponentFilter = 0x0000001A,
	EnableOptionalXStateFeatures = 0x0000001B,
	TrustedApp = 0x0000001D,
}

PROCESS_ACCESS_RIGHTS :: distinct bit_set[enum {
	TERMINATE = 0,
	CREATE_THREAD = 1,
	SET_SESSIONID = 2,
	VM_OPERATION = 3,
	VM_READ = 4,
	VM_WRITE = 5,
	DUP_HANDLE = 6,
	CREATE_PROCESS = 7,
	SET_QUOTA = 8,
	SET_INFORMATION = 9,
	QUERY_INFORMATION = 10,
	SUSPEND_RESUME = 11,
	QUERY_LIMITED_INFORMATION = 12,
	SET_LIMITED_INFORMATION = 13,
	DELETE = 16,
	READ_CONTROL = 17,
	WRITE_DAC = 18,
	WRITE_OWNER = 19,
	SYNCHRONIZE = 20,
}; u32]
PROCESS_ACCESS_RIGHTS_ALL_ACCESS :: transmute(PROCESS_ACCESS_RIGHTS)u32(0x001FFFFF)
PROCESS_ACCESS_RIGHTS_STANDARD_RIGHTS_REQUIRED :: transmute(PROCESS_ACCESS_RIGHTS)u32(0x000F0000)

PROCESS_AFFINITY_AUTO_UPDATE_FLAGS :: enum u32 {
	DISABLE_AUTO_UPDATE = 0x00000000,
	ENABLE_AUTO_UPDATE = 0x00000001,
}

PROCESS_BASIC_INFORMATION :: struct {
	ExitStatus: NTSTATUS,
	PebBaseAddress: ^PEB,
	AffinityMask: uintptr,
	BasePriority: i32,
	UniqueProcessId: uintptr,
	InheritedFromUniqueProcessId: uintptr,
}

PROCESS_CREATION_FLAGS :: distinct bit_set[enum {
	DEBUG_PROCESS = 0,
	DEBUG_ONLY_THIS_PROCESS = 1,
	CREATE_SUSPENDED = 2,
	DETACHED_PROCESS = 3,
	CREATE_NEW_CONSOLE = 4,
	NORMAL_PRIORITY_CLASS = 5,
	IDLE_PRIORITY_CLASS = 6,
	HIGH_PRIORITY_CLASS = 7,
	REALTIME_PRIORITY_CLASS = 8,
	CREATE_NEW_PROCESS_GROUP = 9,
	CREATE_UNICODE_ENVIRONMENT = 10,
	CREATE_SEPARATE_WOW_VDM = 11,
	CREATE_SHARED_WOW_VDM = 12,
	CREATE_FORCEDOS = 13,
	BELOW_NORMAL_PRIORITY_CLASS = 14,
	ABOVE_NORMAL_PRIORITY_CLASS = 15,
	INHERIT_PARENT_AFFINITY = 16,
	INHERIT_CALLER_PRIORITY = 17,
	CREATE_PROTECTED_PROCESS = 18,
	EXTENDED_STARTUPINFO_PRESENT = 19,
	PROCESS_MODE_BACKGROUND_BEGIN = 20,
	PROCESS_MODE_BACKGROUND_END = 21,
	CREATE_SECURE_PROCESS = 22,
	CREATE_BREAKAWAY_FROM_JOB = 24,
	CREATE_PRESERVE_CODE_AUTHZ_LEVEL = 25,
	CREATE_DEFAULT_ERROR_MODE = 26,
	CREATE_NO_WINDOW = 27,
	PROFILE_USER = 28,
	PROFILE_KERNEL = 29,
	PROFILE_SERVER = 30,
	CREATE_IGNORE_SYSTEM_DEFAULT = 31,
}; u32]

PROCESS_DEP_FLAGS :: distinct bit_set[enum {
	ENABLE = 0,
	DISABLE_ATL_THUNK_EMULATION = 1,
}; u32]
PROCESS_DEP_FLAGS_NONE :: transmute(PROCESS_DEP_FLAGS)u32(0x00000000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_dynamic_eh_continuation_target ]]
PROCESS_DYNAMIC_EH_CONTINUATION_TARGET :: struct {
	TargetAddress: uintptr,
	Flags: uintptr,
}

PROCESS_DYNAMIC_EH_CONTINUATION_TARGETS_INFORMATION :: struct {
	NumberOfTargets: u16,
	Reserved: u16,
	Reserved2: u32,
	Targets: ^PROCESS_DYNAMIC_EH_CONTINUATION_TARGET,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-process_dynamic_enforced_address_range ]]
PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE :: struct {
	BaseAddress: uintptr,
	Size: uintptr,
	Flags: u32,
}

PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGES_INFORMATION :: struct {
	NumberOfRanges: u16,
	Reserved: u16,
	Reserved2: u32,
	Ranges: ^PROCESS_DYNAMIC_ENFORCED_ADDRESS_RANGE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_information ]]
PROCESS_INFORMATION :: struct {
	hProcess: HANDLE,
	hThread: HANDLE,
	dwProcessId: u32,
	dwThreadId: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-process_information_class ]]
PROCESS_INFORMATION_CLASS :: enum i32 {
	MemoryPriority = 0,
	MemoryExhaustionInfo = 1,
	AppMemoryInfo = 2,
	InPrivateInfo = 3,
	PowerThrottling = 4,
	ReservedValue1 = 5,
	TelemetryCoverageInfo = 6,
	ProtectionLevelInfo = 7,
	LeapSecondInfo = 8,
	MachineTypeInfo = 9,
	OverrideSubsequentPrefetchParameter = 10,
	MaxOverridePrefetchParameter = 11,
	InformationClassMax = 12,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_leap_second_info ]]
PROCESS_LEAP_SECOND_INFO :: struct {
	Flags: u32,
	Reserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_machine_information ]]
PROCESS_MACHINE_INFORMATION :: struct {
	ProcessMachine: IMAGE_FILE_MACHINE,
	Res0: u16,
	MachineAttributes: MACHINE_ATTRIBUTES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_memory_exhaustion_info ]]
PROCESS_MEMORY_EXHAUSTION_INFO :: struct {
	Version: u16,
	Reserved: u16,
	Type: PROCESS_MEMORY_EXHAUSTION_TYPE,
	Value: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-process_memory_exhaustion_type ]]
PROCESS_MEMORY_EXHAUSTION_TYPE :: enum i32 {
	FailFastOnCommitFailure = 0,
	Max = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-process_mitigation_policy ]]
PROCESS_MITIGATION_POLICY :: enum i32 {
	ProcessDEPPolicy = 0,
	ProcessASLRPolicy = 1,
	ProcessDynamicCodePolicy = 2,
	ProcessStrictHandleCheckPolicy = 3,
	ProcessSystemCallDisablePolicy = 4,
	ProcessMitigationOptionsMask = 5,
	ProcessExtensionPointDisablePolicy = 6,
	ProcessControlFlowGuardPolicy = 7,
	ProcessSignaturePolicy = 8,
	ProcessFontDisablePolicy = 9,
	ProcessImageLoadPolicy = 10,
	ProcessSystemCallFilterPolicy = 11,
	ProcessPayloadRestrictionPolicy = 12,
	ProcessChildProcessPolicy = 13,
	ProcessSideChannelIsolationPolicy = 14,
	ProcessUserShadowStackPolicy = 15,
	ProcessRedirectionTrustPolicy = 16,
	ProcessUserPointerAuthPolicy = 17,
	ProcessSEHOPPolicy = 18,
	ProcessActivationContextTrustPolicy = 19,
	MaxProcessMitigationPolicy = 20,
}

PROCESS_NAME_FORMAT :: enum u32 {
	WIN32 = 0x00000000,
	NATIVE = 0x00000001,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_power_throttling_state ]]
PROCESS_POWER_THROTTLING_STATE :: struct {
	Version: u32,
	ControlMask: u32,
	StateMask: u32,
}

PROCESS_PROTECTION_LEVEL :: enum u32 {
	WINTCB_LIGHT = 0x00000000,
	WINDOWS = 0x00000001,
	WINDOWS_LIGHT = 0x00000002,
	ANTIMALWARE_LIGHT = 0x00000003,
	LSA_LIGHT = 0x00000004,
	WINTCB = 0x00000005,
	CODEGEN_LIGHT = 0x00000006,
	AUTHENTICODE = 0x00000007,
	PPL_APP = 0x00000008,
	NONE = 0xFFFFFFFE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_protection_level_information ]]
PROCESS_PROTECTION_LEVEL_INFORMATION :: struct {
	ProtectionLevel: PROCESS_PROTECTION_LEVEL,
}

PROCESSOR_FEATURE_ID :: enum u32 {
	FLOATING_POINT_PRECISION_ERRATA = 0x00000000,
	FLOATING_POINT_EMULATED = 0x00000001,
	COMPARE_EXCHANGE_DOUBLE = 0x00000002,
	MMX_INSTRUCTIONS_AVAILABLE = 0x00000003,
	PPC_MOVEMEM_64BIT_OK = 0x00000004,
	ALPHA_BYTE_INSTRUCTIONS = 0x00000005,
	XMMI_INSTRUCTIONS_AVAILABLE = 0x00000006,
	_3DNOW_INSTRUCTIONS_AVAILABLE = 0x00000007,
	RDTSC_INSTRUCTION_AVAILABLE = 0x00000008,
	PAE_ENABLED = 0x00000009,
	XMMI64_INSTRUCTIONS_AVAILABLE = 0x0000000A,
	SSE_DAZ_MODE_AVAILABLE = 0x0000000B,
	NX_ENABLED = 0x0000000C,
	SSE3_INSTRUCTIONS_AVAILABLE = 0x0000000D,
	COMPARE_EXCHANGE128 = 0x0000000E,
	COMPARE64_EXCHANGE128 = 0x0000000F,
	CHANNELS_ENABLED = 0x00000010,
	XSAVE_ENABLED = 0x00000011,
	ARM_VFP_32_REGISTERS_AVAILABLE = 0x00000012,
	ARM_NEON_INSTRUCTIONS_AVAILABLE = 0x00000013,
	SECOND_LEVEL_ADDRESS_TRANSLATION = 0x00000014,
	VIRT_FIRMWARE_ENABLED = 0x00000015,
	RDWRFSGSBASE_AVAILABLE = 0x00000016,
	FASTFAIL_AVAILABLE = 0x00000017,
	ARM_DIVIDE_INSTRUCTION_AVAILABLE = 0x00000018,
	ARM_64BIT_LOADSTORE_ATOMIC = 0x00000019,
	ARM_EXTERNAL_CACHE_AVAILABLE = 0x0000001A,
	ARM_FMAC_INSTRUCTIONS_AVAILABLE = 0x0000001B,
	RDRAND_INSTRUCTION_AVAILABLE = 0x0000001C,
	ARM_V8_INSTRUCTIONS_AVAILABLE = 0x0000001D,
	ARM_V8_CRYPTO_INSTRUCTIONS_AVAILABLE = 0x0000001E,
	ARM_V8_CRC32_INSTRUCTIONS_AVAILABLE = 0x0000001F,
	RDTSCP_INSTRUCTION_AVAILABLE = 0x00000020,
	RDPID_INSTRUCTION_AVAILABLE = 0x00000021,
	ARM_V81_ATOMIC_INSTRUCTIONS_AVAILABLE = 0x00000022,
	MONITORX_INSTRUCTION_AVAILABLE = 0x00000023,
	SSSE3_INSTRUCTIONS_AVAILABLE = 0x00000024,
	SSE4_1_INSTRUCTIONS_AVAILABLE = 0x00000025,
	SSE4_2_INSTRUCTIONS_AVAILABLE = 0x00000026,
	AVX_INSTRUCTIONS_AVAILABLE = 0x00000027,
	AVX2_INSTRUCTIONS_AVAILABLE = 0x00000028,
	AVX512F_INSTRUCTIONS_AVAILABLE = 0x00000029,
	ERMS_AVAILABLE = 0x0000002A,
	ARM_V82_DP_INSTRUCTIONS_AVAILABLE = 0x0000002B,
	ARM_V83_JSCVT_INSTRUCTIONS_AVAILABLE = 0x0000002C,
	ARM_V83_LRCPC_INSTRUCTIONS_AVAILABLE = 0x0000002D,
}

PRTL_UMS_SCHEDULER_ENTRY_POINT :: #type proc "system" (Reason: RTL_UMS_SCHEDULER_REASON, ActivationPayload: uintptr, SchedulerParam: rawptr)

PTIMERAPCROUTINE :: #type proc "system" (lpArgToCompletionRoutine: rawptr, dwTimerLowValue: u32, dwTimerHighValue: u32)

PTP_CALLBACK_INSTANCE :: int

PTP_CLEANUP_GROUP :: int

PTP_CLEANUP_GROUP_CANCEL_CALLBACK :: #type proc "system" (ObjectContext: rawptr, CleanupContext: rawptr)

PTP_IO :: int

PTP_POOL :: int

PTP_SIMPLE_CALLBACK :: #type proc "system" (Instance: PTP_CALLBACK_INSTANCE, Context: rawptr)

PTP_TIMER :: int

PTP_TIMER_CALLBACK :: #type proc "system" (Instance: PTP_CALLBACK_INSTANCE, Context: rawptr, Timer: PTP_TIMER)

PTP_WAIT :: int

PTP_WAIT_CALLBACK :: #type proc "system" (Instance: PTP_CALLBACK_INSTANCE, Context: rawptr, Wait: PTP_WAIT, WaitResult: u32)

PTP_WIN32_IO_CALLBACK :: #type proc "system" (
	Instance: PTP_CALLBACK_INSTANCE,
	Context: rawptr,
	Overlapped: rawptr,
	IoResult: u32,
	NumberOfBytesTransferred: uintptr,
	Io: PTP_IO,
)

PTP_WORK :: int

PTP_WORK_CALLBACK :: #type proc "system" (Instance: PTP_CALLBACK_INSTANCE, Context: rawptr, Work: PTP_WORK)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-queue_user_apc_flags ]]
QUEUE_USER_APC_FLAGS :: enum i32 {
	FLAGS_NONE = 0,
	FLAGS_SPECIAL_USER_APC = 1,
	CALLBACK_DATA_CONTEXT = 65536,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-reason_context ]]
REASON_CONTEXT :: struct {
	Version: u32,
	Flags: POWER_REQUEST_CONTEXT_FLAGS,
	Reason: struct #raw_union {
		Detailed: struct {
			LocalizedReasonModule: HMODULE,
			LocalizedReasonId: u32,
			ReasonStringCount: u32,
			ReasonStrings: ^PWSTR,
		},
		SimpleReasonString: PWSTR,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-rtl_user_process_parameters ]]
RTL_USER_PROCESS_PARAMETERS :: struct {
	Reserved1: [16]u8,
	Reserved2: [10]rawptr,
	ImagePathName: UNICODE_STRING,
	CommandLine: UNICODE_STRING,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/rtworkq/ne-rtworkq-rtwq_workqueue_type ]]
RTWQ_WORKQUEUE_TYPE :: enum i32 {
	STANDARD_WORKQUEUE = 0,
	WINDOW_WORKQUEUE = 1,
	MULTITHREADED_WORKQUEUE = 2,
}

RTWQASYNCRESULT :: struct #raw_union {
	#subtype IRtwqAsyncResult: IRtwqAsyncResult,
	using Vtbl: ^RTWQASYNCRESULT_Vtbl,
}
RTWQASYNCRESULT_Vtbl :: struct {
	using IRtwqAsyncResult_Vtbl: IRtwqAsyncResult_Vtbl,
}

RTWQPERIODICCALLBACK :: #type proc "system" (_context: ^IUnknown)

SRWLOCK :: struct {
	Ptr: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-startupinfoa ]]
STARTUPINFOA :: struct {
	cb: u32,
	lpReserved: PSTR,
	lpDesktop: PSTR,
	lpTitle: PSTR,
	dwX: u32,
	dwY: u32,
	dwXSize: u32,
	dwYSize: u32,
	dwXCountChars: u32,
	dwYCountChars: u32,
	dwFillAttribute: u32,
	dwFlags: STARTUPINFOW_FLAGS,
	wShowWindow: u16,
	cbReserved2: u16,
	lpReserved2: ^u8,
	hStdInput: HANDLE,
	hStdOutput: HANDLE,
	hStdError: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-startupinfoexa ]]
STARTUPINFOEXA :: struct {
	StartupInfo: STARTUPINFOA,
	lpAttributeList: LPPROC_THREAD_ATTRIBUTE_LIST,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-startupinfoexw ]]
STARTUPINFOEXW :: struct {
	StartupInfo: STARTUPINFOW,
	lpAttributeList: LPPROC_THREAD_ATTRIBUTE_LIST,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-startupinfow ]]
STARTUPINFOW :: struct {
	cb: u32,
	lpReserved: PWSTR,
	lpDesktop: PWSTR,
	lpTitle: PWSTR,
	dwX: u32,
	dwY: u32,
	dwXSize: u32,
	dwYSize: u32,
	dwXCountChars: u32,
	dwYCountChars: u32,
	dwFillAttribute: u32,
	dwFlags: STARTUPINFOW_FLAGS,
	wShowWindow: u16,
	cbReserved2: u16,
	lpReserved2: ^u8,
	hStdInput: HANDLE,
	hStdOutput: HANDLE,
	hStdError: HANDLE,
}

STARTUPINFOW_FLAGS :: distinct bit_set[enum {
	FORCEONFEEDBACK = 6,
	FORCEOFFFEEDBACK = 7,
	PREVENTPINNING = 13,
	RUNFULLSCREEN = 5,
	TITLEISAPPID = 12,
	TITLEISLINKNAME = 11,
	UNTRUSTEDSOURCE = 15,
	USECOUNTCHARS = 3,
	USEFILLATTRIBUTE = 4,
	USEHOTKEY = 9,
	USEPOSITION = 2,
	USESHOWWINDOW = 0,
	USESIZE = 1,
	USESTDHANDLES = 8,
}; u32]

SYNCHRONIZATION_ACCESS_RIGHTS :: distinct bit_set[enum {
	EVENT_MODIFY_STATE = 1,
	MUTEX_MODIFY_STATE = 0,
	SEMAPHORE_MODIFY_STATE = 1,
	TIMER_MODIFY_STATE = 1,
	TIMER_QUERY_STATE = 0,
	SYNCHRONIZATION_DELETE = 16,
	SYNCHRONIZATION_READ_CONTROL = 17,
	SYNCHRONIZATION_WRITE_DAC = 18,
	SYNCHRONIZATION_WRITE_OWNER = 19,
	SYNCHRONIZATION_SYNCHRONIZE = 20,
}; u32]
SYNCHRONIZATION_ACCESS_RIGHTS_EVENT_ALL_ACCESS :: transmute(SYNCHRONIZATION_ACCESS_RIGHTS)u32(0x001F0003)
SYNCHRONIZATION_ACCESS_RIGHTS_MUTEX_ALL_ACCESS :: transmute(SYNCHRONIZATION_ACCESS_RIGHTS)u32(0x001F0001)
SYNCHRONIZATION_ACCESS_RIGHTS_SEMAPHORE_ALL_ACCESS :: transmute(SYNCHRONIZATION_ACCESS_RIGHTS)u32(0x001F0003)
SYNCHRONIZATION_ACCESS_RIGHTS_TIMER_ALL_ACCESS :: transmute(SYNCHRONIZATION_ACCESS_RIGHTS)u32(0x001F0003)

SYNCHRONIZATION_BARRIER :: struct {
	Reserved1: u32,
	Reserved2: u32,
	Reserved3: [2]uintptr,
	Reserved4: u32,
	Reserved5: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winternl/ns-winternl-teb ]]
TEB :: struct {
	Reserved1: [12]rawptr,
	ProcessEnvironmentBlock: ^PEB,
	Reserved2: [399]rawptr,
	Reserved3: [1952]u8,
	TlsSlots: [64]rawptr,
	Reserved4: [8]u8,
	Reserved5: [26]rawptr,
	ReservedForOle: rawptr,
	Reserved6: [4]rawptr,
	TlsExpansionSlots: rawptr,
}

THREAD_ACCESS_RIGHTS :: distinct bit_set[enum {
	TERMINATE = 0,
	SUSPEND_RESUME = 1,
	GET_CONTEXT = 3,
	SET_CONTEXT = 4,
	SET_INFORMATION = 5,
	QUERY_INFORMATION = 6,
	SET_THREAD_TOKEN = 7,
	IMPERSONATE = 8,
	DIRECT_IMPERSONATION = 9,
	SET_LIMITED_INFORMATION = 10,
	QUERY_LIMITED_INFORMATION = 11,
	RESUME = 12,
	DELETE = 16,
	READ_CONTROL = 17,
	WRITE_DAC = 18,
	WRITE_OWNER = 19,
	SYNCHRONIZE = 20,
}; u32]
THREAD_ACCESS_RIGHTS_ALL_ACCESS :: transmute(THREAD_ACCESS_RIGHTS)u32(0x001FFFFF)
THREAD_ACCESS_RIGHTS_STANDARD_RIGHTS_REQUIRED :: transmute(THREAD_ACCESS_RIGHTS)u32(0x000F0000)

THREAD_CREATION_FLAGS :: distinct bit_set[enum {
	THREAD_CREATE_SUSPENDED = 2,
	STACK_SIZE_PARAM_IS_A_RESERVATION = 16,
}; u32]
THREAD_CREATION_FLAGS_THREAD_CREATE_RUN_IMMEDIATELY :: transmute(THREAD_CREATION_FLAGS)u32(0x00000000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ne-processthreadsapi-thread_information_class ]]
THREAD_INFORMATION_CLASS :: enum i32 {
	MemoryPriority = 0,
	AbsoluteCpuPriority = 1,
	DynamicCodePolicy = 2,
	PowerThrottling = 3,
	InformationClassMax = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-thread_power_throttling_state ]]
THREAD_POWER_THROTTLING_STATE :: struct {
	Version: u32,
	ControlMask: u32,
	StateMask: u32,
}

THREAD_PRIORITY :: enum i32 {
	MODE_BACKGROUND_BEGIN = 65536,
	MODE_BACKGROUND_END = 131072,
	PRIORITY_ABOVE_NORMAL = 1,
	PRIORITY_BELOW_NORMAL = -1,
	PRIORITY_HIGHEST = 2,
	PRIORITY_IDLE = -15,
	PRIORITY_MIN = -2,
	PRIORITY_LOWEST = -2,
	PRIORITY_NORMAL = 0,
	PRIORITY_TIME_CRITICAL = 15,
}

TP_CALLBACK_ENVIRON_V3 :: struct {
	Version: u32,
	Pool: PTP_POOL,
	CleanupGroup: PTP_CLEANUP_GROUP,
	CleanupGroupCancelCallback: PTP_CLEANUP_GROUP_CANCEL_CALLBACK,
	RaceDll: rawptr,
	ActivationContext: int,
	FinalizationCallback: PTP_SIMPLE_CALLBACK,
	u: struct #raw_union {
		Flags: u32,
		s: struct {
			using _: bit_field u32 {
				LongFunction: u32 | 1,
				Persistent: u32 | 1,
				Private: u32 | 30,
			},
		},
	},
	CallbackPriority: TP_CALLBACK_PRIORITY,
	Size: u32,
}

TP_CALLBACK_PRIORITY :: enum i32 {
	HIGH = 0,
	NORMAL = 1,
	LOW = 2,
	INVALID = 3,
	COUNT = 3,
}

TP_POOL_STACK_INFORMATION :: struct {
	StackReserve: uintptr,
	StackCommit: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-ums_scheduler_startup_info ]]
UMS_SCHEDULER_STARTUP_INFO :: struct {
	UmsVersion: u32,
	CompletionList: rawptr,
	SchedulerProc: PRTL_UMS_SCHEDULER_ENTRY_POINT,
	SchedulerParam: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/ns-winbase-ums_system_thread_information ]]
UMS_SYSTEM_THREAD_INFORMATION :: struct {
	UmsVersion: u32,
	using _: struct #raw_union {
		using _: struct {
			using _: bit_field u32 {
				IsUmsSchedulerThread: u32 | 1,
				IsUmsWorkerThread: u32 | 1,
			},
		},
		ThreadUmsFlags: u32,
	},
}

UMS_THREAD_INFO_CLASS :: enum i32 {
	InvalidInfoClass = 0,
	UserContext = 1,
	Priority = 2,
	Affinity = 3,
	Teb = 4,
	IsSuspended = 5,
	IsTerminated = 6,
	MaxInfoClass = 7,
}

WAITORTIMERCALLBACK :: #type proc "system" (param0: rawptr, param1: BOOLEAN)

WORKER_THREAD_FLAGS :: distinct bit_set[enum {
	EXECUTEINIOTHREAD = 0,
	EXECUTEINPERSISTENTTHREAD = 7,
	EXECUTEINWAITTHREAD = 2,
	EXECUTELONGFUNCTION = 4,
	EXECUTEONLYONCE = 3,
	TRANSFER_IMPERSONATION = 8,
	EXECUTEINTIMERTHREAD = 5,
}; u32]
WORKER_THREAD_FLAGS_EXECUTEDEFAULT :: transmute(WORKER_THREAD_FLAGS)u32(0x00000000)

WORKERCALLBACKFUNC :: #type proc "system" (param0: rawptr)

ALL_PROCESSOR_GROUPS :: 65535
CONDITION_VARIABLE_INIT :: CONDITION_VARIABLE{}
CONDITION_VARIABLE_LOCKMODE_SHARED :: 1
CREATE_MUTEX_INITIAL_OWNER :: 1
CREATE_WAITABLE_TIMER_HIGH_RESOLUTION :: 2
CREATE_WAITABLE_TIMER_MANUAL_RESET :: 1
FLS_OUT_OF_INDEXES :: 4294967295
INFINITE :: 4294967295
INIT_ONCE_ASYNC :: 2
INIT_ONCE_CHECK_ONLY :: 1
INIT_ONCE_CTX_RESERVED_BITS :: 2
INIT_ONCE_INIT_FAILED :: 4
INIT_ONCE_STATIC_INIT :: INIT_ONCE{}
PME_CURRENT_VERSION :: 1
PME_FAILFAST_ON_COMMIT_FAIL_DISABLE :: 0
PME_FAILFAST_ON_COMMIT_FAIL_ENABLE :: 1
PRIVATE_NAMESPACE_FLAG_DESTROY :: 1
PROC_THREAD_ATTRIBUTE_ALL_APPLICATION_PACKAGES_POLICY :: 131087
PROC_THREAD_ATTRIBUTE_CHILD_PROCESS_POLICY :: 131086
PROC_THREAD_ATTRIBUTE_COMPONENT_FILTER :: 131098
PROC_THREAD_ATTRIBUTE_DESKTOP_APP_POLICY :: 131090
PROC_THREAD_ATTRIBUTE_ENABLE_OPTIONAL_XSTATE_FEATURES :: 196635
PROC_THREAD_ATTRIBUTE_GROUP_AFFINITY :: 196611
PROC_THREAD_ATTRIBUTE_HANDLE_LIST :: 131074
PROC_THREAD_ATTRIBUTE_IDEAL_PROCESSOR :: 196613
PROC_THREAD_ATTRIBUTE_JOB_LIST :: 131085
PROC_THREAD_ATTRIBUTE_MACHINE_TYPE :: 131097
PROC_THREAD_ATTRIBUTE_MITIGATION_AUDIT_POLICY :: 131096
PROC_THREAD_ATTRIBUTE_MITIGATION_POLICY :: 131079
PROC_THREAD_ATTRIBUTE_PARENT_PROCESS :: 131072
PROC_THREAD_ATTRIBUTE_PREFERRED_NODE :: 131076
PROC_THREAD_ATTRIBUTE_PROTECTION_LEVEL :: 131083
PROC_THREAD_ATTRIBUTE_PSEUDOCONSOLE :: 131094
PROC_THREAD_ATTRIBUTE_REPLACE_VALUE :: 1
PROC_THREAD_ATTRIBUTE_SECURITY_CAPABILITIES :: 131081
PROC_THREAD_ATTRIBUTE_UMS_THREAD :: 196614
PROC_THREAD_ATTRIBUTE_WIN32K_FILTER :: 131088
PROCESS_LEAP_SECOND_INFO_FLAG_ENABLE_SIXTY_SECOND :: 1
PROCESS_LEAP_SECOND_INFO_VALID_FLAGS :: 1
PROCESS_POWER_THROTTLING_CURRENT_VERSION :: 1
PROCESS_POWER_THROTTLING_EXECUTION_SPEED :: 1
PROCESS_POWER_THROTTLING_IGNORE_TIMER_RESOLUTION :: 4
RTL_CRITICAL_SECTION_ALL_FLAG_BITS :: 4278190080
RTL_CRITICAL_SECTION_DEBUG_FLAG_STATIC_INIT :: 1
RTL_CRITICAL_SECTION_FLAG_DYNAMIC_SPIN :: 33554432
RTL_CRITICAL_SECTION_FLAG_FORCE_DEBUG_INFO :: 268435456
RTL_CRITICAL_SECTION_FLAG_NO_DEBUG_INFO :: 16777216
RTL_CRITICAL_SECTION_FLAG_RESOURCE_TYPE :: 134217728
RTL_CRITICAL_SECTION_FLAG_STATIC_INIT :: 67108864
SRWLOCK_INIT :: SRWLOCK{}
SYNCHRONIZATION_BARRIER_FLAGS_BLOCK_ONLY :: 2
SYNCHRONIZATION_BARRIER_FLAGS_NO_DELETE :: 4
SYNCHRONIZATION_BARRIER_FLAGS_SPIN_ONLY :: 1
THREAD_POWER_THROTTLING_CURRENT_VERSION :: 1
THREAD_POWER_THROTTLING_EXECUTION_SPEED :: 1
THREAD_POWER_THROTTLING_VALID_FLAGS :: 1
TLS_OUT_OF_INDEXES :: 4294967295

