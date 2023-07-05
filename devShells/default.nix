{pkgs, ...}: {
  default = import ./nixos {inherit pkgs;};
  nixos = import ./nixos {inherit pkgs;};
}
