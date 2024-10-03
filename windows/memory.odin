package windows

foreign import kernel32 "system:kernel32.lib"
foreign import ntdll "system:ntdll.lib"
foreign import onecore "system:onecore.lib"
foreign import windowsapp "system:windowsapp.lib"

@(default_calling_convention="system")
foreign kernel32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-addsecurememorycachecallback ]]
	AddSecureMemoryCacheCallback :: proc(pfnCallBack: PSECURE_MEMORY_CACHE_CALLBACK) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-allocateuserphysicalpages ]]
	AllocateUserPhysicalPages :: proc(hProcess: HANDLE, NumberOfPages: ^uintptr, PageArray: [^]uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-allocateuserphysicalpagesnuma ]]
	AllocateUserPhysicalPagesNuma :: proc(
		hProcess: HANDLE,
		NumberOfPages: ^uintptr,
		PageArray: [^]uintptr,
		nndPreferred: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createfilemappinga ]]
	CreateFileMappingA :: proc(
		hFile: HANDLE,
		lpFileMappingAttributes: ^SECURITY_ATTRIBUTES,
		flProtect: PAGE_PROTECTION_FLAGS,
		dwMaximumSizeHigh: u32,
		dwMaximumSizeLow: u32,
		lpName: PSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-createfilemappingfromapp ]]
	CreateFileMappingFromApp :: proc(
		hFile: HANDLE,
		SecurityAttributes: ^SECURITY_ATTRIBUTES,
		PageProtection: PAGE_PROTECTION_FLAGS,
		MaximumSize: u64,
		Name: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-createfilemappingnumaa ]]
	CreateFileMappingNumaA :: proc(
		hFile: HANDLE,
		lpFileMappingAttributes: ^SECURITY_ATTRIBUTES,
		flProtect: PAGE_PROTECTION_FLAGS,
		dwMaximumSizeHigh: u32,
		dwMaximumSizeLow: u32,
		lpName: PSTR,
		nndPreferred: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-createfilemappingnumaw ]]
	CreateFileMappingNumaW :: proc(
		hFile: HANDLE,
		lpFileMappingAttributes: ^SECURITY_ATTRIBUTES,
		flProtect: PAGE_PROTECTION_FLAGS,
		dwMaximumSizeHigh: u32,
		dwMaximumSizeLow: u32,
		lpName: PWSTR,
		nndPreferred: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-createfilemappingw ]]
	CreateFileMappingW :: proc(
		hFile: HANDLE,
		lpFileMappingAttributes: ^SECURITY_ATTRIBUTES,
		flProtect: PAGE_PROTECTION_FLAGS,
		dwMaximumSizeHigh: u32,
		dwMaximumSizeLow: u32,
		lpName: PWSTR,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-creatememoryresourcenotification ]]
	CreateMemoryResourceNotification :: proc(NotificationType: MEMORY_RESOURCE_NOTIFICATION_TYPE) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-discardvirtualmemory ]]
	DiscardVirtualMemory :: proc(VirtualAddress: rawptr, Size: uintptr) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-flushviewoffile ]]
	FlushViewOfFile :: proc(lpBaseAddress: rawptr, dwNumberOfBytesToFlush: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-freeuserphysicalpages ]]
	FreeUserPhysicalPages :: proc(hProcess: HANDLE, NumberOfPages: ^uintptr, PageArray: [^]uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getlargepageminimum ]]
	GetLargePageMinimum :: proc() -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getmemoryerrorhandlingcapabilities ]]
	GetMemoryErrorHandlingCapabilities :: proc(Capabilities: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-getprocessheap ]]
	GetProcessHeap :: proc() -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-getprocessheaps ]]
	GetProcessHeaps :: proc(NumberOfHeaps: u32, ProcessHeaps: [^]HANDLE) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getprocessworkingsetsizeex ]]
	GetProcessWorkingSetSizeEx :: proc(
		hProcess: HANDLE,
		lpMinimumWorkingSetSize: ^uintptr,
		lpMaximumWorkingSetSize: ^uintptr,
		Flags: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getsystemfilecachesize ]]
	GetSystemFileCacheSize :: proc(
		lpMinimumFileCacheSize: ^uintptr,
		lpMaximumFileCacheSize: ^uintptr,
		lpFlags: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-getwritewatch ]]
	GetWriteWatch :: proc(
		dwFlags: u32,
		lpBaseAddress: rawptr,
		dwRegionSize: uintptr,
		lpAddresses: rawptr,
		lpdwCount: ^uintptr,
		lpdwGranularity: ^u32,
	) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalalloc ]]
	GlobalAlloc :: proc(uFlags: GLOBAL_ALLOC_FLAGS, dwBytes: uintptr) -> HGLOBAL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalflags ]]
	GlobalFlags :: proc(hMem: HGLOBAL) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalhandle ]]
	GlobalHandle :: proc(pMem: rawptr) -> HGLOBAL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globallock ]]
	GlobalLock :: proc(hMem: HGLOBAL) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalrealloc ]]
	GlobalReAlloc :: proc(hMem: HGLOBAL, dwBytes: uintptr, uFlags: u32) -> HGLOBAL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalsize ]]
	GlobalSize :: proc(hMem: HGLOBAL) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-globalunlock ]]
	GlobalUnlock :: proc(hMem: HGLOBAL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapalloc ]]
	HeapAlloc :: proc(hHeap: HANDLE, dwFlags: HEAP_FLAGS, dwBytes: uintptr) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapcompact ]]
	HeapCompact :: proc(hHeap: HANDLE, dwFlags: HEAP_FLAGS) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapcreate ]]
	HeapCreate :: proc(flOptions: HEAP_FLAGS, dwInitialSize: uintptr, dwMaximumSize: uintptr) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapdestroy ]]
	HeapDestroy :: proc(hHeap: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapfree ]]
	HeapFree :: proc(hHeap: HANDLE, dwFlags: HEAP_FLAGS, lpMem: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heaplock ]]
	HeapLock :: proc(hHeap: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapqueryinformation ]]
	HeapQueryInformation :: proc(
		HeapHandle: HANDLE,
		HeapInformationClass: HEAP_INFORMATION_CLASS,
		HeapInformation: rawptr,
		HeapInformationLength: uintptr,
		ReturnLength: ^uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heaprealloc ]]
	HeapReAlloc :: proc(hHeap: HANDLE, dwFlags: HEAP_FLAGS, lpMem: rawptr, dwBytes: uintptr) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapsetinformation ]]
	HeapSetInformation :: proc(
		HeapHandle: HANDLE,
		HeapInformationClass: HEAP_INFORMATION_CLASS,
		HeapInformation: rawptr,
		HeapInformationLength: uintptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapsize ]]
	HeapSize :: proc(hHeap: HANDLE, dwFlags: HEAP_FLAGS, lpMem: rawptr) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapsummary ]]
	HeapSummary :: proc(hHeap: HANDLE, dwFlags: u32, lpSummary: ^HEAP_SUMMARY) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapunlock ]]
	HeapUnlock :: proc(hHeap: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapvalidate ]]
	HeapValidate :: proc(hHeap: HANDLE, dwFlags: HEAP_FLAGS, lpMem: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/nf-heapapi-heapwalk ]]
	HeapWalk :: proc(hHeap: HANDLE, lpEntry: ^PROCESS_HEAP_ENTRY) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadcodeptr ]]
	IsBadCodePtr :: proc(lpfn: FARPROC) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadreadptr ]]
	IsBadReadPtr :: proc(lp: rawptr, ucb: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadstringptra ]]
	IsBadStringPtrA :: proc(lpsz: PSTR, ucchMax: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadstringptrw ]]
	IsBadStringPtrW :: proc(lpsz: PWSTR, ucchMax: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-isbadwriteptr ]]
	IsBadWritePtr :: proc(lp: rawptr, ucb: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localalloc ]]
	LocalAlloc :: proc(uFlags: LOCAL_ALLOC_FLAGS, uBytes: uintptr) -> HLOCAL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localflags ]]
	LocalFlags :: proc(hMem: HLOCAL) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localhandle ]]
	LocalHandle :: proc(pMem: rawptr) -> HLOCAL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-locallock ]]
	LocalLock :: proc(hMem: HLOCAL) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localrealloc ]]
	LocalReAlloc :: proc(hMem: HLOCAL, uBytes: uintptr, uFlags: u32) -> HLOCAL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localsize ]]
	LocalSize :: proc(hMem: HLOCAL) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-localunlock ]]
	LocalUnlock :: proc(hMem: HLOCAL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapuserphysicalpages ]]
	MapUserPhysicalPages :: proc(VirtualAddress: rawptr, NumberOfPages: uintptr, PageArray: [^]uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-mapuserphysicalpagesscatter ]]
	MapUserPhysicalPagesScatter :: proc(VirtualAddresses: rawptr, NumberOfPages: uintptr, PageArray: [^]uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile ]]
	MapViewOfFile :: proc(
		hFileMappingObject: HANDLE,
		dwDesiredAccess: FILE_MAP,
		dwFileOffsetHigh: u32,
		dwFileOffsetLow: u32,
		dwNumberOfBytesToMap: uintptr,
	) -> MEMORY_MAPPED_VIEW_ADDRESS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffileex ]]
	MapViewOfFileEx :: proc(
		hFileMappingObject: HANDLE,
		dwDesiredAccess: FILE_MAP,
		dwFileOffsetHigh: u32,
		dwFileOffsetLow: u32,
		dwNumberOfBytesToMap: uintptr,
		lpBaseAddress: rawptr,
	) -> MEMORY_MAPPED_VIEW_ADDRESS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-mapviewoffileexnuma ]]
	MapViewOfFileExNuma :: proc(
		hFileMappingObject: HANDLE,
		dwDesiredAccess: FILE_MAP,
		dwFileOffsetHigh: u32,
		dwFileOffsetLow: u32,
		dwNumberOfBytesToMap: uintptr,
		lpBaseAddress: rawptr,
		nndPreferred: u32,
	) -> MEMORY_MAPPED_VIEW_ADDRESS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffilefromapp ]]
	MapViewOfFileFromApp :: proc(
		hFileMappingObject: HANDLE,
		DesiredAccess: FILE_MAP,
		FileOffset: u64,
		NumberOfBytesToMap: uintptr,
	) -> MEMORY_MAPPED_VIEW_ADDRESS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-offervirtualmemory ]]
	OfferVirtualMemory :: proc(VirtualAddress: rawptr, Size: uintptr, Priority: OFFER_PRIORITY) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openfilemappinga ]]
	OpenFileMappingA :: proc(dwDesiredAccess: u32, bInheritHandle: BOOL, lpName: PSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-openfilemappingw ]]
	OpenFileMappingW :: proc(dwDesiredAccess: u32, bInheritHandle: BOOL, lpName: PWSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-prefetchvirtualmemory ]]
	PrefetchVirtualMemory :: proc(
		hProcess: HANDLE,
		NumberOfEntries: uintptr,
		VirtualAddresses: [^]WIN32_MEMORY_RANGE_ENTRY,
		Flags: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-querymemoryresourcenotification ]]
	QueryMemoryResourceNotification :: proc(ResourceNotificationHandle: HANDLE, ResourceState: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-reclaimvirtualmemory ]]
	ReclaimVirtualMemory :: proc(VirtualAddress: rawptr, Size: uintptr) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-registerbadmemorynotification ]]
	RegisterBadMemoryNotification :: proc(Callback: PBAD_MEMORY_CALLBACK_ROUTINE) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-removesecurememorycachecallback ]]
	RemoveSecureMemoryCacheCallback :: proc(pfnCallBack: PSECURE_MEMORY_CACHE_CALLBACK) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-resetwritewatch ]]
	ResetWriteWatch :: proc(lpBaseAddress: rawptr, dwRegionSize: uintptr) -> u32 ---

	RtlCompareMemory :: proc(Source1: rawptr, Source2: rawptr, Length: uintptr) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessworkingsetsizeex ]]
	SetProcessWorkingSetSizeEx :: proc(
		hProcess: HANDLE,
		dwMinimumWorkingSetSize: uintptr,
		dwMaximumWorkingSetSize: uintptr,
		Flags: SETPROCESSWORKINGSETSIZEEX_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setsystemfilecachesize ]]
	SetSystemFileCacheSize :: proc(MinimumFileCacheSize: uintptr, MaximumFileCacheSize: uintptr, Flags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-unmapviewoffile ]]
	UnmapViewOfFile :: proc(lpBaseAddress: MEMORY_MAPPED_VIEW_ADDRESS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-unmapviewoffileex ]]
	UnmapViewOfFileEx :: proc(
		BaseAddress: MEMORY_MAPPED_VIEW_ADDRESS,
		UnmapFlags: UNMAP_VIEW_OF_FILE_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-unregisterbadmemorynotification ]]
	UnregisterBadMemoryNotification :: proc(RegistrationHandle: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc ]]
	VirtualAlloc :: proc(
		lpAddress: rawptr,
		dwSize: uintptr,
		flAllocationType: VIRTUAL_ALLOCATION_TYPE,
		flProtect: PAGE_PROTECTION_FLAGS,
	) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualallocex ]]
	VirtualAllocEx :: proc(
		hProcess: HANDLE,
		lpAddress: rawptr,
		dwSize: uintptr,
		flAllocationType: VIRTUAL_ALLOCATION_TYPE,
		flProtect: PAGE_PROTECTION_FLAGS,
	) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualallocexnuma ]]
	VirtualAllocExNuma :: proc(
		hProcess: HANDLE,
		lpAddress: rawptr,
		dwSize: uintptr,
		flAllocationType: VIRTUAL_ALLOCATION_TYPE,
		flProtect: u32,
		nndPreferred: u32,
	) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualfree ]]
	VirtualFree :: proc(lpAddress: rawptr, dwSize: uintptr, dwFreeType: VIRTUAL_FREE_TYPE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualfreeex ]]
	VirtualFreeEx :: proc(
		hProcess: HANDLE,
		lpAddress: rawptr,
		dwSize: uintptr,
		dwFreeType: VIRTUAL_FREE_TYPE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtuallock ]]
	VirtualLock :: proc(lpAddress: rawptr, dwSize: uintptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualprotect ]]
	VirtualProtect :: proc(
		lpAddress: rawptr,
		dwSize: uintptr,
		flNewProtect: PAGE_PROTECTION_FLAGS,
		lpflOldProtect: ^PAGE_PROTECTION_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualprotectex ]]
	VirtualProtectEx :: proc(
		hProcess: HANDLE,
		lpAddress: rawptr,
		dwSize: uintptr,
		flNewProtect: PAGE_PROTECTION_FLAGS,
		lpflOldProtect: ^PAGE_PROTECTION_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualquery ]]
	VirtualQuery :: proc(lpAddress: rawptr, lpBuffer: ^MEMORY_BASIC_INFORMATION, dwLength: uintptr) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualqueryex ]]
	VirtualQueryEx :: proc(
		hProcess: HANDLE,
		lpAddress: rawptr,
		lpBuffer: ^MEMORY_BASIC_INFORMATION,
		dwLength: uintptr,
	) -> uintptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualunlock ]]
	VirtualUnlock :: proc(lpAddress: rawptr, dwSize: uintptr) -> BOOL ---
}

