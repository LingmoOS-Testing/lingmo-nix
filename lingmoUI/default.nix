{ libsForQt5, stdenv, fetchgit, cmake, ninja, extra-cmake-modules, git }:

pkgs.stdenv.mkDerivation rec {
  pname = "lingmoUI";
  version = "2.0.0";

  src = fetchgit {
    url = "https://github.com/LingmoOS/LingmoUI.git";
    rev = "refs/tags/v${version}";
    sha256 = "sha256-0zhbazxs905rhg09j6zfbh56za8c0hk7a9asjpwcv2wnzrnzvrqb";
  };

  buildInputs = [
    libsForQt5.qt5.qtbase
    libsForQt5.qt5.qtdeclarative
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtx11extras
    libsForQt5.kwindowsystem
  ];

  nativeBuildInputs = [ cmake ninja extra-cmake-modules git ];

  cmakeFlags = [
    "-DCMAKE_INSTALL_PREFIX=$out"
  ];

  buildPhase = ''
    cmake -GNinja . $cmakeFlags
    ninja
  '';

  installPhase = ''
    DESTDIR=$out ninja install
  '';

  meta = {
    description = "Lingmo OS GUI library";
    homepage = "https://github.com/LingmoOS/LingmoUI";
    license = stdenv.lib.licenses.gpl3;
    platforms = [ "x86_64-linux" ];
    maintainers = with stdenv.lib.maintainers; [ LingmoOS ];
  };
}
