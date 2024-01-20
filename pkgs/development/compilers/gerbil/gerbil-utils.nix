{ lib, fetchFromGitHub, ... }:

{
  pname = "gerbil-utils";
  version = "unstable-2024-07-30";
  git-version = "0.4-37-g4163c58";
  softwareName = "Gerbil-utils";
  gerbil-package = "clan";
  version-path = "version";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-utils";
    rev = "4163c58663b7a85d6512723892e4e3a568df9def";
    sha256 = "0n38jj0gjr1pxjfnilszm03lahpw65virc7layd5kn3k2ffji41x";
  };

  meta = with lib; {
    description = "Gerbil Clan: Community curated Collection of Common Utilities";
    homepage = "https://github.com/fare/gerbil-utils";
    license = licenses.lgpl21;
    platforms = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
