{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) self nixos-hardware home-manager;
in {
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

    interfaces = {
      enp0s20f0u3i1 = {
        ipv4 = {
          addresses = [
            {
              address = "192.168.200.1";
              prefixLength = 24;
            }
          ];
        };
      };
    };

    firewall = {
      enable = true;
      extraCommands = ''
        iptables -A FORWARD -o wlp166s0 -i enp0s20f0u3i1 -s 192.168.200.0/24 -m conntrack --ctstate NEW -j ACCEPT
        iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
        iptables -t nat -F POSTROUTING
        iptables -t nat -A POSTROUTING -o wlp166s0 -j MASQUERADE
      '';
    };

    nat.enable = true;
  };

  ###############################################
  # Services settings
  ###############################################

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

  virtualisation = {
    libvirtd.enable = true;
    docker.enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Programming
    (python311.withPackages (ps: with ps; [pip virtualenv]))

    # Virtual Machines
    virt-viewer
    virt-manager

    # Filesystems
    ntfs3g
    exfat

    libsForQt5.ksshaskpass
  ];

  time.timeZone = "America/Edmonton";

  system = {
    stateVersion = "22.11";
  };
}
