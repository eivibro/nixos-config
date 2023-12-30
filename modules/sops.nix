{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "/etc/ssh/test" ];
    age.keyFile = "/root/.conig/keys.txt";
    age.generateKey = true;
    secrets."wireguard/cortana/private" = {};
    secrets."wifi/laptop" = {};
    secrets."users/eivbro".neededForUsers = true;
    secrets."users/root".neededForUsers = true;
    secrets."ssh/eivbro".neededForUsers = true;
  };
}
