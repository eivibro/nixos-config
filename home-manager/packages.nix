{ pkgs, ... }:
{
  # Packages to install
  home.packages = with pkgs; [
    #appimage-run
    croc
    htop
    hunspell
    hunspellDicts.nb-no
    jellyfin-media-player
    libreoffice-qt
    moonlight-qt
    #obsidian
    powertop
    tmux
    tor-browser-bundle-bin
    unrar
    unzip
    ventoy-full
    wlr-randr
    yt-dlp
    ytfzf
  ];
}
