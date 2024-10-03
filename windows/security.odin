package windows

foreign import advapi32 "system:advapi32.lib"
foreign import kernel32 "system:kernel32.lib"
foreign import ntdll "system:ntdll.lib"
foreign import user32 "system:user32.lib"

@(default_calling_convention="system")
foreign advapi32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-accesscheck ]]
	AccessCheck :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		ClientToken: HANDLE,
		DesiredAccess: u32,
		GenericMapping: ^GENERIC_MAPPING,
		PrivilegeSet: ^PRIVILEGE_SET,
		PrivilegeSetLength: ^u32,
		GrantedAccess: ^u32,
		AccessStatus: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-accesscheckandauditalarma ]]
	AccessCheckAndAuditAlarmA :: proc(
		SubsystemName: PSTR,
		HandleId: rawptr,
		ObjectTypeName: PSTR,
		ObjectName: PSTR,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
		DesiredAccess: u32,
		GenericMapping: ^GENERIC_MAPPING,
		ObjectCreation: BOOL,
		GrantedAccess: ^u32,
		AccessStatus: ^BOOL,
		pfGenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-accesscheckandauditalarmw ]]
	AccessCheckAndAuditAlarmW :: proc(
		SubsystemName: PWSTR,
		HandleId: rawptr,
		ObjectTypeName: PWSTR,
		ObjectName: PWSTR,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
		DesiredAccess: u32,
		GenericMapping: ^GENERIC_MAPPING,
		ObjectCreation: BOOL,
		GrantedAccess: ^u32,
		AccessStatus: ^BOOL,
		pfGenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-accesscheckbytype ]]
	AccessCheckByType :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		PrincipalSelfSid: PSID,
		ClientToken: HANDLE,
		DesiredAccess: u32,
		ObjectTypeList: [^]OBJECT_TYPE_LIST,
		ObjectTypeListLength: u32,
		GenericMapping: ^GENERIC_MAPPING,
		PrivilegeSet: ^PRIVILEGE_SET,
		PrivilegeSetLength: ^u32,
		GrantedAccess: ^u32,
		AccessStatus: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-accesscheckbytypeandauditalarma ]]
	AccessCheckByTypeAndAuditAlarmA :: proc(
		SubsystemName: PSTR,
		HandleId: rawptr,
		ObjectTypeName: PSTR,
		ObjectName: PSTR,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
		PrincipalSelfSid: PSID,
		DesiredAccess: u32,
		AuditType: AUDIT_EVENT_TYPE,
		Flags: u32,
		ObjectTypeList: [^]OBJECT_TYPE_LIST,
		ObjectTypeListLength: u32,
		GenericMapping: ^GENERIC_MAPPING,
		ObjectCreation: BOOL,
		GrantedAccess: ^u32,
		AccessStatus: ^BOOL,
		pfGenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-accesscheckbytypeandauditalarmw ]]
	AccessCheckByTypeAndAuditAlarmW :: proc(
		SubsystemName: PWSTR,
		HandleId: rawptr,
		ObjectTypeName: PWSTR,
		ObjectName: PWSTR,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
		PrincipalSelfSid: PSID,
		DesiredAccess: u32,
		AuditType: AUDIT_EVENT_TYPE,
		Flags: u32,
		ObjectTypeList: [^]OBJECT_TYPE_LIST,
		ObjectTypeListLength: u32,
		GenericMapping: ^GENERIC_MAPPING,
		ObjectCreation: BOOL,
		GrantedAccess: ^u32,
		AccessStatus: ^BOOL,
		pfGenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-accesscheckbytyperesultlist ]]
	AccessCheckByTypeResultList :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		PrincipalSelfSid: PSID,
		ClientToken: HANDLE,
		DesiredAccess: u32,
		ObjectTypeList: [^]OBJECT_TYPE_LIST,
		ObjectTypeListLength: u32,
		GenericMapping: ^GENERIC_MAPPING,
		PrivilegeSet: ^PRIVILEGE_SET,
		PrivilegeSetLength: ^u32,
		GrantedAccessList: [^]u32,
		AccessStatusList: [^]u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-accesscheckbytyperesultlistandauditalarma ]]
	AccessCheckByTypeResultListAndAuditAlarmA :: proc(
		SubsystemName: PSTR,
		HandleId: rawptr,
		ObjectTypeName: PSTR,
		ObjectName: PSTR,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
		PrincipalSelfSid: PSID,
		DesiredAccess: u32,
		AuditType: AUDIT_EVENT_TYPE,
		Flags: u32,
		ObjectTypeList: [^]OBJECT_TYPE_LIST,
		ObjectTypeListLength: u32,
		GenericMapping: ^GENERIC_MAPPING,
		ObjectCreation: BOOL,
		GrantedAccess: [^]u32,
		AccessStatusList: [^]u32,
		pfGenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-accesscheckbytyperesultlistandauditalarmbyhandlea ]]
	AccessCheckByTypeResultListAndAuditAlarmByHandleA :: proc(
		SubsystemName: PSTR,
		HandleId: rawptr,
		ClientToken: HANDLE,
		ObjectTypeName: PSTR,
		ObjectName: PSTR,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
		PrincipalSelfSid: PSID,
		DesiredAccess: u32,
		AuditType: AUDIT_EVENT_TYPE,
		Flags: u32,
		ObjectTypeList: [^]OBJECT_TYPE_LIST,
		ObjectTypeListLength: u32,
		GenericMapping: ^GENERIC_MAPPING,
		ObjectCreation: BOOL,
		GrantedAccess: [^]u32,
		AccessStatusList: [^]u32,
		pfGenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-accesscheckbytyperesultlistandauditalarmbyhandlew ]]
	AccessCheckByTypeResultListAndAuditAlarmByHandleW :: proc(
		SubsystemName: PWSTR,
		HandleId: rawptr,
		ClientToken: HANDLE,
		ObjectTypeName: PWSTR,
		ObjectName: PWSTR,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
		PrincipalSelfSid: PSID,
		DesiredAccess: u32,
		AuditType: AUDIT_EVENT_TYPE,
		Flags: u32,
		ObjectTypeList: [^]OBJECT_TYPE_LIST,
		ObjectTypeListLength: u32,
		GenericMapping: ^GENERIC_MAPPING,
		ObjectCreation: BOOL,
		GrantedAccessList: [^]u32,
		AccessStatusList: [^]u32,
		pfGenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-accesscheckbytyperesultlistandauditalarmw ]]
	AccessCheckByTypeResultListAndAuditAlarmW :: proc(
		SubsystemName: PWSTR,
		HandleId: rawptr,
		ObjectTypeName: PWSTR,
		ObjectName: PWSTR,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
		PrincipalSelfSid: PSID,
		DesiredAccess: u32,
		AuditType: AUDIT_EVENT_TYPE,
		Flags: u32,
		ObjectTypeList: [^]OBJECT_TYPE_LIST,
		ObjectTypeListLength: u32,
		GenericMapping: ^GENERIC_MAPPING,
		ObjectCreation: BOOL,
		GrantedAccessList: [^]u32,
		AccessStatusList: [^]u32,
		pfGenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessallowedace ]]
	AddAccessAllowedAce :: proc(pAcl: ^ACL, dwAceRevision: ACE_REVISION, AccessMask: u32, pSid: PSID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessallowedaceex ]]
	AddAccessAllowedAceEx :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		AccessMask: u32,
		pSid: PSID,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessallowedobjectace ]]
	AddAccessAllowedObjectAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		AccessMask: u32,
		ObjectTypeGuid: ^GUID,
		InheritedObjectTypeGuid: ^GUID,
		pSid: PSID,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedace ]]
	AddAccessDeniedAce :: proc(pAcl: ^ACL, dwAceRevision: ACE_REVISION, AccessMask: u32, pSid: PSID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedaceex ]]
	AddAccessDeniedAceEx :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		AccessMask: u32,
		pSid: PSID,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addaccessdeniedobjectace ]]
	AddAccessDeniedObjectAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		AccessMask: u32,
		ObjectTypeGuid: ^GUID,
		InheritedObjectTypeGuid: ^GUID,
		pSid: PSID,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addace ]]
	AddAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		dwStartingAceIndex: u32,
		pAceList: rawptr,
		nAceListLength: u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addauditaccessace ]]
	AddAuditAccessAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		dwAccessMask: u32,
		pSid: PSID,
		bAuditSuccess: BOOL,
		bAuditFailure: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addauditaccessaceex ]]
	AddAuditAccessAceEx :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		dwAccessMask: u32,
		pSid: PSID,
		bAuditSuccess: BOOL,
		bAuditFailure: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addauditaccessobjectace ]]
	AddAuditAccessObjectAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		AccessMask: u32,
		ObjectTypeGuid: ^GUID,
		InheritedObjectTypeGuid: ^GUID,
		pSid: PSID,
		bAuditSuccess: BOOL,
		bAuditFailure: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-addconditionalace ]]
	AddConditionalAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		AceType: u8,
		AccessMask: u32,
		pSid: PSID,
		ConditionStr: PWSTR,
		ReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addmandatoryace ]]
	AddMandatoryAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		MandatoryPolicy: u32,
		pLabelSid: PSID,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-adjusttokengroups ]]
	AdjustTokenGroups :: proc(
		TokenHandle: HANDLE,
		ResetToDefault: BOOL,
		NewState: ^TOKEN_GROUPS,
		BufferLength: u32,
		PreviousState: ^TOKEN_GROUPS,
		ReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-adjusttokenprivileges ]]
	AdjustTokenPrivileges :: proc(
		TokenHandle: HANDLE,
		DisableAllPrivileges: BOOL,
		NewState: ^TOKEN_PRIVILEGES,
		BufferLength: u32,
		PreviousState: ^TOKEN_PRIVILEGES,
		ReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-allocateandinitializesid ]]
	AllocateAndInitializeSid :: proc(
		pIdentifierAuthority: ^SID_IDENTIFIER_AUTHORITY,
		nSubAuthorityCount: u8,
		nSubAuthority0: u32,
		nSubAuthority1: u32,
		nSubAuthority2: u32,
		nSubAuthority3: u32,
		nSubAuthority4: u32,
		nSubAuthority5: u32,
		nSubAuthority6: u32,
		nSubAuthority7: u32,
		pSid: ^PSID,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-allocatelocallyuniqueid ]]
	AllocateLocallyUniqueId :: proc(Luid: ^LUID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-areallaccessesgranted ]]
	AreAllAccessesGranted :: proc(GrantedAccess: u32, DesiredAccess: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-areanyaccessesgranted ]]
	AreAnyAccessesGranted :: proc(GrantedAccess: u32, DesiredAccess: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-checktokenmembership ]]
	CheckTokenMembership :: proc(TokenHandle: HANDLE, SidToCheck: PSID, IsMember: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-converttoautoinheritprivateobjectsecurity ]]
	ConvertToAutoInheritPrivateObjectSecurity :: proc(
		ParentDescriptor: PSECURITY_DESCRIPTOR,
		CurrentSecurityDescriptor: PSECURITY_DESCRIPTOR,
		NewSecurityDescriptor: ^PSECURITY_DESCRIPTOR,
		ObjectType: ^GUID,
		IsDirectoryObject: BOOLEAN,
		GenericMapping: ^GENERIC_MAPPING,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-copysid ]]
	CopySid :: proc(nDestinationSidLength: u32, pDestinationSid: PSID, pSourceSid: PSID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-createprivateobjectsecurity ]]
	CreatePrivateObjectSecurity :: proc(
		ParentDescriptor: PSECURITY_DESCRIPTOR,
		CreatorDescriptor: PSECURITY_DESCRIPTOR,
		NewDescriptor: ^PSECURITY_DESCRIPTOR,
		IsDirectoryObject: BOOL,
		Token: HANDLE,
		GenericMapping: ^GENERIC_MAPPING,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-createprivateobjectsecurityex ]]
	CreatePrivateObjectSecurityEx :: proc(
		ParentDescriptor: PSECURITY_DESCRIPTOR,
		CreatorDescriptor: PSECURITY_DESCRIPTOR,
		NewDescriptor: ^PSECURITY_DESCRIPTOR,
		ObjectType: ^GUID,
		IsContainerObject: BOOL,
		AutoInheritFlags: SECURITY_AUTO_INHERIT_FLAGS,
		Token: HANDLE,
		GenericMapping: ^GENERIC_MAPPING,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-createprivateobjectsecuritywithmultipleinheritance ]]
	CreatePrivateObjectSecurityWithMultipleInheritance :: proc(
		ParentDescriptor: PSECURITY_DESCRIPTOR,
		CreatorDescriptor: PSECURITY_DESCRIPTOR,
		NewDescriptor: ^PSECURITY_DESCRIPTOR,
		ObjectTypes: [^]GUID,
		GuidCount: u32,
		IsContainerObject: BOOL,
		AutoInheritFlags: SECURITY_AUTO_INHERIT_FLAGS,
		Token: HANDLE,
		GenericMapping: ^GENERIC_MAPPING,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken ]]
	CreateRestrictedToken :: proc(
		ExistingTokenHandle: HANDLE,
		Flags: CREATE_RESTRICTED_TOKEN_FLAGS,
		DisableSidCount: u32,
		SidsToDisable: [^]SID_AND_ATTRIBUTES,
		DeletePrivilegeCount: u32,
		PrivilegesToDelete: [^]LUID_AND_ATTRIBUTES,
		RestrictedSidCount: u32,
		SidsToRestrict: [^]SID_AND_ATTRIBUTES,
		NewTokenHandle: ^HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-createwellknownsid ]]
	CreateWellKnownSid :: proc(WellKnownSidType: WELL_KNOWN_SID_TYPE, DomainSid: PSID, pSid: PSID, cbSid: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-deleteace ]]
	DeleteAce :: proc(pAcl: ^ACL, dwAceIndex: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-derivecapabilitysidsfromname ]]
	DeriveCapabilitySidsFromName :: proc(
		CapName: PWSTR,
		CapabilityGroupSids: ^PSID,
		CapabilityGroupSidCount: ^u32,
		CapabilitySids: ^PSID,
		CapabilitySidCount: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-destroyprivateobjectsecurity ]]
	DestroyPrivateObjectSecurity :: proc(ObjectDescriptor: ^PSECURITY_DESCRIPTOR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-duplicatetoken ]]
	DuplicateToken :: proc(
		ExistingTokenHandle: HANDLE,
		ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL,
		DuplicateTokenHandle: ^HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex ]]
	DuplicateTokenEx :: proc(
		hExistingToken: HANDLE,
		dwDesiredAccess: TOKEN_ACCESS_MASK,
		lpTokenAttributes: ^SECURITY_ATTRIBUTES,
		ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL,
		TokenType: TOKEN_TYPE,
		phNewToken: ^HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-equaldomainsid ]]
	EqualDomainSid :: proc(pSid1: PSID, pSid2: PSID, pfEqual: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-equalprefixsid ]]
	EqualPrefixSid :: proc(pSid1: PSID, pSid2: PSID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-equalsid ]]
	EqualSid :: proc(pSid1: PSID, pSid2: PSID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-findfirstfreeace ]]
	FindFirstFreeAce :: proc(pAcl: ^ACL, pAce: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-freesid ]]
	FreeSid :: proc(pSid: PSID) -> rawptr ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getace ]]
	GetAce :: proc(pAcl: ^ACL, dwAceIndex: u32, pAce: rawptr) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getaclinformation ]]
	GetAclInformation :: proc(
		pAcl: ^ACL,
		pAclInformation: rawptr,
		nAclInformationLength: u32,
		dwAclInformationClass: ACL_INFORMATION_CLASS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-getfilesecuritya ]]
	GetFileSecurityA :: proc(
		lpFileName: PSTR,
		RequestedInformation: u32,
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		nLength: u32,
		lpnLengthNeeded: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getfilesecurityw ]]
	GetFileSecurityW :: proc(
		lpFileName: PWSTR,
		RequestedInformation: u32,
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		nLength: u32,
		lpnLengthNeeded: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getkernelobjectsecurity ]]
	GetKernelObjectSecurity :: proc(
		Handle: HANDLE,
		RequestedInformation: u32,
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		nLength: u32,
		lpnLengthNeeded: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getlengthsid ]]
	GetLengthSid :: proc(pSid: PSID) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getprivateobjectsecurity ]]
	GetPrivateObjectSecurity :: proc(
		ObjectDescriptor: PSECURITY_DESCRIPTOR,
		SecurityInformation: OBJECT_SECURITY_INFORMATION,
		ResultantDescriptor: PSECURITY_DESCRIPTOR,
		DescriptorLength: u32,
		ReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptorcontrol ]]
	GetSecurityDescriptorControl :: proc(pSecurityDescriptor: PSECURITY_DESCRIPTOR, pControl: ^u16, lpdwRevision: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptordacl ]]
	GetSecurityDescriptorDacl :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		lpbDaclPresent: ^BOOL,
		pDacl: ^ACL,
		lpbDaclDefaulted: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptorgroup ]]
	GetSecurityDescriptorGroup :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		pGroup: ^PSID,
		lpbGroupDefaulted: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptorlength ]]
	GetSecurityDescriptorLength :: proc(pSecurityDescriptor: PSECURITY_DESCRIPTOR) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptorowner ]]
	GetSecurityDescriptorOwner :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		pOwner: ^PSID,
		lpbOwnerDefaulted: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptorrmcontrol ]]
	GetSecurityDescriptorRMControl :: proc(SecurityDescriptor: PSECURITY_DESCRIPTOR, RMControl: ^u8) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsecuritydescriptorsacl ]]
	GetSecurityDescriptorSacl :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		lpbSaclPresent: ^BOOL,
		pSacl: ^ACL,
		lpbSaclDefaulted: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsididentifierauthority ]]
	GetSidIdentifierAuthority :: proc(pSid: PSID) -> ^SID_IDENTIFIER_AUTHORITY ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsidlengthrequired ]]
	GetSidLengthRequired :: proc(nSubAuthorityCount: u8) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsidsubauthority ]]
	GetSidSubAuthority :: proc(pSid: PSID, nSubAuthority: u32) -> ^u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getsidsubauthoritycount ]]
	GetSidSubAuthorityCount :: proc(pSid: PSID) -> ^u8 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-gettokeninformation ]]
	GetTokenInformation :: proc(
		TokenHandle: HANDLE,
		TokenInformationClass: TOKEN_INFORMATION_CLASS,
		TokenInformation: rawptr,
		TokenInformationLength: u32,
		ReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getwindowsaccountdomainsid ]]
	GetWindowsAccountDomainSid :: proc(pSid: PSID, pDomainSid: PSID, cbDomainSid: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-impersonateanonymoustoken ]]
	ImpersonateAnonymousToken :: proc(ThreadHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser ]]
	ImpersonateLoggedOnUser :: proc(hToken: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-impersonateself ]]
	ImpersonateSelf :: proc(ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-initializeacl ]]
	InitializeAcl :: proc(pAcl: ^ACL, nAclLength: u32, dwAclRevision: ACE_REVISION) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-initializesecuritydescriptor ]]
	InitializeSecurityDescriptor :: proc(pSecurityDescriptor: PSECURITY_DESCRIPTOR, dwRevision: u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-initializesid ]]
	InitializeSid :: proc(
		Sid: PSID,
		pIdentifierAuthority: ^SID_IDENTIFIER_AUTHORITY,
		nSubAuthorityCount: u8,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-istokenrestricted ]]
	IsTokenRestricted :: proc(TokenHandle: HANDLE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-isvalidacl ]]
	IsValidAcl :: proc(pAcl: ^ACL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-isvalidsecuritydescriptor ]]
	IsValidSecurityDescriptor :: proc(pSecurityDescriptor: PSECURITY_DESCRIPTOR) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-isvalidsid ]]
	IsValidSid :: proc(pSid: PSID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-iswellknownsid ]]
	IsWellKnownSid :: proc(pSid: PSID, WellKnownSidType: WELL_KNOWN_SID_TYPE) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-logonusera ]]
	LogonUserA :: proc(
		lpszUsername: PSTR,
		lpszDomain: PSTR,
		lpszPassword: PSTR,
		dwLogonType: LOGON32_LOGON,
		dwLogonProvider: LOGON32_PROVIDER,
		phToken: ^HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-logonuserexa ]]
	LogonUserExA :: proc(
		lpszUsername: PSTR,
		lpszDomain: PSTR,
		lpszPassword: PSTR,
		dwLogonType: LOGON32_LOGON,
		dwLogonProvider: LOGON32_PROVIDER,
		phToken: ^HANDLE,
		ppLogonSid: ^PSID,
		ppProfileBuffer: rawptr,
		pdwProfileLength: ^u32,
		pQuotaLimits: ^QUOTA_LIMITS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-logonuserexw ]]
	LogonUserExW :: proc(
		lpszUsername: PWSTR,
		lpszDomain: PWSTR,
		lpszPassword: PWSTR,
		dwLogonType: LOGON32_LOGON,
		dwLogonProvider: LOGON32_PROVIDER,
		phToken: ^HANDLE,
		ppLogonSid: ^PSID,
		ppProfileBuffer: rawptr,
		pdwProfileLength: ^u32,
		pQuotaLimits: ^QUOTA_LIMITS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-logonuserw ]]
	LogonUserW :: proc(
		lpszUsername: PWSTR,
		lpszDomain: PWSTR,
		lpszPassword: PWSTR,
		dwLogonType: LOGON32_LOGON,
		dwLogonProvider: LOGON32_PROVIDER,
		phToken: ^HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupaccountnamea ]]
	LookupAccountNameA :: proc(
		lpSystemName: PSTR,
		lpAccountName: PSTR,
		Sid: PSID,
		cbSid: ^u32,
		ReferencedDomainName: PSTR,
		cchReferencedDomainName: ^u32,
		peUse: ^SID_NAME_USE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupaccountnamew ]]
	LookupAccountNameW :: proc(
		lpSystemName: PWSTR,
		lpAccountName: PWSTR,
		Sid: PSID,
		cbSid: ^u32,
		ReferencedDomainName: PWSTR,
		cchReferencedDomainName: ^u32,
		peUse: ^SID_NAME_USE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupaccountsida ]]
	LookupAccountSidA :: proc(
		lpSystemName: PSTR,
		Sid: PSID,
		Name: PSTR,
		cchName: ^u32,
		ReferencedDomainName: PSTR,
		cchReferencedDomainName: ^u32,
		peUse: ^SID_NAME_USE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupaccountsidw ]]
	LookupAccountSidW :: proc(
		lpSystemName: PWSTR,
		Sid: PSID,
		Name: PWSTR,
		cchName: ^u32,
		ReferencedDomainName: PWSTR,
		cchReferencedDomainName: ^u32,
		peUse: ^SID_NAME_USE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupprivilegedisplaynamea ]]
	LookupPrivilegeDisplayNameA :: proc(
		lpSystemName: PSTR,
		lpName: PSTR,
		lpDisplayName: PSTR,
		cchDisplayName: ^u32,
		lpLanguageId: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupprivilegedisplaynamew ]]
	LookupPrivilegeDisplayNameW :: proc(
		lpSystemName: PWSTR,
		lpName: PWSTR,
		lpDisplayName: PWSTR,
		cchDisplayName: ^u32,
		lpLanguageId: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupprivilegenamea ]]
	LookupPrivilegeNameA :: proc(lpSystemName: PSTR, lpLuid: ^LUID, lpName: PSTR, cchName: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupprivilegenamew ]]
	LookupPrivilegeNameW :: proc(lpSystemName: PWSTR, lpLuid: ^LUID, lpName: PWSTR, cchName: ^u32) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupprivilegevaluea ]]
	LookupPrivilegeValueA :: proc(lpSystemName: PSTR, lpName: PSTR, lpLuid: ^LUID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-lookupprivilegevaluew ]]
	LookupPrivilegeValueW :: proc(lpSystemName: PWSTR, lpName: PWSTR, lpLuid: ^LUID) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-makeabsolutesd ]]
	MakeAbsoluteSD :: proc(
		pSelfRelativeSecurityDescriptor: PSECURITY_DESCRIPTOR,
		pAbsoluteSecurityDescriptor: PSECURITY_DESCRIPTOR,
		lpdwAbsoluteSecurityDescriptorSize: ^u32,
		pDacl: ^ACL,
		lpdwDaclSize: ^u32,
		pSacl: ^ACL,
		lpdwSaclSize: ^u32,
		pOwner: PSID,
		lpdwOwnerSize: ^u32,
		pPrimaryGroup: PSID,
		lpdwPrimaryGroupSize: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-makeselfrelativesd ]]
	MakeSelfRelativeSD :: proc(
		pAbsoluteSecurityDescriptor: PSECURITY_DESCRIPTOR,
		pSelfRelativeSecurityDescriptor: PSECURITY_DESCRIPTOR,
		lpdwBufferLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-mapgenericmask ]]
	MapGenericMask :: proc(AccessMask: ^u32, GenericMapping: ^GENERIC_MAPPING) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-objectcloseauditalarma ]]
	ObjectCloseAuditAlarmA :: proc(SubsystemName: PSTR, HandleId: rawptr, GenerateOnClose: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-objectcloseauditalarmw ]]
	ObjectCloseAuditAlarmW :: proc(SubsystemName: PWSTR, HandleId: rawptr, GenerateOnClose: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-objectdeleteauditalarma ]]
	ObjectDeleteAuditAlarmA :: proc(SubsystemName: PSTR, HandleId: rawptr, GenerateOnClose: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-objectdeleteauditalarmw ]]
	ObjectDeleteAuditAlarmW :: proc(SubsystemName: PWSTR, HandleId: rawptr, GenerateOnClose: BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-objectopenauditalarma ]]
	ObjectOpenAuditAlarmA :: proc(
		SubsystemName: PSTR,
		HandleId: rawptr,
		ObjectTypeName: PSTR,
		ObjectName: PSTR,
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		ClientToken: HANDLE,
		DesiredAccess: u32,
		GrantedAccess: u32,
		Privileges: ^PRIVILEGE_SET,
		ObjectCreation: BOOL,
		AccessGranted: BOOL,
		GenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-objectopenauditalarmw ]]
	ObjectOpenAuditAlarmW :: proc(
		SubsystemName: PWSTR,
		HandleId: rawptr,
		ObjectTypeName: PWSTR,
		ObjectName: PWSTR,
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		ClientToken: HANDLE,
		DesiredAccess: u32,
		GrantedAccess: u32,
		Privileges: ^PRIVILEGE_SET,
		ObjectCreation: BOOL,
		AccessGranted: BOOL,
		GenerateOnClose: ^BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-objectprivilegeauditalarma ]]
	ObjectPrivilegeAuditAlarmA :: proc(
		SubsystemName: PSTR,
		HandleId: rawptr,
		ClientToken: HANDLE,
		DesiredAccess: u32,
		Privileges: ^PRIVILEGE_SET,
		AccessGranted: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-objectprivilegeauditalarmw ]]
	ObjectPrivilegeAuditAlarmW :: proc(
		SubsystemName: PWSTR,
		HandleId: rawptr,
		ClientToken: HANDLE,
		DesiredAccess: u32,
		Privileges: ^PRIVILEGE_SET,
		AccessGranted: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-privilegecheck ]]
	PrivilegeCheck :: proc(ClientToken: HANDLE, RequiredPrivileges: ^PRIVILEGE_SET, pfResult: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-privilegedserviceauditalarma ]]
	PrivilegedServiceAuditAlarmA :: proc(
		SubsystemName: PSTR,
		ServiceName: PSTR,
		ClientToken: HANDLE,
		Privileges: ^PRIVILEGE_SET,
		AccessGranted: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-privilegedserviceauditalarmw ]]
	PrivilegedServiceAuditAlarmW :: proc(
		SubsystemName: PWSTR,
		ServiceName: PWSTR,
		ClientToken: HANDLE,
		Privileges: ^PRIVILEGE_SET,
		AccessGranted: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-querysecurityaccessmask ]]
	QuerySecurityAccessMask :: proc(SecurityInformation: OBJECT_SECURITY_INFORMATION, DesiredAccess: ^u32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-reverttoself ]]
	RevertToSelf :: proc() -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setaclinformation ]]
	SetAclInformation :: proc(
		pAcl: ^ACL,
		pAclInformation: rawptr,
		nAclInformationLength: u32,
		dwAclInformationClass: ACL_INFORMATION_CLASS,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setfilesecuritya ]]
	SetFileSecurityA :: proc(
		lpFileName: PSTR,
		SecurityInformation: OBJECT_SECURITY_INFORMATION,
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setfilesecurityw ]]
	SetFileSecurityW :: proc(
		lpFileName: PWSTR,
		SecurityInformation: OBJECT_SECURITY_INFORMATION,
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setkernelobjectsecurity ]]
	SetKernelObjectSecurity :: proc(
		Handle: HANDLE,
		SecurityInformation: OBJECT_SECURITY_INFORMATION,
		SecurityDescriptor: PSECURITY_DESCRIPTOR,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setprivateobjectsecurity ]]
	SetPrivateObjectSecurity :: proc(
		SecurityInformation: OBJECT_SECURITY_INFORMATION,
		ModificationDescriptor: PSECURITY_DESCRIPTOR,
		ObjectsSecurityDescriptor: ^PSECURITY_DESCRIPTOR,
		GenericMapping: ^GENERIC_MAPPING,
		Token: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setprivateobjectsecurityex ]]
	SetPrivateObjectSecurityEx :: proc(
		SecurityInformation: OBJECT_SECURITY_INFORMATION,
		ModificationDescriptor: PSECURITY_DESCRIPTOR,
		ObjectsSecurityDescriptor: ^PSECURITY_DESCRIPTOR,
		AutoInheritFlags: SECURITY_AUTO_INHERIT_FLAGS,
		GenericMapping: ^GENERIC_MAPPING,
		Token: HANDLE,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setsecurityaccessmask ]]
	SetSecurityAccessMask :: proc(SecurityInformation: OBJECT_SECURITY_INFORMATION, DesiredAccess: ^u32) ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptorcontrol ]]
	SetSecurityDescriptorControl :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		ControlBitsOfInterest: SECURITY_DESCRIPTOR_CONTROL,
		ControlBitsToSet: SECURITY_DESCRIPTOR_CONTROL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptordacl ]]
	SetSecurityDescriptorDacl :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		bDaclPresent: BOOL,
		pDacl: ^ACL,
		bDaclDefaulted: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptorgroup ]]
	SetSecurityDescriptorGroup :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		pGroup: PSID,
		bGroupDefaulted: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptorowner ]]
	SetSecurityDescriptorOwner :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		pOwner: PSID,
		bOwnerDefaulted: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptorrmcontrol ]]
	SetSecurityDescriptorRMControl :: proc(SecurityDescriptor: PSECURITY_DESCRIPTOR, RMControl: ^u8) -> u32 ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setsecuritydescriptorsacl ]]
	SetSecurityDescriptorSacl :: proc(
		pSecurityDescriptor: PSECURITY_DESCRIPTOR,
		bSaclPresent: BOOL,
		pSacl: ^ACL,
		bSaclDefaulted: BOOL,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-settokeninformation ]]
	SetTokenInformation :: proc(
		TokenHandle: HANDLE,
		TokenInformationClass: TOKEN_INFORMATION_CLASS,
		TokenInformation: rawptr,
		TokenInformationLength: u32,
	) -> BOOL ---
}

