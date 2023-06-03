{ ... }:

{
  home = {
    mixins = {

    };

    users = {
      "cole@garuda" = import ./home/cole-garuda;
    };
  };

  mixins = {
    common = import ./mixins/common.nix;
    bluetooth = import ./mixins/bluetooth.nix;
  };

  users = {
    cole = import ./users/cole;
  };
}