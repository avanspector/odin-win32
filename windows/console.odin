package windows

foreign import kernel32 "system:kernel32.lib"
foreign import user32 "system:user32.lib"

@(default_calling_convention="system")
foreign kernel32 {
	// [[ Documentation; https://learn.microsoft.com/windows/console/addconsolealias ]]
	AddConsoleAliasA :: proc(Source: PSTR, Target: PSTR, ExeName: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/addconsolealias ]]
	AddConsoleAliasW :: proc(Source: PWSTR, Target: PWSTR, ExeName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/allocconsole ]]
	AllocConsole :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/attachconsole ]]
	AttachConsole :: proc(dwProcessId: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/closepseudoconsole ]]
	ClosePseudoConsole :: proc(hPC: HPCON) ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/createconsolescreenbuffer ]]
	CreateConsoleScreenBuffer :: proc(
		dwDesiredAccess: u32,
		dwShareMode: u32,
		lpSecurityAttributes: ^SECURITY_ATTRIBUTES,
		dwFlags: u32,
		lpScreenBufferData: rawptr,
	) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/createpseudoconsole ]]
	CreatePseudoConsole :: proc(size: COORD, hInput: HANDLE, hOutput: HANDLE, dwFlags: u32, phPC: ^HPCON) -> HRESULT ---

	ExpungeConsoleCommandHistoryA :: proc(ExeName: PSTR) ---

	ExpungeConsoleCommandHistoryW :: proc(ExeName: PWSTR) ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/fillconsoleoutputattribute ]]
	FillConsoleOutputAttribute :: proc(
		hConsoleOutput: HANDLE,
		wAttribute: u16,
		nLength: u32,
		dwWriteCoord: COORD,
		lpNumberOfAttrsWritten: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/fillconsoleoutputcharacter ]]
	FillConsoleOutputCharacterA :: proc(
		hConsoleOutput: HANDLE,
		cCharacter: CHAR,
		nLength: u32,
		dwWriteCoord: COORD,
		lpNumberOfCharsWritten: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/fillconsoleoutputcharacter ]]
	FillConsoleOutputCharacterW :: proc(
		hConsoleOutput: HANDLE,
		cCharacter: u16,
		nLength: u32,
		dwWriteCoord: COORD,
		lpNumberOfCharsWritten: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/flushconsoleinputbuffer ]]
	FlushConsoleInputBuffer :: proc(hConsoleInput: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/freeconsole ]]
	FreeConsole :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/generateconsolectrlevent ]]
	GenerateConsoleCtrlEvent :: proc(dwCtrlEvent: u32, dwProcessGroupId: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealias ]]
	GetConsoleAliasA :: proc(Source: PSTR, TargetBuffer: PSTR, TargetBufferLength: u32, ExeName: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealiases ]]
	GetConsoleAliasesA :: proc(AliasBuffer: PSTR, AliasBufferLength: u32, ExeName: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealiaseslength ]]
	GetConsoleAliasesLengthA :: proc(ExeName: PSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealiaseslength ]]
	GetConsoleAliasesLengthW :: proc(ExeName: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealiases ]]
	GetConsoleAliasesW :: proc(AliasBuffer: PWSTR, AliasBufferLength: u32, ExeName: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealiasexes ]]
	GetConsoleAliasExesA :: proc(ExeNameBuffer: PSTR, ExeNameBufferLength: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealiasexeslength ]]
	GetConsoleAliasExesLengthA :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealiasexeslength ]]
	GetConsoleAliasExesLengthW :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealiasexes ]]
	GetConsoleAliasExesW :: proc(ExeNameBuffer: PWSTR, ExeNameBufferLength: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolealias ]]
	GetConsoleAliasW :: proc(Source: PWSTR, TargetBuffer: PWSTR, TargetBufferLength: u32, ExeName: PWSTR) -> u32 ---

	GetConsoleCommandHistoryA :: proc(Commands: PSTR, CommandBufferLength: u32, ExeName: PSTR) -> u32 ---

	GetConsoleCommandHistoryLengthA :: proc(ExeName: PSTR) -> u32 ---

	GetConsoleCommandHistoryLengthW :: proc(ExeName: PWSTR) -> u32 ---

	GetConsoleCommandHistoryW :: proc(Commands: PWSTR, CommandBufferLength: u32, ExeName: PWSTR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolecp ]]
	GetConsoleCP :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolecursorinfo ]]
	GetConsoleCursorInfo :: proc(hConsoleOutput: HANDLE, lpConsoleCursorInfo: ^CONSOLE_CURSOR_INFO) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsoledisplaymode ]]
	GetConsoleDisplayMode :: proc(lpModeFlags: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolefontsize ]]
	GetConsoleFontSize :: proc(hConsoleOutput: HANDLE, nFont: u32) -> COORD ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolehistoryinfo ]]
	GetConsoleHistoryInfo :: proc(lpConsoleHistoryInfo: ^CONSOLE_HISTORY_INFO) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolemode ]]
	GetConsoleMode :: proc(hConsoleHandle: HANDLE, lpMode: ^CONSOLE_MODE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsoleoriginaltitle ]]
	GetConsoleOriginalTitleA :: proc(lpConsoleTitle: PSTR, nSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsoleoriginaltitle ]]
	GetConsoleOriginalTitleW :: proc(lpConsoleTitle: PWSTR, nSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsoleoutputcp ]]
	GetConsoleOutputCP :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsoleprocesslist ]]
	GetConsoleProcessList :: proc(lpdwProcessList: [^]u32, dwProcessCount: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolescreenbufferinfo ]]
	GetConsoleScreenBufferInfo :: proc(
		hConsoleOutput: HANDLE,
		lpConsoleScreenBufferInfo: ^CONSOLE_SCREEN_BUFFER_INFO,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolescreenbufferinfoex ]]
	GetConsoleScreenBufferInfoEx :: proc(
		hConsoleOutput: HANDLE,
		lpConsoleScreenBufferInfoEx: ^CONSOLE_SCREEN_BUFFER_INFOEX,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsoleselectioninfo ]]
	GetConsoleSelectionInfo :: proc(lpConsoleSelectionInfo: ^CONSOLE_SELECTION_INFO) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsoletitle ]]
	GetConsoleTitleA :: proc(lpConsoleTitle: PSTR, nSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsoletitle ]]
	GetConsoleTitleW :: proc(lpConsoleTitle: PWSTR, nSize: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getconsolewindow ]]
	GetConsoleWindow :: proc() -> HWND ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getcurrentconsolefont ]]
	GetCurrentConsoleFont :: proc(
		hConsoleOutput: HANDLE,
		bMaximumWindow: BOOL,
		lpConsoleCurrentFont: ^CONSOLE_FONT_INFO,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getcurrentconsolefontex ]]
	GetCurrentConsoleFontEx :: proc(
		hConsoleOutput: HANDLE,
		bMaximumWindow: BOOL,
		lpConsoleCurrentFontEx: ^CONSOLE_FONT_INFOEX,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getlargestconsolewindowsize ]]
	GetLargestConsoleWindowSize :: proc(hConsoleOutput: HANDLE) -> COORD ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getnumberofconsoleinputevents ]]
	GetNumberOfConsoleInputEvents :: proc(hConsoleInput: HANDLE, lpNumberOfEvents: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getnumberofconsolemousebuttons ]]
	GetNumberOfConsoleMouseButtons :: proc(lpNumberOfMouseButtons: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/getstdhandle ]]
	GetStdHandle :: proc(nStdHandle: STD_HANDLE) -> HANDLE ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/peekconsoleinput ]]
	PeekConsoleInputA :: proc(
		hConsoleInput: HANDLE,
		lpBuffer: [^]INPUT_RECORD,
		nLength: u32,
		lpNumberOfEventsRead: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/peekconsoleinput ]]
	PeekConsoleInputW :: proc(
		hConsoleInput: HANDLE,
		lpBuffer: [^]INPUT_RECORD,
		nLength: u32,
		lpNumberOfEventsRead: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsole ]]
	ReadConsoleA :: proc(
		hConsoleInput: HANDLE,
		lpBuffer: rawptr,
		nNumberOfCharsToRead: u32,
		lpNumberOfCharsRead: ^u32,
		pInputControl: ^CONSOLE_READCONSOLE_CONTROL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsoleinput ]]
	ReadConsoleInputA :: proc(
		hConsoleInput: HANDLE,
		lpBuffer: [^]INPUT_RECORD,
		nLength: u32,
		lpNumberOfEventsRead: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsoleinput ]]
	ReadConsoleInputW :: proc(
		hConsoleInput: HANDLE,
		lpBuffer: [^]INPUT_RECORD,
		nLength: u32,
		lpNumberOfEventsRead: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsoleoutput ]]
	ReadConsoleOutputA :: proc(
		hConsoleOutput: HANDLE,
		lpBuffer: ^CHAR_INFO,
		dwBufferSize: COORD,
		dwBufferCoord: COORD,
		lpReadRegion: ^SMALL_RECT,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsoleoutputattribute ]]
	ReadConsoleOutputAttribute :: proc(
		hConsoleOutput: HANDLE,
		lpAttribute: [^]u16,
		nLength: u32,
		dwReadCoord: COORD,
		lpNumberOfAttrsRead: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsoleoutputcharacter ]]
	ReadConsoleOutputCharacterA :: proc(
		hConsoleOutput: HANDLE,
		lpCharacter: PSTR,
		nLength: u32,
		dwReadCoord: COORD,
		lpNumberOfCharsRead: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsoleoutputcharacter ]]
	ReadConsoleOutputCharacterW :: proc(
		hConsoleOutput: HANDLE,
		lpCharacter: PWSTR,
		nLength: u32,
		dwReadCoord: COORD,
		lpNumberOfCharsRead: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsoleoutput ]]
	ReadConsoleOutputW :: proc(
		hConsoleOutput: HANDLE,
		lpBuffer: ^CHAR_INFO,
		dwBufferSize: COORD,
		dwBufferCoord: COORD,
		lpReadRegion: ^SMALL_RECT,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/readconsole ]]
	ReadConsoleW :: proc(
		hConsoleInput: HANDLE,
		lpBuffer: rawptr,
		nNumberOfCharsToRead: u32,
		lpNumberOfCharsRead: ^u32,
		pInputControl: ^CONSOLE_READCONSOLE_CONTROL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/resizepseudoconsole ]]
	ResizePseudoConsole :: proc(hPC: HPCON, size: COORD) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/scrollconsolescreenbuffer ]]
	ScrollConsoleScreenBufferA :: proc(
		hConsoleOutput: HANDLE,
		#by_ptr lpScrollRectangle: SMALL_RECT,
		lpClipRectangle: ^SMALL_RECT,
		dwDestinationOrigin: COORD,
		#by_ptr lpFill: CHAR_INFO,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/scrollconsolescreenbuffer ]]
	ScrollConsoleScreenBufferW :: proc(
		hConsoleOutput: HANDLE,
		#by_ptr lpScrollRectangle: SMALL_RECT,
		lpClipRectangle: ^SMALL_RECT,
		dwDestinationOrigin: COORD,
		#by_ptr lpFill: CHAR_INFO,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsoleactivescreenbuffer ]]
	SetConsoleActiveScreenBuffer :: proc(hConsoleOutput: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolecp ]]
	SetConsoleCP :: proc(wCodePageID: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolectrlhandler ]]
	SetConsoleCtrlHandler :: proc(HandlerRoutine: PHANDLER_ROUTINE, Add: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolecursorinfo ]]
	SetConsoleCursorInfo :: proc(hConsoleOutput: HANDLE, #by_ptr lpConsoleCursorInfo: CONSOLE_CURSOR_INFO) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolecursorposition ]]
	SetConsoleCursorPosition :: proc(hConsoleOutput: HANDLE, dwCursorPosition: COORD) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsoledisplaymode ]]
	SetConsoleDisplayMode :: proc(hConsoleOutput: HANDLE, dwFlags: u32, lpNewScreenBufferDimensions: ^COORD) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolehistoryinfo ]]
	SetConsoleHistoryInfo :: proc(lpConsoleHistoryInfo: ^CONSOLE_HISTORY_INFO) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolemode ]]
	SetConsoleMode :: proc(hConsoleHandle: HANDLE, dwMode: CONSOLE_MODE) -> BOOL ---

	SetConsoleNumberOfCommandsA :: proc(Number: u32, ExeName: PSTR) -> BOOL ---

	SetConsoleNumberOfCommandsW :: proc(Number: u32, ExeName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsoleoutputcp ]]
	SetConsoleOutputCP :: proc(wCodePageID: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolescreenbufferinfoex ]]
	SetConsoleScreenBufferInfoEx :: proc(
		hConsoleOutput: HANDLE,
		lpConsoleScreenBufferInfoEx: ^CONSOLE_SCREEN_BUFFER_INFOEX,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolescreenbuffersize ]]
	SetConsoleScreenBufferSize :: proc(hConsoleOutput: HANDLE, dwSize: COORD) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsoletextattribute ]]
	SetConsoleTextAttribute :: proc(hConsoleOutput: HANDLE, wAttributes: CONSOLE_CHARACTER_ATTRIBUTES) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsoletitle ]]
	SetConsoleTitleA :: proc(lpConsoleTitle: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsoletitle ]]
	SetConsoleTitleW :: proc(lpConsoleTitle: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setconsolewindowinfo ]]
	SetConsoleWindowInfo :: proc(hConsoleOutput: HANDLE, bAbsolute: BOOL, #by_ptr lpConsoleWindow: SMALL_RECT) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setcurrentconsolefontex ]]
	SetCurrentConsoleFontEx :: proc(
		hConsoleOutput: HANDLE,
		bMaximumWindow: BOOL,
		lpConsoleCurrentFontEx: ^CONSOLE_FONT_INFOEX,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/setstdhandle ]]
	SetStdHandle :: proc(nStdHandle: STD_HANDLE, hHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/processenv/nf-processenv-setstdhandleex ]]
	SetStdHandleEx :: proc(nStdHandle: STD_HANDLE, hHandle: HANDLE, phPrevValue: ^HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsole ]]
	WriteConsoleA :: proc(
		hConsoleOutput: HANDLE,
		lpBuffer: PSTR,
		nNumberOfCharsToWrite: u32,
		lpNumberOfCharsWritten: ^u32,
		lpReserved: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsoleinput ]]
	WriteConsoleInputA :: proc(
		hConsoleInput: HANDLE,
		lpBuffer: [^]INPUT_RECORD,
		nLength: u32,
		lpNumberOfEventsWritten: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsoleinput ]]
	WriteConsoleInputW :: proc(
		hConsoleInput: HANDLE,
		lpBuffer: [^]INPUT_RECORD,
		nLength: u32,
		lpNumberOfEventsWritten: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsoleoutput ]]
	WriteConsoleOutputA :: proc(
		hConsoleOutput: HANDLE,
		#by_ptr lpBuffer: CHAR_INFO,
		dwBufferSize: COORD,
		dwBufferCoord: COORD,
		lpWriteRegion: ^SMALL_RECT,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsoleoutputattribute ]]
	WriteConsoleOutputAttribute :: proc(
		hConsoleOutput: HANDLE,
		lpAttribute: [^]u16,
		nLength: u32,
		dwWriteCoord: COORD,
		lpNumberOfAttrsWritten: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsoleoutputcharacter ]]
	WriteConsoleOutputCharacterA :: proc(
		hConsoleOutput: HANDLE,
		lpCharacter: PSTR,
		nLength: u32,
		dwWriteCoord: COORD,
		lpNumberOfCharsWritten: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsoleoutputcharacter ]]
	WriteConsoleOutputCharacterW :: proc(
		hConsoleOutput: HANDLE,
		lpCharacter: PWSTR,
		nLength: u32,
		dwWriteCoord: COORD,
		lpNumberOfCharsWritten: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsoleoutput ]]
	WriteConsoleOutputW :: proc(
		hConsoleOutput: HANDLE,
		#by_ptr lpBuffer: CHAR_INFO,
		dwBufferSize: COORD,
		dwBufferCoord: COORD,
		lpWriteRegion: ^SMALL_RECT,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/console/writeconsole ]]
	WriteConsoleW :: proc(
		hConsoleOutput: HANDLE,
		lpBuffer: PWSTR,
		nNumberOfCharsToWrite: u32,
		lpNumberOfCharsWritten: ^u32,
		lpReserved: rawptr,
	) -> BOOL ---
}

