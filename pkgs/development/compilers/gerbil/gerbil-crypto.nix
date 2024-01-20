{
  pkgs,
  lib,
  fetchFromGitHub,
  gerbilPackages,
  ...
}:

{
  pname = "gerbil-crypto";
  version = "unstable-2025-06-19";
  git-version = "0.1-13-gb5d141c";
  gerbil-package = "clan/crypto";
  gerbilInputs = with gerbilPackages; [
    gerbil-utils
    gerbil-poo
  ];
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.secp256k1 pkgs.libsodium pkgs.blst ];
  version-path = "version";
  softwareName = "Gerbil-crypto";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-crypto";
    rev = "b5d141cd521957e73362b60687ed81fc9e136b9c";
    sha256 = "0z2j6l24zr967ji6m7fyx6z5awyy9ayjwz6y2y9y3n1kpm366n0a";
  };

  meta = {
    description = "Gerbil Crypto: Extra Cryptographic Primitives for Gerbil";
    homepage = "https://github.com/fare/gerbil-crypto";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ fare ];
  };
}
