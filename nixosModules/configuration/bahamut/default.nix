{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) self;
in {
  boot = {
    binfmt.emulatedSystems = ["aarch64-linux"];
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
