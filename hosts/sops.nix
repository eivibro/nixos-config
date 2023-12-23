{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "/home/eivbro/.ssh/ssh-secret" ];
    age.keyFile = "/home/eivbro/.config/sops/age/keys.txt";
    age.generateKey = true;
    secrets."wireguard/cortana/private" = {};
    secrets."wifi/laptop" = {};
    secrets."users/eivbro".neededForUsers = true;
    secrets."users/root".neededForUsers = true;
    secrets."ssh/eivbro".neededForUsers = true;
  };
}
