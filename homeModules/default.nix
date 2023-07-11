inputs @ {nixpkgs, ...}: {
  configuration-cole-garuda = import ./configuration/cole-garuda inputs;
}