@(default_calling_convention="system")
foreign kernel32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addresourceattributeace ]]
	AddResourceAttributeAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		AccessMask: u32,
		pSid: PSID,
		pAttributeInfo: ^CLAIM_SECURITY_ATTRIBUTES_INFORMATION,
		pReturnLength: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-addscopedpolicyidace ]]
	AddScopedPolicyIDAce :: proc(
		pAcl: ^ACL,
		dwAceRevision: ACE_REVISION,
		AceFlags: ACE_FLAGS,
		AccessMask: u32,
		pSid: PSID,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-checktokencapability ]]
	CheckTokenCapability :: proc(TokenHandle: HANDLE, CapabilitySidToCheck: PSID, HasCapability: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-checktokenmembershipex ]]
	CheckTokenMembershipEx :: proc(TokenHandle: HANDLE, SidToCheck: PSID, Flags: u32, IsMember: ^BOOL) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getappcontainerace ]]
	GetAppContainerAce :: proc(
		Acl: ^ACL,
		StartingAceIndex: u32,
		AppContainerAce: rawptr,
		AppContainerAceIndex: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-getcachedsigninglevel ]]
	GetCachedSigningLevel :: proc(
		File: HANDLE,
		Flags: ^u32,
		SigningLevel: ^u32,
		Thumbprint: ^u8,
		ThumbprintSize: ^u32,
		ThumbprintAlgorithm: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-setcachedsigninglevel ]]
	SetCachedSigningLevel :: proc(SourceFiles: [^]HANDLE, SourceFileCount: u32, Flags: u32, TargetFile: HANDLE) -> BOOL ---
}

