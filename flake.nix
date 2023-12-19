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
    #nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    nur.url = "github:nix-community/NUR";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";  
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, nur, nixos-hardware, disko, ... }:
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
                  ./home-manager/t440s.nix
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
        t440s2 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            hosts/t440s2.nix
            home-manager.nixosModules.home-manager
	    #nixos-hardware.nixosModules.lenovo-thinkpad-t440s
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.eivbro = {
                imports = [
                  ./home-manager/t440s.nix
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
                  ./home-manager/x230.nix
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
        masterchief = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            hosts/masterchief.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.eivbro = {
                imports = [
                  ./home-manager/masterchief.nix
                  hyprland.homeManagerModules.default
                ];
             _module.args.self = self;
             _module.args.inputs = inputs;
             };
              home-manager.extraSpecialArgs = { inherit self inputs; };
              nixpkgs.overlays = overlays;
            }
            hyprland.nixosModules.default
            {programs.hyprland.enable = true;
              programs.hyprland.enableNvidiaPatches = true;
	    }

          ];
        };
      };
      nixosConfigurations = {
        autot440s= nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
	    disko.nixosModules.disko
            hosts/autot440s.nix
            home-manager.nixosModules.home-manager
	    #nixos-hardware.nixosModules.lenovo-thinkpad-t440s
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.eivbro = {
                imports = [
                  ./home-manager/t440s.nix
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
