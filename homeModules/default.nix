{ ... }:

{
  mixins = {
    common = import ./mixins/common.nix;
  };

  users = {
    # Any host user configurations
    cole = import ./users/cole;

    # Host specific user configurations
    "cole@garuda" = import ./users/cole-garuda;
  };
}