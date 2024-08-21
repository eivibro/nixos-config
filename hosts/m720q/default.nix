{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./disk-config.nix
    ../../modules/sops-course.nix
    ../../modules/wifi-course.nix
    ../../modules/users-course.nix
    ../../modules/stylix.nix
    ../../modules/standard-desktop.nix
  ];

  networking.hostName = "m720q"; 
  networking.firewall.enable = false;
}

