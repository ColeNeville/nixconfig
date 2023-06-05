{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.homeManagerModules.mixins.common
  ];

  programs = {
    git = {
      enable = true;

      userEmail = "colewneville2@gmail.com";
      userName = "ColeNeville";
    };

    zsh = {
      enable = true;

      oh-my-zsh = {
        enable = true;
      };
    };

    command-not-found.enable = true;
    
    gpg = {
      enable = true;
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
      enableZshIntegration = true;
    };
  };

  home = {
    stateVersion = "22.11";
  };
}