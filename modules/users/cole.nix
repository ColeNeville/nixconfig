{ pkgs, inputs, ... }:


let
  inherit (inputs) self;
in {
  nix.settings.trusted-users = [ "cole" ];

  programs.zsh.enable = true;

  users.users.cole = {
    isNormalUser = true;
    description = "Cole Neville";
    shell = pkgs.zsh;

    extraGroups = [
      "audio"
      "dialout"
      "docker"
      "networkmanager"
      "video"
      "wheel"
      "wireshark"
    ];
  };
}