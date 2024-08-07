{ config, pkgs, ... }:

{
  users.users.elev= {
    isNormalUser = true;
    hashedPasswordFile = config.sops.secrets."users/eivbro".path;
    home = "/home/elev";
    extraGroups = [ "wheel" "audio" "video" "networkmanager"];
    packages = with pkgs; [
      pavucontrol
    ];
  };

  users.users.root = {
    hashedPasswordFile = config.sops.secrets."users/root".path;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODszKxVNbFzpfLPTrnx9hP/LBuBgv5lHEAPU9Mq5pXQ elev@nixos"
    ];
  };
}
