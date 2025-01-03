{
  programs.lsd = {
    enable = true;
    enableAliases = true;

    settings = {
      sorting.dir-grouping = "first";

      blocks = [
        "permission"
        "size"
        "date"
        "name"
        "git"
      ];
    };
  };
}
