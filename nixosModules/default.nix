inputs: {
  default = import ./default;

  user-cole = import ./user/cole;
  user-cole-garuda = import ./user/cole-garuda;

  configuration-alexander-4 = import ./configuration/alexander-4;
  configuration-bahamut = import ./configuration/bahamut;
  configuration-garuda = import ./configuration/garuda;

  hardware-garuda = import ./hardware/garuda;

  home-cole-garuda = import ./home/cole-garuda;
}
