{ pkgs, inputs, ... }:

{
  imports = [ ./lucas/home.nix ];

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

  home.stateVersion = "25.05";
}
