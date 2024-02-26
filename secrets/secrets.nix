let
  ssh-keys = import ../ssh-keys.nix;

  inherit (ssh-keys) users hosts;
in {
  "telegraf.env.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-1
    hosts.alexander-2
    hosts.alexander-3
    hosts.alexander-4
    hosts.goblin
  ];

  "k3s-token.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-1
    hosts.alexander-2
    hosts.alexander-3
    hosts.alexander-4
    hosts.goblin
  ];
}
