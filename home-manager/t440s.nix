{ pkgs, inputs, ... }:
{
  imports = 
    [
      ./waybar.nix
      ./hyprland.nix
      ./git.nix
      ./mpv.nix
      ./firefox.nix
      ./theming.nix
      ./packages.nix
    ];

  home.username = "eivbro";
  home.homeDirectory = "/home/eivbro";
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  programs.obs-studio.enable = true;
}