@(default_calling_convention="system")
foreign ntdll {
	RtlCrc32 :: proc(Buffer: rawptr, Size: uintptr, InitialCrc: u32) -> u32 ---

	RtlCrc64 :: proc(Buffer: rawptr, Size: uintptr, InitialCrc: u64) -> u64 ---

	RtlIsZeroMemory :: proc(Buffer: rawptr, Length: uintptr) -> BOOLEAN ---
}

@(default_calling_convention="system")
foreign onecore {
	AllocateUserPhysicalPages2 :: proc(
		ObjectHandle: HANDLE,
		NumberOfPages: ^uintptr,
		PageArray: [^]uintptr,
		ExtendedParameters: [^]MEM_EXTENDED_PARAMETER,
		ExtendedParameterCount: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-createfilemapping2 ]]
	CreateFileMapping2 :: proc(
		File: HANDLE,
		SecurityAttributes: ^SECURITY_ATTRIBUTES,
		DesiredAccess: u32,
		PageProtection: PAGE_PROTECTION_FLAGS,
		AllocationAttributes: u32,
		MaximumSize: u64,
		Name: PWSTR,
		ExtendedParameters: [^]MEM_EXTENDED_PARAMETER,
		ParameterCount: u32,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile3 ]]
	MapViewOfFile3 :: proc(
		FileMapping: HANDLE,
		Process: HANDLE,
		BaseAddress: rawptr,
		Offset: u64,
		ViewSize: uintptr,
		AllocationType: VIRTUAL_ALLOCATION_TYPE,
		PageProtection: u32,
		ExtendedParameters: [^]MEM_EXTENDED_PARAMETER,
		ParameterCount: u32,
	) -> MEMORY_MAPPED_VIEW_ADDRESS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffile3fromapp ]]
	MapViewOfFile3FromApp :: proc(
		FileMapping: HANDLE,
		Process: HANDLE,
		BaseAddress: rawptr,
		Offset: u64,
		ViewSize: uintptr,
		AllocationType: VIRTUAL_ALLOCATION_TYPE,
		PageProtection: u32,
		ExtendedParameters: [^]MEM_EXTENDED_PARAMETER,
		ParameterCount: u32,
	) -> MEMORY_MAPPED_VIEW_ADDRESS ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-mapviewoffilenuma2 ]]
	MapViewOfFileNuma2 :: proc(
		FileMappingHandle: HANDLE,
		ProcessHandle: HANDLE,
		Offset: u64,
		BaseAddress: rawptr,
		ViewSize: uintptr,
		AllocationType: u32,
		PageProtection: u32,
		PreferredNode: u32,
	) -> MEMORY_MAPPED_VIEW_ADDRESS ---

	OpenDedicatedMemoryPartition :: proc(
		Partition: HANDLE,
		DedicatedMemoryTypeId: u64,
		DesiredAccess: u32,
		InheritHandle: BOOL,
	) -> HANDLE ---

	QueryPartitionInformation :: proc(
		Partition: HANDLE,
		PartitionInformationClass: WIN32_MEMORY_PARTITION_INFORMATION_CLASS,
		PartitionInformation: rawptr,
		PartitionInformationLength: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-queryvirtualmemoryinformation ]]
	QueryVirtualMemoryInformation :: proc(
		Process: HANDLE,
		VirtualAddress: rawptr,
		MemoryInformationClass: WIN32_MEMORY_INFORMATION_CLASS,
		MemoryInformation: rawptr,
		MemoryInformationSize: uintptr,
		ReturnSize: ^uintptr,
	) -> BOOL ---

	SetProcessValidCallTargetsForMappedView :: proc(
		Process: HANDLE,
		VirtualAddress: rawptr,
		RegionSize: uintptr,
		NumberOfOffsets: u32,
		OffsetInformation: [^]CFG_CALL_TARGET_INFO,
		Section: HANDLE,
		ExpectedFileOffset: u64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-unmapviewoffile2 ]]
	UnmapViewOfFile2 :: proc(
		Process: HANDLE,
		BaseAddress: MEMORY_MAPPED_VIEW_ADDRESS,
		UnmapFlags: UNMAP_VIEW_OF_FILE_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc2 ]]
	VirtualAlloc2 :: proc(
		Process: HANDLE,
		BaseAddress: rawptr,
		Size: uintptr,
		AllocationType: VIRTUAL_ALLOCATION_TYPE,
		PageProtection: u32,
		ExtendedParameters: [^]MEM_EXTENDED_PARAMETER,
		ParameterCount: u32,
	) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualalloc2fromapp ]]
	VirtualAlloc2FromApp :: proc(
		Process: HANDLE,
		BaseAddress: rawptr,
		Size: uintptr,
		AllocationType: VIRTUAL_ALLOCATION_TYPE,
		PageProtection: u32,
		ExtendedParameters: [^]MEM_EXTENDED_PARAMETER,
		ParameterCount: u32,
	) -> rawptr ---

	VirtualUnlockEx :: proc(Process: HANDLE, Address: rawptr, Size: uintptr) -> BOOL ---
}

