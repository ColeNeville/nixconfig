{
  pkgs,
  config,
  ...
}: {
  config = {
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

      telegraf = {
        enable = true;

        environmentFiles = [
          config.age.secrets."telegraf.env".path
        ];
      };
    };

    age.secrets = {
      "telegraf.env" = {
        file = ../../../secrets/telegraf-alexander-1.env.age;
        owner = "telegraf";
        group = "telegraf";
      };
    };

    system = {
      stateVersion = "23.05";
    };
  };
  
}
