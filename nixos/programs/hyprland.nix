{ pkgs, ... }:
{
  environment.sessionVariables.NIXOS_OZONE_WL = 1;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];
  };

  environment.systemPackages = with pkgs; [
    kitty
    nautilus
    zen-browser
  ];
}
