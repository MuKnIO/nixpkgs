{ callPackage, fetchFromGitHub, gambit-support }:

callPackage ./build.nix {
  version = "unstable-2023-05-24";
  git-version = "4.9.4-181-g77c2da51";
  stampYmd = 20230524;
  stampHms = 173317;
  src = fetchFromGitHub {
    owner = "gambit";
    repo = "gambit";
    rev = "77c2da5192facf5b057584cbf7e4d8b1725a8c1c";
    sha256 = "0p37wqsnadvbl5mk951gxs35bcsgh8x2da272l4qk660aaxmpx52";
  };
  gambit-params = gambit-support.unstable-params;
}
