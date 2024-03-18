pkgs: pkgs.stdenv.mkDerivation {
  name = "qtile-config";
  version = "1.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out/share/qtile
    cp config.py $out/share
  '';
}
