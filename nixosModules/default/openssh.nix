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
      alexander-ecdsa = {
        publicKey = hosts.alexander.ecdsa;
        hostNames = [
          "alexander"
          "alexander.local.coleslab.com"
        ];
      };

      alexander-ed25519 = {
        publicKey = hosts.alexander.ed25519;
        hostNames = [
          "alexander"
          "alexander.local.coleslab.com"
        ];
      };

      alexander-rsa = {
        publicKey = hosts.alexander.rsa;
        hostNames = [
          "alexander"
          "alexander.local.coleslab.com"
        ];
      };

      alexander-4-ed25519 = {
        publicKey = hosts.alexander-4.ed25519;
        hostNames = [
          "alexander-4"
          "alexander-4.local.coleslab.com"
        ];
      };

      alexander-4-rsa = {
        publicKey = hosts.alexander-4.rsa;
        hostNames = [
          "alexander-4"
          "alexander-4.local.coleslab.com"
        ];
      };

      moogle-ed25519 = {
        publicKey = hosts.moogle.ed25519;
        hostNames = [
          "moogle"
          "moogle.local.coleslab.com"
        ];
      };

      zodiark-ecdsa = {
        publicKey = hosts.zodiark.ecdsa;
        hostNames = [
          "zodiark"
          "zodiark.local.coleslab.com"
        ];
      };

      zodiark-ed25519 = {
        publicKey = hosts.zodiark.ed25519;
        hostNames = [
          "zodiark"
          "zodiark.local.coleslab.com"
        ];
      };

      zodiark-rsa = {
        publicKey = hosts.zodiark.rsa;
        hostNames = [
          "zodiark"
          "zodiark.local.coleslab.com"
        ];
      };
    };
  };
}
