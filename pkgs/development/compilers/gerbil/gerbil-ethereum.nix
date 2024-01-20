{
  lib,
  fetchFromGitHub,
  gerbilPackages,
  gerbil-support,
  gerbil,
  ...
}:

rec {
  pname = "gerbil-ethereum";
  version = "unstable-2024-04-27";
  git-version = "0.2-14-gae03da0";
  softwareName = "Gerbil-ethereum";
  gerbil-package = "clan/ethereum";
  version-path = "version";

  gerbilInputs = with gerbilPackages; [
    gerbil-utils
    gerbil-crypto
    gerbil-poo
    gerbil-persist
    gerbil-leveldb
  ];

  pre-src = {
    fun = fetchFromGitHub;
    owner = "mighty-gerbils";
    repo = "gerbil-ethereum";
    rev = "ae03da01c71b7ea6e9c151cabcff778a184db8fe";
    sha256 = "17nwp5cgag925r0xfaav2s00x8l36xmylc3jbf7ssixqwhwrs7z5";
  };

  postInstall = ''
    cp scripts/{croesus.prv,genesis.json,logback.xml,yolo-evm.conf,yolo-kevm.conf,run-ethereum-test-net.ss} $out/gerbil/lib/clan/ethereum/scripts/
    mkdir -p $out/bin
    cat > $out/bin/run-ethereum-test-net <<EOF
    #!/bin/sh
    #|
    ORIG_GERBIL_LOADPATH="\$GERBIL_LOADPATH"
    ORIG_GERBIL_PATH="\$GERBIL_PATH"
    ORIG_GERBIL_HOME="\$GERBIL_HOME"
    unset GERBIL_HOME
    GERBIL_LOADPATH="${gerbil-support.gerbilLoadPath ([ "$out" ] ++ gerbilInputs)}"
    GERBIL_PATH="\$HOME/.cache/gerbil-ethereum/gerbil"
    export GERBIL_PATH GERBIL_LOADPATH GLOW_SOURCE ORIG_GERBIL_PATH ORIG_GERBIL_LOADPATH
    exec ${gerbil}/bin/gxi "\$0" "\$@"
    |#
    (import :clan/ethereum/scripts/run-ethereum-test-net :std/lib/multicall)
    (apply call-entry-point (cdr (command-line)))
    EOF
    chmod a+x $out/bin/run-ethereum-test-net
  '';

  meta = with lib; {
    description = "Gerbil Ethereum: a Scheme alternative to web3.js";
    homepage = "https://github.com/fare/gerbil-ethereum";
    license = licenses.asl20;
    platforms = platforms.unix;
    maintainers = with maintainers; [ fare ];
  };
}