@(default_calling_convention="system")
foreign ntdll {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winternl/nf-winternl-rtlconvertsidtounicodestring ]]
	RtlConvertSidToUnicodeString :: proc(
		UnicodeString: ^UNICODE_STRING,
		Sid: PSID,
		AllocateDestinationString: BOOLEAN,
	) -> NTSTATUS ---

	RtlNormalizeSecurityDescriptor :: proc(
		SecurityDescriptor: ^PSECURITY_DESCRIPTOR,
		SecurityDescriptorLength: u32,
		NewSecurityDescriptor: ^PSECURITY_DESCRIPTOR,
		NewSecurityDescriptorLength: ^u32,
		CheckOnly: BOOLEAN,
	) -> BOOLEAN ---
}

@(default_calling_convention="system")
foreign user32 {
	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getuserobjectsecurity ]]
	GetUserObjectSecurity :: proc(
		hObj: HANDLE,
		pSIRequested: ^u32,
		pSID: PSECURITY_DESCRIPTOR,
		nLength: u32,
		lpnLengthNeeded: ^u32,
	) -> BOOL ---

	// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-setuserobjectsecurity ]]
	SetUserObjectSecurity :: proc(
		hObj: HANDLE,
		pSIRequested: ^OBJECT_SECURITY_INFORMATION,
		pSID: PSECURITY_DESCRIPTOR,
	) -> BOOL ---
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_allowed_ace ]]
ACCESS_ALLOWED_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_allowed_callback_ace ]]
ACCESS_ALLOWED_CALLBACK_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_allowed_callback_object_ace ]]
ACCESS_ALLOWED_CALLBACK_OBJECT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	Flags: SYSTEM_AUDIT_OBJECT_ACE_FLAGS,
	ObjectType: GUID,
	InheritedObjectType: GUID,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_allowed_object_ace ]]