@(default_calling_convention="system")
foreign user32 {
	ConsoleControl :: proc(
		Command: CONSOLECONTROL,
		ConsoleInformation: rawptr,
		ConsoleInformationLength: u32,
	) -> NTSTATUS ---
}

// [[ Documentation; https://learn.microsoft.com/windows/console/char-info-str ]]
CHAR_INFO :: struct {
	Char: struct #raw_union {
		UnicodeChar: u16,
		AsciiChar: CHAR,
	},
	Attributes: u16,
}

CONSOLE_CARET_INFO :: struct {
	hwnd: HWND,
	rc: RECT,
}

CONSOLE_CHARACTER_ATTRIBUTES :: distinct bit_set[enum {
	FOREGROUND_BLUE = 0,
	FOREGROUND_GREEN = 1,
	FOREGROUND_RED = 2,
	FOREGROUND_INTENSITY = 3,
	BACKGROUND_BLUE = 4,
	BACKGROUND_GREEN = 5,
	BACKGROUND_RED = 6,
	BACKGROUND_INTENSITY = 7,
	COMMON_LVB_LEADING_BYTE = 8,
	COMMON_LVB_TRAILING_BYTE = 9,
	COMMON_LVB_GRID_HORIZONTAL = 10,
	COMMON_LVB_GRID_LVERTICAL = 11,
	COMMON_LVB_GRID_RVERTICAL = 12,
	COMMON_LVB_REVERSE_VIDEO = 14,
	COMMON_LVB_UNDERSCORE = 15,
}; u16]
CONSOLE_CHARACTER_ATTRIBUTES_COMMON_LVB_SBCSDBCS :: transmute(CONSOLE_CHARACTER_ATTRIBUTES)u16(0x0300)

