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
    #package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };

  sops.secrets."ssh/backup-x1-carbon" = {
    mode = "0400";
    owner = "root";
  };

  imports = 
  [
    inputs.sops-nix.nixosModules.sops
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.backupFileExtension = "backup1";
      home-manager.useUserPackages = true;
      home-manager.users.eivbro = {
        imports = [
          ./home.nix
          inputs.hyprland.homeManagerModules.default
        ];
      };
      home-manager.users.root = {
        programs.ssh.matchBlocks = {
          "m920q-backup" = {
            hostname = "192.168.70.1";
            user = "btrbk";
            identityFile = "/run/secrets/ssh/backup-x1-carbon";
          };
        };
      };
      home-manager.extraSpecialArgs = { inherit self inputs; };
      nixpkgs.overlays = overlays;
    }
  ];
}

