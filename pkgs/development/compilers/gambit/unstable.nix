{
  callPackage,
  fetchFromGitHub,
  gambit-support,
}:

callPackage ./build.nix rec {
  version = "unstable-2024-12-10";
  git-version = "4.9.5-208-g2686dd61";
  stampYmd = 20241210;
  stampHms = 214633;
  rev = "2686dd61237aa562eb0ff206bc689bc8a77b45c9";
  src = fetchFromGitHub {
    owner = "gambit";
    repo = "gambit";
    inherit rev;
    sha256 = "1db9gm30szdbjagbx8x5ghn0zlivc1rsmlqz595cjwyxrl7dklr1";
  };
  gambit-params = gambit-support.unstable-params;
}
