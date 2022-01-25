{ callPackage, fetchurl }:

callPackage ./build.nix rec {
  version = "4.9.4";
  git-version = version;
  src = fetchurl {
    url = "https://gambitscheme.org/4.9.4/gambit-v4_9_4.tgz";
    sha256 = "025x8zi9176qwww4d3pk8aj9ab1fpqyxqz26q3v394k6bfk49yqr";
  };
}
