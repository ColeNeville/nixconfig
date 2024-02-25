{lib, ...}: let
  ssh-keys = import ../../ssh-keys.nix;
  inherit (ssh-keys) hosts;
in {
  services.openssh = {
    settings = {
      PasswordAuthentication = lib.mkDefault false;
      PermitRootLogin = lib.mkDefault "no";
    };

    knownHosts = {
      alexander = {
        publicKey = hosts.alexander;
        hostNames = [
          "alexander"
          "alexander.local.coleslab.com"
        ];
      };

      alexander-1 = {
        publicKey = hosts.alexander-1;
        hostNames = [
          "alexander-1"
          "alexander-1.local.coleslab.com"
        ];
      };

      alexander-2 = {
        publicKey = hosts.alexander-2;
        hostNames = [
          "alexander-2"
          "alexander-2.local.coleslab.com"
        ];
      };

      alexander-3 = {
        publicKey = hosts.alexander-3;
        hostNames = [
          "alexander-3"
          "alexander-3.local.coleslab.com"
        ];
      };

      alexander-4 = {
        publicKey = hosts.alexander-4;
        hostNames = [
          "alexander-4"
          "alexander-4.local.coleslab.com"
        ];
      };

      moogle = {
        publicKey = hosts.moogle;
        hostNames = [
          "moogle"
          "moogle.local.coleslab.com"
        ];
      };

      zodiark = {
        publicKey = hosts.zodiark;
        hostNames = [
          "zodiark"
          "zodiark.local.coleslab.com"
        ];
      };
    };
  };
}
