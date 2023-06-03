{config, pkgs, inputs, ...}:

{
  environment.systemPackages = [
    pkgs.chromium
    inputs.pkgs-unstable.brave
  ]
}