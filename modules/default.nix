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

  users = {
    cole = import ./users/cole.nix;
  };
}