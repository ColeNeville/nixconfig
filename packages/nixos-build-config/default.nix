{pkgs}: (
  pkgs.writeShellScriptBin "nixos-build-config" ''
    #! ${pkgs.stdenv.shell}
    cd /nixconfig

    if [[ -f "flake.nix" ]]; then
      nixos-rebuild switch --impure --flake '.#'
    fi
  ''
)
