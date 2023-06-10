{ ... }:

{
  mixin-common = import ./mixin/common.nix;

  user-cole = import ./user/cole;
  user-cole-garuda = import ./user/cole-garuda;
}