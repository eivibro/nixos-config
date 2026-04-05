{ config, pkgs, inputs, lib, ... }:
{
  imports = [
    ./hardware.nix
    ./disk-config.nix
    ./routing.nix
    ./unlock-backup.nix
    ../../modules/sops.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    ../../modules/standard-desktop.nix
    inputs.nix-utils.nixosModules.switch-fix
  ];

  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" "/home" ];
  };

  networking.hostName = "m920q-multi"; 
}

