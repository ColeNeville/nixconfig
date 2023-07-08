{nixos-generators, ...}: {pkgs, ...}: {
  imports = [
    nixos-generators.nixosModules.all-formats

    self.nixosModules.common
    self.nixosModules.openssh
    self.nixosModules.user-cole
  ];

  system = {
    stateVersion = "23.05";
  };
}
