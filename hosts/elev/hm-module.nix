{ config, pkgs, inputs, ... }:
let
  self = { inherit inputs; };
  overlays = with inputs;
  [
    nur.overlays.default
  ];
in {
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
  imports = 
  [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.backupFileExtension = "backup";
      home-manager.useUserPackages = true;
      home-manager.users.elev = {
        home.username = "elev";
        home.homeDirectory = "/home/elev";
        imports = [
          ./home.nix
          inputs.hyprland.homeManagerModules.default
        ];
      };
      home-manager.users.teacher = {
        home.username = "teacher";
        home.homeDirectory = "/home/teacher";
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

