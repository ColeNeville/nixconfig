{
  config,
  pkgs,
  lib,
  pkgs-unstable,
  inputs,
  ...
}:

let
  inherit (inputs) self agenix nixos-hardware;

  pkgsUnstable = import pkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = pkgs.config.allowUnfree;
  };
in {
  boot = {
    loader = {
      systemd-boot.enable = true;

      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot/efi";
      };
    };
  };

  imports = [
    agenix.nixosModules.default
    nixos-hardware.nixosModules.framework-12th-gen-intel

    self.nixosModules.mixin-common
    self.nixosModules.mixin-bluetooth

    self.nixosModules.profile-plasma

    self.nixosModules.user-cole-garuda

    self.nixosModules.hardware-garuda
  ];

  ###############################################
  # Network settings
  ###############################################

  networking = {
    hostName = "garuda";

    hosts = {
      "100.64.59.20" = [ "moogle.tailscale.coleslab.com" ];
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
      videoDrivers = [ "modesetting" ];

      layout = "us";

      libinput = {
        enable = true;
        touchpad = {
          naturalScrolling = true;
          clickMethod = "buttonareas";
        };
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
        sansSerif = [ "Fira Sans" ];
        monospace = [ "Fira Code" ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    # Media
    spotify
    vlc

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
    (python311.withPackages(ps: with ps; [ pip virtualenv ]))

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

    # Random Utils
    virtualbox
    ark
    nix-index
    kubectl
    kubernetes-helm
  ];

  time.timeZone = "America/Edmonton";

  system = {
    stateVersion = "22.11";
  };
}