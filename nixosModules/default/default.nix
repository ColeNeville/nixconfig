{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) self;

  ssh-keys = import ../../ssh-keys.nix;
  autoUpgradeConfig = config.nixconfig.autoUpgrade;
in {
  imports = [
    ./user.nix
    ./plasma.nix
    ./openssh.nix
  ];

  config = {
    nix = {
      settings = {
        auto-optimise-store = true;

        experimental-features = lib.mkDefault [
          "flakes"
          "nix-command"
        ];
      };

      # Used this example to sync flake registry and nix channels
      # https://github.com/LongerHV/nixos-configuration/blob/85a1b6be47ebe13f600c3e4e2ebb792c1272e856/modules/nixos/mySystem/default.nix#L54-L55
      registry = lib.mapAttrs (_: value: {flake = value;}) inputs;
      nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;

      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 7d";
      };

      extraOptions = ''
        min-free = ${toString (100 * 1024 * 1024)}
        max-free = ${toString (1024 * 1024 * 1024)}
      '';
    };

    environment = {
      defaultPackages = with pkgs; [
        custom.default
      ];

      systemPackages = with pkgs; [
        cifs-utils # SMB mounts
        htop
        nfs-utils
        uucp # cu command
      ];

      shells = with pkgs; [
        bash
        zsh
      ];
    };

    programs.dconf.enable = lib.mkDefault true;
    
    security = {
      rtkit.enable = lib.mkDefault true;

      sudo = {
        execWheelOnly = true;
      };
    };

    time.timeZone = lib.mkDefault "America/Edmonton";

    system = {
      autoUpgrade = {
        enable = lib.mkDefault true;
        flake = "github:coleneville/nixconfig/main";
        persistent = lib.mkDefault true;

        dates = lib.mkDefault "23:00";
        randomizedDelaySec = lib.mkDefault "5h";

        allowReboot = lib.mkDefault true;
        rebootWindow = {
          lower = lib.mkDefault "23:00";
          upper = lib.mkDefault "06:00";
        };
      };

      stateVersion = "22.11";
    };
  };

  
}
