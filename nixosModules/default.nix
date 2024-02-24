inputs: {
  build = import ./build.nix;
  default = import ./default;
  # Doesn't do anything on its own only adds things if telegraf is enabled
  telegraf = import ./telegraf.nix;

  configuration-alexander-1 = import ./configuration/alexander-1;
  configuration-alexander-2 = import ./configuration/alexander-2;
  configuration-alexander-3 = import ./configuration/alexander-3;
  configuration-alexander-4 = import ./configuration/alexander-4;
  configuration-bahamut = import ./configuration/bahamut;
  configuration-chocobo = import ./configuration/chocobo;
  configuration-garuda = import ./configuration/garuda;
  configuration-ozma = import ./configuration/ozma;

  hardware-garuda = import ./hardware/garuda;
  hardware-goblin = import ./hardware/goblin;

  virtualisation-proxmox-vm = import ./virtualisation/proxmox-vm.nix;
}
