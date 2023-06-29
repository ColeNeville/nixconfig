{ pkgs, self, ... }:

{
  imports = [
    self.homeManagerModules.profile-common
    self.homeManagerModules.user-cole
  ];

  home.packages = with pkgs; [
    # Web browsers
    unstable.chromium
    unstable.brave
    unstable.firefox
    unstable.vivaldi
    unstable.vivaldi-ffmpeg-codecs

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

    unstable.logseq

    argocd
    argocd-vault-plugin
    yubikey-personalization
  ];

  programs = {
    alacritty = {
      enable = true;
    };

    kitty = {
      enable = true;

      shellIntegration = {
        enableZshIntegration = true;
      };
    };

    zsh = {
      sessionVariables = {
        KUBECONFIG = "$HOME/.kube/config";
        SSH_ASKPASS = pkgs.libsForQt5.ksshaskpass + "/bin/ksshaskpass";
      };
    };

    git = {
      signing = {
        signByDefault = true;
        key = "F3686993701CB915";
      };
    };
  };

  xdg = {
    configFile = {
      "alacritty.yml" = {
        source = ./.config/alacritty.yml;
      };

      "autostart-scripts/ssh-add.sh" = {
        source = ./.config/autostart-scripts/ssh-add.sh;
        executable = true;
      };
    };

    mime = {
      enable = true;
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
}