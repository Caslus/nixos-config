{
  lib,
  osConfig,
  inputs,
  ...
}:
let
  hostname = osConfig.networking.hostName or "unknown";
in
{
  home.username = "lucas";
  home.homeDirectory = "/home/lucas";

  imports = [
    ../../modules/tui/fish.nix
  ]
  ++ lib.optionals (hostname == "amon") [
    ../../modules/wm/hyprland/home.nix

    ../../modules/gui/kitty
    ../../modules/gui/vscode.nix
    ../../modules/gui/zen-browser
  ];

  programs.git = {
    enable = true;
    userName = "Lucas Philippe";
    userEmail = "git@lucasphilippe.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  systemd.user.sessionVariables = {
    TERM = "fish";
  };
}
