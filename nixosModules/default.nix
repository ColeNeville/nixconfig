{ ... }:

{
  hardware-garuda = import ./hardware/garuda.nix;

  host-garuda = import ./host/garuda.nix;

  mixin-bluetooth = import ./mixin/bluetooth.nix;
  mixin-common = import ./mixin/common.nix;
  mixin-home-manager = import ./mixin/home-manager.nix;
  mixin-sddm = import ./mixin/sddm.nix;
  mixin-xserver = import ./mixin/xserver.nix;

  profile-plasma = import ./profile/plasma.nix;

  user-cole = import ./user/cole.nix;

  # Host specific user configurations
  user-cole-garuda = import ./user/cole-garuda.nix;
}