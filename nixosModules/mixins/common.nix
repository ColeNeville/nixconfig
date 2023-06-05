{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cifs-utils # SMB mounts
    coreutils
    curl
    dig
    git
    git-crypt
    gnumake # make command
    htop
    nfs-utils
    util-linux
    uucp # cu command
    wget
  ];

  nix = {
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };
}