{ callPackage, fetchFromGitHub, gambit-unstable, gambit-support }:

callPackage ./build.nix rec {
  version = "unstable-2023-03-23";
  git-version = "0.17.0-78-gc0d6e529";
  src = fetchFromGitHub {
    #owner = "vyzo";
    owner = "drewc";
    repo = "gerbil";
    rev = "c0d6e529c55e91e41fa924afdfb48bc77266f66a";
    sha256 = "187sfa1rjraln4f0ga1rk2mwa3hw5phdv2938870gc0c71avw4m1";
  };
  inherit gambit-support;
  gambit = gambit-unstable;
  gambit-params = gambit-support.unstable-params;
}
