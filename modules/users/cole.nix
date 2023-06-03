{ inputs, ... }:


let
  inherit (inputs) self;
in {
  imports = with self.nixosModules; [
    groups.common
  ];

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