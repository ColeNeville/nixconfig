{ lib, ... }:

{
  hosts = {
    bismark = import ./hosts/bismark.nix;
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
    cole-full = import ./users/cole-full.nix;
    cole-minimal = import ./users/cole-minimal.nix;
  };
}