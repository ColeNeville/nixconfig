{ pkgs, ... }:

{
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = 
    with pkgs; [
      curl
      coreutils
      dig
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