#! /bin/bash

sudo nixos-rebuild switch --flake ".#"
home-manager switch --flake ".#cole@garuda"