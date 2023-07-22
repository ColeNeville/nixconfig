{
  pkgs,
  config,
  ...
}: {
  boot = {
    initrd.includeDefaultModules = false;
  };

  security = {
    sudo = {
      execWheelOnly = true;
    };
  };

  networking = {
    hostName = "alexander-1";
  };

  services = {
    openssh = {
      enable = true;
    };
  };

  system = {
    stateVersion = "23.05";
  };
}
