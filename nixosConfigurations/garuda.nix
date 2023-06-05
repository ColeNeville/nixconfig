{ lib, inputs, ... }:

let
  inherit (inputs) self nixpkgs;
in lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = {
    inherit inputs;
  };
  modules = [
    self.nixosModules.hosts.garuda
  ];
  pkgs = import nixpkgs {
    system = "x86_64-linux";

    config.allowUnfree = true;
  };
}