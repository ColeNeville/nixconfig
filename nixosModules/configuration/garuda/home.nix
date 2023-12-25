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
          SSH_ASKPASS = pkgs.libsForQt5.ksshaskpass + "/bin/ksshaskpass";
        };

        shellAliases = {
          # Get kitty to work properly with ssh
          ssh = "TERM='xterm-256color' ssh";
        };
      };

      kitty = {
        enable = true;

        shellIntegration = {
          enableZshIntegration = true;
        };
      };

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

        # # Workaround for a bug that prevents proper rendering without --disable-gpu
        # vscode-no-gpu = {
        #   name = "VSCode (No GPU Rendering)";
        #   genericName = "Text Editor";
        #   comment = "Visual Studio Code is a source-code editor made by Microsoft for Windows, Linux and macOS.";
        #   icon = "code";
        #   exec = "${pkgs.unstable.vscode}/bin/code --disable-gpu";
        #   terminal = false;
        #   categories = ["Development" "Utility"];
        # };
      };
    };

    home.packages = with pkgs; [
      # Media
      # spotify # Spotify
      # unstable.vlc # VLC media player

      # Graphics
      # krita # Krita
      # gimp # GNU Image Manipulation Program
      # inkscape # Inkscape
      # fontforge # Font editor

      # 3D Printing
      cura # Ultimaker Cura
      # prusa-slicer # Prusa Slicer
      printrun # Printrun

      # Web browsers
      # unstable.chromium # Chromium browser
      # unstable.brave # Brave browser
      # unstable.firefox # Firefox browser
      # vivaldi # Vivaldi browser
      # vivaldi-ffmpeg-codecs # Vivaldi media codecs

      # IDEs
      # arduino # Arduino IDE
      vscode # Visual Studio Code
      # unstable.logseq # Note taking and knowledge base

      # Development Dependancies
      i2c-tools # I2C tools
      platformio # Arduino development tools

      # Communication
      # unstable.discord # Chat
      # thunderbird # Email

      # CAD
      fritzing # PCB design
      # freecad # 3D CAD
      # openscad # 3D CAD
      # kicad # PCB design

      # Remote desktop
      # parsec-bin # Parsec is a game streaming service
      # moonlight-qt # Moonlight is a game streaming service
      # remmina # Remote desktop client

      # Yubikey
      yubikey-manager-qt # Yubikey configuration tool
      yubikey-personalization-gui # Yubikey configuration tool
      yubikey-personalization # Yubikey configuration tool
      yubioath-flutter # Yubikey OTP tool

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
      neofetch # System information tool
      autokey # Keyboard macro utility
      # bitwarden # Password manager
      archiver # Archive manager
      # avidemux # Video editor
      rpi-imager # Raspberry Pi OS image writer
      # unstable.logseq # Note taking and knowledge base
      # argocd # Kubernetes GitOps tool
      # argocd-vault-plugin # Argocd plugin for vault integration
      ddrescue # Data recovery tool

      ark # Archive manager
      nix-index # Nix package search tool
      kubectl # Kubernetes command line tool
      kubernetes-helm # Kubernetes package manager
      gparted # Partition manager
      # postman # API testing tool

      python312
      pipenv

      nodejs

      gcc
      gcc-arm-embedded
    ];
  };
}
