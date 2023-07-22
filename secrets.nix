let
  ssh-keys = import ./ssh-keys.nix;

  inherit (ssh-keys) user host;
in {
  "secrets/secret.age".publicKeys = [ user."cole@garuda" host.alexander-4 ];
}