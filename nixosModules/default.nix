inputs @ {nixpkgs, ...}: {
  common = import ./common.nix;
  openssh = import ./openssh.nix;

  installer-sd-image-aarch64 = import "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix";
  
  virtualization-qemu-vm = import "${nixpkgs}/nixos/modules/virtualization/qemu-vm.nix";
  
  profile-qemu-guest = import "${nixpkgs}/nixos/modules/profiles/qemu-guest.nix";

  user-cole = import ./user/cole.nix;

  configuration-bahumut = import ./configuration/bahumut/configuration.nix inputs;
  configuration-garuda = import ./configuration/garuda/configuration.nix inputs;
}
