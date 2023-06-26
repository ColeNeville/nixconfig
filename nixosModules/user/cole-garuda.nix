{ inputs, ... }:

let
  inherit (inputs) self home-manager;
in {
  imports = [
    self.nixosModules.profile-home-manager
    self.nixosModules.user-cole
  ];

  home-manager = {
    users = {
      cole = {
        imports = [
          self.homeManagerModules.user-cole-garuda
        ];
      };
    };
  };
}