ACCESS_ALLOWED_OBJECT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	Flags: SYSTEM_AUDIT_OBJECT_ACE_FLAGS,
	ObjectType: GUID,
	InheritedObjectType: GUID,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_denied_ace ]]
ACCESS_DENIED_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_denied_callback_ace ]]
ACCESS_DENIED_CALLBACK_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_denied_callback_object_ace ]]
ACCESS_DENIED_CALLBACK_OBJECT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	Flags: SYSTEM_AUDIT_OBJECT_ACE_FLAGS,
	ObjectType: GUID,
	InheritedObjectType: GUID,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-access_denied_object_ace ]]
ACCESS_DENIED_OBJECT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	Flags: SYSTEM_AUDIT_OBJECT_ACE_FLAGS,
	ObjectType: GUID,
	InheritedObjectType: GUID,
	SidStart: u32,
}

ACCESS_REASONS :: struct {
	Data: [32]u32,
}

ACE_FLAGS :: distinct bit_set[enum {
	CONTAINER_INHERIT_ACE = 1,
	FAILED_ACCESS_ACE_FLAG = 7,
	INHERIT_ONLY_ACE = 3,
	INHERITED_ACE = 4,
	NO_PROPAGATE_INHERIT_ACE = 2,
	OBJECT_INHERIT_ACE = 0,
	SUCCESSFUL_ACCESS_ACE_FLAG = 6,
	SUB_CONTAINERS_ONLY_INHERIT = 1,
	SUB_OBJECTS_ONLY_INHERIT = 0,
	INHERIT_NO_PROPAGATE = 2,
	INHERIT_ONLY = 3,
}; u32]
ACE_FLAGS_SUB_CONTAINERS_AND_OBJECTS_INHERIT :: transmute(ACE_FLAGS)u32(0x00000003)
ACE_FLAGS_NO_INHERITANCE :: transmute(ACE_FLAGS)u32(0x00000000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-ace_header ]]
ACE_HEADER :: struct {
	AceType: u8,
	AceFlags: u8,
	AceSize: u16,
}

