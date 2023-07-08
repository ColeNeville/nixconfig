{pkgs, ...}: {
  defaultEnv = pkgs.buildEnv {
    name = "default";
    paths = with pkgs; [
      coreutils
      curl
      dig
      git
      git-crypt
      gnumake # make command
      gnupg
      nano
      util-linux
      usbutils # lsusb command
      wget
      which
    ];
  };

  nixos-fetch-config = import ./nixos-fetch-config {inherit pkgs;};
  nixos-build-config = import ./nixos-build-config {inherit pkgs;};
}
