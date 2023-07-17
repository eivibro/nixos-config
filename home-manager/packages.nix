{ pkgs, ... }:
{
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
}
