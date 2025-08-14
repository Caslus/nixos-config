{ pkgs, ... }:

{
  home.packages = with pkgs; [
    dunst
  ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        frame_color = "#cad3f5";
        separator_color = "frame";
        font = "JetBrains Mono 10";
        corner_radius = 10;
        offset = "5x5";
        origin = "top-right";
        notification_limit = 8;
        gap_size = 7;
        frame_width = 2;
        width = 300;
        height = 100;
        follow = "keyboard";
      };

      urgency_low = {
        background = "#24273A";
        foreground = "#cad3f5";
      };

      urgency_normal = {
        background = "#24273A";
        foreground = "#cad3f5";
      };

      urgency_critical = {
        background = "#24273A";
        foreground = "#f5a97f";
      };
    };
  };
}
