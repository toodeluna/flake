{ lib, config, ... }:
let
  inherit (lib) mkOption types strings;
in
{
  options = {
    dpi = mkOption {
      type = types.int;
      default = 144;
    };

    monitors = mkOption {
      default = [ ];
      type = types.listOf (types.submodule {
        options = {
          name = mkOption {
            type = types.str;
            example = "DP-1";
          };

          primary = mkOption {
            type = types.bool;
            default = false;
          };

          location = mkOption {
            default = null;
            type = types.nullOr (types.submodule {
              options = {
                position = mkOption {
                  type = types.enum [ "left-of" "right-of" ];
                };

                name = mkOption {
                  type = types.str;
                  example = "DP-1";
                };
              };
            });
          };
        };
      });
    };
  };

  config = {
    xresources.properties = {
      "Xft.dpi" = config.dpi;
    };

    home.file.".xinitrc".text =
      let
        xrandr-commands = map (monitor: "exec xrandr --output ${monitor.name} ${if monitor.primary then "--primary" else ""} ${if !(isNull monitor.location) then "--${monitor.location.position} ${monitor.location.name}" else ""}") config.monitors;
      in
      ''
        exec xrdb -merge ~/.Xresources &

        ${strings.concatStringsSep " & " xrandr-commands} &

        exec compfy &
        exec xmonad
      '';
  };
}
