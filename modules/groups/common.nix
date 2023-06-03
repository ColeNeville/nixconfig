{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = with self.nixosModules; [
    groups.docker
    groups.networkmanager
    groups.wireshark
  ]
}