{ config, ... }:
{
  xdg.dataFile."wallpaper.png".source = ../../wallpapers/ryo.png;

  services.hyprpaper = {
    enable = true;

    settings = rec {
      preload = "${config.home.homeDirectory}/.local/share/wallpaper.png";
      wallpaper = [ ", ${preload}" ];
    };
  };
}
