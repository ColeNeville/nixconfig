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
        enable = false;

        environmentFiles = [
          config.age.secrets."telegraf.env".path
        ];
      };

      k3s = {
        enable = false;

        role = "agent";
        serverAddr = "https://192.168.73.53:6443";
        tokenFile = config.age.secrets."k3s-token".path;
      };
    };

    system = {
      stateVersion = "23.05";
    };
  };
}
