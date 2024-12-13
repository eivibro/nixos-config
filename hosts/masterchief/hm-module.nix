{ config, pkgs, inputs, ... }:
let
  self = { inherit inputs; };
  overlays = with inputs;
  [
    nur.overlays.default
  ];
in {
  programs.hyprland.enable = true;
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
     };
      home-manager.extraSpecialArgs = { inherit self inputs; };
      nixpkgs.overlays = overlays;
    }
  ];
}

