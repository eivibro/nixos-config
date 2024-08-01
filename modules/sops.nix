{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "/root/.ssh/ssh_host_ed25519_key" ];
    age.keyFile = "/root/.config/keys.txt";
    age.generateKey = true;
    gnupg.sshKeyPaths = [];
    secrets."wireguard/cortana/private" = {};
    secrets."wifi/laptop" = {};
    secrets."users/eivbro".neededForUsers = true;
    secrets."users/root".neededForUsers = true;
  };
}
