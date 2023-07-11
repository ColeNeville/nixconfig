{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:nixos/nixos-hardware/master";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    flake-utils,
    nixpkgs,
    nixpkgs-unstable,
    ...
  }: (
    {
      lib = {};

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
      homeModules = import ./homeModules inputs;
      # homeConfigurations = import ./homeConfigurations inputs;
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

        packages = import ./packages inputs { inherit pkgs defaultPackages;};

        formatter = pkgs.alejandra;

        devShells = {
          default = pkgs.mkShell {
            buildInputs =
              (with pkgs; [
                git
                gnumake
                home-manager
              ])
              ++ defaultPackages;
          };

          nixos = pkgs.mkShell {
            buildInputs =
              (with pkgs; [
                git
                gnumake
                home-manager
              ])
              ++ defaultPackages;
          };
        };
      }
    )
  );
}
