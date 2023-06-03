{ inputs, ... }:


let
  inherit (inputs) self;
in {
  nix.settings.trusted-users = [ "cole" ];

  users.users.cole = {
    isNormalUser = true;
    description = "Cole Neville";

    extraGroups = [
      "audio"
      "dialout"
      "docker"
      "networkmanager"
      "video"
      "wheel"
      "wireshark"
    ];
  };
}