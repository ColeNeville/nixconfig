{ ... }:

{
  mixins = {
    common = import ./mixins/common.nix;
  };

  users = {
    cole-full = import ./users/cole-full;
    cole-minimal = import ./users/cole-minimal;
  };
}