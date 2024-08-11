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
      ../../home-manager/wpaperd.nix
      ../../home-manager/vscodium.nix
    ];
  home.packages = with pkgs; [
    steam
  ];

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
