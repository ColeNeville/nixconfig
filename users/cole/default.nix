{ ... }:

{
  fonts.fontconfig.enable = true;

  programs = {
    git = {
      enable = true;

      userEmail = "colewneville2@gmail.com";
      userName = "ColeNeville";
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

    keybase = {
      enable = true;
    };

    kbfs = {
      enable = true;
    };
  };

  xdg = {
    mimeApps = {
      enable = true;

      defaultApplications = {
        "video/mp4" = "vlc.desktop";
        "application/x-yaml" = "code.desktop";
      };
    };

    configFile = {
      "autostart-scripts/ssh-add.sh" = {
        source = ./.config/autostart-scripts/ssh-add.sh;
        executable = true;
      };
    };
  };

  home = {
    stateVersion = "22.11";
  };
}