package windows

foreign import advapi32 "system:advapi32.lib"
foreign import bcp47mrm "system:bcp47mrm.lib"
foreign import elscore "system:elscore.lib"
foreign import gdi32 "system:gdi32.lib"
foreign import icu "system:icu.lib"
foreign import kernel32 "system:kernel32.lib"
foreign import normaliz "system:normaliz.lib"
foreign import usp10 "system:usp10.lib"

@(default_calling_convention="system")
foreign advapi32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-istextunicode ]]
	IsTextUnicode :: proc(lpv: rawptr, iSize: i32, lpiResult: ^IS_TEXT_UNICODE_RESULT) -> BOOL ---
}

@(default_calling_convention="system")
foreign bcp47mrm {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/bcp47mrm/nf-bcp47mrm-getdistanceofclosestlanguageinlist ]]
	GetDistanceOfClosestLanguageInList :: proc(
		pszLanguage: PWSTR,
		pszLanguagesList: PWSTR,
		wchListDelimiter: u16,
		pClosestDistance: ^f64,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/bcp47mrm/nf-bcp47mrm-iswellformedtag ]]
	IsWellFormedTag :: proc(pszTag: PWSTR) -> u8 ---
}

@(default_calling_convention="system")
foreign elscore {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/nf-elscore-mappingdoaction ]]
	MappingDoAction :: proc(pBag: ^MAPPING_PROPERTY_BAG, dwRangeIndex: u32, pszActionId: PWSTR) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/nf-elscore-mappingfreepropertybag ]]
	MappingFreePropertyBag :: proc(pBag: ^MAPPING_PROPERTY_BAG) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/nf-elscore-mappingfreeservices ]]
	MappingFreeServices :: proc(pServiceInfo: ^MAPPING_SERVICE_INFO) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/nf-elscore-mappinggetservices ]]
	MappingGetServices :: proc(
		pOptions: ^MAPPING_ENUM_OPTIONS,
		prgServices: ^MAPPING_SERVICE_INFO,
		pdwServicesCount: ^u32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/nf-elscore-mappingrecognizetext ]]
	MappingRecognizeText :: proc(
		pServiceInfo: ^MAPPING_SERVICE_INFO,
		pszText: PWSTR,
		dwLength: u32,
		dwIndex: u32,
		pOptions: ^MAPPING_OPTIONS,
		pbag: ^MAPPING_PROPERTY_BAG,
	) -> HRESULT ---
}

@(default_calling_convention="system")
foreign gdi32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-gettextcharset ]]
	GetTextCharset :: proc(hdc: HDC) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-gettextcharsetinfo ]]
	GetTextCharsetInfo :: proc(hdc: HDC, lpSig: ^FONTSIGNATURE, dwFlags: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-translatecharsetinfo ]]
	TranslateCharsetInfo :: proc(lpSrc: ^u32, lpCs: ^CHARSETINFO, dwFlags: TRANSLATE_CHARSET_INFO_FLAGS) -> BOOL ---
}

@(default_calling_convention="system")
foreign icu {
	u_austrcpy :: proc(dst: PSTR, src: ^u16) -> PSTR ---

	u_austrncpy :: proc(dst: PSTR, src: ^u16, n: i32) -> PSTR ---

	u_catclose :: proc(catd: ^UResourceBundle) ---

	u_catgets :: proc(
		catd: ^UResourceBundle,
		set_num: i32,
		msg_num: i32,
		s: ^u16,
		len: ^i32,
		ec: ^UErrorCode,
	) -> ^u16 ---

	u_catopen :: proc(name: PSTR, locale: PSTR, ec: ^UErrorCode) -> ^UResourceBundle ---

	u_charAge :: proc(c: i32, versionArray: ^u8) ---

	u_charDigitValue :: proc(c: i32) -> i32 ---

	u_charDirection :: proc(c: i32) -> UCharDirection ---

	u_charFromName :: proc(nameChoice: UCharNameChoice, name: PSTR, pErrorCode: ^UErrorCode) -> i32 ---

	u_charMirror :: proc(c: i32) -> i32 ---

	u_charName :: proc(
		code: i32,
		nameChoice: UCharNameChoice,
		buffer: PSTR,
		bufferLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	u_charsToUChars :: proc(cs: PSTR, us: ^u16, length: i32) ---

	u_charType :: proc(c: i32) -> i8 ---

	u_cleanup :: proc() ---

	u_countChar32 :: proc(s: ^u16, length: i32) -> i32 ---

	u_digit :: proc(ch: i32, radix: i8) -> i32 ---

	u_enumCharNames :: proc(
		start: i32,
		limit: i32,
		fn: ^UEnumCharNamesFn,
		_context: rawptr,
		nameChoice: UCharNameChoice,
		pErrorCode: ^UErrorCode,
	) ---

	u_enumCharTypes :: proc(enumRange: ^UCharEnumTypeRange, _context: rawptr) ---

	u_errorName :: proc(code: UErrorCode) -> PSTR ---

	u_foldCase :: proc(c: i32, options: u32) -> i32 ---

	u_forDigit :: proc(digit: i32, radix: i8) -> i32 ---

	u_formatMessage :: proc(
		locale: PSTR,
		pattern: ^u16,
		patternLength: i32,
		result: ^u16,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	u_formatMessageWithError :: proc(
		locale: PSTR,
		pattern: ^u16,
		patternLength: i32,
		result: ^u16,
		resultLength: i32,
		parseError: ^UParseError,
		status: ^UErrorCode,
	) -> i32 ---

	u_getBidiPairedBracket :: proc(c: i32) -> i32 ---

	u_getBinaryPropertySet :: proc(property: UProperty, pErrorCode: ^UErrorCode) -> ^USet ---

	u_getCombiningClass :: proc(c: i32) -> u8 ---

	u_getDataVersion :: proc(dataVersionFillin: ^u8, status: ^UErrorCode) ---

	u_getFC_NFKC_Closure :: proc(c: i32, dest: ^u16, destCapacity: i32, pErrorCode: ^UErrorCode) -> i32 ---

	u_getIntPropertyMap :: proc(property: UProperty, pErrorCode: ^UErrorCode) -> ^UCPMap ---

	u_getIntPropertyMaxValue :: proc(which: UProperty) -> i32 ---

	u_getIntPropertyMinValue :: proc(which: UProperty) -> i32 ---

	u_getIntPropertyValue :: proc(c: i32, which: UProperty) -> i32 ---

	u_getNumericValue :: proc(c: i32) -> f64 ---

	u_getPropertyEnum :: proc(alias: PSTR) -> UProperty ---

	u_getPropertyName :: proc(property: UProperty, nameChoice: UPropertyNameChoice) -> PSTR ---

	u_getPropertyValueEnum :: proc(property: UProperty, alias: PSTR) -> i32 ---

	u_getPropertyValueName :: proc(property: UProperty, value: i32, nameChoice: UPropertyNameChoice) -> PSTR ---

	u_getUnicodeVersion :: proc(versionArray: ^u8) ---

	u_getVersion :: proc(versionArray: ^u8) ---

	u_hasBinaryProperty :: proc(c: i32, which: UProperty) -> i8 ---

	u_init :: proc(status: ^UErrorCode) ---

	u_isalnum :: proc(c: i32) -> i8 ---

	u_isalpha :: proc(c: i32) -> i8 ---

	u_isbase :: proc(c: i32) -> i8 ---

	u_isblank :: proc(c: i32) -> i8 ---

	u_iscntrl :: proc(c: i32) -> i8 ---

	u_isdefined :: proc(c: i32) -> i8 ---

	u_isdigit :: proc(c: i32) -> i8 ---

	u_isgraph :: proc(c: i32) -> i8 ---

	u_isIDIgnorable :: proc(c: i32) -> i8 ---

	u_isIDPart :: proc(c: i32) -> i8 ---

	u_isIDStart :: proc(c: i32) -> i8 ---

	u_isISOControl :: proc(c: i32) -> i8 ---

	u_isJavaIDPart :: proc(c: i32) -> i8 ---

	u_isJavaIDStart :: proc(c: i32) -> i8 ---

	u_isJavaSpaceChar :: proc(c: i32) -> i8 ---

	u_islower :: proc(c: i32) -> i8 ---

	u_isMirrored :: proc(c: i32) -> i8 ---

	u_isprint :: proc(c: i32) -> i8 ---

	u_ispunct :: proc(c: i32) -> i8 ---

	u_isspace :: proc(c: i32) -> i8 ---

	u_istitle :: proc(c: i32) -> i8 ---

	u_isUAlphabetic :: proc(c: i32) -> i8 ---

	u_isULowercase :: proc(c: i32) -> i8 ---

	u_isupper :: proc(c: i32) -> i8 ---

	u_isUUppercase :: proc(c: i32) -> i8 ---

	u_isUWhiteSpace :: proc(c: i32) -> i8 ---

	u_isWhitespace :: proc(c: i32) -> i8 ---

	u_isxdigit :: proc(c: i32) -> i8 ---

	u_memcasecmp :: proc(s1: ^u16, s2: ^u16, length: i32, options: u32) -> i32 ---

	u_memchr :: proc(s: ^u16, c: u16, count: i32) -> ^u16 ---

	u_memchr32 :: proc(s: ^u16, c: i32, count: i32) -> ^u16 ---

	u_memcmp :: proc(buf1: ^u16, buf2: ^u16, count: i32) -> i32 ---

	u_memcmpCodePointOrder :: proc(s1: ^u16, s2: ^u16, count: i32) -> i32 ---

	u_memcpy :: proc(dest: ^u16, src: ^u16, count: i32) -> ^u16 ---

	u_memmove :: proc(dest: ^u16, src: ^u16, count: i32) -> ^u16 ---

	u_memrchr :: proc(s: ^u16, c: u16, count: i32) -> ^u16 ---

	u_memrchr32 :: proc(s: ^u16, c: i32, count: i32) -> ^u16 ---

	u_memset :: proc(dest: ^u16, c: u16, count: i32) -> ^u16 ---

	u_parseMessage :: proc(
		locale: PSTR,
		pattern: ^u16,
		patternLength: i32,
		source: ^u16,
		sourceLength: i32,
		status: ^UErrorCode,
	) ---

	u_parseMessageWithError :: proc(
		locale: PSTR,
		pattern: ^u16,
		patternLength: i32,
		source: ^u16,
		sourceLength: i32,
		parseError: ^UParseError,
		status: ^UErrorCode,
	) ---

	u_setMemoryFunctions :: proc(
		_context: rawptr,
		a: ^UMemAllocFn,
		r: ^UMemReallocFn,
		f: ^UMemFreeFn,
		status: ^UErrorCode,
	) ---

	u_shapeArabic :: proc(
		source: ^u16,
		sourceLength: i32,
		dest: ^u16,
		destSize: i32,
		options: u32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	u_strcasecmp :: proc(s1: ^u16, s2: ^u16, options: u32) -> i32 ---

	u_strCaseCompare :: proc(s1: ^u16, length1: i32, s2: ^u16, length2: i32, options: u32, pErrorCode: ^UErrorCode) -> i32 ---

	u_strcat :: proc(dst: ^u16, src: ^u16) -> ^u16 ---

	u_strchr :: proc(s: ^u16, c: u16) -> ^u16 ---

	u_strchr32 :: proc(s: ^u16, c: i32) -> ^u16 ---

	u_strcmp :: proc(s1: ^u16, s2: ^u16) -> i32 ---

	u_strcmpCodePointOrder :: proc(s1: ^u16, s2: ^u16) -> i32 ---

	u_strCompare :: proc(s1: ^u16, length1: i32, s2: ^u16, length2: i32, codePointOrder: i8) -> i32 ---

	u_strCompareIter :: proc(iter1: ^UCharIterator, iter2: ^UCharIterator, codePointOrder: i8) -> i32 ---

	u_strcpy :: proc(dst: ^u16, src: ^u16) -> ^u16 ---

	u_strcspn :: proc(string: ^u16, matchSet: ^u16) -> i32 ---

	u_strFindFirst :: proc(s: ^u16, length: i32, substring: ^u16, subLength: i32) -> ^u16 ---

	u_strFindLast :: proc(s: ^u16, length: i32, substring: ^u16, subLength: i32) -> ^u16 ---

	u_strFoldCase :: proc(
		dest: ^u16,
		destCapacity: i32,
		src: ^u16,
		srcLength: i32,
		options: u32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	u_strFromJavaModifiedUTF8WithSub :: proc(
		dest: ^u16,
		destCapacity: i32,
		pDestLength: ^i32,
		src: PSTR,
		srcLength: i32,
		subchar: i32,
		pNumSubstitutions: ^i32,
		pErrorCode: ^UErrorCode,
	) -> ^u16 ---

	u_strFromUTF32 :: proc(
		dest: ^u16,
		destCapacity: i32,
		pDestLength: ^i32,
		src: ^i32,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> ^u16 ---

	u_strFromUTF32WithSub :: proc(
		dest: ^u16,
		destCapacity: i32,
		pDestLength: ^i32,
		src: ^i32,
		srcLength: i32,
		subchar: i32,
		pNumSubstitutions: ^i32,
		pErrorCode: ^UErrorCode,
	) -> ^u16 ---

	u_strFromUTF8 :: proc(
		dest: ^u16,
		destCapacity: i32,
		pDestLength: ^i32,
		src: PSTR,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> ^u16 ---

	u_strFromUTF8Lenient :: proc(
		dest: ^u16,
		destCapacity: i32,
		pDestLength: ^i32,
		src: PSTR,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> ^u16 ---

	u_strFromUTF8WithSub :: proc(
		dest: ^u16,
		destCapacity: i32,
		pDestLength: ^i32,
		src: PSTR,
		srcLength: i32,
		subchar: i32,
		pNumSubstitutions: ^i32,
		pErrorCode: ^UErrorCode,
	) -> ^u16 ---

	u_strFromWCS :: proc(
		dest: ^u16,
		destCapacity: i32,
		pDestLength: ^i32,
		src: PWSTR,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> ^u16 ---

	u_strHasMoreChar32Than :: proc(s: ^u16, length: i32, number: i32) -> i8 ---

	u_strlen :: proc(s: ^u16) -> i32 ---

	u_strncasecmp :: proc(s1: ^u16, s2: ^u16, n: i32, options: u32) -> i32 ---

	u_strncat :: proc(dst: ^u16, src: ^u16, n: i32) -> ^u16 ---

	u_strncmp :: proc(ucs1: ^u16, ucs2: ^u16, n: i32) -> i32 ---

	u_strncmpCodePointOrder :: proc(s1: ^u16, s2: ^u16, n: i32) -> i32 ---

	u_strncpy :: proc(dst: ^u16, src: ^u16, n: i32) -> ^u16 ---

	u_strpbrk :: proc(string: ^u16, matchSet: ^u16) -> ^u16 ---

	u_strrchr :: proc(s: ^u16, c: u16) -> ^u16 ---

	u_strrchr32 :: proc(s: ^u16, c: i32) -> ^u16 ---

	u_strrstr :: proc(s: ^u16, substring: ^u16) -> ^u16 ---

	u_strspn :: proc(string: ^u16, matchSet: ^u16) -> i32 ---

	u_strstr :: proc(s: ^u16, substring: ^u16) -> ^u16 ---

	u_strToJavaModifiedUTF8 :: proc(
		dest: PSTR,
		destCapacity: i32,
		pDestLength: ^i32,
		src: ^u16,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> PSTR ---

	u_strtok_r :: proc(src: ^u16, delim: ^u16, saveState: ^u16) -> ^u16 ---

	u_strToLower :: proc(
		dest: ^u16,
		destCapacity: i32,
		src: ^u16,
		srcLength: i32,
		locale: PSTR,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	u_strToTitle :: proc(
		dest: ^u16,
		destCapacity: i32,
		src: ^u16,
		srcLength: i32,
		titleIter: ^UBreakIterator,
		locale: PSTR,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	u_strToUpper :: proc(
		dest: ^u16,
		destCapacity: i32,
		src: ^u16,
		srcLength: i32,
		locale: PSTR,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	u_strToUTF32 :: proc(
		dest: ^i32,
		destCapacity: i32,
		pDestLength: ^i32,
		src: ^u16,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> ^i32 ---

	u_strToUTF32WithSub :: proc(
		dest: ^i32,
		destCapacity: i32,
		pDestLength: ^i32,
		src: ^u16,
		srcLength: i32,
		subchar: i32,
		pNumSubstitutions: ^i32,
		pErrorCode: ^UErrorCode,
	) -> ^i32 ---

	u_strToUTF8 :: proc(
		dest: PSTR,
		destCapacity: i32,
		pDestLength: ^i32,
		src: ^u16,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> PSTR ---

	u_strToUTF8WithSub :: proc(
		dest: PSTR,
		destCapacity: i32,
		pDestLength: ^i32,
		src: ^u16,
		srcLength: i32,
		subchar: i32,
		pNumSubstitutions: ^i32,
		pErrorCode: ^UErrorCode,
	) -> PSTR ---

	u_strToWCS :: proc(
		dest: PWSTR,
		destCapacity: i32,
		pDestLength: ^i32,
		src: ^u16,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> PWSTR ---

	u_tolower :: proc(c: i32) -> i32 ---

	u_totitle :: proc(c: i32) -> i32 ---

	u_toupper :: proc(c: i32) -> i32 ---

	u_uastrcpy :: proc(dst: ^u16, src: PSTR) -> ^u16 ---

	u_uastrncpy :: proc(dst: ^u16, src: PSTR, n: i32) -> ^u16 ---

	u_UCharsToChars :: proc(us: ^u16, cs: PSTR, length: i32) ---

	u_unescape :: proc(src: PSTR, dest: ^u16, destCapacity: i32) -> i32 ---

	u_unescapeAt :: proc(charAt: UNESCAPE_CHAR_AT, offset: ^i32, length: i32, _context: rawptr) -> i32 ---

	u_versionFromString :: proc(versionArray: ^u8, versionString: PSTR) ---

	u_versionFromUString :: proc(versionArray: ^u8, versionString: ^u16) ---

	u_versionToString :: proc(versionArray: ^u8, versionString: PSTR) ---

	u_vformatMessage :: proc(
		locale: PSTR,
		pattern: ^u16,
		patternLength: i32,
		result: ^u16,
		resultLength: i32,
		ap: ^i8,
		status: ^UErrorCode,
	) -> i32 ---

	u_vformatMessageWithError :: proc(
		locale: PSTR,
		pattern: ^u16,
		patternLength: i32,
		result: ^u16,
		resultLength: i32,
		parseError: ^UParseError,
		ap: ^i8,
		status: ^UErrorCode,
	) -> i32 ---

	u_vparseMessage :: proc(
		locale: PSTR,
		pattern: ^u16,
		patternLength: i32,
		source: ^u16,
		sourceLength: i32,
		ap: ^i8,
		status: ^UErrorCode,
	) ---

	u_vparseMessageWithError :: proc(
		locale: PSTR,
		pattern: ^u16,
		patternLength: i32,
		source: ^u16,
		sourceLength: i32,
		ap: ^i8,
		parseError: ^UParseError,
		status: ^UErrorCode,
	) ---

	ubidi_close :: proc(pBiDi: ^UBiDi) ---

	ubidi_countParagraphs :: proc(pBiDi: ^UBiDi) -> i32 ---

	ubidi_countRuns :: proc(pBiDi: ^UBiDi, pErrorCode: ^UErrorCode) -> i32 ---

	ubidi_getBaseDirection :: proc(text: ^u16, length: i32) -> UBiDiDirection ---

	ubidi_getClassCallback :: proc(pBiDi: ^UBiDi, fn: ^UBiDiClassCallback, _context: rawptr) ---

	ubidi_getCustomizedClass :: proc(pBiDi: ^UBiDi, c: i32) -> UCharDirection ---

	ubidi_getDirection :: proc(#by_ptr pBiDi: UBiDi) -> UBiDiDirection ---

	ubidi_getLength :: proc(#by_ptr pBiDi: UBiDi) -> i32 ---

	ubidi_getLevelAt :: proc(#by_ptr pBiDi: UBiDi, charIndex: i32) -> u8 ---

	ubidi_getLevels :: proc(pBiDi: ^UBiDi, pErrorCode: ^UErrorCode) -> ^u8 ---

	ubidi_getLogicalIndex :: proc(pBiDi: ^UBiDi, visualIndex: i32, pErrorCode: ^UErrorCode) -> i32 ---

	ubidi_getLogicalMap :: proc(pBiDi: ^UBiDi, indexMap: ^i32, pErrorCode: ^UErrorCode) ---

	ubidi_getLogicalRun :: proc(#by_ptr pBiDi: UBiDi, logicalPosition: i32, pLogicalLimit: ^i32, pLevel: ^u8) ---

	ubidi_getParagraph :: proc(
		#by_ptr pBiDi: UBiDi,
		charIndex: i32,
		pParaStart: ^i32,
		pParaLimit: ^i32,
		pParaLevel: ^u8,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ubidi_getParagraphByIndex :: proc(
		#by_ptr pBiDi: UBiDi,
		paraIndex: i32,
		pParaStart: ^i32,
		pParaLimit: ^i32,
		pParaLevel: ^u8,
		pErrorCode: ^UErrorCode,
	) ---

	ubidi_getParaLevel :: proc(#by_ptr pBiDi: UBiDi) -> u8 ---

	ubidi_getProcessedLength :: proc(#by_ptr pBiDi: UBiDi) -> i32 ---

	ubidi_getReorderingMode :: proc(pBiDi: ^UBiDi) -> UBiDiReorderingMode ---

	ubidi_getReorderingOptions :: proc(pBiDi: ^UBiDi) -> u32 ---

	ubidi_getResultLength :: proc(#by_ptr pBiDi: UBiDi) -> i32 ---

	ubidi_getText :: proc(#by_ptr pBiDi: UBiDi) -> ^u16 ---

	ubidi_getVisualIndex :: proc(pBiDi: ^UBiDi, logicalIndex: i32, pErrorCode: ^UErrorCode) -> i32 ---

	ubidi_getVisualMap :: proc(pBiDi: ^UBiDi, indexMap: ^i32, pErrorCode: ^UErrorCode) ---

	ubidi_getVisualRun :: proc(pBiDi: ^UBiDi, runIndex: i32, pLogicalStart: ^i32, pLength: ^i32) -> UBiDiDirection ---

	ubidi_invertMap :: proc(srcMap: ^i32, destMap: ^i32, length: i32) ---

	ubidi_isInverse :: proc(pBiDi: ^UBiDi) -> i8 ---

	ubidi_isOrderParagraphsLTR :: proc(pBiDi: ^UBiDi) -> i8 ---

	ubidi_open :: proc() -> ^UBiDi ---

	ubidi_openSized :: proc(maxLength: i32, maxRunCount: i32, pErrorCode: ^UErrorCode) -> ^UBiDi ---

	ubidi_orderParagraphsLTR :: proc(pBiDi: ^UBiDi, orderParagraphsLTR: i8) ---

	ubidi_reorderLogical :: proc(levels: ^u8, length: i32, indexMap: ^i32) ---

	ubidi_reorderVisual :: proc(levels: ^u8, length: i32, indexMap: ^i32) ---

	ubidi_setClassCallback :: proc(
		pBiDi: ^UBiDi,
		newFn: UBiDiClassCallback,
		newContext: rawptr,
		oldFn: ^UBiDiClassCallback,
		oldContext: rawptr,
		pErrorCode: ^UErrorCode,
	) ---

	ubidi_setContext :: proc(
		pBiDi: ^UBiDi,
		prologue: ^u16,
		proLength: i32,
		epilogue: ^u16,
		epiLength: i32,
		pErrorCode: ^UErrorCode,
	) ---

	ubidi_setInverse :: proc(pBiDi: ^UBiDi, isInverse: i8) ---

	ubidi_setLine :: proc(
		#by_ptr pParaBiDi: UBiDi,
		start: i32,
		limit: i32,
		pLineBiDi: ^UBiDi,
		pErrorCode: ^UErrorCode,
	) ---

	ubidi_setPara :: proc(
		pBiDi: ^UBiDi,
		text: ^u16,
		length: i32,
		paraLevel: u8,
		embeddingLevels: ^u8,
		pErrorCode: ^UErrorCode,
	) ---

	ubidi_setReorderingMode :: proc(pBiDi: ^UBiDi, reorderingMode: UBiDiReorderingMode) ---

	ubidi_setReorderingOptions :: proc(pBiDi: ^UBiDi, reorderingOptions: u32) ---

	ubidi_writeReordered :: proc(pBiDi: ^UBiDi, dest: ^u16, destSize: i32, options: u16, pErrorCode: ^UErrorCode) -> i32 ---

	ubidi_writeReverse :: proc(
		src: ^u16,
		srcLength: i32,
		dest: ^u16,
		destSize: i32,
		options: u16,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ubiditransform_close :: proc(pBidiTransform: ^UBiDiTransform) ---

	ubiditransform_open :: proc(pErrorCode: ^UErrorCode) -> ^UBiDiTransform ---

	ubiditransform_transform :: proc(
		pBiDiTransform: ^UBiDiTransform,
		src: ^u16,
		srcLength: i32,
		dest: ^u16,
		destSize: i32,
		inParaLevel: u8,
		inOrder: UBiDiOrder,
		outParaLevel: u8,
		outOrder: UBiDiOrder,
		doMirroring: UBiDiMirroring,
		shapingOptions: u32,
		pErrorCode: ^UErrorCode,
	) -> u32 ---

	ublock_getCode :: proc(c: i32) -> UBlockCode ---

	ubrk_close :: proc(bi: ^UBreakIterator) ---

	ubrk_countAvailable :: proc() -> i32 ---

	ubrk_current :: proc(#by_ptr bi: UBreakIterator) -> i32 ---

	ubrk_first :: proc(bi: ^UBreakIterator) -> i32 ---

	ubrk_following :: proc(bi: ^UBreakIterator, offset: i32) -> i32 ---

	ubrk_getAvailable :: proc(index: i32) -> PSTR ---

	ubrk_getBinaryRules :: proc(bi: ^UBreakIterator, binaryRules: ^u8, rulesCapacity: i32, status: ^UErrorCode) -> i32 ---

	ubrk_getLocaleByType :: proc(#by_ptr bi: UBreakIterator, type: ULocDataLocaleType, status: ^UErrorCode) -> PSTR ---

	ubrk_getRuleStatus :: proc(bi: ^UBreakIterator) -> i32 ---

	ubrk_getRuleStatusVec :: proc(bi: ^UBreakIterator, fillInVec: ^i32, capacity: i32, status: ^UErrorCode) -> i32 ---

	ubrk_isBoundary :: proc(bi: ^UBreakIterator, offset: i32) -> i8 ---

	ubrk_last :: proc(bi: ^UBreakIterator) -> i32 ---

	ubrk_next :: proc(bi: ^UBreakIterator) -> i32 ---

	ubrk_open :: proc(
		type: UBreakIteratorType,
		locale: PSTR,
		text: ^u16,
		textLength: i32,
		status: ^UErrorCode,
	) -> ^UBreakIterator ---

	ubrk_openBinaryRules :: proc(
		binaryRules: ^u8,
		rulesLength: i32,
		text: ^u16,
		textLength: i32,
		status: ^UErrorCode,
	) -> ^UBreakIterator ---

	ubrk_openRules :: proc(
		rules: ^u16,
		rulesLength: i32,
		text: ^u16,
		textLength: i32,
		parseErr: ^UParseError,
		status: ^UErrorCode,
	) -> ^UBreakIterator ---

	ubrk_preceding :: proc(bi: ^UBreakIterator, offset: i32) -> i32 ---

	ubrk_previous :: proc(bi: ^UBreakIterator) -> i32 ---

	ubrk_refreshUText :: proc(bi: ^UBreakIterator, text: ^UText, status: ^UErrorCode) ---

	ubrk_safeClone :: proc(
		#by_ptr bi: UBreakIterator,
		stackBuffer: rawptr,
		pBufferSize: ^i32,
		status: ^UErrorCode,
	) -> ^UBreakIterator ---

	ubrk_setText :: proc(bi: ^UBreakIterator, text: ^u16, textLength: i32, status: ^UErrorCode) ---

	ubrk_setUText :: proc(bi: ^UBreakIterator, text: ^UText, status: ^UErrorCode) ---

	ucal_add :: proc(cal: rawptr, field: UCalendarDateFields, amount: i32, status: ^UErrorCode) ---

	ucal_clear :: proc(calendar: rawptr) ---

	ucal_clearField :: proc(cal: rawptr, field: UCalendarDateFields) ---

	ucal_clone :: proc(cal: rawptr, status: ^UErrorCode) -> rawptr ---

	ucal_close :: proc(cal: rawptr) ---

	ucal_countAvailable :: proc() -> i32 ---

	ucal_equivalentTo :: proc(cal1: rawptr, cal2: rawptr) -> i8 ---

	ucal_get :: proc(cal: rawptr, field: UCalendarDateFields, status: ^UErrorCode) -> i32 ---

	ucal_getAttribute :: proc(cal: rawptr, attr: UCalendarAttribute) -> i32 ---

	ucal_getAvailable :: proc(localeIndex: i32) -> PSTR ---

	ucal_getCanonicalTimeZoneID :: proc(
		id: ^u16,
		len: i32,
		result: ^u16,
		resultCapacity: i32,
		isSystemID: ^i8,
		status: ^UErrorCode,
	) -> i32 ---

	ucal_getDayOfWeekType :: proc(
		cal: rawptr,
		dayOfWeek: UCalendarDaysOfWeek,
		status: ^UErrorCode,
	) -> UCalendarWeekdayType ---

	ucal_getDefaultTimeZone :: proc(result: ^u16, resultCapacity: i32, ec: ^UErrorCode) -> i32 ---

	ucal_getDSTSavings :: proc(zoneID: ^u16, ec: ^UErrorCode) -> i32 ---

	ucal_getFieldDifference :: proc(cal: rawptr, target: f64, field: UCalendarDateFields, status: ^UErrorCode) -> i32 ---

	ucal_getGregorianChange :: proc(cal: rawptr, pErrorCode: ^UErrorCode) -> f64 ---

	ucal_getHostTimeZone :: proc(result: ^u16, resultCapacity: i32, ec: ^UErrorCode) -> i32 ---

	ucal_getKeywordValuesForLocale :: proc(key: PSTR, locale: PSTR, commonlyUsed: i8, status: ^UErrorCode) -> ^UEnumeration ---

	ucal_getLimit :: proc(
		cal: rawptr,
		field: UCalendarDateFields,
		type: UCalendarLimitType,
		status: ^UErrorCode,
	) -> i32 ---

	ucal_getLocaleByType :: proc(cal: rawptr, type: ULocDataLocaleType, status: ^UErrorCode) -> PSTR ---

	ucal_getMillis :: proc(cal: rawptr, status: ^UErrorCode) -> f64 ---

	ucal_getNow :: proc() -> f64 ---

	ucal_getTimeZoneDisplayName :: proc(
		cal: rawptr,
		type: UCalendarDisplayNameType,
		locale: PSTR,
		result: ^u16,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ucal_getTimeZoneID :: proc(cal: rawptr, result: ^u16, resultLength: i32, status: ^UErrorCode) -> i32 ---

	ucal_getTimeZoneIDForWindowsID :: proc(winid: ^u16, len: i32, region: PSTR, id: ^u16, idCapacity: i32, status: ^UErrorCode) -> i32 ---

	ucal_getTimeZoneTransitionDate :: proc(
		cal: rawptr,
		type: UTimeZoneTransitionType,
		transition: ^f64,
		status: ^UErrorCode,
	) -> i8 ---

	ucal_getType :: proc(cal: rawptr, status: ^UErrorCode) -> PSTR ---

	ucal_getTZDataVersion :: proc(status: ^UErrorCode) -> PSTR ---

	ucal_getWeekendTransition :: proc(cal: rawptr, dayOfWeek: UCalendarDaysOfWeek, status: ^UErrorCode) -> i32 ---

	ucal_getWindowsTimeZoneID :: proc(id: ^u16, len: i32, winid: ^u16, winidCapacity: i32, status: ^UErrorCode) -> i32 ---

	ucal_inDaylightTime :: proc(cal: rawptr, status: ^UErrorCode) -> i8 ---

	ucal_isSet :: proc(cal: rawptr, field: UCalendarDateFields) -> i8 ---

	ucal_isWeekend :: proc(cal: rawptr, date: f64, status: ^UErrorCode) -> i8 ---

	ucal_open :: proc(zoneID: ^u16, len: i32, locale: PSTR, type: UCalendarType, status: ^UErrorCode) -> rawptr ---

	ucal_openCountryTimeZones :: proc(country: PSTR, ec: ^UErrorCode) -> ^UEnumeration ---

	ucal_openTimeZoneIDEnumeration :: proc(
		zoneType: USystemTimeZoneType,
		region: PSTR,
		rawOffset: ^i32,
		ec: ^UErrorCode,
	) -> ^UEnumeration ---

	ucal_openTimeZones :: proc(ec: ^UErrorCode) -> ^UEnumeration ---

	ucal_roll :: proc(cal: rawptr, field: UCalendarDateFields, amount: i32, status: ^UErrorCode) ---

	ucal_set :: proc(cal: rawptr, field: UCalendarDateFields, value: i32) ---

	ucal_setAttribute :: proc(cal: rawptr, attr: UCalendarAttribute, newValue: i32) ---

	ucal_setDate :: proc(cal: rawptr, year: i32, month: i32, date: i32, status: ^UErrorCode) ---

	ucal_setDateTime :: proc(
		cal: rawptr,
		year: i32,
		month: i32,
		date: i32,
		hour: i32,
		minute: i32,
		second: i32,
		status: ^UErrorCode,
	) ---

	ucal_setDefaultTimeZone :: proc(zoneID: ^u16, ec: ^UErrorCode) ---

	ucal_setGregorianChange :: proc(cal: rawptr, date: f64, pErrorCode: ^UErrorCode) ---

	ucal_setMillis :: proc(cal: rawptr, dateTime: f64, status: ^UErrorCode) ---

	ucal_setTimeZone :: proc(cal: rawptr, zoneID: ^u16, len: i32, status: ^UErrorCode) ---

	ucasemap_close :: proc(csm: ^UCaseMap) ---

	ucasemap_getBreakIterator :: proc(#by_ptr csm: UCaseMap) -> ^UBreakIterator ---

	ucasemap_getLocale :: proc(#by_ptr csm: UCaseMap) -> PSTR ---

	ucasemap_getOptions :: proc(#by_ptr csm: UCaseMap) -> u32 ---

	ucasemap_open :: proc(locale: PSTR, options: u32, pErrorCode: ^UErrorCode) -> ^UCaseMap ---

	ucasemap_setBreakIterator :: proc(csm: ^UCaseMap, iterToAdopt: ^UBreakIterator, pErrorCode: ^UErrorCode) ---

	ucasemap_setLocale :: proc(csm: ^UCaseMap, locale: PSTR, pErrorCode: ^UErrorCode) ---

	ucasemap_setOptions :: proc(csm: ^UCaseMap, options: u32, pErrorCode: ^UErrorCode) ---

	ucasemap_toTitle :: proc(
		csm: ^UCaseMap,
		dest: ^u16,
		destCapacity: i32,
		src: ^u16,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucasemap_utf8FoldCase :: proc(
		#by_ptr csm: UCaseMap,
		dest: PSTR,
		destCapacity: i32,
		src: PSTR,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucasemap_utf8ToLower :: proc(
		#by_ptr csm: UCaseMap,
		dest: PSTR,
		destCapacity: i32,
		src: PSTR,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucasemap_utf8ToTitle :: proc(
		csm: ^UCaseMap,
		dest: PSTR,
		destCapacity: i32,
		src: PSTR,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucasemap_utf8ToUpper :: proc(
		#by_ptr csm: UCaseMap,
		dest: PSTR,
		destCapacity: i32,
		src: PSTR,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucfpos_close :: proc(ucfpos: ^UConstrainedFieldPosition) ---

	ucfpos_constrainCategory :: proc(ucfpos: ^UConstrainedFieldPosition, category: i32, ec: ^UErrorCode) ---

	ucfpos_constrainField :: proc(ucfpos: ^UConstrainedFieldPosition, category: i32, field: i32, ec: ^UErrorCode) ---

	ucfpos_getCategory :: proc(#by_ptr ucfpos: UConstrainedFieldPosition, ec: ^UErrorCode) -> i32 ---

	ucfpos_getField :: proc(#by_ptr ucfpos: UConstrainedFieldPosition, ec: ^UErrorCode) -> i32 ---

	ucfpos_getIndexes :: proc(
		#by_ptr ucfpos: UConstrainedFieldPosition,
		pStart: ^i32,
		pLimit: ^i32,
		ec: ^UErrorCode,
	) ---

	ucfpos_getInt64IterationContext :: proc(#by_ptr ucfpos: UConstrainedFieldPosition, ec: ^UErrorCode) -> i64 ---

	ucfpos_matchesField :: proc(
		#by_ptr ucfpos: UConstrainedFieldPosition,
		category: i32,
		field: i32,
		ec: ^UErrorCode,
	) -> i8 ---

	ucfpos_open :: proc(ec: ^UErrorCode) -> ^UConstrainedFieldPosition ---

	ucfpos_reset :: proc(ucfpos: ^UConstrainedFieldPosition, ec: ^UErrorCode) ---

	ucfpos_setInt64IterationContext :: proc(ucfpos: ^UConstrainedFieldPosition, _context: i64, ec: ^UErrorCode) ---

	ucfpos_setState :: proc(
		ucfpos: ^UConstrainedFieldPosition,
		category: i32,
		field: i32,
		start: i32,
		limit: i32,
		ec: ^UErrorCode,
	) ---

	ucnv_cbFromUWriteBytes :: proc(
		args: ^UConverterFromUnicodeArgs,
		source: PSTR,
		length: i32,
		offsetIndex: i32,
		err: ^UErrorCode,
	) ---

	ucnv_cbFromUWriteSub :: proc(args: ^UConverterFromUnicodeArgs, offsetIndex: i32, err: ^UErrorCode) ---

	ucnv_cbFromUWriteUChars :: proc(
		args: ^UConverterFromUnicodeArgs,
		source: ^u16,
		sourceLimit: ^u16,
		offsetIndex: i32,
		err: ^UErrorCode,
	) ---

	ucnv_cbToUWriteSub :: proc(args: ^UConverterToUnicodeArgs, offsetIndex: i32, err: ^UErrorCode) ---

	ucnv_cbToUWriteUChars :: proc(
		args: ^UConverterToUnicodeArgs,
		source: ^u16,
		length: i32,
		offsetIndex: i32,
		err: ^UErrorCode,
	) ---

	ucnv_close :: proc(converter: ^UConverter) ---

	ucnv_compareNames :: proc(name1: PSTR, name2: PSTR) -> i32 ---

	ucnv_convert :: proc(
		toConverterName: PSTR,
		fromConverterName: PSTR,
		target: PSTR,
		targetCapacity: i32,
		source: PSTR,
		sourceLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucnv_convertEx :: proc(
		targetCnv: ^UConverter,
		sourceCnv: ^UConverter,
		target: ^i8,
		targetLimit: PSTR,
		source: ^i8,
		sourceLimit: PSTR,
		pivotStart: ^u16,
		pivotSource: ^u16,
		pivotTarget: ^u16,
		pivotLimit: ^u16,
		reset: i8,
		flush: i8,
		pErrorCode: ^UErrorCode,
	) ---

	ucnv_countAliases :: proc(alias: PSTR, pErrorCode: ^UErrorCode) -> u16 ---

	ucnv_countAvailable :: proc() -> i32 ---

	ucnv_countStandards :: proc() -> u16 ---

	ucnv_detectUnicodeSignature :: proc(source: PSTR, sourceLength: i32, signatureLength: ^i32, pErrorCode: ^UErrorCode) -> PSTR ---

	ucnv_fixFileSeparator :: proc(#by_ptr cnv: UConverter, source: ^u16, sourceLen: i32) ---

	ucnv_flushCache :: proc() -> i32 ---

	UCNV_FROM_U_CALLBACK_ESCAPE :: proc(
		_context: rawptr,
		fromUArgs: ^UConverterFromUnicodeArgs,
		codeUnits: ^u16,
		length: i32,
		codePoint: i32,
		reason: UConverterCallbackReason,
		err: ^UErrorCode,
	) ---

	UCNV_FROM_U_CALLBACK_SKIP :: proc(
		_context: rawptr,
		fromUArgs: ^UConverterFromUnicodeArgs,
		codeUnits: ^u16,
		length: i32,
		codePoint: i32,
		reason: UConverterCallbackReason,
		err: ^UErrorCode,
	) ---

	UCNV_FROM_U_CALLBACK_STOP :: proc(
		_context: rawptr,
		fromUArgs: ^UConverterFromUnicodeArgs,
		codeUnits: ^u16,
		length: i32,
		codePoint: i32,
		reason: UConverterCallbackReason,
		err: ^UErrorCode,
	) ---

	UCNV_FROM_U_CALLBACK_SUBSTITUTE :: proc(
		_context: rawptr,
		fromUArgs: ^UConverterFromUnicodeArgs,
		codeUnits: ^u16,
		length: i32,
		codePoint: i32,
		reason: UConverterCallbackReason,
		err: ^UErrorCode,
	) ---

	ucnv_fromAlgorithmic :: proc(
		cnv: ^UConverter,
		algorithmicType: UConverterType,
		target: PSTR,
		targetCapacity: i32,
		source: PSTR,
		sourceLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucnv_fromUChars :: proc(
		cnv: ^UConverter,
		dest: PSTR,
		destCapacity: i32,
		src: ^u16,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucnv_fromUCountPending :: proc(#by_ptr cnv: UConverter, status: ^UErrorCode) -> i32 ---

	ucnv_fromUnicode :: proc(
		converter: ^UConverter,
		target: ^i8,
		targetLimit: PSTR,
		source: ^u16,
		sourceLimit: ^u16,
		offsets: ^i32,
		flush: i8,
		err: ^UErrorCode,
	) ---

	ucnv_getAlias :: proc(alias: PSTR, n: u16, pErrorCode: ^UErrorCode) -> PSTR ---

	ucnv_getAliases :: proc(alias: PSTR, aliases: ^i8, pErrorCode: ^UErrorCode) ---

	ucnv_getAvailableName :: proc(n: i32) -> PSTR ---

	ucnv_getCanonicalName :: proc(alias: PSTR, standard: PSTR, pErrorCode: ^UErrorCode) -> PSTR ---

	ucnv_getCCSID :: proc(#by_ptr converter: UConverter, err: ^UErrorCode) -> i32 ---

	ucnv_getDefaultName :: proc() -> PSTR ---

	ucnv_getDisplayName :: proc(
		#by_ptr converter: UConverter,
		displayLocale: PSTR,
		displayName: ^u16,
		displayNameCapacity: i32,
		err: ^UErrorCode,
	) -> i32 ---

	ucnv_getFromUCallBack :: proc(
		#by_ptr converter: UConverter,
		action: ^UConverterFromUCallback,
		_context: rawptr,
	) ---

	ucnv_getInvalidChars :: proc(#by_ptr converter: UConverter, errBytes: PSTR, len: ^i8, err: ^UErrorCode) ---

	ucnv_getInvalidUChars :: proc(#by_ptr converter: UConverter, errUChars: ^u16, len: ^i8, err: ^UErrorCode) ---

	ucnv_getMaxCharSize :: proc(#by_ptr converter: UConverter) -> i8 ---

	ucnv_getMinCharSize :: proc(#by_ptr converter: UConverter) -> i8 ---

	ucnv_getName :: proc(#by_ptr converter: UConverter, err: ^UErrorCode) -> PSTR ---

	ucnv_getNextUChar :: proc(converter: ^UConverter, source: ^i8, sourceLimit: PSTR, err: ^UErrorCode) -> i32 ---

	ucnv_getPlatform :: proc(#by_ptr converter: UConverter, err: ^UErrorCode) -> UConverterPlatform ---

	ucnv_getStandard :: proc(n: u16, pErrorCode: ^UErrorCode) -> PSTR ---

	ucnv_getStandardName :: proc(name: PSTR, standard: PSTR, pErrorCode: ^UErrorCode) -> PSTR ---

	ucnv_getStarters :: proc(#by_ptr converter: UConverter, starters: ^i8, err: ^UErrorCode) ---

	ucnv_getSubstChars :: proc(#by_ptr converter: UConverter, subChars: PSTR, len: ^i8, err: ^UErrorCode) ---

	ucnv_getToUCallBack :: proc(
		#by_ptr converter: UConverter,
		action: ^UConverterToUCallback,
		_context: rawptr,
	) ---

	ucnv_getType :: proc(#by_ptr converter: UConverter) -> UConverterType ---

	ucnv_getUnicodeSet :: proc(
		#by_ptr cnv: UConverter,
		setFillIn: ^USet,
		whichSet: UConverterUnicodeSet,
		pErrorCode: ^UErrorCode,
	) ---

	ucnv_isAmbiguous :: proc(#by_ptr cnv: UConverter) -> i8 ---

	ucnv_isFixedWidth :: proc(cnv: ^UConverter, status: ^UErrorCode) -> i8 ---

	ucnv_open :: proc(converterName: PSTR, err: ^UErrorCode) -> ^UConverter ---

	ucnv_openAllNames :: proc(pErrorCode: ^UErrorCode) -> ^UEnumeration ---

	ucnv_openCCSID :: proc(codepage: i32, platform: UConverterPlatform, err: ^UErrorCode) -> ^UConverter ---

	ucnv_openPackage :: proc(packageName: PSTR, converterName: PSTR, err: ^UErrorCode) -> ^UConverter ---

	ucnv_openStandardNames :: proc(convName: PSTR, standard: PSTR, pErrorCode: ^UErrorCode) -> ^UEnumeration ---

	ucnv_openU :: proc(name: ^u16, err: ^UErrorCode) -> ^UConverter ---

	ucnv_reset :: proc(converter: ^UConverter) ---

	ucnv_resetFromUnicode :: proc(converter: ^UConverter) ---

	ucnv_resetToUnicode :: proc(converter: ^UConverter) ---

	ucnv_safeClone :: proc(
		#by_ptr cnv: UConverter,
		stackBuffer: rawptr,
		pBufferSize: ^i32,
		status: ^UErrorCode,
	) -> ^UConverter ---

	ucnv_setDefaultName :: proc(name: PSTR) ---

	ucnv_setFallback :: proc(cnv: ^UConverter, usesFallback: i8) ---

	ucnv_setFromUCallBack :: proc(
		converter: ^UConverter,
		newAction: UConverterFromUCallback,
		newContext: rawptr,
		oldAction: ^UConverterFromUCallback,
		oldContext: rawptr,
		err: ^UErrorCode,
	) ---

	ucnv_setSubstChars :: proc(converter: ^UConverter, subChars: PSTR, len: i8, err: ^UErrorCode) ---

	ucnv_setSubstString :: proc(cnv: ^UConverter, s: ^u16, length: i32, err: ^UErrorCode) ---

	ucnv_setToUCallBack :: proc(
		converter: ^UConverter,
		newAction: UConverterToUCallback,
		newContext: rawptr,
		oldAction: ^UConverterToUCallback,
		oldContext: rawptr,
		err: ^UErrorCode,
	) ---

	UCNV_TO_U_CALLBACK_ESCAPE :: proc(
		_context: rawptr,
		toUArgs: ^UConverterToUnicodeArgs,
		codeUnits: PSTR,
		length: i32,
		reason: UConverterCallbackReason,
		err: ^UErrorCode,
	) ---

	UCNV_TO_U_CALLBACK_SKIP :: proc(
		_context: rawptr,
		toUArgs: ^UConverterToUnicodeArgs,
		codeUnits: PSTR,
		length: i32,
		reason: UConverterCallbackReason,
		err: ^UErrorCode,
	) ---

	UCNV_TO_U_CALLBACK_STOP :: proc(
		_context: rawptr,
		toUArgs: ^UConverterToUnicodeArgs,
		codeUnits: PSTR,
		length: i32,
		reason: UConverterCallbackReason,
		err: ^UErrorCode,
	) ---

	UCNV_TO_U_CALLBACK_SUBSTITUTE :: proc(
		_context: rawptr,
		toUArgs: ^UConverterToUnicodeArgs,
		codeUnits: PSTR,
		length: i32,
		reason: UConverterCallbackReason,
		err: ^UErrorCode,
	) ---

	ucnv_toAlgorithmic :: proc(
		algorithmicType: UConverterType,
		cnv: ^UConverter,
		target: PSTR,
		targetCapacity: i32,
		source: PSTR,
		sourceLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucnv_toUChars :: proc(
		cnv: ^UConverter,
		dest: ^u16,
		destCapacity: i32,
		src: PSTR,
		srcLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ucnv_toUCountPending :: proc(#by_ptr cnv: UConverter, status: ^UErrorCode) -> i32 ---

	ucnv_toUnicode :: proc(
		converter: ^UConverter,
		target: ^u16,
		targetLimit: ^u16,
		source: ^i8,
		sourceLimit: PSTR,
		offsets: ^i32,
		flush: i8,
		err: ^UErrorCode,
	) ---

	ucnv_usesFallback :: proc(#by_ptr cnv: UConverter) -> i8 ---

	ucnvsel_close :: proc(sel: ^UConverterSelector) ---

	ucnvsel_open :: proc(
		converterList: ^i8,
		converterListSize: i32,
		#by_ptr excludedCodePoints: USet,
		whichSet: UConverterUnicodeSet,
		status: ^UErrorCode,
	) -> ^UConverterSelector ---

	ucnvsel_openFromSerialized :: proc(buffer: rawptr, length: i32, status: ^UErrorCode) -> ^UConverterSelector ---

	ucnvsel_selectForString :: proc(
		#by_ptr sel: UConverterSelector,
		s: ^u16,
		length: i32,
		status: ^UErrorCode,
	) -> ^UEnumeration ---

	ucnvsel_selectForUTF8 :: proc(
		#by_ptr sel: UConverterSelector,
		s: PSTR,
		length: i32,
		status: ^UErrorCode,
	) -> ^UEnumeration ---

	ucnvsel_serialize :: proc(
		#by_ptr sel: UConverterSelector,
		buffer: rawptr,
		bufferCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ucol_cloneBinary :: proc(#by_ptr coll: UCollator, buffer: ^u8, capacity: i32, status: ^UErrorCode) -> i32 ---

	ucol_close :: proc(coll: ^UCollator) ---

	ucol_closeElements :: proc(elems: ^UCollationElements) ---

	ucol_countAvailable :: proc() -> i32 ---

	ucol_equal :: proc(
		#by_ptr coll: UCollator,
		source: ^u16,
		sourceLength: i32,
		target: ^u16,
		targetLength: i32,
	) -> i8 ---

	ucol_getAttribute :: proc(
		#by_ptr coll: UCollator,
		attr: UColAttribute,
		status: ^UErrorCode,
	) -> UColAttributeValue ---

	ucol_getAvailable :: proc(localeIndex: i32) -> PSTR ---

	ucol_getBound :: proc(
		source: ^u8,
		sourceLength: i32,
		boundType: UColBoundMode,
		noOfLevels: u32,
		result: ^u8,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ucol_getContractionsAndExpansions :: proc(
		#by_ptr coll: UCollator,
		contractions: ^USet,
		expansions: ^USet,
		addPrefixes: i8,
		status: ^UErrorCode,
	) ---

	ucol_getDisplayName :: proc(objLoc: PSTR, dispLoc: PSTR, result: ^u16, resultLength: i32, status: ^UErrorCode) -> i32 ---

	ucol_getEquivalentReorderCodes :: proc(reorderCode: i32, dest: ^i32, destCapacity: i32, pErrorCode: ^UErrorCode) -> i32 ---

	ucol_getFunctionalEquivalent :: proc(
		result: PSTR,
		resultCapacity: i32,
		keyword: PSTR,
		locale: PSTR,
		isAvailable: ^i8,
		status: ^UErrorCode,
	) -> i32 ---

	ucol_getKeywords :: proc(status: ^UErrorCode) -> ^UEnumeration ---

	ucol_getKeywordValues :: proc(keyword: PSTR, status: ^UErrorCode) -> ^UEnumeration ---

	ucol_getKeywordValuesForLocale :: proc(key: PSTR, locale: PSTR, commonlyUsed: i8, status: ^UErrorCode) -> ^UEnumeration ---

	ucol_getLocaleByType :: proc(#by_ptr coll: UCollator, type: ULocDataLocaleType, status: ^UErrorCode) -> PSTR ---

	ucol_getMaxExpansion :: proc(#by_ptr elems: UCollationElements, order: i32) -> i32 ---

	ucol_getMaxVariable :: proc(#by_ptr coll: UCollator) -> UColReorderCode ---

	ucol_getOffset :: proc(#by_ptr elems: UCollationElements) -> i32 ---

	ucol_getReorderCodes :: proc(#by_ptr coll: UCollator, dest: ^i32, destCapacity: i32, pErrorCode: ^UErrorCode) -> i32 ---

	ucol_getRules :: proc(#by_ptr coll: UCollator, length: ^i32) -> ^u16 ---

	ucol_getRulesEx :: proc(#by_ptr coll: UCollator, delta: UColRuleOption, buffer: ^u16, bufferLen: i32) -> i32 ---

	ucol_getSortKey :: proc(
		#by_ptr coll: UCollator,
		source: ^u16,
		sourceLength: i32,
		result: ^u8,
		resultLength: i32,
	) -> i32 ---

	ucol_getStrength :: proc(#by_ptr coll: UCollator) -> UColAttributeValue ---

	ucol_getTailoredSet :: proc(#by_ptr coll: UCollator, status: ^UErrorCode) -> ^USet ---

	ucol_getUCAVersion :: proc(#by_ptr coll: UCollator, info: ^u8) ---

	ucol_getVariableTop :: proc(#by_ptr coll: UCollator, status: ^UErrorCode) -> u32 ---

	ucol_getVersion :: proc(#by_ptr coll: UCollator, info: ^u8) ---

	ucol_greater :: proc(
		#by_ptr coll: UCollator,
		source: ^u16,
		sourceLength: i32,
		target: ^u16,
		targetLength: i32,
	) -> i8 ---

	ucol_greaterOrEqual :: proc(
		#by_ptr coll: UCollator,
		source: ^u16,
		sourceLength: i32,
		target: ^u16,
		targetLength: i32,
	) -> i8 ---

	ucol_keyHashCode :: proc(key: ^u8, length: i32) -> i32 ---

	ucol_mergeSortkeys :: proc(src1: ^u8, src1Length: i32, src2: ^u8, src2Length: i32, dest: ^u8, destCapacity: i32) -> i32 ---

	ucol_next :: proc(elems: ^UCollationElements, status: ^UErrorCode) -> i32 ---

	ucol_nextSortKeyPart :: proc(
		#by_ptr coll: UCollator,
		iter: ^UCharIterator,
		state: ^u32,
		dest: ^u8,
		count: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ucol_open :: proc(loc: PSTR, status: ^UErrorCode) -> ^UCollator ---

	ucol_openAvailableLocales :: proc(status: ^UErrorCode) -> ^UEnumeration ---

	ucol_openBinary :: proc(bin: ^u8, length: i32, #by_ptr base: UCollator, status: ^UErrorCode) -> ^UCollator ---

	ucol_openElements :: proc(
		#by_ptr coll: UCollator,
		text: ^u16,
		textLength: i32,
		status: ^UErrorCode,
	) -> ^UCollationElements ---

	ucol_openRules :: proc(
		rules: ^u16,
		rulesLength: i32,
		normalizationMode: UColAttributeValue,
		strength: UColAttributeValue,
		parseError: ^UParseError,
		status: ^UErrorCode,
	) -> ^UCollator ---

	ucol_previous :: proc(elems: ^UCollationElements, status: ^UErrorCode) -> i32 ---

	ucol_primaryOrder :: proc(order: i32) -> i32 ---

	ucol_reset :: proc(elems: ^UCollationElements) ---

	ucol_safeClone :: proc(
		#by_ptr coll: UCollator,
		stackBuffer: rawptr,
		pBufferSize: ^i32,
		status: ^UErrorCode,
	) -> ^UCollator ---

	ucol_secondaryOrder :: proc(order: i32) -> i32 ---

	ucol_setAttribute :: proc(
		coll: ^UCollator,
		attr: UColAttribute,
		value: UColAttributeValue,
		status: ^UErrorCode,
	) ---

	ucol_setMaxVariable :: proc(coll: ^UCollator, group: UColReorderCode, pErrorCode: ^UErrorCode) ---

	ucol_setOffset :: proc(elems: ^UCollationElements, offset: i32, status: ^UErrorCode) ---

	ucol_setReorderCodes :: proc(
		coll: ^UCollator,
		reorderCodes: ^i32,
		reorderCodesLength: i32,
		pErrorCode: ^UErrorCode,
	) ---

	ucol_setStrength :: proc(coll: ^UCollator, strength: UColAttributeValue) ---

	ucol_setText :: proc(elems: ^UCollationElements, text: ^u16, textLength: i32, status: ^UErrorCode) ---

	ucol_strcoll :: proc(
		#by_ptr coll: UCollator,
		source: ^u16,
		sourceLength: i32,
		target: ^u16,
		targetLength: i32,
	) -> UCollationResult ---

	ucol_strcollIter :: proc(
		#by_ptr coll: UCollator,
		sIter: ^UCharIterator,
		tIter: ^UCharIterator,
		status: ^UErrorCode,
	) -> UCollationResult ---

	ucol_strcollUTF8 :: proc(
		#by_ptr coll: UCollator,
		source: PSTR,
		sourceLength: i32,
		target: PSTR,
		targetLength: i32,
		status: ^UErrorCode,
	) -> UCollationResult ---

	ucol_tertiaryOrder :: proc(order: i32) -> i32 ---

	ucpmap_get :: proc(#by_ptr _map: UCPMap, c: i32) -> u32 ---

	ucpmap_getRange :: proc(
		#by_ptr _map: UCPMap,
		start: i32,
		option: UCPMapRangeOption,
		surrogateValue: u32,
		filter: ^UCPMapValueFilter,
		_context: rawptr,
		pValue: ^u32,
	) -> i32 ---

	ucptrie_close :: proc(trie: ^UCPTrie) ---

	ucptrie_get :: proc(#by_ptr trie: UCPTrie, c: i32) -> u32 ---

	ucptrie_getRange :: proc(
		#by_ptr trie: UCPTrie,
		start: i32,
		option: UCPMapRangeOption,
		surrogateValue: u32,
		filter: ^UCPMapValueFilter,
		_context: rawptr,
		pValue: ^u32,
	) -> i32 ---

	ucptrie_getType :: proc(#by_ptr trie: UCPTrie) -> UCPTrieType ---

	ucptrie_getValueWidth :: proc(#by_ptr trie: UCPTrie) -> UCPTrieValueWidth ---

	ucptrie_internalSmallIndex :: proc(#by_ptr trie: UCPTrie, c: i32) -> i32 ---

	ucptrie_internalSmallU8Index :: proc(#by_ptr trie: UCPTrie, lt1: i32, t2: u8, t3: u8) -> i32 ---

	ucptrie_internalU8PrevIndex :: proc(#by_ptr trie: UCPTrie, c: i32, start: ^u8, src: ^u8) -> i32 ---

	ucptrie_openFromBinary :: proc(
		type: UCPTrieType,
		valueWidth: UCPTrieValueWidth,
		data: rawptr,
		length: i32,
		pActualLength: ^i32,
		pErrorCode: ^UErrorCode,
	) -> ^UCPTrie ---

	ucptrie_toBinary :: proc(#by_ptr trie: UCPTrie, data: rawptr, capacity: i32, pErrorCode: ^UErrorCode) -> i32 ---

	ucsdet_close :: proc(ucsd: ^UCharsetDetector) ---

	ucsdet_detect :: proc(ucsd: ^UCharsetDetector, status: ^UErrorCode) -> ^UCharsetMatch ---

	ucsdet_detectAll :: proc(ucsd: ^UCharsetDetector, matchesFound: ^i32, status: ^UErrorCode) -> ^UCharsetMatch ---

	ucsdet_enableInputFilter :: proc(ucsd: ^UCharsetDetector, filter: i8) -> i8 ---

	ucsdet_getAllDetectableCharsets :: proc(#by_ptr ucsd: UCharsetDetector, status: ^UErrorCode) -> ^UEnumeration ---

	ucsdet_getConfidence :: proc(#by_ptr ucsm: UCharsetMatch, status: ^UErrorCode) -> i32 ---

	ucsdet_getLanguage :: proc(#by_ptr ucsm: UCharsetMatch, status: ^UErrorCode) -> PSTR ---

	ucsdet_getName :: proc(#by_ptr ucsm: UCharsetMatch, status: ^UErrorCode) -> PSTR ---

	ucsdet_getUChars :: proc(#by_ptr ucsm: UCharsetMatch, buf: ^u16, cap: i32, status: ^UErrorCode) -> i32 ---

	ucsdet_isInputFilterEnabled :: proc(#by_ptr ucsd: UCharsetDetector) -> i8 ---

	ucsdet_open :: proc(status: ^UErrorCode) -> ^UCharsetDetector ---

	ucsdet_setDeclaredEncoding :: proc(ucsd: ^UCharsetDetector, encoding: PSTR, length: i32, status: ^UErrorCode) ---

	ucsdet_setText :: proc(ucsd: ^UCharsetDetector, textIn: PSTR, len: i32, status: ^UErrorCode) ---

	ucurr_countCurrencies :: proc(locale: PSTR, date: f64, ec: ^UErrorCode) -> i32 ---

	ucurr_forLocale :: proc(locale: PSTR, buff: ^u16, buffCapacity: i32, ec: ^UErrorCode) -> i32 ---

	ucurr_forLocaleAndDate :: proc(locale: PSTR, date: f64, index: i32, buff: ^u16, buffCapacity: i32, ec: ^UErrorCode) -> i32 ---

	ucurr_getDefaultFractionDigits :: proc(currency: ^u16, ec: ^UErrorCode) -> i32 ---

	ucurr_getDefaultFractionDigitsForUsage :: proc(currency: ^u16, usage: UCurrencyUsage, ec: ^UErrorCode) -> i32 ---

	ucurr_getKeywordValuesForLocale :: proc(key: PSTR, locale: PSTR, commonlyUsed: i8, status: ^UErrorCode) -> ^UEnumeration ---

	ucurr_getName :: proc(
		currency: ^u16,
		locale: PSTR,
		nameStyle: UCurrNameStyle,
		isChoiceFormat: ^i8,
		len: ^i32,
		ec: ^UErrorCode,
	) -> ^u16 ---

	ucurr_getNumericCode :: proc(currency: ^u16) -> i32 ---

	ucurr_getPluralName :: proc(
		currency: ^u16,
		locale: PSTR,
		isChoiceFormat: ^i8,
		pluralCount: PSTR,
		len: ^i32,
		ec: ^UErrorCode,
	) -> ^u16 ---

	ucurr_getRoundingIncrement :: proc(currency: ^u16, ec: ^UErrorCode) -> f64 ---

	ucurr_getRoundingIncrementForUsage :: proc(currency: ^u16, usage: UCurrencyUsage, ec: ^UErrorCode) -> f64 ---

	ucurr_isAvailable :: proc(isoCode: ^u16, from: f64, to: f64, errorCode: ^UErrorCode) -> i8 ---

	ucurr_openISOCurrencies :: proc(currType: u32, pErrorCode: ^UErrorCode) -> ^UEnumeration ---

	ucurr_register :: proc(isoCode: ^u16, locale: PSTR, status: ^UErrorCode) -> rawptr ---

	ucurr_unregister :: proc(key: rawptr, status: ^UErrorCode) -> i8 ---

	udat_adoptNumberFormat :: proc(fmt: rawptr, numberFormatToAdopt: rawptr) ---

	udat_adoptNumberFormatForFields :: proc(fmt: rawptr, fields: ^u16, numberFormatToSet: rawptr, status: ^UErrorCode) ---

	udat_applyPattern :: proc(format: rawptr, localized: i8, pattern: ^u16, patternLength: i32) ---

	udat_clone :: proc(fmt: rawptr, status: ^UErrorCode) -> rawptr ---

	udat_close :: proc(format: rawptr) ---

	udat_countAvailable :: proc() -> i32 ---

	udat_countSymbols :: proc(fmt: rawptr, type: UDateFormatSymbolType) -> i32 ---

	udat_format :: proc(
		format: rawptr,
		dateToFormat: f64,
		result: ^u16,
		resultLength: i32,
		position: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	udat_formatCalendar :: proc(
		format: rawptr,
		calendar: rawptr,
		result: ^u16,
		capacity: i32,
		position: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	udat_formatCalendarForFields :: proc(
		format: rawptr,
		calendar: rawptr,
		result: ^u16,
		capacity: i32,
		fpositer: ^UFieldPositionIterator,
		status: ^UErrorCode,
	) -> i32 ---

	udat_formatForFields :: proc(
		format: rawptr,
		dateToFormat: f64,
		result: ^u16,
		resultLength: i32,
		fpositer: ^UFieldPositionIterator,
		status: ^UErrorCode,
	) -> i32 ---

	udat_get2DigitYearStart :: proc(fmt: rawptr, status: ^UErrorCode) -> f64 ---

	udat_getAvailable :: proc(localeIndex: i32) -> PSTR ---

	udat_getBooleanAttribute :: proc(fmt: rawptr, attr: UDateFormatBooleanAttribute, status: ^UErrorCode) -> i8 ---

	udat_getCalendar :: proc(fmt: rawptr) -> rawptr ---

	udat_getContext :: proc(fmt: rawptr, type: UDisplayContextType, status: ^UErrorCode) -> UDisplayContext ---

	udat_getLocaleByType :: proc(fmt: rawptr, type: ULocDataLocaleType, status: ^UErrorCode) -> PSTR ---

	udat_getNumberFormat :: proc(fmt: rawptr) -> rawptr ---

	udat_getNumberFormatForField :: proc(fmt: rawptr, field: u16) -> rawptr ---

	udat_getSymbols :: proc(
		fmt: rawptr,
		type: UDateFormatSymbolType,
		symbolIndex: i32,
		result: ^u16,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	udat_isLenient :: proc(fmt: rawptr) -> i8 ---

	udat_open :: proc(
		timeStyle: UDateFormatStyle,
		dateStyle: UDateFormatStyle,
		locale: PSTR,
		tzID: ^u16,
		tzIDLength: i32,
		pattern: ^u16,
		patternLength: i32,
		status: ^UErrorCode,
	) -> rawptr ---

	udat_parse :: proc(format: rawptr, text: ^u16, textLength: i32, parsePos: ^i32, status: ^UErrorCode) -> f64 ---

	udat_parseCalendar :: proc(
		format: rawptr,
		calendar: rawptr,
		text: ^u16,
		textLength: i32,
		parsePos: ^i32,
		status: ^UErrorCode,
	) ---

	udat_set2DigitYearStart :: proc(fmt: rawptr, d: f64, status: ^UErrorCode) ---

	udat_setBooleanAttribute :: proc(fmt: rawptr, attr: UDateFormatBooleanAttribute, newValue: i8, status: ^UErrorCode) ---

	udat_setCalendar :: proc(fmt: rawptr, calendarToSet: rawptr) ---

	udat_setContext :: proc(fmt: rawptr, value: UDisplayContext, status: ^UErrorCode) ---

	udat_setLenient :: proc(fmt: rawptr, isLenient: i8) ---

	udat_setNumberFormat :: proc(fmt: rawptr, numberFormatToSet: rawptr) ---

	udat_setSymbols :: proc(
		format: rawptr,
		type: UDateFormatSymbolType,
		symbolIndex: i32,
		value: ^u16,
		valueLength: i32,
		status: ^UErrorCode,
	) ---

	udat_toCalendarDateField :: proc(field: UDateFormatField) -> UCalendarDateFields ---

	udat_toPattern :: proc(fmt: rawptr, localized: i8, result: ^u16, resultLength: i32, status: ^UErrorCode) -> i32 ---

	udatpg_addPattern :: proc(
		dtpg: rawptr,
		pattern: ^u16,
		patternLength: i32,
		override: i8,
		conflictingPattern: ^u16,
		capacity: i32,
		pLength: ^i32,
		pErrorCode: ^UErrorCode,
	) -> UDateTimePatternConflict ---

	udatpg_clone :: proc(dtpg: rawptr, pErrorCode: ^UErrorCode) -> rawptr ---

	udatpg_close :: proc(dtpg: rawptr) ---

	udatpg_getAppendItemFormat :: proc(dtpg: rawptr, field: UDateTimePatternField, pLength: ^i32) -> ^u16 ---

	udatpg_getAppendItemName :: proc(dtpg: rawptr, field: UDateTimePatternField, pLength: ^i32) -> ^u16 ---

	udatpg_getBaseSkeleton :: proc(
		unusedDtpg: rawptr,
		pattern: ^u16,
		length: i32,
		baseSkeleton: ^u16,
		capacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	udatpg_getBestPattern :: proc(
		dtpg: rawptr,
		skeleton: ^u16,
		length: i32,
		bestPattern: ^u16,
		capacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	udatpg_getBestPatternWithOptions :: proc(
		dtpg: rawptr,
		skeleton: ^u16,
		length: i32,
		options: UDateTimePatternMatchOptions,
		bestPattern: ^u16,
		capacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	udatpg_getDateTimeFormat :: proc(dtpg: rawptr, pLength: ^i32) -> ^u16 ---

	udatpg_getDecimal :: proc(dtpg: rawptr, pLength: ^i32) -> ^u16 ---

	udatpg_getFieldDisplayName :: proc(
		dtpg: rawptr,
		field: UDateTimePatternField,
		width: UDateTimePGDisplayWidth,
		fieldName: ^u16,
		capacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	udatpg_getPatternForSkeleton :: proc(dtpg: rawptr, skeleton: ^u16, skeletonLength: i32, pLength: ^i32) -> ^u16 ---

	udatpg_getSkeleton :: proc(
		unusedDtpg: rawptr,
		pattern: ^u16,
		length: i32,
		skeleton: ^u16,
		capacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	udatpg_open :: proc(locale: PSTR, pErrorCode: ^UErrorCode) -> rawptr ---

	udatpg_openBaseSkeletons :: proc(dtpg: rawptr, pErrorCode: ^UErrorCode) -> ^UEnumeration ---

	udatpg_openEmpty :: proc(pErrorCode: ^UErrorCode) -> rawptr ---

	udatpg_openSkeletons :: proc(dtpg: rawptr, pErrorCode: ^UErrorCode) -> ^UEnumeration ---

	udatpg_replaceFieldTypes :: proc(
		dtpg: rawptr,
		pattern: ^u16,
		patternLength: i32,
		skeleton: ^u16,
		skeletonLength: i32,
		dest: ^u16,
		destCapacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	udatpg_replaceFieldTypesWithOptions :: proc(
		dtpg: rawptr,
		pattern: ^u16,
		patternLength: i32,
		skeleton: ^u16,
		skeletonLength: i32,
		options: UDateTimePatternMatchOptions,
		dest: ^u16,
		destCapacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	udatpg_setAppendItemFormat :: proc(dtpg: rawptr, field: UDateTimePatternField, value: ^u16, length: i32) ---

	udatpg_setAppendItemName :: proc(dtpg: rawptr, field: UDateTimePatternField, value: ^u16, length: i32) ---

	udatpg_setDateTimeFormat :: proc(dtpg: rawptr, dtFormat: ^u16, length: i32) ---

	udatpg_setDecimal :: proc(dtpg: rawptr, decimal: ^u16, length: i32) ---

	udtitvfmt_close :: proc(formatter: ^UDateIntervalFormat) ---

	udtitvfmt_closeResult :: proc(uresult: ^UFormattedDateInterval) ---

	udtitvfmt_format :: proc(
		#by_ptr formatter: UDateIntervalFormat,
		fromDate: f64,
		toDate: f64,
		result: ^u16,
		resultCapacity: i32,
		position: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	udtitvfmt_open :: proc(
		locale: PSTR,
		skeleton: ^u16,
		skeletonLength: i32,
		tzID: ^u16,
		tzIDLength: i32,
		status: ^UErrorCode,
	) -> ^UDateIntervalFormat ---

	udtitvfmt_openResult :: proc(ec: ^UErrorCode) -> ^UFormattedDateInterval ---

	udtitvfmt_resultAsValue :: proc(#by_ptr uresult: UFormattedDateInterval, ec: ^UErrorCode) -> ^UFormattedValue ---

	uenum_close :: proc(en: ^UEnumeration) ---

	uenum_count :: proc(en: ^UEnumeration, status: ^UErrorCode) -> i32 ---

	uenum_next :: proc(en: ^UEnumeration, resultLength: ^i32, status: ^UErrorCode) -> PSTR ---

	uenum_openCharStringsEnumeration :: proc(strings: ^i8, count: i32, ec: ^UErrorCode) -> ^UEnumeration ---

	uenum_openUCharStringsEnumeration :: proc(strings: ^u16, count: i32, ec: ^UErrorCode) -> ^UEnumeration ---

	uenum_reset :: proc(en: ^UEnumeration, status: ^UErrorCode) ---

	uenum_unext :: proc(en: ^UEnumeration, resultLength: ^i32, status: ^UErrorCode) -> ^u16 ---

	ufieldpositer_close :: proc(fpositer: ^UFieldPositionIterator) ---

	ufieldpositer_next :: proc(fpositer: ^UFieldPositionIterator, beginIndex: ^i32, endIndex: ^i32) -> i32 ---

	ufieldpositer_open :: proc(status: ^UErrorCode) -> ^UFieldPositionIterator ---

	ufmt_close :: proc(fmt: rawptr) ---

	ufmt_getArrayItemByIndex :: proc(fmt: rawptr, n: i32, status: ^UErrorCode) -> rawptr ---

	ufmt_getArrayLength :: proc(fmt: rawptr, status: ^UErrorCode) -> i32 ---

	ufmt_getDate :: proc(fmt: rawptr, status: ^UErrorCode) -> f64 ---

	ufmt_getDecNumChars :: proc(fmt: rawptr, len: ^i32, status: ^UErrorCode) -> PSTR ---

	ufmt_getDouble :: proc(fmt: rawptr, status: ^UErrorCode) -> f64 ---

	ufmt_getInt64 :: proc(fmt: rawptr, status: ^UErrorCode) -> i64 ---

	ufmt_getLong :: proc(fmt: rawptr, status: ^UErrorCode) -> i32 ---

	ufmt_getObject :: proc(fmt: rawptr, status: ^UErrorCode) -> rawptr ---

	ufmt_getType :: proc(fmt: rawptr, status: ^UErrorCode) -> UFormattableType ---

	ufmt_getUChars :: proc(fmt: rawptr, len: ^i32, status: ^UErrorCode) -> ^u16 ---

	ufmt_isNumeric :: proc(fmt: rawptr) -> i8 ---

	ufmt_open :: proc(status: ^UErrorCode) -> rawptr ---

	ufmtval_getString :: proc(#by_ptr ufmtval: UFormattedValue, pLength: ^i32, ec: ^UErrorCode) -> ^u16 ---

	ufmtval_nextPosition :: proc(
		#by_ptr ufmtval: UFormattedValue,
		ucfpos: ^UConstrainedFieldPosition,
		ec: ^UErrorCode,
	) -> i8 ---

	ugender_getInstance :: proc(locale: PSTR, status: ^UErrorCode) -> ^UGenderInfo ---

	ugender_getListGender :: proc(
		#by_ptr genderInfo: UGenderInfo,
		#by_ptr genders: UGender,
		size: i32,
		status: ^UErrorCode,
	) -> UGender ---

	uidna_close :: proc(idna: ^UIDNA) ---

	uidna_labelToASCII :: proc(
		#by_ptr idna: UIDNA,
		label: ^u16,
		length: i32,
		dest: ^u16,
		capacity: i32,
		pInfo: ^UIDNAInfo,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uidna_labelToASCII_UTF8 :: proc(
		#by_ptr idna: UIDNA,
		label: PSTR,
		length: i32,
		dest: PSTR,
		capacity: i32,
		pInfo: ^UIDNAInfo,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uidna_labelToUnicode :: proc(
		#by_ptr idna: UIDNA,
		label: ^u16,
		length: i32,
		dest: ^u16,
		capacity: i32,
		pInfo: ^UIDNAInfo,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uidna_labelToUnicodeUTF8 :: proc(
		#by_ptr idna: UIDNA,
		label: PSTR,
		length: i32,
		dest: PSTR,
		capacity: i32,
		pInfo: ^UIDNAInfo,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uidna_nameToASCII :: proc(
		#by_ptr idna: UIDNA,
		name: ^u16,
		length: i32,
		dest: ^u16,
		capacity: i32,
		pInfo: ^UIDNAInfo,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uidna_nameToASCII_UTF8 :: proc(
		#by_ptr idna: UIDNA,
		name: PSTR,
		length: i32,
		dest: PSTR,
		capacity: i32,
		pInfo: ^UIDNAInfo,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uidna_nameToUnicode :: proc(
		#by_ptr idna: UIDNA,
		name: ^u16,
		length: i32,
		dest: ^u16,
		capacity: i32,
		pInfo: ^UIDNAInfo,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uidna_nameToUnicodeUTF8 :: proc(
		#by_ptr idna: UIDNA,
		name: PSTR,
		length: i32,
		dest: PSTR,
		capacity: i32,
		pInfo: ^UIDNAInfo,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uidna_openUTS46 :: proc(options: u32, pErrorCode: ^UErrorCode) -> ^UIDNA ---

	uiter_current32 :: proc(iter: ^UCharIterator) -> i32 ---

	uiter_getState :: proc(#by_ptr iter: UCharIterator) -> u32 ---

	uiter_next32 :: proc(iter: ^UCharIterator) -> i32 ---

	uiter_previous32 :: proc(iter: ^UCharIterator) -> i32 ---

	uiter_setState :: proc(iter: ^UCharIterator, state: u32, pErrorCode: ^UErrorCode) ---

	uiter_setString :: proc(iter: ^UCharIterator, s: ^u16, length: i32) ---

	uiter_setUTF16BE :: proc(iter: ^UCharIterator, s: PSTR, length: i32) ---

	uiter_setUTF8 :: proc(iter: ^UCharIterator, s: PSTR, length: i32) ---

	uldn_close :: proc(ldn: ^ULocaleDisplayNames) ---

	uldn_getContext :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		type: UDisplayContextType,
		pErrorCode: ^UErrorCode,
	) -> UDisplayContext ---

	uldn_getDialectHandling :: proc(#by_ptr ldn: ULocaleDisplayNames) -> UDialectHandling ---

	uldn_getLocale :: proc(#by_ptr ldn: ULocaleDisplayNames) -> PSTR ---

	uldn_keyDisplayName :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		key: PSTR,
		result: ^u16,
		maxResultSize: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uldn_keyValueDisplayName :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		key: PSTR,
		value: PSTR,
		result: ^u16,
		maxResultSize: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uldn_languageDisplayName :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		lang: PSTR,
		result: ^u16,
		maxResultSize: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uldn_localeDisplayName :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		locale: PSTR,
		result: ^u16,
		maxResultSize: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uldn_open :: proc(
		locale: PSTR,
		dialectHandling: UDialectHandling,
		pErrorCode: ^UErrorCode,
	) -> ^ULocaleDisplayNames ---

	uldn_openForContext :: proc(
		locale: PSTR,
		contexts: ^UDisplayContext,
		length: i32,
		pErrorCode: ^UErrorCode,
	) -> ^ULocaleDisplayNames ---

	uldn_regionDisplayName :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		region: PSTR,
		result: ^u16,
		maxResultSize: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uldn_scriptCodeDisplayName :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		scriptCode: UScriptCode,
		result: ^u16,
		maxResultSize: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uldn_scriptDisplayName :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		script: PSTR,
		result: ^u16,
		maxResultSize: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	uldn_variantDisplayName :: proc(
		#by_ptr ldn: ULocaleDisplayNames,
		variant: PSTR,
		result: ^u16,
		maxResultSize: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	ulistfmt_close :: proc(listfmt: ^UListFormatter) ---

	ulistfmt_closeResult :: proc(uresult: ^UFormattedList) ---

	ulistfmt_format :: proc(
		#by_ptr listfmt: UListFormatter,
		strings: ^u16,
		stringLengths: ^i32,
		stringCount: i32,
		result: ^u16,
		resultCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ulistfmt_formatStringsToResult :: proc(
		#by_ptr listfmt: UListFormatter,
		strings: ^u16,
		stringLengths: ^i32,
		stringCount: i32,
		uresult: ^UFormattedList,
		status: ^UErrorCode,
	) ---

	ulistfmt_open :: proc(locale: PSTR, status: ^UErrorCode) -> ^UListFormatter ---

	ulistfmt_openForType :: proc(
		locale: PSTR,
		type: UListFormatterType,
		width: UListFormatterWidth,
		status: ^UErrorCode,
	) -> ^UListFormatter ---

	ulistfmt_openResult :: proc(ec: ^UErrorCode) -> ^UFormattedList ---

	ulistfmt_resultAsValue :: proc(#by_ptr uresult: UFormattedList, ec: ^UErrorCode) -> ^UFormattedValue ---

	uloc_acceptLanguage :: proc(
		result: PSTR,
		resultAvailable: i32,
		outResult: ^UAcceptResult,
		acceptList: ^i8,
		acceptListCount: i32,
		availableLocales: ^UEnumeration,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_acceptLanguageFromHTTP :: proc(
		result: PSTR,
		resultAvailable: i32,
		outResult: ^UAcceptResult,
		httpAcceptLanguage: PSTR,
		availableLocales: ^UEnumeration,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_addLikelySubtags :: proc(
		localeID: PSTR,
		maximizedLocaleID: PSTR,
		maximizedLocaleIDCapacity: i32,
		err: ^UErrorCode,
	) -> i32 ---

	uloc_canonicalize :: proc(localeID: PSTR, name: PSTR, nameCapacity: i32, err: ^UErrorCode) -> i32 ---

	uloc_countAvailable :: proc() -> i32 ---

	uloc_forLanguageTag :: proc(
		langtag: PSTR,
		localeID: PSTR,
		localeIDCapacity: i32,
		parsedLength: ^i32,
		err: ^UErrorCode,
	) -> i32 ---

	uloc_getAvailable :: proc(n: i32) -> PSTR ---

	uloc_getBaseName :: proc(localeID: PSTR, name: PSTR, nameCapacity: i32, err: ^UErrorCode) -> i32 ---

	uloc_getCharacterOrientation :: proc(localeId: PSTR, status: ^UErrorCode) -> ULayoutType ---

	uloc_getCountry :: proc(localeID: PSTR, country: PSTR, countryCapacity: i32, err: ^UErrorCode) -> i32 ---

	uloc_getDefault :: proc() -> PSTR ---

	uloc_getDisplayCountry :: proc(
		locale: PSTR,
		displayLocale: PSTR,
		country: ^u16,
		countryCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_getDisplayKeyword :: proc(
		keyword: PSTR,
		displayLocale: PSTR,
		dest: ^u16,
		destCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_getDisplayKeywordValue :: proc(
		locale: PSTR,
		keyword: PSTR,
		displayLocale: PSTR,
		dest: ^u16,
		destCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_getDisplayLanguage :: proc(
		locale: PSTR,
		displayLocale: PSTR,
		language: ^u16,
		languageCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_getDisplayName :: proc(localeID: PSTR, inLocaleID: PSTR, result: ^u16, maxResultSize: i32, err: ^UErrorCode) -> i32 ---

	uloc_getDisplayScript :: proc(
		locale: PSTR,
		displayLocale: PSTR,
		script: ^u16,
		scriptCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_getDisplayVariant :: proc(
		locale: PSTR,
		displayLocale: PSTR,
		variant: ^u16,
		variantCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_getISO3Country :: proc(localeID: PSTR) -> PSTR ---

	uloc_getISO3Language :: proc(localeID: PSTR) -> PSTR ---

	uloc_getISOCountries :: proc() -> ^i8 ---

	uloc_getISOLanguages :: proc() -> ^i8 ---

	uloc_getKeywordValue :: proc(
		localeID: PSTR,
		keywordName: PSTR,
		buffer: PSTR,
		bufferCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_getLanguage :: proc(localeID: PSTR, language: PSTR, languageCapacity: i32, err: ^UErrorCode) -> i32 ---

	uloc_getLCID :: proc(localeID: PSTR) -> u32 ---

	uloc_getLineOrientation :: proc(localeId: PSTR, status: ^UErrorCode) -> ULayoutType ---

	uloc_getLocaleForLCID :: proc(hostID: u32, locale: PSTR, localeCapacity: i32, status: ^UErrorCode) -> i32 ---

	uloc_getName :: proc(localeID: PSTR, name: PSTR, nameCapacity: i32, err: ^UErrorCode) -> i32 ---

	uloc_getParent :: proc(localeID: PSTR, parent: PSTR, parentCapacity: i32, err: ^UErrorCode) -> i32 ---

	uloc_getScript :: proc(localeID: PSTR, script: PSTR, scriptCapacity: i32, err: ^UErrorCode) -> i32 ---

	uloc_getVariant :: proc(localeID: PSTR, variant: PSTR, variantCapacity: i32, err: ^UErrorCode) -> i32 ---

	uloc_isRightToLeft :: proc(locale: PSTR) -> i8 ---

	uloc_minimizeSubtags :: proc(
		localeID: PSTR,
		minimizedLocaleID: PSTR,
		minimizedLocaleIDCapacity: i32,
		err: ^UErrorCode,
	) -> i32 ---

	uloc_openAvailableByType :: proc(type: ULocAvailableType, status: ^UErrorCode) -> ^UEnumeration ---

	uloc_openKeywords :: proc(localeID: PSTR, status: ^UErrorCode) -> ^UEnumeration ---

	uloc_setDefault :: proc(localeID: PSTR, status: ^UErrorCode) ---

	uloc_setKeywordValue :: proc(
		keywordName: PSTR,
		keywordValue: PSTR,
		buffer: PSTR,
		bufferCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uloc_toLanguageTag :: proc(localeID: PSTR, langtag: PSTR, langtagCapacity: i32, strict: i8, err: ^UErrorCode) -> i32 ---

	uloc_toLegacyKey :: proc(keyword: PSTR) -> PSTR ---

	uloc_toLegacyType :: proc(keyword: PSTR, value: PSTR) -> PSTR ---

	uloc_toUnicodeLocaleKey :: proc(keyword: PSTR) -> PSTR ---

	uloc_toUnicodeLocaleType :: proc(keyword: PSTR, value: PSTR) -> PSTR ---

	ulocdata_close :: proc(uld: ^ULocaleData) ---

	ulocdata_getCLDRVersion :: proc(versionArray: ^u8, status: ^UErrorCode) ---

	ulocdata_getDelimiter :: proc(
		uld: ^ULocaleData,
		type: ULocaleDataDelimiterType,
		result: ^u16,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ulocdata_getExemplarSet :: proc(
		uld: ^ULocaleData,
		fillIn: ^USet,
		options: u32,
		extype: ULocaleDataExemplarSetType,
		status: ^UErrorCode,
	) -> ^USet ---

	ulocdata_getLocaleDisplayPattern :: proc(uld: ^ULocaleData, pattern: ^u16, patternCapacity: i32, status: ^UErrorCode) -> i32 ---

	ulocdata_getLocaleSeparator :: proc(uld: ^ULocaleData, separator: ^u16, separatorCapacity: i32, status: ^UErrorCode) -> i32 ---

	ulocdata_getMeasurementSystem :: proc(localeID: PSTR, status: ^UErrorCode) -> UMeasurementSystem ---

	ulocdata_getNoSubstitute :: proc(uld: ^ULocaleData) -> i8 ---

	ulocdata_getPaperSize :: proc(localeID: PSTR, height: ^i32, width: ^i32, status: ^UErrorCode) ---

	ulocdata_open :: proc(localeID: PSTR, status: ^UErrorCode) -> ^ULocaleData ---

	ulocdata_setNoSubstitute :: proc(uld: ^ULocaleData, setting: i8) ---

	umsg_applyPattern :: proc(
		fmt: rawptr,
		pattern: ^u16,
		patternLength: i32,
		parseError: ^UParseError,
		status: ^UErrorCode,
	) ---

	umsg_autoQuoteApostrophe :: proc(pattern: ^u16, patternLength: i32, dest: ^u16, destCapacity: i32, ec: ^UErrorCode) -> i32 ---

	umsg_clone :: proc(fmt: rawptr, status: ^UErrorCode) -> rawptr ---

	umsg_close :: proc(format: rawptr) ---

	umsg_format :: proc(fmt: rawptr, result: ^u16, resultLength: i32, status: ^UErrorCode) -> i32 ---

	umsg_getLocale :: proc(fmt: rawptr) -> PSTR ---

	umsg_open :: proc(
		pattern: ^u16,
		patternLength: i32,
		locale: PSTR,
		parseError: ^UParseError,
		status: ^UErrorCode,
	) -> rawptr ---

	umsg_parse :: proc(fmt: rawptr, source: ^u16, sourceLength: i32, count: ^i32, status: ^UErrorCode) ---

	umsg_setLocale :: proc(fmt: rawptr, locale: PSTR) ---

	umsg_toPattern :: proc(fmt: rawptr, result: ^u16, resultLength: i32, status: ^UErrorCode) -> i32 ---

	umsg_vformat :: proc(fmt: rawptr, result: ^u16, resultLength: i32, ap: ^i8, status: ^UErrorCode) -> i32 ---

	umsg_vparse :: proc(fmt: rawptr, source: ^u16, sourceLength: i32, count: ^i32, ap: ^i8, status: ^UErrorCode) ---

	umutablecptrie_buildImmutable :: proc(
		trie: ^UMutableCPTrie,
		type: UCPTrieType,
		valueWidth: UCPTrieValueWidth,
		pErrorCode: ^UErrorCode,
	) -> ^UCPTrie ---

	umutablecptrie_clone :: proc(#by_ptr other: UMutableCPTrie, pErrorCode: ^UErrorCode) -> ^UMutableCPTrie ---

	umutablecptrie_close :: proc(trie: ^UMutableCPTrie) ---

	umutablecptrie_fromUCPMap :: proc(#by_ptr _map: UCPMap, pErrorCode: ^UErrorCode) -> ^UMutableCPTrie ---

	umutablecptrie_fromUCPTrie :: proc(#by_ptr trie: UCPTrie, pErrorCode: ^UErrorCode) -> ^UMutableCPTrie ---

	umutablecptrie_get :: proc(#by_ptr trie: UMutableCPTrie, c: i32) -> u32 ---

	umutablecptrie_getRange :: proc(
		#by_ptr trie: UMutableCPTrie,
		start: i32,
		option: UCPMapRangeOption,
		surrogateValue: u32,
		filter: ^UCPMapValueFilter,
		_context: rawptr,
		pValue: ^u32,
	) -> i32 ---

	umutablecptrie_open :: proc(initialValue: u32, errorValue: u32, pErrorCode: ^UErrorCode) -> ^UMutableCPTrie ---

	umutablecptrie_set :: proc(trie: ^UMutableCPTrie, c: i32, value: u32, pErrorCode: ^UErrorCode) ---

	umutablecptrie_setRange :: proc(trie: ^UMutableCPTrie, start: i32, end: i32, value: u32, pErrorCode: ^UErrorCode) ---

	unorm_compare :: proc(s1: ^u16, length1: i32, s2: ^u16, length2: i32, options: u32, pErrorCode: ^UErrorCode) -> i32 ---

	unorm2_append :: proc(
		#by_ptr norm2: UNormalizer2,
		first: ^u16,
		firstLength: i32,
		firstCapacity: i32,
		second: ^u16,
		secondLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	unorm2_close :: proc(norm2: ^UNormalizer2) ---

	unorm2_composePair :: proc(#by_ptr norm2: UNormalizer2, a: i32, b: i32) -> i32 ---

	unorm2_getCombiningClass :: proc(#by_ptr norm2: UNormalizer2, c: i32) -> u8 ---

	unorm2_getDecomposition :: proc(
		#by_ptr norm2: UNormalizer2,
		c: i32,
		decomposition: ^u16,
		capacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	unorm2_getInstance :: proc(
		packageName: PSTR,
		name: PSTR,
		mode: UNormalization2Mode,
		pErrorCode: ^UErrorCode,
	) -> ^UNormalizer2 ---

	unorm2_getNFCInstance :: proc(pErrorCode: ^UErrorCode) -> ^UNormalizer2 ---

	unorm2_getNFDInstance :: proc(pErrorCode: ^UErrorCode) -> ^UNormalizer2 ---

	unorm2_getNFKCCasefoldInstance :: proc(pErrorCode: ^UErrorCode) -> ^UNormalizer2 ---

	unorm2_getNFKCInstance :: proc(pErrorCode: ^UErrorCode) -> ^UNormalizer2 ---

	unorm2_getNFKDInstance :: proc(pErrorCode: ^UErrorCode) -> ^UNormalizer2 ---

	unorm2_getRawDecomposition :: proc(
		#by_ptr norm2: UNormalizer2,
		c: i32,
		decomposition: ^u16,
		capacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	unorm2_hasBoundaryAfter :: proc(#by_ptr norm2: UNormalizer2, c: i32) -> i8 ---

	unorm2_hasBoundaryBefore :: proc(#by_ptr norm2: UNormalizer2, c: i32) -> i8 ---

	unorm2_isInert :: proc(#by_ptr norm2: UNormalizer2, c: i32) -> i8 ---

	unorm2_isNormalized :: proc(#by_ptr norm2: UNormalizer2, s: ^u16, length: i32, pErrorCode: ^UErrorCode) -> i8 ---

	unorm2_normalize :: proc(
		#by_ptr norm2: UNormalizer2,
		src: ^u16,
		length: i32,
		dest: ^u16,
		capacity: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	unorm2_normalizeSecondAndAppend :: proc(
		#by_ptr norm2: UNormalizer2,
		first: ^u16,
		firstLength: i32,
		firstCapacity: i32,
		second: ^u16,
		secondLength: i32,
		pErrorCode: ^UErrorCode,
	) -> i32 ---

	unorm2_openFiltered :: proc(
		#by_ptr norm2: UNormalizer2,
		#by_ptr filterSet: USet,
		pErrorCode: ^UErrorCode,
	) -> ^UNormalizer2 ---

	unorm2_quickCheck :: proc(
		#by_ptr norm2: UNormalizer2,
		s: ^u16,
		length: i32,
		pErrorCode: ^UErrorCode,
	) -> UNormalizationCheckResult ---

	unorm2_spanQuickCheckYes :: proc(#by_ptr norm2: UNormalizer2, s: ^u16, length: i32, pErrorCode: ^UErrorCode) -> i32 ---

	unum_applyPattern :: proc(
		format: rawptr,
		localized: i8,
		pattern: ^u16,
		patternLength: i32,
		parseError: ^UParseError,
		status: ^UErrorCode,
	) ---

	unum_clone :: proc(fmt: rawptr, status: ^UErrorCode) -> rawptr ---

	unum_close :: proc(fmt: rawptr) ---

	unum_countAvailable :: proc() -> i32 ---

	unum_format :: proc(
		fmt: rawptr,
		number: i32,
		result: ^u16,
		resultLength: i32,
		pos: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	unum_formatDecimal :: proc(
		fmt: rawptr,
		number: PSTR,
		length: i32,
		result: ^u16,
		resultLength: i32,
		pos: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	unum_formatDouble :: proc(
		fmt: rawptr,
		number: f64,
		result: ^u16,
		resultLength: i32,
		pos: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	unum_formatDoubleCurrency :: proc(
		fmt: rawptr,
		number: f64,
		currency: ^u16,
		result: ^u16,
		resultLength: i32,
		pos: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	unum_formatDoubleForFields :: proc(
		format: rawptr,
		number: f64,
		result: ^u16,
		resultLength: i32,
		fpositer: ^UFieldPositionIterator,
		status: ^UErrorCode,
	) -> i32 ---

	unum_formatInt64 :: proc(
		fmt: rawptr,
		number: i64,
		result: ^u16,
		resultLength: i32,
		pos: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	unum_formatUFormattable :: proc(
		fmt: rawptr,
		number: rawptr,
		result: ^u16,
		resultLength: i32,
		pos: ^UFieldPosition,
		status: ^UErrorCode,
	) -> i32 ---

	unum_getAttribute :: proc(fmt: rawptr, attr: UNumberFormatAttribute) -> i32 ---

	unum_getAvailable :: proc(localeIndex: i32) -> PSTR ---

	unum_getContext :: proc(fmt: rawptr, type: UDisplayContextType, status: ^UErrorCode) -> UDisplayContext ---

	unum_getDoubleAttribute :: proc(fmt: rawptr, attr: UNumberFormatAttribute) -> f64 ---

	unum_getLocaleByType :: proc(fmt: rawptr, type: ULocDataLocaleType, status: ^UErrorCode) -> PSTR ---

	unum_getSymbol :: proc(
		fmt: rawptr,
		symbol: UNumberFormatSymbol,
		buffer: ^u16,
		size: i32,
		status: ^UErrorCode,
	) -> i32 ---

	unum_getTextAttribute :: proc(
		fmt: rawptr,
		tag: UNumberFormatTextAttribute,
		result: ^u16,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	unum_open :: proc(
		style: UNumberFormatStyle,
		pattern: ^u16,
		patternLength: i32,
		locale: PSTR,
		parseErr: ^UParseError,
		status: ^UErrorCode,
	) -> rawptr ---

	unum_parse :: proc(fmt: rawptr, text: ^u16, textLength: i32, parsePos: ^i32, status: ^UErrorCode) -> i32 ---

	unum_parseDecimal :: proc(
		fmt: rawptr,
		text: ^u16,
		textLength: i32,
		parsePos: ^i32,
		outBuf: PSTR,
		outBufLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	unum_parseDouble :: proc(fmt: rawptr, text: ^u16, textLength: i32, parsePos: ^i32, status: ^UErrorCode) -> f64 ---

	unum_parseDoubleCurrency :: proc(
		fmt: rawptr,
		text: ^u16,
		textLength: i32,
		parsePos: ^i32,
		currency: ^u16,
		status: ^UErrorCode,
	) -> f64 ---

	unum_parseInt64 :: proc(fmt: rawptr, text: ^u16, textLength: i32, parsePos: ^i32, status: ^UErrorCode) -> i64 ---

	unum_parseToUFormattable :: proc(
		fmt: rawptr,
		result: rawptr,
		text: ^u16,
		textLength: i32,
		parsePos: ^i32,
		status: ^UErrorCode,
	) -> rawptr ---

	unum_setAttribute :: proc(fmt: rawptr, attr: UNumberFormatAttribute, newValue: i32) ---

	unum_setContext :: proc(fmt: rawptr, value: UDisplayContext, status: ^UErrorCode) ---

	unum_setDoubleAttribute :: proc(fmt: rawptr, attr: UNumberFormatAttribute, newValue: f64) ---

	unum_setSymbol :: proc(
		fmt: rawptr,
		symbol: UNumberFormatSymbol,
		value: ^u16,
		length: i32,
		status: ^UErrorCode,
	) ---

	unum_setTextAttribute :: proc(
		fmt: rawptr,
		tag: UNumberFormatTextAttribute,
		newValue: ^u16,
		newValueLength: i32,
		status: ^UErrorCode,
	) ---

	unum_toPattern :: proc(
		fmt: rawptr,
		isPatternLocalized: i8,
		result: ^u16,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	unumf_close :: proc(uformatter: ^UNumberFormatter) ---

	unumf_closeResult :: proc(uresult: ^UFormattedNumber) ---

	unumf_formatDecimal :: proc(
		#by_ptr uformatter: UNumberFormatter,
		value: PSTR,
		valueLen: i32,
		uresult: ^UFormattedNumber,
		ec: ^UErrorCode,
	) ---

	unumf_formatDouble :: proc(
		#by_ptr uformatter: UNumberFormatter,
		value: f64,
		uresult: ^UFormattedNumber,
		ec: ^UErrorCode,
	) ---

	unumf_formatInt :: proc(
		#by_ptr uformatter: UNumberFormatter,
		value: i64,
		uresult: ^UFormattedNumber,
		ec: ^UErrorCode,
	) ---

	unumf_openForSkeletonAndLocale :: proc(skeleton: ^u16, skeletonLen: i32, locale: PSTR, ec: ^UErrorCode) -> ^UNumberFormatter ---

	unumf_openForSkeletonAndLocaleWithError :: proc(
		skeleton: ^u16,
		skeletonLen: i32,
		locale: PSTR,
		perror: ^UParseError,
		ec: ^UErrorCode,
	) -> ^UNumberFormatter ---

	unumf_openResult :: proc(ec: ^UErrorCode) -> ^UFormattedNumber ---

	unumf_resultAsValue :: proc(#by_ptr uresult: UFormattedNumber, ec: ^UErrorCode) -> ^UFormattedValue ---

	unumf_resultGetAllFieldPositions :: proc(
		#by_ptr uresult: UFormattedNumber,
		ufpositer: ^UFieldPositionIterator,
		ec: ^UErrorCode,
	) ---

	unumf_resultNextFieldPosition :: proc(#by_ptr uresult: UFormattedNumber, ufpos: ^UFieldPosition, ec: ^UErrorCode) -> i8 ---

	unumf_resultToString :: proc(
		#by_ptr uresult: UFormattedNumber,
		buffer: ^u16,
		bufferCapacity: i32,
		ec: ^UErrorCode,
	) -> i32 ---

	unumsys_close :: proc(unumsys: ^UNumberingSystem) ---

	unumsys_getDescription :: proc(
		#by_ptr unumsys: UNumberingSystem,
		result: ^u16,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	unumsys_getName :: proc(#by_ptr unumsys: UNumberingSystem) -> PSTR ---

	unumsys_getRadix :: proc(#by_ptr unumsys: UNumberingSystem) -> i32 ---

	unumsys_isAlgorithmic :: proc(#by_ptr unumsys: UNumberingSystem) -> i8 ---

	unumsys_open :: proc(locale: PSTR, status: ^UErrorCode) -> ^UNumberingSystem ---

	unumsys_openAvailableNames :: proc(status: ^UErrorCode) -> ^UEnumeration ---

	unumsys_openByName :: proc(name: PSTR, status: ^UErrorCode) -> ^UNumberingSystem ---

	uplrules_close :: proc(uplrules: ^UPluralRules) ---

	uplrules_getKeywords :: proc(#by_ptr uplrules: UPluralRules, status: ^UErrorCode) -> ^UEnumeration ---

	uplrules_open :: proc(locale: PSTR, status: ^UErrorCode) -> ^UPluralRules ---

	uplrules_openForType :: proc(locale: PSTR, type: UPluralType, status: ^UErrorCode) -> ^UPluralRules ---

	uplrules_select :: proc(
		#by_ptr uplrules: UPluralRules,
		number: f64,
		keyword: ^u16,
		capacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uplrules_selectFormatted :: proc(
		#by_ptr uplrules: UPluralRules,
		#by_ptr number: UFormattedNumber,
		keyword: ^u16,
		capacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_appendReplacement :: proc(
		regexp: ^URegularExpression,
		replacementText: ^u16,
		replacementLength: i32,
		destBuf: ^u16,
		destCapacity: ^i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_appendReplacementUText :: proc(
		regexp: ^URegularExpression,
		replacementText: ^UText,
		dest: ^UText,
		status: ^UErrorCode,
	) ---

	uregex_appendTail :: proc(
		regexp: ^URegularExpression,
		destBuf: ^u16,
		destCapacity: ^i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_appendTailUText :: proc(regexp: ^URegularExpression, dest: ^UText, status: ^UErrorCode) -> ^UText ---

	uregex_clone :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> ^URegularExpression ---

	uregex_close :: proc(regexp: ^URegularExpression) ---

	uregex_end :: proc(regexp: ^URegularExpression, groupNum: i32, status: ^UErrorCode) -> i32 ---

	uregex_end64 :: proc(regexp: ^URegularExpression, groupNum: i32, status: ^UErrorCode) -> i64 ---

	uregex_find :: proc(regexp: ^URegularExpression, startIndex: i32, status: ^UErrorCode) -> i8 ---

	uregex_find64 :: proc(regexp: ^URegularExpression, startIndex: i64, status: ^UErrorCode) -> i8 ---

	uregex_findNext :: proc(regexp: ^URegularExpression, status: ^UErrorCode) -> i8 ---

	uregex_flags :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i32 ---

	uregex_getFindProgressCallback :: proc(
		#by_ptr regexp: URegularExpression,
		callback: ^URegexFindProgressCallback,
		_context: rawptr,
		status: ^UErrorCode,
	) ---

	uregex_getMatchCallback :: proc(
		#by_ptr regexp: URegularExpression,
		callback: ^URegexMatchCallback,
		_context: rawptr,
		status: ^UErrorCode,
	) ---

	uregex_getStackLimit :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i32 ---

	uregex_getText :: proc(regexp: ^URegularExpression, textLength: ^i32, status: ^UErrorCode) -> ^u16 ---

	uregex_getTimeLimit :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i32 ---

	uregex_getUText :: proc(regexp: ^URegularExpression, dest: ^UText, status: ^UErrorCode) -> ^UText ---

	uregex_group :: proc(
		regexp: ^URegularExpression,
		groupNum: i32,
		dest: ^u16,
		destCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_groupCount :: proc(regexp: ^URegularExpression, status: ^UErrorCode) -> i32 ---

	uregex_groupNumberFromCName :: proc(
		regexp: ^URegularExpression,
		groupName: PSTR,
		nameLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_groupNumberFromName :: proc(
		regexp: ^URegularExpression,
		groupName: ^u16,
		nameLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_groupUText :: proc(
		regexp: ^URegularExpression,
		groupNum: i32,
		dest: ^UText,
		groupLength: ^i64,
		status: ^UErrorCode,
	) -> ^UText ---

	uregex_hasAnchoringBounds :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i8 ---

	uregex_hasTransparentBounds :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i8 ---

	uregex_hitEnd :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i8 ---

	uregex_lookingAt :: proc(regexp: ^URegularExpression, startIndex: i32, status: ^UErrorCode) -> i8 ---

	uregex_lookingAt64 :: proc(regexp: ^URegularExpression, startIndex: i64, status: ^UErrorCode) -> i8 ---

	uregex_matches :: proc(regexp: ^URegularExpression, startIndex: i32, status: ^UErrorCode) -> i8 ---

	uregex_matches64 :: proc(regexp: ^URegularExpression, startIndex: i64, status: ^UErrorCode) -> i8 ---

	uregex_open :: proc(
		pattern: ^u16,
		patternLength: i32,
		flags: u32,
		pe: ^UParseError,
		status: ^UErrorCode,
	) -> ^URegularExpression ---

	uregex_openC :: proc(pattern: PSTR, flags: u32, pe: ^UParseError, status: ^UErrorCode) -> ^URegularExpression ---

	uregex_openUText :: proc(pattern: ^UText, flags: u32, pe: ^UParseError, status: ^UErrorCode) -> ^URegularExpression ---

	uregex_pattern :: proc(#by_ptr regexp: URegularExpression, patLength: ^i32, status: ^UErrorCode) -> ^u16 ---

	uregex_patternUText :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> ^UText ---

	uregex_refreshUText :: proc(regexp: ^URegularExpression, text: ^UText, status: ^UErrorCode) ---

	uregex_regionEnd :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i32 ---

	uregex_regionEnd64 :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i64 ---

	uregex_regionStart :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i32 ---

	uregex_regionStart64 :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i64 ---

	uregex_replaceAll :: proc(
		regexp: ^URegularExpression,
		replacementText: ^u16,
		replacementLength: i32,
		destBuf: ^u16,
		destCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_replaceAllUText :: proc(
		regexp: ^URegularExpression,
		replacement: ^UText,
		dest: ^UText,
		status: ^UErrorCode,
	) -> ^UText ---

	uregex_replaceFirst :: proc(
		regexp: ^URegularExpression,
		replacementText: ^u16,
		replacementLength: i32,
		destBuf: ^u16,
		destCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_replaceFirstUText :: proc(
		regexp: ^URegularExpression,
		replacement: ^UText,
		dest: ^UText,
		status: ^UErrorCode,
	) -> ^UText ---

	uregex_requireEnd :: proc(#by_ptr regexp: URegularExpression, status: ^UErrorCode) -> i8 ---

	uregex_reset :: proc(regexp: ^URegularExpression, index: i32, status: ^UErrorCode) ---

	uregex_reset64 :: proc(regexp: ^URegularExpression, index: i64, status: ^UErrorCode) ---

	uregex_setFindProgressCallback :: proc(
		regexp: ^URegularExpression,
		callback: URegexFindProgressCallback,
		_context: rawptr,
		status: ^UErrorCode,
	) ---

	uregex_setMatchCallback :: proc(
		regexp: ^URegularExpression,
		callback: URegexMatchCallback,
		_context: rawptr,
		status: ^UErrorCode,
	) ---

	uregex_setRegion :: proc(
		regexp: ^URegularExpression,
		regionStart: i32,
		regionLimit: i32,
		status: ^UErrorCode,
	) ---

	uregex_setRegion64 :: proc(
		regexp: ^URegularExpression,
		regionStart: i64,
		regionLimit: i64,
		status: ^UErrorCode,
	) ---

	uregex_setRegionAndStart :: proc(
		regexp: ^URegularExpression,
		regionStart: i64,
		regionLimit: i64,
		startIndex: i64,
		status: ^UErrorCode,
	) ---

	uregex_setStackLimit :: proc(regexp: ^URegularExpression, limit: i32, status: ^UErrorCode) ---

	uregex_setText :: proc(regexp: ^URegularExpression, text: ^u16, textLength: i32, status: ^UErrorCode) ---

	uregex_setTimeLimit :: proc(regexp: ^URegularExpression, limit: i32, status: ^UErrorCode) ---

	uregex_setUText :: proc(regexp: ^URegularExpression, text: ^UText, status: ^UErrorCode) ---

	uregex_split :: proc(
		regexp: ^URegularExpression,
		destBuf: ^u16,
		destCapacity: i32,
		requiredCapacity: ^i32,
		destFields: ^u16,
		destFieldsCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_splitUText :: proc(
		regexp: ^URegularExpression,
		destFields: ^UText,
		destFieldsCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uregex_start :: proc(regexp: ^URegularExpression, groupNum: i32, status: ^UErrorCode) -> i32 ---

	uregex_start64 :: proc(regexp: ^URegularExpression, groupNum: i32, status: ^UErrorCode) -> i64 ---

	uregex_useAnchoringBounds :: proc(regexp: ^URegularExpression, b: i8, status: ^UErrorCode) ---

	uregex_useTransparentBounds :: proc(regexp: ^URegularExpression, b: i8, status: ^UErrorCode) ---

	uregion_areEqual :: proc(#by_ptr uregion: URegion, #by_ptr otherRegion: URegion) -> i8 ---

	uregion_contains :: proc(#by_ptr uregion: URegion, #by_ptr otherRegion: URegion) -> i8 ---

	uregion_getAvailable :: proc(type: URegionType, status: ^UErrorCode) -> ^UEnumeration ---

	uregion_getContainedRegions :: proc(#by_ptr uregion: URegion, status: ^UErrorCode) -> ^UEnumeration ---

	uregion_getContainedRegionsOfType :: proc(#by_ptr uregion: URegion, type: URegionType, status: ^UErrorCode) -> ^UEnumeration ---

	uregion_getContainingRegion :: proc(#by_ptr uregion: URegion) -> ^URegion ---

	uregion_getContainingRegionOfType :: proc(#by_ptr uregion: URegion, type: URegionType) -> ^URegion ---

	uregion_getNumericCode :: proc(#by_ptr uregion: URegion) -> i32 ---

	uregion_getPreferredValues :: proc(#by_ptr uregion: URegion, status: ^UErrorCode) -> ^UEnumeration ---

	uregion_getRegionCode :: proc(#by_ptr uregion: URegion) -> PSTR ---

	uregion_getRegionFromCode :: proc(regionCode: PSTR, status: ^UErrorCode) -> ^URegion ---

	uregion_getRegionFromNumericCode :: proc(code: i32, status: ^UErrorCode) -> ^URegion ---

	uregion_getType :: proc(#by_ptr uregion: URegion) -> URegionType ---

	ureldatefmt_close :: proc(reldatefmt: ^URelativeDateTimeFormatter) ---

	ureldatefmt_closeResult :: proc(ufrdt: ^UFormattedRelativeDateTime) ---

	ureldatefmt_combineDateAndTime :: proc(
		#by_ptr reldatefmt: URelativeDateTimeFormatter,
		relativeDateString: ^u16,
		relativeDateStringLen: i32,
		timeString: ^u16,
		timeStringLen: i32,
		result: ^u16,
		resultCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ureldatefmt_format :: proc(
		#by_ptr reldatefmt: URelativeDateTimeFormatter,
		offset: f64,
		unit: URelativeDateTimeUnit,
		result: ^u16,
		resultCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ureldatefmt_formatNumeric :: proc(
		#by_ptr reldatefmt: URelativeDateTimeFormatter,
		offset: f64,
		unit: URelativeDateTimeUnit,
		result: ^u16,
		resultCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	ureldatefmt_formatNumericToResult :: proc(
		#by_ptr reldatefmt: URelativeDateTimeFormatter,
		offset: f64,
		unit: URelativeDateTimeUnit,
		result: ^UFormattedRelativeDateTime,
		status: ^UErrorCode,
	) ---

	ureldatefmt_formatToResult :: proc(
		#by_ptr reldatefmt: URelativeDateTimeFormatter,
		offset: f64,
		unit: URelativeDateTimeUnit,
		result: ^UFormattedRelativeDateTime,
		status: ^UErrorCode,
	) ---

	ureldatefmt_open :: proc(
		locale: PSTR,
		nfToAdopt: rawptr,
		width: UDateRelativeDateTimeFormatterStyle,
		capitalizationContext: UDisplayContext,
		status: ^UErrorCode,
	) -> ^URelativeDateTimeFormatter ---

	ureldatefmt_openResult :: proc(ec: ^UErrorCode) -> ^UFormattedRelativeDateTime ---

	ureldatefmt_resultAsValue :: proc(#by_ptr ufrdt: UFormattedRelativeDateTime, ec: ^UErrorCode) -> ^UFormattedValue ---

	ures_close :: proc(resourceBundle: ^UResourceBundle) ---

	ures_getBinary :: proc(#by_ptr resourceBundle: UResourceBundle, len: ^i32, status: ^UErrorCode) -> ^u8 ---

	ures_getByIndex :: proc(
		#by_ptr resourceBundle: UResourceBundle,
		indexR: i32,
		fillIn: ^UResourceBundle,
		status: ^UErrorCode,
	) -> ^UResourceBundle ---

	ures_getByKey :: proc(
		#by_ptr resourceBundle: UResourceBundle,
		key: PSTR,
		fillIn: ^UResourceBundle,
		status: ^UErrorCode,
	) -> ^UResourceBundle ---

	ures_getInt :: proc(#by_ptr resourceBundle: UResourceBundle, status: ^UErrorCode) -> i32 ---

	ures_getIntVector :: proc(#by_ptr resourceBundle: UResourceBundle, len: ^i32, status: ^UErrorCode) -> ^i32 ---

	ures_getKey :: proc(#by_ptr resourceBundle: UResourceBundle) -> PSTR ---

	ures_getLocaleByType :: proc(
		#by_ptr resourceBundle: UResourceBundle,
		type: ULocDataLocaleType,
		status: ^UErrorCode,
	) -> PSTR ---

	ures_getNextResource :: proc(
		resourceBundle: ^UResourceBundle,
		fillIn: ^UResourceBundle,
		status: ^UErrorCode,
	) -> ^UResourceBundle ---

	ures_getNextString :: proc(resourceBundle: ^UResourceBundle, len: ^i32, key: ^i8, status: ^UErrorCode) -> ^u16 ---

	ures_getSize :: proc(#by_ptr resourceBundle: UResourceBundle) -> i32 ---

	ures_getString :: proc(#by_ptr resourceBundle: UResourceBundle, len: ^i32, status: ^UErrorCode) -> ^u16 ---

	ures_getStringByIndex :: proc(
		#by_ptr resourceBundle: UResourceBundle,
		indexS: i32,
		len: ^i32,
		status: ^UErrorCode,
	) -> ^u16 ---

	ures_getStringByKey :: proc(#by_ptr resB: UResourceBundle, key: PSTR, len: ^i32, status: ^UErrorCode) -> ^u16 ---

	ures_getType :: proc(#by_ptr resourceBundle: UResourceBundle) -> UResType ---

	ures_getUInt :: proc(#by_ptr resourceBundle: UResourceBundle, status: ^UErrorCode) -> u32 ---

	ures_getUTF8String :: proc(
		#by_ptr resB: UResourceBundle,
		dest: PSTR,
		length: ^i32,
		forceCopy: i8,
		status: ^UErrorCode,
	) -> PSTR ---

	ures_getUTF8StringByIndex :: proc(
		#by_ptr resB: UResourceBundle,
		stringIndex: i32,
		dest: PSTR,
		pLength: ^i32,
		forceCopy: i8,
		status: ^UErrorCode,
	) -> PSTR ---

	ures_getUTF8StringByKey :: proc(
		#by_ptr resB: UResourceBundle,
		key: PSTR,
		dest: PSTR,
		pLength: ^i32,
		forceCopy: i8,
		status: ^UErrorCode,
	) -> PSTR ---

	ures_getVersion :: proc(#by_ptr resB: UResourceBundle, versionInfo: ^u8) ---

	ures_hasNext :: proc(#by_ptr resourceBundle: UResourceBundle) -> i8 ---

	ures_open :: proc(packageName: PSTR, locale: PSTR, status: ^UErrorCode) -> ^UResourceBundle ---

	ures_openAvailableLocales :: proc(packageName: PSTR, status: ^UErrorCode) -> ^UEnumeration ---

	ures_openDirect :: proc(packageName: PSTR, locale: PSTR, status: ^UErrorCode) -> ^UResourceBundle ---

	ures_openU :: proc(packageName: ^u16, locale: PSTR, status: ^UErrorCode) -> ^UResourceBundle ---

	ures_resetIterator :: proc(resourceBundle: ^UResourceBundle) ---

	uscript_breaksBetweenLetters :: proc(script: UScriptCode) -> i8 ---

	uscript_getCode :: proc(nameOrAbbrOrLocale: PSTR, fillIn: ^UScriptCode, capacity: i32, err: ^UErrorCode) -> i32 ---

	uscript_getName :: proc(scriptCode: UScriptCode) -> PSTR ---

	uscript_getSampleString :: proc(script: UScriptCode, dest: ^u16, capacity: i32, pErrorCode: ^UErrorCode) -> i32 ---

	uscript_getScript :: proc(codepoint: i32, err: ^UErrorCode) -> UScriptCode ---

	uscript_getScriptExtensions :: proc(c: i32, scripts: ^UScriptCode, capacity: i32, errorCode: ^UErrorCode) -> i32 ---

	uscript_getShortName :: proc(scriptCode: UScriptCode) -> PSTR ---

	uscript_getUsage :: proc(script: UScriptCode) -> UScriptUsage ---

	uscript_hasScript :: proc(c: i32, sc: UScriptCode) -> i8 ---

	uscript_isCased :: proc(script: UScriptCode) -> i8 ---

	uscript_isRightToLeft :: proc(script: UScriptCode) -> i8 ---

	usearch_close :: proc(searchiter: ^UStringSearch) ---

	usearch_first :: proc(strsrch: ^UStringSearch, status: ^UErrorCode) -> i32 ---

	usearch_following :: proc(strsrch: ^UStringSearch, position: i32, status: ^UErrorCode) -> i32 ---

	usearch_getAttribute :: proc(
		#by_ptr strsrch: UStringSearch,
		attribute: USearchAttribute,
	) -> USearchAttributeValue ---

	usearch_getBreakIterator :: proc(#by_ptr strsrch: UStringSearch) -> ^UBreakIterator ---

	usearch_getCollator :: proc(#by_ptr strsrch: UStringSearch) -> ^UCollator ---

	usearch_getMatchedLength :: proc(#by_ptr strsrch: UStringSearch) -> i32 ---

	usearch_getMatchedStart :: proc(#by_ptr strsrch: UStringSearch) -> i32 ---

	usearch_getMatchedText :: proc(
		#by_ptr strsrch: UStringSearch,
		result: ^u16,
		resultCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	usearch_getOffset :: proc(#by_ptr strsrch: UStringSearch) -> i32 ---

	usearch_getPattern :: proc(#by_ptr strsrch: UStringSearch, length: ^i32) -> ^u16 ---

	usearch_getText :: proc(#by_ptr strsrch: UStringSearch, length: ^i32) -> ^u16 ---

	usearch_last :: proc(strsrch: ^UStringSearch, status: ^UErrorCode) -> i32 ---

	usearch_next :: proc(strsrch: ^UStringSearch, status: ^UErrorCode) -> i32 ---

	usearch_open :: proc(
		pattern: ^u16,
		patternlength: i32,
		text: ^u16,
		textlength: i32,
		locale: PSTR,
		breakiter: ^UBreakIterator,
		status: ^UErrorCode,
	) -> ^UStringSearch ---

	usearch_openFromCollator :: proc(
		pattern: ^u16,
		patternlength: i32,
		text: ^u16,
		textlength: i32,
		#by_ptr collator: UCollator,
		breakiter: ^UBreakIterator,
		status: ^UErrorCode,
	) -> ^UStringSearch ---

	usearch_preceding :: proc(strsrch: ^UStringSearch, position: i32, status: ^UErrorCode) -> i32 ---

	usearch_previous :: proc(strsrch: ^UStringSearch, status: ^UErrorCode) -> i32 ---

	usearch_reset :: proc(strsrch: ^UStringSearch) ---

	usearch_setAttribute :: proc(
		strsrch: ^UStringSearch,
		attribute: USearchAttribute,
		value: USearchAttributeValue,
		status: ^UErrorCode,
	) ---

	usearch_setBreakIterator :: proc(strsrch: ^UStringSearch, breakiter: ^UBreakIterator, status: ^UErrorCode) ---

	usearch_setCollator :: proc(strsrch: ^UStringSearch, #by_ptr collator: UCollator, status: ^UErrorCode) ---

	usearch_setOffset :: proc(strsrch: ^UStringSearch, position: i32, status: ^UErrorCode) ---

	usearch_setPattern :: proc(strsrch: ^UStringSearch, pattern: ^u16, patternlength: i32, status: ^UErrorCode) ---

	usearch_setText :: proc(strsrch: ^UStringSearch, text: ^u16, textlength: i32, status: ^UErrorCode) ---

	uset_add :: proc(set: ^USet, c: i32) ---

	uset_addAll :: proc(set: ^USet, #by_ptr additionalSet: USet) ---

	uset_addAllCodePoints :: proc(set: ^USet, str: ^u16, strLen: i32) ---

	uset_addRange :: proc(set: ^USet, start: i32, end: i32) ---

	uset_addString :: proc(set: ^USet, str: ^u16, strLen: i32) ---

	uset_applyIntPropertyValue :: proc(set: ^USet, prop: UProperty, value: i32, ec: ^UErrorCode) ---

	uset_applyPattern :: proc(set: ^USet, pattern: ^u16, patternLength: i32, options: u32, status: ^UErrorCode) -> i32 ---

	uset_applyPropertyAlias :: proc(set: ^USet, prop: ^u16, propLength: i32, value: ^u16, valueLength: i32, ec: ^UErrorCode) ---

	uset_charAt :: proc(#by_ptr set: USet, charIndex: i32) -> i32 ---

	uset_clear :: proc(set: ^USet) ---

	uset_clone :: proc(#by_ptr set: USet) -> ^USet ---

	uset_cloneAsThawed :: proc(#by_ptr set: USet) -> ^USet ---

	uset_close :: proc(set: ^USet) ---

	uset_closeOver :: proc(set: ^USet, attributes: i32) ---

	uset_compact :: proc(set: ^USet) ---

	uset_complement :: proc(set: ^USet) ---

	uset_complementAll :: proc(set: ^USet, #by_ptr complement: USet) ---

	uset_contains :: proc(#by_ptr set: USet, c: i32) -> i8 ---

	uset_containsAll :: proc(#by_ptr set1: USet, #by_ptr set2: USet) -> i8 ---

	uset_containsAllCodePoints :: proc(#by_ptr set: USet, str: ^u16, strLen: i32) -> i8 ---

	uset_containsNone :: proc(#by_ptr set1: USet, #by_ptr set2: USet) -> i8 ---

	uset_containsRange :: proc(#by_ptr set: USet, start: i32, end: i32) -> i8 ---

	uset_containsSome :: proc(#by_ptr set1: USet, #by_ptr set2: USet) -> i8 ---

	uset_containsString :: proc(#by_ptr set: USet, str: ^u16, strLen: i32) -> i8 ---

	uset_equals :: proc(#by_ptr set1: USet, #by_ptr set2: USet) -> i8 ---

	uset_freeze :: proc(set: ^USet) ---

	uset_getItem :: proc(
		#by_ptr set: USet,
		itemIndex: i32,
		start: ^i32,
		end: ^i32,
		str: ^u16,
		strCapacity: i32,
		ec: ^UErrorCode,
	) -> i32 ---

	uset_getItemCount :: proc(#by_ptr set: USet) -> i32 ---

	uset_getSerializedRange :: proc(#by_ptr set: USerializedSet, rangeIndex: i32, pStart: ^i32, pEnd: ^i32) -> i8 ---

	uset_getSerializedRangeCount :: proc(#by_ptr set: USerializedSet) -> i32 ---

	uset_getSerializedSet :: proc(fillSet: ^USerializedSet, src: ^u16, srcLength: i32) -> i8 ---

	uset_indexOf :: proc(#by_ptr set: USet, c: i32) -> i32 ---

	uset_isEmpty :: proc(#by_ptr set: USet) -> i8 ---

	uset_isFrozen :: proc(#by_ptr set: USet) -> i8 ---

	uset_open :: proc(start: i32, end: i32) -> ^USet ---

	uset_openEmpty :: proc() -> ^USet ---

	uset_openPattern :: proc(pattern: ^u16, patternLength: i32, ec: ^UErrorCode) -> ^USet ---

	uset_openPatternOptions :: proc(pattern: ^u16, patternLength: i32, options: u32, ec: ^UErrorCode) -> ^USet ---

	uset_remove :: proc(set: ^USet, c: i32) ---

	uset_removeAll :: proc(set: ^USet, #by_ptr removeSet: USet) ---

	uset_removeAllStrings :: proc(set: ^USet) ---

	uset_removeRange :: proc(set: ^USet, start: i32, end: i32) ---

	uset_removeString :: proc(set: ^USet, str: ^u16, strLen: i32) ---

	uset_resemblesPattern :: proc(pattern: ^u16, patternLength: i32, pos: i32) -> i8 ---

	uset_retain :: proc(set: ^USet, start: i32, end: i32) ---

	uset_retainAll :: proc(set: ^USet, #by_ptr retain: USet) ---

	uset_serialize :: proc(#by_ptr set: USet, dest: ^u16, destCapacity: i32, pErrorCode: ^UErrorCode) -> i32 ---

	uset_serializedContains :: proc(#by_ptr set: USerializedSet, c: i32) -> i8 ---

	uset_set :: proc(set: ^USet, start: i32, end: i32) ---

	uset_setSerializedToOne :: proc(fillSet: ^USerializedSet, c: i32) ---

	uset_size :: proc(#by_ptr set: USet) -> i32 ---

	uset_span :: proc(#by_ptr set: USet, s: ^u16, length: i32, spanCondition: USetSpanCondition) -> i32 ---

	uset_spanBack :: proc(#by_ptr set: USet, s: ^u16, length: i32, spanCondition: USetSpanCondition) -> i32 ---

	uset_spanBackUTF8 :: proc(#by_ptr set: USet, s: PSTR, length: i32, spanCondition: USetSpanCondition) -> i32 ---

	uset_spanUTF8 :: proc(#by_ptr set: USet, s: PSTR, length: i32, spanCondition: USetSpanCondition) -> i32 ---

	uset_toPattern :: proc(
		#by_ptr set: USet,
		result: ^u16,
		resultCapacity: i32,
		escapeUnprintable: i8,
		ec: ^UErrorCode,
	) -> i32 ---

	uspoof_areConfusable :: proc(
		#by_ptr sc: USpoofChecker,
		id1: ^u16,
		length1: i32,
		id2: ^u16,
		length2: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uspoof_areConfusableUTF8 :: proc(
		#by_ptr sc: USpoofChecker,
		id1: PSTR,
		length1: i32,
		id2: PSTR,
		length2: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uspoof_check :: proc(
		#by_ptr sc: USpoofChecker,
		id: ^u16,
		length: i32,
		position: ^i32,
		status: ^UErrorCode,
	) -> i32 ---

	uspoof_check2 :: proc(
		#by_ptr sc: USpoofChecker,
		id: ^u16,
		length: i32,
		checkResult: ^USpoofCheckResult,
		status: ^UErrorCode,
	) -> i32 ---

	uspoof_check2UTF8 :: proc(
		#by_ptr sc: USpoofChecker,
		id: PSTR,
		length: i32,
		checkResult: ^USpoofCheckResult,
		status: ^UErrorCode,
	) -> i32 ---

	uspoof_checkUTF8 :: proc(
		#by_ptr sc: USpoofChecker,
		id: PSTR,
		length: i32,
		position: ^i32,
		status: ^UErrorCode,
	) -> i32 ---

	uspoof_clone :: proc(#by_ptr sc: USpoofChecker, status: ^UErrorCode) -> ^USpoofChecker ---

	uspoof_close :: proc(sc: ^USpoofChecker) ---

	uspoof_closeCheckResult :: proc(checkResult: ^USpoofCheckResult) ---

	uspoof_getAllowedChars :: proc(#by_ptr sc: USpoofChecker, status: ^UErrorCode) -> ^USet ---

	uspoof_getAllowedLocales :: proc(sc: ^USpoofChecker, status: ^UErrorCode) -> PSTR ---

	uspoof_getCheckResultChecks :: proc(#by_ptr checkResult: USpoofCheckResult, status: ^UErrorCode) -> i32 ---

	uspoof_getCheckResultNumerics :: proc(#by_ptr checkResult: USpoofCheckResult, status: ^UErrorCode) -> ^USet ---

	uspoof_getCheckResultRestrictionLevel :: proc(#by_ptr checkResult: USpoofCheckResult, status: ^UErrorCode) -> URestrictionLevel ---

	uspoof_getChecks :: proc(#by_ptr sc: USpoofChecker, status: ^UErrorCode) -> i32 ---

	uspoof_getInclusionSet :: proc(status: ^UErrorCode) -> ^USet ---

	uspoof_getRecommendedSet :: proc(status: ^UErrorCode) -> ^USet ---

	uspoof_getRestrictionLevel :: proc(#by_ptr sc: USpoofChecker) -> URestrictionLevel ---

	uspoof_getSkeleton :: proc(
		#by_ptr sc: USpoofChecker,
		type: u32,
		id: ^u16,
		length: i32,
		dest: ^u16,
		destCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uspoof_getSkeletonUTF8 :: proc(
		#by_ptr sc: USpoofChecker,
		type: u32,
		id: PSTR,
		length: i32,
		dest: PSTR,
		destCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	uspoof_open :: proc(status: ^UErrorCode) -> ^USpoofChecker ---

	uspoof_openCheckResult :: proc(status: ^UErrorCode) -> ^USpoofCheckResult ---

	uspoof_openFromSerialized :: proc(data: rawptr, length: i32, pActualLength: ^i32, pErrorCode: ^UErrorCode) -> ^USpoofChecker ---

	uspoof_openFromSource :: proc(
		confusables: PSTR,
		confusablesLen: i32,
		confusablesWholeScript: PSTR,
		confusablesWholeScriptLen: i32,
		errType: ^i32,
		pe: ^UParseError,
		status: ^UErrorCode,
	) -> ^USpoofChecker ---

	uspoof_serialize :: proc(sc: ^USpoofChecker, data: rawptr, capacity: i32, status: ^UErrorCode) -> i32 ---

	uspoof_setAllowedChars :: proc(sc: ^USpoofChecker, #by_ptr chars: USet, status: ^UErrorCode) ---

	uspoof_setAllowedLocales :: proc(sc: ^USpoofChecker, localesList: PSTR, status: ^UErrorCode) ---

	uspoof_setChecks :: proc(sc: ^USpoofChecker, checks: i32, status: ^UErrorCode) ---

	uspoof_setRestrictionLevel :: proc(sc: ^USpoofChecker, restrictionLevel: URestrictionLevel) ---

	usprep_close :: proc(profile: ^UStringPrepProfile) ---

	usprep_open :: proc(path: PSTR, fileName: PSTR, status: ^UErrorCode) -> ^UStringPrepProfile ---

	usprep_openByType :: proc(type: UStringPrepProfileType, status: ^UErrorCode) -> ^UStringPrepProfile ---

	usprep_prepare :: proc(
		#by_ptr prep: UStringPrepProfile,
		src: ^u16,
		srcLength: i32,
		dest: ^u16,
		destCapacity: i32,
		options: i32,
		parseError: ^UParseError,
		status: ^UErrorCode,
	) -> i32 ---

	utext_char32At :: proc(ut: ^UText, nativeIndex: i64) -> i32 ---

	utext_clone :: proc(dest: ^UText, #by_ptr src: UText, deep: i8, readOnly: i8, status: ^UErrorCode) -> ^UText ---

	utext_close :: proc(ut: ^UText) -> ^UText ---

	utext_copy :: proc(
		ut: ^UText,
		nativeStart: i64,
		nativeLimit: i64,
		destIndex: i64,
		move: i8,
		status: ^UErrorCode,
	) ---

	utext_current32 :: proc(ut: ^UText) -> i32 ---

	utext_equals :: proc(#by_ptr a: UText, #by_ptr b: UText) -> i8 ---

	utext_extract :: proc(
		ut: ^UText,
		nativeStart: i64,
		nativeLimit: i64,
		dest: ^u16,
		destCapacity: i32,
		status: ^UErrorCode,
	) -> i32 ---

	utext_freeze :: proc(ut: ^UText) ---

	utext_getNativeIndex :: proc(#by_ptr ut: UText) -> i64 ---

	utext_getPreviousNativeIndex :: proc(ut: ^UText) -> i64 ---

	utext_hasMetaData :: proc(#by_ptr ut: UText) -> i8 ---

	utext_isLengthExpensive :: proc(#by_ptr ut: UText) -> i8 ---

	utext_isWritable :: proc(#by_ptr ut: UText) -> i8 ---

	utext_moveIndex32 :: proc(ut: ^UText, delta: i32) -> i8 ---

	utext_nativeLength :: proc(ut: ^UText) -> i64 ---

	utext_next32 :: proc(ut: ^UText) -> i32 ---

	utext_next32From :: proc(ut: ^UText, nativeIndex: i64) -> i32 ---

	utext_openUChars :: proc(ut: ^UText, s: ^u16, length: i64, status: ^UErrorCode) -> ^UText ---

	utext_openUTF8 :: proc(ut: ^UText, s: PSTR, length: i64, status: ^UErrorCode) -> ^UText ---

	utext_previous32 :: proc(ut: ^UText) -> i32 ---

	utext_previous32From :: proc(ut: ^UText, nativeIndex: i64) -> i32 ---

	utext_replace :: proc(
		ut: ^UText,
		nativeStart: i64,
		nativeLimit: i64,
		replacementText: ^u16,
		replacementLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	utext_setNativeIndex :: proc(ut: ^UText, nativeIndex: i64) ---

	utext_setup :: proc(ut: ^UText, extraSpace: i32, status: ^UErrorCode) -> ^UText ---

	utf8_appendCharSafeBody :: proc(s: ^u8, i: i32, length: i32, c: i32, pIsError: ^i8) -> i32 ---

	utf8_back1SafeBody :: proc(s: ^u8, start: i32, i: i32) -> i32 ---

	utf8_nextCharSafeBody :: proc(s: ^u8, pi: ^i32, length: i32, c: i32, strict: i8) -> i32 ---

	utf8_prevCharSafeBody :: proc(s: ^u8, start: i32, pi: ^i32, c: i32, strict: i8) -> i32 ---

	utmscale_fromInt64 :: proc(otherTime: i64, timeScale: UDateTimeScale, status: ^UErrorCode) -> i64 ---

	utmscale_getTimeScaleValue :: proc(timeScale: UDateTimeScale, value: UTimeScaleValue, status: ^UErrorCode) -> i64 ---

	utmscale_toInt64 :: proc(universalTime: i64, timeScale: UDateTimeScale, status: ^UErrorCode) -> i64 ---

	utrace_format :: proc(outBuf: PSTR, capacity: i32, indent: i32, fmt: PSTR) -> i32 ---

	utrace_functionName :: proc(fnNumber: i32) -> PSTR ---

	utrace_getFunctions :: proc(_context: rawptr, e: ^UTraceEntry, x: ^UTraceExit, d: ^UTraceData) ---

	utrace_getLevel :: proc() -> i32 ---

	utrace_setFunctions :: proc(_context: rawptr, e: UTraceEntry, x: UTraceExit, d: UTraceData) ---

	utrace_setLevel :: proc(traceLevel: i32) ---

	utrace_vformat :: proc(outBuf: PSTR, capacity: i32, indent: i32, fmt: PSTR, args: ^i8) -> i32 ---

	utrans_clone :: proc(trans: rawptr, status: ^UErrorCode) -> rawptr ---

	utrans_close :: proc(trans: rawptr) ---

	utrans_countAvailableIDs :: proc() -> i32 ---

	utrans_getSourceSet :: proc(trans: rawptr, ignoreFilter: i8, fillIn: ^USet, status: ^UErrorCode) -> ^USet ---

	utrans_getUnicodeID :: proc(trans: rawptr, resultLength: ^i32) -> ^u16 ---

	utrans_openIDs :: proc(pErrorCode: ^UErrorCode) -> ^UEnumeration ---

	utrans_openInverse :: proc(trans: rawptr, status: ^UErrorCode) -> rawptr ---

	utrans_openU :: proc(
		id: ^u16,
		idLength: i32,
		dir: UTransDirection,
		rules: ^u16,
		rulesLength: i32,
		parseError: ^UParseError,
		pErrorCode: ^UErrorCode,
	) -> rawptr ---

	utrans_register :: proc(adoptedTrans: rawptr, status: ^UErrorCode) ---

	utrans_setFilter :: proc(trans: rawptr, filterPattern: ^u16, filterPatternLen: i32, status: ^UErrorCode) ---

	utrans_toRules :: proc(
		trans: rawptr,
		escapeUnprintable: i8,
		result: ^u16,
		resultLength: i32,
		status: ^UErrorCode,
	) -> i32 ---

	utrans_trans :: proc(
		trans: rawptr,
		rep: rawptr,
		#by_ptr repFunc: UReplaceableCallbacks,
		start: i32,
		limit: ^i32,
		status: ^UErrorCode,
	) ---

	utrans_transIncremental :: proc(
		trans: rawptr,
		rep: rawptr,
		#by_ptr repFunc: UReplaceableCallbacks,
		pos: ^UTransPosition,
		status: ^UErrorCode,
	) ---

	utrans_transIncrementalUChars :: proc(
		trans: rawptr,
		text: ^u16,
		textLength: ^i32,
		textCapacity: i32,
		pos: ^UTransPosition,
		status: ^UErrorCode,
	) ---

	utrans_transUChars :: proc(
		trans: rawptr,
		text: ^u16,
		textLength: ^i32,
		textCapacity: i32,
		start: i32,
		limit: ^i32,
		status: ^UErrorCode,
	) ---

	utrans_unregisterID :: proc(id: ^u16, idLength: i32) ---
}

@(default_calling_convention="system")
foreign kernel32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/adjustcalendardate ]]
	AdjustCalendarDate :: proc(lpCalDateTime: ^CALDATETIME, calUnit: CALDATETIME_DATEUNIT, amount: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-comparestringa ]]
	CompareStringA :: proc(
		Locale: u32,
		dwCmpFlags: u32,
		lpString1: [^]i8,
		cchCount1: i32,
		lpString2: [^]i8,
		cchCount2: i32,
	) -> COMPARESTRING_RESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-comparestringex ]]
	CompareStringEx :: proc(
		lpLocaleName: PWSTR,
		dwCmpFlags: COMPARE_STRING_FLAGS,
		lpString1: PWSTR,
		cchCount1: i32,
		lpString2: PWSTR,
		cchCount2: i32,
		lpVersionInformation: ^NLSVERSIONINFO,
		lpReserved: rawptr,
		lParam: LPARAM,
	) -> COMPARESTRING_RESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-comparestringordinal ]]
	CompareStringOrdinal :: proc(
		lpString1: PWSTR,
		cchCount1: i32,
		lpString2: PWSTR,
		cchCount2: i32,
		bIgnoreCase: BOOL,
	) -> COMPARESTRING_RESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-comparestringw ]]
	CompareStringW :: proc(
		Locale: u32,
		dwCmpFlags: u32,
		lpString1: PWSTR,
		cchCount1: i32,
		lpString2: PWSTR,
		cchCount2: i32,
	) -> COMPARESTRING_RESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/convertcaldatetimetosystemtime ]]
	ConvertCalDateTimeToSystemTime :: proc(#by_ptr lpCalDateTime: CALDATETIME, lpSysTime: ^SYSTEMTIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-convertdefaultlocale ]]
	ConvertDefaultLocale :: proc(Locale: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/convertsystemtimetocaldatetime ]]
	ConvertSystemTimeToCalDateTime :: proc(#by_ptr lpSysTime: SYSTEMTIME, calId: u32, lpCalDateTime: ^CALDATETIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumcalendarinfoa ]]
	EnumCalendarInfoA :: proc(lpCalInfoEnumProc: CALINFO_ENUMPROCA, Locale: u32, Calendar: u32, CalType: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumcalendarinfoexa ]]
	EnumCalendarInfoExA :: proc(
		lpCalInfoEnumProcEx: CALINFO_ENUMPROCEXA,
		Locale: u32,
		Calendar: u32,
		CalType: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumcalendarinfoexex ]]
	EnumCalendarInfoExEx :: proc(
		pCalInfoEnumProcExEx: CALINFO_ENUMPROCEXEX,
		lpLocaleName: PWSTR,
		Calendar: u32,
		lpReserved: PWSTR,
		CalType: u32,
		lParam: LPARAM,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumcalendarinfoexw ]]
	EnumCalendarInfoExW :: proc(
		lpCalInfoEnumProcEx: CALINFO_ENUMPROCEXW,
		Locale: u32,
		Calendar: u32,
		CalType: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumcalendarinfow ]]
	EnumCalendarInfoW :: proc(lpCalInfoEnumProc: CALINFO_ENUMPROCW, Locale: u32, Calendar: u32, CalType: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumdateformatsa ]]
	EnumDateFormatsA :: proc(lpDateFmtEnumProc: DATEFMT_ENUMPROCA, Locale: u32, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumdateformatsexa ]]
	EnumDateFormatsExA :: proc(lpDateFmtEnumProcEx: DATEFMT_ENUMPROCEXA, Locale: u32, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumdateformatsexex ]]
	EnumDateFormatsExEx :: proc(
		lpDateFmtEnumProcExEx: DATEFMT_ENUMPROCEXEX,
		lpLocaleName: PWSTR,
		dwFlags: ENUM_DATE_FORMATS_FLAGS,
		lParam: LPARAM,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumdateformatsexw ]]
	EnumDateFormatsExW :: proc(lpDateFmtEnumProcEx: DATEFMT_ENUMPROCEXW, Locale: u32, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumdateformatsw ]]
	EnumDateFormatsW :: proc(lpDateFmtEnumProc: DATEFMT_ENUMPROCW, Locale: u32, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumlanguagegrouplocalesa ]]
	EnumLanguageGroupLocalesA :: proc(
		lpLangGroupLocaleEnumProc: LANGGROUPLOCALE_ENUMPROCA,
		LanguageGroup: u32,
		dwFlags: u32,
		lParam: int,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumlanguagegrouplocalesw ]]
	EnumLanguageGroupLocalesW :: proc(
		lpLangGroupLocaleEnumProc: LANGGROUPLOCALE_ENUMPROCW,
		LanguageGroup: u32,
		dwFlags: u32,
		lParam: int,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesa ]]
	EnumSystemCodePagesA :: proc(
		lpCodePageEnumProc: CODEPAGE_ENUMPROCA,
		dwFlags: ENUM_SYSTEM_CODE_PAGES_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemcodepagesw ]]
	EnumSystemCodePagesW :: proc(
		lpCodePageEnumProc: CODEPAGE_ENUMPROCW,
		dwFlags: ENUM_SYSTEM_CODE_PAGES_FLAGS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemgeoid ]]
	EnumSystemGeoID :: proc(GeoClass: u32, ParentGeoId: i32, lpGeoEnumProc: GEO_ENUMPROC) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemgeonames ]]
	EnumSystemGeoNames :: proc(geoClass: u32, geoEnumProc: GEO_ENUMNAMEPROC, data: LPARAM) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemlanguagegroupsa ]]
	EnumSystemLanguageGroupsA :: proc(
		lpLanguageGroupEnumProc: LANGUAGEGROUP_ENUMPROCA,
		dwFlags: ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS,
		lParam: int,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemlanguagegroupsw ]]
	EnumSystemLanguageGroupsW :: proc(
		lpLanguageGroupEnumProc: LANGUAGEGROUP_ENUMPROCW,
		dwFlags: ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS,
		lParam: int,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemlocalesa ]]
	EnumSystemLocalesA :: proc(lpLocaleEnumProc: LOCALE_ENUMPROCA, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemlocalesex ]]
	EnumSystemLocalesEx :: proc(
		lpLocaleEnumProcEx: LOCALE_ENUMPROCEX,
		dwFlags: u32,
		lParam: LPARAM,
		lpReserved: rawptr,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumsystemlocalesw ]]
	EnumSystemLocalesW :: proc(lpLocaleEnumProc: LOCALE_ENUMPROCW, dwFlags: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumtimeformatsa ]]
	EnumTimeFormatsA :: proc(lpTimeFmtEnumProc: TIMEFMT_ENUMPROCA, Locale: u32, dwFlags: TIME_FORMAT_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumtimeformatsex ]]
	EnumTimeFormatsEx :: proc(
		lpTimeFmtEnumProcEx: TIMEFMT_ENUMPROCEX,
		lpLocaleName: PWSTR,
		dwFlags: u32,
		lParam: LPARAM,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumtimeformatsw ]]
	EnumTimeFormatsW :: proc(lpTimeFmtEnumProc: TIMEFMT_ENUMPROCW, Locale: u32, dwFlags: TIME_FORMAT_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumuilanguagesa ]]
	EnumUILanguagesA :: proc(lpUILanguageEnumProc: UILANGUAGE_ENUMPROCA, dwFlags: u32, lParam: int) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-enumuilanguagesw ]]
	EnumUILanguagesW :: proc(lpUILanguageEnumProc: UILANGUAGE_ENUMPROCW, dwFlags: u32, lParam: int) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-findnlsstring ]]
	FindNLSString :: proc(
		Locale: u32,
		dwFindNLSStringFlags: u32,
		lpStringSource: PWSTR,
		cchSource: i32,
		lpStringValue: PWSTR,
		cchValue: i32,
		pcchFound: ^i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-findnlsstringex ]]
	FindNLSStringEx :: proc(
		lpLocaleName: PWSTR,
		dwFindNLSStringFlags: u32,
		lpStringSource: PWSTR,
		cchSource: i32,
		lpStringValue: PWSTR,
		cchValue: i32,
		pcchFound: ^i32,
		lpVersionInformation: ^NLSVERSIONINFO,
		lpReserved: rawptr,
		sortHandle: LPARAM,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/libloaderapi/nf-libloaderapi-findstringordinal ]]
	FindStringOrdinal :: proc(
		dwFindStringOrdinalFlags: u32,
		lpStringSource: PWSTR,
		cchSource: i32,
		lpStringValue: PWSTR,
		cchValue: i32,
		bIgnoreCase: BOOL,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-foldstringa ]]
	FoldStringA :: proc(
		dwMapFlags: FOLD_STRING_MAP_FLAGS,
		lpSrcStr: PSTR,
		cchSrc: i32,
		lpDestStr: PSTR,
		cchDest: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-foldstringw ]]
	FoldStringW :: proc(
		dwMapFlags: FOLD_STRING_MAP_FLAGS,
		lpSrcStr: PWSTR,
		cchSrc: i32,
		lpDestStr: PWSTR,
		cchDest: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getacp ]]
	GetACP :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/getcalendardateformatex ]]
	GetCalendarDateFormatEx :: proc(
		lpszLocale: PWSTR,
		dwFlags: u32,
		#by_ptr lpCalDateTime: CALDATETIME,
		lpFormat: PWSTR,
		lpDateStr: PWSTR,
		cchDate: i32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcalendarinfoa ]]
	GetCalendarInfoA :: proc(Locale: u32, Calendar: u32, CalType: u32, lpCalData: PSTR, cchData: i32, lpValue: ^u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcalendarinfoex ]]
	GetCalendarInfoEx :: proc(
		lpLocaleName: PWSTR,
		Calendar: u32,
		lpReserved: PWSTR,
		CalType: u32,
		lpCalData: PWSTR,
		cchData: i32,
		lpValue: ^u32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcalendarinfow ]]
	GetCalendarInfoW :: proc(Locale: u32, Calendar: u32, CalType: u32, lpCalData: PWSTR, cchData: i32, lpValue: ^u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/getcalendarsupporteddaterange ]]
	GetCalendarSupportedDateRange :: proc(Calendar: u32, lpCalMinDateTime: ^CALDATETIME, lpCalMaxDateTime: ^CALDATETIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcpinfo ]]
	GetCPInfo :: proc(CodePage: u32, lpCPInfo: ^CPINFO) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcpinfoexa ]]
	GetCPInfoExA :: proc(CodePage: u32, dwFlags: u32, lpCPInfoEx: ^CPINFOEXA) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcpinfoexw ]]
	GetCPInfoExW :: proc(CodePage: u32, dwFlags: u32, lpCPInfoEx: ^CPINFOEXW) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcurrencyformata ]]
	GetCurrencyFormatA :: proc(
		Locale: u32,
		dwFlags: u32,
		lpValue: PSTR,
		lpFormat: ^CURRENCYFMTA,
		lpCurrencyStr: PSTR,
		cchCurrency: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcurrencyformatex ]]
	GetCurrencyFormatEx :: proc(
		lpLocaleName: PWSTR,
		dwFlags: u32,
		lpValue: PWSTR,
		lpFormat: ^CURRENCYFMTW,
		lpCurrencyStr: PWSTR,
		cchCurrency: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getcurrencyformatw ]]
	GetCurrencyFormatW :: proc(
		Locale: u32,
		dwFlags: u32,
		lpValue: PWSTR,
		lpFormat: ^CURRENCYFMTW,
		lpCurrencyStr: PWSTR,
		cchCurrency: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/datetimeapi/nf-datetimeapi-getdateformata ]]
	GetDateFormatA :: proc(
		Locale: u32,
		dwFlags: u32,
		lpDate: ^SYSTEMTIME,
		lpFormat: PSTR,
		lpDateStr: PSTR,
		cchDate: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/datetimeapi/nf-datetimeapi-getdateformatex ]]
	GetDateFormatEx :: proc(
		lpLocaleName: PWSTR,
		dwFlags: ENUM_DATE_FORMATS_FLAGS,
		lpDate: ^SYSTEMTIME,
		lpFormat: PWSTR,
		lpDateStr: PWSTR,
		cchDate: i32,
		lpCalendar: PWSTR,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/datetimeapi/nf-datetimeapi-getdateformatw ]]
	GetDateFormatW :: proc(
		Locale: u32,
		dwFlags: u32,
		lpDate: ^SYSTEMTIME,
		lpFormat: PWSTR,
		lpDateStr: PWSTR,
		cchDate: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getdurationformat ]]
	GetDurationFormat :: proc(
		Locale: u32,
		dwFlags: u32,
		lpDuration: ^SYSTEMTIME,
		ullDuration: u64,
		lpFormat: PWSTR,
		lpDurationStr: PWSTR,
		cchDuration: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getdurationformatex ]]
	GetDurationFormatEx :: proc(
		lpLocaleName: PWSTR,
		dwFlags: u32,
		lpDuration: ^SYSTEMTIME,
		ullDuration: u64,
		lpFormat: PWSTR,
		lpDurationStr: PWSTR,
		cchDuration: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getfilemuiinfo ]]
	GetFileMUIInfo :: proc(
		dwFlags: u32,
		pcwszFilePath: PWSTR,
		pFileMUIInfo: ^FILEMUIINFO,
		pcbFileMUIInfo: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getfilemuipath ]]
	GetFileMUIPath :: proc(
		dwFlags: u32,
		pcwszFilePath: PWSTR,
		pwszLanguage: PWSTR,
		pcchLanguage: ^u32,
		pwszFileMUIPath: PWSTR,
		pcchFileMUIPath: ^u32,
		pululEnumerator: ^u64,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getgeoinfoa ]]
	GetGeoInfoA :: proc(Location: i32, GeoType: SYSGEOTYPE, lpGeoData: PSTR, cchData: i32, LangId: u16) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getgeoinfoex ]]
	GetGeoInfoEx :: proc(location: PWSTR, geoType: SYSGEOTYPE, geoData: PWSTR, geoDataCount: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getgeoinfow ]]
	GetGeoInfoW :: proc(Location: i32, GeoType: SYSGEOTYPE, lpGeoData: PWSTR, cchData: i32, LangId: u16) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getlocaleinfoa ]]
	GetLocaleInfoA :: proc(Locale: u32, LCType: u32, lpLCData: PSTR, cchData: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getlocaleinfoex ]]
	GetLocaleInfoEx :: proc(lpLocaleName: PWSTR, LCType: u32, lpLCData: PWSTR, cchData: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getlocaleinfow ]]
	GetLocaleInfoW :: proc(Locale: u32, LCType: u32, lpLCData: PWSTR, cchData: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getnlsversion ]]
	GetNLSVersion :: proc(Function: u32, Locale: u32, lpVersionInformation: ^NLSVERSIONINFO) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getnlsversionex ]]
	GetNLSVersionEx :: proc(function: u32, lpLocaleName: PWSTR, lpVersionInformation: ^NLSVERSIONINFOEX) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getnumberformata ]]
	GetNumberFormatA :: proc(
		Locale: u32,
		dwFlags: u32,
		lpValue: PSTR,
		lpFormat: ^NUMBERFMTA,
		lpNumberStr: PSTR,
		cchNumber: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getnumberformatex ]]
	GetNumberFormatEx :: proc(
		lpLocaleName: PWSTR,
		dwFlags: u32,
		lpValue: PWSTR,
		lpFormat: ^NUMBERFMTW,
		lpNumberStr: PWSTR,
		cchNumber: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getnumberformatw ]]
	GetNumberFormatW :: proc(
		Locale: u32,
		dwFlags: u32,
		lpValue: PWSTR,
		lpFormat: ^NUMBERFMTW,
		lpNumberStr: PWSTR,
		cchNumber: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getoemcp ]]
	GetOEMCP :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getprocesspreferreduilanguages ]]
	GetProcessPreferredUILanguages :: proc(
		dwFlags: u32,
		pulNumLanguages: ^u32,
		pwszLanguagesBuffer: PWSTR,
		pcchLanguagesBuffer: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getstringscripts ]]
	GetStringScripts :: proc(dwFlags: u32, lpString: PWSTR, cchString: i32, lpScripts: PWSTR, cchScripts: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getstringtypea ]]
	GetStringTypeA :: proc(Locale: u32, dwInfoType: u32, lpSrcStr: PSTR, cchSrc: i32, lpCharType: ^u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-getstringtypeexw ]]
	GetStringTypeExA :: proc(Locale: u32, dwInfoType: u32, lpSrcStr: PSTR, cchSrc: i32, lpCharType: [^]u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-getstringtypeexw ]]
	GetStringTypeExW :: proc(Locale: u32, dwInfoType: u32, lpSrcStr: PWSTR, cchSrc: i32, lpCharType: [^]u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-getstringtypew ]]
	GetStringTypeW :: proc(dwInfoType: u32, lpSrcStr: PWSTR, cchSrc: i32, lpCharType: ^u16) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getsystemdefaultlangid ]]
	GetSystemDefaultLangID :: proc() -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getsystemdefaultlcid ]]
	GetSystemDefaultLCID :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getsystemdefaultlocalename ]]
	GetSystemDefaultLocaleName :: proc(lpLocaleName: PWSTR, cchLocaleName: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getsystemdefaultuilanguage ]]
	GetSystemDefaultUILanguage :: proc() -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getsystempreferreduilanguages ]]
	GetSystemPreferredUILanguages :: proc(
		dwFlags: u32,
		pulNumLanguages: ^u32,
		pwszLanguagesBuffer: PWSTR,
		pcchLanguagesBuffer: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getthreadlocale ]]
	GetThreadLocale :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getthreadpreferreduilanguages ]]
	GetThreadPreferredUILanguages :: proc(
		dwFlags: u32,
		pulNumLanguages: ^u32,
		pwszLanguagesBuffer: PWSTR,
		pcchLanguagesBuffer: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getthreaduilanguage ]]
	GetThreadUILanguage :: proc() -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/datetimeapi/nf-datetimeapi-gettimeformata ]]
	GetTimeFormatA :: proc(
		Locale: u32,
		dwFlags: u32,
		lpTime: ^SYSTEMTIME,
		lpFormat: PSTR,
		lpTimeStr: PSTR,
		cchTime: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/datetimeapi/nf-datetimeapi-gettimeformatex ]]
	GetTimeFormatEx :: proc(
		lpLocaleName: PWSTR,
		dwFlags: TIME_FORMAT_FLAGS,
		lpTime: ^SYSTEMTIME,
		lpFormat: PWSTR,
		lpTimeStr: PWSTR,
		cchTime: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/datetimeapi/nf-datetimeapi-gettimeformatw ]]
	GetTimeFormatW :: proc(
		Locale: u32,
		dwFlags: u32,
		lpTime: ^SYSTEMTIME,
		lpFormat: PWSTR,
		lpTimeStr: PWSTR,
		cchTime: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getuilanguageinfo ]]
	GetUILanguageInfo :: proc(
		dwFlags: u32,
		pwmszLanguage: PWSTR,
		pwszFallbackLanguages: PWSTR,
		pcchFallbackLanguages: ^u32,
		pAttributes: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getuserdefaultgeoname ]]
	GetUserDefaultGeoName :: proc(geoName: PWSTR, geoNameCount: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getuserdefaultlangid ]]
	GetUserDefaultLangID :: proc() -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getuserdefaultlcid ]]
	GetUserDefaultLCID :: proc() -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getuserdefaultlocalename ]]
	GetUserDefaultLocaleName :: proc(lpLocaleName: PWSTR, cchLocaleName: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getuserdefaultuilanguage ]]
	GetUserDefaultUILanguage :: proc() -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getusergeoid ]]
	GetUserGeoID :: proc(GeoClass: SYSGEOCLASS) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-getuserpreferreduilanguages ]]
	GetUserPreferredUILanguages :: proc(
		dwFlags: u32,
		pulNumLanguages: ^u32,
		pwszLanguagesBuffer: PWSTR,
		pcchLanguagesBuffer: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-idntonameprepunicode ]]
	IdnToNameprepUnicode :: proc(
		dwFlags: u32,
		lpUnicodeCharStr: PWSTR,
		cchUnicodeChar: i32,
		lpNameprepCharStr: PWSTR,
		cchNameprepChar: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/iscalendarleapyear ]]
	IsCalendarLeapYear :: proc(calId: u32, year: u32, era: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isdbcsleadbyte ]]
	IsDBCSLeadByte :: proc(TestChar: u8) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isdbcsleadbyteex ]]
	IsDBCSLeadByteEx :: proc(CodePage: u32, TestChar: u8) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isnlsdefinedstring ]]
	IsNLSDefinedString :: proc(
		Function: u32,
		dwFlags: u32,
		lpVersionInformation: ^NLSVERSIONINFO,
		lpString: PWSTR,
		cchStr: i32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isnormalizedstring ]]
	IsNormalizedString :: proc(NormForm: NORM_FORM, lpString: PWSTR, cwLength: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isvalidcodepage ]]
	IsValidCodePage :: proc(CodePage: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isvalidlanguagegroup ]]
	IsValidLanguageGroup :: proc(LanguageGroup: u32, dwFlags: ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isvalidlocale ]]
	IsValidLocale :: proc(Locale: u32, dwFlags: IS_VALID_LOCALE_FLAGS) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isvalidlocalename ]]
	IsValidLocaleName :: proc(lpLocaleName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-isvalidnlsversion ]]
	IsValidNLSVersion :: proc(function: u32, lpLocaleName: PWSTR, lpVersionInformation: ^NLSVERSIONINFOEX) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-lcidtolocalename ]]
	LCIDToLocaleName :: proc(Locale: u32, lpName: PWSTR, cchName: i32, dwFlags: u32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-lcmapstringa ]]
	LCMapStringA :: proc(Locale: u32, dwMapFlags: u32, lpSrcStr: PSTR, cchSrc: i32, lpDestStr: PSTR, cchDest: i32) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-lcmapstringex ]]
	LCMapStringEx :: proc(
		lpLocaleName: PWSTR,
		dwMapFlags: u32,
		lpSrcStr: PWSTR,
		cchSrc: i32,
		lpDestStr: PWSTR,
		cchDest: i32,
		lpVersionInformation: ^NLSVERSIONINFO,
		lpReserved: rawptr,
		sortHandle: LPARAM,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-lcmapstringw ]]
	LCMapStringW :: proc(
		Locale: u32,
		dwMapFlags: u32,
		lpSrcStr: PWSTR,
		cchSrc: i32,
		lpDestStr: PWSTR,
		cchDest: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-localenametolcid ]]
	LocaleNameToLCID :: proc(lpName: PWSTR, dwFlags: u32) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcata ]]
	lstrcatA :: proc(lpString1: PSTR, lpString2: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcatw ]]
	lstrcatW :: proc(lpString1: PWSTR, lpString2: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcmpa ]]
	lstrcmpA :: proc(lpString1: PSTR, lpString2: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcmpia ]]
	lstrcmpiA :: proc(lpString1: PSTR, lpString2: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcmpiw ]]
	lstrcmpiW :: proc(lpString1: PWSTR, lpString2: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcmpw ]]
	lstrcmpW :: proc(lpString1: PWSTR, lpString2: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcpya ]]
	lstrcpyA :: proc(lpString1: PSTR, lpString2: PSTR) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcpyna ]]
	lstrcpynA :: proc(lpString1: PSTR, lpString2: PSTR, iMaxLength: i32) -> PSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcpynw ]]
	lstrcpynW :: proc(lpString1: PWSTR, lpString2: PWSTR, iMaxLength: i32) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrcpyw ]]
	lstrcpyW :: proc(lpString1: PWSTR, lpString2: PWSTR) -> PWSTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrlena ]]
	lstrlenA :: proc(lpString: PSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lstrlenw ]]
	lstrlenW :: proc(lpString: PWSTR) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-multibytetowidechar ]]
	MultiByteToWideChar :: proc(
		CodePage: u32,
		dwFlags: MULTI_BYTE_TO_WIDE_CHAR_FLAGS,
		lpMultiByteStr: PSTR,
		cbMultiByte: i32,
		lpWideCharStr: PWSTR,
		cchWideChar: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-normalizestring ]]
	NormalizeString :: proc(
		NormForm: NORM_FORM,
		lpSrcString: PWSTR,
		cwSrcLength: i32,
		lpDstString: PWSTR,
		cwDstLength: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-notifyuilanguagechange ]]
	NotifyUILanguageChange :: proc(
		dwFlags: u32,
		pcwstrNewLanguage: PWSTR,
		pcwstrPreviousLanguage: PWSTR,
		dwReserved: u32,
		pdwStatusRtrn: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-resolvelocalename ]]
	ResolveLocaleName :: proc(lpNameToResolve: PWSTR, lpLocaleName: PWSTR, cchLocaleName: i32) -> i32 ---

	RestoreThreadPreferredUILanguages :: proc(snapshot: HSAVEDUILANGUAGES) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setcalendarinfoa ]]
	SetCalendarInfoA :: proc(Locale: u32, Calendar: u32, CalType: u32, lpCalData: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setcalendarinfow ]]
	SetCalendarInfoW :: proc(Locale: u32, Calendar: u32, CalType: u32, lpCalData: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setlocaleinfoa ]]
	SetLocaleInfoA :: proc(Locale: u32, LCType: u32, lpLCData: PSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setlocaleinfow ]]
	SetLocaleInfoW :: proc(Locale: u32, LCType: u32, lpLCData: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setprocesspreferreduilanguages ]]
	SetProcessPreferredUILanguages :: proc(dwFlags: u32, pwszLanguagesBuffer: PWSTR, pulNumLanguages: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setthreadlocale ]]
	SetThreadLocale :: proc(Locale: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setthreadpreferreduilanguages ]]
	SetThreadPreferredUILanguages :: proc(dwFlags: u32, pwszLanguagesBuffer: PWSTR, pulNumLanguages: ^u32) -> BOOL ---

	SetThreadPreferredUILanguages2 :: proc(flags: u32, languages: PWSTR, numLanguagesSet: ^u32, snapshot: ^HSAVEDUILANGUAGES) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setthreaduilanguage ]]
	SetThreadUILanguage :: proc(LangId: u16) -> u16 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setusergeoid ]]
	SetUserGeoID :: proc(GeoId: i32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-setusergeoname ]]
	SetUserGeoName :: proc(geoName: PWSTR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/updatecalendardayofweek ]]
	UpdateCalendarDayOfWeek :: proc(lpCalDateTime: ^CALDATETIME) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-verifyscripts ]]
	VerifyScripts :: proc(
		dwFlags: u32,
		lpLocaleScripts: PWSTR,
		cchLocaleScripts: i32,
		lpTestScripts: PWSTR,
		cchTestScripts: i32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/stringapiset/nf-stringapiset-widechartomultibyte ]]
	WideCharToMultiByte :: proc(
		CodePage: u32,
		dwFlags: u32,
		lpWideCharStr: PWSTR,
		cchWideChar: i32,
		lpMultiByteStr: PSTR,
		cbMultiByte: i32,
		lpDefaultChar: PSTR,
		lpUsedDefaultChar: ^BOOL,
	) -> i32 ---
}

@(default_calling_convention="system")
foreign normaliz {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-idntoascii ]]
	IdnToAscii :: proc(
		dwFlags: u32,
		lpUnicodeCharStr: PWSTR,
		cchUnicodeChar: i32,
		lpASCIICharStr: PWSTR,
		cchASCIIChar: i32,
	) -> i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/nf-winnls-idntounicode ]]
	IdnToUnicode :: proc(
		dwFlags: u32,
		lpASCIICharStr: PWSTR,
		cchASCIIChar: i32,
		lpUnicodeCharStr: PWSTR,
		cchUnicodeChar: i32,
	) -> i32 ---
}

@(default_calling_convention="system")
foreign usp10 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptapplydigitsubstitution ]]
	ScriptApplyDigitSubstitution :: proc(
		#by_ptr psds: SCRIPT_DIGITSUBSTITUTE,
		psc: ^SCRIPT_CONTROL,
		pss: ^SCRIPT_STATE,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptapplylogicalwidth ]]
	ScriptApplyLogicalWidth :: proc(
		piDx: [^]i32,
		cChars: i32,
		cGlyphs: i32,
		pwLogClust: [^]u16,
		psva: [^]SCRIPT_VISATTR,
		piAdvance: [^]i32,
		#by_ptr psa: SCRIPT_ANALYSIS,
		pABC: ^ABC,
		piJustify: [^]i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptbreak ]]
	ScriptBreak :: proc(
		pwcChars: PWSTR,
		cChars: i32,
		#by_ptr psa: SCRIPT_ANALYSIS,
		psla: [^]SCRIPT_LOGATTR,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptcachegetheight ]]
	ScriptCacheGetHeight :: proc(hdc: HDC, psc: rawptr, tmHeight: ^i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptcptox ]]
	ScriptCPtoX :: proc(
		iCP: i32,
		fTrailing: BOOL,
		cChars: i32,
		cGlyphs: i32,
		pwLogClust: [^]u16,
		psva: [^]SCRIPT_VISATTR,
		piAdvance: [^]i32,
		#by_ptr psa: SCRIPT_ANALYSIS,
		piX: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptfreecache ]]
	ScriptFreeCache :: proc(psc: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetcmap ]]
	ScriptGetCMap :: proc(
		hdc: HDC,
		psc: rawptr,
		pwcInChars: PWSTR,
		cChars: i32,
		dwFlags: u32,
		pwOutGlyphs: [^]u16,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetfontalternateglyphs ]]
	ScriptGetFontAlternateGlyphs :: proc(
		hdc: HDC,
		psc: rawptr,
		psa: ^SCRIPT_ANALYSIS,
		tagScript: u32,
		tagLangSys: u32,
		tagFeature: u32,
		wGlyphId: u16,
		cMaxAlternates: i32,
		pAlternateGlyphs: [^]u16,
		pcAlternates: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetfontfeaturetags ]]
	ScriptGetFontFeatureTags :: proc(
		hdc: HDC,
		psc: rawptr,
		psa: ^SCRIPT_ANALYSIS,
		tagScript: u32,
		tagLangSys: u32,
		cMaxTags: i32,
		pFeatureTags: [^]u32,
		pcTags: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetfontlanguagetags ]]
	ScriptGetFontLanguageTags :: proc(
		hdc: HDC,
		psc: rawptr,
		psa: ^SCRIPT_ANALYSIS,
		tagScript: u32,
		cMaxTags: i32,
		pLangsysTags: [^]u32,
		pcTags: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetfontproperties ]]
	ScriptGetFontProperties :: proc(hdc: HDC, psc: rawptr, sfp: ^SCRIPT_FONTPROPERTIES) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetfontscripttags ]]
	ScriptGetFontScriptTags :: proc(
		hdc: HDC,
		psc: rawptr,
		psa: ^SCRIPT_ANALYSIS,
		cMaxTags: i32,
		pScriptTags: [^]u32,
		pcTags: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetglyphabcwidth ]]
	ScriptGetGlyphABCWidth :: proc(hdc: HDC, psc: rawptr, wGlyph: u16, pABC: ^ABC) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetlogicalwidths ]]
	ScriptGetLogicalWidths :: proc(
		#by_ptr psa: SCRIPT_ANALYSIS,
		cChars: i32,
		cGlyphs: i32,
		piGlyphWidth: [^]i32,
		pwLogClust: [^]u16,
		psva: [^]SCRIPT_VISATTR,
		piDx: [^]i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptgetproperties ]]
	ScriptGetProperties :: proc(#by_ptr ppSp: SCRIPT_PROPERTIES, piNumScripts: ^i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptiscomplex ]]
	ScriptIsComplex :: proc(pwcInChars: PWSTR, cInChars: i32, dwFlags: SCRIPT_IS_COMPLEX_FLAGS) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptitemize ]]
	ScriptItemize :: proc(
		pwcInChars: PWSTR,
		cInChars: i32,
		cMaxItems: i32,
		psControl: ^SCRIPT_CONTROL,
		psState: ^SCRIPT_STATE,
		pItems: [^]SCRIPT_ITEM,
		pcItems: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptitemizeopentype ]]
	ScriptItemizeOpenType :: proc(
		pwcInChars: PWSTR,
		cInChars: i32,
		cMaxItems: i32,
		psControl: ^SCRIPT_CONTROL,
		psState: ^SCRIPT_STATE,
		pItems: [^]SCRIPT_ITEM,
		pScriptTags: [^]u32,
		pcItems: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptjustify ]]
	ScriptJustify :: proc(
		psva: [^]SCRIPT_VISATTR,
		piAdvance: [^]i32,
		cGlyphs: i32,
		iDx: i32,
		iMinKashida: i32,
		piJustify: [^]i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptlayout ]]
	ScriptLayout :: proc(
		cRuns: i32,
		pbLevel: [^]u8,
		piVisualToLogical: [^]i32,
		piLogicalToVisual: [^]i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptplace ]]
	ScriptPlace :: proc(
		hdc: HDC,
		psc: rawptr,
		pwGlyphs: [^]u16,
		cGlyphs: i32,
		psva: [^]SCRIPT_VISATTR,
		psa: ^SCRIPT_ANALYSIS,
		piAdvance: [^]i32,
		pGoffset: [^]GOFFSET,
		pABC: ^ABC,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptplaceopentype ]]
	ScriptPlaceOpenType :: proc(
		hdc: HDC,
		psc: rawptr,
		psa: ^SCRIPT_ANALYSIS,
		tagScript: u32,
		tagLangSys: u32,
		rcRangeChars: [^]i32,
		rpRangeProperties: [^]TEXTRANGE_PROPERTIES,
		cRanges: i32,
		pwcChars: PWSTR,
		pwLogClust: [^]u16,
		pCharProps: [^]SCRIPT_CHARPROP,
		cChars: i32,
		pwGlyphs: [^]u16,
		pGlyphProps: [^]SCRIPT_GLYPHPROP,
		cGlyphs: i32,
		piAdvance: [^]i32,
		pGoffset: [^]GOFFSET,
		pABC: ^ABC,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptpositionsingleglyph ]]
	ScriptPositionSingleGlyph :: proc(
		hdc: HDC,
		psc: rawptr,
		psa: ^SCRIPT_ANALYSIS,
		tagScript: u32,
		tagLangSys: u32,
		tagFeature: u32,
		lParameter: i32,
		wGlyphId: u16,
		iAdvance: i32,
		GOffset: GOFFSET,
		piOutAdvance: ^i32,
		pOutGoffset: ^GOFFSET,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptrecorddigitsubstitution ]]
	ScriptRecordDigitSubstitution :: proc(Locale: u32, psds: ^SCRIPT_DIGITSUBSTITUTE) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptshape ]]
	ScriptShape :: proc(
		hdc: HDC,
		psc: rawptr,
		pwcChars: PWSTR,
		cChars: i32,
		cMaxGlyphs: i32,
		psa: ^SCRIPT_ANALYSIS,
		pwOutGlyphs: [^]u16,
		pwLogClust: [^]u16,
		psva: [^]SCRIPT_VISATTR,
		pcGlyphs: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptshapeopentype ]]
	ScriptShapeOpenType :: proc(
		hdc: HDC,
		psc: rawptr,
		psa: ^SCRIPT_ANALYSIS,
		tagScript: u32,
		tagLangSys: u32,
		rcRangeChars: [^]i32,
		rpRangeProperties: [^]TEXTRANGE_PROPERTIES,
		cRanges: i32,
		pwcChars: PWSTR,
		cChars: i32,
		cMaxGlyphs: i32,
		pwLogClust: [^]u16,
		pCharProps: [^]SCRIPT_CHARPROP,
		pwOutGlyphs: [^]u16,
		pOutGlyphProps: [^]SCRIPT_GLYPHPROP,
		pcGlyphs: ^i32,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstring_pcoutchars ]]
	ScriptString_pcOutChars :: proc(ssa: rawptr) -> ^i32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstring_plogattr ]]
	ScriptString_pLogAttr :: proc(ssa: rawptr) -> ^SCRIPT_LOGATTR ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstring_psize ]]
	ScriptString_pSize :: proc(ssa: rawptr) -> ^SIZE ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstringanalyse ]]
	ScriptStringAnalyse :: proc(
		hdc: HDC,
		pString: rawptr,
		cString: i32,
		cGlyphs: i32,
		iCharset: i32,
		dwFlags: u32,
		iReqWidth: i32,
		psControl: ^SCRIPT_CONTROL,
		psState: ^SCRIPT_STATE,
		piDx: ^i32,
		pTabdef: ^SCRIPT_TABDEF,
		pbInClass: ^u8,
		pssa: rawptr,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstringcptox ]]
	ScriptStringCPtoX :: proc(ssa: rawptr, icp: i32, fTrailing: BOOL, pX: ^i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstringfree ]]
	ScriptStringFree :: proc(pssa: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstringgetlogicalwidths ]]
	ScriptStringGetLogicalWidths :: proc(ssa: rawptr, piDx: ^i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstringgetorder ]]
	ScriptStringGetOrder :: proc(ssa: rawptr, puOrder: ^u32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstringout ]]
	ScriptStringOut :: proc(
		ssa: rawptr,
		iX: i32,
		iY: i32,
		uOptions: ETO_OPTIONS,
		prc: ^RECT,
		iMinSel: i32,
		iMaxSel: i32,
		fDisabled: BOOL,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstringvalidate ]]
	ScriptStringValidate :: proc(ssa: rawptr) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptstringxtocp ]]
	ScriptStringXtoCP :: proc(ssa: rawptr, iX: i32, piCh: ^i32, piTrailing: ^i32) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptsubstitutesingleglyph ]]
	ScriptSubstituteSingleGlyph :: proc(
		hdc: HDC,
		psc: rawptr,
		psa: ^SCRIPT_ANALYSIS,
		tagScript: u32,
		tagLangSys: u32,
		tagFeature: u32,
		lParameter: i32,
		wGlyphId: u16,
		pwOutGlyphId: ^u16,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scripttextout ]]
	ScriptTextOut :: proc(
		hdc: HDC,
		psc: rawptr,
		x: i32,
		y: i32,
		fuOptions: u32,
		lprc: ^RECT,
		#by_ptr psa: SCRIPT_ANALYSIS,
		pwcReserved: PWSTR,
		iReserved: i32,
		pwGlyphs: [^]u16,
		cGlyphs: i32,
		piAdvance: [^]i32,
		piJustify: [^]i32,
		pGoffset: [^]GOFFSET,
	) -> HRESULT ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/nf-usp10-scriptxtocp ]]
	ScriptXtoCP :: proc(
		iX: i32,
		cChars: i32,
		cGlyphs: i32,
		pwLogClust: [^]u16,
		psva: [^]SCRIPT_VISATTR,
		piAdvance: [^]i32,
		#by_ptr psa: SCRIPT_ANALYSIS,
		piCP: ^i32,
		piTrailing: ^i32,
	) -> HRESULT ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/caldatetime ]]
CALDATETIME :: struct {
	CalId: u32,
	Era: u32,
	Year: u32,
	Month: u32,
	Day: u32,
	DayOfWeek: u32,
	Hour: u32,
	Minute: u32,
	Second: u32,
	Tick: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/Intl/caldatetime-dateunit ]]
CALDATETIME_DATEUNIT :: enum i32 {
	EraUnit = 0,
	YearUnit = 1,
	MonthUnit = 2,
	WeekUnit = 3,
	DayUnit = 4,
	HourUnit = 5,
	MinuteUnit = 6,
	SecondUnit = 7,
	TickUnit = 8,
}

CALINFO_ENUMPROCA :: #type proc "system" (param0: PSTR) -> BOOL

CALINFO_ENUMPROCEXA :: #type proc "system" (param0: PSTR, param1: u32) -> BOOL

CALINFO_ENUMPROCEXEX :: #type proc "system" (param0: PWSTR, param1: u32, param2: PWSTR, param3: LPARAM) -> BOOL

CALINFO_ENUMPROCEXW :: #type proc "system" (param0: PWSTR, param1: u32) -> BOOL

CALINFO_ENUMPROCW :: #type proc "system" (param0: PWSTR) -> BOOL

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-charsetinfo ]]
CHARSETINFO :: struct {
	ciCharset: u32,
	ciACP: u32,
	fs: FONTSIGNATURE,
}

CMLangConvertCharset :: struct {
}
IID_CMLangConvertCharset :: GUID{0xD66D6F99, 0xCDAA, 0x11D0, {0xB8, 0x22, 0x00, 0xC0, 0x4F, 0xC9, 0xB3, 0x1F}}

CMLangString :: struct {
}
IID_CMLangString :: GUID{0xC04D65CF, 0xB70D, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

CMultiLanguage :: struct {
}
IID_CMultiLanguage :: GUID{0x275C23E2, 0x3747, 0x11D0, {0x9F, 0xEA, 0x00, 0xAA, 0x00, 0x3F, 0x86, 0x46}}

CODEPAGE_ENUMPROCA :: #type proc "system" (param0: PSTR) -> BOOL

CODEPAGE_ENUMPROCW :: #type proc "system" (param0: PWSTR) -> BOOL

COMPARE_STRING_FLAGS :: distinct bit_set[enum {
	LINGUISTIC_IGNORECASE = 4,
	LINGUISTIC_IGNOREDIACRITIC = 5,
	NORM_IGNORECASE = 0,
	NORM_IGNOREKANATYPE = 16,
	NORM_IGNORENONSPACE = 1,
	NORM_IGNORESYMBOLS = 2,
	NORM_IGNOREWIDTH = 17,
	NORM_LINGUISTIC_CASING = 27,
	SORT_DIGITSASNUMBERS = 3,
	SORT_STRINGSORT = 12,
}; u32]

COMPARESTRING_RESULT :: enum i32 {
	LESS_THAN = 1,
	EQUAL = 2,
	GREATER_THAN = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/ne-spellcheck-corrective_action ]]
CORRECTIVE_ACTION :: enum i32 {
	NONE = 0,
	GET_SUGGESTIONS = 1,
	REPLACE = 2,
	DELETE = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-cpinfo ]]
CPINFO :: struct {
	MaxCharSize: u32,
	DefaultChar: [2]u8,
	LeadByte: [12]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-cpinfoexa ]]
CPINFOEXA :: struct {
	MaxCharSize: u32,
	DefaultChar: [2]u8,
	LeadByte: [12]u8,
	UnicodeDefaultChar: u16,
	CodePage: u32,
	CodePageName: [260]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-cpinfoexw ]]
CPINFOEXW :: struct {
	MaxCharSize: u32,
	DefaultChar: [2]u8,
	LeadByte: [12]u8,
	UnicodeDefaultChar: u16,
	CodePage: u32,
	CodePageName: [260]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-currencyfmta ]]
CURRENCYFMTA :: struct {
	NumDigits: u32,
	LeadingZero: u32,
	Grouping: u32,
	lpDecimalSep: PSTR,
	lpThousandSep: PSTR,
	NegativeOrder: u32,
	PositiveOrder: u32,
	lpCurrencySymbol: PSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-currencyfmtw ]]
CURRENCYFMTW :: struct {
	NumDigits: u32,
	LeadingZero: u32,
	Grouping: u32,
	lpDecimalSep: PWSTR,
	lpThousandSep: PWSTR,
	NegativeOrder: u32,
	PositiveOrder: u32,
	lpCurrencySymbol: PWSTR,
}

DATEFMT_ENUMPROCA :: #type proc "system" (param0: PSTR) -> BOOL

DATEFMT_ENUMPROCEXA :: #type proc "system" (param0: PSTR, param1: u32) -> BOOL

DATEFMT_ENUMPROCEXEX :: #type proc "system" (param0: PWSTR, param1: u32, param2: LPARAM) -> BOOL

DATEFMT_ENUMPROCEXW :: #type proc "system" (param0: PWSTR, param1: u32) -> BOOL

DATEFMT_ENUMPROCW :: #type proc "system" (param0: PWSTR) -> BOOL

DetectEncodingInfo :: struct {
	nLangID: u32,
	nCodePage: u32,
	nDocPercent: i32,
	nConfidence: i32,
}

ENUM_DATE_FORMATS_FLAGS :: enum u32 {
	SHORTDATE = 0x00000001,
	LONGDATE = 0x00000002,
	YEARMONTH = 0x00000008,
	MONTHDAY = 0x00000080,
	AUTOLAYOUT = 0x00000040,
	LTRREADING = 0x00000010,
	RTLREADING = 0x00000020,
	USE_ALT_CALENDAR = 0x00000004,
}

ENUM_SYSTEM_CODE_PAGES_FLAGS :: enum u32 {
	INSTALLED = 0x00000001,
	SUPPORTED = 0x00000002,
}

ENUM_SYSTEM_LANGUAGE_GROUPS_FLAGS :: enum u32 {
	INSTALLED = 0x00000001,
	SUPPORTED = 0x00000002,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumtextmetrica ]]
ENUMTEXTMETRICA :: struct {
	etmNewTextMetricEx: NEWTEXTMETRICEXA,
	etmAxesList: AXESLISTA,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumtextmetricw ]]
ENUMTEXTMETRICW :: struct {
	etmNewTextMetricEx: NEWTEXTMETRICEXW,
	etmAxesList: AXESLISTW,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-filemuiinfo ]]
FILEMUIINFO :: struct {
	dwSize: u32,
	dwVersion: u32,
	dwFileType: u32,
	pChecksum: [16]u8,
	pServiceChecksum: [16]u8,
	dwLanguageNameOffset: u32,
	dwTypeIDMainSize: u32,
	dwTypeIDMainOffset: u32,
	dwTypeNameMainOffset: u32,
	dwTypeIDMUISize: u32,
	dwTypeIDMUIOffset: u32,
	dwTypeNameMUIOffset: u32,
	abBuffer: [8]u8,
}

FOLD_STRING_MAP_FLAGS :: distinct bit_set[enum {
	COMPOSITE = 6,
	EXPAND_LIGATURES = 13,
	FOLDCZONE = 4,
	FOLDDIGITS = 7,
	PRECOMPOSED = 5,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-fontsignature ]]
FONTSIGNATURE :: struct {
	fsUsb: [4]u32,
	fsCsb: [2]u32,
}

GEO_ENUMNAMEPROC :: #type proc "system" (param0: PWSTR, param1: LPARAM) -> BOOL

GEO_ENUMPROC :: #type proc "system" (param0: i32) -> BOOL

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-goffset ]]
GOFFSET :: struct {
	du: i32,
	dv: i32,
}

HSAVEDUILANGUAGES :: rawptr

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nn-spellcheckprovider-icomprehensivespellcheckprovider ]]
IComprehensiveSpellCheckProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IComprehensiveSpellCheckProvider_Vtbl,
}
IComprehensiveSpellCheckProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	ComprehensiveCheck: proc "system" (
		this: ^IComprehensiveSpellCheckProvider,
		text: PWSTR,
		value: ^^IEnumSpellingError,
	) -> HRESULT,
}
IID_IComprehensiveSpellCheckProvider :: GUID{0x0C58F8DE, 0x8E94, 0x479E, {0x97, 0x17, 0x70, 0xC4, 0x2C, 0x4A, 0xD2, 0xC3}}

IEnumCodePage :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumCodePage_Vtbl,
}
IEnumCodePage_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Clone: proc "system" (this: ^IEnumCodePage, ppEnum: ^^IEnumCodePage) -> HRESULT,
	Next: proc "system" (this: ^IEnumCodePage, celt: u32, rgelt: ^MIMECPINFO, pceltFetched: ^u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumCodePage) -> HRESULT,
	Skip: proc "system" (this: ^IEnumCodePage, celt: u32) -> HRESULT,
}
IID_IEnumCodePage :: GUID{0x275C23E3, 0x3747, 0x11D0, {0x9F, 0xEA, 0x00, 0xAA, 0x00, 0x3F, 0x86, 0x46}}

IEnumRfc1766 :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumRfc1766_Vtbl,
}
IEnumRfc1766_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Clone: proc "system" (this: ^IEnumRfc1766, ppEnum: ^^IEnumRfc1766) -> HRESULT,
	Next: proc "system" (this: ^IEnumRfc1766, celt: u32, rgelt: ^RFC1766INFO, pceltFetched: ^u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumRfc1766) -> HRESULT,
	Skip: proc "system" (this: ^IEnumRfc1766, celt: u32) -> HRESULT,
}
IID_IEnumRfc1766 :: GUID{0x3DC39D1D, 0xC030, 0x11D0, {0xB8, 0x1B, 0x00, 0xC0, 0x4F, 0xC9, 0xB3, 0x1F}}

IEnumScript :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumScript_Vtbl,
}
IEnumScript_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Clone: proc "system" (this: ^IEnumScript, ppEnum: ^^IEnumScript) -> HRESULT,
	Next: proc "system" (this: ^IEnumScript, celt: u32, rgelt: ^SCRIPTINFO, pceltFetched: ^u32) -> HRESULT,
	Reset: proc "system" (this: ^IEnumScript) -> HRESULT,
	Skip: proc "system" (this: ^IEnumScript, celt: u32) -> HRESULT,
}
IID_IEnumScript :: GUID{0xAE5F1430, 0x388B, 0x11D2, {0x83, 0x80, 0x00, 0xC0, 0x4F, 0x8F, 0x5D, 0xA1}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ienumspellingerror ]]
IEnumSpellingError :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IEnumSpellingError_Vtbl,
}
IEnumSpellingError_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Next: proc "system" (this: ^IEnumSpellingError, value: ^^ISpellingError) -> HRESULT,
}
IID_IEnumSpellingError :: GUID{0x803E3BD4, 0x2828, 0x4410, {0x82, 0x90, 0x41, 0x8D, 0x1D, 0x73, 0xC7, 0x62}}

IMLangCodePages :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMLangCodePages_Vtbl,
}
IMLangCodePages_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCharCodePages: proc "system" (this: ^IMLangCodePages, chSrc: u16, pdwCodePages: ^u32) -> HRESULT,
	GetStrCodePages: proc "system" (
		this: ^IMLangCodePages,
		pszSrc: PWSTR,
		cchSrc: i32,
		dwPriorityCodePages: u32,
		pdwCodePages: ^u32,
		pcchCodePages: ^i32,
	) -> HRESULT,
	CodePageToCodePages: proc "system" (this: ^IMLangCodePages, uCodePage: u32, pdwCodePages: ^u32) -> HRESULT,
	CodePagesToCodePage: proc "system" (
		this: ^IMLangCodePages,
		dwCodePages: u32,
		uDefaultCodePage: u32,
		puCodePage: ^u32,
	) -> HRESULT,
}
IID_IMLangCodePages :: GUID{0x359F3443, 0xBD4A, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

IMLangConvertCharset :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMLangConvertCharset_Vtbl,
}
IMLangConvertCharset_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Initialize: proc "system" (
		this: ^IMLangConvertCharset,
		uiSrcCodePage: u32,
		uiDstCodePage: u32,
		dwProperty: u32,
	) -> HRESULT,
	GetSourceCodePage: proc "system" (this: ^IMLangConvertCharset, puiSrcCodePage: ^u32) -> HRESULT,
	GetDestinationCodePage: proc "system" (this: ^IMLangConvertCharset, puiDstCodePage: ^u32) -> HRESULT,
	GetProperty: proc "system" (this: ^IMLangConvertCharset, pdwProperty: ^u32) -> HRESULT,
	DoConversion: proc "system" (
		this: ^IMLangConvertCharset,
		pSrcStr: ^u8,
		pcSrcSize: ^u32,
		pDstStr: ^u8,
		pcDstSize: ^u32,
	) -> HRESULT,
	DoConversionToUnicode: proc "system" (
		this: ^IMLangConvertCharset,
		pSrcStr: PSTR,
		pcSrcSize: ^u32,
		pDstStr: PWSTR,
		pcDstSize: ^u32,
	) -> HRESULT,
	DoConversionFromUnicode: proc "system" (
		this: ^IMLangConvertCharset,
		pSrcStr: PWSTR,
		pcSrcSize: ^u32,
		pDstStr: PSTR,
		pcDstSize: ^u32,
	) -> HRESULT,
}
IID_IMLangConvertCharset :: GUID{0xD66D6F98, 0xCDAA, 0x11D0, {0xB8, 0x22, 0x00, 0xC0, 0x4F, 0xC9, 0xB3, 0x1F}}

IMLangFontLink :: struct #raw_union {
	#subtype IMLangCodePages: IMLangCodePages,
	using Vtbl: ^IMLangFontLink_Vtbl,
}
IMLangFontLink_Vtbl :: struct {
	using IMLangCodePages_Vtbl: IMLangCodePages_Vtbl,
	GetFontCodePages: proc "system" (this: ^IMLangFontLink, hDC: HDC, hFont: HFONT, pdwCodePages: ^u32) -> HRESULT,
	MapFont: proc "system" (
		this: ^IMLangFontLink,
		hDC: HDC,
		dwCodePages: u32,
		hSrcFont: HFONT,
		phDestFont: ^HFONT,
	) -> HRESULT,
	ReleaseFont: proc "system" (this: ^IMLangFontLink, hFont: HFONT) -> HRESULT,
	ResetFontMapping: proc "system" (this: ^IMLangFontLink) -> HRESULT,
}
IID_IMLangFontLink :: GUID{0x359F3441, 0xBD4A, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

IMLangFontLink2 :: struct #raw_union {
	#subtype IMLangCodePages: IMLangCodePages,
	using Vtbl: ^IMLangFontLink2_Vtbl,
}
IMLangFontLink2_Vtbl :: struct {
	using IMLangCodePages_Vtbl: IMLangCodePages_Vtbl,
	GetFontCodePages: proc "system" (this: ^IMLangFontLink2, hDC: HDC, hFont: HFONT, pdwCodePages: ^u32) -> HRESULT,
	ReleaseFont: proc "system" (this: ^IMLangFontLink2, hFont: HFONT) -> HRESULT,
	ResetFontMapping: proc "system" (this: ^IMLangFontLink2) -> HRESULT,
	MapFont: proc "system" (this: ^IMLangFontLink2, hDC: HDC, dwCodePages: u32, chSrc: u16, pFont: ^HFONT) -> HRESULT,
	GetFontUnicodeRanges: proc "system" (this: ^IMLangFontLink2, hDC: HDC, puiRanges: ^u32, pUranges: ^UNICODERANGE) -> HRESULT,
	GetScriptFontInfo: proc "system" (
		this: ^IMLangFontLink2,
		sid: u8,
		dwFlags: u32,
		puiFonts: ^u32,
		pScriptFont: ^SCRIPTFONTINFO,
	) -> HRESULT,
	CodePageToScriptID: proc "system" (this: ^IMLangFontLink2, uiCodePage: u32, pSid: ^u8) -> HRESULT,
}
IID_IMLangFontLink2 :: GUID{0xDCCFC162, 0x2B38, 0x11D2, {0xB7, 0xEC, 0x00, 0xC0, 0x4F, 0x8F, 0x5D, 0x9A}}

IMLangLineBreakConsole :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMLangLineBreakConsole_Vtbl,
}
IMLangLineBreakConsole_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	BreakLineML: proc "system" (
		this: ^IMLangLineBreakConsole,
		pSrcMLStr: ^IMLangString,
		lSrcPos: i32,
		lSrcLen: i32,
		cMinColumns: i32,
		cMaxColumns: i32,
		plLineLen: ^i32,
		plSkipLen: ^i32,
	) -> HRESULT,
	BreakLineW: proc "system" (
		this: ^IMLangLineBreakConsole,
		locale: u32,
		pszSrc: PWSTR,
		cchSrc: i32,
		cMaxColumns: i32,
		pcchLine: ^i32,
		pcchSkip: ^i32,
	) -> HRESULT,
	BreakLineA: proc "system" (
		this: ^IMLangLineBreakConsole,
		locale: u32,
		uCodePage: u32,
		pszSrc: PSTR,
		cchSrc: i32,
		cMaxColumns: i32,
		pcchLine: ^i32,
		pcchSkip: ^i32,
	) -> HRESULT,
}
IID_IMLangLineBreakConsole :: GUID{0xF5BE2EE1, 0xBFD7, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

IMLangString :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMLangString_Vtbl,
}
IMLangString_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Sync: proc "system" (this: ^IMLangString, fNoAccess: BOOL) -> HRESULT,
	GetLength: proc "system" (this: ^IMLangString, plLen: ^i32) -> HRESULT,
	SetMLStr: proc "system" (
		this: ^IMLangString,
		lDestPos: i32,
		lDestLen: i32,
		pSrcMLStr: ^IUnknown,
		lSrcPos: i32,
		lSrcLen: i32,
	) -> HRESULT,
	GetMLStr: proc "system" (
		this: ^IMLangString,
		lSrcPos: i32,
		lSrcLen: i32,
		pUnkOuter: ^IUnknown,
		dwClsContext: u32,
		#by_ptr piid: GUID,
		ppDestMLStr: ^^IUnknown,
		plDestPos: ^i32,
		plDestLen: ^i32,
	) -> HRESULT,
}
IID_IMLangString :: GUID{0xC04D65CE, 0xB70D, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

IMLangStringAStr :: struct #raw_union {
	#subtype IMLangString: IMLangString,
	using Vtbl: ^IMLangStringAStr_Vtbl,
}
IMLangStringAStr_Vtbl :: struct {
	using IMLangString_Vtbl: IMLangString_Vtbl,
	SetAStr: proc "system" (
		this: ^IMLangStringAStr,
		lDestPos: i32,
		lDestLen: i32,
		uCodePage: u32,
		pszSrc: PSTR,
		cchSrc: i32,
		pcchActual: ^i32,
		plActualLen: ^i32,
	) -> HRESULT,
	SetStrBufA: proc "system" (
		this: ^IMLangStringAStr,
		lDestPos: i32,
		lDestLen: i32,
		uCodePage: u32,
		pSrcBuf: ^IMLangStringBufA,
		pcchActual: ^i32,
		plActualLen: ^i32,
	) -> HRESULT,
	GetAStr: proc "system" (
		this: ^IMLangStringAStr,
		lSrcPos: i32,
		lSrcLen: i32,
		uCodePageIn: u32,
		puCodePageOut: ^u32,
		pszDest: PSTR,
		cchDest: i32,
		pcchActual: ^i32,
		plActualLen: ^i32,
	) -> HRESULT,
	GetStrBufA: proc "system" (
		this: ^IMLangStringAStr,
		lSrcPos: i32,
		lSrcMaxLen: i32,
		puDestCodePage: ^u32,
		ppDestBuf: ^^IMLangStringBufA,
		plDestLen: ^i32,
	) -> HRESULT,
	LockAStr: proc "system" (
		this: ^IMLangStringAStr,
		lSrcPos: i32,
		lSrcLen: i32,
		lFlags: i32,
		uCodePageIn: u32,
		cchRequest: i32,
		puCodePageOut: ^u32,
		ppszDest: ^PSTR,
		pcchDest: ^i32,
		plDestLen: ^i32,
	) -> HRESULT,
	UnlockAStr: proc "system" (
		this: ^IMLangStringAStr,
		pszSrc: PSTR,
		cchSrc: i32,
		pcchActual: ^i32,
		plActualLen: ^i32,
	) -> HRESULT,
	SetLocale: proc "system" (this: ^IMLangStringAStr, lDestPos: i32, lDestLen: i32, locale: u32) -> HRESULT,
	GetLocale: proc "system" (
		this: ^IMLangStringAStr,
		lSrcPos: i32,
		lSrcMaxLen: i32,
		plocale: ^u32,
		plLocalePos: ^i32,
		plLocaleLen: ^i32,
	) -> HRESULT,
}
IID_IMLangStringAStr :: GUID{0xC04D65D2, 0xB70D, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

IMLangStringBufA :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMLangStringBufA_Vtbl,
}
IMLangStringBufA_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetStatus: proc "system" (this: ^IMLangStringBufA, plFlags: ^i32, pcchBuf: ^i32) -> HRESULT,
	LockBuf: proc "system" (
		this: ^IMLangStringBufA,
		cchOffset: i32,
		cchMaxLock: i32,
		ppszBuf: ^CHAR,
		pcchBuf: ^i32,
	) -> HRESULT,
	UnlockBuf: proc "system" (this: ^IMLangStringBufA, pszBuf: PSTR, cchOffset: i32, cchWrite: i32) -> HRESULT,
	Insert: proc "system" (this: ^IMLangStringBufA, cchOffset: i32, cchMaxInsert: i32, pcchActual: ^i32) -> HRESULT,
	Delete: proc "system" (this: ^IMLangStringBufA, cchOffset: i32, cchDelete: i32) -> HRESULT,
}
IID_IMLangStringBufA :: GUID{0xD24ACD23, 0xBA72, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

IMLangStringBufW :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMLangStringBufW_Vtbl,
}
IMLangStringBufW_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetStatus: proc "system" (this: ^IMLangStringBufW, plFlags: ^i32, pcchBuf: ^i32) -> HRESULT,
	LockBuf: proc "system" (
		this: ^IMLangStringBufW,
		cchOffset: i32,
		cchMaxLock: i32,
		ppszBuf: ^u16,
		pcchBuf: ^i32,
	) -> HRESULT,
	UnlockBuf: proc "system" (this: ^IMLangStringBufW, pszBuf: PWSTR, cchOffset: i32, cchWrite: i32) -> HRESULT,
	Insert: proc "system" (this: ^IMLangStringBufW, cchOffset: i32, cchMaxInsert: i32, pcchActual: ^i32) -> HRESULT,
	Delete: proc "system" (this: ^IMLangStringBufW, cchOffset: i32, cchDelete: i32) -> HRESULT,
}
IID_IMLangStringBufW :: GUID{0xD24ACD21, 0xBA72, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

IMLangStringWStr :: struct #raw_union {
	#subtype IMLangString: IMLangString,
	using Vtbl: ^IMLangStringWStr_Vtbl,
}
IMLangStringWStr_Vtbl :: struct {
	using IMLangString_Vtbl: IMLangString_Vtbl,
	SetWStr: proc "system" (
		this: ^IMLangStringWStr,
		lDestPos: i32,
		lDestLen: i32,
		pszSrc: PWSTR,
		cchSrc: i32,
		pcchActual: ^i32,
		plActualLen: ^i32,
	) -> HRESULT,
	SetStrBufW: proc "system" (
		this: ^IMLangStringWStr,
		lDestPos: i32,
		lDestLen: i32,
		pSrcBuf: ^IMLangStringBufW,
		pcchActual: ^i32,
		plActualLen: ^i32,
	) -> HRESULT,
	GetWStr: proc "system" (
		this: ^IMLangStringWStr,
		lSrcPos: i32,
		lSrcLen: i32,
		pszDest: PWSTR,
		cchDest: i32,
		pcchActual: ^i32,
		plActualLen: ^i32,
	) -> HRESULT,
	GetStrBufW: proc "system" (
		this: ^IMLangStringWStr,
		lSrcPos: i32,
		lSrcMaxLen: i32,
		ppDestBuf: ^^IMLangStringBufW,
		plDestLen: ^i32,
	) -> HRESULT,
	LockWStr: proc "system" (
		this: ^IMLangStringWStr,
		lSrcPos: i32,
		lSrcLen: i32,
		lFlags: i32,
		cchRequest: i32,
		ppszDest: ^PWSTR,
		pcchDest: ^i32,
		plDestLen: ^i32,
	) -> HRESULT,
	UnlockWStr: proc "system" (
		this: ^IMLangStringWStr,
		pszSrc: PWSTR,
		cchSrc: i32,
		pcchActual: ^i32,
		plActualLen: ^i32,
	) -> HRESULT,
	SetLocale: proc "system" (this: ^IMLangStringWStr, lDestPos: i32, lDestLen: i32, locale: u32) -> HRESULT,
	GetLocale: proc "system" (
		this: ^IMLangStringWStr,
		lSrcPos: i32,
		lSrcMaxLen: i32,
		plocale: ^u32,
		plLocalePos: ^i32,
		plLocaleLen: ^i32,
	) -> HRESULT,
}
IID_IMLangStringWStr :: GUID{0xC04D65D0, 0xB70D, 0x11D0, {0xB1, 0x88, 0x00, 0xAA, 0x00, 0x38, 0xC9, 0x69}}

IMultiLanguage :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMultiLanguage_Vtbl,
}
IMultiLanguage_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetNumberOfCodePageInfo: proc "system" (this: ^IMultiLanguage, pcCodePage: ^u32) -> HRESULT,
	GetCodePageInfo: proc "system" (this: ^IMultiLanguage, uiCodePage: u32, pCodePageInfo: ^MIMECPINFO) -> HRESULT,
	GetFamilyCodePage: proc "system" (this: ^IMultiLanguage, uiCodePage: u32, puiFamilyCodePage: ^u32) -> HRESULT,
	EnumCodePages: proc "system" (this: ^IMultiLanguage, grfFlags: u32, ppEnumCodePage: ^^IEnumCodePage) -> HRESULT,
	GetCharsetInfo: proc "system" (this: ^IMultiLanguage, Charset: BSTR, pCharsetInfo: ^MIMECSETINFO) -> HRESULT,
	IsConvertible: proc "system" (this: ^IMultiLanguage, dwSrcEncoding: u32, dwDstEncoding: u32) -> HRESULT,
	ConvertString: proc "system" (
		this: ^IMultiLanguage,
		pdwMode: ^u32,
		dwSrcEncoding: u32,
		dwDstEncoding: u32,
		pSrcStr: ^u8,
		pcSrcSize: ^u32,
		pDstStr: ^u8,
		pcDstSize: ^u32,
	) -> HRESULT,
	ConvertStringToUnicode: proc "system" (
		this: ^IMultiLanguage,
		pdwMode: ^u32,
		dwEncoding: u32,
		pSrcStr: PSTR,
		pcSrcSize: ^u32,
		pDstStr: PWSTR,
		pcDstSize: ^u32,
	) -> HRESULT,
	ConvertStringFromUnicode: proc "system" (
		this: ^IMultiLanguage,
		pdwMode: ^u32,
		dwEncoding: u32,
		pSrcStr: PWSTR,
		pcSrcSize: ^u32,
		pDstStr: PSTR,
		pcDstSize: ^u32,
	) -> HRESULT,
	ConvertStringReset: proc "system" (this: ^IMultiLanguage) -> HRESULT,
	GetRfc1766FromLcid: proc "system" (this: ^IMultiLanguage, Locale: u32, pbstrRfc1766: ^BSTR) -> HRESULT,
	GetLcidFromRfc1766: proc "system" (this: ^IMultiLanguage, pLocale: ^u32, bstrRfc1766: BSTR) -> HRESULT,
	EnumRfc1766: proc "system" (this: ^IMultiLanguage, ppEnumRfc1766: ^^IEnumRfc1766) -> HRESULT,
	GetRfc1766Info: proc "system" (this: ^IMultiLanguage, Locale: u32, pRfc1766Info: ^RFC1766INFO) -> HRESULT,
	CreateConvertCharset: proc "system" (
		this: ^IMultiLanguage,
		uiSrcCodePage: u32,
		uiDstCodePage: u32,
		dwProperty: u32,
		ppMLangConvertCharset: ^^IMLangConvertCharset,
	) -> HRESULT,
}
IID_IMultiLanguage :: GUID{0x275C23E1, 0x3747, 0x11D0, {0x9F, 0xEA, 0x00, 0xAA, 0x00, 0x3F, 0x86, 0x46}}

IMultiLanguage2 :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IMultiLanguage2_Vtbl,
}
IMultiLanguage2_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetNumberOfCodePageInfo: proc "system" (this: ^IMultiLanguage2, pcCodePage: ^u32) -> HRESULT,
	GetCodePageInfo: proc "system" (
		this: ^IMultiLanguage2,
		uiCodePage: u32,
		LangId: u16,
		pCodePageInfo: ^MIMECPINFO,
	) -> HRESULT,
	GetFamilyCodePage: proc "system" (this: ^IMultiLanguage2, uiCodePage: u32, puiFamilyCodePage: ^u32) -> HRESULT,
	EnumCodePages: proc "system" (
		this: ^IMultiLanguage2,
		grfFlags: u32,
		LangId: u16,
		ppEnumCodePage: ^^IEnumCodePage,
	) -> HRESULT,
	GetCharsetInfo: proc "system" (this: ^IMultiLanguage2, Charset: BSTR, pCharsetInfo: ^MIMECSETINFO) -> HRESULT,
	IsConvertible: proc "system" (this: ^IMultiLanguage2, dwSrcEncoding: u32, dwDstEncoding: u32) -> HRESULT,
	ConvertString: proc "system" (
		this: ^IMultiLanguage2,
		pdwMode: ^u32,
		dwSrcEncoding: u32,
		dwDstEncoding: u32,
		pSrcStr: ^u8,
		pcSrcSize: ^u32,
		pDstStr: ^u8,
		pcDstSize: ^u32,
	) -> HRESULT,
	ConvertStringToUnicode: proc "system" (
		this: ^IMultiLanguage2,
		pdwMode: ^u32,
		dwEncoding: u32,
		pSrcStr: PSTR,
		pcSrcSize: ^u32,
		pDstStr: PWSTR,
		pcDstSize: ^u32,
	) -> HRESULT,
	ConvertStringFromUnicode: proc "system" (
		this: ^IMultiLanguage2,
		pdwMode: ^u32,
		dwEncoding: u32,
		pSrcStr: PWSTR,
		pcSrcSize: ^u32,
		pDstStr: PSTR,
		pcDstSize: ^u32,
	) -> HRESULT,
	ConvertStringReset: proc "system" (this: ^IMultiLanguage2) -> HRESULT,
	GetRfc1766FromLcid: proc "system" (this: ^IMultiLanguage2, Locale: u32, pbstrRfc1766: ^BSTR) -> HRESULT,
	GetLcidFromRfc1766: proc "system" (this: ^IMultiLanguage2, pLocale: ^u32, bstrRfc1766: BSTR) -> HRESULT,
	EnumRfc1766: proc "system" (this: ^IMultiLanguage2, LangId: u16, ppEnumRfc1766: ^^IEnumRfc1766) -> HRESULT,
	GetRfc1766Info: proc "system" (this: ^IMultiLanguage2, Locale: u32, LangId: u16, pRfc1766Info: ^RFC1766INFO) -> HRESULT,
	CreateConvertCharset: proc "system" (
		this: ^IMultiLanguage2,
		uiSrcCodePage: u32,
		uiDstCodePage: u32,
		dwProperty: u32,
		ppMLangConvertCharset: ^^IMLangConvertCharset,
	) -> HRESULT,
	ConvertStringInIStream: proc "system" (
		this: ^IMultiLanguage2,
		pdwMode: ^u32,
		dwFlag: u32,
		lpFallBack: PWSTR,
		dwSrcEncoding: u32,
		dwDstEncoding: u32,
		pstmIn: ^IStream,
		pstmOut: ^IStream,
	) -> HRESULT,
	ConvertStringToUnicodeEx: proc "system" (
		this: ^IMultiLanguage2,
		pdwMode: ^u32,
		dwEncoding: u32,
		pSrcStr: PSTR,
		pcSrcSize: ^u32,
		pDstStr: PWSTR,
		pcDstSize: ^u32,
		dwFlag: u32,
		lpFallBack: PWSTR,
	) -> HRESULT,
	ConvertStringFromUnicodeEx: proc "system" (
		this: ^IMultiLanguage2,
		pdwMode: ^u32,
		dwEncoding: u32,
		pSrcStr: PWSTR,
		pcSrcSize: ^u32,
		pDstStr: PSTR,
		pcDstSize: ^u32,
		dwFlag: u32,
		lpFallBack: PWSTR,
	) -> HRESULT,
	DetectCodepageInIStream: proc "system" (
		this: ^IMultiLanguage2,
		dwFlag: u32,
		dwPrefWinCodePage: u32,
		pstmIn: ^IStream,
		lpEncoding: ^DetectEncodingInfo,
		pnScores: ^i32,
	) -> HRESULT,
	DetectInputCodepage: proc "system" (
		this: ^IMultiLanguage2,
		dwFlag: u32,
		dwPrefWinCodePage: u32,
		pSrcStr: PSTR,
		pcSrcSize: ^i32,
		lpEncoding: ^DetectEncodingInfo,
		pnScores: ^i32,
	) -> HRESULT,
	ValidateCodePage: proc "system" (this: ^IMultiLanguage2, uiCodePage: u32, hwnd: HWND) -> HRESULT,
	GetCodePageDescription: proc "system" (
		this: ^IMultiLanguage2,
		uiCodePage: u32,
		lcid: u32,
		lpWideCharStr: PWSTR,
		cchWideChar: i32,
	) -> HRESULT,
	IsCodePageInstallable: proc "system" (this: ^IMultiLanguage2, uiCodePage: u32) -> HRESULT,
	SetMimeDBSource: proc "system" (this: ^IMultiLanguage2, dwSource: MIMECONTF) -> HRESULT,
	GetNumberOfScripts: proc "system" (this: ^IMultiLanguage2, pnScripts: ^u32) -> HRESULT,
	EnumScripts: proc "system" (this: ^IMultiLanguage2, dwFlags: u32, LangId: u16, ppEnumScript: ^^IEnumScript) -> HRESULT,
	ValidateCodePageEx: proc "system" (this: ^IMultiLanguage2, uiCodePage: u32, hwnd: HWND, dwfIODControl: u32) -> HRESULT,
}
IID_IMultiLanguage2 :: GUID{0xDCCFC164, 0x2B38, 0x11D2, {0xB7, 0xEC, 0x00, 0xC0, 0x4F, 0x8F, 0x5D, 0x9A}}

IMultiLanguage3 :: struct #raw_union {
	#subtype IMultiLanguage2: IMultiLanguage2,
	using Vtbl: ^IMultiLanguage3_Vtbl,
}
IMultiLanguage3_Vtbl :: struct {
	using IMultiLanguage2_Vtbl: IMultiLanguage2_Vtbl,
	DetectOutboundCodePage: proc "system" (
		this: ^IMultiLanguage3,
		dwFlags: u32,
		lpWideCharStr: PWSTR,
		cchWideChar: u32,
		puiPreferredCodePages: [^]u32,
		nPreferredCodePages: u32,
		puiDetectedCodePages: [^]u32,
		pnDetectedCodePages: ^u32,
		lpSpecialChar: PWSTR,
	) -> HRESULT,
	DetectOutboundCodePageInIStream: proc "system" (
		this: ^IMultiLanguage3,
		dwFlags: u32,
		pStrIn: ^IStream,
		puiPreferredCodePages: [^]u32,
		nPreferredCodePages: u32,
		puiDetectedCodePages: [^]u32,
		pnDetectedCodePages: ^u32,
		lpSpecialChar: PWSTR,
	) -> HRESULT,
}
IID_IMultiLanguage3 :: GUID{0x4E5868AB, 0xB157, 0x4623, {0x9A, 0xCC, 0x6A, 0x1D, 0x9C, 0xAE, 0xBE, 0x04}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ioptiondescription ]]
IOptionDescription :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IOptionDescription_Vtbl,
}
IOptionDescription_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_Id: proc "system" (this: ^IOptionDescription, value: ^PWSTR) -> HRESULT,
	get_Heading: proc "system" (this: ^IOptionDescription, value: ^PWSTR) -> HRESULT,
	get_Description: proc "system" (this: ^IOptionDescription, value: ^PWSTR) -> HRESULT,
	get_Labels: proc "system" (this: ^IOptionDescription, value: ^^IEnumString) -> HRESULT,
}
IID_IOptionDescription :: GUID{0x432E5F85, 0x35CF, 0x4606, {0xA8, 0x01, 0x6F, 0x70, 0x27, 0x7E, 0x1D, 0x7A}}

IS_TEXT_UNICODE_RESULT :: distinct bit_set[enum {
	ASCII16 = 0,
	REVERSE_ASCII16 = 4,
	STATISTICS = 1,
	REVERSE_STATISTICS = 5,
	CONTROLS = 2,
	REVERSE_CONTROLS = 6,
	SIGNATURE = 3,
	REVERSE_SIGNATURE = 7,
	ILLEGAL_CHARS = 8,
	ODD_LENGTH = 9,
	NULL_BYTES = 12,
}; u32]
IS_TEXT_UNICODE_RESULT_UNICODE_MASK :: transmute(IS_TEXT_UNICODE_RESULT)u32(0x0000000F)
IS_TEXT_UNICODE_RESULT_REVERSE_MASK :: transmute(IS_TEXT_UNICODE_RESULT)u32(0x000000F0)
IS_TEXT_UNICODE_RESULT_NOT_UNICODE_MASK :: transmute(IS_TEXT_UNICODE_RESULT)u32(0x00000F00)
IS_TEXT_UNICODE_RESULT_NOT_ASCII_MASK :: transmute(IS_TEXT_UNICODE_RESULT)u32(0x0000F000)

IS_VALID_LOCALE_FLAGS :: enum u32 {
	INSTALLED = 0x00000001,
	SUPPORTED = 0x00000002,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellchecker ]]
ISpellChecker :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISpellChecker_Vtbl,
}
ISpellChecker_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_LanguageTag: proc "system" (this: ^ISpellChecker, value: ^PWSTR) -> HRESULT,
	Check: proc "system" (this: ^ISpellChecker, text: PWSTR, value: ^^IEnumSpellingError) -> HRESULT,
	Suggest: proc "system" (this: ^ISpellChecker, word: PWSTR, value: ^^IEnumString) -> HRESULT,
	Add: proc "system" (this: ^ISpellChecker, word: PWSTR) -> HRESULT,
	Ignore: proc "system" (this: ^ISpellChecker, word: PWSTR) -> HRESULT,
	AutoCorrect: proc "system" (this: ^ISpellChecker, from: PWSTR, to: PWSTR) -> HRESULT,
	GetOptionValue: proc "system" (this: ^ISpellChecker, optionId: PWSTR, value: ^u8) -> HRESULT,
	get_OptionIds: proc "system" (this: ^ISpellChecker, value: ^^IEnumString) -> HRESULT,
	get_Id: proc "system" (this: ^ISpellChecker, value: ^PWSTR) -> HRESULT,
	get_LocalizedName: proc "system" (this: ^ISpellChecker, value: ^PWSTR) -> HRESULT,
	add_SpellCheckerChanged: proc "system" (
		this: ^ISpellChecker,
		handler: ^ISpellCheckerChangedEventHandler,
		eventCookie: ^u32,
	) -> HRESULT,
	remove_SpellCheckerChanged: proc "system" (this: ^ISpellChecker, eventCookie: u32) -> HRESULT,
	GetOptionDescription: proc "system" (this: ^ISpellChecker, optionId: PWSTR, value: ^^IOptionDescription) -> HRESULT,
	ComprehensiveCheck: proc "system" (this: ^ISpellChecker, text: PWSTR, value: ^^IEnumSpellingError) -> HRESULT,
}
IID_ISpellChecker :: GUID{0xB6FD0B71, 0xE2BC, 0x4653, {0x8D, 0x05, 0xF1, 0x97, 0xE4, 0x12, 0x77, 0x0B}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellchecker2 ]]
ISpellChecker2 :: struct #raw_union {
	#subtype ISpellChecker: ISpellChecker,
	using Vtbl: ^ISpellChecker2_Vtbl,
}
ISpellChecker2_Vtbl :: struct {
	using ISpellChecker_Vtbl: ISpellChecker_Vtbl,
	Remove: proc "system" (this: ^ISpellChecker2, word: PWSTR) -> HRESULT,
}
IID_ISpellChecker2 :: GUID{0xE7ED1C71, 0x87F7, 0x4378, {0xA8, 0x40, 0xC9, 0x20, 0x0D, 0xAC, 0xEE, 0x47}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellcheckerchangedeventhandler ]]
ISpellCheckerChangedEventHandler :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISpellCheckerChangedEventHandler_Vtbl,
}
ISpellCheckerChangedEventHandler_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	Invoke: proc "system" (this: ^ISpellCheckerChangedEventHandler, sender: ^ISpellChecker) -> HRESULT,
}
IID_ISpellCheckerChangedEventHandler :: GUID{0x0B83A5B0, 0x792F, 0x4EAB, {0x97, 0x99, 0xAC, 0xF5, 0x2C, 0x5E, 0xD0, 0x8A}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellcheckerfactory ]]
ISpellCheckerFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISpellCheckerFactory_Vtbl,
}
ISpellCheckerFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_SupportedLanguages: proc "system" (this: ^ISpellCheckerFactory, value: ^^IEnumString) -> HRESULT,
	IsSupported: proc "system" (this: ^ISpellCheckerFactory, languageTag: PWSTR, value: ^BOOL) -> HRESULT,
	CreateSpellChecker: proc "system" (this: ^ISpellCheckerFactory, languageTag: PWSTR, value: ^^ISpellChecker) -> HRESULT,
}
IID_ISpellCheckerFactory :: GUID{0x8E018A9D, 0x2415, 0x4677, {0xBF, 0x08, 0x79, 0x4E, 0xA6, 0x1F, 0x94, 0xBB}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nn-spellcheckprovider-ispellcheckprovider ]]
ISpellCheckProvider :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISpellCheckProvider_Vtbl,
}
ISpellCheckProvider_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_LanguageTag: proc "system" (this: ^ISpellCheckProvider, value: ^PWSTR) -> HRESULT,
	Check: proc "system" (this: ^ISpellCheckProvider, text: PWSTR, value: ^^IEnumSpellingError) -> HRESULT,
	Suggest: proc "system" (this: ^ISpellCheckProvider, word: PWSTR, value: ^^IEnumString) -> HRESULT,
	GetOptionValue: proc "system" (this: ^ISpellCheckProvider, optionId: PWSTR, value: ^u8) -> HRESULT,
	SetOptionValue: proc "system" (this: ^ISpellCheckProvider, optionId: PWSTR, value: u8) -> HRESULT,
	get_OptionIds: proc "system" (this: ^ISpellCheckProvider, value: ^^IEnumString) -> HRESULT,
	get_Id: proc "system" (this: ^ISpellCheckProvider, value: ^PWSTR) -> HRESULT,
	get_LocalizedName: proc "system" (this: ^ISpellCheckProvider, value: ^PWSTR) -> HRESULT,
	GetOptionDescription: proc "system" (this: ^ISpellCheckProvider, optionId: PWSTR, value: ^^IOptionDescription) -> HRESULT,
	InitializeWordlist: proc "system" (
		this: ^ISpellCheckProvider,
		wordlistType: WORDLIST_TYPE,
		words: ^IEnumString,
	) -> HRESULT,
}
IID_ISpellCheckProvider :: GUID{0x73E976E0, 0x8ED4, 0x4EB1, {0x80, 0xD7, 0x1B, 0xE0, 0xA1, 0x6B, 0x0C, 0x38}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheckprovider/nn-spellcheckprovider-ispellcheckproviderfactory ]]
ISpellCheckProviderFactory :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISpellCheckProviderFactory_Vtbl,
}
ISpellCheckProviderFactory_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_SupportedLanguages: proc "system" (this: ^ISpellCheckProviderFactory, value: ^^IEnumString) -> HRESULT,
	IsSupported: proc "system" (this: ^ISpellCheckProviderFactory, languageTag: PWSTR, value: ^BOOL) -> HRESULT,
	CreateSpellCheckProvider: proc "system" (
		this: ^ISpellCheckProviderFactory,
		languageTag: PWSTR,
		value: ^^ISpellCheckProvider,
	) -> HRESULT,
}
IID_ISpellCheckProviderFactory :: GUID{0x9F671E11, 0x77D6, 0x4C92, {0xAE, 0xFB, 0x61, 0x52, 0x15, 0xE3, 0xA4, 0xBE}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-ispellingerror ]]
ISpellingError :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^ISpellingError_Vtbl,
}
ISpellingError_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	get_StartIndex: proc "system" (this: ^ISpellingError, value: ^u32) -> HRESULT,
	get_Length: proc "system" (this: ^ISpellingError, value: ^u32) -> HRESULT,
	get_CorrectiveAction: proc "system" (this: ^ISpellingError, value: ^CORRECTIVE_ACTION) -> HRESULT,
	get_Replacement: proc "system" (this: ^ISpellingError, value: ^PWSTR) -> HRESULT,
}
IID_ISpellingError :: GUID{0xB7C82D61, 0xFBE8, 0x4B47, {0x9B, 0x27, 0x6C, 0x0D, 0x2E, 0x0D, 0xE0, 0xA3}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/nn-spellcheck-iuserdictionariesregistrar ]]
IUserDictionariesRegistrar :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IUserDictionariesRegistrar_Vtbl,
}
IUserDictionariesRegistrar_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	RegisterUserDictionary: proc "system" (
		this: ^IUserDictionariesRegistrar,
		dictionaryPath: PWSTR,
		languageTag: PWSTR,
	) -> HRESULT,
	UnregisterUserDictionary: proc "system" (
		this: ^IUserDictionariesRegistrar,
		dictionaryPath: PWSTR,
		languageTag: PWSTR,
	) -> HRESULT,
}
IID_IUserDictionariesRegistrar :: GUID{0xAA176B85, 0x0E12, 0x4844, {0x8E, 0x1A, 0xEE, 0xF1, 0xDA, 0x77, 0xF5, 0x86}}

LANGGROUPLOCALE_ENUMPROCA :: #type proc "system" (param0: u32, param1: u32, param2: PSTR, param3: int) -> BOOL

LANGGROUPLOCALE_ENUMPROCW :: #type proc "system" (param0: u32, param1: u32, param2: PWSTR, param3: int) -> BOOL

LANGUAGEGROUP_ENUMPROCA :: #type proc "system" (param0: u32, param1: PSTR, param2: PSTR, param3: u32, param4: int) -> BOOL

LANGUAGEGROUP_ENUMPROCW :: #type proc "system" (param0: u32, param1: PWSTR, param2: PWSTR, param3: u32, param4: int) -> BOOL

LOCALE_ENUMPROCA :: #type proc "system" (param0: PSTR) -> BOOL

LOCALE_ENUMPROCEX :: #type proc "system" (param0: PWSTR, param1: u32, param2: LPARAM) -> BOOL

LOCALE_ENUMPROCW :: #type proc "system" (param0: PWSTR) -> BOOL

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-localesignature ]]
LOCALESIGNATURE :: struct {
	lsUsb: [4]u32,
	lsCsbDefault: [2]u32,
	lsCsbSupported: [2]u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_data_range ]]
MAPPING_DATA_RANGE :: struct {
	dwStartIndex: u32,
	dwEndIndex: u32,
	pszDescription: PWSTR,
	dwDescriptionLength: u32,
	pData: rawptr,
	dwDataSize: u32,
	pszContentType: PWSTR,
	prgActionIds: ^PWSTR,
	dwActionsCount: u32,
	prgActionDisplayNames: ^PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_enum_options ]]
MAPPING_ENUM_OPTIONS :: struct {
	Size: uintptr,
	pszCategory: PWSTR,
	pszInputLanguage: PWSTR,
	pszOutputLanguage: PWSTR,
	pszInputScript: PWSTR,
	pszOutputScript: PWSTR,
	pszInputContentType: PWSTR,
	pszOutputContentType: PWSTR,
	pGuid: ^GUID,
	using _: bit_field u32 {
		OnlineService: u32 | 2,
		ServiceType: u32 | 2,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_options ]]
MAPPING_OPTIONS :: struct {
	Size: uintptr,
	pszInputLanguage: PWSTR,
	pszOutputLanguage: PWSTR,
	pszInputScript: PWSTR,
	pszOutputScript: PWSTR,
	pszInputContentType: PWSTR,
	pszOutputContentType: PWSTR,
	pszUILanguage: PWSTR,
	pfnRecognizeCallback: PFN_MAPPINGCALLBACKPROC,
	pRecognizeCallerData: rawptr,
	dwRecognizeCallerDataSize: u32,
	pfnActionCallback: PFN_MAPPINGCALLBACKPROC,
	pActionCallerData: rawptr,
	dwActionCallerDataSize: u32,
	dwServiceFlag: u32,
	using _: bit_field u32 {
		GetActionDisplayName: u32 | 1,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_property_bag ]]
MAPPING_PROPERTY_BAG :: struct {
	Size: uintptr,
	prgResultRanges: ^MAPPING_DATA_RANGE,
	dwRangesCount: u32,
	pServiceData: rawptr,
	dwServiceDataSize: u32,
	pCallerData: rawptr,
	dwCallerDataSize: u32,
	pContext: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_service_info ]]
MAPPING_SERVICE_INFO :: struct {
	Size: uintptr,
	pszCopyright: PWSTR,
	wMajorVersion: u16,
	wMinorVersion: u16,
	wBuildVersion: u16,
	wStepVersion: u16,
	dwInputContentTypesCount: u32,
	prgInputContentTypes: ^PWSTR,
	dwOutputContentTypesCount: u32,
	prgOutputContentTypes: ^PWSTR,
	dwInputLanguagesCount: u32,
	prgInputLanguages: ^PWSTR,
	dwOutputLanguagesCount: u32,
	prgOutputLanguages: ^PWSTR,
	dwInputScriptsCount: u32,
	prgInputScripts: ^PWSTR,
	dwOutputScriptsCount: u32,
	prgOutputScripts: ^PWSTR,
	guid: GUID,
	pszCategory: PWSTR,
	pszDescription: PWSTR,
	dwPrivateDataSize: u32,
	pPrivateData: rawptr,
	pContext: rawptr,
	using _: bit_field u32 {
		IsOneToOneLanguageMapping: u32 | 1,
		HasSubservices: u32 | 1,
		OnlineOnly: u32 | 1,
		ServiceType: u32 | 2,
	},
}

MIMECONTF :: enum i32 {
	MAILNEWS = 1,
	BROWSER = 2,
	MINIMAL = 4,
	IMPORT = 8,
	SAVABLE_MAILNEWS = 256,
	SAVABLE_BROWSER = 512,
	EXPORT = 1024,
	PRIVCONVERTER = 65536,
	VALID = 131072,
	VALID_NLS = 262144,
	MIME_IE4 = 268435456,
	MIME_LATEST = 536870912,
	MIME_REGISTRY = 1073741824,
}

MIMECPINFO :: struct {
	dwFlags: u32,
	uiCodePage: u32,
	uiFamilyCodePage: u32,
	wszDescription: [64]u16,
	wszWebCharset: [50]u16,
	wszHeaderCharset: [50]u16,
	wszBodyCharset: [50]u16,
	wszFixedWidthFont: [32]u16,
	wszProportionalFont: [32]u16,
	bGDICharset: u8,
}

MIMECSETINFO :: struct {
	uiCodePage: u32,
	uiInternetEncoding: u32,
	wszCharset: [50]u16,
}

MLCONVCHAR :: enum i32 {
	AUTODETECT = 1,
	ENTITIZE = 2,
	NCR_ENTITIZE = 2,
	NAME_ENTITIZE = 4,
	USEDEFCHAR = 8,
	NOBESTFITCHARS = 16,
	DETECTJPN = 32,
}

MLCP :: enum i32 {
	MAILNEWS = 1,
	BROWSER = 2,
	VALID = 4,
	VALID_NLS = 8,
	PRESERVE_ORDER = 16,
	PREFERRED_ONLY = 32,
	FILTER_SPECIALCHAR = 64,
	EURO_UTF8 = 128,
}

MLDETECTCP :: enum i32 {
	NONE = 0,
	_7BIT = 1,
	_8BIT = 2,
	DBCS = 4,
	HTML = 8,
	NUMBER = 16,
}

MLSTR_FLAGS :: enum i32 {
	READ = 1,
	WRITE = 2,
}

MULTI_BYTE_TO_WIDE_CHAR_FLAGS :: distinct bit_set[enum {
	COMPOSITE = 1,
	ERR_INVALID_CHARS = 3,
	PRECOMPOSED = 0,
	USEGLYPHCHARS = 2,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-newtextmetricexa ]]
NEWTEXTMETRICEXA :: struct {
	ntmTm: NEWTEXTMETRICA,
	ntmFontSig: FONTSIGNATURE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-newtextmetricexw ]]
NEWTEXTMETRICEXW :: struct {
	ntmTm: NEWTEXTMETRICW,
	ntmFontSig: FONTSIGNATURE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-nlsversioninfo~r1 ]]
NLSVERSIONINFO :: struct {
	dwNLSVersionInfoSize: u32,
	dwNLSVersion: u32,
	dwDefinedVersion: u32,
	dwEffectiveId: u32,
	guidCustomVersion: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-nlsversioninfoex ]]
NLSVERSIONINFOEX :: struct {
	dwNLSVersionInfoSize: u32,
	dwNLSVersion: u32,
	dwDefinedVersion: u32,
	dwEffectiveId: u32,
	guidCustomVersion: GUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ne-winnls-norm_form ]]
NORM_FORM :: enum i32 {
	Other = 0,
	C = 1,
	D = 2,
	KC = 5,
	KD = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-numberfmta ]]
NUMBERFMTA :: struct {
	NumDigits: u32,
	LeadingZero: u32,
	Grouping: u32,
	lpDecimalSep: PSTR,
	lpThousandSep: PSTR,
	NegativeOrder: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ns-winnls-numberfmtw ]]
NUMBERFMTW :: struct {
	NumDigits: u32,
	LeadingZero: u32,
	Grouping: u32,
	lpDecimalSep: PWSTR,
	lpThousandSep: PWSTR,
	NegativeOrder: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-opentype_feature_record ]]
OPENTYPE_FEATURE_RECORD :: struct {
	tagFeature: u32,
	lParameter: i32,
}

PFN_MAPPINGCALLBACKPROC :: #type proc "system" (pBag: ^MAPPING_PROPERTY_BAG, data: rawptr, dwDataSize: u32, Result: HRESULT)

RFC1766INFO :: struct {
	lcid: u32,
	wszRfc1766: [6]u16,
	wszLocaleName: [32]u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_analysis ]]
SCRIPT_ANALYSIS :: struct {
	using _: bit_field u16 {
		eScript: u16 | 10,
		fRTL: u16 | 1,
		fLayoutRTL: u16 | 1,
		fLinkBefore: u16 | 1,
		fLinkAfter: u16 | 1,
		fLogicalOrder: u16 | 1,
		fNoGlyphIndex: u16 | 1,
	},
	s: SCRIPT_STATE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_charprop ]]
SCRIPT_CHARPROP :: struct {
	using _: bit_field u16 {
		fCanGlyphAlone: u16 | 1,
		reserved: u16 | 15,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_control ]]
SCRIPT_CONTROL :: struct {
	using _: bit_field u32 {
		uDefaultLanguage: u32 | 16,
		fContextDigits: u32 | 1,
		fInvertPreBoundDir: u32 | 1,
		fInvertPostBoundDir: u32 | 1,
		fLinkStringBefore: u32 | 1,
		fLinkStringAfter: u32 | 1,
		fNeutralOverride: u32 | 1,
		fNumericOverride: u32 | 1,
		fLegacyBidiClass: u32 | 1,
		fMergeNeutralItems: u32 | 1,
		fUseStandardBidi: u32 | 1,
		fReserved: u32 | 6,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_digitsubstitute ]]
SCRIPT_DIGITSUBSTITUTE :: struct {
	using _: bit_field u32 {
		NationalDigitLanguage: u32 | 16,
		TraditionalDigitLanguage: u32 | 16,
	},
	using _: bit_field u32 {
		DigitSubstitute: u32 | 8,
	},
	dwReserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_fontproperties ]]
SCRIPT_FONTPROPERTIES :: struct {
	cBytes: i32,
	wgBlank: u16,
	wgDefault: u16,
	wgInvalid: u16,
	wgKashida: u16,
	iKashidaWidth: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_glyphprop ]]
SCRIPT_GLYPHPROP :: struct {
	sva: SCRIPT_VISATTR,
	reserved: u16,
}

SCRIPT_IS_COMPLEX_FLAGS :: enum u32 {
	ASCIIDIGIT = 0x00000002,
	COMPLEX = 0x00000001,
	NEUTRAL = 0x00000004,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_item ]]
SCRIPT_ITEM :: struct {
	iCharPos: i32,
	a: SCRIPT_ANALYSIS,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ne-usp10-script_justify ]]
SCRIPT_JUSTIFY :: enum i32 {
	NONE = 0,
	ARABIC_BLANK = 1,
	CHARACTER = 2,
	RESERVED1 = 3,
	BLANK = 4,
	RESERVED2 = 5,
	RESERVED3 = 6,
	ARABIC_NORMAL = 7,
	ARABIC_KASHIDA = 8,
	ARABIC_ALEF = 9,
	ARABIC_HA = 10,
	ARABIC_RA = 11,
	ARABIC_BA = 12,
	ARABIC_BARA = 13,
	ARABIC_SEEN = 14,
	ARABIC_SEEN_M = 15,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_logattr ]]
SCRIPT_LOGATTR :: struct {
	using _: bit_field u8 {
		fSoftBreak: u8 | 1,
		fWhiteSpace: u8 | 1,
		fCharStop: u8 | 1,
		fWordStop: u8 | 1,
		fInvalid: u8 | 1,
		fReserved: u8 | 3,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_properties ]]
SCRIPT_PROPERTIES :: struct {
	using _: bit_field u32 {
		langid: u32 | 16,
		fNumeric: u32 | 1,
		fComplex: u32 | 1,
		fNeedsWordBreaking: u32 | 1,
		fNeedsCaretInfo: u32 | 1,
		bCharSet: u32 | 8,
		fControl: u32 | 1,
		fPrivateUseArea: u32 | 1,
		fNeedsCharacterJustify: u32 | 1,
		fInvalidGlyph: u32 | 1,
	},
	using _: bit_field u32 {
		fInvalidLogAttr: u32 | 1,
		fCDM: u32 | 1,
		fAmbiguousCharSet: u32 | 1,
		fClusterSizeVaries: u32 | 1,
		fRejectInvalid: u32 | 1,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_state ]]
SCRIPT_STATE :: struct {
	using _: bit_field u16 {
		uBidiLevel: u16 | 5,
		fOverrideDirection: u16 | 1,
		fInhibitSymSwap: u16 | 1,
		fCharShape: u16 | 1,
		fDigitSubstitute: u16 | 1,
		fInhibitLigate: u16 | 1,
		fDisplayZWG: u16 | 1,
		fArabicNumContext: u16 | 1,
		fGcpClusters: u16 | 1,
		fReserved: u16 | 1,
		fEngineReserved: u16 | 2,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_tabdef ]]
SCRIPT_TABDEF :: struct {
	cTabStops: i32,
	iScale: i32,
	pTabStops: ^i32,
	iTabOrigin: i32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_visattr ]]
SCRIPT_VISATTR :: struct {
	using _: bit_field u16 {
		uJustification: u16 | 4,
		fClusterStart: u16 | 1,
		fDiacritic: u16 | 1,
		fZeroWidth: u16 | 1,
		fReserved: u16 | 1,
		fShapeReserved: u16 | 8,
	},
}

SCRIPTCONTF :: enum i32 {
	Default = 0,
	Merge = 1,
	AsciiSym = 2,
	AsciiLatin = 3,
	Latin = 4,
	Greek = 5,
	Cyrillic = 6,
	Armenian = 7,
	Hebrew = 8,
	Arabic = 9,
	Devanagari = 10,
	Bengali = 11,
	Gurmukhi = 12,
	Gujarati = 13,
	Oriya = 14,
	Tamil = 15,
	Telugu = 16,
	Kannada = 17,
	Malayalam = 18,
	Thai = 19,
	Lao = 20,
	Tibetan = 21,
	Georgian = 22,
	Hangul = 23,
	Kana = 24,
	Bopomofo = 25,
	Han = 26,
	Ethiopic = 27,
	CanSyllabic = 28,
	Cherokee = 29,
	Yi = 30,
	Braille = 31,
	Runic = 32,
	Ogham = 33,
	Sinhala = 34,
	Syriac = 35,
	Burmese = 36,
	Khmer = 37,
	Thaana = 38,
	Mongolian = 39,
	UserDefined = 40,
	Lim = 41,
	FEFirst = 23,
	FELast = 26,
}

SCRIPTFONTCONTF :: enum i32 {
	FIXED_FONT = 1,
	PROPORTIONAL_FONT = 2,
	SCRIPT_USER = 65536,
	SCRIPT_HIDE = 131072,
	SCRIPT_SYSTEM = 262144,
}

SCRIPTFONTINFO :: struct {
	scripts: i64,
	wszFont: [32]u16,
}

SCRIPTINFO :: struct {
	ScriptId: u8,
	uiCodePage: u32,
	wszDescription: [48]u16,
	wszFixedWidthFont: [32]u16,
	wszProportionalFont: [32]u16,
}

SpellCheckerFactory :: struct {
}
IID_SpellCheckerFactory :: GUID{0x7AB36653, 0x1796, 0x484B, {0xBD, 0xFA, 0xE7, 0x4F, 0x1D, 0xB7, 0xC1, 0xDC}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ne-winnls-sysgeoclass ]]
SYSGEOCLASS :: enum i32 {
	NATION = 16,
	REGION = 14,
	ALL = 0,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ne-winnls-sysgeotype ]]
SYSGEOTYPE :: enum i32 {
	NATION = 1,
	LATITUDE = 2,
	LONGITUDE = 3,
	ISO2 = 4,
	ISO3 = 5,
	RFC1766 = 6,
	LCID = 7,
	FRIENDLYNAME = 8,
	OFFICIALNAME = 9,
	TIMEZONES = 10,
	OFFICIALLANGUAGES = 11,
	ISO_UN_NUMBER = 12,
	PARENT = 13,
	DIALINGCODE = 14,
	CURRENCYCODE = 15,
	CURRENCYSYMBOL = 16,
	NAME = 17,
	ID = 18,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnls/ne-winnls-sysnls_function ]]
SYSNLS_FUNCTION :: enum i32 {
	COMPARE_STRING = 1,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-textrange_properties ]]
TEXTRANGE_PROPERTIES :: struct {
	potfRecords: ^OPENTYPE_FEATURE_RECORD,
	cotfRecords: i32,
}

TIME_FORMAT_FLAGS :: distinct bit_set[enum {
	NOMINUTESORSECONDS = 0,
	NOSECONDS = 1,
	NOTIMEMARKER = 2,
	FORCE24HOURFORMAT = 3,
}; u32]

TIMEFMT_ENUMPROCA :: #type proc "system" (param0: PSTR) -> BOOL

TIMEFMT_ENUMPROCEX :: #type proc "system" (param0: PWSTR, param1: LPARAM) -> BOOL

TIMEFMT_ENUMPROCW :: #type proc "system" (param0: PWSTR) -> BOOL

TRANSLATE_CHARSET_INFO_FLAGS :: enum u32 {
	SRCCHARSET = 0x00000001,
	SRCCODEPAGE = 0x00000002,
	SRCFONTSIG = 0x00000003,
	SRCLOCALE = 0x00001000,
}

UAcceptResult :: enum i32 {
	FAILED = 0,
	VALID = 1,
	FALLBACK = 2,
}

UAlphabeticIndexLabelType :: enum i32 {
	NORMAL = 0,
	UNDERFLOW = 1,
	INFLOW = 2,
	OVERFLOW = 3,
}

UBiDi :: int

UBiDiClassCallback :: #type proc "c" (_context: rawptr, c: i32) -> UCharDirection

UBiDiDirection :: enum i32 {
	LTR = 0,
	RTL = 1,
	MIXED = 2,
	NEUTRAL = 3,
}

UBiDiMirroring :: enum i32 {
	OFF = 0,
	ON = 1,
}

UBiDiOrder :: enum i32 {
	LOGICAL = 0,
	VISUAL = 1,
}

UBidiPairedBracketType :: enum i32 {
	NONE = 0,
	OPEN = 1,
	CLOSE = 2,
}

UBiDiReorderingMode :: enum i32 {
	DEFAULT = 0,
	NUMBERS_SPECIAL = 1,
	GROUP_NUMBERS_WITH_R = 2,
	RUNS_ONLY = 3,
	INVERSE_NUMBERS_AS_L = 4,
	INVERSE_LIKE_DIRECT = 5,
	INVERSE_FOR_NUMBERS_SPECIAL = 6,
}

UBiDiReorderingOption :: enum i32 {
	DEFAULT = 0,
	INSERT_MARKS = 1,
	REMOVE_CONTROLS = 2,
	STREAMING = 4,
}

UBiDiTransform :: int

UBlockCode :: enum i32 {
	NO_BLOCK = 0,
	BASIC_LATIN = 1,
	LATIN_1_SUPPLEMENT = 2,
	LATIN_EXTENDED_A = 3,
	LATIN_EXTENDED_B = 4,
	IPA_EXTENSIONS = 5,
	SPACING_MODIFIER_LETTERS = 6,
	COMBINING_DIACRITICAL_MARKS = 7,
	GREEK = 8,
	CYRILLIC = 9,
	ARMENIAN = 10,
	HEBREW = 11,
	ARABIC = 12,
	SYRIAC = 13,
	THAANA = 14,
	DEVANAGARI = 15,
	BENGALI = 16,
	GURMUKHI = 17,
	GUJARATI = 18,
	ORIYA = 19,
	TAMIL = 20,
	TELUGU = 21,
	KANNADA = 22,
	MALAYALAM = 23,
	SINHALA = 24,
	THAI = 25,
	LAO = 26,
	TIBETAN = 27,
	MYANMAR = 28,
	GEORGIAN = 29,
	HANGUL_JAMO = 30,
	ETHIOPIC = 31,
	CHEROKEE = 32,
	UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS = 33,
	OGHAM = 34,
	RUNIC = 35,
	KHMER = 36,
	MONGOLIAN = 37,
	LATIN_EXTENDED_ADDITIONAL = 38,
	GREEK_EXTENDED = 39,
	GENERAL_PUNCTUATION = 40,
	SUPERSCRIPTS_AND_SUBSCRIPTS = 41,
	CURRENCY_SYMBOLS = 42,
	COMBINING_MARKS_FOR_SYMBOLS = 43,
	LETTERLIKE_SYMBOLS = 44,
	NUMBER_FORMS = 45,
	ARROWS = 46,
	MATHEMATICAL_OPERATORS = 47,
	MISCELLANEOUS_TECHNICAL = 48,
	CONTROL_PICTURES = 49,
	OPTICAL_CHARACTER_RECOGNITION = 50,
	ENCLOSED_ALPHANUMERICS = 51,
	BOX_DRAWING = 52,
	BLOCK_ELEMENTS = 53,
	GEOMETRIC_SHAPES = 54,
	MISCELLANEOUS_SYMBOLS = 55,
	DINGBATS = 56,
	BRAILLE_PATTERNS = 57,
	CJK_RADICALS_SUPPLEMENT = 58,
	KANGXI_RADICALS = 59,
	IDEOGRAPHIC_DESCRIPTION_CHARACTERS = 60,
	CJK_SYMBOLS_AND_PUNCTUATION = 61,
	HIRAGANA = 62,
	KATAKANA = 63,
	BOPOMOFO = 64,
	HANGUL_COMPATIBILITY_JAMO = 65,
	KANBUN = 66,
	BOPOMOFO_EXTENDED = 67,
	ENCLOSED_CJK_LETTERS_AND_MONTHS = 68,
	CJK_COMPATIBILITY = 69,
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_A = 70,
	CJK_UNIFIED_IDEOGRAPHS = 71,
	YI_SYLLABLES = 72,
	YI_RADICALS = 73,
	HANGUL_SYLLABLES = 74,
	HIGH_SURROGATES = 75,
	HIGH_PRIVATE_USE_SURROGATES = 76,
	LOW_SURROGATES = 77,
	PRIVATE_USE_AREA = 78,
	PRIVATE_USE = 78,
	CJK_COMPATIBILITY_IDEOGRAPHS = 79,
	ALPHABETIC_PRESENTATION_FORMS = 80,
	ARABIC_PRESENTATION_FORMS_A = 81,
	COMBINING_HALF_MARKS = 82,
	CJK_COMPATIBILITY_FORMS = 83,
	SMALL_FORM_VARIANTS = 84,
	ARABIC_PRESENTATION_FORMS_B = 85,
	SPECIALS = 86,
	HALFWIDTH_AND_FULLWIDTH_FORMS = 87,
	OLD_ITALIC = 88,
	GOTHIC = 89,
	DESERET = 90,
	BYZANTINE_MUSICAL_SYMBOLS = 91,
	MUSICAL_SYMBOLS = 92,
	MATHEMATICAL_ALPHANUMERIC_SYMBOLS = 93,
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_B = 94,
	CJK_COMPATIBILITY_IDEOGRAPHS_SUPPLEMENT = 95,
	TAGS = 96,
	CYRILLIC_SUPPLEMENT = 97,
	CYRILLIC_SUPPLEMENTARY = 97,
	TAGALOG = 98,
	HANUNOO = 99,
	BUHID = 100,
	TAGBANWA = 101,
	MISCELLANEOUS_MATHEMATICAL_SYMBOLS_A = 102,
	SUPPLEMENTAL_ARROWS_A = 103,
	SUPPLEMENTAL_ARROWS_B = 104,
	MISCELLANEOUS_MATHEMATICAL_SYMBOLS_B = 105,
	SUPPLEMENTAL_MATHEMATICAL_OPERATORS = 106,
	KATAKANA_PHONETIC_EXTENSIONS = 107,
	VARIATION_SELECTORS = 108,
	SUPPLEMENTARY_PRIVATE_USE_AREA_A = 109,
	SUPPLEMENTARY_PRIVATE_USE_AREA_B = 110,
	LIMBU = 111,
	TAI_LE = 112,
	KHMER_SYMBOLS = 113,
	PHONETIC_EXTENSIONS = 114,
	MISCELLANEOUS_SYMBOLS_AND_ARROWS = 115,
	YIJING_HEXAGRAM_SYMBOLS = 116,
	LINEAR_B_SYLLABARY = 117,
	LINEAR_B_IDEOGRAMS = 118,
	AEGEAN_NUMBERS = 119,
	UGARITIC = 120,
	SHAVIAN = 121,
	OSMANYA = 122,
	CYPRIOT_SYLLABARY = 123,
	TAI_XUAN_JING_SYMBOLS = 124,
	VARIATION_SELECTORS_SUPPLEMENT = 125,
	ANCIENT_GREEK_MUSICAL_NOTATION = 126,
	ANCIENT_GREEK_NUMBERS = 127,
	ARABIC_SUPPLEMENT = 128,
	BUGINESE = 129,
	CJK_STROKES = 130,
	COMBINING_DIACRITICAL_MARKS_SUPPLEMENT = 131,
	COPTIC = 132,
	ETHIOPIC_EXTENDED = 133,
	ETHIOPIC_SUPPLEMENT = 134,
	GEORGIAN_SUPPLEMENT = 135,
	GLAGOLITIC = 136,
	KHAROSHTHI = 137,
	MODIFIER_TONE_LETTERS = 138,
	NEW_TAI_LUE = 139,
	OLD_PERSIAN = 140,
	PHONETIC_EXTENSIONS_SUPPLEMENT = 141,
	SUPPLEMENTAL_PUNCTUATION = 142,
	SYLOTI_NAGRI = 143,
	TIFINAGH = 144,
	VERTICAL_FORMS = 145,
	NKO = 146,
	BALINESE = 147,
	LATIN_EXTENDED_C = 148,
	LATIN_EXTENDED_D = 149,
	PHAGS_PA = 150,
	PHOENICIAN = 151,
	CUNEIFORM = 152,
	CUNEIFORM_NUMBERS_AND_PUNCTUATION = 153,
	COUNTING_ROD_NUMERALS = 154,
	SUNDANESE = 155,
	LEPCHA = 156,
	OL_CHIKI = 157,
	CYRILLIC_EXTENDED_A = 158,
	VAI = 159,
	CYRILLIC_EXTENDED_B = 160,
	SAURASHTRA = 161,
	KAYAH_LI = 162,
	REJANG = 163,
	CHAM = 164,
	ANCIENT_SYMBOLS = 165,
	PHAISTOS_DISC = 166,
	LYCIAN = 167,
	CARIAN = 168,
	LYDIAN = 169,
	MAHJONG_TILES = 170,
	DOMINO_TILES = 171,
	SAMARITAN = 172,
	UNIFIED_CANADIAN_ABORIGINAL_SYLLABICS_EXTENDED = 173,
	TAI_THAM = 174,
	VEDIC_EXTENSIONS = 175,
	LISU = 176,
	BAMUM = 177,
	COMMON_INDIC_NUMBER_FORMS = 178,
	DEVANAGARI_EXTENDED = 179,
	HANGUL_JAMO_EXTENDED_A = 180,
	JAVANESE = 181,
	MYANMAR_EXTENDED_A = 182,
	TAI_VIET = 183,
	MEETEI_MAYEK = 184,
	HANGUL_JAMO_EXTENDED_B = 185,
	IMPERIAL_ARAMAIC = 186,
	OLD_SOUTH_ARABIAN = 187,
	AVESTAN = 188,
	INSCRIPTIONAL_PARTHIAN = 189,
	INSCRIPTIONAL_PAHLAVI = 190,
	OLD_TURKIC = 191,
	RUMI_NUMERAL_SYMBOLS = 192,
	KAITHI = 193,
	EGYPTIAN_HIEROGLYPHS = 194,
	ENCLOSED_ALPHANUMERIC_SUPPLEMENT = 195,
	ENCLOSED_IDEOGRAPHIC_SUPPLEMENT = 196,
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_C = 197,
	MANDAIC = 198,
	BATAK = 199,
	ETHIOPIC_EXTENDED_A = 200,
	BRAHMI = 201,
	BAMUM_SUPPLEMENT = 202,
	KANA_SUPPLEMENT = 203,
	PLAYING_CARDS = 204,
	MISCELLANEOUS_SYMBOLS_AND_PICTOGRAPHS = 205,
	EMOTICONS = 206,
	TRANSPORT_AND_MAP_SYMBOLS = 207,
	ALCHEMICAL_SYMBOLS = 208,
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_D = 209,
	ARABIC_EXTENDED_A = 210,
	ARABIC_MATHEMATICAL_ALPHABETIC_SYMBOLS = 211,
	CHAKMA = 212,
	MEETEI_MAYEK_EXTENSIONS = 213,
	MEROITIC_CURSIVE = 214,
	MEROITIC_HIEROGLYPHS = 215,
	MIAO = 216,
	SHARADA = 217,
	SORA_SOMPENG = 218,
	SUNDANESE_SUPPLEMENT = 219,
	TAKRI = 220,
	BASSA_VAH = 221,
	CAUCASIAN_ALBANIAN = 222,
	COPTIC_EPACT_NUMBERS = 223,
	COMBINING_DIACRITICAL_MARKS_EXTENDED = 224,
	DUPLOYAN = 225,
	ELBASAN = 226,
	GEOMETRIC_SHAPES_EXTENDED = 227,
	GRANTHA = 228,
	KHOJKI = 229,
	KHUDAWADI = 230,
	LATIN_EXTENDED_E = 231,
	LINEAR_A = 232,
	MAHAJANI = 233,
	MANICHAEAN = 234,
	MENDE_KIKAKUI = 235,
	MODI = 236,
	MRO = 237,
	MYANMAR_EXTENDED_B = 238,
	NABATAEAN = 239,
	OLD_NORTH_ARABIAN = 240,
	OLD_PERMIC = 241,
	ORNAMENTAL_DINGBATS = 242,
	PAHAWH_HMONG = 243,
	PALMYRENE = 244,
	PAU_CIN_HAU = 245,
	PSALTER_PAHLAVI = 246,
	SHORTHAND_FORMAT_CONTROLS = 247,
	SIDDHAM = 248,
	SINHALA_ARCHAIC_NUMBERS = 249,
	SUPPLEMENTAL_ARROWS_C = 250,
	TIRHUTA = 251,
	WARANG_CITI = 252,
	AHOM = 253,
	ANATOLIAN_HIEROGLYPHS = 254,
	CHEROKEE_SUPPLEMENT = 255,
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_E = 256,
	EARLY_DYNASTIC_CUNEIFORM = 257,
	HATRAN = 258,
	MULTANI = 259,
	OLD_HUNGARIAN = 260,
	SUPPLEMENTAL_SYMBOLS_AND_PICTOGRAPHS = 261,
	SUTTON_SIGNWRITING = 262,
	ADLAM = 263,
	BHAIKSUKI = 264,
	CYRILLIC_EXTENDED_C = 265,
	GLAGOLITIC_SUPPLEMENT = 266,
	IDEOGRAPHIC_SYMBOLS_AND_PUNCTUATION = 267,
	MARCHEN = 268,
	MONGOLIAN_SUPPLEMENT = 269,
	NEWA = 270,
	OSAGE = 271,
	TANGUT = 272,
	TANGUT_COMPONENTS = 273,
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_F = 274,
	KANA_EXTENDED_A = 275,
	MASARAM_GONDI = 276,
	NUSHU = 277,
	SOYOMBO = 278,
	SYRIAC_SUPPLEMENT = 279,
	ZANABAZAR_SQUARE = 280,
	CHESS_SYMBOLS = 281,
	DOGRA = 282,
	GEORGIAN_EXTENDED = 283,
	GUNJALA_GONDI = 284,
	HANIFI_ROHINGYA = 285,
	INDIC_SIYAQ_NUMBERS = 286,
	MAKASAR = 287,
	MAYAN_NUMERALS = 288,
	MEDEFAIDRIN = 289,
	OLD_SOGDIAN = 290,
	SOGDIAN = 291,
	EGYPTIAN_HIEROGLYPH_FORMAT_CONTROLS = 292,
	ELYMAIC = 293,
	NANDINAGARI = 294,
	NYIAKENG_PUACHUE_HMONG = 295,
	OTTOMAN_SIYAQ_NUMBERS = 296,
	SMALL_KANA_EXTENSION = 297,
	SYMBOLS_AND_PICTOGRAPHS_EXTENDED_A = 298,
	TAMIL_SUPPLEMENT = 299,
	WANCHO = 300,
	CHORASMIAN = 301,
	CJK_UNIFIED_IDEOGRAPHS_EXTENSION_G = 302,
	DIVES_AKURU = 303,
	KHITAN_SMALL_SCRIPT = 304,
	LISU_SUPPLEMENT = 305,
	SYMBOLS_FOR_LEGACY_COMPUTING = 306,
	TANGUT_SUPPLEMENT = 307,
	YEZIDI = 308,
	INVALID_CODE = -1,
}

UBreakIterator :: int

UBreakIteratorType :: enum i32 {
	CHARACTER = 0,
	WORD = 1,
	LINE = 2,
	SENTENCE = 3,
}

UCalendarAMPMs :: enum i32 {
	AM = 0,
	PM = 1,
}

UCalendarAttribute :: enum i32 {
	LENIENT = 0,
	FIRST_DAY_OF_WEEK = 1,
	MINIMAL_DAYS_IN_FIRST_WEEK = 2,
	REPEATED_WALL_TIME = 3,
	SKIPPED_WALL_TIME = 4,
}

UCalendarDateFields :: enum i32 {
	ERA = 0,
	YEAR = 1,
	MONTH = 2,
	WEEK_OF_YEAR = 3,
	WEEK_OF_MONTH = 4,
	DATE = 5,
	DAY_OF_YEAR = 6,
	DAY_OF_WEEK = 7,
	DAY_OF_WEEK_IN_MONTH = 8,
	AM_PM = 9,
	HOUR = 10,
	HOUR_OF_DAY = 11,
	MINUTE = 12,
	SECOND = 13,
	MILLISECOND = 14,
	ZONE_OFFSET = 15,
	DST_OFFSET = 16,
	YEAR_WOY = 17,
	DOW_LOCAL = 18,
	EXTENDED_YEAR = 19,
	JULIAN_DAY = 20,
	MILLISECONDS_IN_DAY = 21,
	IS_LEAP_MONTH = 22,
	FIELD_COUNT = 23,
	DAY_OF_MONTH = 5,
}

UCalendarDaysOfWeek :: enum i32 {
	SUNDAY = 1,
	MONDAY = 2,
	TUESDAY = 3,
	WEDNESDAY = 4,
	THURSDAY = 5,
	FRIDAY = 6,
	SATURDAY = 7,
}

UCalendarDisplayNameType :: enum i32 {
	STANDARD = 0,
	SHORT_STANDARD = 1,
	DST = 2,
	SHORT_DST = 3,
}

UCalendarLimitType :: enum i32 {
	MINIMUM = 0,
	MAXIMUM = 1,
	GREATEST_MINIMUM = 2,
	LEAST_MAXIMUM = 3,
	ACTUAL_MINIMUM = 4,
	ACTUAL_MAXIMUM = 5,
}

UCalendarMonths :: enum i32 {
	JANUARY = 0,
	FEBRUARY = 1,
	MARCH = 2,
	APRIL = 3,
	MAY = 4,
	JUNE = 5,
	JULY = 6,
	AUGUST = 7,
	SEPTEMBER = 8,
	OCTOBER = 9,
	NOVEMBER = 10,
	DECEMBER = 11,
	UNDECIMBER = 12,
}

UCalendarType :: enum i32 {
	TRADITIONAL = 0,
	DEFAULT = 0,
	GREGORIAN = 1,
}

UCalendarWallTimeOption :: enum i32 {
	LAST = 0,
	FIRST = 1,
	NEXT_VALID = 2,
}

UCalendarWeekdayType :: enum i32 {
	WEEKDAY = 0,
	WEEKEND = 1,
	WEEKEND_ONSET = 2,
	WEEKEND_CEASE = 3,
}

UCaseMap :: int

UCharCategory :: enum i32 {
	UNASSIGNED = 0,
	GENERAL_OTHER_TYPES = 0,
	UPPERCASE_LETTER = 1,
	LOWERCASE_LETTER = 2,
	TITLECASE_LETTER = 3,
	MODIFIER_LETTER = 4,
	OTHER_LETTER = 5,
	NON_SPACING_MARK = 6,
	ENCLOSING_MARK = 7,
	COMBINING_SPACING_MARK = 8,
	DECIMAL_DIGIT_NUMBER = 9,
	LETTER_NUMBER = 10,
	OTHER_NUMBER = 11,
	SPACE_SEPARATOR = 12,
	LINE_SEPARATOR = 13,
	PARAGRAPH_SEPARATOR = 14,
	CONTROL_CHAR = 15,
	FORMAT_CHAR = 16,
	PRIVATE_USE_CHAR = 17,
	SURROGATE = 18,
	DASH_PUNCTUATION = 19,
	START_PUNCTUATION = 20,
	END_PUNCTUATION = 21,
	CONNECTOR_PUNCTUATION = 22,
	OTHER_PUNCTUATION = 23,
	MATH_SYMBOL = 24,
	CURRENCY_SYMBOL = 25,
	MODIFIER_SYMBOL = 26,
	OTHER_SYMBOL = 27,
	INITIAL_PUNCTUATION = 28,
	FINAL_PUNCTUATION = 29,
	CHAR_CATEGORY_COUNT = 30,
}

UCharDirection :: enum i32 {
	LEFT_TO_RIGHT = 0,
	RIGHT_TO_LEFT = 1,
	EUROPEAN_NUMBER = 2,
	EUROPEAN_NUMBER_SEPARATOR = 3,
	EUROPEAN_NUMBER_TERMINATOR = 4,
	ARABIC_NUMBER = 5,
	COMMON_NUMBER_SEPARATOR = 6,
	BLOCK_SEPARATOR = 7,
	SEGMENT_SEPARATOR = 8,
	WHITE_SPACE_NEUTRAL = 9,
	OTHER_NEUTRAL = 10,
	LEFT_TO_RIGHT_EMBEDDING = 11,
	LEFT_TO_RIGHT_OVERRIDE = 12,
	RIGHT_TO_LEFT_ARABIC = 13,
	RIGHT_TO_LEFT_EMBEDDING = 14,
	RIGHT_TO_LEFT_OVERRIDE = 15,
	POP_DIRECTIONAL_FORMAT = 16,
	DIR_NON_SPACING_MARK = 17,
	BOUNDARY_NEUTRAL = 18,
	FIRST_STRONG_ISOLATE = 19,
	LEFT_TO_RIGHT_ISOLATE = 20,
	RIGHT_TO_LEFT_ISOLATE = 21,
	POP_DIRECTIONAL_ISOLATE = 22,
}

UCharEnumTypeRange :: #type proc "c" (_context: rawptr, start: i32, limit: i32, type: UCharCategory) -> i8

UCharIterator :: struct {
	_context: rawptr,
	length: i32,
	start: i32,
	index: i32,
	limit: i32,
	reservedField: i32,
	getIndex: UCharIteratorGetIndex,
	move: UCharIteratorMove,
	hasNext: UCharIteratorHasNext,
	hasPrevious: UCharIteratorHasPrevious,
	current: UCharIteratorCurrent,
	next: UCharIteratorNext,
	previous: UCharIteratorPrevious,
	reservedFn: UCharIteratorReserved,
	getState: UCharIteratorGetState,
	setState: UCharIteratorSetState,
}

UCharIteratorCurrent :: #type proc "c" (iter: ^UCharIterator) -> i32

UCharIteratorGetIndex :: #type proc "c" (iter: ^UCharIterator, origin: UCharIteratorOrigin) -> i32

UCharIteratorGetState :: #type proc "c" (#by_ptr iter: UCharIterator) -> u32

UCharIteratorHasNext :: #type proc "c" (iter: ^UCharIterator) -> i8

UCharIteratorHasPrevious :: #type proc "c" (iter: ^UCharIterator) -> i8

UCharIteratorMove :: #type proc "c" (iter: ^UCharIterator, delta: i32, origin: UCharIteratorOrigin) -> i32

UCharIteratorNext :: #type proc "c" (iter: ^UCharIterator) -> i32

UCharIteratorOrigin :: enum i32 {
	START = 0,
	CURRENT = 1,
	LIMIT = 2,
	ZERO = 3,
	LENGTH = 4,
}

UCharIteratorPrevious :: #type proc "c" (iter: ^UCharIterator) -> i32

UCharIteratorReserved :: #type proc "c" (iter: ^UCharIterator, something: i32) -> i32

UCharIteratorSetState :: #type proc "c" (iter: ^UCharIterator, state: u32, pErrorCode: ^UErrorCode)

UCharNameChoice :: enum i32 {
	UNICODE_CHAR_NAME = 0,
	EXTENDED_CHAR_NAME = 2,
	CHAR_NAME_ALIAS = 3,
}

UCharsetDetector :: int

UCharsetMatch :: int

UColAttribute :: enum i32 {
	FRENCH_COLLATION = 0,
	ALTERNATE_HANDLING = 1,
	CASE_FIRST = 2,
	CASE_LEVEL = 3,
	NORMALIZATION_MODE = 4,
	DECOMPOSITION_MODE = 4,
	STRENGTH = 5,
	NUMERIC_COLLATION = 7,
	ATTRIBUTE_COUNT = 8,
}

UColAttributeValue :: enum i32 {
	DEFAULT = -1,
	PRIMARY = 0,
	SECONDARY = 1,
	TERTIARY = 2,
	DEFAULT_STRENGTH = 2,
	CE_STRENGTH_LIMIT = 3,
	QUATERNARY = 3,
	IDENTICAL = 15,
	STRENGTH_LIMIT = 16,
	OFF = 16,
	ON = 17,
	SHIFTED = 20,
	NON_IGNORABLE = 21,
	LOWER_FIRST = 24,
	UPPER_FIRST = 25,
}

UColBoundMode :: enum i32 {
	LOWER = 0,
	UPPER = 1,
	UPPER_LONG = 2,
}

UCollationElements :: int

UCollationResult :: enum i32 {
	EQUAL = 0,
	GREATER = 1,
	LESS = -1,
}

UCollator :: int

UColReorderCode :: enum i32 {
	DEFAULT = -1,
	NONE = 103,
	OTHERS = 103,
	SPACE = 4096,
	FIRST = 4096,
	PUNCTUATION = 4097,
	SYMBOL = 4098,
	CURRENCY = 4099,
	DIGIT = 4100,
}

UColRuleOption :: enum i32 {
	TAILORING_ONLY = 0,
	FULL_RULES = 1,
}

UConstrainedFieldPosition :: int

UConverter :: int

UConverterCallbackReason :: enum i32 {
	UNASSIGNED = 0,
	ILLEGAL = 1,
	IRREGULAR = 2,
	RESET = 3,
	CLOSE = 4,
	CLONE = 5,
}

UConverterFromUCallback :: #type proc "c" (
	_context: rawptr,
	args: ^UConverterFromUnicodeArgs,
	codeUnits: ^u16,
	length: i32,
	codePoint: i32,
	reason: UConverterCallbackReason,
	pErrorCode: ^UErrorCode,
)

UConverterFromUnicodeArgs :: struct {
	size: u16,
	flush: i8,
	converter: ^UConverter,
	source: ^u16,
	sourceLimit: ^u16,
	target: PSTR,
	targetLimit: PSTR,
	offsets: ^i32,
}

UConverterPlatform :: enum i32 {
	UNKNOWN = -1,
	IBM = 0,
}

UConverterSelector :: int

UConverterToUCallback :: #type proc "c" (
	_context: rawptr,
	args: ^UConverterToUnicodeArgs,
	codeUnits: PSTR,
	length: i32,
	reason: UConverterCallbackReason,
	pErrorCode: ^UErrorCode,
)

UConverterToUnicodeArgs :: struct {
	size: u16,
	flush: i8,
	converter: ^UConverter,
	source: PSTR,
	sourceLimit: PSTR,
	target: ^u16,
	targetLimit: ^u16,
	offsets: ^i32,
}

UConverterType :: enum i32 {
	UNSUPPORTED_CONVERTER = -1,
	SBCS = 0,
	DBCS = 1,
	MBCS = 2,
	LATIN_1 = 3,
	UTF8 = 4,
	UTF16_BigEndian = 5,
	UTF16_LittleEndian = 6,
	UTF32_BigEndian = 7,
	UTF32_LittleEndian = 8,
	EBCDIC_STATEFUL = 9,
	ISO_2022 = 10,
	LMBCS_1 = 11,
	LMBCS_2 = 12,
	LMBCS_3 = 13,
	LMBCS_4 = 14,
	LMBCS_5 = 15,
	LMBCS_6 = 16,
	LMBCS_8 = 17,
	LMBCS_11 = 18,
	LMBCS_16 = 19,
	LMBCS_17 = 20,
	LMBCS_18 = 21,
	LMBCS_19 = 22,
	LMBCS_LAST = 22,
	HZ = 23,
	SCSU = 24,
	ISCII = 25,
	US_ASCII = 26,
	UTF7 = 27,
	BOCU1 = 28,
	UTF16 = 29,
	UTF32 = 30,
	CESU8 = 31,
	IMAP_MAILBOX = 32,
	COMPOUND_TEXT = 33,
	NUMBER_OF_SUPPORTED_CONVERTER_TYPES = 34,
}

UConverterUnicodeSet :: enum i32 {
	SET = 0,
	AND_FALLBACK_SET = 1,
}

UCPMap :: int

UCPMapRangeOption :: enum i32 {
	NORMAL = 0,
	FIXED_LEAD_SURROGATES = 1,
	FIXED_ALL_SURROGATES = 2,
}

UCPMapValueFilter :: #type proc "c" (_context: rawptr, value: u32) -> u32

UCPTrie :: struct {
	index: ^u16,
	data: UCPTrieData,
	indexLength: i32,
	dataLength: i32,
	highStart: i32,
	shifted12HighStart: u16,
	type: i8,
	valueWidth: i8,
	reserved32: u32,
	reserved16: u16,
	index3NullOffset: u16,
	dataNullOffset: i32,
	nullValue: u32,
}

UCPTrieData :: struct #raw_union {
	ptr0: rawptr,
	ptr16: ^u16,
	ptr32: ^u32,
	ptr8: ^u8,
}

UCPTrieType :: enum i32 {
	ANY = -1,
	FAST = 0,
	SMALL = 1,
}

UCPTrieValueWidth :: enum i32 {
	ANY = -1,
	_16 = 0,
	_32 = 1,
	_8 = 2,
}

UCurrCurrencyType :: enum i32 {
	ALL = 2147483647,
	COMMON = 1,
	UNCOMMON = 2,
	DEPRECATED = 4,
	NON_DEPRECATED = 8,
}

UCurrencySpacing :: enum i32 {
	MATCH = 0,
	SURROUNDING_MATCH = 1,
	INSERT = 2,
	SPACING_COUNT = 3,
}

UCurrencyUsage :: enum i32 {
	STANDARD = 0,
	CASH = 1,
}

UCurrNameStyle :: enum i32 {
	SYMBOL_NAME = 0,
	LONG_NAME = 1,
	NARROW_SYMBOL_NAME = 2,
}

UDateAbsoluteUnit :: enum i32 {
	SUNDAY = 0,
	MONDAY = 1,
	TUESDAY = 2,
	WEDNESDAY = 3,
	THURSDAY = 4,
	FRIDAY = 5,
	SATURDAY = 6,
	DAY = 7,
	WEEK = 8,
	MONTH = 9,
	YEAR = 10,
	NOW = 11,
	UNIT_COUNT = 12,
}

UDateDirection :: enum i32 {
	LAST_2 = 0,
	LAST = 1,
	THIS = 2,
	NEXT = 3,
	NEXT_2 = 4,
	PLAIN = 5,
	COUNT = 6,
}

UDateFormatBooleanAttribute :: enum i32 {
	PARSE_ALLOW_WHITESPACE = 0,
	PARSE_ALLOW_NUMERIC = 1,
	PARSE_PARTIAL_LITERAL_MATCH = 2,
	PARSE_MULTIPLE_PATTERNS_FOR_MATCH = 3,
	BOOLEAN_ATTRIBUTE_COUNT = 4,
}

UDateFormatField :: enum i32 {
	ERA_FIELD = 0,
	YEAR_FIELD = 1,
	MONTH_FIELD = 2,
	DATE_FIELD = 3,
	HOUR_OF_DAY1_FIELD = 4,
	HOUR_OF_DAY0_FIELD = 5,
	MINUTE_FIELD = 6,
	SECOND_FIELD = 7,
	FRACTIONAL_SECOND_FIELD = 8,
	DAY_OF_WEEK_FIELD = 9,
	DAY_OF_YEAR_FIELD = 10,
	DAY_OF_WEEK_IN_MONTH_FIELD = 11,
	WEEK_OF_YEAR_FIELD = 12,
	WEEK_OF_MONTH_FIELD = 13,
	AM_PM_FIELD = 14,
	HOUR1_FIELD = 15,
	HOUR0_FIELD = 16,
	TIMEZONE_FIELD = 17,
	YEAR_WOY_FIELD = 18,
	DOW_LOCAL_FIELD = 19,
	EXTENDED_YEAR_FIELD = 20,
	JULIAN_DAY_FIELD = 21,
	MILLISECONDS_IN_DAY_FIELD = 22,
	TIMEZONE_RFC_FIELD = 23,
	TIMEZONE_GENERIC_FIELD = 24,
	STANDALONE_DAY_FIELD = 25,
	STANDALONE_MONTH_FIELD = 26,
	QUARTER_FIELD = 27,
	STANDALONE_QUARTER_FIELD = 28,
	TIMEZONE_SPECIAL_FIELD = 29,
	YEAR_NAME_FIELD = 30,
	TIMEZONE_LOCALIZED_GMT_OFFSET_FIELD = 31,
	TIMEZONE_ISO_FIELD = 32,
	TIMEZONE_ISO_LOCAL_FIELD = 33,
	AM_PM_MIDNIGHT_NOON_FIELD = 35,
	FLEXIBLE_DAY_PERIOD_FIELD = 36,
}

UDateFormatStyle :: enum i32 {
	FULL = 0,
	LONG = 1,
	MEDIUM = 2,
	SHORT = 3,
	DEFAULT = 2,
	RELATIVE = 128,
	FULL_RELATIVE = 128,
	LONG_RELATIVE = 129,
	MEDIUM_RELATIVE = 130,
	SHORT_RELATIVE = 131,
	NONE = -1,
	PATTERN = -2,
}

UDateFormatSymbols :: int

UDateFormatSymbolType :: enum i32 {
	ERAS = 0,
	MONTHS = 1,
	SHORT_MONTHS = 2,
	WEEKDAYS = 3,
	SHORT_WEEKDAYS = 4,
	AM_PMS = 5,
	LOCALIZED_CHARS = 6,
	ERA_NAMES = 7,
	NARROW_MONTHS = 8,
	NARROW_WEEKDAYS = 9,
	STANDALONE_MONTHS = 10,
	STANDALONE_SHORT_MONTHS = 11,
	STANDALONE_NARROW_MONTHS = 12,
	STANDALONE_WEEKDAYS = 13,
	STANDALONE_SHORT_WEEKDAYS = 14,
	STANDALONE_NARROW_WEEKDAYS = 15,
	QUARTERS = 16,
	SHORT_QUARTERS = 17,
	STANDALONE_QUARTERS = 18,
	STANDALONE_SHORT_QUARTERS = 19,
	SHORTER_WEEKDAYS = 20,
	STANDALONE_SHORTER_WEEKDAYS = 21,
	CYCLIC_YEARS_WIDE = 22,
	CYCLIC_YEARS_ABBREVIATED = 23,
	CYCLIC_YEARS_NARROW = 24,
	ZODIAC_NAMES_WIDE = 25,
	ZODIAC_NAMES_ABBREVIATED = 26,
	ZODIAC_NAMES_NARROW = 27,
}

UDateIntervalFormat :: int

UDateRelativeDateTimeFormatterStyle :: enum i32 {
	LONG = 0,
	SHORT = 1,
	NARROW = 2,
}

UDateRelativeUnit :: enum i32 {
	SECONDS = 0,
	MINUTES = 1,
	HOURS = 2,
	DAYS = 3,
	WEEKS = 4,
	MONTHS = 5,
	YEARS = 6,
	UNIT_COUNT = 7,
}

UDateTimePatternConflict :: enum i32 {
	NO_CONFLICT = 0,
	BASE_CONFLICT = 1,
	CONFLICT = 2,
}

UDateTimePatternField :: enum i32 {
	ERA_FIELD = 0,
	YEAR_FIELD = 1,
	QUARTER_FIELD = 2,
	MONTH_FIELD = 3,
	WEEK_OF_YEAR_FIELD = 4,
	WEEK_OF_MONTH_FIELD = 5,
	WEEKDAY_FIELD = 6,
	DAY_OF_YEAR_FIELD = 7,
	DAY_OF_WEEK_IN_MONTH_FIELD = 8,
	DAY_FIELD = 9,
	DAYPERIOD_FIELD = 10,
	HOUR_FIELD = 11,
	MINUTE_FIELD = 12,
	SECOND_FIELD = 13,
	FRACTIONAL_SECOND_FIELD = 14,
	ZONE_FIELD = 15,
	FIELD_COUNT = 16,
}

UDateTimePatternMatchOptions :: enum i32 {
	NO_OPTIONS = 0,
	HOUR_FIELD_LENGTH = 2048,
	ALL_FIELDS_LENGTH = 65535,
}

UDateTimePGDisplayWidth :: enum i32 {
	WIDE = 0,
	ABBREVIATED = 1,
	NARROW = 2,
}

UDateTimeScale :: enum i32 {
	JAVA_TIME = 0,
	UNIX_TIME = 1,
	ICU4C_TIME = 2,
	WINDOWS_FILE_TIME = 3,
	DOTNET_DATE_TIME = 4,
	MAC_OLD_TIME = 5,
	MAC_TIME = 6,
	EXCEL_TIME = 7,
	DB2_TIME = 8,
	UNIX_MICROSECONDS_TIME = 9,
}

UDecompositionType :: enum i32 {
	NONE = 0,
	CANONICAL = 1,
	COMPAT = 2,
	CIRCLE = 3,
	FINAL = 4,
	FONT = 5,
	FRACTION = 6,
	INITIAL = 7,
	ISOLATED = 8,
	MEDIAL = 9,
	NARROW = 10,
	NOBREAK = 11,
	SMALL = 12,
	SQUARE = 13,
	SUB = 14,
	SUPER = 15,
	VERTICAL = 16,
	WIDE = 17,
}

UDialectHandling :: enum i32 {
	STANDARD_NAMES = 0,
	DIALECT_NAMES = 1,
}

UDisplayContext :: enum i32 {
	STANDARD_NAMES = 0,
	DIALECT_NAMES = 1,
	CAPITALIZATION_NONE = 256,
	CAPITALIZATION_FOR_MIDDLE_OF_SENTENCE = 257,
	CAPITALIZATION_FOR_BEGINNING_OF_SENTENCE = 258,
	CAPITALIZATION_FOR_UI_LIST_OR_MENU = 259,
	CAPITALIZATION_FOR_STANDALONE = 260,
	LENGTH_FULL = 512,
	LENGTH_SHORT = 513,
	SUBSTITUTE = 768,
	NO_SUBSTITUTE = 769,
}

UDisplayContextType :: enum i32 {
	DIALECT_HANDLING = 0,
	CAPITALIZATION = 1,
	DISPLAY_LENGTH = 2,
	SUBSTITUTE_HANDLING = 3,
}

UEastAsianWidth :: enum i32 {
	NEUTRAL = 0,
	AMBIGUOUS = 1,
	HALFWIDTH = 2,
	FULLWIDTH = 3,
	NARROW = 4,
	WIDE = 5,
}

UEnumCharNamesFn :: #type proc "c" (_context: rawptr, code: i32, nameChoice: UCharNameChoice, name: PSTR, length: i32) -> i8

UEnumeration :: int

UErrorCode :: enum i32 {
	USING_FALLBACK_WARNING = -128,
	ERROR_WARNING_START = -128,
	USING_DEFAULT_WARNING = -127,
	SAFECLONE_ALLOCATED_WARNING = -126,
	STATE_OLD_WARNING = -125,
	STRING_NOT_TERMINATED_WARNING = -124,
	SORT_KEY_TOO_SHORT_WARNING = -123,
	AMBIGUOUS_ALIAS_WARNING = -122,
	DIFFERENT_UCA_VERSION = -121,
	PLUGIN_CHANGED_LEVEL_WARNING = -120,
	ZERO_ERROR = 0,
	ILLEGAL_ARGUMENT_ERROR = 1,
	MISSING_RESOURCE_ERROR = 2,
	INVALID_FORMAT_ERROR = 3,
	FILE_ACCESS_ERROR = 4,
	INTERNAL_PROGRAM_ERROR = 5,
	MESSAGE_PARSE_ERROR = 6,
	MEMORY_ALLOCATION_ERROR = 7,
	INDEX_OUTOFBOUNDS_ERROR = 8,
	PARSE_ERROR = 9,
	INVALID_CHAR_FOUND = 10,
	TRUNCATED_CHAR_FOUND = 11,
	ILLEGAL_CHAR_FOUND = 12,
	INVALID_TABLE_FORMAT = 13,
	INVALID_TABLE_FILE = 14,
	BUFFER_OVERFLOW_ERROR = 15,
	UNSUPPORTED_ERROR = 16,
	RESOURCE_TYPE_MISMATCH = 17,
	ILLEGAL_ESCAPE_SEQUENCE = 18,
	UNSUPPORTED_ESCAPE_SEQUENCE = 19,
	NO_SPACE_AVAILABLE = 20,
	CE_NOT_FOUND_ERROR = 21,
	PRIMARY_TOO_LONG_ERROR = 22,
	STATE_TOO_OLD_ERROR = 23,
	TOO_MANY_ALIASES_ERROR = 24,
	ENUM_OUT_OF_SYNC_ERROR = 25,
	INVARIANT_CONVERSION_ERROR = 26,
	INVALID_STATE_ERROR = 27,
	COLLATOR_VERSION_MISMATCH = 28,
	USELESS_COLLATOR_ERROR = 29,
	NO_WRITE_PERMISSION = 30,
	BAD_VARIABLE_DEFINITION = 65536,
	PARSE_ERROR_START = 65536,
	MALFORMED_RULE = 65537,
	MALFORMED_SET = 65538,
	MALFORMED_SYMBOL_REFERENCE = 65539,
	MALFORMED_UNICODE_ESCAPE = 65540,
	MALFORMED_VARIABLE_DEFINITION = 65541,
	MALFORMED_VARIABLE_REFERENCE = 65542,
	MISMATCHED_SEGMENT_DELIMITERS = 65543,
	MISPLACED_ANCHOR_START = 65544,
	MISPLACED_CURSOR_OFFSET = 65545,
	MISPLACED_QUANTIFIER = 65546,
	MISSING_OPERATOR = 65547,
	MISSING_SEGMENT_CLOSE = 65548,
	MULTIPLE_ANTE_CONTEXTS = 65549,
	MULTIPLE_CURSORS = 65550,
	MULTIPLE_POST_CONTEXTS = 65551,
	TRAILING_BACKSLASH = 65552,
	UNDEFINED_SEGMENT_REFERENCE = 65553,
	UNDEFINED_VARIABLE = 65554,
	UNQUOTED_SPECIAL = 65555,
	UNTERMINATED_QUOTE = 65556,
	RULE_MASK_ERROR = 65557,
	MISPLACED_COMPOUND_FILTER = 65558,
	MULTIPLE_COMPOUND_FILTERS = 65559,
	INVALID_RBT_SYNTAX = 65560,
	INVALID_PROPERTY_PATTERN = 65561,
	MALFORMED_PRAGMA = 65562,
	UNCLOSED_SEGMENT = 65563,
	ILLEGAL_CHAR_IN_SEGMENT = 65564,
	VARIABLE_RANGE_EXHAUSTED = 65565,
	VARIABLE_RANGE_OVERLAP = 65566,
	ILLEGAL_CHARACTER = 65567,
	INTERNAL_TRANSLITERATOR_ERROR = 65568,
	INVALID_ID = 65569,
	INVALID_FUNCTION = 65570,
	UNEXPECTED_TOKEN = 65792,
	FMT_PARSE_ERROR_START = 65792,
	MULTIPLE_DECIMAL_SEPARATORS = 65793,
	MULTIPLE_DECIMAL_SEPERATORS = 65793,
	MULTIPLE_EXPONENTIAL_SYMBOLS = 65794,
	MALFORMED_EXPONENTIAL_PATTERN = 65795,
	MULTIPLE_PERCENT_SYMBOLS = 65796,
	MULTIPLE_PERMILL_SYMBOLS = 65797,
	MULTIPLE_PAD_SPECIFIERS = 65798,
	PATTERN_SYNTAX_ERROR = 65799,
	ILLEGAL_PAD_POSITION = 65800,
	UNMATCHED_BRACES = 65801,
	UNSUPPORTED_PROPERTY = 65802,
	UNSUPPORTED_ATTRIBUTE = 65803,
	ARGUMENT_TYPE_MISMATCH = 65804,
	DUPLICATE_KEYWORD = 65805,
	UNDEFINED_KEYWORD = 65806,
	DEFAULT_KEYWORD_MISSING = 65807,
	DECIMAL_NUMBER_SYNTAX_ERROR = 65808,
	FORMAT_INEXACT_ERROR = 65809,
	NUMBER_ARG_OUTOFBOUNDS_ERROR = 65810,
	NUMBER_SKELETON_SYNTAX_ERROR = 65811,
	BRK_INTERNAL_ERROR = 66048,
	BRK_ERROR_START = 66048,
	BRK_HEX_DIGITS_EXPECTED = 66049,
	BRK_SEMICOLON_EXPECTED = 66050,
	BRK_RULE_SYNTAX = 66051,
	BRK_UNCLOSED_SET = 66052,
	BRK_ASSIGN_ERROR = 66053,
	BRK_VARIABLE_REDFINITION = 66054,
	BRK_MISMATCHED_PAREN = 66055,
	BRK_NEW_LINE_IN_QUOTED_STRING = 66056,
	BRK_UNDEFINED_VARIABLE = 66057,
	BRK_INIT_ERROR = 66058,
	BRK_RULE_EMPTY_SET = 66059,
	BRK_UNRECOGNIZED_OPTION = 66060,
	BRK_MALFORMED_RULE_TAG = 66061,
	REGEX_INTERNAL_ERROR = 66304,
	REGEX_ERROR_START = 66304,
	REGEX_RULE_SYNTAX = 66305,
	REGEX_INVALID_STATE = 66306,
	REGEX_BAD_ESCAPE_SEQUENCE = 66307,
	REGEX_PROPERTY_SYNTAX = 66308,
	REGEX_UNIMPLEMENTED = 66309,
	REGEX_MISMATCHED_PAREN = 66310,
	REGEX_NUMBER_TOO_BIG = 66311,
	REGEX_BAD_INTERVAL = 66312,
	REGEX_MAX_LT_MIN = 66313,
	REGEX_INVALID_BACK_REF = 66314,
	REGEX_INVALID_FLAG = 66315,
	REGEX_LOOK_BEHIND_LIMIT = 66316,
	REGEX_SET_CONTAINS_STRING = 66317,
	REGEX_MISSING_CLOSE_BRACKET = 66319,
	REGEX_INVALID_RANGE = 66320,
	REGEX_STACK_OVERFLOW = 66321,
	REGEX_TIME_OUT = 66322,
	REGEX_STOPPED_BY_CALLER = 66323,
	REGEX_PATTERN_TOO_BIG = 66324,
	REGEX_INVALID_CAPTURE_GROUP_NAME = 66325,
	IDNA_PROHIBITED_ERROR = 66560,
	IDNA_ERROR_START = 66560,
	IDNA_UNASSIGNED_ERROR = 66561,
	IDNA_CHECK_BIDI_ERROR = 66562,
	IDNA_STD3_ASCII_RULES_ERROR = 66563,
	IDNA_ACE_PREFIX_ERROR = 66564,
	IDNA_VERIFICATION_ERROR = 66565,
	IDNA_LABEL_TOO_LONG_ERROR = 66566,
	IDNA_ZERO_LENGTH_LABEL_ERROR = 66567,
	IDNA_DOMAIN_NAME_TOO_LONG_ERROR = 66568,
	STRINGPREP_PROHIBITED_ERROR = 66560,
	STRINGPREP_UNASSIGNED_ERROR = 66561,
	STRINGPREP_CHECK_BIDI_ERROR = 66562,
	PLUGIN_ERROR_START = 66816,
	PLUGIN_TOO_HIGH = 66816,
	PLUGIN_DIDNT_SET_LEVEL = 66817,
}

UFieldCategory :: enum i32 {
	UNDEFINED = 0,
	DATE = 1,
	NUMBER = 2,
	LIST = 3,
	RELATIVE_DATETIME = 4,
	DATE_INTERVAL = 5,
	LIST_SPAN = 4099,
	DATE_INTERVAL_SPAN = 4101,
}

UFieldPosition :: struct {
	field: i32,
	beginIndex: i32,
	endIndex: i32,
}

UFieldPositionIterator :: int

UFormattableType :: enum i32 {
	DATE = 0,
	DOUBLE = 1,
	LONG = 2,
	STRING = 3,
	ARRAY = 4,
	INT64 = 5,
	OBJECT = 6,
}

UFormattedDateInterval :: int

UFormattedList :: int

UFormattedNumber :: int

UFormattedNumberRange :: int

UFormattedRelativeDateTime :: int

UFormattedValue :: int

UGender :: enum i32 {
	MALE = 0,
	FEMALE = 1,
	OTHER = 2,
}

UGenderInfo :: int

UGraphemeClusterBreak :: enum i32 {
	OTHER = 0,
	CONTROL = 1,
	CR = 2,
	EXTEND = 3,
	L = 4,
	LF = 5,
	LV = 6,
	LVT = 7,
	T = 8,
	V = 9,
	SPACING_MARK = 10,
	PREPEND = 11,
	REGIONAL_INDICATOR = 12,
	E_BASE = 13,
	E_BASE_GAZ = 14,
	E_MODIFIER = 15,
	GLUE_AFTER_ZWJ = 16,
	ZWJ = 17,
}

UHangulSyllableType :: enum i32 {
	NOT_APPLICABLE = 0,
	LEADING_JAMO = 1,
	VOWEL_JAMO = 2,
	TRAILING_JAMO = 3,
	LV_SYLLABLE = 4,
	LVT_SYLLABLE = 5,
}

UHashtable :: int

UIDNA :: int

UIDNAInfo :: struct {
	size: i16,
	isTransitionalDifferent: i8,
	reservedB3: i8,
	errors: u32,
	reservedI2: i32,
	reservedI3: i32,
}

UILANGUAGE_ENUMPROCA :: #type proc "system" (param0: PSTR, param1: int) -> BOOL

UILANGUAGE_ENUMPROCW :: #type proc "system" (param0: PWSTR, param1: int) -> BOOL

UIndicPositionalCategory :: enum i32 {
	NA = 0,
	BOTTOM = 1,
	BOTTOM_AND_LEFT = 2,
	BOTTOM_AND_RIGHT = 3,
	LEFT = 4,
	LEFT_AND_RIGHT = 5,
	OVERSTRUCK = 6,
	RIGHT = 7,
	TOP = 8,
	TOP_AND_BOTTOM = 9,
	TOP_AND_BOTTOM_AND_RIGHT = 10,
	TOP_AND_LEFT = 11,
	TOP_AND_LEFT_AND_RIGHT = 12,
	TOP_AND_RIGHT = 13,
	VISUAL_ORDER_LEFT = 14,
	TOP_AND_BOTTOM_AND_LEFT = 15,
}

UIndicSyllabicCategory :: enum i32 {
	OTHER = 0,
	AVAGRAHA = 1,
	BINDU = 2,
	BRAHMI_JOINING_NUMBER = 3,
	CANTILLATION_MARK = 4,
	CONSONANT = 5,
	CONSONANT_DEAD = 6,
	CONSONANT_FINAL = 7,
	CONSONANT_HEAD_LETTER = 8,
	CONSONANT_INITIAL_POSTFIXED = 9,
	CONSONANT_KILLER = 10,
	CONSONANT_MEDIAL = 11,
	CONSONANT_PLACEHOLDER = 12,
	CONSONANT_PRECEDING_REPHA = 13,
	CONSONANT_PREFIXED = 14,
	CONSONANT_SUBJOINED = 15,
	CONSONANT_SUCCEEDING_REPHA = 16,
	CONSONANT_WITH_STACKER = 17,
	GEMINATION_MARK = 18,
	INVISIBLE_STACKER = 19,
	JOINER = 20,
	MODIFYING_LETTER = 21,
	NON_JOINER = 22,
	NUKTA = 23,
	NUMBER = 24,
	NUMBER_JOINER = 25,
	PURE_KILLER = 26,
	REGISTER_SHIFTER = 27,
	SYLLABLE_MODIFIER = 28,
	TONE_LETTER = 29,
	TONE_MARK = 30,
	VIRAMA = 31,
	VISARGA = 32,
	VOWEL = 33,
	VOWEL_DEPENDENT = 34,
	VOWEL_INDEPENDENT = 35,
}

UJoiningGroup :: enum i32 {
	NO_JOINING_GROUP = 0,
	AIN = 1,
	ALAPH = 2,
	ALEF = 3,
	BEH = 4,
	BETH = 5,
	DAL = 6,
	DALATH_RISH = 7,
	E = 8,
	FEH = 9,
	FINAL_SEMKATH = 10,
	GAF = 11,
	GAMAL = 12,
	HAH = 13,
	TEH_MARBUTA_GOAL = 14,
	HAMZA_ON_HEH_GOAL = 14,
	HE = 15,
	HEH = 16,
	HEH_GOAL = 17,
	HETH = 18,
	KAF = 19,
	KAPH = 20,
	KNOTTED_HEH = 21,
	LAM = 22,
	LAMADH = 23,
	MEEM = 24,
	MIM = 25,
	NOON = 26,
	NUN = 27,
	PE = 28,
	QAF = 29,
	QAPH = 30,
	REH = 31,
	REVERSED_PE = 32,
	SAD = 33,
	SADHE = 34,
	SEEN = 35,
	SEMKATH = 36,
	SHIN = 37,
	SWASH_KAF = 38,
	SYRIAC_WAW = 39,
	TAH = 40,
	TAW = 41,
	TEH_MARBUTA = 42,
	TETH = 43,
	WAW = 44,
	YEH = 45,
	YEH_BARREE = 46,
	YEH_WITH_TAIL = 47,
	YUDH = 48,
	YUDH_HE = 49,
	ZAIN = 50,
	FE = 51,
	KHAPH = 52,
	ZHAIN = 53,
	BURUSHASKI_YEH_BARREE = 54,
	FARSI_YEH = 55,
	NYA = 56,
	ROHINGYA_YEH = 57,
	MANICHAEAN_ALEPH = 58,
	MANICHAEAN_AYIN = 59,
	MANICHAEAN_BETH = 60,
	MANICHAEAN_DALETH = 61,
	MANICHAEAN_DHAMEDH = 62,
	MANICHAEAN_FIVE = 63,
	MANICHAEAN_GIMEL = 64,
	MANICHAEAN_HETH = 65,
	MANICHAEAN_HUNDRED = 66,
	MANICHAEAN_KAPH = 67,
	MANICHAEAN_LAMEDH = 68,
	MANICHAEAN_MEM = 69,
	MANICHAEAN_NUN = 70,
	MANICHAEAN_ONE = 71,
	MANICHAEAN_PE = 72,
	MANICHAEAN_QOPH = 73,
	MANICHAEAN_RESH = 74,
	MANICHAEAN_SADHE = 75,
	MANICHAEAN_SAMEKH = 76,
	MANICHAEAN_TAW = 77,
	MANICHAEAN_TEN = 78,
	MANICHAEAN_TETH = 79,
	MANICHAEAN_THAMEDH = 80,
	MANICHAEAN_TWENTY = 81,
	MANICHAEAN_WAW = 82,
	MANICHAEAN_YODH = 83,
	MANICHAEAN_ZAYIN = 84,
	STRAIGHT_WAW = 85,
	AFRICAN_FEH = 86,
	AFRICAN_NOON = 87,
	AFRICAN_QAF = 88,
	MALAYALAM_BHA = 89,
	MALAYALAM_JA = 90,
	MALAYALAM_LLA = 91,
	MALAYALAM_LLLA = 92,
	MALAYALAM_NGA = 93,
	MALAYALAM_NNA = 94,
	MALAYALAM_NNNA = 95,
	MALAYALAM_NYA = 96,
	MALAYALAM_RA = 97,
	MALAYALAM_SSA = 98,
	MALAYALAM_TTA = 99,
	HANIFI_ROHINGYA_KINNA_YA = 100,
	HANIFI_ROHINGYA_PA = 101,
}

UJoiningType :: enum i32 {
	NON_JOINING = 0,
	JOIN_CAUSING = 1,
	DUAL_JOINING = 2,
	LEFT_JOINING = 3,
	RIGHT_JOINING = 4,
	TRANSPARENT = 5,
}

ULayoutType :: enum i32 {
	LTR = 0,
	RTL = 1,
	TTB = 2,
	BTT = 3,
	UNKNOWN = 4,
}

ULineBreak :: enum i32 {
	UNKNOWN = 0,
	AMBIGUOUS = 1,
	ALPHABETIC = 2,
	BREAK_BOTH = 3,
	BREAK_AFTER = 4,
	BREAK_BEFORE = 5,
	MANDATORY_BREAK = 6,
	CONTINGENT_BREAK = 7,
	CLOSE_PUNCTUATION = 8,
	COMBINING_MARK = 9,
	CARRIAGE_RETURN = 10,
	EXCLAMATION = 11,
	GLUE = 12,
	HYPHEN = 13,
	IDEOGRAPHIC = 14,
	INSEPARABLE = 15,
	INSEPERABLE = 15,
	INFIX_NUMERIC = 16,
	LINE_FEED = 17,
	NONSTARTER = 18,
	NUMERIC = 19,
	OPEN_PUNCTUATION = 20,
	POSTFIX_NUMERIC = 21,
	PREFIX_NUMERIC = 22,
	QUOTATION = 23,
	COMPLEX_CONTEXT = 24,
	SURROGATE = 25,
	SPACE = 26,
	BREAK_SYMBOLS = 27,
	ZWSPACE = 28,
	NEXT_LINE = 29,
	WORD_JOINER = 30,
	H2 = 31,
	H3 = 32,
	JL = 33,
	JT = 34,
	JV = 35,
	CLOSE_PARENTHESIS = 36,
	CONDITIONAL_JAPANESE_STARTER = 37,
	HEBREW_LETTER = 38,
	REGIONAL_INDICATOR = 39,
	E_BASE = 40,
	E_MODIFIER = 41,
	ZWJ = 42,
}

ULineBreakTag :: enum i32 {
	SOFT = 0,
	SOFT_LIMIT = 100,
	HARD = 100,
	HARD_LIMIT = 200,
}

UListFormatter :: int

UListFormatterField :: enum i32 {
	LITERAL_FIELD = 0,
	ELEMENT_FIELD = 1,
}

UListFormatterType :: enum i32 {
	AND = 0,
	OR = 1,
	UNITS = 2,
}

UListFormatterWidth :: enum i32 {
	WIDE = 0,
	SHORT = 1,
	NARROW = 2,
}

ULocaleData :: int

ULocaleDataDelimiterType :: enum i32 {
	QUOTATION_START = 0,
	QUOTATION_END = 1,
	ALT_QUOTATION_START = 2,
	ALT_QUOTATION_END = 3,
}

ULocaleDataExemplarSetType :: enum i32 {
	STANDARD = 0,
	AUXILIARY = 1,
	INDEX = 2,
	PUNCTUATION = 3,
}

ULocaleDisplayNames :: int

ULocAvailableType :: enum i32 {
	DEFAULT = 0,
	ONLY_LEGACY_ALIASES = 1,
	WITH_LEGACY_ALIASES = 2,
}

ULocDataLocaleType :: enum i32 {
	ACTUAL_LOCALE = 0,
	VALID_LOCALE = 1,
}

UMeasureFormatWidth :: enum i32 {
	WIDE = 0,
	SHORT = 1,
	NARROW = 2,
	NUMERIC = 3,
	COUNT = 4,
}

UMeasurementSystem :: enum i32 {
	SI = 0,
	US = 1,
	UK = 2,
}

UMemAllocFn :: #type proc "c" (_context: rawptr, size: uintptr) -> rawptr

UMemFreeFn :: #type proc "c" (_context: rawptr, mem: rawptr)

UMemReallocFn :: #type proc "c" (_context: rawptr, mem: rawptr, size: uintptr) -> rawptr

UMessagePatternApostropheMode :: enum i32 {
	OPTIONAL = 0,
	REQUIRED = 1,
}

UMessagePatternArgType :: enum i32 {
	NONE = 0,
	SIMPLE = 1,
	CHOICE = 2,
	PLURAL = 3,
	SELECT = 4,
	SELECTORDINAL = 5,
}

UMessagePatternPartType :: enum i32 {
	MSG_START = 0,
	MSG_LIMIT = 1,
	SKIP_SYNTAX = 2,
	INSERT_CHAR = 3,
	REPLACE_NUMBER = 4,
	ARG_START = 5,
	ARG_LIMIT = 6,
	ARG_NUMBER = 7,
	ARG_NAME = 8,
	ARG_TYPE = 9,
	ARG_STYLE = 10,
	ARG_SELECTOR = 11,
	ARG_INT = 12,
	ARG_DOUBLE = 13,
}

UMutableCPTrie :: int

UNESCAPE_CHAR_AT :: #type proc "c" (offset: i32, _context: rawptr) -> u16

UNICODERANGE :: struct {
	wcFrom: u16,
	wcTo: u16,
}

UNormalization2Mode :: enum i32 {
	COMPOSE = 0,
	DECOMPOSE = 1,
	FCD = 2,
	COMPOSE_CONTIGUOUS = 3,
}

UNormalizationCheckResult :: enum i32 {
	NO = 0,
	YES = 1,
	MAYBE = 2,
}

UNormalizationMode :: enum i32 {
	NONE = 1,
	NFD = 2,
	NFKD = 3,
	NFC = 4,
	DEFAULT = 4,
	NFKC = 5,
	FCD = 6,
	MODE_COUNT = 7,
}

UNormalizer2 :: int

UNumberCompactStyle :: enum i32 {
	SHORT = 0,
	LONG = 1,
}

UNumberDecimalSeparatorDisplay :: enum i32 {
	AUTO = 0,
	ALWAYS = 1,
	COUNT = 2,
}

UNumberFormatAttribute :: enum i32 {
	PARSE_INT_ONLY = 0,
	GROUPING_USED = 1,
	DECIMAL_ALWAYS_SHOWN = 2,
	MAX_INTEGER_DIGITS = 3,
	MIN_INTEGER_DIGITS = 4,
	INTEGER_DIGITS = 5,
	MAX_FRACTION_DIGITS = 6,
	MIN_FRACTION_DIGITS = 7,
	FRACTION_DIGITS = 8,
	MULTIPLIER = 9,
	GROUPING_SIZE = 10,
	ROUNDING_MODE = 11,
	ROUNDING_INCREMENT = 12,
	FORMAT_WIDTH = 13,
	PADDING_POSITION = 14,
	SECONDARY_GROUPING_SIZE = 15,
	SIGNIFICANT_DIGITS_USED = 16,
	MIN_SIGNIFICANT_DIGITS = 17,
	MAX_SIGNIFICANT_DIGITS = 18,
	LENIENT_PARSE = 19,
	PARSE_ALL_INPUT = 20,
	SCALE = 21,
	MINIMUM_GROUPING_DIGITS = 22,
	CURRENCY_USAGE = 23,
	FORMAT_FAIL_IF_MORE_THAN_MAX_DIGITS = 4096,
	PARSE_NO_EXPONENT = 4097,
	PARSE_DECIMAL_MARK_REQUIRED = 4098,
	PARSE_CASE_SENSITIVE = 4099,
	SIGN_ALWAYS_SHOWN = 4100,
}

UNumberFormatAttributeValue :: enum i32 {
	UM_FORMAT_ATTRIBUTE_VALUE_HIDDEN = 0,
}

UNumberFormatFields :: enum i32 {
	INTEGER_FIELD = 0,
	FRACTION_FIELD = 1,
	DECIMAL_SEPARATOR_FIELD = 2,
	EXPONENT_SYMBOL_FIELD = 3,
	EXPONENT_SIGN_FIELD = 4,
	EXPONENT_FIELD = 5,
	GROUPING_SEPARATOR_FIELD = 6,
	CURRENCY_FIELD = 7,
	PERCENT_FIELD = 8,
	PERMILL_FIELD = 9,
	SIGN_FIELD = 10,
	MEASURE_UNIT_FIELD = 11,
	COMPACT_FIELD = 12,
}

UNumberFormatPadPosition :: enum i32 {
	BEFORE_PREFIX = 0,
	AFTER_PREFIX = 1,
	BEFORE_SUFFIX = 2,
	AFTER_SUFFIX = 3,
}

UNumberFormatRoundingMode :: enum i32 {
	CEILING = 0,
	FLOOR = 1,
	DOWN = 2,
	UP = 3,
	HALFEVEN = 4,
	HALFDOWN = 5,
	HALFUP = 6,
	UNNECESSARY = 7,
}

UNumberFormatStyle :: enum i32 {
	PATTERN_DECIMAL = 0,
	DECIMAL = 1,
	CURRENCY = 2,
	PERCENT = 3,
	SCIENTIFIC = 4,
	SPELLOUT = 5,
	ORDINAL = 6,
	DURATION = 7,
	NUMBERING_SYSTEM = 8,
	PATTERN_RULEBASED = 9,
	CURRENCY_ISO = 10,
	CURRENCY_PLURAL = 11,
	CURRENCY_ACCOUNTING = 12,
	CASH_CURRENCY = 13,
	DECIMAL_COMPACT_SHORT = 14,
	DECIMAL_COMPACT_LONG = 15,
	CURRENCY_STANDARD = 16,
	DEFAULT = 1,
	IGNORE = 0,
}

UNumberFormatSymbol :: enum i32 {
	DECIMAL_SEPARATOR_SYMBOL = 0,
	GROUPING_SEPARATOR_SYMBOL = 1,
	PATTERN_SEPARATOR_SYMBOL = 2,
	PERCENT_SYMBOL = 3,
	ZERO_DIGIT_SYMBOL = 4,
	DIGIT_SYMBOL = 5,
	MINUS_SIGN_SYMBOL = 6,
	PLUS_SIGN_SYMBOL = 7,
	CURRENCY_SYMBOL = 8,
	INTL_CURRENCY_SYMBOL = 9,
	MONETARY_SEPARATOR_SYMBOL = 10,
	EXPONENTIAL_SYMBOL = 11,
	PERMILL_SYMBOL = 12,
	PAD_ESCAPE_SYMBOL = 13,
	INFINITY_SYMBOL = 14,
	NAN_SYMBOL = 15,
	SIGNIFICANT_DIGIT_SYMBOL = 16,
	MONETARY_GROUPING_SEPARATOR_SYMBOL = 17,
	ONE_DIGIT_SYMBOL = 18,
	TWO_DIGIT_SYMBOL = 19,
	THREE_DIGIT_SYMBOL = 20,
	FOUR_DIGIT_SYMBOL = 21,
	FIVE_DIGIT_SYMBOL = 22,
	SIX_DIGIT_SYMBOL = 23,
	SEVEN_DIGIT_SYMBOL = 24,
	EIGHT_DIGIT_SYMBOL = 25,
	NINE_DIGIT_SYMBOL = 26,
	EXPONENT_MULTIPLICATION_SYMBOL = 27,
}

UNumberFormatter :: int

UNumberFormatTextAttribute :: enum i32 {
	POSITIVE_PREFIX = 0,
	POSITIVE_SUFFIX = 1,
	NEGATIVE_PREFIX = 2,
	NEGATIVE_SUFFIX = 3,
	PADDING_CHARACTER = 4,
	CURRENCY_CODE = 5,
	DEFAULT_RULESET = 6,
	PUBLIC_RULESETS = 7,
}

UNumberGroupingStrategy :: enum i32 {
	OFF = 0,
	MIN2 = 1,
	AUTO = 2,
	ON_ALIGNED = 3,
	THOUSANDS = 4,
}

UNumberingSystem :: int

UNumberRangeCollapse :: enum i32 {
	AUTO = 0,
	NONE = 1,
	UNIT = 2,
	ALL = 3,
}

UNumberRangeIdentityFallback :: enum i32 {
	SINGLE_VALUE = 0,
	APPROXIMATELY_OR_SINGLE_VALUE = 1,
	APPROXIMATELY = 2,
	RANGE = 3,
}

UNumberRangeIdentityResult :: enum i32 {
	EQUAL_BEFORE_ROUNDING = 0,
	EQUAL_AFTER_ROUNDING = 1,
	NOT_EQUAL = 2,
}

UNumberSignDisplay :: enum i32 {
	AUTO = 0,
	ALWAYS = 1,
	NEVER = 2,
	ACCOUNTING = 3,
	ACCOUNTING_ALWAYS = 4,
	EXCEPT_ZERO = 5,
	ACCOUNTING_EXCEPT_ZERO = 6,
	COUNT = 7,
}

UNumberUnitWidth :: enum i32 {
	NARROW = 0,
	SHORT = 1,
	FULL_NAME = 2,
	ISO_CODE = 3,
	HIDDEN = 4,
	COUNT = 5,
}

UNumericType :: enum i32 {
	NONE = 0,
	DECIMAL = 1,
	DIGIT = 2,
	NUMERIC = 3,
}

UParseError :: struct {
	line: i32,
	offset: i32,
	preContext: [16]u16,
	postContext: [16]u16,
}

UPluralRules :: int

UPluralType :: enum i32 {
	CARDINAL = 0,
	ORDINAL = 1,
}

UProperty :: enum i32 {
	ALPHABETIC = 0,
	BINARY_START = 0,
	ASCII_HEX_DIGIT = 1,
	BIDI_CONTROL = 2,
	BIDI_MIRRORED = 3,
	DASH = 4,
	DEFAULT_IGNORABLE_CODE_POINT = 5,
	DEPRECATED = 6,
	DIACRITIC = 7,
	EXTENDER = 8,
	FULL_COMPOSITION_EXCLUSION = 9,
	GRAPHEME_BASE = 10,
	GRAPHEME_EXTEND = 11,
	GRAPHEME_LINK = 12,
	HEX_DIGIT = 13,
	HYPHEN = 14,
	ID_CONTINUE = 15,
	ID_START = 16,
	IDEOGRAPHIC = 17,
	IDS_BINARY_OPERATOR = 18,
	IDS_TRINARY_OPERATOR = 19,
	JOIN_CONTROL = 20,
	LOGICAL_ORDER_EXCEPTION = 21,
	LOWERCASE = 22,
	MATH = 23,
	NONCHARACTER_CODE_POINT = 24,
	QUOTATION_MARK = 25,
	RADICAL = 26,
	SOFT_DOTTED = 27,
	TERMINAL_PUNCTUATION = 28,
	UNIFIED_IDEOGRAPH = 29,
	UPPERCASE = 30,
	WHITE_SPACE = 31,
	XID_CONTINUE = 32,
	XID_START = 33,
	CASE_SENSITIVE = 34,
	S_TERM = 35,
	VARIATION_SELECTOR = 36,
	NFD_INERT = 37,
	NFKD_INERT = 38,
	NFC_INERT = 39,
	NFKC_INERT = 40,
	SEGMENT_STARTER = 41,
	PATTERN_SYNTAX = 42,
	PATTERN_WHITE_SPACE = 43,
	POSIX_ALNUM = 44,
	POSIX_BLANK = 45,
	POSIX_GRAPH = 46,
	POSIX_PRINT = 47,
	POSIX_XDIGIT = 48,
	CASED = 49,
	CASE_IGNORABLE = 50,
	CHANGES_WHEN_LOWERCASED = 51,
	CHANGES_WHEN_UPPERCASED = 52,
	CHANGES_WHEN_TITLECASED = 53,
	CHANGES_WHEN_CASEFOLDED = 54,
	CHANGES_WHEN_CASEMAPPED = 55,
	CHANGES_WHEN_NFKC_CASEFOLDED = 56,
	EMOJI = 57,
	EMOJI_PRESENTATION = 58,
	EMOJI_MODIFIER = 59,
	EMOJI_MODIFIER_BASE = 60,
	EMOJI_COMPONENT = 61,
	REGIONAL_INDICATOR = 62,
	PREPENDED_CONCATENATION_MARK = 63,
	EXTENDED_PICTOGRAPHIC = 64,
	BIDI_CLASS = 4096,
	INT_START = 4096,
	BLOCK = 4097,
	CANONICAL_COMBINING_CLASS = 4098,
	DECOMPOSITION_TYPE = 4099,
	EAST_ASIAN_WIDTH = 4100,
	GENERAL_CATEGORY = 4101,
	JOINING_GROUP = 4102,
	JOINING_TYPE = 4103,
	LINE_BREAK = 4104,
	NUMERIC_TYPE = 4105,
	SCRIPT = 4106,
	HANGUL_SYLLABLE_TYPE = 4107,
	NFD_QUICK_CHECK = 4108,
	NFKD_QUICK_CHECK = 4109,
	NFC_QUICK_CHECK = 4110,
	NFKC_QUICK_CHECK = 4111,
	LEAD_CANONICAL_COMBINING_CLASS = 4112,
	TRAIL_CANONICAL_COMBINING_CLASS = 4113,
	GRAPHEME_CLUSTER_BREAK = 4114,
	SENTENCE_BREAK = 4115,
	WORD_BREAK = 4116,
	BIDI_PAIRED_BRACKET_TYPE = 4117,
	INDIC_POSITIONAL_CATEGORY = 4118,
	INDIC_SYLLABIC_CATEGORY = 4119,
	VERTICAL_ORIENTATION = 4120,
	GENERAL_CATEGORY_MASK = 8192,
	MASK_START = 8192,
	NUMERIC_VALUE = 12288,
	DOUBLE_START = 12288,
	AGE = 16384,
	STRING_START = 16384,
	BIDI_MIRRORING_GLYPH = 16385,
	CASE_FOLDING = 16386,
	LOWERCASE_MAPPING = 16388,
	NAME = 16389,
	SIMPLE_CASE_FOLDING = 16390,
	SIMPLE_LOWERCASE_MAPPING = 16391,
	SIMPLE_TITLECASE_MAPPING = 16392,
	SIMPLE_UPPERCASE_MAPPING = 16393,
	TITLECASE_MAPPING = 16394,
	UPPERCASE_MAPPING = 16396,
	BIDI_PAIRED_BRACKET = 16397,
	SCRIPT_EXTENSIONS = 28672,
	OTHER_PROPERTY_START = 28672,
	INVALID_CODE = -1,
}

UPropertyNameChoice :: enum i32 {
	SHORT_PROPERTY_NAME = 0,
	LONG_PROPERTY_NAME = 1,
}

URegexFindProgressCallback :: #type proc "c" (_context: rawptr, matchIndex: i64) -> i8

URegexMatchCallback :: #type proc "c" (_context: rawptr, steps: i32) -> i8

URegexpFlag :: enum i32 {
	CASE_INSENSITIVE = 2,
	COMMENTS = 4,
	DOTALL = 32,
	LITERAL = 16,
	MULTILINE = 8,
	UNIX_LINES = 1,
	UWORD = 256,
	ERROR_ON_UNKNOWN_ESCAPES = 512,
}

URegion :: int

URegionType :: enum i32 {
	UNKNOWN = 0,
	TERRITORY = 1,
	WORLD = 2,
	CONTINENT = 3,
	SUBCONTINENT = 4,
	GROUPING = 5,
	DEPRECATED = 6,
}

URegularExpression :: int

URelativeDateTimeFormatter :: int

URelativeDateTimeFormatterField :: enum i32 {
	LITERAL_FIELD = 0,
	NUMERIC_FIELD = 1,
}

URelativeDateTimeUnit :: enum i32 {
	YEAR = 0,
	QUARTER = 1,
	MONTH = 2,
	WEEK = 3,
	DAY = 4,
	HOUR = 5,
	MINUTE = 6,
	SECOND = 7,
	SUNDAY = 8,
	MONDAY = 9,
	TUESDAY = 10,
	WEDNESDAY = 11,
	THURSDAY = 12,
	FRIDAY = 13,
	SATURDAY = 14,
}

UReplaceableCallbacks :: struct {
	length: int,
	charAt: int,
	char32At: int,
	replace: int,
	extract: int,
	copy: int,
}

UResourceBundle :: int

URestrictionLevel :: enum i32 {
	ASCII = 268435456,
	SINGLE_SCRIPT_RESTRICTIVE = 536870912,
	HIGHLY_RESTRICTIVE = 805306368,
	MODERATELY_RESTRICTIVE = 1073741824,
	MINIMALLY_RESTRICTIVE = 1342177280,
	UNRESTRICTIVE = 1610612736,
	RESTRICTION_LEVEL_MASK = 2130706432,
}

UResType :: enum i32 {
	NONE = -1,
	STRING = 0,
	BINARY = 1,
	TABLE = 2,
	ALIAS = 3,
	INT = 7,
	ARRAY = 8,
	INT_VECTOR = 14,
}

UScriptCode :: enum i32 {
	INVALID_CODE = -1,
	COMMON = 0,
	INHERITED = 1,
	ARABIC = 2,
	ARMENIAN = 3,
	BENGALI = 4,
	BOPOMOFO = 5,
	CHEROKEE = 6,
	COPTIC = 7,
	CYRILLIC = 8,
	DESERET = 9,
	DEVANAGARI = 10,
	ETHIOPIC = 11,
	GEORGIAN = 12,
	GOTHIC = 13,
	GREEK = 14,
	GUJARATI = 15,
	GURMUKHI = 16,
	HAN = 17,
	HANGUL = 18,
	HEBREW = 19,
	HIRAGANA = 20,
	KANNADA = 21,
	KATAKANA = 22,
	KHMER = 23,
	LAO = 24,
	LATIN = 25,
	MALAYALAM = 26,
	MONGOLIAN = 27,
	MYANMAR = 28,
	OGHAM = 29,
	OLD_ITALIC = 30,
	ORIYA = 31,
	RUNIC = 32,
	SINHALA = 33,
	SYRIAC = 34,
	TAMIL = 35,
	TELUGU = 36,
	THAANA = 37,
	THAI = 38,
	TIBETAN = 39,
	CANADIAN_ABORIGINAL = 40,
	UCAS = 40,
	YI = 41,
	TAGALOG = 42,
	HANUNOO = 43,
	BUHID = 44,
	TAGBANWA = 45,
	BRAILLE = 46,
	CYPRIOT = 47,
	LIMBU = 48,
	LINEAR_B = 49,
	OSMANYA = 50,
	SHAVIAN = 51,
	TAI_LE = 52,
	UGARITIC = 53,
	KATAKANA_OR_HIRAGANA = 54,
	BUGINESE = 55,
	GLAGOLITIC = 56,
	KHAROSHTHI = 57,
	SYLOTI_NAGRI = 58,
	NEW_TAI_LUE = 59,
	TIFINAGH = 60,
	OLD_PERSIAN = 61,
	BALINESE = 62,
	BATAK = 63,
	BLISSYMBOLS = 64,
	BRAHMI = 65,
	CHAM = 66,
	CIRTH = 67,
	OLD_CHURCH_SLAVONIC_CYRILLIC = 68,
	DEMOTIC_EGYPTIAN = 69,
	HIERATIC_EGYPTIAN = 70,
	EGYPTIAN_HIEROGLYPHS = 71,
	KHUTSURI = 72,
	SIMPLIFIED_HAN = 73,
	TRADITIONAL_HAN = 74,
	PAHAWH_HMONG = 75,
	OLD_HUNGARIAN = 76,
	HARAPPAN_INDUS = 77,
	JAVANESE = 78,
	KAYAH_LI = 79,
	LATIN_FRAKTUR = 80,
	LATIN_GAELIC = 81,
	LEPCHA = 82,
	LINEAR_A = 83,
	MANDAIC = 84,
	MANDAEAN = 84,
	MAYAN_HIEROGLYPHS = 85,
	MEROITIC_HIEROGLYPHS = 86,
	MEROITIC = 86,
	NKO = 87,
	ORKHON = 88,
	OLD_PERMIC = 89,
	PHAGS_PA = 90,
	PHOENICIAN = 91,
	MIAO = 92,
	PHONETIC_POLLARD = 92,
	RONGORONGO = 93,
	SARATI = 94,
	ESTRANGELO_SYRIAC = 95,
	WESTERN_SYRIAC = 96,
	EASTERN_SYRIAC = 97,
	TENGWAR = 98,
	VAI = 99,
	VISIBLE_SPEECH = 100,
	CUNEIFORM = 101,
	UNWRITTEN_LANGUAGES = 102,
	UNKNOWN = 103,
	CARIAN = 104,
	JAPANESE = 105,
	LANNA = 106,
	LYCIAN = 107,
	LYDIAN = 108,
	OL_CHIKI = 109,
	REJANG = 110,
	SAURASHTRA = 111,
	SIGN_WRITING = 112,
	SUNDANESE = 113,
	MOON = 114,
	MEITEI_MAYEK = 115,
	IMPERIAL_ARAMAIC = 116,
	AVESTAN = 117,
	CHAKMA = 118,
	KOREAN = 119,
	KAITHI = 120,
	MANICHAEAN = 121,
	INSCRIPTIONAL_PAHLAVI = 122,
	PSALTER_PAHLAVI = 123,
	BOOK_PAHLAVI = 124,
	INSCRIPTIONAL_PARTHIAN = 125,
	SAMARITAN = 126,
	TAI_VIET = 127,
	MATHEMATICAL_NOTATION = 128,
	SYMBOLS = 129,
	BAMUM = 130,
	LISU = 131,
	NAKHI_GEBA = 132,
	OLD_SOUTH_ARABIAN = 133,
	BASSA_VAH = 134,
	DUPLOYAN = 135,
	ELBASAN = 136,
	GRANTHA = 137,
	KPELLE = 138,
	LOMA = 139,
	MENDE = 140,
	MEROITIC_CURSIVE = 141,
	OLD_NORTH_ARABIAN = 142,
	NABATAEAN = 143,
	PALMYRENE = 144,
	KHUDAWADI = 145,
	SINDHI = 145,
	WARANG_CITI = 146,
	AFAKA = 147,
	JURCHEN = 148,
	MRO = 149,
	NUSHU = 150,
	SHARADA = 151,
	SORA_SOMPENG = 152,
	TAKRI = 153,
	TANGUT = 154,
	WOLEAI = 155,
	ANATOLIAN_HIEROGLYPHS = 156,
	KHOJKI = 157,
	TIRHUTA = 158,
	CAUCASIAN_ALBANIAN = 159,
	MAHAJANI = 160,
	AHOM = 161,
	HATRAN = 162,
	MODI = 163,
	MULTANI = 164,
	PAU_CIN_HAU = 165,
	SIDDHAM = 166,
	ADLAM = 167,
	BHAIKSUKI = 168,
	MARCHEN = 169,
	NEWA = 170,
	OSAGE = 171,
	HAN_WITH_BOPOMOFO = 172,
	JAMO = 173,
	SYMBOLS_EMOJI = 174,
	MASARAM_GONDI = 175,
	SOYOMBO = 176,
	ZANABAZAR_SQUARE = 177,
	DOGRA = 178,
	GUNJALA_GONDI = 179,
	MAKASAR = 180,
	MEDEFAIDRIN = 181,
	HANIFI_ROHINGYA = 182,
	SOGDIAN = 183,
	OLD_SOGDIAN = 184,
	ELYMAIC = 185,
	NYIAKENG_PUACHUE_HMONG = 186,
	NANDINAGARI = 187,
	WANCHO = 188,
	CHORASMIAN = 189,
	DIVES_AKURU = 190,
	KHITAN_SMALL_SCRIPT = 191,
	YEZIDI = 192,
}

UScriptUsage :: enum i32 {
	NOT_ENCODED = 0,
	UNKNOWN = 1,
	EXCLUDED = 2,
	LIMITED_USE = 3,
	ASPIRATIONAL = 4,
	RECOMMENDED = 5,
}

USearch :: int

USearchAttribute :: enum i32 {
	OVERLAP = 0,
	ELEMENT_COMPARISON = 2,
}

USearchAttributeValue :: enum i32 {
	DEFAULT = -1,
	OFF = 0,
	ON = 1,
	STANDARD_ELEMENT_COMPARISON = 2,
	PATTERN_BASE_WEIGHT_IS_WILDCARD = 3,
	ANY_BASE_WEIGHT_IS_WILDCARD = 4,
}

USentenceBreak :: enum i32 {
	OTHER = 0,
	ATERM = 1,
	CLOSE = 2,
	FORMAT = 3,
	LOWER = 4,
	NUMERIC = 5,
	OLETTER = 6,
	SEP = 7,
	SP = 8,
	STERM = 9,
	UPPER = 10,
	CR = 11,
	EXTEND = 12,
	LF = 13,
	SCONTINUE = 14,
}

USentenceBreakTag :: enum i32 {
	TERM = 0,
	TERM_LIMIT = 100,
	SEP = 100,
	SEP_LIMIT = 200,
}

USerializedSet :: struct {
	array: ^u16,
	bmpLength: i32,
	length: i32,
	staticArray: [8]u16,
}

USet :: int

USetSpanCondition :: enum i32 {
	NOT_CONTAINED = 0,
	CONTAINED = 1,
	SIMPLE = 2,
}

USpoofChecker :: int

USpoofCheckResult :: int

USpoofChecks :: enum i32 {
	SINGLE_SCRIPT_CONFUSABLE = 1,
	MIXED_SCRIPT_CONFUSABLE = 2,
	WHOLE_SCRIPT_CONFUSABLE = 4,
	CONFUSABLE = 7,
	RESTRICTION_LEVEL = 16,
	INVISIBLE = 32,
	CHAR_LIMIT = 64,
	MIXED_NUMBERS = 128,
	HIDDEN_OVERLAY = 256,
	ALL_CHECKS = 65535,
	AUX_INFO = 1073741824,
}

UStringCaseMapper :: #type proc "c" (
	#by_ptr csm: UCaseMap,
	dest: ^u16,
	destCapacity: i32,
	src: ^u16,
	srcLength: i32,
	pErrorCode: ^UErrorCode,
) -> i32

UStringPrepProfile :: int

UStringPrepProfileType :: enum i32 {
	_3491_NAMEPREP = 0,
	_3530_NFS4_CS_PREP = 1,
	_3530_NFS4_CS_PREP_CI = 2,
	_3530_NFS4_CIS_PREP = 3,
	_3530_NFS4_MIXED_PREP_PREFIX = 4,
	_3530_NFS4_MIXED_PREP_SUFFIX = 5,
	_3722_ISCSI = 6,
	_3920_NODEPREP = 7,
	_3920_RESOURCEPREP = 8,
	_4011_MIB = 9,
	_4013_SASLPREP = 10,
	_4505_TRACE = 11,
	_4518_LDAP = 12,
	_4518_LDAP_CI = 13,
}

UStringSearch :: int

UStringTrieBuildOption :: enum i32 {
	FAST = 0,
	SMALL = 1,
}

UStringTrieResult :: enum i32 {
	NO_MATCH = 0,
	NO_VALUE = 1,
	FINAL_VALUE = 2,
	INTERMEDIATE_VALUE = 3,
}

USystemTimeZoneType :: enum i32 {
	ANY = 0,
	CANONICAL = 1,
	CANONICAL_LOCATION = 2,
}

UText :: struct {
	magic: u32,
	flags: i32,
	providerProperties: i32,
	sizeOfStruct: i32,
	chunkNativeLimit: i64,
	extraSize: i32,
	nativeIndexingLimit: i32,
	chunkNativeStart: i64,
	chunkOffset: i32,
	chunkLength: i32,
	chunkContents: ^u16,
	pFuncs: ^UTextFuncs,
	pExtra: rawptr,
	_context: rawptr,
	p: rawptr,
	q: rawptr,
	r: rawptr,
	privP: rawptr,
	a: i64,
	b: i32,
	c: i32,
	privA: i64,
	privB: i32,
	privC: i32,
}

UTextAccess :: #type proc "c" (ut: ^UText, nativeIndex: i64, forward: i8) -> i8

UTextClone :: #type proc "c" (dest: ^UText, #by_ptr src: UText, deep: i8, status: ^UErrorCode) -> ^UText

UTextClose :: #type proc "c" (ut: ^UText)

UTextCopy :: #type proc "c" (ut: ^UText, nativeStart: i64, nativeLimit: i64, nativeDest: i64, move: i8, status: ^UErrorCode)

UTextExtract :: #type proc "c" (
	ut: ^UText,
	nativeStart: i64,
	nativeLimit: i64,
	dest: ^u16,
	destCapacity: i32,
	status: ^UErrorCode,
) -> i32

UTextFuncs :: struct {
	tableSize: i32,
	reserved1: i32,
	reserved2: i32,
	reserved3: i32,
	clone: UTextClone,
	nativeLength: UTextNativeLength,
	access: UTextAccess,
	extract: UTextExtract,
	replace: UTextReplace,
	copy: UTextCopy,
	mapOffsetToNative: UTextMapOffsetToNative,
	mapNativeIndexToUTF16: UTextMapNativeIndexToUTF16,
	close: UTextClose,
	spare1: UTextClose,
	spare2: UTextClose,
	spare3: UTextClose,
}

UTextMapNativeIndexToUTF16 :: #type proc "c" (#by_ptr ut: UText, nativeIndex: i64) -> i32

UTextMapOffsetToNative :: #type proc "c" (#by_ptr ut: UText) -> i64

UTextNativeLength :: #type proc "c" (ut: ^UText) -> i64

UTextReplace :: #type proc "c" (
	ut: ^UText,
	nativeStart: i64,
	nativeLimit: i64,
	replacementText: ^u16,
	replacmentLength: i32,
	status: ^UErrorCode,
) -> i32

UTimeScaleValue :: enum i32 {
	UNITS_VALUE = 0,
	EPOCH_OFFSET_VALUE = 1,
	FROM_MIN_VALUE = 2,
	FROM_MAX_VALUE = 3,
	TO_MIN_VALUE = 4,
	TO_MAX_VALUE = 5,
}

UTimeZoneFormatGMTOffsetPatternType :: enum i32 {
	POSITIVE_HM = 0,
	POSITIVE_HMS = 1,
	NEGATIVE_HM = 2,
	NEGATIVE_HMS = 3,
	POSITIVE_H = 4,
	NEGATIVE_H = 5,
	COUNT = 6,
}

UTimeZoneFormatParseOption :: enum i32 {
	NONE = 0,
	ALL_STYLES = 1,
	TZ_DATABASE_ABBREVIATIONS = 2,
}

UTimeZoneFormatStyle :: enum i32 {
	GENERIC_LOCATION = 0,
	GENERIC_LONG = 1,
	GENERIC_SHORT = 2,
	SPECIFIC_LONG = 3,
	SPECIFIC_SHORT = 4,
	LOCALIZED_GMT = 5,
	LOCALIZED_GMT_SHORT = 6,
	ISO_BASIC_SHORT = 7,
	ISO_BASIC_LOCAL_SHORT = 8,
	ISO_BASIC_FIXED = 9,
	ISO_BASIC_LOCAL_FIXED = 10,
	ISO_BASIC_FULL = 11,
	ISO_BASIC_LOCAL_FULL = 12,
	ISO_EXTENDED_FIXED = 13,
	ISO_EXTENDED_LOCAL_FIXED = 14,
	ISO_EXTENDED_FULL = 15,
	ISO_EXTENDED_LOCAL_FULL = 16,
	ZONE_ID = 17,
	ZONE_ID_SHORT = 18,
	EXEMPLAR_LOCATION = 19,
}

UTimeZoneFormatTimeType :: enum i32 {
	UNKNOWN = 0,
	STANDARD = 1,
	DAYLIGHT = 2,
}

UTimeZoneNameType :: enum i32 {
	UNKNOWN = 0,
	LONG_GENERIC = 1,
	LONG_STANDARD = 2,
	LONG_DAYLIGHT = 4,
	SHORT_GENERIC = 8,
	SHORT_STANDARD = 16,
	SHORT_DAYLIGHT = 32,
	EXEMPLAR_LOCATION = 64,
}

UTimeZoneTransitionType :: enum i32 {
	NEXT = 0,
	NEXT_INCLUSIVE = 1,
	PREVIOUS = 2,
	PREVIOUS_INCLUSIVE = 3,
}

UTraceData :: #type proc "c" (_context: rawptr, fnNumber: i32, level: i32, fmt: PSTR, args: ^i8)

UTraceEntry :: #type proc "c" (_context: rawptr, fnNumber: i32)

UTraceExit :: #type proc "c" (_context: rawptr, fnNumber: i32, fmt: PSTR, args: ^i8)

UTraceFunctionNumber :: enum i32 {
	FUNCTION_START = 0,
	U_INIT = 0,
	U_CLEANUP = 1,
	CONVERSION_START = 4096,
	UCNV_OPEN = 4096,
	UCNV_OPEN_PACKAGE = 4097,
	UCNV_OPEN_ALGORITHMIC = 4098,
	UCNV_CLONE = 4099,
	UCNV_CLOSE = 4100,
	UCNV_FLUSH_CACHE = 4101,
	UCNV_LOAD = 4102,
	UCNV_UNLOAD = 4103,
	COLLATION_START = 8192,
	UCOL_OPEN = 8192,
	UCOL_CLOSE = 8193,
	UCOL_STRCOLL = 8194,
	UCOL_GET_SORTKEY = 8195,
	UCOL_GETLOCALE = 8196,
	UCOL_NEXTSORTKEYPART = 8197,
	UCOL_STRCOLLITER = 8198,
	UCOL_OPEN_FROM_SHORT_STRING = 8199,
	UCOL_STRCOLLUTF8 = 8200,
	UDATA_START = 12288,
	UDATA_RESOURCE = 12288,
	UDATA_BUNDLE = 12289,
	UDATA_DATA_FILE = 12290,
	UDATA_RES_FILE = 12291,
}

UTraceLevel :: enum i32 {
	OFF = -1,
	ERROR = 0,
	WARNING = 3,
	OPEN_CLOSE = 5,
	INFO = 7,
	VERBOSE = 9,
}

UTransDirection :: enum i32 {
	FORWARD = 0,
	REVERSE = 1,
}

UTransPosition :: struct {
	contextStart: i32,
	contextLimit: i32,
	start: i32,
	limit: i32,
}

UVerticalOrientation :: enum i32 {
	ROTATED = 0,
	TRANSFORMED_ROTATED = 1,
	TRANSFORMED_UPRIGHT = 2,
	UPRIGHT = 3,
}

UWordBreak :: enum i32 {
	NONE = 0,
	NONE_LIMIT = 100,
	NUMBER = 100,
	NUMBER_LIMIT = 200,
	LETTER = 200,
	LETTER_LIMIT = 300,
	KANA = 300,
	KANA_LIMIT = 400,
	IDEO = 400,
	IDEO_LIMIT = 500,
}

UWordBreakValues :: enum i32 {
	OTHER = 0,
	ALETTER = 1,
	FORMAT = 2,
	KATAKANA = 3,
	MIDLETTER = 4,
	MIDNUM = 5,
	NUMERIC = 6,
	EXTENDNUMLET = 7,
	CR = 8,
	EXTEND = 9,
	LF = 10,
	MIDNUMLET = 11,
	NEWLINE = 12,
	REGIONAL_INDICATOR = 13,
	HEBREW_LETTER = 14,
	SINGLE_QUOTE = 15,
	DOUBLE_QUOTE = 16,
	E_BASE = 17,
	E_BASE_GAZ = 18,
	E_MODIFIER = 19,
	GLUE_AFTER_ZWJ = 20,
	ZWJ = 21,
	WSEGSPACE = 22,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/spellcheck/ne-spellcheck-wordlist_type ]]
WORDLIST_TYPE :: enum i32 {
	IGNORE = 0,
	ADD = 1,
	EXCLUDE = 2,
	AUTOCORRECT = 3,
}

ALL_SERVICE_TYPES :: 0
ALL_SERVICES :: 0
C1_ALPHA :: 256
C1_BLANK :: 64
C1_CNTRL :: 32
C1_DEFINED :: 512
C1_DIGIT :: 4
C1_LOWER :: 2
C1_PUNCT :: 16
C1_SPACE :: 8
C1_UPPER :: 1
C1_XDIGIT :: 128
C2_ARABICNUMBER :: 6
C2_BLOCKSEPARATOR :: 8
C2_COMMONSEPARATOR :: 7
C2_EUROPENUMBER :: 3
C2_EUROPESEPARATOR :: 4
C2_EUROPETERMINATOR :: 5
C2_LEFTTORIGHT :: 1
C2_NOTAPPLICABLE :: 0
C2_OTHERNEUTRAL :: 11
C2_RIGHTTOLEFT :: 2
C2_SEGMENTSEPARATOR :: 9
C2_WHITESPACE :: 10
C3_ALPHA :: 32768
C3_DIACRITIC :: 2
C3_FULLWIDTH :: 128
C3_HALFWIDTH :: 64
C3_HIGHSURROGATE :: 2048
C3_HIRAGANA :: 32
C3_IDEOGRAPH :: 256
C3_KASHIDA :: 512
C3_KATAKANA :: 16
C3_LEXICAL :: 1024
C3_LOWSURROGATE :: 4096
C3_NONSPACING :: 1
C3_NOTAPPLICABLE :: 0
C3_SYMBOL :: 8
C3_VOWELMARK :: 4
CAL_GREGORIAN :: 1
CAL_GREGORIAN_ARABIC :: 10
CAL_GREGORIAN_ME_FRENCH :: 9
CAL_GREGORIAN_US :: 2
CAL_GREGORIAN_XLIT_ENGLISH :: 11
CAL_GREGORIAN_XLIT_FRENCH :: 12
CAL_HEBREW :: 8
CAL_HIJRI :: 6
CAL_ICALINTVALUE :: 1
CAL_ITWODIGITYEARMAX :: 48
CAL_IYEAROFFSETRANGE :: 3
CAL_JAPAN :: 3
CAL_KOREA :: 5
CAL_NOUSEROVERRIDE :: 2147483648
CAL_PERSIAN :: 22
CAL_RETURN_GENITIVE_NAMES :: 268435456
CAL_RETURN_NUMBER :: 536870912
CAL_SABBREVDAYNAME1 :: 14
CAL_SABBREVDAYNAME2 :: 15
CAL_SABBREVDAYNAME3 :: 16
CAL_SABBREVDAYNAME4 :: 17
CAL_SABBREVDAYNAME5 :: 18
CAL_SABBREVDAYNAME6 :: 19
CAL_SABBREVDAYNAME7 :: 20
CAL_SABBREVERASTRING :: 57
CAL_SABBREVMONTHNAME1 :: 34
CAL_SABBREVMONTHNAME10 :: 43
CAL_SABBREVMONTHNAME11 :: 44
CAL_SABBREVMONTHNAME12 :: 45
CAL_SABBREVMONTHNAME13 :: 46
CAL_SABBREVMONTHNAME2 :: 35
CAL_SABBREVMONTHNAME3 :: 36
CAL_SABBREVMONTHNAME4 :: 37
CAL_SABBREVMONTHNAME5 :: 38
CAL_SABBREVMONTHNAME6 :: 39
CAL_SABBREVMONTHNAME7 :: 40
CAL_SABBREVMONTHNAME8 :: 41
CAL_SABBREVMONTHNAME9 :: 42
CAL_SCALNAME :: 2
CAL_SDAYNAME1 :: 7
CAL_SDAYNAME2 :: 8
CAL_SDAYNAME3 :: 9
CAL_SDAYNAME4 :: 10
CAL_SDAYNAME5 :: 11
CAL_SDAYNAME6 :: 12
CAL_SDAYNAME7 :: 13
CAL_SENGLISHABBREVERANAME :: 60
CAL_SENGLISHERANAME :: 59
CAL_SERASTRING :: 4
CAL_SJAPANESEERAFIRSTYEAR :: 61
CAL_SLONGDATE :: 6
CAL_SMONTHDAY :: 56
CAL_SMONTHNAME1 :: 21
CAL_SMONTHNAME10 :: 30
CAL_SMONTHNAME11 :: 31
CAL_SMONTHNAME12 :: 32
CAL_SMONTHNAME13 :: 33
CAL_SMONTHNAME2 :: 22
CAL_SMONTHNAME3 :: 23
CAL_SMONTHNAME4 :: 24
CAL_SMONTHNAME5 :: 25
CAL_SMONTHNAME6 :: 26
CAL_SMONTHNAME7 :: 27
CAL_SMONTHNAME8 :: 28
CAL_SMONTHNAME9 :: 29
CAL_SRELATIVELONGDATE :: 58
CAL_SSHORTDATE :: 5
CAL_SSHORTESTDAYNAME1 :: 49
CAL_SSHORTESTDAYNAME2 :: 50
CAL_SSHORTESTDAYNAME3 :: 51
CAL_SSHORTESTDAYNAME4 :: 52
CAL_SSHORTESTDAYNAME5 :: 53
CAL_SSHORTESTDAYNAME6 :: 54
CAL_SSHORTESTDAYNAME7 :: 55
CAL_SYEARMONTH :: 47
CAL_TAIWAN :: 4
CAL_THAI :: 7
CAL_UMALQURA :: 23
CAL_USE_CP_ACP :: 1073741824
CANITER_SKIP_ZEROES :: 1
CP_ACP :: 0
CP_MACCP :: 2
CP_OEMCP :: 1
CP_SYMBOL :: 42
CP_THREAD_ACP :: 3
CP_UTF7 :: 65000
CP_UTF8 :: 65001
CPIOD_FORCE_PROMPT :: -2147483648
CPIOD_PEEK :: 1073741824
CT_CTYPE1 :: 1
CT_CTYPE2 :: 2
CT_CTYPE3 :: 4
CTRY_ALBANIA :: 355
CTRY_ALGERIA :: 213
CTRY_ARGENTINA :: 54
CTRY_ARMENIA :: 374
CTRY_AUSTRALIA :: 61
CTRY_AUSTRIA :: 43
CTRY_AZERBAIJAN :: 994
CTRY_BAHRAIN :: 973
CTRY_BELARUS :: 375
CTRY_BELGIUM :: 32
CTRY_BELIZE :: 501
CTRY_BOLIVIA :: 591
CTRY_BRAZIL :: 55
CTRY_BRUNEI_DARUSSALAM :: 673
CTRY_BULGARIA :: 359
CTRY_CANADA :: 2
CTRY_CARIBBEAN :: 1
CTRY_CHILE :: 56
CTRY_COLOMBIA :: 57
CTRY_COSTA_RICA :: 506
CTRY_CROATIA :: 385
CTRY_CZECH :: 420
CTRY_DEFAULT :: 0
CTRY_DENMARK :: 45
CTRY_DOMINICAN_REPUBLIC :: 1
CTRY_ECUADOR :: 593
CTRY_EGYPT :: 20
CTRY_EL_SALVADOR :: 503
CTRY_ESTONIA :: 372
CTRY_FAEROE_ISLANDS :: 298
CTRY_FINLAND :: 358
CTRY_FRANCE :: 33
CTRY_GEORGIA :: 995
CTRY_GERMANY :: 49
CTRY_GREECE :: 30
CTRY_GUATEMALA :: 502
CTRY_HONDURAS :: 504
CTRY_HONG_KONG :: 852
CTRY_HUNGARY :: 36
CTRY_ICELAND :: 354
CTRY_INDIA :: 91
CTRY_INDONESIA :: 62
CTRY_IRAN :: 981
CTRY_IRAQ :: 964
CTRY_IRELAND :: 353
CTRY_ISRAEL :: 972
CTRY_ITALY :: 39
CTRY_JAMAICA :: 1
CTRY_JAPAN :: 81
CTRY_JORDAN :: 962
CTRY_KAZAKSTAN :: 7
CTRY_KENYA :: 254
CTRY_KUWAIT :: 965
CTRY_KYRGYZSTAN :: 996
CTRY_LATVIA :: 371
CTRY_LEBANON :: 961
CTRY_LIBYA :: 218
CTRY_LIECHTENSTEIN :: 41
CTRY_LITHUANIA :: 370
CTRY_LUXEMBOURG :: 352
CTRY_MACAU :: 853
CTRY_MACEDONIA :: 389
CTRY_MALAYSIA :: 60
CTRY_MALDIVES :: 960
CTRY_MEXICO :: 52
CTRY_MONACO :: 33
CTRY_MONGOLIA :: 976
CTRY_MOROCCO :: 212
CTRY_NETHERLANDS :: 31
CTRY_NEW_ZEALAND :: 64
CTRY_NICARAGUA :: 505
CTRY_NORWAY :: 47
CTRY_OMAN :: 968
CTRY_PAKISTAN :: 92
CTRY_PANAMA :: 507
CTRY_PARAGUAY :: 595
CTRY_PERU :: 51
CTRY_PHILIPPINES :: 63
CTRY_POLAND :: 48
CTRY_PORTUGAL :: 351
CTRY_PRCHINA :: 86
CTRY_PUERTO_RICO :: 1
CTRY_QATAR :: 974
CTRY_ROMANIA :: 40
CTRY_RUSSIA :: 7
CTRY_SAUDI_ARABIA :: 966
CTRY_SERBIA :: 381
CTRY_SINGAPORE :: 65
CTRY_SLOVAK :: 421
CTRY_SLOVENIA :: 386
CTRY_SOUTH_AFRICA :: 27
CTRY_SOUTH_KOREA :: 82
CTRY_SPAIN :: 34
CTRY_SWEDEN :: 46
CTRY_SWITZERLAND :: 41
CTRY_SYRIA :: 963
CTRY_TAIWAN :: 886
CTRY_TATARSTAN :: 7
CTRY_THAILAND :: 66
CTRY_TRINIDAD_Y_TOBAGO :: 1
CTRY_TUNISIA :: 216
CTRY_TURKEY :: 90
CTRY_UAE :: 971
CTRY_UKRAINE :: 380
CTRY_UNITED_KINGDOM :: 44
CTRY_UNITED_STATES :: 1
CTRY_URUGUAY :: 598
CTRY_UZBEKISTAN :: 7
CTRY_VENEZUELA :: 58
CTRY_VIET_NAM :: 84
CTRY_YEMEN :: 967
CTRY_ZIMBABWE :: 263
ELS_GUID_LANGUAGE_DETECTION :: GUID{0xCF7E00B1, 0x909B, 0x4D95, {0xA8, 0xF4, 0x61, 0x1F, 0x7C, 0x37, 0x77, 0x02}}
ELS_GUID_SCRIPT_DETECTION :: GUID{0x2D64B439, 0x6CAF, 0x4F6B, {0xB6, 0x88, 0xE5, 0xD0, 0xF4, 0xFA, 0xA7, 0xD7}}
ELS_GUID_TRANSLITERATION_BENGALI_TO_LATIN ::
	GUID{0xF4DFD825, 0x91A4, 0x489F, {0x85, 0x5E, 0x9A, 0xD9, 0xBE, 0xE5, 0x57, 0x27}}
ELS_GUID_TRANSLITERATION_CYRILLIC_TO_LATIN ::
	GUID{0x3DD12A98, 0x5AFD, 0x4903, {0xA1, 0x3F, 0xE1, 0x7E, 0x6C, 0x0B, 0xFE, 0x01}}
ELS_GUID_TRANSLITERATION_DEVANAGARI_TO_LATIN ::
	GUID{0xC4A4DCFE, 0x2661, 0x4D02, {0x98, 0x35, 0xF4, 0x81, 0x87, 0x10, 0x98, 0x03}}
ELS_GUID_TRANSLITERATION_HANGUL_DECOMPOSITION ::
	GUID{0x4BA2A721, 0xE43D, 0x41B7, {0xB3, 0x30, 0x53, 0x6A, 0xE1, 0xE4, 0x88, 0x63}}
ELS_GUID_TRANSLITERATION_HANS_TO_HANT :: GUID{0x3CACCDC8, 0x5590, 0x42DC, {0x9A, 0x7B, 0xB5, 0xA6, 0xB5, 0xB3, 0xB6, 0x3B}}
ELS_GUID_TRANSLITERATION_HANT_TO_HANS :: GUID{0xA3A8333B, 0xF4FC, 0x42F6, {0xA0, 0xC4, 0x04, 0x62, 0xFE, 0x73, 0x17, 0xCB}}
ELS_GUID_TRANSLITERATION_MALAYALAM_TO_LATIN ::
	GUID{0xD8B983B1, 0xF8BF, 0x4A2B, {0xBC, 0xD5, 0x5B, 0x5E, 0xA2, 0x06, 0x13, 0xE1}}
ENUM_ALL_CALENDARS :: 4294967295
FIND_ENDSWITH :: 2097152
FIND_FROMEND :: 8388608
FIND_FROMSTART :: 4194304
FIND_STARTSWITH :: 1048576
GEOID_NOT_AVAILABLE :: -1
GSS_ALLOW_INHERITED_COMMON :: 1
HIGH_SURROGATE_END :: 56319
HIGH_SURROGATE_START :: 55296
HIGHLEVEL_SERVICE_TYPES :: 1
IDN_ALLOW_UNASSIGNED :: 1
IDN_EMAIL_ADDRESS :: 4
IDN_RAW_PUNYCODE :: 8
IDN_USE_STD3_ASCII_RULES :: 2
LANG_SYSTEM_DEFAULT :: 2048
LANG_USER_DEFAULT :: 1024
LCID_ALTERNATE_SORTS :: 4
LCMAP_BYTEREV :: 2048
LCMAP_FULLWIDTH :: 8388608
LCMAP_HALFWIDTH :: 4194304
LCMAP_HASH :: 262144
LCMAP_HIRAGANA :: 1048576
LCMAP_KATAKANA :: 2097152
LCMAP_LINGUISTIC_CASING :: 16777216
LCMAP_LOWERCASE :: 256
LCMAP_SIMPLIFIED_CHINESE :: 33554432
LCMAP_SORTHANDLE :: 536870912
LCMAP_SORTKEY :: 1024
LCMAP_TITLECASE :: 768
LCMAP_TRADITIONAL_CHINESE :: 67108864
LCMAP_UPPERCASE :: 512
LGRPID_ARABIC :: 13
LGRPID_ARMENIAN :: 17
LGRPID_BALTIC :: 3
LGRPID_CENTRAL_EUROPE :: 2
LGRPID_CYRILLIC :: 5
LGRPID_GEORGIAN :: 16
LGRPID_GREEK :: 4
LGRPID_HEBREW :: 12
LGRPID_INDIC :: 15
LGRPID_JAPANESE :: 7
LGRPID_KOREAN :: 8
LGRPID_SIMPLIFIED_CHINESE :: 10
LGRPID_THAI :: 11
LGRPID_TRADITIONAL_CHINESE :: 9
LGRPID_TURKIC :: 6
LGRPID_TURKISH :: 6
LGRPID_VIETNAMESE :: 14
LGRPID_WESTERN_EUROPE :: 1
LOCALE_ALL :: 0
LOCALE_ALLOW_NEUTRAL_NAMES :: 134217728
LOCALE_ALTERNATE_SORTS :: 4
LOCALE_FONTSIGNATURE :: 88
LOCALE_ICALENDARTYPE :: 4105
LOCALE_ICENTURY :: 36
LOCALE_ICONSTRUCTEDLOCALE :: 125
LOCALE_ICOUNTRY :: 5
LOCALE_ICURRDIGITS :: 25
LOCALE_ICURRENCY :: 27
LOCALE_IDATE :: 33
LOCALE_IDAYLZERO :: 38
LOCALE_IDEFAULTANSICODEPAGE :: 4100
LOCALE_IDEFAULTCODEPAGE :: 11
LOCALE_IDEFAULTCOUNTRY :: 10
LOCALE_IDEFAULTEBCDICCODEPAGE :: 4114
LOCALE_IDEFAULTLANGUAGE :: 9
LOCALE_IDEFAULTMACCODEPAGE :: 4113
LOCALE_IDIALINGCODE :: 5
LOCALE_IDIGITS :: 17
LOCALE_IDIGITSUBSTITUTION :: 4116
LOCALE_IFIRSTDAYOFWEEK :: 4108
LOCALE_IFIRSTWEEKOFYEAR :: 4109
LOCALE_IGEOID :: 91
LOCALE_IINTLCURRDIGITS :: 26
LOCALE_ILANGUAGE :: 1
LOCALE_ILDATE :: 34
LOCALE_ILZERO :: 18
LOCALE_IMEASURE :: 13
LOCALE_IMONLZERO :: 39
LOCALE_INEGATIVEPERCENT :: 116
LOCALE_INEGCURR :: 28
LOCALE_INEGNUMBER :: 4112
LOCALE_INEGSEPBYSPACE :: 87
LOCALE_INEGSIGNPOSN :: 83
LOCALE_INEGSYMPRECEDES :: 86
LOCALE_INEUTRAL :: 113
LOCALE_IOPTIONALCALENDAR :: 4107
LOCALE_IPAPERSIZE :: 4106
LOCALE_IPOSITIVEPERCENT :: 117
LOCALE_IPOSSEPBYSPACE :: 85
LOCALE_IPOSSIGNPOSN :: 82
LOCALE_IPOSSYMPRECEDES :: 84
LOCALE_IREADINGLAYOUT :: 112
LOCALE_ITIME :: 35
LOCALE_ITIMEMARKPOSN :: 4101
LOCALE_ITLZERO :: 37
LOCALE_IUSEUTF8LEGACYACP :: 1638
LOCALE_IUSEUTF8LEGACYOEMCP :: 2457
LOCALE_NAME_INVARIANT :: ""
LOCALE_NAME_SYSTEM_DEFAULT :: "!x-sys-default-locale"
LOCALE_NEUTRALDATA :: 16
LOCALE_NOUSEROVERRIDE :: 2147483648
LOCALE_REPLACEMENT :: 8
LOCALE_RETURN_GENITIVE_NAMES :: 268435456
LOCALE_RETURN_NUMBER :: 536870912
LOCALE_S1159 :: 40
LOCALE_S2359 :: 41
LOCALE_SABBREVCTRYNAME :: 7
LOCALE_SABBREVDAYNAME1 :: 49
LOCALE_SABBREVDAYNAME2 :: 50
LOCALE_SABBREVDAYNAME3 :: 51
LOCALE_SABBREVDAYNAME4 :: 52
LOCALE_SABBREVDAYNAME5 :: 53
LOCALE_SABBREVDAYNAME6 :: 54
LOCALE_SABBREVDAYNAME7 :: 55
LOCALE_SABBREVLANGNAME :: 3
LOCALE_SABBREVMONTHNAME1 :: 68
LOCALE_SABBREVMONTHNAME10 :: 77
LOCALE_SABBREVMONTHNAME11 :: 78
LOCALE_SABBREVMONTHNAME12 :: 79
LOCALE_SABBREVMONTHNAME13 :: 4111
LOCALE_SABBREVMONTHNAME2 :: 69
LOCALE_SABBREVMONTHNAME3 :: 70
LOCALE_SABBREVMONTHNAME4 :: 71
LOCALE_SABBREVMONTHNAME5 :: 72
LOCALE_SABBREVMONTHNAME6 :: 73
LOCALE_SABBREVMONTHNAME7 :: 74
LOCALE_SABBREVMONTHNAME8 :: 75
LOCALE_SABBREVMONTHNAME9 :: 76
LOCALE_SAM :: 40
LOCALE_SCONSOLEFALLBACKNAME :: 110
LOCALE_SCOUNTRY :: 6
LOCALE_SCURRENCY :: 20
LOCALE_SDATE :: 29
LOCALE_SDAYNAME1 :: 42
LOCALE_SDAYNAME2 :: 43
LOCALE_SDAYNAME3 :: 44
LOCALE_SDAYNAME4 :: 45
LOCALE_SDAYNAME5 :: 46
LOCALE_SDAYNAME6 :: 47
LOCALE_SDAYNAME7 :: 48
LOCALE_SDECIMAL :: 14
LOCALE_SDURATION :: 93
LOCALE_SENGCOUNTRY :: 4098
LOCALE_SENGCURRNAME :: 4103
LOCALE_SENGLANGUAGE :: 4097
LOCALE_SENGLISHCOUNTRYNAME :: 4098
LOCALE_SENGLISHDISPLAYNAME :: 114
LOCALE_SENGLISHLANGUAGENAME :: 4097
LOCALE_SGROUPING :: 16
LOCALE_SINTLSYMBOL :: 21
LOCALE_SISO3166CTRYNAME :: 90
LOCALE_SISO3166CTRYNAME2 :: 104
LOCALE_SISO639LANGNAME :: 89
LOCALE_SISO639LANGNAME2 :: 103
LOCALE_SKEYBOARDSTOINSTALL :: 94
LOCALE_SLANGDISPLAYNAME :: 111
LOCALE_SLANGUAGE :: 2
LOCALE_SLIST :: 12
LOCALE_SLOCALIZEDCOUNTRYNAME :: 6
LOCALE_SLOCALIZEDDISPLAYNAME :: 2
LOCALE_SLOCALIZEDLANGUAGENAME :: 111
LOCALE_SLONGDATE :: 32
LOCALE_SMONDECIMALSEP :: 22
LOCALE_SMONGROUPING :: 24
LOCALE_SMONTHDAY :: 120
LOCALE_SMONTHNAME1 :: 56
LOCALE_SMONTHNAME10 :: 65
LOCALE_SMONTHNAME11 :: 66
LOCALE_SMONTHNAME12 :: 67
LOCALE_SMONTHNAME13 :: 4110
LOCALE_SMONTHNAME2 :: 57
LOCALE_SMONTHNAME3 :: 58
LOCALE_SMONTHNAME4 :: 59
LOCALE_SMONTHNAME5 :: 60
LOCALE_SMONTHNAME6 :: 61
LOCALE_SMONTHNAME7 :: 62
LOCALE_SMONTHNAME8 :: 63
LOCALE_SMONTHNAME9 :: 64
LOCALE_SMONTHOUSANDSEP :: 23
LOCALE_SNAME :: 92
LOCALE_SNAN :: 105
LOCALE_SNATIVECOUNTRYNAME :: 8
LOCALE_SNATIVECTRYNAME :: 8
LOCALE_SNATIVECURRNAME :: 4104
LOCALE_SNATIVEDIGITS :: 19
LOCALE_SNATIVEDISPLAYNAME :: 115
LOCALE_SNATIVELANGNAME :: 4
LOCALE_SNATIVELANGUAGENAME :: 4
LOCALE_SNEGATIVESIGN :: 81
LOCALE_SNEGINFINITY :: 107
LOCALE_SOPENTYPELANGUAGETAG :: 122
LOCALE_SPARENT :: 109
LOCALE_SPECIFICDATA :: 32
LOCALE_SPERCENT :: 118
LOCALE_SPERMILLE :: 119
LOCALE_SPM :: 41
LOCALE_SPOSINFINITY :: 106
LOCALE_SPOSITIVESIGN :: 80
LOCALE_SRELATIVELONGDATE :: 124
LOCALE_SSCRIPTS :: 108
LOCALE_SSHORTDATE :: 31
LOCALE_SSHORTESTAM :: 126
LOCALE_SSHORTESTDAYNAME1 :: 96
LOCALE_SSHORTESTDAYNAME2 :: 97
LOCALE_SSHORTESTDAYNAME3 :: 98
LOCALE_SSHORTESTDAYNAME4 :: 99
LOCALE_SSHORTESTDAYNAME5 :: 100
LOCALE_SSHORTESTDAYNAME6 :: 101
LOCALE_SSHORTESTDAYNAME7 :: 102
LOCALE_SSHORTESTPM :: 127
LOCALE_SSHORTTIME :: 121
LOCALE_SSORTLOCALE :: 123
LOCALE_SSORTNAME :: 4115
LOCALE_STHOUSAND :: 15
LOCALE_STIME :: 30
LOCALE_STIMEFORMAT :: 4099
LOCALE_SUPPLEMENTAL :: 2
LOCALE_SYEARMONTH :: 4102
LOCALE_SYSTEM_DEFAULT :: 2048
LOCALE_USE_CP_ACP :: 1073741824
LOCALE_USER_DEFAULT :: 1024
LOCALE_WINDOWS :: 1
LOW_SURROGATE_END :: 57343
LOW_SURROGATE_START :: 56320
LOWLEVEL_SERVICE_TYPES :: 2
MAX_DEFAULTCHAR :: 2
MAX_LEADBYTES :: 12
MAX_LOCALE_NAME :: 32
MAX_MIMECP_NAME :: 64
MAX_MIMECSET_NAME :: 50
MAX_MIMEFACE_NAME :: 32
MAX_RFC1766_NAME :: 6
MAX_SCRIPT_NAME :: 48
MIN_SPELLING_NTDDI :: 100794368
MUI_COMPLEX_SCRIPT_FILTER :: 512
MUI_CONSOLE_FILTER :: 256
MUI_FILEINFO_VERSION :: 1
MUI_FILETYPE_LANGUAGE_NEUTRAL_MAIN :: 2
MUI_FILETYPE_LANGUAGE_NEUTRAL_MUI :: 4
MUI_FILETYPE_NOT_LANGUAGE_NEUTRAL :: 1
MUI_FORMAT_INF_COMPAT :: 2
MUI_FORMAT_REG_COMPAT :: 1
MUI_FULL_LANGUAGE :: 1
MUI_IMMUTABLE_LOOKUP :: 16
MUI_LANG_NEUTRAL_PE_FILE :: 256
MUI_LANGUAGE_EXACT :: 16
MUI_LANGUAGE_ID :: 4
MUI_LANGUAGE_INSTALLED :: 32
MUI_LANGUAGE_LICENSED :: 64
MUI_LANGUAGE_NAME :: 8
MUI_LIP_LANGUAGE :: 4
MUI_MACHINE_LANGUAGE_SETTINGS :: 1024
MUI_MERGE_SYSTEM_FALLBACK :: 16
MUI_MERGE_USER_FALLBACK :: 32
MUI_NON_LANG_NEUTRAL_FILE :: 512
MUI_PARTIAL_LANGUAGE :: 2
MUI_QUERY_CHECKSUM :: 2
MUI_QUERY_LANGUAGE_NAME :: 4
MUI_QUERY_RESOURCE_TYPES :: 8
MUI_QUERY_TYPE :: 1
MUI_RESET_FILTERS :: 1
MUI_SKIP_STRING_CACHE :: 8
MUI_THREAD_LANGUAGES :: 64
MUI_USE_INSTALLED_LANGUAGES :: 32
MUI_USE_SEARCH_ALL_LANGUAGES :: 64
MUI_USER_PREFERRED_UI_LANGUAGES :: 16
MUI_VERIFY_FILE_EXISTS :: 4
NLS_CP_CPINFO :: 268435456
NLS_CP_MBTOWC :: 1073741824
NLS_CP_WCTOMB :: 2147483648
NUMSYS_NAME_CAPACITY :: 8
OFFLINE_SERVICES :: 2
ONLINE_SERVICES :: 1
SCRIPT_DIGITSUBSTITUTE_CONTEXT :: 0
SCRIPT_DIGITSUBSTITUTE_NATIONAL :: 2
SCRIPT_DIGITSUBSTITUTE_NONE :: 1
SCRIPT_DIGITSUBSTITUTE_TRADITIONAL :: 3
SCRIPT_TAG_UNKNOWN :: 0
SCRIPT_UNDEFINED :: 0
SGCM_RTL :: 1
SORTING_PARADIGM_ICU :: 16777216
SORTING_PARADIGM_NLS :: 0
SSA_BREAK :: 64
SSA_CLIP :: 4
SSA_DONTGLYPH :: 1073741824
SSA_DZWG :: 16
SSA_FALLBACK :: 32
SSA_FIT :: 8
SSA_FULLMEASURE :: 67108864
SSA_GCP :: 512
SSA_GLYPHS :: 128
SSA_HIDEHOTKEY :: 8192
SSA_HOTKEY :: 1024
SSA_HOTKEYONLY :: 9216
SSA_LAYOUTRTL :: 536870912
SSA_LINK :: 4096
SSA_LPKANSIFALLBACK :: 134217728
SSA_METAFILE :: 2048
SSA_NOKASHIDA :: 2147483648
SSA_PASSWORD :: 1
SSA_PIDX :: 268435456
SSA_RTL :: 256
SSA_TAB :: 2
U_ASCII_FAMILY :: 0
U_CHAR16_IS_TYPEDEF :: 1
U_CHARSET_FAMILY :: 1
U_CHARSET_IS_UTF8 :: 1
U_CHECK_DYLOAD :: 1
U_COMBINED_IMPLEMENTATION :: 1
U_COMPARE_CODE_POINT_ORDER :: 32768
U_COMPARE_IGNORE_CASE :: 65536
U_COPYRIGHT_STRING_LENGTH :: 128
U_CPLUSPLUS_VERSION :: 0
U_DEBUG :: 1
U_DEFAULT_SHOW_DRAFT :: 0
U_DEFINE_FALSE_AND_TRUE :: 1
U_DISABLE_RENAMING :: 1
U_EBCDIC_FAMILY :: 1
U_EDITS_NO_RESET :: 8192
U_ENABLE_DYLOAD :: 1
U_ENABLE_TRACING :: 0
U_FOLD_CASE_DEFAULT :: 0
U_FOLD_CASE_EXCLUDE_SPECIAL_I :: 1
U_GCC_MAJOR_MINOR :: 0
U_HAVE_CHAR16_T :: 1
U_HAVE_DEBUG_LOCATION_NEW :: 1
U_HAVE_INTTYPES_H :: 1
U_HAVE_LIB_SUFFIX :: 1
U_HAVE_PLACEMENT_NEW :: 0
U_HAVE_RBNF :: 0
U_HAVE_RVALUE_REFERENCES :: 1
U_HAVE_STD_STRING :: 0
U_HAVE_STDINT_H :: 1
U_HAVE_WCHAR_H :: 0
U_HAVE_WCSCPY :: 0
U_HIDE_DEPRECATED_API :: 1
U_HIDE_DRAFT_API :: 1
U_HIDE_INTERNAL_API :: 1
U_HIDE_OBSOLETE_API :: 1
U_HIDE_OBSOLETE_UTF_OLD_H :: 0
U_ICU_DATA_KEY :: "DataVersion"
U_ICU_VERSION_BUNDLE :: "icuver"
U_ICUDATA_TYPE_LETTER :: "e"
U_IOSTREAM_SOURCE :: 199711
U_IS_BIG_ENDIAN :: 0
U_LIB_SUFFIX_C_NAME_STRING :: ""
U_MAX_VERSION_LENGTH :: 4
U_MAX_VERSION_STRING_LENGTH :: 20
U_MILLIS_PER_DAY :: 86400000
U_MILLIS_PER_HOUR :: 3600000
U_MILLIS_PER_MINUTE :: 60000
U_MILLIS_PER_SECOND :: 1000
U_NO_DEFAULT_INCLUDE_UTF_HEADERS :: 1
U_OMIT_UNCHANGED_TEXT :: 16384
U_OVERRIDE_CXX_ALLOCATION :: 1
U_PARSE_CONTEXT_LEN :: 16
U_PF_AIX :: 3100
U_PF_ANDROID :: 4050
U_PF_BROWSER_NATIVE_CLIENT :: 4020
U_PF_BSD :: 3000
U_PF_CYGWIN :: 1900
U_PF_DARWIN :: 3500
U_PF_EMSCRIPTEN :: 5010
U_PF_FUCHSIA :: 4100
U_PF_HPUX :: 2100
U_PF_IPHONE :: 3550
U_PF_IRIX :: 3200
U_PF_LINUX :: 4000
U_PF_MINGW :: 1800
U_PF_OS390 :: 9000
U_PF_OS400 :: 9400
U_PF_QNX :: 3700
U_PF_SOLARIS :: 2600
U_PF_UNKNOWN :: 0
U_PF_WINDOWS :: 1000
U_PLATFORM :: 1800
U_PLATFORM_HAS_WIN32_API :: 1
U_PLATFORM_HAS_WINUWP_API :: 0
U_PLATFORM_IMPLEMENTS_POSIX :: 0
U_PLATFORM_IS_DARWIN_BASED :: 1
U_PLATFORM_IS_LINUX_BASED :: 1
U_PLATFORM_USES_ONLY_WIN32_API :: 1
U_SENTINEL :: -1
U_SHAPE_AGGREGATE_TASHKEEL :: 16384
U_SHAPE_AGGREGATE_TASHKEEL_MASK :: 16384
U_SHAPE_AGGREGATE_TASHKEEL_NOOP :: 0
U_SHAPE_DIGIT_TYPE_AN :: 0
U_SHAPE_DIGIT_TYPE_AN_EXTENDED :: 256
U_SHAPE_DIGIT_TYPE_MASK :: 768
U_SHAPE_DIGIT_TYPE_RESERVED :: 512
U_SHAPE_DIGITS_ALEN2AN_INIT_AL :: 128
U_SHAPE_DIGITS_ALEN2AN_INIT_LR :: 96
U_SHAPE_DIGITS_AN2EN :: 64
U_SHAPE_DIGITS_EN2AN :: 32
U_SHAPE_DIGITS_MASK :: 224
U_SHAPE_DIGITS_NOOP :: 0
U_SHAPE_DIGITS_RESERVED :: 160
U_SHAPE_LAMALEF_AUTO :: 65536
U_SHAPE_LAMALEF_BEGIN :: 3
U_SHAPE_LAMALEF_END :: 2
U_SHAPE_LAMALEF_MASK :: 65539
U_SHAPE_LAMALEF_NEAR :: 1
U_SHAPE_LAMALEF_RESIZE :: 0
U_SHAPE_LENGTH_FIXED_SPACES_AT_BEGINNING :: 3
U_SHAPE_LENGTH_FIXED_SPACES_AT_END :: 2
U_SHAPE_LENGTH_FIXED_SPACES_NEAR :: 1
U_SHAPE_LENGTH_GROW_SHRINK :: 0
U_SHAPE_LENGTH_MASK :: 65539
U_SHAPE_LETTERS_MASK :: 24
U_SHAPE_LETTERS_NOOP :: 0
U_SHAPE_LETTERS_SHAPE :: 8
U_SHAPE_LETTERS_SHAPE_TASHKEEL_ISOLATED :: 24
U_SHAPE_LETTERS_UNSHAPE :: 16
U_SHAPE_PRESERVE_PRESENTATION :: 32768
U_SHAPE_PRESERVE_PRESENTATION_MASK :: 32768
U_SHAPE_PRESERVE_PRESENTATION_NOOP :: 0
U_SHAPE_SEEN_MASK :: 7340032
U_SHAPE_SEEN_TWOCELL_NEAR :: 2097152
U_SHAPE_SPACES_RELATIVE_TO_TEXT_BEGIN_END :: 67108864
U_SHAPE_SPACES_RELATIVE_TO_TEXT_MASK :: 67108864
U_SHAPE_TAIL_NEW_UNICODE :: 134217728
U_SHAPE_TAIL_TYPE_MASK :: 134217728
U_SHAPE_TASHKEEL_BEGIN :: 262144
U_SHAPE_TASHKEEL_END :: 393216
U_SHAPE_TASHKEEL_MASK :: 917504
U_SHAPE_TASHKEEL_REPLACE_BY_TATWEEL :: 786432
U_SHAPE_TASHKEEL_RESIZE :: 524288
U_SHAPE_TEXT_DIRECTION_LOGICAL :: 0
U_SHAPE_TEXT_DIRECTION_MASK :: 4
U_SHAPE_TEXT_DIRECTION_VISUAL_LTR :: 4
U_SHAPE_TEXT_DIRECTION_VISUAL_RTL :: 0
U_SHAPE_YEHHAMZA_MASK :: 58720256
U_SHAPE_YEHHAMZA_TWOCELL_NEAR :: 16777216
U_SHOW_CPLUSPLUS_API :: 0
U_SIZEOF_UCHAR :: 2
U_SIZEOF_WCHAR_T :: 1
U_TITLECASE_ADJUST_TO_CASED :: 1024
U_TITLECASE_NO_BREAK_ADJUSTMENT :: 512
U_TITLECASE_NO_LOWERCASE :: 256
U_TITLECASE_SENTENCES :: 64
U_TITLECASE_WHOLE_STRING :: 32
U_UNICODE_VERSION :: "8.0"
U_USING_ICU_NAMESPACE :: 1
U16_MAX_LENGTH :: 2
U8_LEAD3_T1_BITS :: " 000000000000\u001000"
U8_LEAD4_T1_BITS :: "\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u001e\u000f\u000f\u000f\u0000\u0000\u0000\u0000"
U8_MAX_LENGTH :: 4
UBIDI_DEFAULT_LTR :: 254
UBIDI_DEFAULT_RTL :: 255
UBIDI_DO_MIRRORING :: 2
UBIDI_INSERT_LRM_FOR_NUMERIC :: 4
UBIDI_KEEP_BASE_COMBINING :: 1
UBIDI_LEVEL_OVERRIDE :: 128
UBIDI_MAP_NOWHERE :: -1
UBIDI_MAX_EXPLICIT_LEVEL :: 125
UBIDI_OUTPUT_REVERSE :: 16
UBIDI_REMOVE_BIDI_CONTROLS :: 8
UCAL_UNKNOWN_ZONE_ID :: "Etc/Unknown"
UCHAR_MAX_VALUE :: 1114111
UCHAR_MIN_VALUE :: 0
UCLN_NO_AUTO_CLEANUP :: 1
UCNV_ESCAPE_C :: "C"
UCNV_ESCAPE_CSS2 :: "S"
UCNV_ESCAPE_JAVA :: "J"
UCNV_ESCAPE_UNICODE :: "U"
UCNV_ESCAPE_XML_DEC :: "D"
UCNV_ESCAPE_XML_HEX :: "X"
UCNV_LOCALE_OPTION_STRING :: ",locale="
UCNV_MAX_CONVERTER_NAME_LENGTH :: 60
UCNV_OPTION_SEP_STRING :: ","
UCNV_SI :: 15
UCNV_SKIP_STOP_ON_ILLEGAL :: "i"
UCNV_SO :: 14
UCNV_SUB_STOP_ON_ILLEGAL :: "i"
UCNV_SWAP_LFNL_OPTION_STRING :: ",swaplfnl"
UCNV_VALUE_SEP_STRING :: "="
UCNV_VERSION_OPTION_STRING :: ",version="
UCONFIG_ENABLE_PLUGINS :: 0
UCONFIG_FORMAT_FASTPATHS_49 :: 1
UCONFIG_HAVE_PARSEALLINPUT :: 1
UCONFIG_NO_BREAK_ITERATION :: 1
UCONFIG_NO_COLLATION :: 1
UCONFIG_NO_CONVERSION :: 0
UCONFIG_NO_FILE_IO :: 0
UCONFIG_NO_FILTERED_BREAK_ITERATION :: 0
UCONFIG_NO_FORMATTING :: 1
UCONFIG_NO_IDNA :: 1
UCONFIG_NO_LEGACY_CONVERSION :: 1
UCONFIG_NO_NORMALIZATION :: 0
UCONFIG_NO_REGULAR_EXPRESSIONS :: 1
UCONFIG_NO_SERVICE :: 0
UCONFIG_NO_TRANSLITERATION :: 1
UCONFIG_ONLY_COLLATION :: 0
UCONFIG_ONLY_HTML_CONVERSION :: 0
UCPTRIE_ERROR_VALUE_NEG_DATA_OFFSET :: 1
UCPTRIE_FAST_DATA_BLOCK_LENGTH :: 64
UCPTRIE_FAST_DATA_MASK :: 63
UCPTRIE_FAST_SHIFT :: 6
UCPTRIE_HIGH_VALUE_NEG_DATA_OFFSET :: 2
UCPTRIE_SMALL_MAX :: 4095
UDAT_ABBR_GENERIC_TZ :: "v"
UDAT_ABBR_MONTH :: "MMM"
UDAT_ABBR_MONTH_DAY :: "MMMd"
UDAT_ABBR_MONTH_WEEKDAY_DAY :: "MMMEd"
UDAT_ABBR_QUARTER :: "QQQ"
UDAT_ABBR_SPECIFIC_TZ :: "z"
UDAT_ABBR_UTC_TZ :: "ZZZZ"
UDAT_ABBR_WEEKDAY :: "E"
UDAT_DAY :: "d"
UDAT_GENERIC_TZ :: "vvvv"
UDAT_HOUR :: "j"
UDAT_HOUR_MINUTE :: "jm"
UDAT_HOUR_MINUTE_SECOND :: "jms"
UDAT_HOUR24 :: "H"
UDAT_HOUR24_MINUTE :: "Hm"
UDAT_HOUR24_MINUTE_SECOND :: "Hms"
UDAT_LOCATION_TZ :: "VVVV"
UDAT_MINUTE :: "m"
UDAT_MINUTE_SECOND :: "ms"
UDAT_MONTH :: "MMMM"
UDAT_MONTH_DAY :: "MMMMd"
UDAT_MONTH_WEEKDAY_DAY :: "MMMMEEEEd"
UDAT_NUM_MONTH :: "M"
UDAT_NUM_MONTH_DAY :: "Md"
UDAT_NUM_MONTH_WEEKDAY_DAY :: "MEd"
UDAT_QUARTER :: "QQQQ"
UDAT_SECOND :: "s"
UDAT_SPECIFIC_TZ :: "zzzz"
UDAT_WEEKDAY :: "EEEE"
UDAT_YEAR :: "y"
UDAT_YEAR_ABBR_MONTH :: "yMMM"
UDAT_YEAR_ABBR_MONTH_DAY :: "yMMMd"
UDAT_YEAR_ABBR_MONTH_WEEKDAY_DAY :: "yMMMEd"
UDAT_YEAR_ABBR_QUARTER :: "yQQQ"
UDAT_YEAR_MONTH :: "yMMMM"
UDAT_YEAR_MONTH_DAY :: "yMMMMd"
UDAT_YEAR_MONTH_WEEKDAY_DAY :: "yMMMMEEEEd"
UDAT_YEAR_NUM_MONTH :: "yM"
UDAT_YEAR_NUM_MONTH_DAY :: "yMd"
UDAT_YEAR_NUM_MONTH_WEEKDAY_DAY :: "yMEd"
UDAT_YEAR_QUARTER :: "yQQQQ"
UIDNA_CHECK_BIDI :: 4
UIDNA_CHECK_CONTEXTJ :: 8
UIDNA_CHECK_CONTEXTO :: 64
UIDNA_DEFAULT :: 0
UIDNA_ERROR_BIDI :: 2048
UIDNA_ERROR_CONTEXTJ :: 4096
UIDNA_ERROR_CONTEXTO_DIGITS :: 16384
UIDNA_ERROR_CONTEXTO_PUNCTUATION :: 8192
UIDNA_ERROR_DISALLOWED :: 128
UIDNA_ERROR_DOMAIN_NAME_TOO_LONG :: 4
UIDNA_ERROR_EMPTY_LABEL :: 1
UIDNA_ERROR_HYPHEN_3_4 :: 32
UIDNA_ERROR_INVALID_ACE_LABEL :: 1024
UIDNA_ERROR_LABEL_HAS_DOT :: 512
UIDNA_ERROR_LABEL_TOO_LONG :: 2
UIDNA_ERROR_LEADING_COMBINING_MARK :: 64
UIDNA_ERROR_LEADING_HYPHEN :: 8
UIDNA_ERROR_PUNYCODE :: 256
UIDNA_ERROR_TRAILING_HYPHEN :: 16
UIDNA_NONTRANSITIONAL_TO_ASCII :: 16
UIDNA_NONTRANSITIONAL_TO_UNICODE :: 32
UIDNA_USE_STD3_RULES :: 2
UITER_UNKNOWN_INDEX :: -2
ULOC_CANADA :: "en_CA"
ULOC_CANADA_FRENCH :: "fr_CA"
ULOC_CHINA :: "zh_CN"
ULOC_CHINESE :: "zh"
ULOC_COUNTRY_CAPACITY :: 4
ULOC_ENGLISH :: "en"
ULOC_FRANCE :: "fr_FR"
ULOC_FRENCH :: "fr"
ULOC_FULLNAME_CAPACITY :: 157
ULOC_GERMAN :: "de"
ULOC_GERMANY :: "de_DE"
ULOC_ITALIAN :: "it"
ULOC_ITALY :: "it_IT"
ULOC_JAPAN :: "ja_JP"
ULOC_JAPANESE :: "ja"
ULOC_KEYWORD_AND_VALUES_CAPACITY :: 100
ULOC_KEYWORD_ASSIGN_UNICODE :: 61
ULOC_KEYWORD_ITEM_SEPARATOR_UNICODE :: 59
ULOC_KEYWORD_SEPARATOR_UNICODE :: 64
ULOC_KEYWORDS_CAPACITY :: 96
ULOC_KOREA :: "ko_KR"
ULOC_KOREAN :: "ko"
ULOC_LANG_CAPACITY :: 12
ULOC_PRC :: "zh_CN"
ULOC_SCRIPT_CAPACITY :: 6
ULOC_SIMPLIFIED_CHINESE :: "zh_CN"
ULOC_TAIWAN :: "zh_TW"
ULOC_TRADITIONAL_CHINESE :: "zh_TW"
ULOC_UK :: "en_GB"
ULOC_US :: "en_US"
UMSGPAT_ARG_NAME_NOT_NUMBER :: -1
UMSGPAT_ARG_NAME_NOT_VALID :: -2
UNISCRIBE_OPENTYPE :: 256
UNORM_INPUT_IS_FCD :: 131072
USEARCH_DONE :: -1
USET_ADD_CASE_MAPPINGS :: 4
USET_CASE_INSENSITIVE :: 2
USET_IGNORE_SPACE :: 1
USET_SERIALIZED_STATIC_ARRAY_CAPACITY :: 8
USP_E_SCRIPT_NOT_IN_FONT :: -2147220992
USPREP_ALLOW_UNASSIGNED :: 1
USPREP_DEFAULT :: 0
UTEXT_MAGIC :: 878368812
UTEXT_PROVIDER_HAS_META_DATA :: 4
UTEXT_PROVIDER_LENGTH_IS_EXPENSIVE :: 1
UTEXT_PROVIDER_OWNS_TEXT :: 5
UTEXT_PROVIDER_STABLE_CHUNKS :: 2
UTEXT_PROVIDER_WRITABLE :: 3
UTF_ERROR_VALUE :: 65535
UTF_MAX_CHAR_LENGTH :: 2
UTF_SIZE :: 16
UTF16_MAX_CHAR_LENGTH :: 2
UTF32_MAX_CHAR_LENGTH :: 1
UTF8_ERROR_VALUE_1 :: 21
UTF8_ERROR_VALUE_2 :: 159
UTF8_MAX_CHAR_LENGTH :: 4
VS_ALLOW_LATIN :: 1
WC_COMPOSITECHECK :: 512
WC_DEFAULTCHAR :: 64
WC_DISCARDNS :: 16
WC_ERR_INVALID_CHARS :: 128
WC_NO_BEST_FIT_CHARS :: 1024
WC_SEPCHARS :: 32

