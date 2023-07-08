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

  environment = {
    defaultPackages = with pkgs; [
      custom.defaultEnv
    ];

    systemPackages = with pkgs; [
      cifs-utils # SMB mounts
      htop
      nfs-utils
      uucp # cu command
    ];
  };
}
