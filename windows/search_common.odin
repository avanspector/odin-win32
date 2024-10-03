package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_operation ]]
CONDITION_OPERATION :: enum i32 {
	IMPLICIT = 0,
	EQUAL = 1,
	NOTEQUAL = 2,
	LESSTHAN = 3,
	GREATERTHAN = 4,
	LESSTHANOREQUAL = 5,
	GREATERTHANOREQUAL = 6,
	VALUE_STARTSWITH = 7,
	VALUE_ENDSWITH = 8,
	VALUE_CONTAINS = 9,
	VALUE_NOTCONTAINS = 10,
	DOSWILDCARDS = 11,
	WORD_EQUAL = 12,
	WORD_STARTSWITH = 13,
	APPLICATION_SPECIFIC = 14,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/structuredquerycondition/ne-structuredquerycondition-condition_type ]]
CONDITION_TYPE :: enum i32 {
	AND_CONDITION = 0,
	OR_CONDITION = 1,
	NOT_CONDITION = 2,
	LEAF_CONDITION = 3,
}

