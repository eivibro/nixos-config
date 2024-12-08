{ config, pkgs, ... }:

{
  users.users.elev = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users/elev".path;
    home = "/home/elev";
    extraGroups = [ "audio" "video" "networkmanager"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJCWeg3T/AlBu0SQ8PgTJAnwalKDqx4tsK4J3BaRwzit eivbro@auto"
    ];
    packages = with pkgs; [
      pavucontrol
    ];
  };

  users.users.teacher = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users/teacher".path;
    home = "/home/teacher";
    extraGroups = [ "wheel" "audio" "video" "networkmanager"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJCWeg3T/AlBu0SQ8PgTJAnwalKDqx4tsK4J3BaRwzit eivbro@auto"
    ];
    packages = with pkgs; [
      pavucontrol
    ];
  };

  users.users.root = {
    hashedPasswordFile = config.sops.secrets."users/root".path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJCWeg3T/AlBu0SQ8PgTJAnwalKDqx4tsK4J3BaRwzit eivbro@auto"
    ];
  };
}
