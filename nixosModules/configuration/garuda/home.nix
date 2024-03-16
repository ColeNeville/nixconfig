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

        shellAliases = {
          hldr = "hledger --strict";
          hldrm = "hldr -f $HOME/finance/main.journal";
        };
      };

      emacs = {
        enable = true;
        package = pkgs.nixconfig.emacs-customized;
      };

      command-not-found.enable = true;

      i3status = {
        general = {
          
        };
      };

      feh.enable = true;
    };

    services = {
      gpg-agent = {
        pinentryFlavor = "curses";
      };
    };

    xdg = {
      configFile = {
        "autostart-scripts/ssh-add.sh" = {
          source = ./config/autostart-scripts/ssh-add.sh;
          executable = true;
        };
      };

      desktopEntries = {};
    };

    xsession = {
      windowManager.i3 = {
        enable = true;
      
        config = {
          modifier = "Mod4"; # Super Key

          startup = [
            {
              command = "feh --bg-scale ${pkgs.nixconfig.garuda-wallpaper}/share/dalle2.webp";
            }
          ];
          
          fonts = {
            names = ["Fira Code"];
            size = 12.0;
          };

          window = {
            border = 5;
          };

          bars = [
            {
              position = "top";

              fonts = {
                names = ["Fira Code"];
                size = 12.0;
              };
            
              statusCommand = "${pkgs.i3status}/bin/i3status";

              extraConfig = ''
                workspace_min_width 80
              '';
            }
          ];
        };
      };
    };

    home.packages = with pkgs; [
      # 3D Printing
      printrun # Printrun

      # IDEs
      # vscode # Visual Studio Code

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
      hledger
      hledger-ui
      hledger-web

      nixconfig.garuda-wallpaper
    ];
  };
}
