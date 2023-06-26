{ config, inputs, ... }: 

let
  inherit (inputs) self;
in {
  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.local/bin"
    ];
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

  xdg = {
    configHome = "${config.home.homeDirectory}/.config";
    dataHome = "${config.home.homeDirectory}/.local/share";
    stateHome = "${config.home.homeDirectory}/.local/state";
    cacheHome = "${config.home.homeDirectory}/.cache";
  };
}