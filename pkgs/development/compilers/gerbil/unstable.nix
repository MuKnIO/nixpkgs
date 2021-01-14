{ callPackage, fetchFromGitHub, gambit-unstable, gambit-support }:

callPackage ./build.nix rec {
  version = "unstable-2021-12-01";
  git-version = "0.16-263-g30d7967c";
  src = fetchFromGitHub {
    owner = "vyzo";
    repo = "gerbil";
    rev = "30d7967ca3a95e46e9e6b520a3fd743ccf00df91";
    sha256 = "0k5w80abm59igy4q32wj4xzkahmhjqc9cc04kc989yaw2kdjdpg0";
  };
  inherit gambit-support;
  gambit = gambit-unstable;
  gambit-params = gambit-support.unstable-params;
}
