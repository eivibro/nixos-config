{ config, pkgs, inputs, ... }:
let
  self = { inherit inputs; };
  overlays = with inputs;
  [
    nur.overlay
  ];
in {
  programs.ns-usbloader.enable = true;
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
          inputs.stylix.homeManagerModules.stylix
          {
	    stylix.enable = true;
            stylix.image = ./wallpaper.png;
	    #stylix.opacity.desktop = 0.5;
	    #stylix.opacity.applications = 0.5;
	    stylix.opacity.terminal = 0.95;
            stylix.polarity = "dark";
          }
        ];
     };
      home-manager.extraSpecialArgs = { inherit self inputs; };
      nixpkgs.overlays = overlays;
    }
  ];
}

