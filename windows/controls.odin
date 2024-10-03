package windows

HIMAGELIST :: int

HPROPSHEETPAGE :: rawptr

LPFNSVADDPROPSHEETPAGE :: #type proc "system" (param0: HPROPSHEETPAGE, param1: LPARAM) -> BOOL

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-nmhdr ]]
NMHDR :: struct {
	hwndFrom: HWND,
	idFrom: uintptr,
	code: u32,
}

when ODIN_ARCH == .i386 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-tbbutton ]]
	TBBUTTON :: struct {
		iBitmap: i32,
		idCommand: i32,
		fsState: u8,
		fsStyle: u8,
		bReserved: [2]u8,
		dwData: uintptr,
		iString: int,
	}
}

