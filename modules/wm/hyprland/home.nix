{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ./binds.nix

    ../hyprlock
    ../hypridle
    ../rofi
    ../waybar
    ../grimblast
  ];

  home.packages = [
    inputs.mcmojave-hyprcursor.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    plugins = [
      pkgs.hyprlandPlugins.hyprsplit
      pkgs.hyprlandPlugins.hyprspace
    ];

    settings = {
      "$mainMod" = "SUPER";
      "$modShift" = "SUPER_SHIFT";
      "$terminal" = "kitty";
      "$notificationDaemon" = "swaync";

      exec-once = [
        "$notificationDaemon &"
        "waybar &"
        "swaync --scale 1.6 --output eDP-1 &"
        "swaync --scale 1.0 --output HDMI-A-1"
      ];

      monitor = [
        "eDP-1, 2560x1600@240, 0x0, 1.6"
        "HDMI-A-1, 2560x1440@144, 1600x0, 1"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      input = {
        touchpad = {
          disable_while_typing = false;
          natural_scroll = true;
        };
        follow_mouse = 2;
      };

      animation = [
        "windows, 1, 10, default, gnomed"
      ];

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          xray = true;
          size = 4;
          passes = 3;
          new_optimizations = "on";
          noise = 0.01;
          contrast = 0.9;
          brightness = 0.8;
          popups = true;
        };

        shadow = {
          range = 20;
          render_power = 2;
          color = "rgba(0, 0, 0, 0.3)";
        };
      };

      windowrulev2 = [
        "noborder, focus:0"
        "opacity 0.8 0.8, class:^(Code)$"
        "opacity 0.8 0.8, class:^(vesktop)$"
      ];

      layerrule = [
        "blur, rofi"
        "ignorezero, rofi"
        "xray 0, rofi"

        "blur, waybar"
        "blurpopups, waybar"
        "ignorezero, waybar"
        "xray 0, waybar"
      ];

      env = [
        "AQ_DRM_DEVICES, /dev/dri/card0:/dev/dri/card1"
        "HYPRCURSOR_THEME, McMojave"
        "HYPRCURSOR_SIZE, 32"
      ];
    };
  };
}
