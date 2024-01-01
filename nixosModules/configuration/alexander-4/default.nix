{config, ...}: {
  config = {
    boot = {
      initrd.includeDefaultModules = false;

      kernelParams = [
        "console=serial0,115200n8"
      ];
    };

    hardware = {
      raspberry-pi = {
        "4" = {
          # This options is from the hardware module:
          # https://github.com/NixOS/nixos-hardware/blob/c2bbfcfc3d12351919f8df7c7d6528f41751d0a3/raspberry-pi/4/pkgs-overlays.nix
          apply-overlays-dtmerge = true;
        };
      };
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

      telegraf = {
        enable = true;

        environmentFiles = [
          config.age.secrets."telegraf.env".path
        ];
      };
    };

    age.secrets = {
      "telegraf.env" = {
        file = ../../../secrets/telegraf-alexander-4.env.age;
        owner = "telegraf";
        group = "telegraf";
      };
    };

    system = {
      stateVersion = "23.05";
    };
  };
}
