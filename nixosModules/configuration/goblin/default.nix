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
        extraFlags = "--disable=servicelb";
        serverAddr = "https://192.168.73.53:6443";
        tokenFile = config.age.secrets."k3s-token".path;
      };

      logind = {
        lidSwitch = "ignore";
        rebootKey = "ignore";
        suspendKey = "ignore";
        hibernateKey = "ignore";
      };

      ollama = {
        enable = true;
        listenAddress = "0.0.0.0:11434";
        acceleration = "cuda";
        # This needs to be unstabled while this ollama service section is not in
        # the nixpkgs stable channel
        package = pkgs.unstable.ollama;
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

    # systemd = {
    #   services = {
    #     ollama = {
    #       wantedBy = [ "multi-user.target" ];
    #       description = "Server for local large language models";
    #       after = [ "network.target" ];
    #       environment = {
    #         HOME = "%S/ollama";
    #         OLLAMA_MODELS = "%S/ollama/models";
    #         OLLAMA_HOST = "127.0.0.1:11434";
    #       };
    #       serviceConfig = {
    #         ExecStart = "${lib.getExe pkgs.ollama} serve";
    #         WorkingDirectory = "/var/lib/ollama";
    #         StateDirectory = [ "ollama" ];
    #         DynamicUser = true;
    #       };
    #     };
    #   };
    # };

    # environment.systemPackages = with pkgs; [
    #   ollama
    # ];

    system = {
      stateVersion = "23.11";
    };
  };
}
