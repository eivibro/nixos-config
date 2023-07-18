{
  description = "NixOS configuration";

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    ];
  };


  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, nur, nixos-hardware, ... }:
    let
      system = "x86_64-linux";
      overlays = with inputs;
      [
        nur.overlay
      ];
    in {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            hosts/t440s.nix
            home-manager.nixosModules.home-manager
	    #nixos-hardware.nixosModules.lenovo-thinkpad-t440s
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.eivbro = {
                imports = [
                  ./home-manager/laptop.nix
                  hyprland.homeManagerModules.default
                ];
 	     _module.args.self = self;
             _module.args.inputs = inputs;
             };
              home-manager.extraSpecialArgs = { inherit self inputs; };
	      nixpkgs.overlays = overlays;
            }
            hyprland.nixosModules.default
            {programs.hyprland.enable = true;}

          ];
        };
      };
      nixosConfigurations = {
        x230 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            hosts/x230.nix
	    #nixos-hardware.nixosModules.lenovo-thinkpad-x230
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.eivbro = {
                imports = [
                  ./home-manager/laptop.nix
                  hyprland.homeManagerModules.default
                ];
             _module.args.self = self;
             _module.args.inputs = inputs;
             };
              home-manager.extraSpecialArgs = { inherit self inputs; };
              nixpkgs.overlays = overlays;
            }
            hyprland.nixosModules.default
            {programs.hyprland.enable = true;}

          ];
        };
      };

  };
}
