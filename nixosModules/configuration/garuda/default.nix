{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) self nixos-hardware home-manager;
in {
  config = {
    nixconfig = {
      autoUpgrade = {
        enable = false;
      };
    };

    custom = {
      plasma = {
        enable = true;
      };
      home-manager = {
        enable = true;
        home = ./home.nix;
      };
    };

    boot = {
      binfmt.emulatedSystems = ["aarch64-linux"];

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

    services = {
      xserver = {
        videoDrivers = ["modesetting"];

        libinput = {
          enable = true;
          touchpad = {
            naturalScrolling = true;
            clickMethod = "buttonareas";
          };
        };

        digimend.enable = true;
        wacom.enable = true;
      };

      pipewire = {
        enable = true;

        alsa = {
          enable = true;
          support32Bit = true;
        };

        pulse.enable = true;
      };

      fwupd.enable = true;

      tlp = {
        enable = true;

        settings = {
          START_CHARGE_THRESH_BAT0 = 0;
          STOP_CHARGE_THRESH_BAT0 = 80;
        };
      };

      power-profiles-daemon.enable = false;

      tailscale = {
        enable = true;
      };

      printing = {
        enable = true;
      };

      unbound = {
        enable = true;

        settings = {
          forward-zone = [
            {
              name = "local.coleslab.com";
              forward-addr = "100.64.59.20";
            }
            {
              name = "alexander.coleslab.com";
              forward-addr = "100.64.59.20";
            }
          ];
        };
      };

      flatpak.enable = true;
      packagekit.enable = true;
    };

    hardware = {
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;

        extraPackages = with pkgs; [
          intel-compute-runtime
          intel-media-driver
          vaapiIntel
          vaapiVdpau
          libvdpau-va-gl
        ];
      };

      pulseaudio.enable = false;
      bluetooth.enable = true;
      sane.enable = true;
    };

    sound.enable = true;

    fonts = {
      packages = with pkgs; [
        fira
        fira-code
      ];

      fontconfig = {
        enable = true;

        subpixel = {
          rgba = "bgr";
        };

        defaultFonts = {
          sansSerif = ["Fira Sans"];
          monospace = ["Fira Code"];
        };
      };
    };

    virtualisation = {
      libvirtd.enable = true;

      virtualbox = {
        host = {
          enable = true;
          package = pkgs.vbox.virtualbox;
          enableExtensionPack = true;
        };
      };

      docker.enable = true;
      spiceUSBRedirection.enable = true;
    };

    programs = {
      virt-manager.enable = true;
    };

    environment.systemPackages = with pkgs; [
      # Virtual Machines
      virt-viewer

      # Filesystems
      ntfs3g
      exfat

      libsForQt5.discover
      libsForQt5.ksshaskpass
      libsForQt5.skanlite
    ];

    time.timeZone = "America/Edmonton";

    system = {
      stateVersion = "22.11";
    };
  };
}
