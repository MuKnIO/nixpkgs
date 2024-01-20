{ lib, fetchFromGitHub, ... }:

{
  pname = "gerbil-utils";
  version = "unstable-2025-09-19";
  git-version = "0.4-43-g65ca12c";
  softwareName = "Gerbil-utils";
  gerbil-package = "clan";
  version-path = "version";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-utils";
    rev = "65ca12cbe2f57a8d3ccdd455d64228b470f26de9";
    sha256 = "1zm6dy1xrh802pphwscns1858y8kjypx5jdsrfcyqa3igyci2nqi";
  };

  meta = {
    description = "Gerbil Clan: Community curated Collection of Common Utilities";
    homepage = "https://github.com/fare/gerbil-utils";
    license = lib.licenses.lgpl21;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ fare ];
  };
}