@(default_calling_convention="system")
foreign windowsapp {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-openfilemappingfromapp ]]
	OpenFileMappingFromApp :: proc(DesiredAccess: u32, InheritHandle: BOOL, Name: PWSTR) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-setprocessvalidcalltargets ]]
	SetProcessValidCallTargets :: proc(
		hProcess: HANDLE,
		VirtualAddress: rawptr,
		RegionSize: uintptr,
		NumberOfOffsets: u32,
		OffsetInformation: [^]CFG_CALL_TARGET_INFO,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualallocfromapp ]]
	VirtualAllocFromApp :: proc(
		BaseAddress: rawptr,
		Size: uintptr,
		AllocationType: VIRTUAL_ALLOCATION_TYPE,
		Protection: u32,
	) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/nf-memoryapi-virtualprotectfromapp ]]
	VirtualProtectFromApp :: proc(Address: rawptr, Size: uintptr, NewProtection: u32, OldProtection: ^u32) -> BOOL ---
}

AtlThunkData_t :: int

// [[ Documentation; https://learn.microsoft.com/windows/win32/Memory/-cfg-call-target-info ]]
CFG_CALL_TARGET_INFO :: struct {
	Offset: uintptr,
	Flags: uintptr,
}

FILE_MAP :: distinct bit_set[enum {
	WRITE = 1,
	READ = 2,
	EXECUTE = 5,
	COPY = 0,
	RESERVE = 31,
	TARGETS_INVALID = 30,
	LARGE_PAGES = 29,
}; u32]
FILE_MAP_ALL_ACCESS :: transmute(FILE_MAP)u32(0x000F001F)

