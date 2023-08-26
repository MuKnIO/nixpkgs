{ pkgs, lib, fetchFromGitHub, gerbilPackages, ... }:

{
  pname = "gerbil-crypto";
  version = "unstable-2023-08-14";
  git-version = "0.0-19-gf049164";
  gerbil-package = "clan/crypto";
  gerbilInputs = with gerbilPackages; [ gerbil-utils gerbil-poo ];
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ pkgs.secp256k1 ];
  version-path = "version";
  softwareName = "Gerbil-crypto";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "fare";
    repo = "gerbil-crypto";
    rev = "f049164b6d3172fb98c1436ab1fa125cde2519b6";
    sha256 = "1ym3lljjd39wgv3zsi10mq3frasqqhvzj9vbn00xpyl4agwm8zh8";
  };

  meta = with lib; {
    description = "Gerbil Crypto: Extra Cryptographic Primitives for Gerbil";
    homepage    = "https://github.com/fare/gerbil-crypto";
    license     = licenses.asl20;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
