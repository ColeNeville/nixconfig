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

    self.nixosModules.feature-auto-update

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

  # security.pki.certificates = [
  #   ''
  #   argocd.alexander.coleslab.com
  #   -----BEGIN CERTIFICATE-----
  #   MIIDYzCCAkugAwIBAgIRAKzjoOKGb+ml437xhMN3p50wDQYJKoZIhvcNAQELBQAw
  #   EjEQMA4GA1UEChMHQXJnbyBDRDAeFw0yMzA2MTExNTAwMjFaFw0yNDA2MTAxNTAw
  #   MjFaMBIxEDAOBgNVBAoTB0FyZ28gQ0QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
  #   ggEKAoIBAQC2HO+imyj33uJBhHdiZD+k+VPN2JamoHxQjRUenzIHIhEQKN6v2k18
  #   62lPDj2yt0JAtWEpVmKPL2fRFFDwQ5eA8OVchgz2F3oR0vNiVyfV9U3/YnR4fH1F
  #   S4ZuQYZorGiTyQzTfuDPuNUWNxnVNk9LByBmGoAkD16cn8ByGQkdDKddvEAgAvIq
  #   gKdKmKd/lOzW8Nw9N+BAhoCSnkPI3OPu+3o5GtFcH8S9PJHPcxDovcnY4XNf/91r
  #   kmcVf5x0xatXVUlKp7jFAmeKpEJbarLHNEiwN46w+X5f4OAvxA6KzmJFCwrprvC5
  #   JH8y/iNn0g2ned0/jPZltgpd773U2igrAgMBAAGjgbMwgbAwDgYDVR0PAQH/BAQD
  #   AgWgMBMGA1UdJQQMMAoGCCsGAQUFBwMBMAwGA1UdEwEB/wQCMAAwewYDVR0RBHQw
  #   coIJbG9jYWxob3N0gg1hcmdvY2Qtc2VydmVyghRhcmdvY2Qtc2VydmVyLmFyZ29j
  #   ZIIYYXJnb2NkLXNlcnZlci5hcmdvY2Quc3ZjgiZhcmdvY2Qtc2VydmVyLmFyZ29j
  #   ZC5zdmMuY2x1c3Rlci5sb2NhbDANBgkqhkiG9w0BAQsFAAOCAQEAhr3rT7WXzEvJ
  #   vgLG2jaG5gWtmS4ji7htvnhi0G/aSGfs0LGKGjCjHqvn854vWo1aYJQBNPfRcYMb
  #   1G/7ALPAuGSGoIuKus3YJz2Gq8U2AJjAjpLqmOYMfGyo8c9A1v7iNxpua1ELgvt/
  #   tW99U6dnew903MWcGNB72ye/vz4+fB7DaHxv7x2cKe4d/exJypyxJj9+IVHRs+D0
  #   cUYo8D3bgUlqk/8sa9oxZeor/By3rusxymNmt24a+iSrlypqFtudqdcX9QSn31hR
  #   W3WtutfCH0ypEK23Mh5l0grD+fKNnmd+Cq0NN0dEuz5n5ixBl8rvTs4DRp0Estzd
  #   gSTtZR3sIQ==
  #   -----END CERTIFICATE-----
  #   ''
  # ];

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