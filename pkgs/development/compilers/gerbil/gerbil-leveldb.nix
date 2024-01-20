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

  meta = with lib; {
    description = "LevelDB bindings for Gerbil";
    homepage = "https://github.com/mighty-gerbils/gerbil-leveldb";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };

  # "-L${leveldb}/lib"
}
