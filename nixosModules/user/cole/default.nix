{
  config,
  pkgs,
  lib,
  ...
}: {
  nix.settings.trusted-users = ["cole"];

  programs.zsh.enable = lib.mkDefault true;

  users = {
    mutableUsers = false;

    users.cole = {
      isNormalUser = lib.mkDefault true;
      description = lib.mkDefault "Cole Neville";
      shell = pkgs.zsh;

      hashedPassword = lib.mkDefault "$y$j9T$.fpKr9pL/OY4p7zjtwea/.$mDEURj5i6qPOBkAulhR57HEQfszhEa5oXJMYy8mYVe1";

      extraGroups = lib.mkDefault [
        "audio"
        "dialout"
        "docker"
        "networkmanager"
        "video"
        "wheel"
        "wireshark"
        "libvirtd"
      ];

      openssh.authorizedKeys.keys = lib.mkDefault [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJa1fSHeIjPVJKo5fR8pNH7spyS324zqUlZ2U1BLj7Zm cole@garuda" # /home/cole/.ssh/id_nixos on Garuda
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKsrXiGWbX/y88AVjIca34xGv6Wm6RPgqhrpn8PG02yQ cardno:24_733_178" # GPG auth key stored on Yubikey
      ];
    };
  };
}
