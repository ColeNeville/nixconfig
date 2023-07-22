{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (inputs) self;
  ssh-keys = import ../../ssh-keys.nix;
in {
  imports = [
    ./user.nix
    ./plasma.nix
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
        dates = "weekly";
        options = "--delete-older-than 14d";
      };

      extraOptions = ''
        min-free = ${toString (100 * 1024 * 1024)}
        max-free = ${toString (1024 * 1024 * 1024)}
      '';
    };

    nixpkgs = {
      overlays = builtins.attrValues self.overlays;
      config.allowUnfree = pkgs.config.allowUnfree;
    };

    system.autoUpgrade = {
      enable = true;
      flake = "github:coleneville/nixconfig/main";
      persistent = true;

      dates = "daily";
      randomizedDelaySec = "1h";

      allowReboot = true;
      rebootWindow = {
        lower = "01:00";
        upper = "05:00";
      };
    };

    services.openssh = {
      settings = {
        PasswordAuthentication = lib.mkDefault false;
        PermitRootLogin = lib.mkDefault "no";
      };

      knownHosts = ssh-keys.knownHosts;
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
        zsh
      ];
    };

    programs.dconf.enable = true;

    security.rtkit.enable = true;
  };
}
