{ ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      shell = "fish";
      font_family = "monospace";
      font_size = 10;
      background = "#000000";
      background_opacity = "0.1";
      foreground = "#ffffff";

      open_url_with = "default";
      copy_on_select = "yes";

      window_padding_width = "10";
    };
  };
}
