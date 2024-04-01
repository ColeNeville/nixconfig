{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) self nixos-hardware home-manager;
in {
  imports = [
    ./hardware.nix
    ./programs.nix
    ./services.nix
    ./xserver.nix
  ];
  
  config = {
    nixconfig = {
      plasma.enable = false;
    };

    boot = {
      binfmt.emulatedSystems = ["aarch64-linux"];
      kernelPackages = pkgs.linuxPackages_latest;

      loader = {
        systemd-boot.enable = true;

        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
      };
    };

    networking = {
      hostName = "garuda";

      hosts = {
        "100.64.59.20" = ["moogle.tailscale.coleslab.com"];
      };

      networkmanager = {
        enable = true;
        dns = "unbound";
      };

      interfaces = {

      };
    };

    sound.enable = true;

    fonts = {
      packages = with pkgs; [
        fira
        fira-code
        fira-code-nerdfont
      ];

      fontconfig = {
        enable = true;

        subpixel = {
          rgba = "rgb";
        };

        defaultFonts = {
          sansSerif = ["Fira Sans"];
          monospace = ["FiraCode Nerd Font"];
        };
      };
    };

    xdg.portal = {
      enable = true;

      extraPortals = with pkgs; [
        xdg-desktop-portal-kde
      ];

      config.common.default = "*";
    };

    virtualisation = {
      libvirtd.enable = true;
      docker.enable = true;
      spiceUSBRedirection.enable = true;
    };

    home-manager = {
      users.cole = self.homeManagerModules.home-cole-garuda;
    };

    time.timeZone = "America/Edmonton";

    system = {
      autoUpgrade.enable = false;
      stateVersion = "22.11";
    };
  };
}
