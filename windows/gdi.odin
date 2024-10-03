package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-abc ]]
ABC :: struct {
	abcA: i32,
	abcB: u32,
	abcC: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-axeslista ]]
AXESLISTA :: struct {
	axlReserved: u32,
	axlNumAxes: u32,
	axlAxisInfo: [16]AXISINFOA,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-axeslistw ]]
AXESLISTW :: struct {
	axlReserved: u32,
	axlNumAxes: u32,
	axlAxisInfo: [16]AXISINFOW,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-axisinfoa ]]
AXISINFOA :: struct {
	axMinValue: i32,
	axMaxValue: i32,
	axAxisName: [16]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-axisinfow ]]
AXISINFOW :: struct {
	axMinValue: i32,
	axMaxValue: i32,
	axAxisName: [16]u16,
}

ETO_OPTIONS :: distinct bit_set[enum {
	OPAQUE = 1,
	CLIPPED = 2,
	GLYPH_INDEX = 4,
	RTLREADING = 7,
	NUMERICSLOCAL = 10,
	NUMERICSLATIN = 11,
	IGNORELANGUAGE = 12,
	PDY = 13,
	REVERSE_INDEX_MAP = 16,
}; u32]

HDC :: rawptr

HFONT :: rawptr

HMONITOR :: rawptr

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-newtextmetrica ]]
NEWTEXTMETRICA :: struct {
	tmHeight: i32,
	tmAscent: i32,
	tmDescent: i32,
	tmInternalLeading: i32,
	tmExternalLeading: i32,
	tmAveCharWidth: i32,
	tmMaxCharWidth: i32,
	tmWeight: i32,
	tmOverhang: i32,
	tmDigitizedAspectX: i32,
	tmDigitizedAspectY: i32,
	tmFirstChar: u8,
	tmLastChar: u8,
	tmDefaultChar: u8,
	tmBreakChar: u8,
	tmItalic: u8,
	tmUnderlined: u8,
	tmStruckOut: u8,
	tmPitchAndFamily: TMPF_FLAGS,
	tmCharSet: u8,
	ntmFlags: u32,
	ntmSizeEM: u32,
	ntmCellHeight: u32,
	ntmAvgWidth: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-newtextmetricw ]]
NEWTEXTMETRICW :: struct {
	tmHeight: i32,
	tmAscent: i32,
	tmDescent: i32,
	tmInternalLeading: i32,
	tmExternalLeading: i32,
	tmAveCharWidth: i32,
	tmMaxCharWidth: i32,
	tmWeight: i32,
	tmOverhang: i32,
	tmDigitizedAspectX: i32,
	tmDigitizedAspectY: i32,
	tmFirstChar: u16,
	tmLastChar: u16,
	tmDefaultChar: u16,
	tmBreakChar: u16,
	tmItalic: u8,
	tmUnderlined: u8,
	tmStruckOut: u8,
	tmPitchAndFamily: TMPF_FLAGS,
	tmCharSet: u8,
	ntmFlags: u32,
	ntmSizeEM: u32,
	ntmCellHeight: u32,
	ntmAvgWidth: u32,
}

TMPF_FLAGS :: distinct bit_set[enum {
	FIXED_PITCH = 0,
	VECTOR = 1,
	DEVICE = 3,
	TRUETYPE = 2,
}; u8]

