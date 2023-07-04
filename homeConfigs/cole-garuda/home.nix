{
  pkgs,
  config,
  ...
}: {
  home = {
    username = "cole";
    homeDirectory = "/home/cole";

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];

    stateVersion = "22.11";
  };

  programs = {
    git = {
      enable = true;

      userEmail = "colewneville2@gmail.com";
      userName = "ColeNeville";

      signing = {
        signByDefault = true;
        key = "F3686993701CB915";
      };
    };

    zsh = {
      enable = true;

      oh-my-zsh = {
        enable = true;
      };

      sessionVariables = {
        KUBECONFIG = "$HOME/.kube/config";
        SSH_ASKPASS = pkgs.libsForQt5.ksshaskpass + "/bin/ksshaskpass";
      };
    };

    command-not-found.enable = true;

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
      enable = true;

      enableSshSupport = true;
      enableZshIntegration = true;
      pinentryFlavor = "qt";
    };
  };

  xdg = {
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    cacheHome = "${config.home.homeDirectory}/.cache";

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
}
