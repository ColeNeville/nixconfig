{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    agenix.url = "github:ryantm/agenix";
  };

  outputs = { nixpkgs, nixpkgs-unstable, nixos-hardware, home-manager, agenix, ... }@inputs: {
    nixosConfigurations = {
      garuda = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          agenix.nixosModules.default

          ./nix/hardware/garuda.nix
          nixos-hardware.nixosModules.framework-12th-gen-intel

          ./nix/system/common.nix
          ./nix/system/bluetooth.nix
          ./nix/secret/system/zerotier.nix
          ./nix/system/garuda.nix
        ];
      };

      # bismark = nixpkgs.lib.nixosSystem {
      #   system = "x86_64-linux";
      #   modules = [
      #     /etc/nixos/hardware-configuration.nix

      #     ./modules/nixpkgs/systems/all
      #     ./modules/nixpkgs/system/bismark
      #   ];
      # };
    };

    homeConfigurations = {
      "cole@garuda" = home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux";
        homeDirectory = "/home/cole";
        username = "cole";
        modules = [
          # ./nix/home/common.nix
          # ./nix/home/python.nix
          ./nix/home/garuda.nix
        ];

        pkgs = import nixpkgs-unstable {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };
      };
    };
  };
}