{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "/home/eivbro/.ssh/ssh-secret" ];
    age.keyFile = "/home/eivbro/.config/sops/age/keys.txt";
    secrets."wireguard/cortana/private" = {};
    secrets."wifi/pixelb" = {};
    secrets."wifi/eivind" = {};
  };
}
