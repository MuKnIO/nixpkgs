{ callPackage, fetchFromGitHub, gambit-support }:

callPackage ./build.nix {
  version = "unstable-2023-09-07";
  git-version = "4.9.5-39-g7a9ccb85";
  stampYmd = 20230907;
  stampHms = 131624;
  src = fetchFromGitHub {
    owner = "gambit";
    repo = "gambit";
    rev = "7a9ccb85ebd0cc02d6e78446121d655b90d3d743";
    sha256 = "0v9w6vcikc3whgjncm5kw1dkk17s6nvimnw48hwmbmnf4hayigrr";
  };
  gambit-params = gambit-support.unstable-params;
}