// [[ Documentation; https://learn.microsoft.com/windows/console/console-cursor-info-str ]]
CONSOLE_CURSOR_INFO :: struct {
	dwSize: u32,
	bVisible: BOOL,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/console-font-info-str ]]
CONSOLE_FONT_INFO :: struct {
	nFont: u32,
	dwFontSize: COORD,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/console-font-infoex ]]
CONSOLE_FONT_INFOEX :: struct {
	cbSize: u32,
	nFont: u32,
	dwFontSize: COORD,
	FontFamily: u32,
	FontWeight: u32,
	FaceName: [32]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/console-history-info ]]
CONSOLE_HISTORY_INFO :: struct {
	cbSize: u32,
	HistoryBufferSize: u32,
	NumberOfHistoryBuffers: u32,
	dwFlags: u32,
}

CONSOLE_MODE :: distinct bit_set[enum {
	ENABLE_PROCESSED_INPUT = 0,
	ENABLE_LINE_INPUT = 1,
	ENABLE_ECHO_INPUT = 2,
	ENABLE_WINDOW_INPUT = 3,
	ENABLE_MOUSE_INPUT = 4,
	ENABLE_INSERT_MODE = 5,
	ENABLE_QUICK_EDIT_MODE = 6,
	ENABLE_EXTENDED_FLAGS = 7,
	ENABLE_AUTO_POSITION = 8,
	ENABLE_VIRTUAL_TERMINAL_INPUT = 9,
	ENABLE_PROCESSED_OUTPUT = 0,
	ENABLE_WRAP_AT_EOL_OUTPUT = 1,
	ENABLE_VIRTUAL_TERMINAL_PROCESSING = 2,
	DISABLE_NEWLINE_AUTO_RETURN = 3,
	ENABLE_LVB_GRID_WORLDWIDE = 4,
}; u32]

