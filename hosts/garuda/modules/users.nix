{ inputs, ... }:

let
  inherit (inputs) self home-manager;
in {
  imports = [
    home-manager.nixosModules.home-manager

    self.nixosModules.users.cole
    self.homeManagerModules.cole
  ];

  home-manager = {
    users = {
      cole = import "${self}/users/cole";
    };
    extraSpecialArgs = { inherit inputs; };
  };
}