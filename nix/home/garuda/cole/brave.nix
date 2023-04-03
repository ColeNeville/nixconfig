{ pkgs, ... }:

{
  home = {
    packages = with pkgs; [
      brave
    ];
  };

  xdg = {
    mimeApps = {
      enable = true;

      defaultApplications = {
        "x-scheme-handler/https" = "brave.desktop";
        "x-scheme-handler/about" = "brave.desktop";
        "x-scheme-handler/unknown" = "brave.desktop";
      };
    };
  };
}