package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/ntdef/ns-ntdef-list_entry ]]
LIST_ENTRY :: struct {
	Flink: ^LIST_ENTRY,
	Blink: ^LIST_ENTRY,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-processor_number ]]
PROCESSOR_NUMBER :: struct {
	Group: u16,
	Number: u8,
	Reserved: u8,
}

