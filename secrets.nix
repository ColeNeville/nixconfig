let
  ssh-keys = import ./ssh-keys.nix;

  inherit (ssh-keys) users hosts;
in {
  "secrets/secret.age".publicKeys = [ users."cole@garuda" hosts.alexander-4 ];
}