CONSOLE_PROCESS_INFO :: struct {
	dwProcessID: u32,
	dwFlags: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/console-readconsole-control ]]
CONSOLE_READCONSOLE_CONTROL :: struct {
	nLength: u32,
	nInitialChars: u32,
	dwCtrlWakeupMask: u32,
	dwControlKeyState: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/console-screen-buffer-info-str ]]
CONSOLE_SCREEN_BUFFER_INFO :: struct {
	dwSize: COORD,
	dwCursorPosition: COORD,
	wAttributes: CONSOLE_CHARACTER_ATTRIBUTES,
	srWindow: SMALL_RECT,
	dwMaximumWindowSize: COORD,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/console-screen-buffer-infoex ]]
CONSOLE_SCREEN_BUFFER_INFOEX :: struct {
	cbSize: u32,
	dwSize: COORD,
	dwCursorPosition: COORD,
	wAttributes: CONSOLE_CHARACTER_ATTRIBUTES,
	srWindow: SMALL_RECT,
	dwMaximumWindowSize: COORD,
	wPopupAttributes: u16,
	bFullscreenSupported: BOOL,
	ColorTable: [16]COLORREF,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/console-selection-info-str ]]
CONSOLE_SELECTION_INFO :: struct {
	dwFlags: u32,
	dwSelectionAnchor: COORD,
	srSelection: SMALL_RECT,
}

