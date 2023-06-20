{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.05";

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    agenix.url = "github:ryantm/agenix";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    nixos-hardware,
    home-manager,
    agenix,
    ...
  } @ inputs: let
    inherit (nixpkgs) lib;

    validSystems = [ "x86_64-linux" "aarch64-linux" ];
    forEachSystem = nixpkgs.lib.genAttrs validSystems;
  in{
    homeManagerModules = import ./homeManagerModules { inherit lib; };
    nixosModules = import ./nixosModules { inherit lib; };

    nixosConfigurations = {
      alexander-1 = lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          self.nixosModules.host-alexander-1
        ];
        pkgs = import nixpkgs {
          system = "aarch64-linux";

          config.allowUnfree = true;
        };
      };

      alexander-2 = lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          self.nixosModules.host-alexander-2
        ];
        pkgs = import nixpkgs {
          system = "aarch64-linux";

          config.allowUnfree = true;
        };
      };

      alexander-3 = lib.nixosSystem {
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
        };
      };

      alexander-4 = lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          self.nixosModules.host-alexander-4
        ];
        pkgs = import nixpkgs {
          system = "aarch64-linux";

          config.allowUnfree = true;
        };
      };

      garuda = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          self.nixosModules.host-garuda
        ];
        pkgs = import nixpkgs {
          system = "x86_64-linux";

          config.allowUnfree = true;
        };
      };
    };

    packages = forEachSystem (system: import ./packages { inherit system inputs; });
  };
}