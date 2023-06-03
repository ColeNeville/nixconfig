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
    } @ inputs: {
      nixosModules = import ./modules { lib = nixpkgs.lib; };

      homeManagerModules = import ./modules/home { lib = nixpkgs.lib; };

      nixosConfigurations = {
        garuda = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./systems/garuda/configuration.nix
          ];
          pkgs = import nixpkgs {
            system = "x86_64-linux";

            config.allowUnfree = true;
          };
        };
      };
    };
}