{ config, pkgs, ... }:

{
  sops = {
    defaultSopsFile = ../secrets/secrets-course.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [ "/root/.ssh/ssh_host_ed25519_key" ];
    age.keyFile = "/root/.config/keys.txt";
    age.generateKey = true;
    gnupg.sshKeyPaths = [];
    secrets."users/elev".neededForUsers = true;
    secrets."users/teacher".neededForUsers = true;
    secrets."users/root".neededForUsers = true;
  };
}
