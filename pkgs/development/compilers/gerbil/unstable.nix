{ callPackage, fetchFromGitHub, gambit-unstable, gambit-support }:

callPackage ./build.nix rec {
  version = "unstable-2022-01-10";
  git-version = "0.16-275-g7014e282";
  src = fetchFromGitHub {
    owner = "vyzo";
    repo = "gerbil";
    rev = "7014e282dad51978c67f2746ac3e8553c73e09a3";
    sha256 = "0c0nspm659ybgmqlppdv7sxzll4hwkvcp9qmcsip6d0kz0p8r9c3";
  };
  inherit gambit-support;
  gambit = gambit-unstable;
  gambit-params = gambit-support.unstable-params;
}
