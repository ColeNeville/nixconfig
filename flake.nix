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

          ./nix/system/shared/common.nix
          ./nix/system/shared/bluetooth.nix
          ./nix/system/shared/docker.nix
          
          ./nix/system/garuda/default.nix
        
          ./nix/secret/system/shared/zerotier.nix

          {
            system = {
              stateVersion = "22.11";
            };
          }
        ];
      };
    };

    homeConfigurations = {
      "cole@garuda" = home-manager.lib.homeManagerConfiguration {
        modules = [
          ./nix/home/shared/common.nix

          ./nix/home/garuda/cole/default.nix
          ./nix/home/garuda/cole/brave.nix
          ./nix/home/garuda/cole/alacritty.nix

          {
            home = {
              username = "cole";
              homeDirectory = "/home/cole";

              stateVersion = "22.11";
            };
          }
        ];

        pkgs = import nixpkgs-unstable {
          system = "x86_64-linux";

          config = {
            allowUnfree = true;
          };
        };
      };
    };
  };
}