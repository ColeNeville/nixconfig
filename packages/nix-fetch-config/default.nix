{ pkgs, ... }:

pkgs.writeShellScriptBin "nix-fetch-config" ''
  #!${pkgs.stdenv.shell}
  cd /etc/nixos

  if [[ -f "flake.nix" ]]; then
    ${pkgs.git}/bin/git pull
  else
    rm -r *
    ${pkgs.git}/bin/git clone https://github.com/ColeNeville/nixconfig.git .
  fi
''