{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./disk-config.nix
    ../../modules/sops-course.nix
    ../../modules/wifi-course.nix
    ../../modules/users-course.nix
    ../../modules/stylix-course.nix
    ../../modules/standard-course.nix
  ];

  networking.hostName = "auto"; 
  networking.firewall.enable = false;

  system.copySystemConfiguration = false;
  system.stateVersion = "23.05"; 
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;  

}

