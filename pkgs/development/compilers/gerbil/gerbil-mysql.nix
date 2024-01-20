{
  pkgs,
  lib,
  fetchFromGitHub,
  mariadb-connector-c,
  ...
}:

{
  pname = "gerbil-mysql";
  version = "unstable-2025-08-24";
  git-version = "a6d9af1";
  gerbil-package = "clan";
  gerbilInputs = [ ];
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ mariadb-connector-c ];
  version-path = "";
  softwareName = "Gerbil-MySQL";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-mysql";
    rev = "a6d9af11b45666e47f1bf88f9bbc6ba887ae3a63";
    sha256 = "0xami9kid9axnwcr7njizpnm96y3pbk32fyys7srdbrbfpifym0q";
  };

  meta = {
    description = "MySQL bindings for Gerbil";
    homepage = "https://github.com/mighty-gerbils/gerbil-mysql";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ fare ];
  };

  # "-L${mariadb-connector-c}/lib/mariadb"
}
