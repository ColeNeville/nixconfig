{
  pkgs,
  config,
  ...
}: {
  imports = [../../default/home.nix];

  config = {
    programs = {
      fish = {
        enable = true;

        shellInit = ''
          set -x KUBECONFIG $HOME/.kube/config
          set -x SSH_ASKPASS ${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass
          set -x EDITOR ${pkgs.nano}/bin/nano
        '';
      };

      emacs = {
        enable = true;

        package = pkgs.emacs29;        

        extraPackages = epkgs: [
          epkgs.org-babel-eval-in-repl
          epkgs.use-package
          epkgs.vterm
        ];
      };

      command-not-found.enable = true;

      rofi = {
        enable = true;
        location = "center";
        font = "Fira Code 14";
        terminal = pkgs.alacritty + /bin/alacritty;

        extraConfig = {
          modes = ["combi"];
          combi-modes = ["drun" "window" "ssh"];
        };
      };

      feh.enable = true;
      
      alacritty.enable = true;

      ledger = {
        enable = true;
        settings = {
          date-format = "%Y-%m-%d";
          file = [
            "~/finance/main.ledger"
          ];
        };
      };
    };

    services = {
      gpg-agent = {
        pinentryFlavor = "qt";
      };

      emacs = {
        enable = true;
        defaultEditor = true;
        startWithUserSession = true;
        
        client = {
          enable = true;
        };
      };

      betterlockscreen = {
        enable = true;
      };
    };

    xdg = {
      enable = true;

      configFile = { 
        "autostart-scripts/" = {
          source = ./config/autostart-scripts;
          executable = true;
        };

        "alacritty.yml" = {
          source = ./config/alacritty.yml;
        };
      };

      desktopEntries = {};
    };

    xsession = {
      enable = false;
    };

    home.packages = with pkgs; [
      # 3D Printing
      printrun # Printrun

      # Development Dependancies
      i2c-tools # I2C tools
      platformio # Arduino development tools

      # Communication clients
      keybase-gui # Keybase

      unstable.gpt4all # Local LLM tool

      # Networking
      nmap # Network scanner
      wireshark # Network packet analyzer
      putty # SSH client
      bettercap
      hashcat
      hashcat-utils
      hcxtools
      hcxdumptool
      wirelesstools

      # Misc Applications
      archiver # Archive manager
      rpi-imager # Raspberry Pi OS image writer
      ddrescue # Data recovery tool

      ark # Archive manager
      nix-index # Nix package search tool
      kubectl # Kubernetes command line tool
      kubernetes-helm # Kubernetes package manager
      gparted # Partition manager

      gcc
      gcc-arm-embedded

      python311
      python311Packages.pipx

      # Plain text accounting
      ledger

      pinentry-qt
      
      nixconfig.garuda-wallpaper
      awesomewm-theme.default

      lua
    ];
  };
}
