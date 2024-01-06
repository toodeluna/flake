{ ... }:
{
  programs.lsd = {
    enable = true;
    settings = {
      blocks = [ "permission" "user" "date" "name" "size" "git" ];
      date = "+%d/%m/%Y %H:%M";
      sorting.dir-grouping = "first";
    };
  };
}
