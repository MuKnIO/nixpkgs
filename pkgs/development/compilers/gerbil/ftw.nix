{ lib, fetchFromGitHub, gerbilPackages, ... }:

{
  pname = "ftw";
  version = "unstable-2022-01-13";
  git-version = "9c54ccc";
  softwareName = "FTW: For The Web!";
  gerbil-package = "drewc/smug";

  gerbilInputs = with gerbilPackages; [ gerbil-utils ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "drewc";
    repo = "ftw";
    rev = "9c54cccdd993344db555014d7fc60893cf2bdb41";
    sha256 = "11xy9nnw5qndzpbilq4lzmzbaza80wnp6nqa8n1m5j065n1i54j8";
  };

  meta = with lib; {
    description = "Simple web handlers for Gerbil Scheme";
    homepage    = "https://github.com/drewc/ftw";
    license     = licenses.mit;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
