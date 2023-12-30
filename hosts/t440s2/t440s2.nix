# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #<nixos-hardware/lenovo/thinkpad/t440s>
      ./hardware-t440s2.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernel.sysctl."kernel.sysrq" = 1;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Oslo";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "dvorak-no";
    #keyMap = "no";
    # useXkbConfig = true; # use xkbOptions in tty.
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
  # Configure keymap in X11
  # services.xserver.layout = "no";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  # Not strictly required but pipewire will use rtkit if it is present
  security.rtkit.enable = true;
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.eivbro = {
    isNormalUser = true;
    home = "/home/eivbro";
    extraGroups = [ "wheel" "audio" "video" "networkmanager"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      kitty
      pavucontrol
    ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    bemenu
    brightnessctl
    wget
    wireguard-tools
  ];

  fonts.fonts = with pkgs; [
    font-awesome
    nerdfonts
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.enable = false;
  # networking.firewall.allowedTCPPorts = [ 47984 47989 48010 ];
  # networking.firewall.allowedUDPPorts = [ 47998 47999 48000 48002 48010];
  # networking.firewall.allowedTCPPorts = [];
  # networking.firewall.allowedUDPPorts = [];
  #networking.firewall.allowedTCPPortRanges =
  #  [
  #    {
  #      #from = 47984;
  #      #to = 48010;
  #      from = 2810;
  #      to = 50000;
  #    }
  #  ];
  #networking.firewall.allowedUDPPortRanges =
  #  [
  #    {
  #      #from = 47998;
  #      #to = 48010;
  #      from = 2810;
  #      to = 50000;
  #    }
  #  ];
  # Or disable the firewall altogether.
  # enable NAT
  #networking.nat.enable = true;
  #networking.nat.externalInterface = "wlp3s0";
  #networking.nat.internalInterface =  [ "wg0" ];
  #networking.firewall = {
  #  allowedUDPPorts = [ 51430 ];
  #};

  networking.wg-quick.interfaces = {
    wg0 = {
      address = [ "172.16.16.5/24" ];
      dns = [ "172.16.16.1" ];
      # listenPort = 51430;
      privateKeyFile = "/home/eivbro/wireguard-keys/private";
      peers = [
        {
          publicKey = "GUugUinK9Smo4sjmQ+hXQ0DEhgBAvhoAoa5pZHk+cW4=";
          # allowedIPs = [ "192.168.41.0/24" "192.168.42.0/24" "192.168.43.0/24" "192.168.44.0/24" "192.168.45.0/24"];
          allowedIPs = [ "0.0.0.0/0" ];
          endpoint = "wireguard.brox.tech:51430";
          persistentKeepalive = 25;
        }
      ];
    };
  };

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  system.copySystemConfiguration = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

