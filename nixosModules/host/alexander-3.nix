{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.mixin-ssh-server
    
    self.nixosModules.profile-alexander-node { hostName = "alexander-3"; }
  ];
}