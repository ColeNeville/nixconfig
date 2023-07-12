{
  pkgs,
  lib,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;

      experimental-features = lib.mkDefault [
        "flakes"
        "nix-command"
      ];
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      min-free = ${toString (100 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
  };

  system.autoUpgrade = {
    enable = true;
    flake = "github:coleneville/nixconfig";
    persistent = true;

    dates = "daily";
    randomizedDelaySec = "1h";

    allowReboot = true;
    rebootWindow = {
      lower = "01:00";
      upper = "05:00";
    };
  };

  environment = {
    defaultPackages = with pkgs; [
      custom.default
    ];

    systemPackages = with pkgs; [
      cifs-utils # SMB mounts
      htop
      nfs-utils
      uucp # cu command
    ];
  };
}
