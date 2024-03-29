{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.nixconfig.plasma;
in {
  options.nixconfig = {
    plasma = {
      enable = lib.mkEnableOption "plasma";
    };
  };

  config = lib.mkIf cfg.enable {
    environment = {
      systemPackages = with pkgs; [
        kitty

        libsForQt5.ksshaskpass
      ];
    };

    services.xserver = {
      enable = true;
      layout = "us";

      displayManager = {
        sddm.enable = true;
        defaultSession = "plasma";
      };

      desktopManager.plasma5.enable = true;
    };

    programs = {
      kdeconnect = {
        enable = true;
      };
    };
  };
}
