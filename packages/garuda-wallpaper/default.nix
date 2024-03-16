pkgs: pkgs.stdenv.mkDerivation {
  name = "gaurda-wallpaper";
  version = "1.0";

  src = ./.;

  installPhase = ''
    mkdir -p $out/share
    cp dalle1.webp $out/share
    cp dalle2.webp $out/share
  '';
}
