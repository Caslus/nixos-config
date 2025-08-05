{
  ...
}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$notificationDaemon" = "swaync";
      "exec-once" = [
        "$terminal &"
        "$notificationDaemon"
      ];

      "monitor" = [
        "eDP-1, 2560x1600@240, 0x0, 1"
        "HDMI-A-1, 2560x1440@144, 2560x0, 1"
      ];

      "env" = [
        "AQ_DRM_DEVICES, /dev/dri/card0:/dev/dri/card1"
      ];
    };
  };
}
