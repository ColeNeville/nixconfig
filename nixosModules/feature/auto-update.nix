{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.custom.nixos-fetch-config
    pkgs.custom.nixos-build-config
  ];
}
