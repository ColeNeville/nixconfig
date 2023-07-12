{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) self nixos-hardware home-manager;
in {
  boot = {
    binfmt.emulatedSystems = ["aarch64-linux"];

    loader = {
      systemd-boot.enable = true;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
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
  };

  ###############################################
  # Services settings
  ###############################################

  services = {
    xserver = {
      enable = true;
      videoDrivers = ["modesetting"];
      layout = "us";

      libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = true;
          clickMethod = "buttonareas";
        };
      };

      displayManager = {
        sddm.enable = true;
        defaultSession = "plasma";
      };

      desktopManager.plasma5.enable = true;
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
  };

  ###############################################
  # Hardware settings
  ###############################################

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
  };

  ###############################################
  # Sound settings
  ###############################################

  sound.enable = true;

  ###############################################
  # Security settings
  ###############################################

  security = {
    rtkit.enable = true;
  };

  ###############################################
  # Application settings
  ###############################################

  fonts = {
    fonts = with pkgs; [
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

  programs = {
    dconf.enable = true;
  };

  virtualisation = {
    libvirtd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Media
    spotify
    unstable.vlc

    # Games
    moonlight-qt

    # Graphics
    krita
    gimp
    inkscape
    fontforge

    # 3D Printing
    cura
    prusa-slicer
    printrun

    # Communications
    thunderbird

    # Networking
    nmap
    wireshark
    putty

    # Programming
    (python311.withPackages (ps: with ps; [pip virtualenv]))

    # Virtual Machines
    virt-viewer
    virt-manager

    # Misc Applications
    neofetch
    autokey
    bitwarden
    archiver
    avidemux
    rpi-imager

    # Yubikey
    yubikey-manager-qt
    yubikey-personalization-gui
    yubioath-flutter

    # Filesystems
    ntfs3g
    exfat

    # Random Utils
    ark
    nix-index
    kubectl
    kubernetes-helm
    gparted

    libsForQt5.ksshaskpass
  ];

  time.timeZone = "America/Edmonton";

  system = {
    stateVersion = "22.11";
  };
}
