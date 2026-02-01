{
  description = "NixOS configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [
      "https://cuda-maintainers.cachix.org"
      "https://nix-community.cachix.org"
      "https://hyprland.cachix.org"
    ];
    extra-trusted-users = [
      "eivbro"
    ];
    trusted-public-keys = [
    #extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    #hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland.url = "github:hyprwm/Hyprland";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";  
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    blender-bin.url = "github:edolstra/nix-warez?dir=blender";
  };

  outputs = inputs@{ self, blender-bin, nixpkgs, home-manager, hyprland, nur, nixos-hardware, disko, sops-nix, stylix, ... }:
  {
    nixosConfigurations = {
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
      x1-carbon = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
	  ({ ... }: {
            nixpkgs.overlays = [
              (import ./overlays/darktable-5_4.nix)
            ];
          })
	  stylix.nixosModules.stylix
	  nixos-hardware.nixosModules.lenovo-thinkpad-x1-10th-gen
          disko.nixosModules.disko
          hosts/x1-carbon/default.nix
	  hosts/x1-carbon/hm-module.nix
        ];
      };
      t460s = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
	  stylix.nixosModules.stylix
	  nixos-hardware.nixosModules.lenovo-thinkpad-t460s
          disko.nixosModules.disko
          hosts/elev/default.nix
	  hosts/elev/hm-module.nix
        ];
      };
      masterchief = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          disko.nixosModules.disko
	  stylix.nixosModules.stylix
          hosts/masterchief/default.nix
          hosts/masterchief/hm-module.nix
          #({config, pkgs, ...}: {
          #  nixpkgs.overlays = [ blender-bin.overlays.default ];
          #  environment.systemPackages = with pkgs; [ blender_4_5];
          #})
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
      elev-11e = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
	  stylix.nixosModules.stylix
	  nixos-hardware.nixosModules.common-cpu-intel
          disko.nixosModules.disko
          hosts/elev-11e/default.nix
	  hosts/elev-11e/hm-module.nix
        ];
      };
      m720q = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
	  stylix.nixosModules.stylix
          disko.nixosModules.disko
          hosts/m720q/default.nix
          hosts/m720q/hm-module.nix
        ];
      };
    };
  };
}
