{ pkgs, theme, ... }:
let
  extraCss = with theme; ''
    @define-color accent_color #${base05};
    @define-color accent_bg_color #${base05};
    @define-color accent_fg_color #${base05};

    @define-color destructive_color #${base0F};
    @define-color destructive_bg_color #${base0F};
    @define-color destructive_fg_color #${base0F};

    @define-color success_color #${base0B};
    @define-color success_bg_color #${base0B};
    @define-color success_fg_color #${base0B};

    @define-color warning_color #${base0C};
    @define-color warning_bg_color #${base0C};
    @define-color warning_fg_color #${base0C};

    @define-color error_color #${base0F};
    @define-color error_bg_color #${base0F};
    @define-color error_fg_color #${base0F};

    @define-color window_bg_color #${base00};
    @define-color window_fg_color #${base05};

    @define-color headerbar_bg_color #${base00};
    @define-color headerbar_fg_color #${base05};
    @define-color headerbar_border_color #${base01};
    @define-color headerbar_backdrop_color @window_bg_color;
    @define-color headerbar_shade_color #${base01};

    @define-color card_bg_color #${base01};
    @define-color card_fg_color #${base05};
    @define-color card_shade_color #${base01};

    @define-color view_bg_color #${base01};
    @define-color view_fg_color #${base05};

    @define-color dialog_bg_color #${base01};
    @define-color dialog_fg_color #${base05};

    @define-color popover_bg_color #${base01};
    @define-color popover_fg_color #${base05};

    @define-color shade_color rgba(0,0,0,0.36);
    @define-color scrollbar_outline_color rgba(0,0,0,0.5);

    placessidebar,
    .navigation-sidebar,
    .top-bar {
      background-color: #${base01};
      color: #${base05};
    }
  '';
in
{
  gtk = {
    enable = true;
    gtk4.extraCss = extraCss;
    gtk3.extraCss = extraCss;

    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3-dark";
    };

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };

    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus";
    };

    font = {
      package = pkgs.work-sans;
      name = "Work Sans";
    };
  };
}
