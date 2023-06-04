{ ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.mixins.xserver
    self.nixosModules.mixins.sddm
  ];

  services.xserver = {
    displayManager = {
      defaultSession = "plasma";
    };

    desktopManager.plasma5.enable = true;
  };
}