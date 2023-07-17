{ config, pkgs, inputs, ... }:
{
  imports = 
    [
      ./waybar.nix
      ./hyprland.nix
      ./git.nix
      ./mpv.nix
      ./firefox.nix
      ./theming.nix
    ];

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "eivbro";
  home.homeDirectory = "/home/eivbro";
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  # Packages to install
  home.packages = with pkgs; [
    htop
    ytfzf
    wlr-randr
    powertop
    yt-dlp
    tmux
    obsidian
    moonlight-qt
    jellyfin-media-player
    tor-browser-bundle-bin
  ];


  #Graphical system configurations

}
