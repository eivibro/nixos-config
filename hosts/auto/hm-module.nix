{ config, pkgs, inputs, ... }:
let
  self = { inherit inputs; };
  overlays = with inputs;
  [
    nur.overlay
  ];
in {
  programs.hyprland.enable = true;
  imports = 
  [
    inputs.sops-nix.nixosModules.sops
    inputs.stylix.nixosModules.stylix 
    {
      stylix.image = ./wallpaper.jpg;
      stylix.polarity = "dark";
    }
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.eivbro = {
        stylix.polarity = "dark";
        stylix.image = ./wallpaper.jpg;
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

