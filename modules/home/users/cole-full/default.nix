{ pkgs, inputs, ... }:

let
  inherit (inputs) self;
in {
  imports = [
    self.homeManagerModules.users.cole-minimal
  ];

  home.packages = with pkgs; [
    brave
  ];

  programs = {
    alacritty = {
      enable = true;
    };
    
    gpg = {
      enable = true;
    };

    bash = {
      enable = true;
      sessionVariables = {
        KUBECONFIG = "$HOME/.kube/kubeconfig";
        SSH_ASKPASS = "/run/current-system/sw/bin/ksshaskpass";
      };
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };
  };


  xdg = {
    configFile = {
      "alacritty.yml" = {
        source = ./.config/alacritty.yml;
      };

      "autostart-scripts/ssh-add.sh" = {
        source = ./.config/autostart-scripts/ssh-add.sh;
        executable = true;
      };
    };

    mimeApps = {
      enable = true;

      defaultApplications = {
        "video/mp4" = "vlc.desktop";
        "application/x-yaml" = "code.desktop";

        "x-scheme-handler/https" = "brave.desktop";
        "x-scheme-handler/about" = "brave.desktop";
        "x-scheme-handler/unknown" = "brave.desktop";
      };
    };
  };
}