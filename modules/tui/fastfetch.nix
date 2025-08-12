{ pkgs, osConfig, ... }:

{
  home.packages = with pkgs; [
    fastfetch
  ];

  programs.fastfetch = {
    enable = true;
    settings = {
      # pretty much this -> https://github.com/natewhar/maxfetch
      logo = {
        type = "kitty-icat";
        source = "~/Pictures/amon.gif";
        padding = {
          top = 1;
        };
        width = 28;
      };
      display = {
        separator = "";
      };
      modules = [
        "break"
        "break"
        {
          type = "custom";
          key = "┌─────────────┐ ";
          format = "";
          keyColor = "white";
        }
        {
          type = "command";
          key = "│  {#red}  {#white}user    │ ";
          keyColor = "white";
          outputColor = "red";
          text = "whoami";
        }
        {
          type = "custom";
          key = "│  {#yellow}  {#white}hname   │ ";
          keyColor = "white";
          outputColor = "yellow";
          format = "${osConfig.networking.hostName}";
        }
        {
          type = "host";
          key = "│  {#green}  {#white}host    │ ";
          keyColor = "white";
          outputColor = "green";
          format = "{1}";
        }
        {
          type = "OS";
          key = "│  {#cyan}  {#white}distro  │ ";
          keyColor = "white";
          outputColor = "cyan";
          format = "{pretty-name}";
        }
        {
          type = "kernel";
          key = "│  {#blue}  {#white}kernel  │ ";
          keyColor = "white";
          outputColor = "blue";
        }
        {
          type = "wm";
          key = "│  {#magenta}  {#white}de/wm   │ ";
          keyColor = "white";
          outputColor = "magenta";
          format = "{1}";
        }
        {
          type = "uptime";
          key = "│  {#red}  {#white}uptime  │ ";
          keyColor = "white";
          outputColor = "red";
        }
        {
          type = "shell";
          key = "│  {#yellow}  {#white}shell   │ ";
          keyColor = "white";
          outputColor = "yellow";
          format = "{1}";
        }
        {
          type = "custom";
          key = "├─────────────┤ ";
          format = "";
          keyColor = "white";
        }
        {
          type = "custom";
          key = "│  {#green}  {#white}colors  │ ";
          format = "  {#red}  {#yellow}  {#green}  {#cyan}  {#blue}  {#magenta}  ";
        }
        {
          type = "custom";
          key = "└─────────────┘ ";
          format = "";
          keyColor = "white";
        }
      ];
    };
  };
}
