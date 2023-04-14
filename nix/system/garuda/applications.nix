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
      python311

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
      helm
    ];

    programs = {
      zsh.enable = true;
      command-not-found.enable = true;
    };

    xdg.mime = {
      enable = true;
    };
}