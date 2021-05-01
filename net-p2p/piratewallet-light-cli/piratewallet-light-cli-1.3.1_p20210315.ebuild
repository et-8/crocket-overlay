# Copyright 2017-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

CRATES="
addchain-0.1.0
adler32-1.0.4
aes-0.3.2
aes-soft-0.3.3
aesni-0.6.0
aho-corasick-0.7.6
ansi_term-0.11.0
antidote-1.0.0
anyhow-1.0.26
arc-swap-0.3.11
arc-swap-0.4.4
arrayref-0.3.5
arrayvec-0.5.1
async-stream-0.2.0
async-stream-impl-0.2.0
async-trait-0.1.22
atty-0.2.13
autocfg-0.1.7
autocfg-1.0.1
backtrace-0.3.40
backtrace-sys-0.1.32
base58-0.1.0
base64-0.10.1
base64-0.11.0
base64-0.12.3
bech32-0.7.1
bit-vec-0.4.4
bitflags-1.2.1
blake2b_simd-0.5.9
blake2s_simd-0.5.9
block-buffer-0.7.3
block-cipher-trait-0.6.2
block-padding-0.1.5
bs58-0.2.5
bumpalo-2.6.0
byte-tools-0.3.1
byteorder-1.3.2
bytes-0.4.12
bytes-0.5.3
c2-chacha-0.2.3
cc-1.0.48
cfg-if-0.1.10
chrono-0.4.10
clap-2.33.0
cloudabi-0.0.3
constant_time_eq-0.1.4
core-foundation-0.7.0
core-foundation-sys-0.7.0
crc32fast-1.2.0
crossbeam-0.7.3
crossbeam-channel-0.4.4
crossbeam-deque-0.7.3
crossbeam-epoch-0.8.2
crossbeam-queue-0.2.3
crossbeam-utils-0.6.6
crossbeam-utils-0.7.2
crypto-mac-0.7.0
crypto_api-0.2.2
crypto_api_chachapoly-0.2.2
digest-0.8.1
dirs-2.0.2
dirs-sys-0.3.4
dtoa-0.4.4
either-1.5.3
encoding_rs-0.8.24
failure-0.1.6
failure_derive-0.1.6
fake-simd-0.1.2
filetime-0.2.8
fixedbitset-0.2.0
flate2-1.0.13
fnv-1.0.6
foreign-types-0.3.2
foreign-types-shared-0.1.1
fpe-0.2.0
fuchsia-cprng-0.1.1
fuchsia-zircon-0.3.3
fuchsia-zircon-sys-0.3.3
futures-0.1.29
futures-channel-0.3.1
futures-core-0.3.1
futures-cpupool-0.1.8
futures-io-0.3.5
futures-sink-0.3.1
futures-task-0.3.1
futures-util-0.3.1
generic-array-0.12.3
getrandom-0.1.13
h2-0.2.5
hashbrown-0.1.8
heck-0.3.1
hermit-abi-0.1.5
hex-0.3.2
hmac-0.7.1
http-0.2.0
http-body-0.3.1
httparse-1.3.4
humantime-1.3.0
hyper-0.13.5
hyper-tls-0.4.3
idna-0.2.0
indexmap-1.3.0
iovec-0.1.4
ipnet-2.3.0
itertools-0.8.2
itoa-0.4.4
js-sys-0.3.33
json-0.12.0
kernel32-sys-0.2.2
lazy_static-1.4.0
libc-0.2.70
libflate-0.1.27
libsodium-sys-0.2.5
linked-hash-map-0.5.2
lock_api-0.1.5
log-0.4.8
log-mdc-0.1.0
log4rs-0.8.3
matches-0.1.8
maybe-uninit-2.0.0
memchr-2.2.1
memoffset-0.5.6
mime-0.3.16
mime_guess-2.0.3
miniz_oxide-0.3.5
mio-0.6.21
mio-named-pipes-0.1.6
mio-uds-0.6.7
miow-0.2.1
miow-0.3.3
multimap-0.8.0
native-tls-0.2.4
net2-0.2.33
nix-0.14.1
nom-4.2.3
num-bigint-0.2.3
num-integer-0.1.41
num-traits-0.2.10
num_cpus-1.13.0
once_cell-0.1.8
opaque-debug-0.2.3
openssl-0.10.30
openssl-probe-0.1.2
openssl-sys-0.9.58
ordered-float-1.0.2
parking_lot-0.7.1
parking_lot_core-0.4.0
pbkdf2-0.3.0
percent-encoding-2.1.0
petgraph-0.5.0
pin-project-0.4.6
pin-project-internal-0.4.6
pin-project-lite-0.1.5
pin-utils-0.1.0-alpha.4
pkg-config-0.3.17
ppv-lite86-0.2.6
proc-macro2-1.0.12
prost-0.6.1
prost-build-0.6.1
prost-derive-0.6.1
prost-types-0.6.1
protobuf-2.8.1
protobuf-codegen-2.8.1
protobuf-codegen-pure-2.8.1
quick-error-1.2.2
quote-1.0.2
rand-0.4.6
rand-0.6.5
rand-0.7.2
rand_chacha-0.1.1
rand_chacha-0.2.1
rand_core-0.3.1
rand_core-0.4.2
rand_core-0.5.1
rand_hc-0.1.0
rand_hc-0.2.0
rand_isaac-0.1.1
rand_jitter-0.1.4
rand_os-0.1.3
rand_pcg-0.1.2
rand_pcg-0.2.1
rand_xorshift-0.1.1
rand_xorshift-0.2.0
rdrand-0.4.0
redox_syscall-0.1.56
redox_users-0.3.1
regex-1.3.1
regex-syntax-0.6.12
remove_dir_all-0.5.2
reqwest-0.10.8
ring-0.16.12
ripemd160-0.8.0
rle-decode-fast-1.0.1
rust-argon2-0.5.1
rust-embed-5.2.0
rust-embed-impl-5.2.0
rust-embed-utils-5.0.0
rustc-demangle-0.1.16
rustc_version-0.2.3
rustls-0.17.0
rustls-native-certs-0.3.0
rustyline-5.0.5
ryu-1.0.2
same-file-1.0.5
schannel-0.1.16
scopeguard-0.3.3
scopeguard-1.1.0
sct-0.6.0
secp256k1-0.15.0
security-framework-0.4.4
security-framework-sys-0.4.3
semver-0.9.0
semver-parser-0.7.0
serde-1.0.104
serde-value-0.5.3
serde_derive-1.0.104
serde_json-1.0.44
serde_urlencoded-0.6.1
serde_yaml-0.8.11
sha2-0.8.0
shellwords-1.0.0
signal-hook-registry-1.2.0
slab-0.4.2
smallvec-0.6.13
socket2-0.3.11
sodiumoxide-0.2.5
sourcefile-0.1.4
spin-0.5.2
strsim-0.8.0
subtle-1.0.0
subtle-2.2.2
syn-1.0.11
synstructure-0.12.3
take_mut-0.2.2
tar-0.4.26
tempdir-0.3.7
tempfile-3.1.0
textwrap-0.11.0
thread-id-3.3.0
thread_local-0.3.6
threadpool-1.8.0
time-0.1.42
tiny-bip39-0.6.2
tinyvec-0.3.4
tokio-0.2.21
tokio-macros-0.2.5
tokio-rustls-0.13.0
tokio-tls-0.3.1
tokio-util-0.3.1
tonic-0.2.1
tonic-build-0.1.1
tower-0.3.0
tower-balance-0.3.0
tower-buffer-0.3.0
tower-discover-0.3.0
tower-layer-0.3.0
tower-limit-0.3.0
tower-load-0.3.0
tower-load-shed-0.3.0
tower-make-0.3.0
tower-ready-cache-0.3.0
tower-retry-0.3.0
tower-service-0.3.0
tower-timeout-0.3.0
tower-util-0.3.0
tracing-0.1.11
tracing-attributes-0.1.6
tracing-core-0.1.8
tracing-futures-0.2.0
traitobject-0.1.0
try-lock-0.2.2
typemap-0.3.3
typenum-1.11.2
unicase-2.6.0
unicode-bidi-0.3.4
unicode-normalization-0.1.13
unicode-segmentation-1.6.0
unicode-width-0.1.7
unicode-xid-0.2.0
unsafe-any-0.4.2
untrusted-0.7.0
url-2.1.1
utf8parse-0.1.1
vcpkg-0.2.8
vec_map-0.8.1
version_check-0.1.5
version_check-0.9.2
void-1.0.2
walkdir-2.2.9
want-0.3.0
wasi-0.7.0
wasm-bindgen-0.2.56
wasm-bindgen-backend-0.2.56
wasm-bindgen-futures-0.4.6
wasm-bindgen-macro-0.2.56
wasm-bindgen-macro-support-0.2.56
wasm-bindgen-shared-0.2.56
wasm-bindgen-webidl-0.2.56
web-sys-0.3.33
webpki-0.21.0
webpki-roots-0.18.0
weedle-0.10.0
which-3.1.0
winapi-0.2.8
winapi-0.3.8
winapi-build-0.1.1
winapi-i686-pc-windows-gnu-0.4.0
winapi-util-0.1.2
winapi-x86_64-pc-windows-gnu-0.4.0
winreg-0.7.0
ws2_32-sys-0.2.1
xattr-0.2.2
yaml-rust-0.4.3
"

