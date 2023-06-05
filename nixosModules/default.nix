{ lib, ... }:

{
  hardware = {
    garuda = import ./hardware/garuda.nix;
  };

  hosts = {
    garuda = import ./hosts/garuda.nix;
  };

  mixins = {
    bluetooth = import ./mixins/bluetooth.nix;
    common = import ./mixins/common.nix;
    sddm = import ./mixins/sddm.nix;
    xserver = import ./mixins/xserver.nix;
  };

  profiles = {
    plasma = import ./profiles/plasma.nix;
  };

  users = {
    # All host user configurations
    cole = import ./users/cole.nix;

    # Host specific user configurations
    "cole@garuda" = import ./users/cole-garuda.nix;
  };
}