{ inputs, ... }:

let
  inherit (inputs) self home-manager;
in {
  imports = [
    self.nixosModules.mixins.home-manager
    self.nixosModules.users.cole
  ];

  home-manager = {
    users = {
      cole = {
        imports = [
          self.homeModules.users."cole@garuda"
        ];
      };
    };
  };
}