GLOBAL_ALLOC_FLAGS :: distinct bit_set[enum {
	MEM_MOVEABLE = 1,
	MEM_ZEROINIT = 6,
	PTR = 6,
}; u32]
GLOBAL_ALLOC_FLAGS_HND :: transmute(GLOBAL_ALLOC_FLAGS)u32(0x00000042)
GLOBAL_ALLOC_FLAGS_MEM_FIXED :: transmute(GLOBAL_ALLOC_FLAGS)u32(0x00000000)

HEAP_FLAGS :: distinct bit_set[enum {
	NO_SERIALIZE = 0,
	GROWABLE = 1,
	GENERATE_EXCEPTIONS = 2,
	ZERO_MEMORY = 3,
	REALLOC_IN_PLACE_ONLY = 4,
	TAIL_CHECKING_ENABLED = 5,
	FREE_CHECKING_ENABLED = 6,
	DISABLE_COALESCE_ON_FREE = 7,
	CREATE_ALIGN_16 = 16,
	CREATE_ENABLE_TRACING = 17,
	CREATE_ENABLE_EXECUTE = 18,
	PSEUDO_TAG_FLAG = 15,
	CREATE_SEGMENT_HEAP = 8,
	CREATE_HARDENED = 9,
}; u32]
HEAP_FLAGS_NONE :: transmute(HEAP_FLAGS)u32(0x00000000)
HEAP_FLAGS_MAXIMUM_TAG :: transmute(HEAP_FLAGS)u32(0x00000FFF)
HEAP_FLAGS_TAG_SHIFT :: transmute(HEAP_FLAGS)u32(0x00000012)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-heap_information_class ]]
HEAP_INFORMATION_CLASS :: enum i32 {
	CompatibilityInformation = 0,
	EnableTerminationOnCorruption = 1,
	OptimizeResources = 3,
	Tag = 7,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/heapapi/ns-heapapi-heap_summary ]]
