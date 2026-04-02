{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    ./hardware.nix
    ./disk-config.nix
    ./routing.nix
    ./unlock-backup.nix
    ../../modules/sops.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    ../../modules/standard-desktop.nix
    inputs.nix-utils.nixosModules.switch-fix
  ];

  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" "/home" ];
  };

  users.groups.btrbk = {};
  users.users.btrbk = {
    isSystemUser = true;
    group = "btrbk";
    shell = pkgs.bash;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE47s9CUtd3+YxUJvm2Ty5m6BUxpooB0unD9u53uEYUM backup@x1-carbon"
    ];
  };

  networking.hostName = "m920q-multi"; 
}

