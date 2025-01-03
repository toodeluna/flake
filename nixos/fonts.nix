{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    work-sans
    noto-fonts-cjk-sans
    nerd-fonts.jetbrains-mono
  ];
}
