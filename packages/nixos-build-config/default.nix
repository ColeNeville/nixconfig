{ pkgs, ... }:

pkgs.writeShellScriptBin "nixos-build-config" ''
  #!${pkgs.stdenv.shell}
  cd /etc/nixos

  if [[ -f "flake.nix" ]]; then
    nixos-rebuild switch --flake '.#'
  fi
''