HEAP_SUMMARY :: struct {
	cb: u32,
	cbAllocated: uintptr,
	cbCommitted: uintptr,
	cbReserved: uintptr,
	cbMaxReserve: uintptr,
}

LOCAL_ALLOC_FLAGS :: distinct bit_set[enum {
	LMEM_MOVEABLE = 1,
	LMEM_ZEROINIT = 6,
	LPTR = 6,
	NONZEROLHND = 1,
}; u32]
LOCAL_ALLOC_FLAGS_LHND :: transmute(LOCAL_ALLOC_FLAGS)u32(0x00000042)
LOCAL_ALLOC_FLAGS_LMEM_FIXED :: transmute(LOCAL_ALLOC_FLAGS)u32(0x00000000)
LOCAL_ALLOC_FLAGS_NONZEROLPTR :: transmute(LOCAL_ALLOC_FLAGS)u32(0x00000000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_address_requirements ]]
MEM_ADDRESS_REQUIREMENTS :: struct {
	LowestStartingAddress: rawptr,
	HighestEndingAddress: rawptr,
	Alignment: uintptr,
}

MEM_DEDICATED_ATTRIBUTE_TYPE :: enum i32 {
	ReadBandwidth = 0,
	ReadLatency = 1,
	WriteBandwidth = 2,
	WriteLatency = 3,
	Max = 4,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-mem_extended_parameter ]]
