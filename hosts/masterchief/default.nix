{ config, pkgs, ... }:

{
  imports = [
    ./hardware-masterchief.nix
    ./disk-config.nix
    ../../modules/sops.nix
    ../../modules/wifi.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    ../../modules/standard-desktop.nix
  ];

  boot.kernelParams = [ "ip=::::masterchief:enp4s0:dhcp:" ];
  boot.initrd = {
    availableKernelModules = [ "igb" ];
    network = {
      enable = true;
      ssh = {
        enable = true;
        port = 2222;
        shell = "/bin/cryptsetup-askpass";
        hostKeys = [ "/etc/secrets/initrd/ssh_host_ed25519_key" ];
        authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF2L5pouZVhwl3YAYSc7OEQQseM5fVFYD2/zzVqHzzzA root@auto" ]; 
      };
    };
  };

  networking.hostName = "masterchief"; 

  environment.sessionVariables = rec {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Nvidia
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" "/home" ];
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };
 
  programs = {
    steam = {
      enable = true;
    };
  };

  networking.firewall.enable = false;
}

