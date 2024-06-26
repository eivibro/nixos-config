{ config, pkgs, inputs, lib, ... }:

{
  imports =
    [
      ./hardware.nix
      ./disk-config.nix
      ../../modules/sops.nix
      ../../modules/wifi.nix
      ../../modules/users.nix
      #../../modules/stylix.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernel.sysctl."kernel.sysrq" = 1;
  networking.hostName = "auto"; 
  security.pam.services.swaylock = {};

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "dvorak-no";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  nixpkgs.config.allowUnfree = true;
    
 
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  security.rtkit.enable = true;
  #Audio
  services.pipewire = {
    enable = true;
    # Compatibility shims, adjust according to your needs
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  # Power tuning 
  services.system76-scheduler.settings.cfsProfiles.enable = true;
  services.thermald.enable = true;
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    settings = {
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      USB_EXCLUDE_BTUSB=1;
    };
  };

  hardware.bluetooth.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    wireguard-tools
    hfsprogs
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerdfonts
  ];

  services.openssh.enable = true;
  networking.firewall.enable = false;

  #networking.wg-quick.interfaces = {
  #  wg0 = {
  #    address = [ "172.16.16.4/24" ];
  #    dns = [ "172.16.16.1" ];
  #    privateKeyFile = config.sops.secrets."wireguard/cortana/private".path;
  #    peers = [
  #      {
  #        publicKey = "GUugUinK9Smo4sjmQ+hXQ0DEhgBAvhoAoa5pZHk+cW4=";
  #        allowedIPs = [ "0.0.0.0/0" ];
  #        endpoint = "wireguard.brox.tech:51430";
  #        persistentKeepalive = 25;
  #      }
  #    ];
  #  };
  #};

  #xdg.portal.config.common.default = "*";
  system.copySystemConfiguration = false;
  system.stateVersion = "23.05"; 

}

