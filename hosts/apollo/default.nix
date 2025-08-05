{ inputs, config, lib, pkgs, ... }:

{
  imports =
  [ 
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager

    ../../modules/wm/hyprland
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

  nixpkgs.config.allowUnfree = true;

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

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --asterisks --cmd hyprland";
      };
    };
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  programs.firefox.enable = true;

  programs.nix-ld.enable = true; # so vscode remote ssh works

  system.stateVersion = "25.05";
}

