{ pkgs, ... }:

let
  # i hate doing this but i also hate my monitor going black
  brightnessDown = ''p=$(brightnessctl g); m=$(brightnessctl m); min=$((m/10)); if [ $p -le $min ]; then brightnessctl set $min; else brightnessctl set 5%-; fi'';
in
{
  home.packages = with pkgs; [
    brightnessctl
    swaynotificationcenter
  ];

  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = [
      {
        layer = "top";
        position = "top";
        mod = "dock";
        exclusive = true;
        passtrough = false;
        gtk-layer-shell = true;
        height = 0;
        modules-left = [
          "clock"
        ];
        modules-center = [
          "hyprland/workspaces"
        ];
        modules-right = [
          "custom/swaync"
          "network"
          "backlight"
          "wireplumber"
          "battery"
        ];

        # MODULE CONFIGURATION

        "hyprland/workspaces" = {
          "active-only" = false;
          "all-outputs" = false;
          "format" = "{icon}";
          "show-special" = false;
          "format-icons" = {
            "1" = "I";
            "2" = "II";
            "3" = "III";
            "4" = "IV";
            "5" = "V";
            "6" = "VI";
            "7" = "VII";
            "8" = "VIII";
            "9" = "IX";
            "10" = "X";
            # the following are needed because of hyprsplit
            "11" = "I";
            "12" = "II";
            "13" = "III";
            "14" = "IV";
            "15" = "V";
            "16" = "VI";
            "17" = "VII";
            "18" = "VIII";
            "19" = "IX";
            "20" = "X";
          };
        };

        "battery" = {
          interval = 5;
          align = 0;
          rotate = 0;
          full-at = 100;
          design-capacity = false;
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "{capacity}%";
          format-plugged = "󰂄 {capacity}%";
          format-altclick = "click";
          format-full = "󰁹";
          format-alt = "{icon} {time}";
          format-icons = [
            "󰂎"
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          format-time = "{H}h {M}min";
          tooltip = true;
          tooltip-format = "{capacity}% ({timeTo})";
        };

        backlight = {
          format = "󰖨";
          device = "acpi_video0";
          tooltip-format = ''󰖨 {percent}%'';
          on-scroll-up = "brightnessctl set +5%";
          on-scroll-down = brightnessDown;
        };

        network = {
          format = "{ifname}";
          format-wifi = "{icon}";
          format-ethernet = "󰈀";
          format-disconnected = "󰌙";
          tooltip-format = "{ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-linked = "󰈁 {ifname} (No IP)";
          tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
          tooltip-format-ethernet = "{ifname} 󰈀";
          tooltip-format-disconnected = "󰌙 Disconnected";
          max-length = 50;
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
        };

        clock = {
          "format" = "{:%H:%M}";
          tooltip-format = ''<small>{:%Y/%m/%d}</small>'';
        };

        wireplumber = {
          format = "{icon} {volume} %";
          format-muted = " Mute";
          format-icons = [
            ""
            ""
            "󰕾"
            ""
          ];
        };

        "custom/swaync" = {
          tooltip = true;
          format = "{icon}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };
      }
    ];
  };
}
