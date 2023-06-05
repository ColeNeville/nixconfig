{ inputs, ... }:

let
  inherit (inputs) self home-manager;
in {
  imports = [
    home-manager.nixosModules.home-manager
    self.nixosModules.users.cole
  ];

  home-manager = {
    users = {
      cole = {
        imports = [
          self.homeManagerModules.users.cole-full
        ];
      };
    };
  };
}