{ ... }:

{
  mixins = {
    common = import ./mixins/common.nix;
    bluetooth = import ./mixins/bluetooth.nix;
    sddm = import ./mixins/sddm.nix;
    xserver = import ./mixins/xserver.nix;
  };

  profiles = {
    plasma = import ./profiles/plasma.nix;
  };

  systems = {
    garuda = import ./systems/garuda;
  };

  users = {
    cole-full = import ./users/cole-full.nix;
    cole-minimal = import ./users/cole-minimal.nix;
  };
}