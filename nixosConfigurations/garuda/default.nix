{
  nixpkgs,
  self,
  nixos-hardware,
  home-manager,
  ...
}: let
  system = "x86_64-linux";
  pkgs = self.pkgs.${system};
in
  nixpkgs.lib.nixosSystem {
    inherit system pkgs;

    specialArgs = {};
    modules = [
      ./hardware-configuration.nix

      nixos-hardware.nixosModules.framework-12th-gen-intel

      home-manager.nixosModules.home-manager

      self.nixosModules.common
      self.nixosModules.user-cole

      ./configuration.nix
    ];
  }
