{ pkgs, ... }:
{
  programs.lazygit.enable = true;
  home.shellAliases.lg = "${pkgs.lazygit}/bin/lazygit";
}
