{ pkgs, inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.mixin-xserver
    self.nixosModules.mixin-sddm
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