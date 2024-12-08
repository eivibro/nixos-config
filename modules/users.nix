{ config, pkgs, ... }:

{
  users.users.eivbro = {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users/eivbro".path;
    home = "/home/eivbro";
    extraGroups = [ "docker" "wheel" "audio" "video" "networkmanager" "adbusers"];
    packages = with pkgs; [
      pavucontrol
    ];
  };

  users.users.root = {
    hashedPasswordFile = config.sops.secrets."users/root".path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODszKxVNbFzpfLPTrnx9hP/LBuBgv5lHEAPU9Mq5pXQ eivbro@nixos"
    ];
  };
}
