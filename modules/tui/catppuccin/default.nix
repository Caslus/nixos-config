{ inputs, ... }:

{
  imports = [
    inputs.catppuccin.homeModules.catppuccin
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";

    fish.enable = true;

    vscode.profiles.default = {
      enable = true;
      icons.enable = true;
    };

    swaync.enable = true;

    waybar.enable = false;
    hyprlock.enable = false;
  };
}
