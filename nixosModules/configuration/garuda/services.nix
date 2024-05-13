{ pkgs, ... }:

{
  config = {
    services = {
      gvfs = {
        enable = true;
        package = pkgs.gnome3.gvfs;
      };

      # pipewire = {
      #   enable = true;

      #   alsa = {
      #     enable = true;
      #     support32Bit = true;
      #   };

      #   pulse.enable = true;
      # };

      fwupd.enable = true;
      fprintd.enable = true;

      power-profiles-daemon.enable = true;

      tailscale.enable = true;
      printing.enable = true;

      unbound = {
        enable = true;

        settings = {
          forward-zone = [
            {
              name = "local.coleslab.com";
              forward-addr = "100.64.59.20";
            }
            {
              name = "alexander.coleslab.com";
              forward-addr = "100.64.59.20";
            }
          ];
        };
      };

      flatpak.enable = true;
      packagekit.enable = true;
      keybase.enable = true;

      guix.enable = true;

      avahi = {
        enable = true;
        nssmdns = true;
        openFirewall = true;
      };
    };
  };
}
