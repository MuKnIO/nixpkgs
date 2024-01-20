{
  pkgs,
  lib,
  fetchFromGitHub,
  libxml2,
  ...
}:

{
  pname = "gerbil-libxml";
  version = "unstable-2025-08-16";
  git-version = "c1d9b0a";
  gerbil-package = "clan";
  gerbilInputs = [ ];
  nativeBuildInputs = [ pkgs.pkg-config ];
  buildInputs = [ libxml2 ];
  version-path = "";
  softwareName = "Gerbil-LibXML";

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-libxml";
    rev = "c1d9b0a026cd98234ab15cc4aec05c78781817cc";
    sha256 = "05lkf938rk8nlaf5a1blarljhds09afrxsvb4p97hlv3hfqzfp0s";
  };

  meta = {
    description = "libxml bindings for Gerbil";
    homepage = "https://github.com/mighty-gerbils/gerbil-libxml";
    license = lib.licenses.asl20;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ fare ];
  };
}
