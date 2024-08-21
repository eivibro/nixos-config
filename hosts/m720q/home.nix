{ pkgs, inputs, ... }:
{
  imports = 
    [
      ../../home-manager/hyprland/waybar.nix
      ../../home-manager/hyprland/hyprland.nix
      ../../home-manager/git.nix
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

  home.username = "elev";
  home.homeDirectory = "/home/elev";
  home.stateVersion = "23.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
