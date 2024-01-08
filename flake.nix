{
  description = "Cole's NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:NixOS/nixpkgs/master";

    nixos-hardware.url = "github:nixos/nixos-hardware/316bc98323fe3a7e7f72dbbbe68dce0cce3d4984";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix = {
      url = "github:ryantm/agenix/13ac9ac6d68b9a0896e3d43a082947233189e247";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nixos-generators = {
      url = "github:nix-community/nixos-generators/246219bc21b943c6f6812bb7744218ba0df08600";
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
        
        self.nixosModules.build
        self.nixosModules.default
        self.nixosModules.telegraf
      ];

      proxmoxLXCDefaultModules =
        [
          "${nixpkgs}/nixos/modules/profiles/minimal.nix"
          "${nixpkgs}/nixos/modules/virtualisation/proxmox-lxc.nix"
        ]
        ++ defaultModules;

      proxmoxVMDefaultModules =
        [
          "${nixpkgs}/nixos/modules/profiles/minimal.nix"
          "${nixpkgs}/nixos/modules/virtualisation/proxmox-image.nix"

          self.nixosModules.virtualisation-proxmox-vm
        ]
        ++ defaultModules;

      # nix build .#nixosConfigurations.<value>.config.system.build.sdImage -o <output>
      raspberryPiDefaultModules =
        [
          "${nixpkgs}/nixos/modules/profiles/minimal.nix"
          "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix"

          # https://github.com/NixOS/nixos-hardware/blob/master/raspberry-pi/4/default.nix
          nixos-hardware.nixosModules.raspberry-pi-4
        ]
        ++ defaultModules;

      lib = {
        inherit (nixpkgs.lib) mapAttrs nixosSystem;
        inherit (nixpkgs.lib.attrsets) attrByPath;
        inherit (flake-utils.lib) eachDefaultSystem;

        nixosImage = systemConfig: let
          attrPath = builtins.filter (element: ! builtins.isList element) (
            builtins.split "[\.]" systemConfig.custom.imageAttribute
          );
        in (
          lib.attrByPath attrPath null systemConfig
        );
      };
    in
      {
        # Exported lib functions
        lib = {
          inherit (lib) nixosImage;
        };

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
          # Normal systems
          garuda = lib.nixosSystem {
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

          # Raspberry Pis
          alexander-1 = lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-1
              ]
              ++ raspberryPiDefaultModules;
          };

          alexander-2 = lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-2
              ]
              ++ raspberryPiDefaultModules;
          };

          alexander-3 = lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-3
              ]
              ++ raspberryPiDefaultModules;
          };

          alexander-4 = lib.nixosSystem {
            system = "aarch64-linux";
            pkgs = self.pkgs.aarch64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-alexander-4
              ]
              ++ raspberryPiDefaultModules;
          };

          # Proxmox Virtual Machines
          bahamut = lib.nixosSystem {
            system = "x86_64-linux";
            pkgs = self.pkgs.x86_64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-bahamut
              ]
              ++ proxmoxVMDefaultModules;
          };

          chocobo = lib.nixosSystem {
            system = "x86_64-linux";
            pkgs = self.pkgs.x86_64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-chocobo
              ]
              ++ proxmoxVMDefaultModules;
          };

          # Proxmox LXC Containers
          ozma = lib.nixosSystem {
            system = "x86_64-linux";
            pkgs = self.pkgs.x86_64-linux;

            specialArgs = {inherit inputs;};
            modules =
              [
                self.nixosModules.configuration-ozma
              ]
              ++ proxmoxLXCDefaultModules;
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
        in {
          inherit pkgs;

          packages = {
            # Packages to be installed on all systems and shells
            default = pkgs.buildEnv {
              name = "default";
              paths = with pkgs; [
                coreutils
                curl
                dig
                # gcc
                git
                git-crypt
                gnumake # make command
                gnupg
                nano
                unzip
                util-linux
                usbutils # lsusb command
                wget
              ];
            };
          };

          formatter = pkgs.alejandra;

          devShells = {
            default = pkgs.mkShell {
              buildInputs = with pkgs; [
                agenix.packages.${system}.default
                self.packages.${system}.default
              ];
            };

            python = pkgs.mkShell {
              buildInputs = with pkgs; [
                python37
                python38
                python39
                python310
                python311

                pipenv
              ];
            };
          };
        }
      )
  );
}
