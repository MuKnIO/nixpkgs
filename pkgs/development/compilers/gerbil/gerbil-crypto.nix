{
  pkgs,
  lib,
  fetchFromGitHub,
  gerbilPackages,
  ...
}:

{
  pname = "gerbil-crypto";
  version = "unstable-2024-11-22";
  git-version = "0.1-7-g8fbc99d";
  gerbil-package = "clan/crypto";
  gerbilInputs = with gerbilPackages; [
    gerbil-utils
    gerbil-poo
  ];
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.secp256k1 pkgs.libsodium ];
  version-path = "version";
  softwareName = "Gerbil-crypto";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-crypto";
    rev = "8fbc99d314c03f980b52dab0782835b24839fcd5";
    sha256 = "10zvgd7w113sapnzbyc1n28s0ymylmzsxlafkc4acgfkb663aj9d";
  };

  meta = with lib; {
    description = "Gerbil Crypto: Extra Cryptographic Primitives for Gerbil";
    homepage = "https://github.com/fare/gerbil-crypto";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
