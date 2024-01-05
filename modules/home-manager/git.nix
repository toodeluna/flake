{ config, ... }:
{
  programs.git = {
    enable = true;
    userName = config.profile.fullName;
    userEmail = config.profile.email;
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
