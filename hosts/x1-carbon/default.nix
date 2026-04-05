{ config, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./disk-config.nix
    ../../modules/sops.nix
    ../../modules/wifi.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    ../../modules/printing.nix
    ../../modules/standard-laptop.nix
  ];

  networking.hostName = "carbon"; 
  networking.firewall.enable = false;

  programs.ssh.extraConfig = ''
    Host m920q-backup
      Hostname 192.168.70.1
      User btrbk
      IdentityFile /run/secrets/ssh/backup-x1-carbon
      StrictHostKeyChecking yes
      BatchMode yes
  '';
  sops.secrets."ssh/backup-x1-carbon" = {
    mode = "0400";
    owner = "root";
  };

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "172.16.16.4/24" ];
      dns = [ "172.16.16.1" ];
      privateKeyFile = config.sops.secrets."wireguard/cortana/private".path;
      peers = [
        {
          publicKey = "GUugUinK9Smo4sjmQ+hXQ0DEhgBAvhoAoa5pZHk+cW4=";
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "wireguard.brox.tech:51430";
          persistentKeepalive = 25;
        }
      ];
    };
  };
}

