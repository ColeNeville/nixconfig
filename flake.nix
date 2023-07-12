{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

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
    nixpkgs-master,
    nixos-hardware,
    nixos-generators,
    home-manager,
    agenix,
    ...
  }: (
    {
      lib = {};

      overlays = {
        default = (
          final: prev: {
            custom = self.legacyPackages.${prev.system};
          }
        );

        unstable = (
          final: prev: {
            unstable = import nixpkgs-unstable {
              inherit (prev) system config;
            };
            master = import nixpkgs-master {
              inherit (prev) system config;
            };
          }
        );
      };

      nixosModules = import ./nixosModules inputs;
      homeModules = import ./homeModules inputs;
    }
    // flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;

          config.allowUnfree = true;
          overlays = builtins.attrValues self.overlays;
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

        defaultModules = [
          self.nixosModules.default
          self.nixosModules.user-cole
        ];

        innerInputs = inputs // {inherit pkgs defaultPackages;};
      in {
        inherit pkgs defaultPackages;

        legacyPackages = {
          # Packages to be installed on all systems and shells
          default = pkgs.buildEnv {
            name = "default";
            paths = defaultPackages;
          };

          nixos-build-config = (
            pkgs.writeShellScriptBin "nixos-build-config" ''
              #! ${pkgs.stdenv.shell}
              cd /nixconfig

              if [[ -f "flake.nix" ]]; then
                nixos-rebuild switch --impure --flake '.#'
              fi
            ''
          );

          nixos-fetch-config = (
            pkgs.writeShellScriptBin "nixos-fetch-config" ''
              #! ${pkgs.stdenv.shell}
              mkdir -p /nixconfig
              cd /nixconfig

              if [[ -f "flake.nix" ]]; then
                ${pkgs.git}/bin/git pull
              else
                ${pkgs.git}/bin/git clone https://github.com/ColeNeville/nixconfig.git .
              fi
            ''
          );

          nixosConfigurations = {
            garuda = nixpkgs.lib.nixosSystem {
              inherit system pkgs;

              modules =
                [
                  self.nixosModules.hardware-garuda

                  nixos-hardware.nixosModules.framework-12th-gen-intel

                  self.nixosModules.configuration-garuda

                  home-manager.nixosModules.home-manager
                  self.nixosModules.home-manager
                  self.nixosModules.home-cole-garuda
                ]
                ++ defaultModules;
            };
          };

          nixosImages = {
            bahamut-proxmox = nixos-generators.nixosGenerate {
              inherit system pkgs;

              specialArgs = {inherit inputs;};
              modules =
                [
                  self.nixosModules.configuration-bahamut
                ]
                ++ defaultModules;

              format = "proxmox";
            };

            bahamut-proxmox-lxc = nixos-generators.nixosGenerate {
              inherit system pkgs;

              specialArgs = {inherit inputs;};
              modules =
                [
                  self.nixosModules.configuration-bahamut
                ]
                ++ defaultModules;

              format = "proxmox-lxc";
            };

            bahamut-vm = nixos-generators.nixosGenerate {
              inherit system pkgs;

              specialArgs = {inherit inputs;};
              modules =
                [
                  self.nixosModules.configuration-bahamut
                ]
                ++ defaultModules;

              format = "vm";
            };

            alexander-4-rpi = nixos-generators.nixosGenerate {
              inherit system pkgs;

              specialArgs = {inherit inputs;};
              modules =
                [
                  self.nixosModules.configuration-alexander-4
                ]
                ++ defaultModules;

              format = "sd-aarch64";
            };
          };

          homeConfigurations = {
            "cole@garuda" = home-manager.lib.homeManagerConfiguration {
              inherit pkgs;

              modules = [
                self.homeModules.configuration-cole-garuda
              ];
            };
          };
        };

        formatter = pkgs.alejandra;

        devShells = {
          default = pkgs.mkShell {
            buildInputs =
              (
                with pkgs; [
                  git
                  gnumake
                ]
              )
              ++ defaultPackages;
          };
        };
      }
    )
  );
}
