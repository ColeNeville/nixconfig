{ pkgs, inputs, ... }:


let
  inherit (inputs) self home-manager;
in {
  imports = [
    home-manager.nixosModules.home-manager
  ];

  nix.settings.trusted-users = [ "cole" ];

  programs.zsh.enable = true;

  users.users.cole = {
    isNormalUser = true;
    description = "Cole Neville";
    shell = pkgs.zsh;

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

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users = {
      cole = {
        imports = [
          self.homeManagerModules.users.cole
        ];
      };
    };
    extraSpecialArgs = { inherit inputs; };
  };

}