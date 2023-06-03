{config, pkgs, lib, inputs, ...}:

let
  inherit (inputs) self;

  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = true;
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
    self.nixosModules.mixins.common
    self.nixosModules.mixins.bluetooth

    ./hardware-configuration.nix

    ./modules/programs.nix
    ./modules/services.nix
    ./modules/networking.nix
    ./modules/users.nix
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
      enable = true;
      videoDrivers = [ "modesetting" ];

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

  time.timeZone = "America/Edmonton";

  system = {
    stateVersion = "22.11";
  };
}