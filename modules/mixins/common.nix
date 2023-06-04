{ config, pkgs, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    coreutils
    dig
    git
    git-crypt
    gnumake # make command
    util-linux
    uucp # cu command
    wget
  ];

  nix = {
    settings = {
      experimental-features = [
        "flakes"
      ];
    };
  };
}