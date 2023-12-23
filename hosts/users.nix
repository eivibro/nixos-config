{ config, pkgs, ... }:

{
  users.users.eivbro = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users/eivbro".path;
    home = "/home/eivbro";
    extraGroups = [ "wheel" "audio" "video" "networkmanager"];
    packages = with pkgs; [
      kitty
      pavucontrol
    ];
  };

  users.users.root = {
    hashedPasswordFile = config.sops.secrets."users/root".path;
  };
}
