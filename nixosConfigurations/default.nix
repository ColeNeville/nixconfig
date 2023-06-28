{ lib, inputs, ... }:

let
  inherit (inputs) self nixpkgs;

  nixosSystem = { system, modules }: lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs; };
    inherit modules;
    pkgs = self.nixpkgsOverlayed.${system};
  };
in {
  alexander-1 = nixosSystem {
    system = "aarch64-linux";
    modules = [
      "/etc/nixos/hardware-configuration.nix"
      # "./configuration.nix"
    ];
  };
  alexander-2 = nixosSystem {
    system = "aarch64-linux";
    modules = [
      "/etc/nixos/hardware-configuration.nix"
      # self.nixosModules.host-alexander-2
    ];
  };
  alexander-3 = nixosSystem {
    system = "aarch64-linux";
    modules = [
      "/etc/nixos/hardware-configuration.nix"
      # self.nixosModules.host-alexander-3
    ];
  };
  alexander-4 = nixosSystem {
    system = "aarch64-linux";
    modules = [
      "/etc/nixos/hardware-configuration.nix"
      # self.nixosModules.host-alexander-4
    ];
  };
  garuda = import ./garuda {inherit lib inputs self; };
}