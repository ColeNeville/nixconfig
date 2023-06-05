{ pkgs, inputs, ... }:

let
  inherit (inputs) self;
in {
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

    self.packages.nix-fetch-config
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