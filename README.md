# Nix Config

My nix configrations using flakes putting all system configs in one place (eventually).

Heavily inspired by: https://github.com/MatthewCroughan/nixcfg

## Repository Structure

- `flake.nix`
- `nixosModules/` -> nix files made to be imported into nixos configs
  - `hardware/` -> hardware-configuration.nix files for specific systems
  - `hosts/` -> host configurations one per system
    - Imports 1 harware module
    - And any number of mixins, profiles, or users
  - `mixins/` -> Small config sets
  - `profiles/` -> Larger config sets that can be made up of mixins
  - `users/` -> Modules that define the userspace
    - Can also include home manager configs
    - Can also have inheritance to other users (full/minimal) profiles
      - TODO: I would like to have one profile per user that takes an arg
- `homeModules/` -> nix files mad to be imported into home-manager config
  - `mixins/` -> Smaller config sets
  - `users/` -> Modules that define the userspace
    - Can also include home manager configs
    - Can also have inheritance to other users (full/minimal) profiles
      - TODO: I would like to have one profile per user that takes an arg