MEM_EXTENDED_PARAMETER :: struct {
	using _: struct {
		using _: bit_field u64 {
			Type: u64 | 8,
			Reserved: u64 | 56,
		},
	},
	using _: struct #raw_union {
		ULong64: u64,
		Pointer: rawptr,
		Size: uintptr,
		Handle: HANDLE,
		ULong: u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-mem_extended_parameter_type ]]
MEM_EXTENDED_PARAMETER_TYPE :: enum i32 {
	InvalidType = 0,
	AddressRequirements = 1,
	NumaNode = 2,
	PartitionHandle = 3,
	UserPhysicalHandle = 4,
	AttributeFlags = 5,
	ImageMachine = 6,
	Max = 7,
}

MEM_SECTION_EXTENDED_PARAMETER_TYPE :: enum i32 {
	InvalidType = 0,
	UserPhysicalFlags = 1,
	NumaNode = 2,
	SigningLevel = 3,
	Max = 4,
}

when ODIN_ARCH == .amd64 || ODIN_ARCH == .arm64 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-memory_basic_information ]]
	MEMORY_BASIC_INFORMATION :: struct {
		BaseAddress: rawptr,
		AllocationBase: rawptr,
		AllocationProtect: PAGE_PROTECTION_FLAGS,
		PartitionId: u16,
		RegionSize: uintptr,
		State: VIRTUAL_ALLOCATION_TYPE,
		Protect: PAGE_PROTECTION_FLAGS,
		Type: PAGE_TYPE,
	}
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-memory_basic_information ]]
	MEMORY_BASIC_INFORMATION :: struct {
		BaseAddress: rawptr,
		AllocationBase: rawptr,
		AllocationProtect: PAGE_PROTECTION_FLAGS,
		RegionSize: uintptr,
		State: VIRTUAL_ALLOCATION_TYPE,
		Protect: PAGE_PROTECTION_FLAGS,
		Type: PAGE_TYPE,
	}
}

