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
  };

  services = {
    openssh = {
      enable = true;
    };
  };

  system = {
    stateVersion = "23.05";
  };
}
