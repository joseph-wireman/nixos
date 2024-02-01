#!/bin/sh

#update flake
nix flake update 


# Update NixOS channels and switch to the latest generation
#nix-channel --update
nixos-rebuild switch -j 1 --impure

# Delete all old generations except the current and the previous one
nix-env --delete-generations old

# Collect garbage to free up disk space
nix-collect-garbage -d
