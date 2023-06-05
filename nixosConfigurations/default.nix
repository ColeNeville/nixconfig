{ lib, inputs, ... }:

{
  garuda = import ./garuda.nix { inherit lib inputs; };
}