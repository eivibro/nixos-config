{ pkgs, ... }:
{
  # Packages to install
  home.packages = with pkgs; [
    croc
    htop
    jellyfin-media-player
    moonlight-qt
    obsidian
    powertop
    tmux
    tor-browser-bundle-bin
    unrar
    unzip
    wlr-randr
    yt-dlp
    ytfzf
  ];
}
