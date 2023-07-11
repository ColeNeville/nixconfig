{nixos-generators, ...}: {
  pkgs,
  config,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_rpi4;
    initrd.availableKernelModules = ["usbhid" "usb_storage"];
  };

  security = {
    sudo = {
      execWheelOnly = true;
    };
  };

  networking = {
    hostName = "alexander-4";

    networkmanager = {
      enable = true;
      dns = "unbound";
    };
  };

  services = {
    unbound = {
      enable = true;
    };

    openssh = {
      enable = true;

      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
  };

  system = {
    stateVersion = "23.05";
  };
}
