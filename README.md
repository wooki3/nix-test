# How to build laptop fucker

## Without Nix-Helper

Switch active: `sudo nixos-rebuild --flake ~/nix-test#laptop switch`
Switch on reboot: `sudo nixos-rebuild --flake ~/nix-test#laptop boot`

## With Nix-Helper

Switch active: `nh os switch`
Switch on reboot: `nh os boot`
