# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running `nixos-help`).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-masterchief.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernel.sysctl."kernel.sysrq" = 1;
  boot.supportedFilesystems = [ "ntfs" ];

  networking.hostName = "masterchief"; # Define your hostname.
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
    keyMap = "no";
    # useXkbConfig = true; # use xkbOptions in tty.
  };

  environment.sessionVariables = rec {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Nvidia
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  #virtualisation = {
  #  podman = {
  #    enable = true;
  #  };
  #};

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
  };
 
  # NeoVim
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
  # Steam
  programs.steam = {
    enable = true;
  };

  # Nix Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Configure keymap in X11
  # services.xserver.layout = "no";
  # services.xserver.xkbOptions = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  #sound.enable = true;
  #hardware.pulseaudio.enable = true;
  # Not strictly required but pipewire will use rtkit if it is present
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
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
    wget
  ];

  fonts.packages = with pkgs; [
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
  services.openssh.enable = true;

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

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}

