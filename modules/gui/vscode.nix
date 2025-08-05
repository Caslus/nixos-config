{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nixd
  ];

  programs.vscode = {
    enable = true;

    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          catppuccin.catppuccin-vsc
          jnoortheen.nix-ide
        ];

        userSettings = {
          "nix.serverPath" = "nixd";
          "workbench.colorTheme" = "Catppuccin Mocha";
        };
      };
    };
  };
}
