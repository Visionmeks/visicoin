#ifndef BITCOIN_CHAINPARAMSSEEDS_H
#define BITCOIN_CHAINPARAMSSEEDS_H
/**
 * List of fixed seed nodes for the gladtcoin network
 * AUTOGENERATED by contrib/seeds/generate-seeds.py
 *
 * Each line contains a 16-byte IPv6 address and a port.
 * IPv4 as well as onion addresses are wrapped inside an IPv6 address accordingly.
 */
static SeedSpec6 pnSeed6_main[] = {
    {{0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0x02,0x84,0x64,0x2f}, 8333},
    {{0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0x05,0x01,0x61,0x04}, 8333}
};

static SeedSpec6 pnSeed6_test[] = {
    {{0xfd,0x87,0xd8,0x7e,0xeb,0x43,0x99,0xcb,0x26,0x31,0xba,0x48,0x51,0x31,0x39,0x0d}, 18333},
    {{0xfd,0x87,0xd8,0x7e,0xeb,0x43,0x44,0xf4,0xf4,0xf0,0xbf,0xf7,0x7e,0x6d,0xc4,0xe8}, 18333}
};
#endif // BITCOIN_CHAINPARAMSSEEDS_H
