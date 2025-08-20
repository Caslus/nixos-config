{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    mcmojave-hyprcursor.url = "github:libadoxon/mcmojave-hyprcursor";

    catppuccin.url = "github:catppuccin/nix";

    swww.url = "github:LGFae/swww";

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, ... }:
    {
      nixosConfigurations = {
        # main laptop
        amon = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/amon
            inputs.nixos-hardware.nixosModules.asus-zephyrus-gu603h # even though this laptop is a GU604VI
          ];
          specialArgs = { inherit inputs; };
        };

        # virtual machine for testing
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ ./hosts/nixos ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
