{ lib, fetchFromGitHub, gerbilPackages, ... }:

{
  pname = "gerbil-poo";
  version = "unstable-2021-11-30";
  git-version = "0.0-98-g7fa3ea0";
  softwareName = "Gerbil-POO";
  gerbil-package = "clan/poo";
  version-path = "version";

  gerbilInputs = with gerbilPackages; [ gerbil-utils ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "fare";
    repo = "gerbil-poo";
    rev = "7fa3ea0d03c8758df9881b68cf2a136b0bf035ac";
    sha256 = "0j2wpv4pn6fhyi626s0zgi2vf7mi3rhls62fcz0i8kkr34pvkcgi";
  };

  meta = with lib; {
    description = "Gerbil POO: Prototype Object Orientation for Gerbil Scheme";
    homepage    = "https://github.com/fare/gerbil-poo";
    license     = licenses.asl20;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
