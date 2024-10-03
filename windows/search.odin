package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nn-structuredquerycondition-icondition ]]
ICondition :: struct #raw_union {
	#subtype IPersistStream: IPersistStream,
	using Vtbl: ^ICondition_Vtbl,
}
ICondition_Vtbl :: struct {
	using IPersistStream_Vtbl: IPersistStream_Vtbl,
	GetConditionType: proc "system" (this: ^ICondition, pNodeType: ^CONDITION_TYPE) -> HRESULT,
	GetSubConditions: proc "system" (this: ^ICondition, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	GetComparisonInfo: proc "system" (
		this: ^ICondition,
		ppszPropertyName: ^PWSTR,
		pcop: ^CONDITION_OPERATION,
		ppropvar: ^PROPVARIANT,
	) -> HRESULT,
	GetValueType: proc "system" (this: ^ICondition, ppszValueTypeName: ^PWSTR) -> HRESULT,
	GetValueNormalization: proc "system" (this: ^ICondition, ppszNormalization: ^PWSTR) -> HRESULT,
	GetInputTerms: proc "system" (
		this: ^ICondition,
		ppPropertyTerm: ^^IRichChunk,
		ppOperationTerm: ^^IRichChunk,
		ppValueTerm: ^^IRichChunk,
	) -> HRESULT,
	Clone: proc "system" (this: ^ICondition, ppc: ^^ICondition) -> HRESULT,
}
IID_ICondition :: GUID{0x0FC988D4, 0xC935, 0x4B97, {0xA9, 0x73, 0x46, 0x28, 0x2E, 0xA1, 0x75, 0xC8}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/structuredquerycondition/nn-structuredquerycondition-irichchunk ]]
IRichChunk :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IRichChunk_Vtbl,
}
IRichChunk_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetData: proc "system" (
		this: ^IRichChunk,
		pFirstPos: ^u32,
		pLength: ^u32,
		ppsz: ^PWSTR,
		pValue: ^PROPVARIANT,
	) -> HRESULT,
}
IID_IRichChunk :: GUID{0x4FDEF69C, 0xDBC9, 0x454E, {0x99, 0x10, 0xB3, 0x4F, 0x3C, 0x64, 0xB5, 0x10}}

