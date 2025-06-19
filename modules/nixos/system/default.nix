{
  lib,
  config,
  inputs,
  ...
}: let
  inherit (lib.attrsets) mapAttrs mapAttrsToList;
in {
  config = {
    # Common Nix Settings, registry thing is specifically for flakes
    nix = {
      registry = lib.mkForce (mapAttrs (_: value: {flake = value;}) inputs);
      nixPath = lib.mkForce (mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry);
      optimise.automatic = true;

      gc = {
        automatic = true;
        options = "--delete-older-than 14d";
      };

      settings = {
        experimental-features = "nix-command flakes";
        warn-dirty = false;
        keep-derivations = true;
        keep-env-derivations = true;
        keep-outputs = true;
        auto-optimise-store = false;

        substituters = [
          "https://nix-community.cachix.org"
          "https://cache.nixos.org/"
        ];

        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        ];
      };
    };

    nixpkgs = {
      config.allowUnfree = true;

      overlays = [
        # overlays if you want them
      ];
    };
  };
}
