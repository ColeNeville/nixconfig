{ lib, inputs, self, ... }:

lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit inputs; };
  modules = [
    /etc/nixos/hardware-configuration.nix
    ./configuration.nix
  ];
  pkgs = self.nixpkgsOverlayed."x86_64-linux";
}