CONSOLECONTROL :: enum i32 {
	Reserved1 = 0,
	ConsoleNotifyConsoleApplication = 1,
	Reserved2 = 2,
	ConsoleSetCaretInfo = 3,
	Reserved3 = 4,
	ConsoleSetForeground = 5,
	ConsoleSetWindowOwner = 6,
	ConsoleEndTask = 7,
}

CONSOLEENDTASK :: struct {
	ProcessId: HANDLE,
	hwnd: HWND,
	ConsoleEventCode: u32,
	ConsoleFlags: u32,
}

CONSOLESETFOREGROUND :: struct {
	hProcess: HANDLE,
	bForeground: BOOL,
}

CONSOLEWINDOWOWNER :: struct {
	hwnd: HWND,
	ProcessId: u32,
	ThreadId: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/coord-str ]]
COORD :: struct {
	X: i16,
	Y: i16,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/focus-event-record-str ]]
FOCUS_EVENT_RECORD :: struct {
	bSetFocus: BOOL,
}

HPCON :: int

// [[ Documentation; https://learn.microsoft.com/windows/console/input-record-str ]]
INPUT_RECORD :: struct {
	EventType: u16,
	Event: struct #raw_union {
		KeyEvent: KEY_EVENT_RECORD,
		MouseEvent: MOUSE_EVENT_RECORD,
		WindowBufferSizeEvent: WINDOW_BUFFER_SIZE_RECORD,
		MenuEvent: MENU_EVENT_RECORD,
		FocusEvent: FOCUS_EVENT_RECORD,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/console/key-event-record-str ]]
