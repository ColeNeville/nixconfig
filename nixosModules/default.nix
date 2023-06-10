{ ... }:

{
  hardware = {
    garuda = import ./hardware/garuda.nix;
  };

  hosts = {
    garuda = import ./hosts/garuda.nix;
  };

  mixins = {
    bluetooth = import ./mixin/bluetooth.nix;
    common = import ./mixin/common.nix;
    home-manager = import ./mixin/home-manager.nix;
    sddm = import ./mixin/sddm.nix;
    xserver = import ./mixin/xserver.nix;
  };

  profiles = {
    plasma = import ./profile/plasma.nix;
  };

  users = {
    # Any host user configurations
    cole = import ./user/cole.nix;

    # Host specific user configurations
    "cole@garuda" = import ./user/cole-garuda.nix;
  };

  hardware-garuda = import ./hardware/garuda.nix;

  host-garuda = import ./host/garuda.nix;

  mixin-bluetooth = import ./mixin/bluetooth.nix;
  mixin-common = import ./mixin/common.nix;
  mixin-home-manager = import ./mixin/home-manager.nix;
  mixin-sddm = import ./mixin/sddm.nix;
  mixin-xserver = import ./mixin/xserver.nix;

  profile-plasma = import ./profile/plasma.nix;

  user-cole = import ./user/cole.nix;
  user-cole-garuda = import ./user/cole-garuda.nix;
}