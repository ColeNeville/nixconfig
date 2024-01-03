let
  ssh-keys = import ../ssh-keys.nix;

  inherit (ssh-keys) users hosts;
in {
  "telegraf-alexander-1.env.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-1.ed25519
    hosts.alexander-1.rsa
  ];

  "telegraf-alexander-2.env.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-2.ed25519
    hosts.alexander-2.rsa
  ];

  "telegraf-alexander-3.env.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-3.ed25519
    hosts.alexander-3.rsa
  ];

  "telegraf-alexander-4.env.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-4.ed25519
    hosts.alexander-4.rsa
  ];

  # "github-token.age".publicKeys = [
  #   users."cole@garuda"
  #   users."cardno:24_733_178"
  #   hosts.garuda.ed25519
  # ];

  "k3s.env.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-1.ed25519
    hosts.alexander-1.rsa
    hosts.alexander-4.ed25519
    hosts.alexander-4.rsa
  ];

  "k3s-token.age".publicKeys = [
    users."cole@garuda"
    hosts.alexander-1.ed25519
    hosts.alexander-1.rsa
    hosts.alexander-4.ed25519
    hosts.alexander-4.rsa
  ];
}
