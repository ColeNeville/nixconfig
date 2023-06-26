{ ... }:

{
  feature-auto-update = import ./feature/auto-update.nix;

  host-alexander-1 = import ./host/alexander-1.nix;
  host-alexander-2 = import ./host/alexander-2.nix;
  host-alexander-3 = import ./host/alexander-3.nix;
  host-alexander-4 = import ./host/alexander-4.nix;
  host-garuda = import ./host/garuda.nix;
  
  profile-agenix = import ./profile/agenix.nix;
  profile-alexander-node = import ./profile/alexander-node.nix;
  profile-bluetooth = import ./profile/bluetooth.nix;
  profile-common = import ./profile/common.nix;
  profile-home-manager = import ./profile/home-manager.nix;
  profile-k3s-cluster-node = import ./profile/k3s-cluster-node.nix;
  profile-plasma = import ./profile/plasma.nix;
  profile-sddm = import ./profile/sddm.nix;
  profile-ssh-server = import ./profile/ssh-server.nix;
  profile-xserver = import ./profile/xserver.nix;

  user-cole = import ./user/cole.nix;

  # Host specific user configurations
  user-cole-garuda = import ./user/cole-garuda.nix;
}