MEMORY_BASIC_INFORMATION32 :: struct {
	BaseAddress: u32,
	AllocationBase: u32,
	AllocationProtect: PAGE_PROTECTION_FLAGS,
	RegionSize: u32,
	State: VIRTUAL_ALLOCATION_TYPE,
	Protect: PAGE_PROTECTION_FLAGS,
	Type: PAGE_TYPE,
}

MEMORY_BASIC_INFORMATION64 :: struct {
	BaseAddress: u64,
	AllocationBase: u64,
	AllocationProtect: PAGE_PROTECTION_FLAGS,
	__alignment1: u32,
	RegionSize: u64,
	State: VIRTUAL_ALLOCATION_TYPE,
	Protect: PAGE_PROTECTION_FLAGS,
	Type: PAGE_TYPE,
	__alignment2: u32,
}

MEMORY_MAPPED_VIEW_ADDRESS :: struct {
	Value: rawptr,
}

MEMORY_PARTITION_DEDICATED_MEMORY_ATTRIBUTE :: struct {
	Type: MEM_DEDICATED_ATTRIBUTE_TYPE,
	Reserved: u32,
	Value: u64,
}

MEMORY_PARTITION_DEDICATED_MEMORY_INFORMATION :: struct {
	NextEntryOffset: u32,
	SizeOfInformation: u32,
	Flags: u32,
	AttributesOffset: u32,
	AttributeCount: u32,
	Reserved: u32,
	TypeId: u64,
}

MEMORY_RESOURCE_NOTIFICATION_TYPE :: enum i32 {
	LowMemoryResourceNotification = 0,
	HighMemoryResourceNotification = 1,
}

OFFER_PRIORITY :: enum i32 {
	VeryLow = 1,
	Low = 2,
	BelowNormal = 3,
	Normal = 4,
}

PAGE_PROTECTION_FLAGS :: distinct bit_set[enum {
	PAGE_NOACCESS = 0,
	PAGE_READONLY = 1,
	PAGE_READWRITE = 2,
	PAGE_WRITECOPY = 3,
	PAGE_EXECUTE = 4,
	PAGE_EXECUTE_READ = 5,
	PAGE_EXECUTE_READWRITE = 6,
	PAGE_EXECUTE_WRITECOPY = 7,
	PAGE_GUARD = 8,
	PAGE_NOCACHE = 9,
	PAGE_WRITECOMBINE = 10,
	PAGE_GRAPHICS_NOACCESS = 11,
	PAGE_GRAPHICS_READONLY = 12,
	PAGE_GRAPHICS_READWRITE = 13,
	PAGE_GRAPHICS_EXECUTE = 14,
	PAGE_GRAPHICS_EXECUTE_READ = 15,
	PAGE_GRAPHICS_EXECUTE_READWRITE = 16,
	PAGE_GRAPHICS_COHERENT = 17,
	PAGE_GRAPHICS_NOCACHE = 18,
	PAGE_ENCLAVE_THREAD_CONTROL = 31,
	PAGE_REVERT_TO_FILE_MAP = 31,
	PAGE_TARGETS_NO_UPDATE = 30,
	PAGE_TARGETS_INVALID = 30,
	PAGE_ENCLAVE_UNVALIDATED = 29,
	PAGE_ENCLAVE_MASK = 28,
	PAGE_ENCLAVE_DECOMMIT = 28,
	SEC_PARTITION_OWNER_HANDLE = 18,
	SEC_64K_PAGES = 19,
	SEC_FILE = 23,
	SEC_IMAGE = 24,
	SEC_PROTECTED_IMAGE = 25,
	SEC_RESERVE = 26,
	SEC_COMMIT = 27,
	SEC_NOCACHE = 28,
	SEC_WRITECOMBINE = 30,
	SEC_LARGE_PAGES = 31,
}; u32]
PAGE_PROTECTION_FLAGS_PAGE_ENCLAVE_SS_FIRST :: transmute(PAGE_PROTECTION_FLAGS)u32(0x10000001)
PAGE_PROTECTION_FLAGS_PAGE_ENCLAVE_SS_REST :: transmute(PAGE_PROTECTION_FLAGS)u32(0x10000002)
PAGE_PROTECTION_FLAGS_SEC_IMAGE_NO_EXECUTE :: transmute(PAGE_PROTECTION_FLAGS)u32(0x11000000)

