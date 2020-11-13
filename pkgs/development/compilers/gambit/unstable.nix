{ callPackage, fetchFromGitHub, gambit-support }:

callPackage ./build.nix {
  version = "unstable-2022-08-30";
  git-version = "4.9.4-63-g18987297";
  stampYmd = 20220830;
  stampHms = 155827;
  src = fetchFromGitHub {
    owner = "gambit";
    repo = "gambit";
    rev = "18987297ef9056e8a002e671be2443ba8814e3ad";
    sha256 = "0hsq20sr3d2dqc7khll8sx6rg9xx2qa9z8sw3i5ayfr4lj2cysd1";
  };
  gambit-params = gambit-support.unstable-params;
}
