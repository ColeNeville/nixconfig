{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (inputs) self;
  ssh-keys = import ../../ssh-keys.nix;
in {
  options.nixconfig = {
    homeManager = {
      enable = lib.mkEnableOption "Enable Home Manager";
    };
  };

  config = {
    nixconfig.homeManager.enable = lib.mkDefault true;
    nix.settings.trusted-users = ["cole"];

    users = {
      mutableUsers = lib.mkDefault false;
      defaultUserShell = pkgs.fish;

      users.cole = {
        isNormalUser = true;
        hashedPassword = lib.mkDefault "$y$j9T$.fpKr9pL/OY4p7zjtwea/.$mDEURj5i6qPOBkAulhR57HEQfszhEa5oXJMYy8mYVe1";

        extraGroups = [
          "wheel"
          "networkmanager"
          "audio"
          "video"
          "dialout"
          "tty"
          "disk"
          "uucp"
          "docker"
          "vboxusers"
          "libvirtd"
          "scanner"
        ];

        openssh.authorizedKeys.keys = lib.mkDefault [
          ssh-keys.users."cardno:24_733_178"
        ];
      };
    };

    home-manager = lib.mkIf config.nixconfig.homeManager.enable {
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = {inherit inputs;};
      users.cole = import ./home.nix;
    };

    programs.zsh.enable = true;
  };
}
