{ pkgs, lib, fetchFromGitHub, gerbilPackages, ... }:

{
  pname = "gerbil-crypto";
  version = "unstable-2021-11-30";
  git-version = "0.0-17-g1559606";
  gerbil-package = "clan/crypto";
  gerbilInputs = with gerbilPackages; [ gerbil-utils gerbil-poo ];
  version-path = "version";
  softwareName = "Gerbil-crypto";

  buildInputs = with pkgs; [ secp256k1 pkg-config ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "fare";
    repo = "gerbil-crypto";
    rev = "1559606fdc787f4140c3008b2f59743e3e8166c6";
    sha256 = "145dwysmjrfdl35m4k7dyckj1vlc5923nsn6a35lsr9d6qr0ba69";
  };

  meta = with lib; {
    description = "Gerbil Crypto: Extra Cryptographic Primitives for Gerbil";
    homepage    = "https://github.com/fare/gerbil-crypto";
    license     = licenses.asl20;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
