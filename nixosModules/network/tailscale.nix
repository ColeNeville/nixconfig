{ inputs, ... }: 

let
  inherit (inputs) self;
in {
  imports = [
    self.nixosModules.profile-unbound-dns
  ];

  networking = {
    hosts = {
      "100.64.59.20" = [ "moogle.tailscale.coleslab.com" ];
    };
  };

  services.unbound = {
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
}