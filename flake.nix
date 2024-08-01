{
  description = "NixOS configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-users = [
      "eivbro"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";  
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, nur, nixos-hardware, disko, sops-nix, stylix, ... }:
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          hosts/t440s/default.nix
	  hosts/t440s/hm-module.nix
        ];
      };
      auto = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
	  stylix.nixosModules.stylix
	  nixos-hardware.nixosModules.lenovo-thinkpad-t440s
          disko.nixosModules.disko
          hosts/auto/default.nix
	  hosts/auto/hm-module.nix
        ];
      };
      masterchief = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          disko.nixosModules.disko
          hosts/masterchief/default.nix
          hosts/masterchief/hm-module.nix
        ];
      };
      m720q = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          disko.nixosModules.disko
          hosts/m720q/default.nix
          hosts/m720q/hm-module.nix
        ];
      };
      x230 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
	  stylix.nixosModules.stylix
	  nixos-hardware.nixosModules.lenovo-thinkpad-x230
          disko.nixosModules.disko
          hosts/x230/default.nix
	  hosts/x230/hm-module.nix
        ];
      };
      elev = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
	  stylix.nixosModules.stylix
	  nixos-hardware.nixosModules.common-cpu-intel
          disko.nixosModules.disko
          hosts/elev/default.nix
	  hosts/elev/hm-module.nix
        ];
      };
    };
  };
}
