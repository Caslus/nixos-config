{ config, pkgs, ... }:

{
    home.username = "lucas";
    home.homeDirectory = "/home/lucas";

    home.packages = with pkgs; [ 
        curl
        wget
        git-crypt
        gnupg
        fastfetch
        neovim
    ];

    programs.git = {
      enable = true;
      userName = "Lucas Philippe";
      userEmail = "git@lucasphilippe.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

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