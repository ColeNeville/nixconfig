{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.profile-alexander-node { hostName = "alexander-3"; }
  ];
}