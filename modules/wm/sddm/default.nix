{ inputs, pkgs, ... }:

let
  sddm-theme = inputs.silentSDDM.packages.${pkgs.system}.default.override {
    theme = "rei";
  };
in
{
  imports = [
    ./sddm-avatar.nix
  ];

  environment.systemPackages = [
    sddm-theme
    sddm-theme.test
  ];
  qt.enable = true;
  services.displayManager.sddm = {
    package = pkgs.kdePackages.sddm;
    enable = true;
    theme = sddm-theme.pname;
    wayland.enable = true;
    extraPackages = sddm-theme.propagatedBuildInputs;
    settings = {
      General = {
        GreeterEnvironment = "QML2_IMPORT_PATH=${sddm-theme}/share/sddm/themes/${sddm-theme.pname}/components/,QT_IM_MODULE=qtvirtualkeyboard";
        InputMethod = "qtvirtualkeyboard";
      };
    };
  };
}
