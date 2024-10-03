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

FONT_CHARSET :: enum u8 {
	ANSI_CHARSET = 0x00,
	DEFAULT_CHARSET = 0x01,
	SYMBOL_CHARSET = 0x02,
	SHIFTJIS_CHARSET = 0x80,
	HANGEUL_CHARSET = 0x81,
	HANGUL_CHARSET = 0x81,
	GB2312_CHARSET = 0x86,
	CHINESEBIG5_CHARSET = 0x88,
	OEM_CHARSET = 0xFF,
	JOHAB_CHARSET = 0x82,
	HEBREW_CHARSET = 0xB1,
	ARABIC_CHARSET = 0xB2,
	GREEK_CHARSET = 0xA1,
	TURKISH_CHARSET = 0xA2,
	VIETNAMESE_CHARSET = 0xA3,
	THAI_CHARSET = 0xDE,
	EASTEUROPE_CHARSET = 0xEE,
	RUSSIAN_CHARSET = 0xCC,
	MAC_CHARSET = 0x4D,
	BALTIC_CHARSET = 0xBA,
}

FONT_CLIP_PRECISION :: distinct bit_set[enum {
	CHARACTER_PRECIS = 0,
	STROKE_PRECIS = 1,
	LH_ANGLES = 4,
	TT_ALWAYS = 5,
	DFA_DISABLE = 6,
	EMBEDDED = 7,
	DFA_OVERRIDE = 6,
}; u8]
FONT_CLIP_PRECISION_DEFAULT_PRECIS :: transmute(FONT_CLIP_PRECISION)u8(0x00)
FONT_CLIP_PRECISION_MASK :: transmute(FONT_CLIP_PRECISION)u8(0x0F)

FONT_OUTPUT_PRECISION :: enum u8 {
	DEFAULT_PRECIS = 0x00,
	STRING_PRECIS = 0x01,
	CHARACTER_PRECIS = 0x02,
	STROKE_PRECIS = 0x03,
	TT_PRECIS = 0x04,
	DEVICE_PRECIS = 0x05,
	RASTER_PRECIS = 0x06,
	TT_ONLY_PRECIS = 0x07,
	OUTLINE_PRECIS = 0x08,
	SCREEN_OUTLINE_PRECIS = 0x09,
	PS_ONLY_PRECIS = 0x0A,
}

FONT_QUALITY :: enum u8 {
	DEFAULT_QUALITY = 0x00,
	DRAFT_QUALITY = 0x01,
	PROOF_QUALITY = 0x02,
	NONANTIALIASED_QUALITY = 0x03,
	ANTIALIASED_QUALITY = 0x04,
	CLEARTYPE_QUALITY = 0x05,
}

HBITMAP :: rawptr

HDC :: rawptr

HENHMETAFILE :: rawptr

HFONT :: rawptr

HMONITOR :: rawptr

HPALETTE :: rawptr

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-logfontw ]]
LOGFONTW :: struct {
	lfHeight: i32,
	lfWidth: i32,
	lfEscapement: i32,
	lfOrientation: i32,
	lfWeight: i32,
	lfItalic: u8,
	lfUnderline: u8,
	lfStrikeOut: u8,
	lfCharSet: FONT_CHARSET,
	lfOutPrecision: FONT_OUTPUT_PRECISION,
	lfClipPrecision: FONT_CLIP_PRECISION,
	lfQuality: FONT_QUALITY,
	lfPitchAndFamily: u8,
	lfFaceName: [32]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-logpalette ]]
LOGPALETTE :: struct {
	palVersion: u16,
	palNumEntries: u16,
	palPalEntry: [1]PALETTEENTRY,
}

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

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-paletteentry ]]
PALETTEENTRY :: struct {
	peRed: u8,
	peGreen: u8,
	peBlue: u8,
	peFlags: u8,
}

TMPF_FLAGS :: distinct bit_set[enum {
	FIXED_PITCH = 0,
	VECTOR = 1,
	DEVICE = 3,
	TRUETYPE = 2,
}; u8]

