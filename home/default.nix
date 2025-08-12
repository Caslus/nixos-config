{ pkgs, inputs, ... }:

{
  imports = [ ./lucas/home.nix ];

  home.packages = with pkgs; [
    curl
    wget
    git-crypt
    gnupg
  ];

  home.stateVersion = "25.05";
}
