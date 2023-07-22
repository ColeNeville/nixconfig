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
    hostName = "alexander-4";
  };

  services = {
    openssh = {
      enable = true;
    };
  };

  age.secrets = {
    secret = {
      file = ../../../secrets/secret.age;
    };
  };

  system = {
    stateVersion = "23.05";
  };
}
