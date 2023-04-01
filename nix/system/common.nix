{ pkgs, ... }:

{
  environment.systemPackages = 
    with pkgs; [
      curl
      coreutils
      git
      git-crypt
      util-linux
      wget
    ];

  nix = {
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };
}