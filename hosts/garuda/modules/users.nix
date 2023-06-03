{ inputs, ... }:

let
  inherit (inputs) self home-manager;
in {
  imports = [
    home-manager.nixosModules.home-manager

    self.nixosModules.users.cole
    self.nixosModules.homeManager.cole
  ];

  home-manager = {
    users = {
      cole = import "${self}/users/cole";
    };
    extraSpecialArgs = { inherit inputs; };
  };
}