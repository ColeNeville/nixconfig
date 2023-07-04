{pkgs, ...}: {
  nix = {
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    cifs-utils # SMB mounts
    coreutils
    curl
    dig
    git
    git-crypt
    gnumake # make command
    gnupg
    htop
    nfs-utils
    util-linux
    usbutils # lsusb command
    uucp # cu command
    wget

    custom.nixos-fetch-config
    custom.nixos-build-config
  ];
}