KEY_EVENT_RECORD :: struct {
	bKeyDown: BOOL,
	wRepeatCount: u16,
	wVirtualKeyCode: u16,
	wVirtualScanCode: u16,
	uChar: struct #raw_union {
		UnicodeChar: u16,
		AsciiChar: CHAR,
	},
	dwControlKeyState: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/menu-event-record-str ]]
MENU_EVENT_RECORD :: struct {
	dwCommandId: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/mouse-event-record-str ]]
MOUSE_EVENT_RECORD :: struct {
	dwMousePosition: COORD,
	dwButtonState: u32,
	dwControlKeyState: u32,
	dwEventFlags: u32,
}

PHANDLER_ROUTINE :: #type proc "system" (CtrlType: u32) -> BOOL

// [[ Documentation; https://learn.microsoft.com/windows/console/small-rect-str ]]
SMALL_RECT :: struct {
	Left: i16,
	Top: i16,
	Right: i16,
	Bottom: i16,
}

STD_HANDLE :: enum u32 {
	INPUT_HANDLE = 0xFFFFFFF6,
	OUTPUT_HANDLE = 0xFFFFFFF5,
	ERROR_HANDLE = 0xFFFFFFF4,
}

// [[ Documentation; https://learn.microsoft.com/windows/console/window-buffer-size-record-str ]]
WINDOW_BUFFER_SIZE_RECORD :: struct {
	dwSize: COORD,
}

