{ lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    nixfmt-rfc-style
    nil
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
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = "nil";
          "nix.serverSettings" = {
            "nil" = {
              "formatting" = {
                "command" = [ "nixfmt" ];
              };
            };
          };
          "workbench.colorTheme" = "Catppuccin Mocha";
          "editor.formatOnSave" = true;
        };
      };
    };
  };
}
