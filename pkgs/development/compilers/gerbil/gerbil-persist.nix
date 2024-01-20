{
  lib,
  fetchFromGitHub,
  gerbilPackages,
  ...
}:
{
  pname = "gerbil-persist";
  version = "unstable-2024-10-18";
  git-version = "0.2-23-ge048ecd";
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
    rev = "e048ecd1e22d7fba26b43e8370d609318e84e206";
    sha256 = "0sjz1qvgpzqdypbq9z8qb0v658sa97l8vhxznqcz3p4y24cmy4x2";
  };

  meta = with lib; {
    description = "Gerbil Persist: Persistent data and activities";
    homepage = "https://github.com/fare/gerbil-persist";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
