{ lib, fetchFromGitHub, gerbil-support, gerbilPackages, gerbil, ... }:

rec {
  pname = "glow-lang";
  version = "unstable-2021-12-01";
  git-version = "0.3.2-92-g0405139";
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
    rev = "0405139963a54a9539ed40fc48e2495b89ff92f8";
    sha256 = "0w29zhf7853a91lb147148m8gv9645x0fqf79yz7fi4zy9fmn5qa";
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
