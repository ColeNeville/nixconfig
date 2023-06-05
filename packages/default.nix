{ inputs, ... }:

let
  inherit (inputs) nixpkgs self;
  pkgs = import nixpkgs { system = nixpkgs.system; };
in {
  nix-fetch-config = pkgs.writeShellScriptBin "nix-fetch-config" ''
    #!${pkgs.stdenv.shell}
    cd /etc/nixos

    if [[ -f "flake.nix" ]]; then
      ${pkgs.git}/bin/git pull
    else
      ${pkgs.git}/bin/git clone https://github.com/ColeNeville/nixconfig.git .
    fi
  '';
}