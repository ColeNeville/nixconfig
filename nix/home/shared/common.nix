{ config, ... }: 

{
  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
  };

  xdg = {
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    cacheHome = "${config.home.homeDirectory}/.cache";
  };
}