{ pkgs, inputs, ... }:

let
  inherit (inputs) self;
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = pkgs.config.allowUnfree;
  };
in {
  imports = [
    self.homeManagerModules.users.cole-minimal
  ];

  home.packages = with pkgs; [
    # Web browsers
    chromium
    brave
    firefox

    # Editors
    arduino
    vscode

    # Development Dependancies
    i2c-tools
    platformio

    # Communication
    pkgsUnstable.discord

    # CAD
    fritzing
    freecad
    openscad
    kicad
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
        KUBECONFIG = "$HOME/.kube/kubeconfig";
        SSH_ASKPASS = pkgs.libsForQt5.ksshaskpass + "/bin/ksshaskpass";
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

    mimeApps = {
      enable = true;

      defaultApplications = {
        "video/mp4" = "vlc.desktop";
        "application/x-yaml" = "code.desktop";

        "x-scheme-handler/https" = "brave.desktop";
        "x-scheme-handler/about" = "brave.desktop";
        "x-scheme-handler/unknown" = "brave.desktop";
      };
    };
  };
}