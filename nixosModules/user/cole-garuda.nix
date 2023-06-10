{ inputs, ... }:

let
  inherit (inputs) self home-manager;
in {
  imports = [
    self.nixosModules.mixin-home-manager
    self.nixosModules.user-cole
  ];

  home-manager = {
    users = {
      cole = {
        imports = [
          self.homeModules.user-cole-garuda
        ];
      };
    };
  };
}