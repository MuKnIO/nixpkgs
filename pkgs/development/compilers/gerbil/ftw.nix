{ lib, fetchFromGitHub, gerbilPackages, ... }:

{
  pname = "ftw";
  version = "unstable-2021-11-23";
  git-version = "db34a16";
  softwareName = "FTW: For The Web!";
  gerbil-package = "drewc/smug";

  gerbilInputs = with gerbilPackages; [ gerbil-utils ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "fare-patches";
    repo = "ftw";
    rev = "db34a1638356698123aafed91b132e6c067635fc";
    sha256 = "1wnwmsk9hbkgcbhhbvb2fy119gd66jaww60rz269pjpzmxli165n";
  };

  meta = with lib; {
    description = "Simple web handlers for Gerbil Scheme";
    homepage    = "https://github.com/drewc/ftw";
    license     = licenses.mit;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
