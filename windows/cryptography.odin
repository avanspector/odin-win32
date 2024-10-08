package windows

// [[ Documentation; https://learn.microsoft.com/windows/win32/SecCrypto/alg-id ]]
ALG_ID :: enum u32 {
	MD2 = 0x00008001,
	MD4 = 0x00008002,
	MD5 = 0x00008003,
	SHA = 0x00008004,
	SHA1 = 0x00008004,
	MAC = 0x00008005,
	RSA_SIGN = 0x00002400,
	DSS_SIGN = 0x00002200,
	NO_SIGN = 0x00002000,
	RSA_KEYX = 0x0000A400,
	DES = 0x00006601,
	_3DES_112 = 0x00006609,
	_3DES = 0x00006603,
	DESX = 0x00006604,
	RC2 = 0x00006602,
	RC4 = 0x00006801,
	SEAL = 0x00006802,
	DH_SF = 0x0000AA01,
	DH_EPHEM = 0x0000AA02,
	AGREEDKEY_ANY = 0x0000AA03,
	KEA_KEYX = 0x0000AA04,
	HUGHES_MD5 = 0x0000A003,
	SKIPJACK = 0x0000660A,
	TEK = 0x0000660B,
	CYLINK_MEK = 0x0000660C,
	SSL3_SHAMD5 = 0x00008008,
	SSL3_MASTER = 0x00004C01,
	SCHANNEL_MASTER_HASH = 0x00004C02,
	SCHANNEL_MAC_KEY = 0x00004C03,
	SCHANNEL_ENC_KEY = 0x00004C07,
	PCT1_MASTER = 0x00004C04,
	SSL2_MASTER = 0x00004C05,
	TLS1_MASTER = 0x00004C06,
	RC5 = 0x0000660D,
	HMAC = 0x00008009,
	TLS1PRF = 0x0000800A,
	HASH_REPLACE_OWF = 0x0000800B,
	AES_128 = 0x0000660E,
	AES_192 = 0x0000660F,
	AES_256 = 0x00006610,
	AES = 0x00006611,
	SHA_256 = 0x0000800C,
	SHA_384 = 0x0000800D,
	SHA_512 = 0x0000800E,
	ECDH = 0x0000AA05,
	ECDH_EPHEM = 0x0000AE06,
	ECMQV = 0x0000A001,
	ECDSA = 0x00002203,
	NULLCIPHER = 0x00006000,
	THIRDPARTY_KEY_EXCHANGE = 0x0000B000,
	THIRDPARTY_SIGNATURE = 0x00003000,
	THIRDPARTY_CIPHER = 0x00007000,
	THIRDPARTY_HASH = 0x00009000,
}

