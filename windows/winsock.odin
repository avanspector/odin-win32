package windows

ADDRESS_FAMILY :: enum u16 {
	INET = 0x0002,
	INET6 = 0x0017,
	UNSPEC = 0x0000,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/inaddr/ns-inaddr-in_addr ]]
IN_ADDR :: struct {
	S_un: struct #raw_union {
		S_un_b: struct {
			s_b1: u8,
			s_b2: u8,
			s_b3: u8,
			s_b4: u8,
		},
		S_un_w: struct {
			s_w1: u16,
			s_w2: u16,
		},
		S_addr: u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/in6addr/ns-in6addr-in6_addr ]]
IN6_ADDR :: struct {
	u: struct #raw_union {
		Byte: [16]u8,
		Word: [8]u16,
	},
}

SCOPE_ID :: struct {
	using _: struct #raw_union {
		using _: struct {
			using _: bit_field u32 {
				Zone: u32 | 28,
				Level: u32 | 4,
			},
		},
		Value: u32,
	},
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-sockaddr ]]
SOCKADDR :: struct {
	sa_family: ADDRESS_FAMILY,
	sa_data: [14]CHAR,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-sockaddr_in ]]
SOCKADDR_IN :: struct {
	sin_family: ADDRESS_FAMILY,
	sin_port: u16,
	sin_addr: IN_ADDR,
	sin_zero: [8]CHAR,
}

SOCKADDR_IN6 :: struct {
	sin6_family: ADDRESS_FAMILY,
	sin6_port: u16,
	sin6_flowinfo: u32,
	sin6_addr: IN6_ADDR,
	using _: struct #raw_union {
		sin6_scope_id: u32,
		sin6_scope_struct: SCOPE_ID,
	},
}

