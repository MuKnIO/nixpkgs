{ lib, fetchFromGitHub, gerbilPackages, gerbil-support, gerbil, ... }:

rec {
  pname = "gerbil-ethereum";
  version = "unstable-2023-04-06";
  git-version = "0.0-374-gff84378";
  softwareName = "Gerbil-ethereum";
  gerbil-package = "mukn/ethereum";
  version-path = "version";

  gerbilInputs = with gerbilPackages; [ gerbil-utils gerbil-crypto gerbil-poo gerbil-persist ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "fare";
    repo = "gerbil-ethereum";
    rev = "ff84378e88c373db096174fcd8e88d6654a20f79";
    sha256 = "1rsanfhbf27y8ar7pli5h73qg3c6ld43pj7wdjk8g0mk8sj8dd59";
  };

  postInstall = ''
    cp scripts/{croesus.prv,genesis.json,logback.xml,yolo-evm.conf,yolo-kevm.conf,run-ethereum-test-net.ss} $out/gerbil/lib/mukn/ethereum/scripts/
    mkdir -p $out/bin
    cat > $out/bin/run-ethereum-test-net <<EOF
    #!/bin/sh
    #|
    ORIG_GERBIL_LOADPATH="\$GERBIL_LOADPATH"
    ORIG_GERBIL_PATH="\$GERBIL_PATH"
    ORIG_GERBIL_HOME="\$GERBIL_HOME"
    unset GERBIL_HOME
    GERBIL_LOADPATH="${gerbil-support.gerbilLoadPath (["$out"] ++ gerbilInputs)}"
    GERBIL_PATH="\$HOME/.cache/gerbil-ethereum/gerbil"
    export GERBIL_PATH GERBIL_LOADPATH GLOW_SOURCE ORIG_GERBIL_PATH ORIG_GERBIL_LOADPATH
    exec ${gerbil}/bin/gxi "\$0" "\$@"
    |#
    (import :mukn/ethereum/scripts/run-ethereum-test-net :clan/multicall)
    (apply call-entry-point (cdr (command-line)))
    EOF
    chmod a+x $out/bin/run-ethereum-test-net
    '';

  meta = with lib; {
    description = "Gerbil Ethereum: a Scheme alternative to web3.js";
    homepage    = "https://github.com/fare/gerbil-ethereum";
    license     = licenses.asl20;
    platforms   = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
