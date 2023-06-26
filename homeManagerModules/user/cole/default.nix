{ inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.homeManagerModules.profile-common
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
  };

  services = {
    gpg-agent = {
      enable = true;

      enableSshSupport = true;
      enableZshIntegration = true;
      pinentryFlavor = "qt";
    };
  };

  home = {
    stateVersion = "22.11";
  };
}