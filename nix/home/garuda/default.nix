{ pkgs, config, ... }:

{
  home = {
    username = "cole";
    homeDirectory = "/home/cole";

    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];

    stateVersion = "22.11";
  };

  fonts.fontconfig.enable = true;

  programs = {
    home-manager.enable = true;

    git = {
      enable = true;

      userEmail = "colewneville2@gmail.com";
      userName = "ColeNeville";
    };

    alacritty = {
      enable = true;
    };

    vscode = {
      enable = true;

      userSettings = {
        "editor.tabSize" = 2;
        "editor.renderWhitespace" = "all";
        "extensions.autoUpdate" =  false;
        "platformio-ide.useBuiltinPIOCore" = false;
        "platformio-ide.customPATH" = "/run/current-system/sw/bin";
      };

      extensions = with pkgs.vscode-extensions; [
        ms-vscode.cpptools
        bbenoist.nix
      ];
    };

    gpg = {
      enable = true;
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    keybase = {
      enable = true;
    };

    kbfs = {
      enable = true;
    };
  };

  xdg = {
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    cacheHome = "${config.home.homeDirectory}/.cache";
    
    configFile = {
      "alacritty.yml" = {
        source = ./config/alacritty.yml;
      };
    };

    mimeApps = {
      enable = true;

      defaultApplications = {
        "x-scheme-handler/https" = "brave.desktop";
        "x-scheme-handler/about" = "brave.desktop";
        "x-scheme-handler/unknown" = "brave.desktop";
        "video/mp4" = "vlc.desktop";
        "application/x-yaml" = "code.desktop";
      };
    };
  };
}
