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
    ../../modules/tui/fastfetch.nix
  ]
  ++ lib.optionals (hostname == "amon") [
    ../../modules/wm/hyprland/home.nix

    ../../modules/gui/kitty
    ../../modules/gui/vscode.nix
    ../../modules/gui/zen-browser
    ../../modules/gui/flatpak/home.nix
    ../../modules/gui/vesktop
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
