{
  self,
  nixpkgs,
  nixos-generators,
  nixos-hardware,
  home-manager,
  ...
}: {
  pkgs,
  defaultPackages,
}: {
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

    bahamut-proxmox-lxc = nixos-generators.nixosGenerate {
      inherit pkgs;

      system = pkgs.system;
      modules = [
        self.nixosModules.configuration-bahamut
      ];

      format = "proxmox-lxc";
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

  homeConfigurations = {
    "cole@garuda" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
        self.homeModules.configuration-cole-garuda
      ];
    };
  };
}
