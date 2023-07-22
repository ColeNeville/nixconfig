{
  pkgs,
  config,
  ...
}: {
  imports = [../../default/home.nix];

  config = {
    programs = {
      zsh = {
        oh-my-zsh = {
          enable = true;
        };

        sessionVariables = {
          KUBECONFIG = "$HOME/.kube/config";
          SSH_ASKPASS = pkgs.libsForQt5.ksshaskpass + "/bin/ksshaskpass";
          TERM = "xterm-256color";
        };
      };

      kitty = {
        enable = true;

        shellIntegration = {
          enableZshIntegration = true;
        };
      };

      alacritty = {
        enable = true;
      };
    };

    services = {
      gpg-agent = {
        pinentryFlavor = "qt";
      };
    };

    xdg = {
      configFile = {
        "alacritty.yml" = {
          source = ./config/alacritty.yml;
        };

        "autostart-scripts/ssh-add.sh" = {
          source = ./config/autostart-scripts/ssh-add.sh;
          executable = true;
        };
      };

      desktopEntries = {
        # Workaround for a bug that prevents proper rendering without --disable-gpu-driver-bug-workarounds
        logseq = {
          name = "Logseq";
          genericName = "Note taking and knowledge base";
          comment = "Logseq is a local-first, non-linear, outliner notebook for organizing and sharing your personal knowledge base.";
          icon = "logseq";
          exec = "${pkgs.logseq}/bin/logseq --disable-gpu-driver-bug-workarounds";
          terminal = false;
          categories = [ "Office" "TextEditor" "Utility" ];
        };
      };

      # mimeApps = {
      #   enable = true;

      #   defaultApplications = {
      #     "video/mp4" = "vlc.desktop";
      #     "application/x-yaml" = "code.desktop";

      #     "x-scheme-handler/https" = "brave.desktop";
      #     "x-scheme-handler/about" = "brave.desktop";
      #     "x-scheme-handler/unknown" = "brave.desktop";
      #   };
      # };
    };

    home.packages = with pkgs; [
      # Web browsers
      unstable.chromium
      unstable.brave
      unstable.firefox
      vivaldi
      vivaldi-ffmpeg-codecs

      # Editors
      arduino
      unstable.vscode

      # Development Dependancies
      i2c-tools
      platformio

      # Communication
      unstable.discord

      # CAD
      fritzing
      freecad
      openscad
      kicad

      logseq

      argocd
      argocd-vault-plugin
      yubikey-personalization
      ddrescue
    ];
  };
}
