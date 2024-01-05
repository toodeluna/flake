{ pkgs, lib, config, ... }:
let
  inherit (lib) mkOption types;
in
{
  imports = [
    ./git.nix
    ./picom.nix
    ./xorg.nix
  ];

  options = {
    profile = mkOption {
      type = types.submodule {
        options = {
          username = mkOption {
            type = types.str;
            example = "luna";
          };
          fullName = mkOption {
            type = types.str;
            example = "Luna Heyman";
          };
          email = mkOption {
            type = types.str;
            example = "luna.heyman@proton.me";
          };
        };
      };
    };
  };

  config = {
    home.username = config.profile.username;
    home.homeDirectory = "/home/${config.profile.username}";
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.home-manager.enable = true;
    programs.firefox.enable = true;
    programs.alacritty.enable = true;
    programs.neovim.enable = true;
    programs.rofi.enable = true;
    programs.fish.enable = true;
  };
}
