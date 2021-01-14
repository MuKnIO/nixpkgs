{ callPackage, fetchFromGitHub, gambit-unstable, gambit-support }:

callPackage ./build.nix rec {
  version = "unstable-2023-05-18";
  git-version = "0.17.0-75-ge451c8ae";
  src = fetchFromGitHub {
    owner = "vyzo";
    repo = "gerbil";
    rev = "e451c8ae6f5f4cb69dbad1732721cbf14679324d";
    sha256 = "14iza868x2lx6cddzx86qai4w5fibc7vxqgvjqxkcm7h4nhs5vf5";
  };
  inherit gambit-support;
  gambit = gambit-unstable;
  gambit-params = gambit-support.unstable-params;
}
