package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wtypes/ne-wtypes-varenum ]]
VARENUM :: distinct bit_set[enum {
	NULL = 0,
	I2 = 1,
	R4 = 2,
	BSTR = 3,
	I1 = 4,
	FILETIME = 6,
	VECTOR = 12,
	ARRAY = 13,
	BYREF = 14,
	RESERVED = 15,
}; u16]
VARENUM_EMPTY :: transmute(VARENUM)u16(0x0000)
VARENUM_I4 :: transmute(VARENUM)u16(0x0003)
VARENUM_R8 :: transmute(VARENUM)u16(0x0005)
VARENUM_CY :: transmute(VARENUM)u16(0x0006)
VARENUM_DATE :: transmute(VARENUM)u16(0x0007)
VARENUM_DISPATCH :: transmute(VARENUM)u16(0x0009)
VARENUM_ERROR :: transmute(VARENUM)u16(0x000A)
VARENUM_BOOL :: transmute(VARENUM)u16(0x000B)
VARENUM_VARIANT :: transmute(VARENUM)u16(0x000C)
VARENUM_UNKNOWN :: transmute(VARENUM)u16(0x000D)
VARENUM_DECIMAL :: transmute(VARENUM)u16(0x000E)
VARENUM_UI1 :: transmute(VARENUM)u16(0x0011)
VARENUM_UI2 :: transmute(VARENUM)u16(0x0012)
VARENUM_UI4 :: transmute(VARENUM)u16(0x0013)
VARENUM_I8 :: transmute(VARENUM)u16(0x0014)
VARENUM_UI8 :: transmute(VARENUM)u16(0x0015)
VARENUM_INT :: transmute(VARENUM)u16(0x0016)
VARENUM_UINT :: transmute(VARENUM)u16(0x0017)
VARENUM_VOID :: transmute(VARENUM)u16(0x0018)
VARENUM_HRESULT :: transmute(VARENUM)u16(0x0019)
VARENUM_PTR :: transmute(VARENUM)u16(0x001A)
VARENUM_SAFEARRAY :: transmute(VARENUM)u16(0x001B)
VARENUM_CARRAY :: transmute(VARENUM)u16(0x001C)
VARENUM_USERDEFINED :: transmute(VARENUM)u16(0x001D)
VARENUM_LPSTR :: transmute(VARENUM)u16(0x001E)
VARENUM_LPWSTR :: transmute(VARENUM)u16(0x001F)
VARENUM_RECORD :: transmute(VARENUM)u16(0x0024)
VARENUM_INT_PTR :: transmute(VARENUM)u16(0x0025)
VARENUM_UINT_PTR :: transmute(VARENUM)u16(0x0026)
VARENUM_BLOB :: transmute(VARENUM)u16(0x0041)
VARENUM_STREAM :: transmute(VARENUM)u16(0x0042)
VARENUM_STORAGE :: transmute(VARENUM)u16(0x0043)
VARENUM_STREAMED_OBJECT :: transmute(VARENUM)u16(0x0044)
VARENUM_STORED_OBJECT :: transmute(VARENUM)u16(0x0045)
VARENUM_BLOB_OBJECT :: transmute(VARENUM)u16(0x0046)
VARENUM_CF :: transmute(VARENUM)u16(0x0047)
VARENUM_CLSID :: transmute(VARENUM)u16(0x0048)
VARENUM_VERSIONED_STREAM :: transmute(VARENUM)u16(0x0049)
VARENUM_BSTR_BLOB :: transmute(VARENUM)u16(0x0FFF)
VARENUM_ILLEGAL :: transmute(VARENUM)u16(0xFFFF)
VARENUM_ILLEGALMASKED :: transmute(VARENUM)u16(0x0FFF)
VARENUM_TYPEMASK :: transmute(VARENUM)u16(0x0FFF)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-variant ]]
VARIANT :: struct {
	using _: struct #raw_union {
		using _: struct {
			vt: VARENUM,
			wReserved1: u16,
			wReserved2: u16,
			wReserved3: u16,
			using _: struct #raw_union {
				llVal: i64,
				lVal: i32,
				bVal: u8,
				iVal: i16,
				fltVal: f32,
				dblVal: f64,
				boolVal: VARIANT_BOOL,
				__OBSOLETE__VARIANT_BOOL: VARIANT_BOOL,
				scode: i32,
				cyVal: CY,
				date: f64,
				bstrVal: BSTR,
				punkVal: ^IUnknown,
				pdispVal: ^IDispatch,
				parray: ^SAFEARRAY,
				pbVal: ^u8,
				piVal: ^i16,
				plVal: ^i32,
				pllVal: ^i64,
				pfltVal: ^f32,
				pdblVal: ^f64,
				pboolVal: ^VARIANT_BOOL,
				__OBSOLETE__VARIANT_PBOOL: ^VARIANT_BOOL,
				pscode: ^i32,
				pcyVal: ^CY,
				pdate: ^f64,
				pbstrVal: ^BSTR,
				ppunkVal: ^^IUnknown,
				ppdispVal: ^^IDispatch,
				pparray: ^SAFEARRAY,
				pvarVal: ^VARIANT,
				byref: rawptr,
				cVal: CHAR,
				uiVal: u16,
				ulVal: u32,
				ullVal: u64,
				intVal: i32,
				uintVal: u32,
				pdecVal: ^DECIMAL,
				pcVal: PSTR,
				puiVal: ^u16,
				pulVal: ^u32,
				pullVal: ^u64,
				pintVal: ^i32,
				puintVal: ^u32,
				using _: struct {
					pvRecord: rawptr,
					pRecInfo: ^IRecordInfo,
				},
			},
		},
		decVal: DECIMAL,
	},
}

