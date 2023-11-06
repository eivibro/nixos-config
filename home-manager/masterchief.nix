{ pkgs, inputs, ... }:
{
  imports = 
    [
      ./waybar.nix
      ./hyprland-masterchief.nix
      ./git.nix
      ./mpv-masterchief.nix
      ./firefox.nix
      ./theming.nix
      ./packages.nix
      ./packages-masterchief.nix
    ];

  home.username = "eivbro";
  home.homeDirectory = "/home/eivbro";
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
