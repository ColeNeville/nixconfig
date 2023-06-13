{ inputs, system, ... }:

let
  inherit (inputs) nixpkgs self;
  pkgs = import nixpkgs { system = system; };
in {
  nixos-fetch-config = import ./nix-fetch-config { inherit pkgs; };
  nixos-build-config = import ./nix-build-config { inherit pkgs; };
}