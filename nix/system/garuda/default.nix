{ pkgs, ... }: 

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi";
  };

  ###############################################
  # Network settings
  ###############################################

  networking = {
    hostName = "garuda";
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

      defaultFonts = {
        sansSerif = [ "Fira Sans" ];
        monospace = [ "Fira Code" ];
      };
    };
  };

  ###############################################
  # Other settings
  ###############################################

  users = {
    groups = {
      wireshark = {};
    };

    users = {
      cole = {
        isNormalUser = true;
        description = "Cole Neville";
        home = "/home/cole";

        extraGroups = [
          "audio"
          "dialout"
          "docker"
          "networkmanager"
          "video"
          "wheel"
          "wireshark"
        ];
      };
    };
  };

  time.timeZone = "America/Edmonton";
}