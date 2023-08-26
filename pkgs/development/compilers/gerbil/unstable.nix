{ callPackage, fetchFromGitHub, gambit-unstable, gambit-support, pkgs }:

callPackage ./build.nix rec {
  version = "unstable-2023-09-10";
  git-version = "0.17.0-232-g0d55ba57";
  src = fetchFromGitHub {
    owner = "vyzo";
    repo = "gerbil";
    rev = "0d55ba57dd18f6417f6cd6015c5e606067c91d28";
    sha256 = "0pcvacgkjjlzcxwlmb5657qay4i55zxlc137fp5p4jfwjv54nnsg";
    fetchSubmodules = true;
  };
  inherit gambit-support;
  gambitPkgs = []; # Now comes with integrated gambit as a git module
  gambit-params = gambit-support.unstable-params;
  configureDir = "./";
  extraConfigureFlags = [
    "--enable-deprecated"
    # "--with-gambit=4.9.5" # Use a different commit or tag to select gambit
  ];
  extraPatch = ''
    substituteInPlace ./configure --replace 'set -e' 'set -e ; git () { echo "${git-version}" ;}' ;
    rmdir src/gambit
    cp -a ${pkgs.gambit-unstable.src} ./src/gambit
    chmod -R u+w ./src/gambit
  '';
  install = "./install.sh";
  GERBIL_PREFIX_var = "GERBIL_PREFIX";
}