ALTNUMPAD_BIT :: 67108864
ATTACH_PARENT_PROCESS :: 4294967295
CAPSLOCK_ON :: 128
CONSOLE_FULLSCREEN :: 1
CONSOLE_FULLSCREEN_HARDWARE :: 2
CONSOLE_FULLSCREEN_MODE :: 1
CONSOLE_MOUSE_DOWN :: 8
CONSOLE_MOUSE_SELECTION :: 4
CONSOLE_NO_SELECTION :: 0
CONSOLE_SELECTION_IN_PROGRESS :: 1
CONSOLE_SELECTION_NOT_EMPTY :: 2
CONSOLE_TEXTMODE_BUFFER :: 1
CONSOLE_WINDOWED_MODE :: 2
CTRL_BREAK_EVENT :: 1
CTRL_C_EVENT :: 0
CTRL_CLOSE_EVENT :: 2
CTRL_LOGOFF_EVENT :: 5
CTRL_SHUTDOWN_EVENT :: 6
DOUBLE_CLICK :: 2
ENHANCED_KEY :: 256
FOCUS_EVENT :: 16
FROM_LEFT_1ST_BUTTON_PRESSED :: 1
FROM_LEFT_2ND_BUTTON_PRESSED :: 4
FROM_LEFT_3RD_BUTTON_PRESSED :: 8
FROM_LEFT_4TH_BUTTON_PRESSED :: 16
HISTORY_NO_DUP_FLAG :: 1
KEY_EVENT :: 1
LEFT_ALT_PRESSED :: 2
LEFT_CTRL_PRESSED :: 8
MENU_EVENT :: 8
MOUSE_EVENT :: 2
MOUSE_HWHEELED :: 8
MOUSE_MOVED :: 1
MOUSE_WHEELED :: 4
NLS_ALPHANUMERIC :: 0
NLS_DBCSCHAR :: 65536
NLS_HIRAGANA :: 262144
NLS_IME_CONVERSION :: 8388608
NLS_IME_DISABLE :: 536870912
NLS_KATAKANA :: 131072
NLS_ROMAN :: 4194304
NUMLOCK_ON :: 32
PSEUDOCONSOLE_INHERIT_CURSOR :: 1
RIGHT_ALT_PRESSED :: 1
RIGHT_CTRL_PRESSED :: 4
RIGHTMOST_BUTTON_PRESSED :: 2
SCROLLLOCK_ON :: 64
SHIFT_PRESSED :: 16
WINDOW_BUFFER_SIZE_EVENT :: 4