inherit cargo cargo-utils

DESCRIPTION="command-line pirate chain light wallet"
HOMEPAGE="https://github.com/PirateNetwork/piratewallet-light-cli"
COMMIT="e19a1572e3537bfdc83a43ea2002cf6b419cef52"
LIBRUSTZCASH_PV="2981c4d2860f7cd73282fed885daac0323ff0280"
LIBRUSTZCASH_P="librustzcash-${LIBRUSTZCASH_PV}"
SRC_URI="https://github.com/PirateNetwork/piratewallet-light-cli/archive/${COMMIT}.tar.gz -> ${P}.tar.gz
	https://github.com/zerocurrencycoin/librustzcash/archive/${LIBRUSTZCASH_PV}.tar.gz -> ${LIBRUSTZCASH_P}.tar.gz
	$(cargo_crate_uris ${CRATES})"
LICENSE="Apache-2.0 BSD-2 MIT Apache-2.0-with-LLVM-exceptions Boost-1.0 ISC ZLIB BSD CC0-1.0 Unlicense MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="primaryuri"
BDEPEND="
	|| ( dev-lang/rust[rustfmt] dev-lang/rust-bin[rustfmt] )
"
S="${WORKDIR}/${PN}-${COMMIT}"
DOCS=( "README.md" "bip39bug.md" )
PATCHES=(
	"${FILESDIR}/piratewallet-light-cli-1.3.1_p20210315.patch"
)

