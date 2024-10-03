package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/iphlpapi/ne-iphlpapi-net_address_format ]]
NET_ADDRESS_FORMAT :: enum i32 {
	FORMAT_UNSPECIFIED = 0,
	DNS_NAME = 1,
	IPV4 = 2,
	IPV6 = 3,
}

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/iphlpapi/ns-iphlpapi-net_address_info ]]
NET_ADDRESS_INFO :: struct {
	Format: NET_ADDRESS_FORMAT,
	using _: struct #raw_union {
		NamedAddress: struct {
			Address: [256]u16,
			Port: [6]u16,
		},
		Ipv4Address: SOCKADDR_IN,
		Ipv6Address: SOCKADDR_IN6,
		IpAddress: SOCKADDR,
	},
}

