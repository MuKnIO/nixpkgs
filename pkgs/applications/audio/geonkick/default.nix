{ stdenv, fetchFromGitLab, cmake, pkg-config, redkite, libsndfile, rapidjson
, libjack2, lv2, libX11, cairo }:

stdenv.mkDerivation rec {
  pname = "geonkick";
  version = "2.5.1";

  src = fetchFromGitLab {
    owner = "iurie-sw";
    repo = pname;
    rev = "v${version}";
    sha256 = "14svwrxqw15j6wjy3x8s28yyrafa31bm7d1ns5h6gvpndccwc1kw";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [ redkite libsndfile rapidjson libjack2 lv2 libX11 cairo ];

  # https://github.com/iurie-sw/geonkick/issues/120
  cmakeFlags = [
    "-DGKICK_REDKITE_SDK_PATH=${redkite}"
    "-DCMAKE_INSTALL_LIBDIR=lib"
  ];

  meta = with stdenv.lib; {
    homepage = "https://gitlab.com/iurie-sw/geonkick";
    description = "A free software percussion synthesizer";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = [ maintainers.magnetophon ];
  };
}
