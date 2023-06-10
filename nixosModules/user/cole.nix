{ pkgs, inputs, ... }:


let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.mixins.home-manager
  ];

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

  home-manager = {
    users = {
      cole = {
        imports = [
          self.homeModules.users.cole
        ];
      };
    };
  };
}