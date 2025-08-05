{ inputs, config, pkgs, ... }:

{
    imports =
    [ 
      ./users/lucas.nix

      ./features/shell/starship
    ];

    home.packages = with pkgs; [ 
        curl
        wget
        git-crypt
        gnupg
        fastfetch
        neovim

        swaynotificationcenter
    ];

    # i cant even test this right now
    programs.kitty.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$mainMod" = "SUPER";
	"$terminal" = "kitty";
	"$notificationDaemon" = "swaync";
        "exec-once" = [
	  "$terminal &"
	  "$notificationDaemon"
	];

        bind = [
          "$mainMod, RETURN, exec, $terminal"
          "$mainMod, Q, killactive"
	  "$mainMod, M, exit"
	  "$mainMod, T, togglefloating"
	  "$mainMod, F, fullscreen"

	  "$mainMod, left, movefocus, l"
	  "$mainMod, right, movefocus, r"
	  "$mainMod, up, movefocus, u"
	  "$mainMod, down, movefocus, d"
	];

	bindm = [
	  "$mainMod, mouse:272, movewindow"
	  "$mainMod, mouse:273, resizewindow"
	];
      };
    };

    home.stateVersion = "25.05";
}
