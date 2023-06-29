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
    # lib = import ./lib { lib = nixpkgs.lib; };

    validSystems = [ "x86_64-linux" "aarch64-linux" ];
    forEachSystem = lib.genAttrs validSystems;

    packages = forEachSystem (system: import ./packages { 
      pkgs = import nixpkgs { inherit system; };
    });
  in{
    inherit packages;

    nixpkgsOverlays = [
      (
        final: prev: {
          # inherit lib;

          unstable = import nixpkgs-unstable {  
            inherit (prev) system;

            config.allowUnfree = true;
          };
          custom = packages.${prev.system};
          # overridden = {};
        }
      )
    ];

    homeManagerModules = import ./homeManagerModules { inherit lib; };

    nixosModules = import ./nixosModules { inherit lib; };

    nixosConfigurations = import ./nixosConfigurations { inherit lib inputs; };
    homeConfigurations = {
      "cole@garuda" = home-manager.lib.homeManagerConfiguration {
        modules = [
          self.homeManagerModules.user-cole-garuda
        ];
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          overlays = self.nixpkgsOverlays;
        };
      };
    };
  };
}