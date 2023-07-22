let
  ssh-keys = import ../ssh-keys.nix;

  inherit (ssh-keys) users hosts;
in {
  "secret.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-4.ed25519
    hosts.alexander-4.rsa
  ];
}