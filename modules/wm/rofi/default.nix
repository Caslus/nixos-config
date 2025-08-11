{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi-wayland ];

  xdg.configFile."rofi/theme.rasi".text = ''
    * {
        font:   "Montserrat 12";

        bg0:    #24242408;
        bg1:    #7e7e7e2d;
        bg2:    #0862f281;

        fg0:    #DEDEDE;
        fg1:    #FFFFFF;
        fg2:    #DEDEDE80;

        background-color:   transparent;
        text-color:         @fg0;

        margin:     0;
        padding:    0;
        spacing:    0;
      }
  '';

  xdg.configFile."rofi/config.rasi".text = ''
        @theme "theme"

        window {
        background-color:   @bg0;

        location:       center;
        width:          640;
        border-radius:  8;
    }

    inputbar {
        font:       "Montserrat 20";
        padding:    12px;
        spacing:    12px;
        children:   [ entry ];
    }

    entry {
        font:   inherit;

        placeholder         : "Search";
        placeholder-color   : @fg2;
    }

    message {
        border:             2px 0 0;
        border-color:       @bg1;
        background-color:   @bg1;
    }

    textbox {
        padding:    8px 24px;
    }

    listview {
        lines:      10;
        columns:    1;

        fixed-height:   false;
        border:         1px 0 0;
        border-color:   @bg1;
    }

    element {
        padding:            8px 16px;
        spacing:            16px;
        background-color:   transparent;
    }

    element normal active {
        text-color: @bg2;
    }

    element alternate active {
        text-color: @bg2;
    }

    element selected normal, element selected active {
        background-color:   @bg2;
        text-color:         @fg1;
    }

    element-icon {
        size:   1em;
    }

    element-text {
        text-color: inherit;
    }
  '';
}
