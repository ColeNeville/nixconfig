{
  nixpkgs,
  self,
  nixos-hardware,
  ...
}: let
  system = "aarch64-linux";
  pkgs = self.pkgs.${system};
in
  nixpkgs.lib.nixosSystem {
    inherit system pkgs;

    specialArgs = {};
    modules = [
      "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"

      nixos-hardware.nixosModules.raspberry-pi-4

      self.nixosModules.common
      self.nixosModules.user-cole

      ./configuration.nix
    ];
  }
