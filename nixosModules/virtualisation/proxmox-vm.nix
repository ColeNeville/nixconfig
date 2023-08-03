{ inputs, config, ... }: let
  inherit (inputs) nixpkgs;
in {
  imports = [
    "${nixpkgs}/nixos/modules/virtualisation/proxmox-image.nix"
  ];

  config = {
    proxmox.qemuConf = {
      name = config.networking.hostName;

      bios="ovmf";
      agent = true;
      net0 = "virtio=00:00:00:00:00:00,bridge=vmbr0,tag=75,firewall=1";
    };

    services.qemuGuest.enable = true;
  };
}