{ lib, fetchFromGitHub, gerbilPackages, ... }:

{
  pname = "gerbil-poo";
  version = "unstable-2023-03-28";
  git-version = "0.0-105-g6c90167";
  softwareName = "Gerbil-POO";
  gerbil-package = "clan/poo";
  version-path = "version";

  gerbilInputs = with gerbilPackages; [ gerbil-utils ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "fare";
    repo = "gerbil-poo";
    rev = "6c901674dbab8a2b24f7ca527129ae3fd4009869";
    sha256 = "1ylg5zqb0iirkb7yy9a5cfzpdgbvfavzm9qvmrpb76ydxg7iyca0";
  };

  meta = with lib; {
    description = "Gerbil POO: Prototype Object Orientation for Gerbil Scheme";
    homepage    = "https://github.com/fare/gerbil-poo";
    license     = licenses.asl20;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