src_prepare() {
	default

	cd "${WORKDIR}/${LIBRUSTZCASH_P}" || die
	mv bellman "${ECARGO_VENDOR}/bellman-0.6.0" || die
	mv ff/ff_derive "${ECARGO_VENDOR}/ff_derive-0.6.0" || die
	mv ff "${ECARGO_VENDOR}/ff-0.6.0" || die
	mv group "${ECARGO_VENDOR}/group-0.6.0" || die
	mv pairing "${ECARGO_VENDOR}/pairing-0.16.0" || die
	mv zcash_client_backend "${ECARGO_VENDOR}/zcash_client_backend-0.2.0" || die
	mv zcash_primitives "${ECARGO_VENDOR}/zcash_primitives-0.2.0" || die
	mv zcash_proofs "${ECARGO_VENDOR}/zcash_proofs-0.2.0" || die

	externally_provided_crates=(
		"bellman-0.6.0"
		"ff-0.6.0"
		"ff_derive-0.6.0"
		"group-0.6.0"
		"pairing-0.16.0"
		"zcash_client_backend-0.2.0"
		"zcash_primitives-0.2.0"
		"zcash_proofs-0.2.0"
	)
	cargo-utils_gen_checksum "${externally_provided_crates[@]}"
}

src_install() {
	einstalldocs
	newbin target/release/zecwallet-cli piratewallet-light-cli
}