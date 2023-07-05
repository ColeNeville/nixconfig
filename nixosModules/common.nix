{
  pkgs,
  lib,
  defaultPackages,
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
    inherit defaultPackages;

    systemPackages = with pkgs; [
      cifs-utils # SMB mounts
      htop
      nfs-utils
      uucp # cu command
    ];
  };
}
