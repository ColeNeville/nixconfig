{ lib, ... }:

{
  hosts = {
    bismark = import ./hosts/bismark;
    garuda = import ./hosts/garuda;
  };

  mixins = {
    bluetooth = import ./mixins/bluetooth;
    common = import ./mixins/common;
    sddm = import ./mixins/sddm;
    xserver = import ./mixins/xserver;
  };

  profiles = {
    plasma = import ./profiles/plasma;
  };

  users = {
    cole-full = import ./users/cole-full;
    cole-minimal = import ./users/cole-minimal;
  };
}