{ config, pkgs, ...}:

{
    home.username = "lucas";
    home.homeDirectory = "/home/lucas";

    home.packages = with pkgs; [ 
        curl
        wget
        git-crypt
        gnupg
        fastfetch
    ];

    programs.bash = {
      enable = true;
    };

    programs.git = {
      enable = true;
      userName = "Lucas Philippe";
      userEmail = "git@lucasphilippe.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "25.05";
}