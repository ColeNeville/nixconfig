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
      url = "github:ryantm/agenix/db5637d10f797bb251b94ef9040b237f4702cde3";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators/9191c85aab6b1a7ad395c13d340f2aa0e3ddf552";
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
    let
      defaultModules = [
        home-manager.nixosModules.home-manager
        agenix.nixosModules.default
        self.nixosModules.default
        self.nixosModules.telegraf
      ];

      raspberryPiDefaultModules =
        [
          "${nixpkgs}/nixos/modules/profiles/minimal.nix"
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"
          nixos-hardware.nixosModules.raspberry-pi-4
        ]
        ++ defaultModules;
    in
      {
        lib = {};

        overlays = {
          default = (
            final: prev: {
              custom = self.packages.${prev.system};
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
              # Fixes an issue with building the kernel for rpi: https://github.com/NixOS/nixpkgs/issues/126755#issuecomment-869149243
              makeModulesClosure = x:
                prev.makeModulesClosure (x // {allowMissing = true;});
            }
          );
        };

        nixosModules = import ./nixosModules inputs;

        nixosConfigurations = {
          garuda = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            pkgs = self.pkgs.x86_64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.hardware-garuda
                nixos-hardware.nixosModules.framework-12th-gen-intel
                self.nixosModules.configuration-garuda
              ]
              ++ defaultModules;
          };

          alexander-1 = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-1
              ]
              ++ raspberryPiDefaultModules;
          };

          alexander-2 = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-2
              ]
              ++ raspberryPiDefaultModules;
          };

          alexander-3 = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-3
              ]
              ++ raspberryPiDefaultModules;
          };

          alexander-4 = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-4
              ]
              ++ raspberryPiDefaultModules;
          };
        };

        nixosImages = {
          bahamut-vm = nixos-generators.nixosGenerate {
            system = "x86_64-linux";
            pkgs = self.pkgs.x86_64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-bahamut
              ]
              ++ defaultModules;

            format = "vm";
          };

          alexander-1-sd-aarch64 = nixos-generators.nixosGenerate {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-1
              ]
              ++ raspberryPiDefaultModules;

            format = "sd-aarch64";
          };

          alexander-2-sd-aarch64 = nixos-generators.nixosGenerate {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-2
              ]
              ++ raspberryPiDefaultModules;

            format = "sd-aarch64";
          };

          alexander-3-sd-aarch64 = nixos-generators.nixosGenerate {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-3
              ]
              ++ raspberryPiDefaultModules;

            format = "sd-aarch64";
          };

          alexander-4-sd-aarch64 = nixos-generators.nixosGenerate {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-4
              ]
              ++ raspberryPiDefaultModules;

            format = "sd-aarch64";
          };
        };
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

            custom.agenix
            # custom.flake-shell
            # custom.nixos-upgrade
          ];

          innerInputs = inputs // {inherit pkgs defaultPackages;};
        in {
          inherit pkgs defaultPackages;

          packages = {
            # Packages to be installed on all systems and shells
            default = pkgs.buildEnv {
              name = "default";
              paths = defaultPackages;
            };

            nixos-upgrade = (
              pkgs.writeShellScriptBin "nixos-upgrade" ''
                #! ${pkgs.stdenv.shell}
                sudo nixos-rebuild switch --flake 'github:coleneville/nixconfig/main'
              ''
            );

            flake-shell = (
              pkgs.writeShellScriptBin "nixos-upgrade" ''
                #! ${pkgs.stdenv.shell}
                nix develop 'github:coleneville/nixconfig/main'
              ''
            );

            agenix = agenix.packages.${system}.default;
          };

          formatter = pkgs.alejandra;

          devShells = {
            default = pkgs.mkShell {
              buildInputs = defaultPackages;
            };
          };
        }
      )
  );
}
