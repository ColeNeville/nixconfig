{ ... }:

{
  users = {
    cole = import ./users/cole.nix;
  };

  mixins = {
    common = import ./mixins/common.nix;
    bluetooth = import ./mixins/bluetooth.nix;
  };
}