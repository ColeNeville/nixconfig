{ ... }:

{
  mixins = {
    common = import ./mixins/common.nix;
    bluetooth = import ./mixins/bluetooth.nix;
    sddm = import ./mixins/sddm.nix;
    xserver = import ./mixins/xserver.nix;
  };

  profiles = {
    plasma = import ./profiles/plasma;
  };

  systems = {
    garuda = import ./systems/garuda;
  };

  users = {
    cole = import ./users/cole.nix;
  };
}