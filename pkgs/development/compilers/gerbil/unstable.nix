{
  callPackage,
  fetchFromGitHub,
  gambit-support,
}:

callPackage ./build.nix rec {
  version = "unstable-2024-12-11";
  git-version = "0.18.1-138-g625c4506";
  src = fetchFromGitHub {
    owner = "mighty-gerbils";
    repo = "gerbil";
    rev = "625c450692fff3f5b4b0e6d795bd3d1e0e6fc541";
    sha256 = "1jc7iz9vcy98z2c2wxb8x53am9vrkjk11g3mrr774728jc2v3w6q";
    fetchSubmodules = true;
  };
  inherit gambit-support;
  gambit-params = gambit-support.unstable-params;
  # These are available in pkgs.gambit-unstable.passthru.git-version, etc.
  gambit-git-version = "4.9.5-130-g09335d95";
  gambit-stampYmd = "20231029";
  gambit-stampHms = "163035";
}
