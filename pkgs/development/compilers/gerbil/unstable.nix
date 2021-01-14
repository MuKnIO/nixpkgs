{ callPackage, fetchFromGitHub, gambit-unstable, gambit-support }:

callPackage ./build.nix rec {
  version = "unstable-2022-03-28";
  git-version = "0.17.0-26-g96025a9c";
  src = fetchFromGitHub {
    owner = "vyzo";
    repo = "gerbil";
    rev = "96025a9c0301d03147ef409f5cc568a00d9f05d4";
    sha256 = "1wga0ka1hk49pg0vlfiarmhg13hzs8j0zgvmgz87ryggnh5bs97m";
  };
  inherit gambit-support;
  gambit = gambit-unstable;
  gambit-params = gambit-support.unstable-params;
}
