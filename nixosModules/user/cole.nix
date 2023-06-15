{ pkgs, inputs, ... }:


let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.mixin-home-manager
  ];

  nix.settings.trusted-users = [ "cole" ];

  programs.zsh.enable = true;

  services.openssh = {
    enable = true;

    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "yes";
    };
  };

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

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJa1fSHeIjPVJKo5fR8pNH7spyS324zqUlZ2U1BLj7Zm cole@garuda" # /home/cole/.ssh/id_nixos on Garuda
    ];
  };

  home-manager = {
    users = {
      cole = {
        imports = [
          self.homeManagerModules.user-cole
        ];
      };
    };
  };
}