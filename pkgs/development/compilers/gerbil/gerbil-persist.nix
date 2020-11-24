{ lib, fetchFromGitHub, gerbilPackages, ... }:
{
  pname = "gerbil-persist";
  version = "unstable-2021-11-30";
  git-version = "0.0-20-ge9b7fe9";
  softwareName = "Gerbil-persist";
  gerbil-package = "clan/persist";
  version-path = "version";

  gerbilInputs = with gerbilPackages; [ gerbil-utils gerbil-crypto gerbil-poo ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "fare";
    repo = "gerbil-persist";
    rev = "e9b7fe9afddbee64017f132ed38f59bb01f9d3f6";
    sha256 = "0sd1ayj1162f4d5xarfh6jspv2qz0fr60lf9wih3vvr01sirj766";
  };

  meta = with lib; {
    description = "Gerbil Persist: Persistent data and activities";
    homepage    = "https://github.com/fare/gerbil-persist";
    license     = licenses.asl20;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
