{ lib, fetchFromGitHub, gerbil-support, gerbilPackages, gerbil, ... }:

rec {
  pname = "glow-lang";
  version = "unstable-2022-07-11";
  git-version = "0.3.2-218-gcfeee7f9";
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
    rev = "cfeee7f9487479bd06395bc0a2749c7780e2b279";
    sha256 = "0vb2rqg48c9r33y6j11kmkw7psz86rd0x69g96niyr7p0fhx8hxi";
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
