{ pkgs, inputs, ... }:
{
  imports = 
    [
      ../../home-manager/hyprland/waybar.nix
      ../../home-manager/hyprland/default.nix
      ../../home-manager/git.nix
      ../../home-manager/gammastep.nix
      ../../home-manager/mpv/mpv-masterchief.nix
      ../../home-manager/firefox.nix
      ../../home-manager/theming.nix
      ../../home-manager/packages.nix
      ../../home-manager/packages-masterchief.nix
      ../../home-manager/stylix.nix
    ];

  home.username = "eivbro";
  home.homeDirectory = "/home/eivbro";
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFileSize = 10000;
  };
}
