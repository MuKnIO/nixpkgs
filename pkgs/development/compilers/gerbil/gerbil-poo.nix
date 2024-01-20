{
  lib,
  fetchFromGitHub,
  gerbilPackages,
  ...
}:

{
  pname = "gerbil-poo";
  version = "unstable-2024-07-31";
  git-version = "0.2-17-g4d75926";
  softwareName = "Gerbil-POO";
  gerbil-package = "clan/poo";
  version-path = "version";

  gerbilInputs = with gerbilPackages; [ gerbil-utils ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-poo";
    rev = "4d75926d14046eb0433d087a44c8e453e3ea2144";
    sha256 = "07k8z15k14pxlrjbnsgx6l6a0rrgdhlaniyb4rm9h27b6s1yayjn";
  };

  meta = with lib; {
    description = "Gerbil POO: Prototype Object Orientation for Gerbil Scheme";
    homepage = "https://github.com/fare/gerbil-poo";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
