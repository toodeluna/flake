{ pkgs, ... }:
{
  imports = [
    ./profile.nix
    ./git.nix
    ./picom.nix
    ./xorg.nix
    ./fish.nix
    ./xmonad
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

  programs.home-manager.enable = true;
  programs.firefox.enable = true;
  programs.alacritty.enable = true;
  programs.neovim.enable = true;
  programs.rofi.enable = true;
  programs.feh.enable = true;
  programs.lsd.enable = true;
  programs.bat.enable = true;
}
