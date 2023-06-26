{ ... }:

{
  profile-common = import ./profile/common.nix;

  user-cole = import ./user/cole;
  user-cole-garuda = import ./user/cole-garuda;
}