ACE_REVISION :: enum u32 {
	REVISION = 0x00000002,
	REVISION_DS = 0x00000004,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-acl ]]
ACL :: struct {
	AclRevision: u8,
	Sbz1: u8,
	AclSize: u16,
	AceCount: u16,
	Sbz2: u16,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-acl_information_class ]]
ACL_INFORMATION_CLASS :: enum i32 {
	RevisionInformation = 1,
	SizeInformation = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-acl_revision_information ]]
ACL_REVISION_INFORMATION :: struct {
	AclRevision: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-acl_size_information ]]
ACL_SIZE_INFORMATION :: struct {
	AceCount: u32,
	AclBytesInUse: u32,
	AclBytesFree: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-audit_event_type ]]
AUDIT_EVENT_TYPE :: enum i32 {
	ObjectAccess = 0,
	DirectoryServiceAccess = 1,
}

CLAIM_SECURITY_ATTRIBUTE_FLAGS :: distinct bit_set[enum {
	NON_INHERITABLE = 0,
	VALUE_CASE_SENSITIVE = 1,
	USE_FOR_DENY_ONLY = 2,
	DISABLED_BY_DEFAULT = 3,
	DISABLED = 4,
	MANDATORY = 5,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attribute_fqbn_value ]]
CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE :: struct {
	Version: u64,
	Name: PWSTR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attribute_octet_string_value ]]
CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE :: struct {
	pValue: rawptr,
	ValueLength: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attribute_relative_v1 ]]
CLAIM_SECURITY_ATTRIBUTE_RELATIVE_V1 :: struct {
	Name: u32,
	ValueType: CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE,
	Reserved: u16,
	Flags: CLAIM_SECURITY_ATTRIBUTE_FLAGS,
	ValueCount: u32,
	Values: struct #raw_union {
		pInt64: [1]u32,
		pUint64: [1]u32,
		ppString: [1]u32,
		pFqbn: [1]u32,
		pOctetString: [1]u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attribute_v1 ]]
CLAIM_SECURITY_ATTRIBUTE_V1 :: struct {
	Name: PWSTR,
	ValueType: CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE,
	Reserved: u16,
	Flags: u32,
	ValueCount: u32,
	Values: struct #raw_union {
		pInt64: ^i64,
		pUint64: ^u64,
		ppString: ^PWSTR,
		pFqbn: ^CLAIM_SECURITY_ATTRIBUTE_FQBN_VALUE,
		pOctetString: ^CLAIM_SECURITY_ATTRIBUTE_OCTET_STRING_VALUE,
	},
}

CLAIM_SECURITY_ATTRIBUTE_VALUE_TYPE :: enum u16 {
	INT64 = 0x0001,
	UINT64 = 0x0002,
	STRING = 0x0003,
	OCTET_STRING = 0x0010,
	FQBN = 0x0004,
	SID = 0x0005,
	BOOLEAN = 0x0006,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-claim_security_attributes_information ]]
CLAIM_SECURITY_ATTRIBUTES_INFORMATION :: struct {
	Version: u16,
	Reserved: u16,
	AttributeCount: u32,
	Attribute: struct #raw_union {
		pAttributeV1: ^CLAIM_SECURITY_ATTRIBUTE_V1,
	},
}

CREATE_RESTRICTED_TOKEN_FLAGS :: distinct bit_set[enum {
	DISABLE_MAX_PRIVILEGE = 0,
	SANDBOX_INERT = 1,
	LUA_TOKEN = 2,
	WRITE_RESTRICTED = 3,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/celib/ne-celib-enum_period ]]
ENUM_PERIOD :: enum i32 {
	INVALID = -1,
	SECONDS = 0,
	MINUTES = 1,
	HOURS = 2,
	DAYS = 3,
	WEEKS = 4,
	MONTHS = 5,
	YEARS = 6,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-generic_mapping ]]
GENERIC_MAPPING :: struct {
	GenericRead: u32,
	GenericWrite: u32,
	GenericExecute: u32,
	GenericAll: u32,
}

LLFILETIME :: struct {
	using _: struct #raw_union {
		ll: i64,
		ft: FILETIME,
	},
}

LOGON32_LOGON :: enum u32 {
	BATCH = 0x00000004,
	INTERACTIVE = 0x00000002,
	NETWORK = 0x00000003,
	NETWORK_CLEARTEXT = 0x00000008,
	NEW_CREDENTIALS = 0x00000009,
	SERVICE = 0x00000005,
	UNLOCK = 0x00000007,
}

LOGON32_PROVIDER :: enum u32 {
	DEFAULT = 0x00000000,
	WINNT50 = 0x00000003,
	WINNT40 = 0x00000002,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-luid_and_attributes ]]
LUID_AND_ATTRIBUTES :: struct {
	Luid: LUID,
	Attributes: TOKEN_PRIVILEGES_ATTRIBUTES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-mandatory_level ]]
MANDATORY_LEVEL :: enum i32 {
	Untrusted = 0,
	Low = 1,
	Medium = 2,
	High = 3,
	System = 4,
	SecureProcess = 5,
	Count = 6,
}

NCRYPT_DESCRIPTOR_HANDLE :: rawptr

NCRYPT_STREAM_HANDLE :: rawptr

OBJECT_SECURITY_INFORMATION :: distinct bit_set[enum {
	ATTRIBUTE_SECURITY_INFORMATION = 5,
	BACKUP_SECURITY_INFORMATION = 16,
	DACL_SECURITY_INFORMATION = 2,
	GROUP_SECURITY_INFORMATION = 1,
	LABEL_SECURITY_INFORMATION = 4,
	OWNER_SECURITY_INFORMATION = 0,
	PROTECTED_DACL_SECURITY_INFORMATION = 31,
	PROTECTED_SACL_SECURITY_INFORMATION = 30,
	SACL_SECURITY_INFORMATION = 3,
	SCOPE_SECURITY_INFORMATION = 6,
	UNPROTECTED_DACL_SECURITY_INFORMATION = 29,
	UNPROTECTED_SACL_SECURITY_INFORMATION = 28,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-object_type_list ]]
OBJECT_TYPE_LIST :: struct {
	Level: u16,
	Sbz: u16,
	ObjectType: ^GUID,
}

PLSA_AP_CALL_PACKAGE_UNTRUSTED :: #type proc "system" (
	ClientRequest: rawptr,
	ProtocolSubmitBuffer: rawptr,
	ClientBufferBase: rawptr,
	SubmitBufferLength: u32,
	ProtocolReturnBuffer: rawptr,
	ReturnBufferLength: ^u32,
	ProtocolStatus: ^i32,
) -> NTSTATUS

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-privilege_set ]]
PRIVILEGE_SET :: struct {
	PrivilegeCount: u32,
	Control: u32,
	Privilege: [1]LUID_AND_ATTRIBUTES,
}

PSECURITY_DESCRIPTOR :: rawptr

PSID :: rawptr

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-quota_limits ]]
QUOTA_LIMITS :: struct {
	PagedPoolLimit: uintptr,
	NonPagedPoolLimit: uintptr,
	MinimumWorkingSetSize: uintptr,
	MaximumWorkingSetSize: uintptr,
	PagefileLimit: uintptr,
	TimeLimit: i64,
}

SAFER_LEVEL_HANDLE :: rawptr

