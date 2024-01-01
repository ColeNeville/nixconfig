{
  pkgs,
  config,
  ...
}: {
  config = {
    boot = {
      initrd.includeDefaultModules = false;

      # Reverting to the mainline kernel over the rpi specific kernel specified
      # in the nixos-hardware module
      kernelPackages = pkgs.linuxPackages;

      kernelParams = [
        "console=ttyS1,115200n8"
      ];
    };

    security = {
      sudo = {
        execWheelOnly = true;
      };
    };

    networking = {
      hostName = "alexander-2";
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
        file = ../../../secrets/telegraf-alexander-2.env.age;
        owner = "telegraf";
        group = "telegraf";
      };
    };

    system = {
      stateVersion = "23.05";
    };
  };
}
