{ lib, inputs }:

let
  inherit (inputs) nixpkgs self nixos-hardware home-manager;
  system = "x86_64-linux";
in lib.nixosSystem {
  inherit system;

  specialArgs = { inherit self home-manager; };
  modules = [
    /etc/nixos/hardware-configuration.nix

    nixos-hardware.nixosModules.framework-12th-gen-intel

    self.nixosModules.profile-common
    self.nixosModules.user-cole

    ./configuration.nix
  ];
  pkgs = import nixpkgs {
    inherit system;

    config.allowUnfree = true;
    overlays = self.nixpkgsOverlays;
  };
}