SE_ACCESS_REPLY :: struct {
	Size: u32,
	ResultListCount: u32,
	GrantedAccess: ^u32,
	AccessStatus: ^u32,
	AccessReason: ^ACCESS_REASONS,
	Privileges: ^PRIVILEGE_SET,
}

SE_ACCESS_REQUEST :: struct {
	Size: u32,
	SeSecurityDescriptor: ^SE_SECURITY_DESCRIPTOR,
	DesiredAccess: u32,
	PreviouslyGrantedAccess: u32,
	PrincipalSelfSid: PSID,
	GenericMapping: ^GENERIC_MAPPING,
	ObjectTypeListCount: u32,
	ObjectTypeList: ^OBJECT_TYPE_LIST,
}

SE_IMPERSONATION_STATE :: struct {
	Token: rawptr,
	CopyOnOpen: BOOLEAN,
	EffectiveOnly: BOOLEAN,
	Level: SECURITY_IMPERSONATION_LEVEL,
}

SE_SECURITY_DESCRIPTOR :: struct {
	Size: u32,
	Flags: u32,
	SecurityDescriptor: PSECURITY_DESCRIPTOR,
}

SE_SID :: struct #raw_union {
	Sid: SID,
	Buffer: [68]u8,
}

SEC_THREAD_START :: #type proc "system" (lpThreadParameter: rawptr) -> u32

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/wtypesbase/ns-wtypesbase-security_attributes ]]
SECURITY_ATTRIBUTES :: struct {
	nLength: u32,
	lpSecurityDescriptor: rawptr,
	bInheritHandle: BOOL,
}

SECURITY_AUTO_INHERIT_FLAGS :: distinct bit_set[enum {
	AVOID_OWNER_CHECK = 4,
	AVOID_OWNER_RESTRICTION = 12,
	AVOID_PRIVILEGE_CHECK = 3,
	DACL_AUTO_INHERIT = 0,
	DEFAULT_DESCRIPTOR_FOR_OBJECT = 2,
	DEFAULT_GROUP_FROM_PARENT = 6,
	DEFAULT_OWNER_FROM_PARENT = 5,
	MACL_NO_EXECUTE_UP = 10,
	MACL_NO_READ_UP = 9,
	MACL_NO_WRITE_UP = 8,
	SACL_AUTO_INHERIT = 1,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-security_capabilities ]]
SECURITY_CAPABILITIES :: struct {
	AppContainerSid: PSID,
	Capabilities: ^SID_AND_ATTRIBUTES,
	CapabilityCount: u32,
	Reserved: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-security_descriptor ]]
SECURITY_DESCRIPTOR :: struct {
	Revision: u8,
	Sbz1: u8,
	Control: SECURITY_DESCRIPTOR_CONTROL,
	Owner: PSID,
	Group: PSID,
	Sacl: ^ACL,
	Dacl: ^ACL,
}

SECURITY_DESCRIPTOR_CONTROL :: distinct bit_set[enum {
	OWNER_DEFAULTED = 0,
	GROUP_DEFAULTED = 1,
	DACL_PRESENT = 2,
	DACL_DEFAULTED = 3,
	SACL_PRESENT = 4,
	SACL_DEFAULTED = 5,
	DACL_AUTO_INHERIT_REQ = 8,
	SACL_AUTO_INHERIT_REQ = 9,
	DACL_AUTO_INHERITED = 10,
	SACL_AUTO_INHERITED = 11,
	DACL_PROTECTED = 12,
	SACL_PROTECTED = 13,
	RM_CONTROL_VALID = 14,
	SELF_RELATIVE = 15,
}; u16]

SECURITY_DESCRIPTOR_RELATIVE :: struct {
	Revision: u8,
	Sbz1: u8,
	Control: SECURITY_DESCRIPTOR_CONTROL,
	Owner: u32,
	Group: u32,
	Sacl: u32,
	Dacl: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-security_impersonation_level ]]
SECURITY_IMPERSONATION_LEVEL :: enum i32 {
	Anonymous = 0,
	Identification = 1,
	Impersonation = 2,
	Delegation = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-security_quality_of_service ]]
SECURITY_QUALITY_OF_SERVICE :: struct {
	Length: u32,
	ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL,
	ContextTrackingMode: u8,
	EffectiveOnly: BOOLEAN,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-sid ]]
SID :: struct {
	Revision: u8,
	SubAuthorityCount: u8,
	IdentifierAuthority: SID_IDENTIFIER_AUTHORITY,
	SubAuthority: [1]u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-sid_and_attributes ]]
SID_AND_ATTRIBUTES :: struct {
	Sid: PSID,
	Attributes: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-sid_and_attributes_hash ]]
SID_AND_ATTRIBUTES_HASH :: struct {
	SidCount: u32,
	SidAttr: ^SID_AND_ATTRIBUTES,
	Hash: [32]uintptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/NetMgmt/odj-sid_identifier_authority ]]
SID_IDENTIFIER_AUTHORITY :: struct {
	Value: [6]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-sid_name_use ]]
SID_NAME_USE :: enum i32 {
	User = 1,
	Group = 2,
	Domain = 3,
	Alias = 4,
	WellKnownGroup = 5,
	DeletedAccount = 6,
	Invalid = 7,
	Unknown = 8,
	Computer = 9,
	Label = 10,
	LogonSession = 11,
}

SYSTEM_ACCESS_FILTER_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_ace ]]
SYSTEM_ALARM_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_callback_ace ]]
SYSTEM_ALARM_CALLBACK_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_callback_object_ace ]]
SYSTEM_ALARM_CALLBACK_OBJECT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	Flags: SYSTEM_AUDIT_OBJECT_ACE_FLAGS,
	ObjectType: GUID,
	InheritedObjectType: GUID,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_object_ace ]]
SYSTEM_ALARM_OBJECT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	Flags: u32,
	ObjectType: GUID,
	InheritedObjectType: GUID,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_audit_ace ]]
SYSTEM_AUDIT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_audit_callback_ace ]]
SYSTEM_AUDIT_CALLBACK_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_audit_callback_object_ace ]]
SYSTEM_AUDIT_CALLBACK_OBJECT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	Flags: SYSTEM_AUDIT_OBJECT_ACE_FLAGS,
	ObjectType: GUID,
	InheritedObjectType: GUID,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_audit_object_ace ]]
SYSTEM_AUDIT_OBJECT_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	Flags: SYSTEM_AUDIT_OBJECT_ACE_FLAGS,
	ObjectType: GUID,
	InheritedObjectType: GUID,
	SidStart: u32,
}

SYSTEM_AUDIT_OBJECT_ACE_FLAGS :: distinct bit_set[enum {
	OBJECT_TYPE_PRESENT = 0,
	INHERITED_OBJECT_TYPE_PRESENT = 1,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_mandatory_label_ace ]]
SYSTEM_MANDATORY_LABEL_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

SYSTEM_PROCESS_TRUST_LABEL_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_resource_attribute_ace ]]
SYSTEM_RESOURCE_ATTRIBUTE_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_scoped_policy_id_ace ]]
SYSTEM_SCOPED_POLICY_ID_ACE :: struct {
	Header: ACE_HEADER,
	Mask: u32,
	SidStart: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_access_information ]]
TOKEN_ACCESS_INFORMATION :: struct {
	SidHash: ^SID_AND_ATTRIBUTES_HASH,
	RestrictedSidHash: ^SID_AND_ATTRIBUTES_HASH,
	Privileges: ^TOKEN_PRIVILEGES,
	AuthenticationId: LUID,
	TokenType: TOKEN_TYPE,
	ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL,
	MandatoryPolicy: TOKEN_MANDATORY_POLICY,
	Flags: u32,
	AppContainerNumber: u32,
	PackageSid: PSID,
	CapabilitiesHash: ^SID_AND_ATTRIBUTES_HASH,
	TrustLevelSid: PSID,
	SecurityAttributes: rawptr,
}

TOKEN_ACCESS_MASK :: distinct bit_set[enum {
	DELETE = 16,
	READ_CONTROL = 17,
	WRITE_DAC = 18,
	WRITE_OWNER = 19,
	ACCESS_SYSTEM_SECURITY = 24,
	ASSIGN_PRIMARY = 0,
	DUPLICATE = 1,
	IMPERSONATE = 2,
	QUERY = 3,
	QUERY_SOURCE = 4,
	ADJUST_PRIVILEGES = 5,
	ADJUST_GROUPS = 6,
	ADJUST_DEFAULT = 7,
	ADJUST_SESSIONID = 8,
	EXECUTE = 17,
}; u32]
TOKEN_ACCESS_MASK_READ :: transmute(TOKEN_ACCESS_MASK)u32(0x00020008)
TOKEN_ACCESS_MASK_WRITE :: transmute(TOKEN_ACCESS_MASK)u32(0x000200E0)
TOKEN_ACCESS_MASK_TRUST_CONSTRAINT_MASK :: transmute(TOKEN_ACCESS_MASK)u32(0x00020018)
TOKEN_ACCESS_MASK_ACCESS_PSEUDO_HANDLE_WIN8 :: transmute(TOKEN_ACCESS_MASK)u32(0x00000018)
TOKEN_ACCESS_MASK_ACCESS_PSEUDO_HANDLE :: transmute(TOKEN_ACCESS_MASK)u32(0x00000018)
TOKEN_ACCESS_MASK_ALL_ACCESS :: transmute(TOKEN_ACCESS_MASK)u32(0x000F01FF)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_appcontainer_information ]]
TOKEN_APPCONTAINER_INFORMATION :: struct {
	TokenAppContainer: PSID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_audit_policy ]]
