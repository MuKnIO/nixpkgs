{ callPackage, fetchFromGitHub, gambit-support }:

callPackage ./build.nix {
  version = "unstable-2022-06-03";
  git-version = "4.9.4-41-ga34094ff";
  stampYmd = 20220603;
  stampHms = 221047;
  src = fetchFromGitHub {
    owner = "gambit";
    repo = "gambit";
    rev = "a34094ff7ea4cf2f62e771e802d41b2c5579587e";
    sha256 = "0ka4b2qmcsw3j1h4fw7qyslqyzq2ak9ml5qcbvhb6v5ifiibgif8";
  };
  gambit-params = gambit-support.unstable-params;
}
