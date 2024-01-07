{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-masterchief.nix
      ./disk-config.nix
      ../../modules/sops.nix
      ../../modules/wifi.nix
      ../../modules/users.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelParams = [ "ip=::::masterchief:enp4s0:dhcp:" ];
  boot.kernel.sysctl."kernel.sysrq" = 1;
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

  time.timeZone = "Europe/Oslo";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

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

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };
 
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    steam = {
      enable = true;
    };
  };
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    bemenu
    wget
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerdfonts
  ];

  services.openssh.enable = true;
  networking.firewall.enable = false;

  system.stateVersion = "23.05"; # Did you read the comment?
}

