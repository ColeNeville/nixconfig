# Nix Config

My nix configrations using flakes putting all system configs in one place (eventually).

Heavily inspired by: https://github.com/MatthewCroughan/nixcfg

## Repository Structure

- `flake.nix`
- `homeManagerModules/` -> nix files made to be imported into home-manager config
- `nixosModules/` -> nix files made to be imported into nixos configs
  - `configuration/`
  - `default/`
  - `hardware/`
- `packages/`