TOKEN_AUDIT_POLICY :: struct {
	PerUserPolicy: [30]u8,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_control ]]
TOKEN_CONTROL :: struct {
	TokenId: LUID,
	AuthenticationId: LUID,
	ModifiedId: LUID,
	TokenSource: TOKEN_SOURCE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_default_dacl ]]
TOKEN_DEFAULT_DACL :: struct {
	DefaultDacl: ^ACL,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_device_claims ]]
TOKEN_DEVICE_CLAIMS :: struct {
	DeviceClaims: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_elevation ]]
TOKEN_ELEVATION :: struct {
	TokenIsElevated: u32,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-token_elevation_type ]]
TOKEN_ELEVATION_TYPE :: enum i32 {
	Default = 1,
	Full = 2,
	Limited = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_groups ]]
TOKEN_GROUPS :: struct {
	GroupCount: u32,
	Groups: [1]SID_AND_ATTRIBUTES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_groups_and_privileges ]]
TOKEN_GROUPS_AND_PRIVILEGES :: struct {
	SidCount: u32,
	SidLength: u32,
	Sids: ^SID_AND_ATTRIBUTES,
	RestrictedSidCount: u32,
	RestrictedSidLength: u32,
	RestrictedSids: ^SID_AND_ATTRIBUTES,
	PrivilegeCount: u32,
	PrivilegeLength: u32,
	Privileges: ^LUID_AND_ATTRIBUTES,
	AuthenticationId: LUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-token_information_class ]]
TOKEN_INFORMATION_CLASS :: enum i32 {
	TokenUser = 1,
	TokenGroups = 2,
	TokenPrivileges = 3,
	TokenOwner = 4,
	TokenPrimaryGroup = 5,
	TokenDefaultDacl = 6,
	TokenSource = 7,
	TokenType = 8,
	TokenImpersonationLevel = 9,
	TokenStatistics = 10,
	TokenRestrictedSids = 11,
	TokenSessionId = 12,
	TokenGroupsAndPrivileges = 13,
	TokenSessionReference = 14,
	TokenSandBoxInert = 15,
	TokenAuditPolicy = 16,
	TokenOrigin = 17,
	TokenElevationType = 18,
	TokenLinkedToken = 19,
	TokenElevation = 20,
	TokenHasRestrictions = 21,
	TokenAccessInformation = 22,
	TokenVirtualizationAllowed = 23,
	TokenVirtualizationEnabled = 24,
	TokenIntegrityLevel = 25,
	TokenUIAccess = 26,
	TokenMandatoryPolicy = 27,
	TokenLogonSid = 28,
	TokenIsAppContainer = 29,
	TokenCapabilities = 30,
	TokenAppContainerSid = 31,
	TokenAppContainerNumber = 32,
	TokenUserClaimAttributes = 33,
	TokenDeviceClaimAttributes = 34,
	TokenRestrictedUserClaimAttributes = 35,
	TokenRestrictedDeviceClaimAttributes = 36,
	TokenDeviceGroups = 37,
	TokenRestrictedDeviceGroups = 38,
	TokenSecurityAttributes = 39,
	TokenIsRestricted = 40,
	TokenProcessTrustLevel = 41,
	TokenPrivateNameSpace = 42,
	TokenSingletonAttributes = 43,
	TokenBnoIsolation = 44,
	TokenChildProcessFlags = 45,
	TokenIsLessPrivilegedAppContainer = 46,
	TokenIsSandboxed = 47,
	TokenIsAppSilo = 48,
	MaxTokenInfoClass = 49,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_linked_token ]]
TOKEN_LINKED_TOKEN :: struct {
	LinkedToken: HANDLE,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_mandatory_label ]]
TOKEN_MANDATORY_LABEL :: struct {
	Label: SID_AND_ATTRIBUTES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_mandatory_policy ]]
TOKEN_MANDATORY_POLICY :: struct {
	Policy: TOKEN_MANDATORY_POLICY_ID,
}

TOKEN_MANDATORY_POLICY_ID :: enum u32 {
	OFF = 0x00000000,
	NO_WRITE_UP = 0x00000001,
	NEW_PROCESS_MIN = 0x00000002,
	VALID_MASK = 0x00000003,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_origin ]]
TOKEN_ORIGIN :: struct {
	OriginatingLogonSession: LUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_owner ]]
TOKEN_OWNER :: struct {
	Owner: PSID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_primary_group ]]
TOKEN_PRIMARY_GROUP :: struct {
	PrimaryGroup: PSID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_privileges ]]
TOKEN_PRIVILEGES :: struct {
	PrivilegeCount: u32,
	Privileges: [1]LUID_AND_ATTRIBUTES,
}

TOKEN_PRIVILEGES_ATTRIBUTES :: distinct bit_set[enum {
	ENABLED = 1,
	ENABLED_BY_DEFAULT = 0,
	REMOVED = 2,
	USED_FOR_ACCESS = 31,
}; u32]

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_source ]]
TOKEN_SOURCE :: struct {
	SourceName: [8]CHAR,
	SourceIdentifier: LUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_statistics ]]
TOKEN_STATISTICS :: struct {
	TokenId: LUID,
	AuthenticationId: LUID,
	ExpirationTime: i64,
	TokenType: TOKEN_TYPE,
	ImpersonationLevel: SECURITY_IMPERSONATION_LEVEL,
	DynamicCharged: u32,
	DynamicAvailable: u32,
	GroupCount: u32,
	PrivilegeCount: u32,
	ModifiedId: LUID,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-token_type ]]
TOKEN_TYPE :: enum i32 {
	Primary = 1,
	Impersonation = 2,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_user ]]
TOKEN_USER :: struct {
	User: SID_AND_ATTRIBUTES,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-token_user_claims ]]
TOKEN_USER_CLAIMS :: struct {
	UserClaims: rawptr,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-well_known_sid_type ]]
