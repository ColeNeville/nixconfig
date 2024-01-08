{
    pkgs,
    lib,
    config,
    ...
}: {
  config = {
    networking = {
      hostName = "chocobo";

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
        serverAddr = "https://alexander-4.local.coleslab.com";
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

    proxmox.qemuConf = {
      cores = 4;
      memory = 8192;
    };

    system = {
      stateVersion = "23.05";
    };
  };
}