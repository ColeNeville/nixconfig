{ ... }:

{
  feature-auto-update = import ./feature/auto-update.nix;

  hardware-garuda = import ./hardware/garuda.nix;

  host-garuda = import ./host/garuda.nix;
  host-alexander-1 = import ./host/alexander-1.nix;
  host-alexander-2 = import ./host/alexander-2.nix;
  host-alexander-3 = import ./host/alexander-3.nix;
  host-alexander-4 = import ./host/alexander-4.nix;

  mixin-agenix = import ./mixin/agenix.nix;
  mixin-bluetooth = import ./mixin/bluetooth.nix;
  mixin-common = import ./mixin/common.nix;
  mixin-home-manager = import ./mixin/home-manager.nix;
  mixin-sddm = import ./mixin/sddm.nix;
  mixin-ssh-server = import ./mixin/ssh-server.nix;
  mixin-xserver = import ./mixin/xserver.nix;

  profile-plasma = import ./profile/plasma.nix;
  profile-alexander-node = import ./profile/alexander-node.nix;

  user-cole = import ./user/cole.nix;

  # Host specific user configurations
  user-cole-garuda = import ./user/cole-garuda.nix;
}