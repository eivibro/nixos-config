{ config, pkgs, inputs, ... }:
let
  self = { inherit inputs; };
  overlays = with inputs;
  [
    nur.overlay
  ];
in {
  imports = 
  [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.eivbro = {
        imports = [
          ./home.nix
          inputs.hyprland.homeManagerModules.default
        ];
     _module.args.self = self;
     _module.args.inputs = inputs;
     };
      home-manager.extraSpecialArgs = { inherit self inputs; };
      nixpkgs.overlays = overlays;
    }
    inputs.hyprland.nixosModules.default
    {programs.hyprland.enable = true;}
  ];
}

