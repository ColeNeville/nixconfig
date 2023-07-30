{...}: {
  config = {
    networking = {
      hostName = "ozma";

      networkmanager = {
        enable = true;
        dns = "unbound";
      };
    };

    services = {
      unbound = {
        enable = true;
      };
    };

    system = {
      stateVersion = "23.05";
    };
  };
}
