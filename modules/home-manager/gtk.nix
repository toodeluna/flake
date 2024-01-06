{ pkgs, ... }:
let
  cursor-theme = "Bibata-Modern-Ice";
in
{
  gtk = {
    enable = true;

    cursorTheme = {
      name = cursor-theme;
      package = pkgs.bibata-cursors;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

  xresources.properties = {
    "Xcursor.theme" = cursor-theme;
  };
}
