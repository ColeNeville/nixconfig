{ ... }:

{
  groups = {
    common = import ./groups/common.nix;
  };

  users = {
    cole = import ./users/cole.nix;
  };

  mixins = {
    common = import ./mixins/common.nix;
  };
}