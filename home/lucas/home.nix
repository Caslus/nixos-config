{ config, pkgs, ... }:

{
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  programs.git = {
    enable = true;
    userName = "Lucas Philippe";
    userEmail = "git@lucasphilippe.com";
    extraConfig = { init.defaultBranch = "main"; };
  };
}
