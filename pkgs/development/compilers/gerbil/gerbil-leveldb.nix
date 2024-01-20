{
  pkgs,
  lib,
  fetchFromGitHub,
  leveldb,
  ...
}:

{
  pname = "gerbil-leveldb";
  version = "unstable-2024-04-11";
  git-version = "9386da1";
  gerbil-package = "clan";
  gerbilInputs = [ ];
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ leveldb ];
  version-path = "";
  softwareName = "Gerbil-LevelDB";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-leveldb";
    rev = "9386da1a0570eb428c9bb1faf9be66694ba5b91a";
    sha256 = "0j49kzvwcbd14nmfvhywwivggvq7qvn8qpl4spklzx4gd89s32my";
  };

  meta = {
    description = "LevelDB bindings for Gerbil";
    homepage = "https://github.com/mighty-gerbils/gerbil-leveldb";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ fare ];
  };

  # "-L${leveldb}/lib"
}
