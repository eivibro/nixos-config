{ pkgs, ... }:
{
  # Packages to install
  home.packages = with pkgs; [
    appimage-run
    brightnessctl
    croc
    discord
    element-desktop-wayland
    electrum
    htop
    hunspell
    hunspellDicts.nb-no
    jellyfin-media-player
    libreoffice-qt
    nmap
    moonlight-qt
    #obsidian
    powertop
    swaylock-fancy
    tmux
    tor-browser-bundle-bin
    unrar
    unzip
    ventoy-full
    wl-clipboard
    wlr-randr
    ytfzf
  ];

  # Programs to use with Stylix
  programs.bemenu.enable = true;
  programs.kitty.enable = true;
}
