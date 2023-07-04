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
  }: let
    lib = import ./lib;

    validSystems = ["x86_64-linux" "aarch64-linux"];
    forEachSystem = nixpkgs.lib.genAttrs validSystems;
  in
    {
      inherit lib;

      nixpkgsOverlays = {
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
      nixosConfigurations = import ./nixosConfigs inputs;
      homeConfigurations = import ./homeConfigs inputs;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;

          config.allowUnfree = true;
          overlays = [
            self.nixpkgsOverlays.unstable
            self.nixpkgsOverlays.custom
          ];
        };
      in {
        inherit pkgs;

        packages = import ./packages {inherit pkgs;};
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              git
              gnumake
              home-manager
            ];
          };
        };
        formatter = pkgs.alejandra;
      }
    )
}
