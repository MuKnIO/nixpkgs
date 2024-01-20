{
  lib,
  fetchFromGitHub,
  gerbilPackages,
  ...
}:
{
  pname = "gerbil-persist";
  version = "unstable-2025-10-19";
  git-version = "0.2-34-gb0d37cb";
  softwareName = "Gerbil-persist";
  gerbil-package = "clan/persist";
  version-path = "version";

  gerbilInputs = with gerbilPackages; [
    gerbil-utils
    gerbil-crypto
    gerbil-poo
    gerbil-leveldb
  ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-persist";
    rev = "b0d37cb807fe609c86f6154502e214d6144e8bea";
    sha256 = "1ssdm8zfd097s46knsgffrhkcd0c8sbzyc50wh43xz3afj40bygp";
  };

  meta = {
    description = "Gerbil Persist: Persistent data and activities";
    homepage = "https://github.com/fare/gerbil-persist";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ fare ];
  };
}
