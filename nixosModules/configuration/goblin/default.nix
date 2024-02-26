{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  config = {
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

    systemd = {
      services = {
        ollama = {
          wantedBy = [ "multi-user.target" ];
          description = "Server for local large language models";
          after = [ "network.target" ];
          environment = {
            HOME = "%S/ollama";
            OLLAMA_MODELS = "%S/ollama/models";
            OLLAMA_HOST = "127.0.0.1:11434";
          };
          serviceConfig = {
            ExecStart = "${lib.getExe pkgs.ollama} serve";
            WorkingDirectory = "/var/lib/ollama";
            StateDirectory = [ "ollama" ];
            DynamicUser = true;
          };
        };
      };
    };

    environment.systemPackages = with pkgs; [
      ollama
    ];

    system = {
      stateVersion = "23.11";
    };
  };
}
