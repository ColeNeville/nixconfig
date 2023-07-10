{
  self,
  nixos-generators,
  ...
}: {
  pkgs,
  ...
}: {
  imports = [
    self.nixosModules.common
    self.nixosModules.user-cole
  ];

  boot = {
    binfmt.emulatedSystems = [ "aarch64-linux" ];
  };

  networking = {
    hostName = "bahamut";

    networkmanager = {
      enable = true;
      dns = "unbound";
    };
  };

  services = {
    unbound = {
      enable = true;
    };
  };

  time.timeZone = "America/Edmonton";

  system = {
    stateVersion = "23.05";
  };
}
