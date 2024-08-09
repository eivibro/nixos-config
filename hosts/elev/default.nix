{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./disk-config.nix
    ../../modules/sops.nix
    ../../modules/wifi.nix
    ../../modules/users-elev.nix
    ../../modules/stylix.nix
    ../../modules/standard-laptop.nix
  ];

  networking.hostName = "auto"; 
  networking.firewall.enable = false;

  system.copySystemConfiguration = false;
  system.stateVersion = "23.05"; 

}

