{ callPackage, fetchFromGitHub, gambit-unstable, gambit-support }:

callPackage ./build.nix rec {
  version = "unstable-2022-08-01";
  git-version = "0.17.0-63-g8e114a36";
  src = fetchFromGitHub {
    owner = "vyzo";
    repo = "gerbil";
    rev = "8e114a367c9ad81c4faa9f544a4a37f9fc9bd0e3";
    sha256 = "1c6ycdxhdsbdn3v3fy31ygzyllm77wrq9xffj9fxsi6ygy7aykqp";
  };
  inherit gambit-support;
  gambit = gambit-unstable;
  gambit-params = gambit-support.unstable-params;
}
