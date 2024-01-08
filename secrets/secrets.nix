let
  ssh-keys = import ../ssh-keys.nix;

  inherit (ssh-keys) users hosts;
in {
  "telegraf.env.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-1.ed25519
    hosts.alexander-2.ed25519
    # hosts.alexander-3.ed25519
    hosts.alexander-4.ed25519
    # hosts.chocobo.ed25519
  ];

  "k3s-token.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-1.ed25519
    hosts.alexander-2.ed25519
    hosts.alexander-4.ed25519
    # hosts.chocobo.ed25519
  ];
}
