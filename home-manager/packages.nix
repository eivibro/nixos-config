{ pkgs, ... }:
{
  # Packages to install
  home.packages = with pkgs; [
    appimage-run
    brightnessctl
    croc
    discord
    element-desktop-wayland
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
    wl-clipboard
    wlr-randr
    ytfzf
  ];
}
