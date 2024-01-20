{
  lib,
  fetchFromGitHub,
  gerbilPackages,
  ...
}:

{
  pname = "gerbil-poo";
  version = "unstable-2025-09-19";
  git-version = "0.2-24-g1c32256";
  softwareName = "Gerbil-POO";
  gerbil-package = "clan/poo";
  version-path = "version";

  gerbilInputs = with gerbilPackages; [ gerbil-utils ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-poo";
    rev = "1c3225637525400341a09e958296962c10184ead";
    sha256 = "1777gcif2x5cah271c9z7n1c7s4x0mb9gwcc55j9wnz1jqc4af3s";
  };

  meta = {
    description = "Gerbil POO: Prototype Object Orientation for Gerbil Scheme";
    homepage = "https://github.com/fare/gerbil-poo";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ fare ];
  };
}
