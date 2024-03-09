{
  pkgs,
  config,
  ...
}: {
  imports = [../../default/home.nix];

  config = {
    programs = {
      zsh = {
        sessionVariables = {
          KUBECONFIG = "$HOME/.kube/config";
          SSH_ASKPASS = "${pkgs.libsForQt5.ksshaskpass}/bin/ksshaskpass";
        };

        # shellAliases = {
        #   # Get kitty to work properly with ssh
        #   ssh = "TERM='xterm-256color' ssh";
        # };
      };

      # kitty = {
      #   enable = true;

      #   shellIntegration = {
      #     enableZshIntegration = true;
      #   };
      # };

      command-not-found.enable = true;
    };

    services = {
      gpg-agent = {
        pinentryFlavor = "qt";
      };
    };

    xdg = {
      configFile = {
        "autostart-scripts/ssh-add.sh" = {
          source = ./config/autostart-scripts/ssh-add.sh;
          executable = true;
        };
      };

      desktopEntries = {
        # # Workaround for a bug that prevents proper rendering without --disable-gpu-driver-bug-workarounds
        # logseq = {
        #   name = "Logseq";
        #   genericName = "Note taking and knowledge base";
        #   comment = "Logseq is a local-first, non-linear, outliner notebook for organizing and sharing your personal knowledge base.";
        #   icon = "logseq";
        #   exec = "${pkgs.unstable.logseq}/bin/logseq --disable-gpu-driver-bug-workarounds";
        #   terminal = false;
        #   categories = ["Office" "TextEditor" "Utility"];
        # };

        # Workaround for a bug that prevents proper rendering without --disable-gpu
        # vscode-no-gpu = {
        #   name = "VSCode (No GPU Rendering)";
        #   genericName = "Text Editor";
        #   comment = "Visual Studio Code is a source-code editor made by Microsoft for Windows, Linux and macOS.";
        #   icon = "code";
        #   exec = "${pkgs.vscode}/bin/code --disable-gpu";
        #   terminal = false;
        #   categories = ["Development" "Utility"];
        # };
      };
    };

    home.packages = with pkgs; [
      # 3D Printing
      printrun # Printrun

      # IDEs
      vscode # Visual Studio Code

      # Development Dependancies
      i2c-tools # I2C tools
      platformio # Arduino development tools

      # Remote desktop
      # parsec-bin # Parsec is a game streaming service
      # moonlight-qt # Moonlight is a game streaming service
      # remmina # Remote desktop client

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
    ];
  };
}
