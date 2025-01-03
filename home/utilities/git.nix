{
  programs.git = {
    enable = true;
    userName = "Luna Heyman";
    userEmail = "luna.heyman@proton.me";

    aliases = {
      lga = "log --graph --oneline --all --decorate";
      put = "put --set-upstream";
      rollback = "reset --hard HEAD";
    };

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
