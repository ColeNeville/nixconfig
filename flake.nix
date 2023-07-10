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
    nixos-hardware,
    nixos-generators,
    ...
  }: (
    {
      defaultModules = {
        baseModule,
      }: [
        self.nixosModules.common
        self.nixosModules.user-cole

        self.nixosModules.${baseModule}

        nixos-generators.nixosModules.all-formats
      ];

      lib = {
        nixosSystem = {
          system,
          name,
          ...
        }: let
          pkgs = self.pkgs.${system};
          baseModule = "configuration-${name}";
        in (
          nixpkgs.lib.nixosSystem {
            inherit system pkgs;

            modules = self.defaultModules {
              inherit baseModule;
            };
          }
        );
      };

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

        formatter = pkgs.alejandra;

        packages = {
          defaultEnv = pkgs.buildEnv {
            name = "default";
            paths = with pkgs; [
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
              which
            ];
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
              inherit pkgs;

              system = pkgs.system;
              modules = [
                nixos-hardware.nixosModules.framework-12th-gen-intel

                self.nixosModules.hardware-garuda
                self.nixosModules.configuration-garuda
              ];
            };
          };

          nixosImages = {
            bahamut-proxmox = nixos-generators.nixosGenerate {
              inherit pkgs;

              system = pkgs.system;
              modules = [
                self.nixosModules.configuration-bahamut
              ];

              format = "proxmox";
            };

            bahamut-vm = nixos-generators.nixosGenerate {
              inherit pkgs;

              system = pkgs.system;
              modules = [
                self.nixosModules.configuration-bahamut
              ];

              format = "vm";
            };
          };
        };

        devShells = import ./devShells.nix innerInputs;
      }
    )
  );
}
