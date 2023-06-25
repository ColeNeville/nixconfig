{ lib, self, nixpkgs, inputs, ... }:

lib.nixosSystem {
  system = "aarch64-linux";
  specialArgs = {
    inherit inputs;
  };
  modules = [
    self.nixosModules.host-alexander-3
  ];
  pkgs = import nixpkgs {
    system = "aarch64-linux";
    config.allowUnfree = true;
    overlays = self.nixpkgsOverlays;
  };
}