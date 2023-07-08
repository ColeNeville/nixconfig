{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.05";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    agenix.url = "github:ryantm/agenix";
    flake-utils.url = "github:numtide/flake-utils";

    nixos-generators.url = "github:nix-community/nixos-generators/1.7.0";
  };

  outputs = inputs @ {
    self,
    flake-utils,
    nixpkgs,
    nixpkgs-unstable,
    ...
  }: (
    {
      overlays = {
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

      nixosModules = import ./nixosModules inputs;
      nixosConfigurations = import ./nixosConfigurations inputs;
      homeConfigurations = import ./homeConfigurations inputs;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;

          config.allowUnfree = true;
          overlays = [
            self.overlays.unstable
            self.overlays.custom
          ];
        };

        defaultPackages = with pkgs; [
          coreutils
          curl
          dig
          git
          git-crypt
          gnumake # make command
          gnupg
          nano
          util-linux
          usbutils # lsusb command
          wget
        ];

        innerInputs = inputs // {inherit pkgs defaultPackages;};
      in {
        inherit pkgs defaultPackages;

        packages = import ./packages innerInputs;
        devShells = import ./devShells.nix innerInputs;
        formatter = pkgs.alejandra;
      }
    )
  );
}
