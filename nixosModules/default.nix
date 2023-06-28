{ ... }:

{
  feature-auto-update = import ./feature/auto-update.nix;

  network-tailscale = import ./network/tailscale.nix;
  
  profile-agenix = import ./profile/agenix.nix;
  profile-alexander-node = import ./profile/alexander-node.nix;
  profile-bluetooth = import ./profile/bluetooth.nix;
  profile-common = import ./profile/common.nix;
  profile-home-manager = import ./profile/home-manager.nix;
  profile-k3s-cluster-node = import ./profile/k3s-cluster-node.nix;
  profile-plasma = import ./profile/plasma.nix;
  profile-raspberry-pi-4 = import ./profile/raspberry-pi-4.nix;
  profile-sddm = import ./profile/sddm.nix;
  profile-ssh-server = import ./profile/ssh-server.nix;
  profile-unbound-dns = import ./profile/unbound-dns.nix;
  profile-xserver = import ./profile/xserver.nix;

  user-cole = import ./user/cole.nix;

  # Host specific user configurations
  user-garuda-cole = import ./user/garuda-cole.nix;
}