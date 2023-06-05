{ ... }:

{
  mixins = {
    common = import ./mixins/common.nix;
    bluetooth = import ./mixins/bluetooth.nix;
    sddm = import ./mixins/sddm.nix;
    xserver = import ./mixins/xserver.nix;
  };

  profiles = import ./profiles;
  systems = import ./systems;
  users = import ./users;
}