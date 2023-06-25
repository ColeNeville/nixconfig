{ lib, inputs, ... }:

let
  inherit (inputs) self nixpkgs;
in {
  alexander-1 = import ./alexander-1 { inherit lib self nixpkgs inputs; };
  alexander-2 = import ./alexander-2 { inherit lib self nixpkgs inputs; };
  alexander-3 = import ./alexander-3 { inherit lib self nixpkgs inputs; };
  alexander-4 = import ./alexander-4 { inherit lib self nixpkgs inputs; };
  garuda = import ./garuda { inherit lib self nixpkgs inputs; };
}