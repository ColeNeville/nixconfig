{
  inputs,
  pkgs,
  ...
}: {
  config = {
    boot = {
      binfmt.emulatedSystems = ["aarch64-linux"];
    };

    networking = {
      hostName = "bahamut";

      networkmanager = {
        enable = true;
        dns = "unbound";
      };
    };

    services = {
      openssh = {
        enable = true;
      };

      unbound = {
        enable = true;
      };
    };

    time.timeZone = "America/Edmonton";

    proxmox.qemuConf = {
      cores = 4;
      memory = 8192;
      net0 = 
    };

    system = {
      stateVersion = "23.05";
    };
  };
}
