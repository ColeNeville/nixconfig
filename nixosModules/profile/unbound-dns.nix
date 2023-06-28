{ ... }:

{
  networking = {
    networkmanager = {
      enable = true;
      dns = "unbound";
    };
  };

  services.unbound = {
    enable = true;
  };
}