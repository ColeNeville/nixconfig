{
  pkgs,
  config,
  ...
}: {
  security = {
    sudo = {
      execWheelOnly = true;
    };
  };

  networking = {
    hostName = "alexander-4";
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
