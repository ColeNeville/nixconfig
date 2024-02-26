{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  config = {
    custom = {};

    boot = {
      loader = {
        systemd-boot.enable = true;

        efi = {
          canTouchEfiVariables = true;
          efiSysMountPoint = "/boot";
        };
      };
    };

    security = {
      sudo = {
        execWheelOnly = true;
      };
    };

    networking = {
      hostName = "goblin";

      firewall.enable = false;
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

        role = "server";
        serverAddr = "https://192.168.73.53:6443";
        tokenFile = config.age.secrets."k3s-token".path;
      };
    };

    age.secrets = {
      "telegraf.env" = {
        file = ../../../secrets/telegraf.env.age;
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
      stateVersion = "23.11";
    };
  };
}
