{
  pkgs,
  config,
  systemConfiguration,
  theme,
  ...
}:
{
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";

      misc.disable_hyprland_logo = true;
      xwayland.force_zero_scaling = true;

      monitor = [
        "DP-2,3840x2160,0x0,1.5"
        "DP-1,3840x2160,2560x0,1.5"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "XCURSOR_THEME,${config.gtk.cursorTheme.name}"
        "HYPRCURSOR_THEME,${config.gtk.cursorTheme.name}"
        "XDG_CURRENT_DESKTOP,Hyprland"
      ];

      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "${pkgs.hyprpaper}/bin/hyprpaper"
      ];

      bind = [
        "$mod, return, exec, ${pkgs.kitty}/bin/kitty"
        "$mod, B, exec, ${pkgs.firefox}/bin/firefox"
        "$mod, P, exec, ${pkgs.rofi-wayland}/bin/rofi -show drun"
        "$mod, E, exec, ${pkgs.nautilus}/bin/nautilus"

        "$mod, Q, killactive"
        "$mod SHIFT, Q, exit"

        "$mod, F, togglefloating"
        "$mod SHIFT, F, fullscreen"

        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"
        "$mod SHIFT, L, movewindow, r"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 0"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 0"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];

      input = {
        kb_model = systemConfiguration.services.xserver.xkb.layout;
        kb_options = systemConfiguration.services.xserver.xkb.options;
      };

      general = {
        gaps_in = 5;
        gaps_out = 15;
        border_size = 2;
        resize_on_border = true;
        "col.active_border" = "rgb(${theme.base0E})";
        "col.inactive_border" = "rgb(${theme.base04})";
      };

      decoration = {
        rounding = 5;
        blur.enabled = true;
      };

      animations = {
        enabled = true;
        bezier = [ "myBezier, 0.165, 0.84, 0.44, 1.0" ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
    };
  };
}
