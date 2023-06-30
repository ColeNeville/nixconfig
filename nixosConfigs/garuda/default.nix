{
  nixpkgs,
  self,
  nixos-hardware,
  home-manager,
  ...
}: let
  system = "x86_64-linux";
in nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {};
  modules = [
    /etc/nixos/hardware-configuration.nix

    nixos-hardware.nixosModules.framework-12th-gen-intel

    home-manager.nixosModules.home-manager

    self.nixosModules.common
    self.nixosModules.user-cole

    ./configuration.nix
  ];
  pkgs = import nixpkgs {
    inherit system;

    config.allowUnfree = true;
    overlays = self.nixpkgsOverlays;
  };
}