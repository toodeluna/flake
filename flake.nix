{
  description = "My NixOS configuration in a flake.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    custom-pkgs = {
      url = "github:toodeluna/pkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ inputs.custom-pkgs.overlays.${system} ];
      };
    in
    {
      formatter.${system} = pkgs.treefmt-custom;
    };
}
