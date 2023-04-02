{ ... }:

{
  programs = {
    alacritty = {
      enable = true;
    };
  };

  xdg = {
    configFile = {
      "alacritty.yml" = {
        source = ../../../../.config/alacritty.yml;
      };
    };
  };
}