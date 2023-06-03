{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

    nixos-hardware.url = "github:nixos/nixos-hardware/master";

    agenix.url = "github:ryantm/agenix";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixos-hardware,
      home-manager,
      agenix,
      ...
    } @ inputs: {
      nixosModules = import ./modules { lib = nixpkgs.lib; };
      nixosConfigurations = {
        garuda = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            # agenix.nixosModules.default

            # ./hardware/garuda.nix
            # nixos-hardware.nixosModules.framework-12th-gen-intel

            # ./system/shared/common.nix
            # ./system/shared/bluetooth.nix
            # ./system/shared/docker.nix
            
            # ./system/garuda/default.nix
            # ./system/garuda/applications.nix
            # ./system/garuda/packages/unstable.nix

            # # ./nix/secret/system/shared/zerotier.nix

            ./nix/hosts/garuda/configuration.nix

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

          pkgs = import nixpkgs {
            system = "x86_64-linux";

            config = {
              allowUnfree = true;
            };
          };
        };
      };
    };
}