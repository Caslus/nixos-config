{
  ...
}:

let
  monBrightnessDown = ''p=$(brightnessctl g); m=$(brightnessctl m); min=$((m/10)); if [ $p -le $min ]; then brightnessctl set $min; else brightnessctl set 5%-; fi'';
  changeFanProfile = ''asusctl profile -n && asusctl profile -p | grep Active | awk '{print $4}' | xargs notify-send "Fan Profile Changed"'';
  raiseVolume = ''wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+'';
  lowerVolume = ''wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 && wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-'';
in
{
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod, Q, killactive"
        "$mainMod, M, exit"
        "$mainMod, T, togglefloating"
        "$mainMod, F, fullscreen"
        "$mainMod, L, exec, hyprlock"
        "$mainMod, Space, exec, rofi -show drun -show-icons"
        ", PRINT, exec, grimblast --notify copy area"

        ", XF86AudioRaiseVolume, exec, ${raiseVolume}"
        ", XF86AudioLowerVolume, exec, ${lowerVolume}"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        # this slot is for ROG key, wont use it for now

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86KbdBrightnessDown, exec, asusctl -p"
        ", XF86KbdBrightnessUp, exec, asusctl -n"
        # f4 is aura key, wont use it for now
        ", XF86Launch4, exec, ${changeFanProfile}"
        "SHIFT_R, SUPER_R, exec, grimblast --notify copy area"
        ", XF86MonBrightnessDown, exec, ${monBrightnessDown}"
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        # f9 is presentation mode, wont use it for now
        # f10 is to toggle touchpad, wont use it for now
        # f11 is zzz, wont use it for now
        # f12 is airplane mode, wont use it for now

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod, TAB, overview:toggle"

        "$mainMod, 1, split:workspace, 1"
        "$mainMod, 2, split:workspace, 2"
        "$mainMod, 3, split:workspace, 3"
        "$mainMod, 4, split:workspace, 4"
        "$mainMod, 5, split:workspace, 5"
        "$mainMod, 6, split:workspace, 6"
        "$mainMod, 7, split:workspace, 7"
        "$mainMod, 8, split:workspace, 8"
        "$mainMod, 9, split:workspace, 9"
        "$mainMod, 0, split:workspace, 10"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
