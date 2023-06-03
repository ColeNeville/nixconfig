{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.homeManagerModules.cole-minimal
  ];
}