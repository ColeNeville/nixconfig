{
  inputs,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (inputs) self;
  ssh-keys = import ../../ssh-keys.nix;

  cfg = config.custom;
in {
  options.custom = {
    user = lib.mkOption {
      default = "cole";
      type = lib.types.str;
    };
    home-manager = {
      enable = lib.mkEnableOption "home-manager"; # Enable home-manager based on this custom option
      home = lib.mkOption {
        default = ./home.nix;
        type = lib.types.path;
      };
    };
  };

  config = {
    nix.settings.trusted-users = ["${cfg.user}"];
    users = {
      mutableUsers = lib.mkDefault false;
      defaultUserShell = pkgs.zsh;

      users.${cfg.user} = {
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
          ssh-keys.users."cole@garuda"
          ssh-keys.users."cardno:24_733_178"
        ];
      };
    };

    home-manager = lib.mkIf cfg.home-manager.enable {
      useGlobalPkgs = lib.mkDefault true;
      useUserPackages = lib.mkDefault true;
      extraSpecialArgs = {inherit inputs;};
      users.${cfg.user} = import cfg.home-manager.home;
    };

    programs.zsh.enable = true;
  };
}
