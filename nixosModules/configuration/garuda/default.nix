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

    services = {
      xserver = {
        enable = true;
        
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

        displayManager = {
          sddm.enable = true;
        };

        desktopManager = {
          xfce.enable = true;
          plasma5.enable = true;
        };
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
      fprintd.enable = lib.mkDefault true;

      power-profiles-daemon.enable = true;

      tailscale.enable = true;
      printing.enable = true;

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
      keybase.enable = true;
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
      keyboard.qmk.enable = true;

      sensor = {
        iio.enable = true;
      };
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
      docker.enable = true;
      spiceUSBRedirection.enable = true;
    };

    programs = {
      virt-manager.enable = true;
    };

    home-manager = {
      users.cole = import ./home.nix;
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
      libsForQt5.skanpage
      libsForQt5.yakuake
    ];

    time.timeZone = "America/Edmonton";

    system = {
      autoUpgrade.enable = false;
      stateVersion = "22.11";
    };
  };
}
