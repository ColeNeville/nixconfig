{config, pkgs, nixpkgs-unstable, ...}:

{
  imports = [
    ./hardware-configuration.nix
  ];

  environment.systemPackages = [
    pkgs.chromium
    nixpkgs-unstable.brave
  ];
}