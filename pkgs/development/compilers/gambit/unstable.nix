{ callPackage, fetchFromGitHub, gambit-support }:

callPackage ./build.nix {
  version = "unstable-2021-11-30";
  git-version = "4.9.3-1566-g3afde545";
  stampYmd = 20211130;
  stampHms = 175927;
  src = fetchFromGitHub {
    owner = "feeley";
    repo = "gambit";
    rev = "3afde545510d730fdbc9e5045dbab487701a9e0b";
    sha256 = "1jm5fwcdx88d1cd8pwhsjd4klqlr5gjbx27i9sn1a5s14s7kfbh4";
  };
  gambit-params = gambit-support.unstable-params;
}
