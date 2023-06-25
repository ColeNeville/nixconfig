{ pkgs, hostName, inputs, ... }:

let
  inherit (inputs) nixos-hardware;
in {
  imports = [
    nixos-hardware.nixosModules.raspberry-pi-4

    self.nixosModules.mixin-ssh-server

    self.nixosModules.user-cole
  ];

  networking = {
    hostName = hostName;
  };
}