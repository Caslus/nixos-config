{ config, pkgs, ... }:

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
    ];

    # i cant even test this right now
    programs.kitty.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      portalPackage = null;
      settings = {
        "$mod" = "SUPER";
      };
    };

    home.stateVersion = "25.05";
}