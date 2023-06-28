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
    nixpkgsOverlays = [
      (
        final: prev: {
          unstable = import nixpkgs-unstable {  
            inherit (prev) system;
            config.allowUnfree = true;
          };
          custom = self.packages.${prev.system};
          overridden = {};
        }
      )
    ];

    nixpkgsOverlayed = forEachSystem (
      system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = self.nixpkgsOverlays;
      }
    );
    
    homeManagerModules = import ./homeManagerModules { inherit lib; };
    nixosModules = import ./nixosModules { inherit lib; };
    packages = forEachSystem (system: import ./packages { inherit system inputs; });
    nixosConfigurations = import ./nixosConfigurations { inherit lib inputs; };
  };
}