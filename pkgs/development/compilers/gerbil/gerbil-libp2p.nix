{ lib, fetchFromGitHub, ... }:

{
  pname = "gerbil-libp2p";
  version = "unstable-2021-12-01";
  git-version = "f0f86c3";
  softwareName = "Gerbil-libp2p";
  gerbil-package = "vyzo";

  buildInputs = []; # Note: at *runtime*, this depends on go-libp2p-daemon running

  pre-src = {
    fun = fetchFromGitHub;
    owner = "vyzo";
    repo = "gerbil-libp2p";
    rev = "f0f86c37256b540eb51f21e518979fc786f1fd5b";
    sha256 = "1qqak3imsgbc2hbi7ibldfxpdvl0i6k37r1726lxr35kmkqj452q";
  };

  meta = with lib; {
    description = "Gerbil libp2p: use libp2p from Gerbil";
    homepage    = "https://github.com/vyzo/gerbil-libp2p";
    license     = licenses.mit;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
