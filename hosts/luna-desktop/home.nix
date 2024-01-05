{ ... }:
{
  home.username = "luna";
  home.homeDirectory = "/home/luna";
  home.stateVersion = "23.05";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
  programs.firefox.enable = true;
  programs.alacritty.enable = true;
  programs.neovim.enable = true;
  programs.rofi.enable = true;

  programs.git = {
    enable = true;
    userName = "Luna Heyman";
    userEmail = "luna.heyman@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
