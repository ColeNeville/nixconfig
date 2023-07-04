{pkgs}: {
  nixos-fetch-config = import ./nixos-fetch-config {inherit pkgs;};
  nixos-build-config = import ./nixos-build-config {inherit pkgs;};
}
