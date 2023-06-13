{ inputs, system, ... }:

let
  inherit (inputs) nixpkgs self;
  pkgs = import nixpkgs { system = system; };
in {
  nixos-fetch-config = import ./nixos-fetch-config { inherit pkgs; };
  nixos-build-config = import ./nixos-build-config { inherit pkgs; };
}