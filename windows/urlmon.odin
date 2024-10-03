package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/api/urlmon/ns-urlmon-softdistinfo ]]
SOFTDISTINFO :: struct {
	cbSize: u32,
	dwFlags: u32,
	dwAdState: u32,
	szTitle: PWSTR,
	szAbstract: PWSTR,
	szHREF: PWSTR,
	dwInstalledVersionMS: u32,
	dwInstalledVersionLS: u32,
	dwUpdateVersionMS: u32,
	dwUpdateVersionLS: u32,
	dwAdvertisedVersionMS: u32,
	dwAdvertisedVersionLS: u32,
	dwReserved: u32,
}

