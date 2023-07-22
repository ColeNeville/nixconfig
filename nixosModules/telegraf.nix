{ config, lib, ... }: let
  cfg = config.services.telegraf;
in {
  config = lib.mkIf cfg.enable {
    # Default telegraf configuration if telegraf service is enabled
    services.telegraf = {
      extraConfig = {
        agent = {
          interval = lib.mkDefault "10s";
          round_interval = lib.mkDefault true;
          metric_batch_size = lib.mkDefault 1000;
          metric_buffer_limit = lib.mkDefault 10000;
          collection_jitter = lib.mkDefault "0s";
          flush_interval = lib.mkDefault "10s";
          precision = lib.mkDefault "";
          debug = lib.mkDefault false;
          quiet = lib.mkDefault false;
          logfile = lib.mkDefault "";
          hostname = lib.mkDefault "";
          omit_hostname = lib.mkDefault false;
        };

        outputs.influxdb_v2 = {
          urls = lib.mkDefault ["http://influxdb.coleslab.com"];
          token = lib.mkDefault "$INFLUX_TOKEN";
          organization = lib.mkDefault "Cole's Lab";
          bucket = lib.mkDefault "System Metrics";
        };

        inputs.cpu = lib.mkDefault {
          percpu = lib.mkDefault true;
          totalcpu = lib.mkDefault true;
          collect_cpu_time = lib.mkDefault false;
          report_active = lib.mkDefault false;
        };

        inputs.disk = lib.mkDefault {
          ignore_fs = lib.mkDefault ["tmpfs" "devtmpfs" "devfs" "overlay" "aufs" "squashfs"];
        };

        inputs.diskio = lib.mkDefault {};
        inputs.mem = lib.mkDefault {};
        inputs.net = lib.mkDefault {};
        inputs.processes = lib.mkDefault {};
        inputs.swap = lib.mkDefault {};
        inputs.system = lib.mkDefault {};
      };
    };
  };
}