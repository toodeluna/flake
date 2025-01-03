{ pkgs, theme, ... }:
{
  services.displayManager = rec {
    preStart = "${pkgs.coreutils}/bin/printf '%%b\\e]P0${theme.base00}\\e]P7FFFFFF\\ec'";

    ly = {
      enable = true;

      settings = {
        vi_mode = true;
        clear_password = true;
        clock = "%D %H:%M";
        term_reset_cmd = "${pkgs.ncurses}/bin/tput reset; ${preStart}";
      };
    };
  };
}
