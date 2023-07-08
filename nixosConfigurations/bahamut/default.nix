{self, nixos-generators}: let
  system = "x86_64-linux";
  pkgs = self.pkgs.${system};
in (
  pkgs.lib.nixosSystem {
    inherit system pkgs;

    specialArgs = {};
    modules = [
      # self.nixosModules.virtualization-qemu-vm
      # self.nixosModules.profile-qemu-guest
      nixos-generators.nixosModules.all-formats

      self.nixosModules.common
      self.nixosModules.openssh
      self.nixosModules.user-cole

      ./configuration.nix
    ];
  }
)