PAGE_TYPE :: distinct bit_set[enum {
	PRIVATE = 17,
	MAPPED = 18,
	IMAGE = 24,
}; u32]

PBAD_MEMORY_CALLBACK_ROUTINE :: #type proc "system" ()

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/minwinbase/ns-minwinbase-process_heap_entry ]]
PROCESS_HEAP_ENTRY :: struct {
	lpData: rawptr,
	cbData: u32,
	cbOverhead: u8,
	iRegionIndex: u8,
	wFlags: u16,
	using _: struct #raw_union {
		Block: struct {
			hMem: HANDLE,
			dwReserved: [3]u32,
		},
		Region: struct {
			dwCommittedSize: u32,
			dwUnCommittedSize: u32,
			lpFirstBlock: rawptr,
			lpLastBlock: rawptr,
		},
	},
}

PSECURE_MEMORY_CACHE_CALLBACK :: #type proc "system" (Addr: rawptr, Range: uintptr) -> BOOLEAN

SECTION_FLAGS :: distinct bit_set[enum {
	QUERY = 0,
	MAP_WRITE = 1,
	MAP_READ = 2,
	MAP_EXECUTE = 3,
	EXTEND_SIZE = 4,
	MAP_EXECUTE_EXPLICIT = 5,
}; u32]
SECTION_FLAGS_ALL_ACCESS :: transmute(SECTION_FLAGS)u32(0x000F001F)

SETPROCESSWORKINGSETSIZEEX_FLAGS :: distinct bit_set[enum {
	IN_ENABLE = 0,
	IN_DISABLE = 1,
	AX_ENABLE = 2,
	AX_DISABLE = 3,
}; u32]

UNMAP_VIEW_OF_FILE_FLAGS :: enum u32 {
	UNMAP_NONE = 0x00000000,
	UNMAP_WITH_TRANSIENT_BOOST = 0x00000001,
	PRESERVE_PLACEHOLDER = 0x00000002,
}

VIRTUAL_ALLOCATION_TYPE :: distinct bit_set[enum {
	COMMIT = 12,
	RESERVE = 13,
	RESET = 19,
	RESET_UNDO = 24,
	REPLACE_PLACEHOLDER = 14,
	LARGE_PAGES = 29,
	RESERVE_PLACEHOLDER = 18,
	FREE = 16,
}; u32]

VIRTUAL_FREE_TYPE :: enum u32 {
	DECOMMIT = 0x00004000,
	RELEASE = 0x00008000,
}

WIN32_MEMORY_INFORMATION_CLASS :: enum i32 {
	MemoryRegionInfo = 0,
}

WIN32_MEMORY_PARTITION_INFORMATION :: struct {
	Flags: u32,
	NumaNode: u32,
	Channel: u32,
	NumberOfNumaNodes: u32,
	ResidentAvailablePages: u64,
	CommittedPages: u64,
	CommitLimit: u64,
	PeakCommitment: u64,
	TotalNumberOfPages: u64,
	AvailablePages: u64,
	ZeroPages: u64,
	FreePages: u64,
	StandbyPages: u64,
	Reserved: [16]u64,
	MaximumCommitLimit: u64,
	Reserved2: u64,
	PartitionId: u32,
}

WIN32_MEMORY_PARTITION_INFORMATION_CLASS :: enum i32 {
	Info = 0,
	DedicatedMemoryInfo = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/ns-memoryapi-win32_memory_range_entry ]]
WIN32_MEMORY_RANGE_ENTRY :: struct {
	VirtualAddress: rawptr,
	NumberOfBytes: uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/memoryapi/ns-memoryapi-win32_memory_region_information ]]
WIN32_MEMORY_REGION_INFORMATION :: struct {
	AllocationBase: rawptr,
	AllocationProtect: u32,
	using _: struct #raw_union {
		Flags: u32,
		using _: struct {
			using _: bit_field u32 {
				Private: u32 | 1,
				MappedDataFile: u32 | 1,
				MappedImage: u32 | 1,
				MappedPageFile: u32 | 1,
				MappedPhysical: u32 | 1,
				DirectMapped: u32 | 1,
				Reserved: u32 | 26,
			},
		},
	},
	RegionSize: uintptr,
	CommitSize: uintptr,
}

FILE_CACHE_MAX_HARD_DISABLE :: 2
FILE_CACHE_MAX_HARD_ENABLE :: 1
FILE_CACHE_MIN_HARD_DISABLE :: 8
FILE_CACHE_MIN_HARD_ENABLE :: 4
MEHC_PATROL_SCRUBBER_PRESENT :: 1

