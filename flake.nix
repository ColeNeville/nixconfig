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

  outputs = inputs@{
    self,
    flake-utils,
    nixpkgs,
    nixpkgs-unstable,
    ...
  }: let
    lib = import ./lib;

    validSystems = [ "x86_64-linux" "aarch64-linux" ];
    forEachSystem = nixpkgs.lib.genAttrs validSystems;
  in {
    inherit lib;

    nixpkgsOverlays = [
      (
        final: prev: {
          unstable = import nixpkgs-unstable {  
            inherit (prev) system;

            config.allowUnfree = true;
          };
          custom = self.packages.${prev.system};
        }
      )
    ];

    nixosModules = import ./nixosModules;
    nixosConfigurations = import ./nixosConfigs inputs;
    homeConfigurations = import ./homeConfigs inputs;
  } // flake-utils.lib.eachDefaultSystem (system: {
    packages = import ./packages { 
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = self.nixpkgsOverlays;
      };
    };
  });
}