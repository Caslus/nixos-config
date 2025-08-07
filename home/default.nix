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

  home.stateVersion = "25.05";
}
