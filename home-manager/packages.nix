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
    grimblast
    htop
    hunspell
    hunspellDicts.nb-no
    jellyfin-media-player
    kicad
    libreoffice-qt
    nmap
    #ns-usbloader
    moonlight-qt
    p7zip
    powertop
    swaylock-fancy
    tmux
    tor-browser-bundle-bin
    unrar
    unzip
    ventoy-bin
    wl-clipboard
    wlr-randr
  ];

  # Programs to use with Stylix
  programs.bemenu.enable = true;
  programs.kitty.enable = true;
}
