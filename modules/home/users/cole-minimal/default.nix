{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.homeManagerModules.mixins.common
  ];

  home = {
    stateVersion = "22.11";
  };
}