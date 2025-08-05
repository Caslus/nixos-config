{ inputs, config, pkgs, ... }:

{
  imports = [ ./lucas/home.nix ];

  home.packages = with pkgs; [
    curl
    wget
    git-crypt
    gnupg
    fastfetch
    neovim
    nixfmt
    nixd

    swaynotificationcenter
  ];

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      jnoortheen.nix-ide
    ];
  };

  # i cant even test this right now
  programs.kitty.enable = true;

  home.stateVersion = "25.05";
}
