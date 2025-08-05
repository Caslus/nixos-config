{
  config,
  pkgs,
  inputs,
  lib,
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
      "exec-once" = [ "$terminal &" "$notificationDaemon" ];
    };
  };
}