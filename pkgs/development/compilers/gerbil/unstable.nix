{
  callPackage,
  fetchFromGitHub,
  gambit-support,
}:

callPackage ./build.nix rec {
  version = "unstable-2025-11-15";
  git-version = "0.18.1-172-g0cee64de";
  src = fetchFromGitHub {
    owner = "mighty-gerbils";
    repo = "gerbil";
    rev = "0cee64de38756ed9198d3493d4c7afddfa6e04e1";
    sha256 = "0xhkk3isarigf2ly0n32rma9br1ywb5mfhaby815f95fn2nmm1pm";
    fetchSubmodules = true;
  };
  inherit gambit-support;
  gambit-params = gambit-support.unstable-params;
  # These are available in pkgs.gambit-unstable.passthru.git-version, etc.
  gambit-git-version = "4.9.7-6-g64f4d369";
  gambit-stampYmd = "20231029";
  gambit-stampHms = "163035";
}
