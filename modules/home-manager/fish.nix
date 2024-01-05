{ ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      q = "exit";
      cls = "clear";
      vim = "nvim";
      cat = "bat";
      ls = "lsd";
    };
  };
}
