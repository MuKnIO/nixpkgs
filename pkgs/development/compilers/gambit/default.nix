{ callPackage, fetchurl }:

callPackage ./build.nix rec {
  version = "4.9.7";
  # leading v added by fixStamp script
  git-version = "${version}";
  src = fetchurl {
    url = "https://gambitscheme.org/4.9.7/gambit-v4_9_7.tgz";
    sha256 = "sha256-UkPT1cw6gucYYBaAsS9IJZTSkUsaiSuKTIASu500PCI=";
  };
}
