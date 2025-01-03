{ pkgs, theme, ... }:
{
  programs.kitty = {
    enable = true;

    font = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
      size = 14;
    };

    settings = with theme; {
      background_opacity = 0.95;
      confirm_os_window_close = 0;
      placement_strategy = "top-left";
      tab_bar_edge = "top";
      tab_bar_style = "slant";

      background = "#${base00}";
      foreground = "#${base05}";
      selection_background = "#${base05}";
      selection_foreground = "#${base00}";
      url_color = "#${base04}";
      cursor = "#${base05}";
      cursor_text_color = "#${base00}";
      active_border_color = "#${base03}";
      inactive_border_color = "#${base01}";
      active_tab_background = "#${base00}";
      active_tab_foreground = "#${base05}";
      inactive_tab_background = "#${base01}";
      inactive_tab_foreground = "#${base04}";
      tab_bar_background = "#${base01}";
      wayland_titlebar_color = "#${base00}";
      macos_titlebar_color = "#${base00}";

      color0 = "#${base00}";
      color1 = "#${base08}";
      color2 = "#${base0B}";
      color3 = "#${base0A}";
      color4 = "#${base0D}";
      color5 = "#${base0E}";
      color6 = "#${base0C}";
      color7 = "#${base05}";

      color8 = "#${base03}";
      color9 = "#${base08}";
      color10 = "#${base0B}";
      color11 = "#${base0A}";
      color12 = "#${base0D}";
      color13 = "#${base0E}";
      color14 = "#${base0C}";
      color15 = "#${base07}";

      color16 = "#${base09}";
      color17 = "#${base0F}";
      color18 = "#${base01}";
      color19 = "#${base02}";
      color20 = "#${base04}";
      color21 = "#${base06}";
    };

    keybindings = {
      "alt+t" = "new_tab";
      "alt+h" = "previous_tab";
      "alt+l" = "next_tab";
      "alt+q" = "close_tab";
    };
  };
}
