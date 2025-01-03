{ pkgs, ... }:
{
  home.shellAliases.cat = "${pkgs.bat}/bin/bat";

  programs.bat = {
    enable = true;
    config.theme = "base16";
  };
}