WELL_KNOWN_SID_TYPE :: enum i32 {
	NullSid = 0,
	WorldSid = 1,
	LocalSid = 2,
	CreatorOwnerSid = 3,
	CreatorGroupSid = 4,
	CreatorOwnerServerSid = 5,
	CreatorGroupServerSid = 6,
	NtAuthoritySid = 7,
	DialupSid = 8,
	NetworkSid = 9,
	BatchSid = 10,
	InteractiveSid = 11,
	ServiceSid = 12,
	AnonymousSid = 13,
	ProxySid = 14,
	EnterpriseControllersSid = 15,
	SelfSid = 16,
	AuthenticatedUserSid = 17,
	RestrictedCodeSid = 18,
	TerminalServerSid = 19,
	RemoteLogonIdSid = 20,
	LogonIdsSid = 21,
	LocalSystemSid = 22,
	LocalServiceSid = 23,
	NetworkServiceSid = 24,
	BuiltinDomainSid = 25,
	BuiltinAdministratorsSid = 26,
	BuiltinUsersSid = 27,
	BuiltinGuestsSid = 28,
	BuiltinPowerUsersSid = 29,
	BuiltinAccountOperatorsSid = 30,
	BuiltinSystemOperatorsSid = 31,
	BuiltinPrintOperatorsSid = 32,
	BuiltinBackupOperatorsSid = 33,
	BuiltinReplicatorSid = 34,
	BuiltinPreWindows2000CompatibleAccessSid = 35,
	BuiltinRemoteDesktopUsersSid = 36,
	BuiltinNetworkConfigurationOperatorsSid = 37,
	AccountAdministratorSid = 38,
	AccountGuestSid = 39,
	AccountKrbtgtSid = 40,
	AccountDomainAdminsSid = 41,
	AccountDomainUsersSid = 42,
	AccountDomainGuestsSid = 43,
	AccountComputersSid = 44,
	AccountControllersSid = 45,
	AccountCertAdminsSid = 46,
	AccountSchemaAdminsSid = 47,
	AccountEnterpriseAdminsSid = 48,
	AccountPolicyAdminsSid = 49,
	AccountRasAndIasServersSid = 50,
	NTLMAuthenticationSid = 51,
	DigestAuthenticationSid = 52,
	SChannelAuthenticationSid = 53,
	ThisOrganizationSid = 54,
	OtherOrganizationSid = 55,
	BuiltinIncomingForestTrustBuildersSid = 56,
	BuiltinPerfMonitoringUsersSid = 57,
	BuiltinPerfLoggingUsersSid = 58,
	BuiltinAuthorizationAccessSid = 59,
	BuiltinTerminalServerLicenseServersSid = 60,
	BuiltinDCOMUsersSid = 61,
	BuiltinIUsersSid = 62,
	IUserSid = 63,
	BuiltinCryptoOperatorsSid = 64,
	UntrustedLabelSid = 65,
	LowLabelSid = 66,
	MediumLabelSid = 67,
	HighLabelSid = 68,
	SystemLabelSid = 69,
	WriteRestrictedCodeSid = 70,
	CreatorOwnerRightsSid = 71,
	CacheablePrincipalsGroupSid = 72,
	NonCacheablePrincipalsGroupSid = 73,
	EnterpriseReadonlyControllersSid = 74,
	AccountReadonlyControllersSid = 75,
	BuiltinEventLogReadersGroup = 76,
	NewEnterpriseReadonlyControllersSid = 77,
	BuiltinCertSvcDComAccessGroup = 78,
	MediumPlusLabelSid = 79,
	LocalLogonSid = 80,
	ConsoleLogonSid = 81,
	ThisOrganizationCertificateSid = 82,
	ApplicationPackageAuthoritySid = 83,
	BuiltinAnyPackageSid = 84,
	CapabilityInternetClientSid = 85,
	CapabilityInternetClientServerSid = 86,
	CapabilityPrivateNetworkClientServerSid = 87,
	CapabilityPicturesLibrarySid = 88,
	CapabilityVideosLibrarySid = 89,
	CapabilityMusicLibrarySid = 90,
	CapabilityDocumentsLibrarySid = 91,
	CapabilitySharedUserCertificatesSid = 92,
	CapabilityEnterpriseAuthenticationSid = 93,
	CapabilityRemovableStorageSid = 94,
	BuiltinRDSRemoteAccessServersSid = 95,
	BuiltinRDSEndpointServersSid = 96,
	BuiltinRDSManagementServersSid = 97,
	UserModeDriversSid = 98,
	BuiltinHyperVAdminsSid = 99,
	AccountCloneableControllersSid = 100,
	BuiltinAccessControlAssistanceOperatorsSid = 101,
	BuiltinRemoteManagementUsersSid = 102,
	AuthenticationAuthorityAssertedSid = 103,
	AuthenticationServiceAssertedSid = 104,
	LocalAccountSid = 105,
	LocalAccountAndAdministratorSid = 106,
	AccountProtectedUsersSid = 107,
	CapabilityAppointmentsSid = 108,
	CapabilityContactsSid = 109,
	AccountDefaultSystemManagedSid = 110,
	BuiltinDefaultSystemManagedGroupSid = 111,
	BuiltinStorageReplicaAdminsSid = 112,
	AccountKeyAdminsSid = 113,
	AccountEnterpriseKeyAdminsSid = 114,
	AuthenticationKeyTrustSid = 115,
	AuthenticationKeyPropertyMFASid = 116,
	AuthenticationKeyPropertyAttestationSid = 117,
	AuthenticationFreshKeyAuthSid = 118,
	BuiltinDeviceOwnersSid = 119,
}

CVT_SECONDS :: 1
cwcFILENAMESUFFIXMAX :: 20
cwcHRESULTSTRING :: 40
SE_ASSIGNPRIMARYTOKEN_NAME :: "SeAssignPrimaryTokenPrivilege"
SE_AUDIT_NAME :: "SeAuditPrivilege"
SE_BACKUP_NAME :: "SeBackupPrivilege"
SE_CHANGE_NOTIFY_NAME :: "SeChangeNotifyPrivilege"
SE_CREATE_GLOBAL_NAME :: "SeCreateGlobalPrivilege"
SE_CREATE_PAGEFILE_NAME :: "SeCreatePagefilePrivilege"
SE_CREATE_PERMANENT_NAME :: "SeCreatePermanentPrivilege"
SE_CREATE_SYMBOLIC_LINK_NAME :: "SeCreateSymbolicLinkPrivilege"
SE_CREATE_TOKEN_NAME :: "SeCreateTokenPrivilege"
SE_DEBUG_NAME :: "SeDebugPrivilege"
SE_DELEGATE_SESSION_USER_IMPERSONATE_NAME :: "SeDelegateSessionUserImpersonatePrivilege"
SE_ENABLE_DELEGATION_NAME :: "SeEnableDelegationPrivilege"
SE_IMPERSONATE_NAME :: "SeImpersonatePrivilege"
SE_INC_BASE_PRIORITY_NAME :: "SeIncreaseBasePriorityPrivilege"
SE_INC_WORKING_SET_NAME :: "SeIncreaseWorkingSetPrivilege"
SE_INCREASE_QUOTA_NAME :: "SeIncreaseQuotaPrivilege"
SE_LOAD_DRIVER_NAME :: "SeLoadDriverPrivilege"
SE_LOCK_MEMORY_NAME :: "SeLockMemoryPrivilege"
SE_MACHINE_ACCOUNT_NAME :: "SeMachineAccountPrivilege"
SE_MANAGE_VOLUME_NAME :: "SeManageVolumePrivilege"
SE_PROF_SINGLE_PROCESS_NAME :: "SeProfileSingleProcessPrivilege"
SE_RELABEL_NAME :: "SeRelabelPrivilege"
SE_REMOTE_SHUTDOWN_NAME :: "SeRemoteShutdownPrivilege"
SE_RESTORE_NAME :: "SeRestorePrivilege"
SE_SECURITY_NAME :: "SeSecurityPrivilege"
SE_SHUTDOWN_NAME :: "SeShutdownPrivilege"
SE_SYNC_AGENT_NAME :: "SeSyncAgentPrivilege"
SE_SYSTEM_ENVIRONMENT_NAME :: "SeSystemEnvironmentPrivilege"
SE_SYSTEM_PROFILE_NAME :: "SeSystemProfilePrivilege"
SE_SYSTEMTIME_NAME :: "SeSystemtimePrivilege"
SE_TAKE_OWNERSHIP_NAME :: "SeTakeOwnershipPrivilege"
SE_TCB_NAME :: "SeTcbPrivilege"
SE_TIME_ZONE_NAME :: "SeTimeZonePrivilege"
SE_TRUSTED_CREDMAN_ACCESS_NAME :: "SeTrustedCredManAccessPrivilege"
SE_UNDOCK_NAME :: "SeUndockPrivilege"
SE_UNSOLICITED_INPUT_NAME :: "SeUnsolicitedInputPrivilege"
SECURITY_APP_PACKAGE_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 15}}
SECURITY_AUTHENTICATION_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 18}}
SECURITY_CREATOR_SID_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 3}}
SECURITY_DYNAMIC_TRACKING :: 1
SECURITY_LOCAL_SID_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 2}}
SECURITY_MANDATORY_LABEL_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 16}}
SECURITY_MAX_SID_SIZE :: 68
SECURITY_NON_UNIQUE_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 4}}
SECURITY_NT_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 5}}
SECURITY_NULL_SID_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 0}}
SECURITY_PROCESS_TRUST_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 19}}
SECURITY_RESOURCE_MANAGER_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 9}}
SECURITY_SCOPED_POLICY_ID_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 17}}
SECURITY_STATIC_TRACKING :: 0
SECURITY_WORLD_SID_AUTHORITY :: SID_IDENTIFIER_AUTHORITY{{0, 0, 0, 0, 0, 1}}
SIGNING_LEVEL_FILE_CACHE_FLAG_NOT_VALIDATED :: 1
SIGNING_LEVEL_FILE_CACHE_FLAG_VALIDATE_ONLY :: 4
SIGNING_LEVEL_MICROSOFT :: 8
szLBRACE :: "{"
szLPAREN :: "("
szRBRACE :: "}"
szRPAREN :: ")"
wszCERTENROLLSHAREPATH :: "CertSrv\\CertEnroll"
wszFCSAPARM_CERTFILENAMESUFFIX :: "%4"
wszFCSAPARM_CONFIGDN :: "%6"
wszFCSAPARM_CRLDELTAFILENAMESUFFIX :: "%9"
wszFCSAPARM_CRLFILENAMESUFFIX :: "%8"
wszFCSAPARM_DOMAINDN :: "%5"
wszFCSAPARM_DSCACERTATTRIBUTE :: "%11"
wszFCSAPARM_DSCRLATTRIBUTE :: "%10"
wszFCSAPARM_DSCROSSCERTPAIRATTRIBUTE :: "%14"
wszFCSAPARM_DSKRACERTATTRIBUTE :: "%13"
wszFCSAPARM_DSUSERCERTATTRIBUTE :: "%12"
wszFCSAPARM_SANITIZEDCANAME :: "%3"
wszFCSAPARM_SANITIZEDCANAMEHASH :: "%7"
wszFCSAPARM_SERVERDNSNAME :: "%1"
wszFCSAPARM_SERVERSHORTNAME :: "%2"
wszLBRACE :: "{"
wszLPAREN :: "("
wszRBRACE :: "}"
wszRPAREN :: ")"

