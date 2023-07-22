{ config, lib, ... }: let
  cfg = config.service.telegraf;
in {
  options = {
    service.telegraf = {
      extraArg = lib.mkOption {
        default = "$TELEGRAF_OPTS";
        type = lib.types.string;
      };
    };
  };

  config = lib.mkIf config.services.telegraf.enable {
    systemd.services.telegraf.serviceConfig = {
      ExecStart = config.systemd.services.telegraf.serviceConfig.ExecStart + " ${cfg.extraArg}";
    };
  };
}