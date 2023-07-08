{
  pkgs,
  lib,
  ...
}: {
  nix = {
    settings = {
      experimental-features = lib.mkDefault [
        "flakes"
        "nix-command"
      ];
    };
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
