{ config, ... }:
{
  xresources.properties = {
    "Xft.dpi" = 162;
    "Xcursor.theme" = config.gtk.cursorTheme.name;
    "Xcursor.size" = config.gtk.cursorTheme.size;
  };
}
