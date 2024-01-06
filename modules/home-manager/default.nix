{ pkgs, nix-colors, ... }:
{
  imports = [
    nix-colors.homeManagerModules.default
    ./profile.nix
    ./git.nix
    ./picom.nix
    ./xorg.nix
    ./fish.nix
    ./alacritty.nix
    ./gtk.nix
    ./lsd.nix
    ./xmonad
  ];

  colorScheme = nix-colors.colorSchemes.monokai;

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
  };

  home.packages = with pkgs; [
    dconf
    pcmanfm
    udiskie
  ];

  programs.home-manager.enable = true;
  programs.firefox.enable = true;
  programs.neovim.enable = true;
  programs.rofi.enable = true;
  programs.feh.enable = true;
  programs.bat.enable = true;
}
