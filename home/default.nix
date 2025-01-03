{
  imports = [
    ./gtk.nix
    ./aliases.nix
    ./xresources.nix

    ./utilities/bat.nix
    ./utilities/lsd.nix
    ./utilities/git.nix
    ./utilities/lazygit.nix
    ./utilities/fish.nix

    ./hypr/hyprland.nix
    ./hypr/hyprpaper.nix

    ./programs/kitty.nix
    ./programs/waybar.nix
    ./programs/rofi.nix
  ];

  programs.home-manager.enable = true;

  home = rec {
    username = "luna";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
  };
}
