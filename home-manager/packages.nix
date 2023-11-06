{ pkgs, ... }:
{
  # Packages to install
  home.packages = with pkgs; [
    libreoffice-qt
    hunspell
    hunspellDicts.nb-no
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
    unzip
    croc
  ];
}
