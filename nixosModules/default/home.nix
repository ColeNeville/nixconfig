{ config, lib, ... }: {
  config = {
    home = {
      username = lib.mkDefault "cole";
      homeDirectory = lib.mkDefault "/home/cole";

      sessionPath = [
        "${config.home.homeDirectory}/.local/bin"
      ];

      stateVersion = lib.mkDefault "22.11";
    };

    programs = {
      git = {
        enable = lib.mkDefault true;

        userEmail = lib.mkDefault "colewneville2@gmail.com";
        userName = lib.mkDefault "ColeNeville";

        signing = {
          signByDefault = lib.mkDefault true;
          key = lib.mkDefault "F3686993701CB915";
        };
      };

      command-not-found.enable = true;

      zsh = {
        enable = lib.mkDefault true;
      };
    };

    services = {
      gpg-agent = {
        enable = lib.mkDefault true;

        enableSshSupport = lib.mkDefault true;
        enableZshIntegration = lib.mkDefault true;
        pinentryFlavor = lib.mkDefault "curses";
      };
    };

    xdg = {
      configHome = lib.mkDefault "${config.home.homeDirectory}/.config";
      dataHome = lib.mkDefault "${config.home.homeDirectory}/.local/share";
      stateHome = lib.mkDefault "${config.home.homeDirectory}/.local/state";
      cacheHome = lib.mkDefault "${config.home.homeDirectory}/.cache";

      mime = {
        enable = lib.mkDefault true;
      };
    };
  };
}