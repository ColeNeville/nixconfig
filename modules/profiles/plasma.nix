{ pkgs, inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.mixins.xserver
    self.nixosModules.mixins.sddm
  ];

  environment.systemPackages = [
    pkgs.libsForQt5.ksshaskpass
  ];

  services.xserver = {
    displayManager = {
      defaultSession = "plasma";
    };

    desktopManager.plasma5.enable = true;
  };
}