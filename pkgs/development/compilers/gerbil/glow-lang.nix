{ lib, fetchFromGitHub, gerbil-support, gerbilPackages, gerbil, ... }:

rec {
  pname = "glow-lang";
  version = "unstable-2023-03-27";
  git-version = "0.3.2-220-g5d9e9ef4";
  softwareName = "Glow";
  gerbil-package = "mukn/glow";
  version-path = "version";

  gerbilInputs = with gerbilPackages;
    [ gerbil-utils gerbil-crypto gerbil-poo gerbil-persist gerbil-ethereum
      gerbil-libp2p smug-gerbil ftw ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "Glow-Lang";
    repo = "glow";
    rev = "5d9e9ef4d3f1c211dbfdc0dd5ace4b43c459c37e";
    sha256 = "1n5i05qckpkrmavk5hf4f144yr7mjzc81rq0nxpn9bihn9ya4q36";
    };

  postPatch = ''
    substituteInPlace "runtime/glow-path.ss" --replace \
      '(def glow-install-path (source-path "dapps"))' \
      '(def glow-install-path "$out")'
  '';

  postInstall = ''
    mkdir -p $out/bin $out/gerbil/lib/mukn/glow $out/share/glow/dapps
    cp main.ss $out/gerbil/lib/mukn/glow/
    cp dapps/{buy_sig,coin_flip,rps_simple}.glow $out/share/glow/dapps/
    cat > $out/bin/glow <<EOF
    #!/bin/sh
    ORIG_GERBIL_LOADPATH="\$GERBIL_LOADPATH"
    ORIG_GERBIL_PATH="\$GERBIL_PATH"
    ORIG_GERBIL_HOME="\$GERBIL_HOME"
    unset GERBIL_HOME
    GERBIL_LOADPATH="${gerbil-support.gerbilLoadPath (["$out"] ++ gerbilInputs)}"
    GLOW_SOURCE="\''${GLOW_SOURCE:-$out/share/glow}"
    GERBIL_PATH="\$HOME/.cache/glow/gerbil"
    export GERBIL_PATH GERBIL_LOADPATH GLOW_SOURCE ORIG_GERBIL_PATH ORIG_GERBIL_LOADPATH ORIG_GERBIL_HOME
    exec ${gerbil}/bin/gxi $out/gerbil/lib/mukn/glow/main.ss "\$@"
    EOF
    chmod a+x $out/bin/glow
    '';

  meta = with lib; {
    description = "Glow: language for safe Decentralized Applications (DApps)";
    homepage    = "https://glow-lang.org";
    license     = licenses.asl20;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
