{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./disk-config.nix
    ../../modules/sops.nix
    ../../modules/wifi.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    ../../modules/standard-desktop.nix
  ];

  networking.hostName = "m720q"; 
  networking.firewall.enable = false;
}

