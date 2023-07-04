{
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

  nix = {
    settings = {
      # autoOptimiseStore = true;
    };

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };

    extraOptions = ''
      min-free = ${toString (100 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
  };

  system = {
    stateVersion = "23.05";
  };
}
