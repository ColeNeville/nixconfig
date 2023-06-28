{ ... }:

{
  profile-common = import ./profile/common.nix;

  user-cole = import ./user/cole;
  user-garuda-cole = import ./user/garuda-cole;
}