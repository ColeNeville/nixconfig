{pkgs}: (
  pkgs.writeShellScriptBin "nixos-fetch-config" ''
    #! ${pkgs.stdenv.shell}
    mkdir -p /nixconfig
    cd /nixconfig

    if [[ -f "flake.nix" ]]; then
      ${pkgs.git}/bin/git pull
    else
      ${pkgs.git}/bin/git clone https://github.com/ColeNeville/nixconfig.git .
    fi
  ''
)
