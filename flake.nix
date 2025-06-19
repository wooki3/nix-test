{
  description = "Wooki3's shitass nix conf";

  outputs = inputs @ {
    self,
    nixpkgs,
    ...
  }: rec {
    # The output for your laptop build
    nixosConfigurations = {
      laptop = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [
          ./hosts/laptop #individual config
          ./modules/nixos #share configs
        ];
      };
    };
  };

  # Flake inputs, think of it as external repos
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
}
