inputs @ {nixpkgs, ...}: {
  common = import ./common.nix;
  openssh = import ./openssh.nix;

  installer-sd-image-aarch64 = import "${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64.nix";
  
  virtualization-qemu-vm = import "${nixpkgs}/nixos/modules/virtualization/qemu-vm.nix";
  
  profile-qemu-guest = import "${nixpkgs}/nixos/modules/profiles/qemu-guest.nix";

  user-cole = import ./user/cole.nix;

  configuration-alexander-4 = import ./configuration/alexander-4/configuration.nix inputs;
  configuration-bahamut = import ./configuration/bahamut/configuration.nix inputs;
  configuration-garuda = import ./configuration/garuda/configuration.nix inputs;

  hardware-garuda = import ./hardware/garuda/hardware-configuration.nix;
}