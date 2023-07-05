{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    agenix.url = "github:ryantm/agenix";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs @ {
    self,
    flake-utils,
    nixpkgs,
    nixpkgs-unstable,
    ...
  }: (
    {
      overlays = {
        unstable = (
          final: prev: {
            unstable = import nixpkgs-unstable {
              inherit (prev) system config;
            };
          }
        );

        custom = (
          final: prev: {
            custom = self.packages.${prev.system};
          }
        );
      };

      nixosModules = import ./nixosModules;
      nixosConfigurations = import ./nixosConfigurations inputs;
      homeConfigurations = import ./homeConfigurations inputs;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;

          config.allowUnfree = true;
          overlays = [
            self.overlays.unstable
            self.overlays.custom
          ];
        };
      in {
        inherit pkgs;

        packages = import ./packages {inherit pkgs;};
        devShells = import ./devShells {inherit pkgs;};
        formatter = pkgs.alejandra;
      }
    )
  );
}
