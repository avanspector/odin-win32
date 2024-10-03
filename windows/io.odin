package windows

foreign import kernel32 "system:kernel32.lib"

@(default_calling_convention="system")
foreign kernel32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-bindiocompletioncallback ]]
	BindIoCompletionCallback :: proc(FileHandle: HANDLE, Function: LPOVERLAPPED_COMPLETION_ROUTINE, Flags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-cancelio ]]
	CancelIo :: proc(hFile: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-cancelioex ]]
	CancelIoEx :: proc(hFile: HANDLE, lpOverlapped: ^OVERLAPPED) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-cancelsynchronousio ]]
	CancelSynchronousIo :: proc(hThread: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-createiocompletionport ]]
	CreateIoCompletionPort :: proc(
		FileHandle: HANDLE,
		ExistingCompletionPort: HANDLE,
		CompletionKey: uintptr,
		NumberOfConcurrentThreads: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-deviceiocontrol ]]
	DeviceIoControl :: proc(
		hDevice: HANDLE,
		dwIoControlCode: u32,
		lpInBuffer: rawptr,
		nInBufferSize: u32,
		lpOutBuffer: rawptr,
		nOutBufferSize: u32,
		lpBytesReturned: ^u32,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresult ]]
	GetOverlappedResult :: proc(
		hFile: HANDLE,
		lpOverlapped: ^OVERLAPPED,
		lpNumberOfBytesTransferred: ^u32,
		bWait: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getoverlappedresultex ]]
	GetOverlappedResultEx :: proc(
		hFile: HANDLE,
		lpOverlapped: ^OVERLAPPED,
		lpNumberOfBytesTransferred: ^u32,
		dwMilliseconds: u32,
		bAlertable: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus ]]
	GetQueuedCompletionStatus :: proc(
		CompletionPort: HANDLE,
		lpNumberOfBytesTransferred: ^u32,
		lpCompletionKey: ^uintptr,
		lpOverlapped: ^OVERLAPPED,
		dwMilliseconds: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-getqueuedcompletionstatusex ]]
	GetQueuedCompletionStatusEx :: proc(
		CompletionPort: HANDLE,
		lpCompletionPortEntries: [^]OVERLAPPED_ENTRY,
		ulCount: u32,
		ulNumEntriesRemoved: ^u32,
		dwMilliseconds: u32,
		fAlertable: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-postqueuedcompletionstatus ]]
	PostQueuedCompletionStatus :: proc(
		CompletionPort: HANDLE,
		dwNumberOfBytesTransferred: u32,
		dwCompletionKey: uintptr,
		lpOverlapped: ^OVERLAPPED,
	) -> BOOL ---
}

IO_STATUS_BLOCK :: struct {
	using _: struct #raw_union {
		Status: NTSTATUS,
		Pointer: rawptr,
	},
	Information: uintptr,
}

LPOVERLAPPED_COMPLETION_ROUTINE :: #type proc "system" (dwErrorCode: u32, dwNumberOfBytesTransfered: u32, lpOverlapped: ^OVERLAPPED)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped ]]
OVERLAPPED :: struct {
	Internal: uintptr,
	InternalHigh: uintptr,
	using _: struct #raw_union {
		using _: struct {
			Offset: u32,
			OffsetHigh: u32,
		},
		Pointer: rawptr,
	},
	hEvent: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-overlapped_entry ]]
OVERLAPPED_ENTRY :: struct {
	lpCompletionKey: uintptr,
	lpOverlapped: ^OVERLAPPED,
	Internal: uintptr,
	dwNumberOfBytesTransferred: u32,
}

PIO_APC_ROUTINE :: #type proc "system" (ApcContext: rawptr, IoStatusBlock: ^IO_STATUS_BLOCK, Reserved: u32)

