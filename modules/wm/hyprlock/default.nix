{
  pkgs,
  ...
}:

let
  wallpaperPath = "~/Pictures/wallpapers";
in
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    fortune
  ];

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = "${wallpaperPath}/1.png";
      wallpaper = ", ${wallpaperPath}/1.png";
    };
  };

  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = false;
      };

      background = [
        {
          monitor = "";
          path = "${wallpaperPath}/1.png";

          blur_size = 4;
          blur_passes = 3;
          noise = 0.0117;
          contrast = 1.3;
          brightness = 0.8;
          vibrancy = 0.21;
          vibrancy_darkness = 0.0;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          font_family = "JetBrains Mono";
          position = "0, 400";
          halign = "center";
          valign = "center";
        }
        {

          monitor = "";
          text = ''cmd[update:1000] echo $(date +"%A, %B %d")'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          font_family = "JetBrains Mono";
          position = "0, 300";
          halign = "center";
          valign = "center";

        }

        {

          monitor = "";
          text = ''cmd[update:300000] fortune -s'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 16;
          font_family = "JetBrains Mono";
          position = "0, 50";
          halign = "center";
          valign = "bottom";

        }
      ];

      input-field = {
        monitor = "";
        size = "200,50";
        outline_thickness = 2;
        dots_size = 0.15;
        dots_spacing = 0.45;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.1)";
        font_color = "rgb(255, 255, 255)";
        fade_on_empty = true;
        rounding = -1;
        check_color = "rgb(255, 255 ,255)";
        placeholder_text = ''<i><span foreground="##cdd6f4">Password</span></i>'';
        hide_input = false;
        position = "0, 140";
        halign = "center";
        valign = "bottom";
      };
    };
  };
}
