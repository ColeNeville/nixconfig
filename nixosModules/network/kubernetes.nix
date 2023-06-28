{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.profile-unbound-dns
  ];
}