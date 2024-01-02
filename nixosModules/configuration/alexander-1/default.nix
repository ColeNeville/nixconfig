{
  pkgs,
  lib,
  config,
  ...
}: {
  config = {
    boot = {
      initrd.includeDefaultModules = true;

      # Reverting to the mainline kernel over the rpi specific kernel specified
      # in the nixos-hardware module
      kernelPackages = pkgs.linuxPackages;

      kernelParams = [
        "console=ttyS1,115200n8"
      ];
    };

    hardware = {
      raspberry-pi = {
        "4" = {
          # This options is from the hardware module:
          # https://github.com/NixOS/nixos-hardware/blob/c2bbfcfc3d12351919f8df7c7d6528f41751d0a3/raspberry-pi/4/pkgs-overlays.nix
          apply-overlays-dtmerge.enable = true;
        };
      };
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

      k3s = {
        enable = true;

        role = "agent";

        serverAddr = "https://alexander-4.local.coleslab.com:6443";
        tokenFile = config.age.secrets."k3s-token".path;
      };
    };

    age.secrets = {
      "telegraf.env" = {
        file = ../../../secrets/telegraf-alexander-1.env.age;
        owner = "telegraf";
        group = "telegraf";
      };

      "k3s-token" = {
        file = ../../../secrets/k3s-token.age;
        owner = "root";
        group = "root";
      };
    };

    system = {
      stateVersion = "23.05";
    };
  };
}
