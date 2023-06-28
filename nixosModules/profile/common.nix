{ config, pkgs, inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.profile-unbound-dns
  ];

  nix = {
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };

  nixpkgs = {
    overlays = self.nixpkgsOverlays;
  };

  environment.systemPackages = with pkgs; [
    cifs-utils # SMB mounts
    coreutils
    curl
    dig
    git
    git-crypt
    gnumake # make command
    gnupg
    htop
    nfs-utils
    util-linux
    usbutils # lsusb command
    uucp # cu command
    wget
  ];
}