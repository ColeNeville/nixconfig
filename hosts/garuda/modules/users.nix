{ inputs, ... }:

let
  inherit (inputs) self homer-manager;
in {
  imports = [
    home-manager.nixosModules.home-manager
    self.nixosModules.users.cole
  ]
}