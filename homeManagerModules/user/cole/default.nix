{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.homeManagerModules.mixin-common
  ];

  programs = {
    git = {
      enable = true;

      userEmail = "colewneville2@gmail.com";
      userName = "ColeNeville";
    };

    zsh = {
      enable = true;

      oh-my-zsh = {
        enable = true;
      };
    };

    command-not-found.enable = true;
  };

  services = {};

  home = {
    stateVersion = "22.11";
  };
}