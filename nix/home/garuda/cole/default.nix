{ pkgs, config, ... }:

{
  fonts.fontconfig.enable = true;

  programs = {
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
    mimeApps = {
      enable = true;

      defaultApplications = {
        "video/mp4" = "vlc.desktop";
        "application/x-yaml" = "code.desktop";
      };
    };
  };
}
