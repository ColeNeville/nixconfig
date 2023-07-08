{
  self,
  nixpkgs,
  nixos-generators,
  ...
}: let
  system = "x86_64-linux";
  pkgs = self.pkgs.${system};
in (
  nixpkgs.lib.nixosSystem {
    inherit system pkgs;

    specialArgs = {inherit nixos-generators;};
    modules = [
      # self.nixosModules.virtualization-qemu-vm
      # self.nixosModules.profile-qemu-guest

      self.nixosModules.common
      self.nixosModules.openssh
      self.nixosModules.user-cole

      ./configuration.nix
    ];
  }
)
