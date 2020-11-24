{ lib, fetchFromGitHub, ... }:

{
  pname = "gerbil-utils";
  version = "unstable-2023-03-27";
  git-version = "0.2-191-g0dbc888";
  softwareName = "Gerbil-utils";
  gerbil-package = "clan";
  version-path = "version";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "fare";
    repo = "gerbil-utils";
    rev = "0dbc888724411a7a978ff2983b7bea7585f1b63f";
    sha256 = "0b2ffzhhananfs91y6rx6p6bx9qm0xg4r4bmcwl66a8i0rgrqrsl";
  };

  meta = with lib; {
    description = "Gerbil Clan: Community curated Collection of Common Utilities";
    homepage    = "https://github.com/fare/gerbil-utils";
    license     = licenses.lgpl21;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
