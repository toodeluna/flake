{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Development
    git
    neovim
    lazygit

    # Desktop apps
    spotify
    discord-canary
  ];
}
