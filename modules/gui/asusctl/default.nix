{ pkgs, ... }:

{
  home.packages = with pkgs; [
    asusctl
  ];
}
