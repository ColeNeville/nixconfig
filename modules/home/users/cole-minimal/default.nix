{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.homeManagerModules.mixins.common
  ];

  programs = {
    git = {
      enable = true;

      userEmail = "colewneville2@gmail.com";
      userName = "ColeNeville";
    };
  };

  home = {
    stateVersion = "22.11";
  };
}