{ inputs, system, ... }:

let
  inherit (inputs) nixpkgs self;
  pkgs = import nixpkgs { system = system; };
in {
  nix-fetch-config = import ./nix-fetch-config { inherit pkgs; };
}