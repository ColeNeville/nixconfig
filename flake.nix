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
    nixosModules = import ./nixosModules { lib = nixpkgs.lib; };
    homeManagerModules = import ./homeManagerModules { lib = nixpkgs.lib; };
    nixosConfigurations = import ./nixosConfigurations { inherit inputs; lib = nixpkgs.lib; };
  };
}