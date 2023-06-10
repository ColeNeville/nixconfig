{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

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
    homeModules = import ./homeModules { inherit lib; };
    nixosModules = import ./nixosModules { inherit lib; };

    nixosConfigurations = {
      garuda = lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          self.nixosModules.hosts.garuda
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