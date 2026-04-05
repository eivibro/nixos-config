{ config, pkgs, ... }:

{
  imports = [
    ./hardware-masterchief.nix
    ./disk-config.nix
    ../../modules/sops.nix
    ../../modules/ai.nix
    ../../modules/wifi.nix
    ../../modules/users.nix
    ../../modules/stylix.nix
    ../../modules/standard-desktop.nix
  ];

  boot.kernelParams = [ "ip=::::masterchief:enp8s0:dhcp:" ];
  boot.initrd = {
    availableKernelModules = [ "igc" ];
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

  environment.systemPackages = [ 
    #pkgs.qemu 
    pkgs.podman-compose
    #pkgs.esptool
  ];

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  networking.hostName = "masterchief"; 

  environment.sessionVariables = rec {
    WLR_NO_HARDWARE_CURSORS = "1";
  };

  nixpkgs.config = {
    allowUnfree = true;
    cudaSupport = false;
  };

  # Nvidia
  hardware.graphics = {
    enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  services.fstrim.enable = true;
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" "/home" ];
  };

  #services.wyoming.satellite = {
  #  enable = true;
  #  user = "eivbro";
  #  group = "audio";
  #  microphone.command = "arecord -D default -r 16000 -c 1 -f S16_LE -t raw";
  #  name = "masterchief";
  #  area = "Kitchen";
  #};

  #services.wyoming.openwakeword.enable = true;

  #services.ollama = {
  #  enable = true;
  #  host = "0.0.0.0";
  #  package = pkgs.ollama-cuda;
  #  loadModels = [
  #    "llama3.3:8b"
  #    "llama3.3:8b"
  #    "mistral:8b"
  #    "qwen3.5:9b"
  #    "deepseek-r1:8b"
  #    "phi4:mini"
  #  ];
  #};

  #services.open-webui = {
  #  enable = true;
  #  port = 8080;
  #  host = "0.0.0.0";
  #  environment = {
  #    OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
  #    WEBUI_AUTH = "false";
  #  };
  #};

  #services.searx = {
  #  enable = true;
  #  package = pkgs.searxng;
  #  redisCreateLocally = true;

  #  settings = {
  #    general.debug = false;

  #    server = {
  #      bind_address = "192.168.44.10";
  #      port = 8888;
  #      secret_key = "local-testing-only";
  #      limiter = false;
  #      method = "GET";
  #    };

  #    search.formats = [ "html" "json" ];
  #  };
  #};

  services.sunshine = {
    enable = true;
    #autoStart = true;
    capSysAdmin = true;  # Required for Wayland, optional for Xorg
    openFirewall = true;
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
 
  programs = {
    steam = {
      enable = true;
    };
  };

  networking.firewall.enable = false;
}

