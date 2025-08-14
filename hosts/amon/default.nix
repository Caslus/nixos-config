{ inputs, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager

    ../../modules/tui/greetd.nix
    ../../modules/wm/hyprland
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "bak";
    users.lucas = import ../../home/lucas;
    extraSpecialArgs = { inherit inputs; };
  };

  fonts.fontDir.enable = true;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelModules = [ "ax88179_178a" ];
    kernelParams = [
      "nvidia_drm.modeset=1"
      "nvidia_drm.fbdev=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
    ];
  };

  networking = {
    hostName = "amon";
    networkmanager.enable = true;

    useDHCP = false;
    useNetworkd = false;
  };

  time.timeZone = "America/Sao_Paulo";

  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  services.openssh.enable = true;

  users.groups.lucas = { };
  users.users.lucas = {
    isNormalUser = true;
    group = "lucas";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.flatpak.enable = true;

  system.stateVersion = "25.05";
}
