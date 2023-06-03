{ ... }:

{
  users = {
    cole = import ./users/cole;
  };

  mixins = {
    common = import ./mixins/common.nix;
  }
}