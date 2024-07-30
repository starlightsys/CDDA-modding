#!/usr/bin/env bash
nix-build -E 'import <nixpkgs> { overlays = [ (import ./overlay.nix) ]; }' -A cataclysm-dda
