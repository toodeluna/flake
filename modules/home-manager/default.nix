{ pkgs, ... }:
{
  imports = [
    ./profile.nix
    ./git.nix
    ./picom.nix
    ./xorg.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  programs.firefox.enable = true;
  programs.alacritty.enable = true;
  programs.neovim.enable = true;
  programs.rofi.enable = true;
  programs.fish.enable = true;
  programs.feh.enable = true;
}
