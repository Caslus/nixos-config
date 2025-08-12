{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty-themes
  ];

  programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    settings = {
      shell = "fish";
      font_family = "monospace";
      font_size = 10;
      background_opacity = "0.8";
      open_url_with = "default";
      copy_on_select = "yes";
      window_padding_width = "10";
    };
  };
}
