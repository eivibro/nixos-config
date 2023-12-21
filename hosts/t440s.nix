{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #<nixos-hardware/lenovo/thinkpad/t440s>
      ./hardware-t440s.nix
    ];
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.sshKeyPaths = [ "/home/eivbro/.ssh/ssh-secret" ];
  sops.age.keyFile = "/home/eivbro/.config/sops/age/keys.txt";

  sops.secrets."wireguard/cortana/private" = {};

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernel.sysctl."kernel.sysrq" = 1;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

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
  
  # NeoVim
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

  # Power tuning 
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
  users.users.eivbro = {
    isNormalUser = true;
    home = "/home/eivbro";
    extraGroups = [ "wheel" "audio" "video" "networkmanager"];
    packages = with pkgs; [
      kitty
      pavucontrol
    ];
  };

  environment.systemPackages = with pkgs; [
    bemenu
    brightnessctl
    wget
    wireguard-tools
  ];

  fonts.packages = with pkgs; [
    font-awesome
    nerdfonts
  ];

  # services.openssh.enable = true;
  networking.firewall.enable = false;

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

  system.copySystemConfiguration = false;
  system.stateVersion = "23.05"; # Did you read the comment?

}

