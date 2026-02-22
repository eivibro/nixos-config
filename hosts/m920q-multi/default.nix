{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./disk-config.nix
    ../../modules/sops.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    ../../modules/standard-desktop.nix
  ];

  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" "/home" ];
  };

  networking.hostName = "m920q-multi"; 
  networking.firewall.enable = false;
}

