{
  pkgs,
  nixos-generators,
  ...
}: {
  imports = [
    nixos-generators.nixosModules.all-formats
  ];

  system = {
    stateVersion = "23.05";
  };
}
