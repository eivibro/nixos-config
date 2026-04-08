{ lib, pkgs, config, inputs, ... }:
{
  imports = 
    [
      ../../home-manager/hyprland/waybar.nix
      ../../home-manager/hyprland/default.nix
      ../../home-manager/git.nix
      ../../home-manager/gammastep.nix
      ../../home-manager/stylix.nix
      ../../home-manager/dunst.nix
      ../../home-manager/mpv/mpv.nix
      ../../home-manager/firefox.nix
      ../../home-manager/yt-dlp.nix
      ../../home-manager/theming.nix
      ../../home-manager/packages.nix
      ../../home-manager/nvim.nix
      ../../home-manager/vscodium.nix
      ../../home-manager/starship.nix
    ];
  home.packages = with pkgs; [
    steam
  ];

  sops = {
    age.sshKeyPaths = [ "${config.home.homeDirectory}/.ssh/ssh_host_ed25519_key" ];
    defaultSopsFile = ../../secrets/secrets.yaml;
    secrets."litellm/litellm_master_key"= {};
  };

  home.username = "eivbro";
  home.homeDirectory = "/home/eivbro";
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFileSize = 10000;
  };
}
