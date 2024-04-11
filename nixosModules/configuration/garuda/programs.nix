{ pkgs, ... }:

{
  config = {
    programs = {
      xfconf.enable = true; # Xfce settings
    };

    environment.systemPackages = with pkgs; [
      xorg.xauth
      libvterm

      polkit

      bluez-alsa
      bluez-tools

      home-manager

      fw-ectool
    ];
  };
}
