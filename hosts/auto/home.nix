{ lib, pkgs, config, inputs, ... }:
{
  imports = 
    [
      ../../home-manager/hyprland/waybar.nix
      ../../home-manager/hyprland/default.nix
      #../../home-manager/hyprland/hyprland.nix
      #../../home-manager/hyprland/hyprlock.nix
      #../../home-manager/hyprland/hypridle.nix
      ../../home-manager/git.nix
      ../../home-manager/dunst.nix
      ../../home-manager/mpv/mpv.nix
      ../../home-manager/firefox.nix
      ../../home-manager/yt-dlp.nix
      ../../home-manager/theming.nix
      ../../home-manager/packages.nix
      ../../home-manager/wpaperd.nix
    ];
  home.packages = with pkgs; [
    steam
  ];

  stylix.opacity.terminal = 0.9;
  stylix.targets.nixvim.transparent_bg.main = true;
  

  home.username = "eivbro";
  home.homeDirectory = "/home/eivbro";
  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
