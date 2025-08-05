{ inputs, config, lib, pkgs, ... }:

{
  imports =
  [ 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.lucas = import ../../home;
  };

  fonts.fontDir.enable = true;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "apollo";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.openssh.enable = true;

  users.groups.lucas = {};
  users.users.lucas = {
    isNormalUser = true;
    shell = pkgs.fish;
    group = "lucas";
    extraGroups = [ "wheel" ];
  };

  programs.fish = {
    enable = true;
    vendor = {
      completions.enable = true;
      config.enable = true;
      functions.enable = true;
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };

  programs.hyprland.enable = true;

  programs.firefox.enable = true;

  programs.nix-ld.enable = true; # so vscode remote ssh works

  system.stateVersion = "25.05";
}

