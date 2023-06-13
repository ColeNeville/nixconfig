{ pkgs, inputs, ... }:

let
  inherit (inputs) self;
  pkgsSelf = self.packages."${pkgs.system}";
in {
  environment.systemPackages = [
    pkgsSelf.nixos-fetch-config
    pkgsSelf.nixos-build-config
  ];
}
