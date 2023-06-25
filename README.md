# Nix Config

My nix configrations using flakes putting all system configs in one place (eventually).

Heavily inspired by: https://github.com/MatthewCroughan/nixcfg

## Repository Structure

- `flake.nix`
- `homeManagerModules/` -> nix files made to be imported into home-manager config
  - `mixins/` -> Smaller config sets
  - `users/` -> Modules that define the userspace
    - Can also include home manager configs
    - Can also have inheritance to other users (full/minimal) profiles
      - TODO: I would like to have one profile per user that takes an arg
- `nixosConfigurations/` ->
- `nixosModules/` -> nix files made to be imported into nixos configs
  - `features/` -> Configs that define functionality (CRON jobs for example)
  - `mixins/` -> Small config sets not used on their own by used by other modules
  - `profiles/` -> Configs that may be shared by multiple hosts
  - `users/` -> Modules that define the userspace
    - Can also include home manager configs
    - Can also have inheritance to other users (full/minimal) profiles
      - TODO: I would like to have one profile per user that takes an arg
- `packages/` -> 