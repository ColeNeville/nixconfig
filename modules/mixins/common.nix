{ config, pkgs, lib, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    coreutils
    dig
    git
    git-crypt
    util-linux
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