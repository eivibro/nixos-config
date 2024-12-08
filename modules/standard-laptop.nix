{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernel.sysctl."kernel.sysrq" = 1;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.direnv = {
      enable = true;
      loadInNixShell = true;
      nix-direnv.enable = true;
  };


  security.pam.services.hyprlock = {};
  security.rtkit.enable = true;
  time.timeZone = "Europe/Oslo";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  services.openssh.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
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
    android-tools
    #(callPackage ./cake-wallet.nix {})
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.pathsToLink = [ "/share/bash-completion" ];

  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.droid-sans-mono
  ];

  system.copySystemConfiguration = false;
  system.stateVersion = "23.05"; 
}


