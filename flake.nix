{
  description = "My NixOS configuration in a flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    custom-pkgs = {
      url = "github:toodeluna/pkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          inputs.custom-pkgs.overlays.${system}
          (_: _: self.packages.${system})
        ];
      };

      mkHost =
        hostName:
        nixpkgs.lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit pkgs hostName;
            theme = import ./themes/catppuccin-mocha.nix;
          };

          modules = [
            ./nixos
            ./hosts/${hostName}/hardware-configuration.nix
            ./hosts/${hostName}/configuration.nix
            inputs.home-manager.nixosModules.home-manager
          ];
        };
    in
    {
      formatter.${system} = pkgs.treefmt-custom;

      packages.${system} = {
        zen-browser = inputs.zen-browser.packages.x86_64-linux.default;
      };

      nixosConfigurations = {
        luna-desktop = mkHost "luna-desktop";
      };
    };
}
