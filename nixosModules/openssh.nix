{lib, ...}: {
  services.openssh = {
    enable = lib.mkDefault true;

    settings = {
      PermitRootLogin = lib.mkDefault "no";
      PasswordAuthentication = lib.mkDefault false;
    };
  };
}
