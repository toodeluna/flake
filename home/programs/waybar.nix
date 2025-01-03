{ theme, ... }:
{
  programs.waybar = {
    enable = true;

    style = ''
      * {
        border: none;
        font-family: Work Sans;
        font-size: 16px;
      }

      window#waybar {
        background-color: #${theme.base00};
        color: #${theme.base05};
      }

      #workspaces {
        margin-left: 15px;
      }

      #workspaces button {
        color: #${theme.base05};
        border-radius: 0;
      }

      #workspaces button:hover,
      #workspaces button.focused,
      #workspaces button.active {
        background: #${theme.base01};
        box-shadow: inherit;
        text-shadow: inherit;
      }

      #clock {
        margin-right: 15px;
      }

      #pulseaudio-slider slider {
        background-color: #${theme.base05};
      }

      #pulseaudio-slider trough {
        min-width: 200px;
        min-height: 10px;
        background-color: #${theme.base02};
      }

      #pulseaudio-slider highlight {
        background-color: #${theme.base0B};
      }
    '';

    settings = [
      {
        position = "bottom";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [
          "pulseaudio"
          "pulseaudio/slider"
          "clock"
        ];

        clock = {
          interval = 60;
          format = "{:%D %H:%M}";
        };

        "hyprland/workspaces" = {
          disabled-scroll = true;
          on-click = "activate";
        };

        "pulseaudio/slider" = {
          min = 0;
          max = 100;
        };
      }
    ];
  };
}
