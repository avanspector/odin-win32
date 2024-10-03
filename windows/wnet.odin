package windows

NET_RESOURCE_SCOPE :: enum u32 {
	CONNECTED = 0x00000001,
	CONTEXT = 0x00000005,
	GLOBALNET = 0x00000002,
	REMEMBERED = 0x00000003,
}

NET_RESOURCE_TYPE :: distinct bit_set[enum {
	DISK = 0,
	PRINT = 1,
}; u32]
NET_RESOURCE_TYPE_ANY :: transmute(NET_RESOURCE_TYPE)u32(0x00000000)

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-netresourcea ]]
NETRESOURCEA :: struct {
	dwScope: NET_RESOURCE_SCOPE,
	dwType: NET_RESOURCE_TYPE,
	dwDisplayType: u32,
	dwUsage: u32,
	lpLocalName: PSTR,
	lpRemoteName: PSTR,
	lpComment: PSTR,
	lpProvider: PSTR,
}

