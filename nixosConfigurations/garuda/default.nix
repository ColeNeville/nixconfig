{ lib, self, nixpkgs, inputs, ... }: 

lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {
    inherit inputs;
  };
  modules = [
    "/etc/nixos/hardware-configuration.nix"
    self.nixosModules.host-garuda
  ];
  pkgs = import nixpkgs {
    system = "x86_64-linux";
    config.allowUnfree = true;
    overlays = self.nixpkgsOverlays;
  };
}