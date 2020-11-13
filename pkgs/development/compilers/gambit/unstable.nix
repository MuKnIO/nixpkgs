{ callPackage, fetchFromGitHub, gambit-support }:

callPackage ./build.nix {
  version = "unstable-2023-04-03";
  git-version = "4.9.4-179-g5a9ea674";
  stampYmd = 20230403;
  stampHms = 021703;
  src = fetchFromGitHub {
    owner = "gambit";
    repo = "gambit";
    rev = "5a9ea6742ecd446b20c7d7f6f30877e7cffc737d";
    sha256 = "1idgpnc6i9dds4f1s5bwvrf5ym6lp1j7fjh2gsjhavc4s67bs90m";
  };
  gambit-params = gambit-support.unstable-params;
}
