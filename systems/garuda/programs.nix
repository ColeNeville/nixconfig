{ pkgs, inputs, ... }:

let
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowUnfree = pkgs.config.allowUnfree;
  };
in {
  environment.systemPackages =
    with pkgs; [
      # Media
      spotify
      vlc

      # Games
      moonlight-qt

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
      virtualbox
      ark
      nix-index
      kubectl
      kubernetes-helm
    ];
}