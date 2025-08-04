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

    home.stateVersion = "25.05";
}