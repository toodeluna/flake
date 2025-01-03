{ theme, ... }:
{
  programs.fish = {
    enable = true;

    interactiveShellInit = with theme; ''
      fish_vi_key_bindings

      set -gx fish_color_normal normal
      set -gx fish_color_command "${base0E}" blue
      set -gx fish_color_quote "${base0B}" green
      set -gx fish_color_redirection "${base0A}" yellow
      set -gx fish_color_end "${base0C}" cyan
      set -gx fish_color_error "${base08}" red
      set -gx fish_color_param "${base06}" cyan
      set -gx fish_color_comment "${base03}" brblack
      set -gx fish_color_match --background=brblue
      set -gx fish_color_selection "${base05}" white --bold --background=brblack
      set -gx fish_color_search_match "${base0A}" bryellow --background=brblack
      set -gx fish_color_history_current --bold
      set -gx fish_color_operator "${base0C}" cyan
      set -gx fish_color_escape "${base0C}" cyan
      set -gx fish_color_cwd "${base0B}" green
      set -gx fish_color_cwd_root "${base08}" red
      set -gx fish_color_valid_path "${base0B}" --underline
      set -gx fish_color_autosuggestion "${base03}" brblack
      set -gx fish_color_user "${base0B}" brgreen
      set -gx fish_color_host normal
      set -gx fish_color_cancel -r
      set -gx fish_pager_color_completion normal
      set -gx fish_pager_color_description "${base0A}" yellow
      set -gx fish_pager_color_prefix "${base05}" white --bold --underline
      set -gx fish_pager_color_progress "${base07}" brwhite --background=cyan
    '';
  };
}
