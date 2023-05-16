{ pkgs, ... }:

{
  environment.systemPackages =
    with pkgs; [
      # Browsers
      chromium
      brave
      firefox

      # Development
      arduino
      emacs
      i2c-tools
      vscode
      platformio

      # platformio

      # Media
      spotify
      vlc

      # Games
      moonlight-qt

      # CAD
      fritzing
      freecad
      openscad
      kicad

      # Graphics
      krita
      gimp
      inkscape
      fontforge

      # 3D Printing
      cura
      prusa-slicer
      printrun

      # Communications
      discord
      keybase
      keybase-gui
      thunderbird

      # Networking
      nmap
      wireshark
      putty

      # Programming
      (python311.withPackages(ps: with ps; [ pip virtualenv ]))

      # Virtual Machines
      virt-viewer
      virt-manager

      # Misc Applications
      neofetch
      autokey
      bitwarden
      archiver
      avidemux
      rpi-imager

      # Random Utils
      htop
      virtualbox
      nfs-utils
      ark
      nix-index
      kubectl
      kubernetes-helm
      cifs-utils

      libsForQt5.ksshaskpass
    ];

    programs = {
      zsh.enable = true;
      command-not-found.enable = true;
    };

    xdg.mime = {
      enable = true;
    };
}