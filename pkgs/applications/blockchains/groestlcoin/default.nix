{ lib
, stdenv
, fetchurl
, fetchFromGitHub
, fetchpatch2
, autoreconfHook
, pkg-config
, installShellFiles
, util-linux
, hexdump
, autoSignDarwinBinariesHook
, wrapQtAppsHook ? null
, boost
, libevent
, miniupnpc
, zeromq
, zlib
, sqlite
, qrencode
, qtbase ? null
, qttools ? null
, python3
, withGui ? false
, withWallet ? true
}:

let
  desktop = fetchurl {
    # de45048 is the last commit when the debian/groestlcoin-qt.desktop file was changed
    url = "https://raw.githubusercontent.com/Groestlcoin/packaging/de4504844e47cf2c7604789650a5db4f3f7a48aa/debian/groestlcoin-qt.desktop";
    sha256 = "0mxwq4jvcip44a796iwz7n1ljkhl3a4p47z7qlsxcfxw3zmm0k0k";
  };
in
stdenv.mkDerivation rec {
  pname = if withGui then "groestlcoin" else "groestlcoind";
  version = "27.0";

  src = fetchFromGitHub {
    owner = "Groestlcoin";
    repo = "groestlcoin";
    rev = "v${version}";
    sha256 = "0f6vi2k5xvjrhiazfjcd4aj246dfcg51xsnqb9wdjl41cg0ckwmf";
  };

  patches = [
    # upnp: add compatibility for miniupnpc 2.2.8
    (fetchpatch2 {
      url = "https://github.com/Groestlcoin/groestlcoin/commit/8acdf66540834b9f9cf28f16d389e8b6a48516d5.patch?full_index=1";
      hash = "sha256-oDvHUvwAEp0LJCf6QBESn38Bu359TcPpLhvuLX3sm6M=";
    })
  ];

  nativeBuildInputs = [ autoreconfHook pkg-config installShellFiles ]
    ++ lib.optionals stdenv.isLinux [ util-linux ]
    ++ lib.optionals stdenv.isDarwin [ hexdump ]
    ++ lib.optionals (stdenv.isDarwin && stdenv.isAarch64) [ autoSignDarwinBinariesHook ]
    ++ lib.optionals withGui [ wrapQtAppsHook ];

  buildInputs = [ boost libevent miniupnpc zeromq zlib ]
    ++ lib.optionals withWallet [ sqlite ]
    ++ lib.optionals withGui [ qrencode qtbase qttools ];

  postInstall = ''
    installShellCompletion --bash contrib/completions/bash/groestlcoin-cli.bash
    installShellCompletion --bash contrib/completions/bash/groestlcoind.bash
    installShellCompletion --bash contrib/completions/bash/groestlcoin-tx.bash

    for file in contrib/completions/fish/groestlcoin-*.fish; do
      installShellCompletion --fish $file
    done
  '' + lib.optionalString withGui ''
    installShellCompletion --fish contrib/completions/fish/groestlcoin-qt.fish

    install -Dm644 ${desktop} $out/share/applications/groestlcoin-qt.desktop
    substituteInPlace $out/share/applications/groestlcoin-qt.desktop --replace "Icon=groestlcoin128" "Icon=groestlcoin"
    install -Dm644 share/pixmaps/groestlcoin256.png $out/share/pixmaps/groestlcoin.png
  '';

  preConfigure = lib.optionalString stdenv.isDarwin ''
    export MACOSX_DEPLOYMENT_TARGET=10.13
  '';

  configureFlags = [
    "--with-boost-libdir=${boost.out}/lib"
    "--disable-bench"
  ] ++ lib.optionals (!withWallet) [
    "--disable-wallet"
  ] ++ lib.optionals withGui [
    "--with-gui=qt5"
    "--with-qt-bindir=${qtbase.dev}/bin:${qttools.dev}/bin"
  ];

  nativeCheckInputs = [ python3 ];

  checkFlags = [ "LC_ALL=en_US.UTF-8" ]
    # QT_PLUGIN_PATH needs to be set when executing QT, which is needed when testing Groestlcoin's GUI.
    # See also https://github.com/NixOS/nixpkgs/issues/24256
    ++ lib.optional withGui "QT_PLUGIN_PATH=${qtbase}/${qtbase.qtPluginPrefix}";

  enableParallelBuilding = true;

  meta = with lib; {
    description = "Peer-to-peer electronic cash system";
    longDescription = ''
      Groestlcoin is a free open source peer-to-peer electronic cash system that is
      completely decentralized, without the need for a central server or trusted
      parties. Users hold the crypto keys to their own money and transact directly
      with each other, with the help of a P2P network to check for double-spending.
    '';
    homepage = "https://groestlcoin.org/";
    downloadPage = "https://github.com/Groestlcoin/groestlcoin/releases/tag/v{version}/";
    maintainers = with maintainers; [ gruve-p ];
    license = licenses.mit;
    platforms = platforms.unix;
  };
}