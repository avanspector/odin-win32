package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propsys/ne-propsys-getpropertystoreflags ]]
GETPROPERTYSTOREFLAGS :: distinct bit_set[enum {
	HANDLERPROPERTIESONLY = 0,
	READWRITE = 1,
	TEMPORARY = 2,
	FASTPROPERTIESONLY = 3,
	OPENSLOWITEM = 4,
	DELAYCREATION = 5,
	BESTEFFORT = 6,
	NO_OPLOCK = 7,
	PREFERQUERYPROPERTIES = 8,
	EXTRINSICPROPERTIES = 9,
	EXTRINSICPROPERTIESONLY = 10,
	VOLATILEPROPERTIES = 11,
	VOLATILEPROPERTIESONLY = 12,
}; i32]
GETPROPERTYSTOREFLAGS_DEFAULT :: transmute(GETPROPERTYSTOREFLAGS)i32(0)
GETPROPERTYSTOREFLAGS_MASK_VALID :: transmute(GETPROPERTYSTOREFLAGS)i32(8191)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-iobjectwithpropertykey ]]
IObjectWithPropertyKey :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IObjectWithPropertyKey_Vtbl,
}
IObjectWithPropertyKey_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	SetPropertyKey: proc "system" (this: ^IObjectWithPropertyKey, #by_ptr key: PROPERTYKEY) -> HRESULT,
	GetPropertyKey: proc "system" (this: ^IObjectWithPropertyKey, pkey: ^PROPERTYKEY) -> HRESULT,
}
IID_IObjectWithPropertyKey :: GUID{0xFC0CA0A7, 0xC316, 0x4FD2, {0x90, 0x31, 0x3E, 0x62, 0x8E, 0x6D, 0x4F, 0x23}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertychange ]]
IPropertyChange :: struct #raw_union {
	#subtype IObjectWithPropertyKey: IObjectWithPropertyKey,
	using Vtbl: ^IPropertyChange_Vtbl,
}
IPropertyChange_Vtbl :: struct {
	using IObjectWithPropertyKey_Vtbl: IObjectWithPropertyKey_Vtbl,
	ApplyToPropVariant: proc "system" (
		this: ^IPropertyChange,
		#by_ptr propvarIn: PROPVARIANT,
		ppropvarOut: ^PROPVARIANT,
	) -> HRESULT,
}
IID_IPropertyChange :: GUID{0xF917BC8A, 0x1BBA, 0x4478, {0xA2, 0x45, 0x1B, 0xDE, 0x03, 0xEB, 0x94, 0x31}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertychangearray ]]
IPropertyChangeArray :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPropertyChangeArray_Vtbl,
}
IPropertyChangeArray_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCount: proc "system" (this: ^IPropertyChangeArray, pcOperations: ^u32) -> HRESULT,
	GetAt: proc "system" (this: ^IPropertyChangeArray, iIndex: u32, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
	InsertAt: proc "system" (this: ^IPropertyChangeArray, iIndex: u32, ppropChange: ^IPropertyChange) -> HRESULT,
	Append: proc "system" (this: ^IPropertyChangeArray, ppropChange: ^IPropertyChange) -> HRESULT,
	AppendOrReplace: proc "system" (this: ^IPropertyChangeArray, ppropChange: ^IPropertyChange) -> HRESULT,
	RemoveAt: proc "system" (this: ^IPropertyChangeArray, iIndex: u32) -> HRESULT,
	IsKeyInArray: proc "system" (this: ^IPropertyChangeArray, #by_ptr key: PROPERTYKEY) -> HRESULT,
}
IID_IPropertyChangeArray :: GUID{0x380F5CAD, 0x1B5E, 0x42F2, {0x80, 0x5D, 0x63, 0x7F, 0xD3, 0x92, 0xD3, 0x1E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertydescriptionlist ]]
IPropertyDescriptionList :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPropertyDescriptionList_Vtbl,
}
IPropertyDescriptionList_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCount: proc "system" (this: ^IPropertyDescriptionList, pcElem: ^u32) -> HRESULT,
	GetAt: proc "system" (this: ^IPropertyDescriptionList, iElem: u32, #by_ptr riid: GUID, ppv: rawptr) -> HRESULT,
}
IID_IPropertyDescriptionList :: GUID{0x1F9FC1D0, 0xC39B, 0x4B26, {0x81, 0x7F, 0x01, 0x19, 0x67, 0xD3, 0x44, 0x0E}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/propsys/nn-propsys-ipropertystore ]]
IPropertyStore :: struct #raw_union {
	#subtype IUnknown: IUnknown,
	using Vtbl: ^IPropertyStore_Vtbl,
}
IPropertyStore_Vtbl :: struct {
	using IUnknown_Vtbl: IUnknown_Vtbl,
	GetCount: proc "system" (this: ^IPropertyStore, cProps: ^u32) -> HRESULT,
	GetAt: proc "system" (this: ^IPropertyStore, iProp: u32, pkey: ^PROPERTYKEY) -> HRESULT,
	GetValue: proc "system" (this: ^IPropertyStore, #by_ptr key: PROPERTYKEY, pv: ^PROPVARIANT) -> HRESULT,
	SetValue: proc "system" (
		this: ^IPropertyStore,
		#by_ptr key: PROPERTYKEY,
		#by_ptr propvar: PROPVARIANT,
	) -> HRESULT,
	Commit: proc "system" (this: ^IPropertyStore) -> HRESULT,
}
IID_IPropertyStore :: GUID{0x886D8EEB, 0x8CF2, 0x4446, {0x8D, 0x02, 0xCD, 0xBA, 0x1D, 0xBD, 0xCF, 0x99}}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-pdopstatus ]]
PDOPSTATUS :: enum i32 {
	RUNNING = 1,
	PAUSED = 2,
	CANCELLED = 3,
	STOPPED = 4,
	ERRORS = 5,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wtypes/ns-wtypes-propertykey ]]
PROPERTYKEY :: struct {
	fmtid: GUID,
	pid: u32,
}

