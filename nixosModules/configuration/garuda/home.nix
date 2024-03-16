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
        package = pkgs.nixconfig.customizedEmacs;
      };

      command-not-found.enable = true;
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

    home.packages = with pkgs; [
      # 3D Printing
      printrun # Printrun

      # IDEs
      vscode # Visual Studio Code

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
    ];
  };
}
