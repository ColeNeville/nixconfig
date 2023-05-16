#! /bin/bash

# Update the flake.lock file
nix flake update

# Install (switch) the flake
scripts/install.sh