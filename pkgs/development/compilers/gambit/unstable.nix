{
  callPackage,
  fetchFromGitHub,
  gambit-support,
}:

callPackage ./build.nix rec {
  version = "unstable-2025-11-02";
  # leading v added by fixStamp script
  git-version = "4.9.7-26-g249a1780";
  stampYmd = 20251102;
  stampHms = 005422;
  rev = "249a1780e75095feb1147fdcc2d4c944c59bfb79";
  src = fetchFromGitHub {
    owner = "gambit";
    repo = "gambit";
    inherit rev;
    sha256 = "1jkzhqbbvpr1kn1gsxarrr7x8py3h57v754s03144ndpyhygzbfv";
  };
  gambit-params = gambit-support.unstable-params;
}
