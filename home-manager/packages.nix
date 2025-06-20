{ pkgs, ... }:
{
  home.packages = with pkgs; [
    anki
    appimage-run
    brightnessctl
    croc
    #discord
    distrobox
    element-desktop
    electrum
    freecad-wayland
    grimblast
    htop
    hunspell
    hunspellDicts.nb-no
    kicad
    libreoffice-qt
    nmap
    moonlight-qt
    p7zip
    powertop
    tmux
    tor-browser-bundle-bin
    unrar
    unzip
    #ventoy-bin
    wl-clipboard
    wlr-randr
  ];

  # Programs to use with Stylix
  programs.kitty.enable = true;

  programs.tofi = {
    enable = true;
    settings = {
      horizontal = "true";
      height = "5%";
      border-width = 3;
      outline-width = 0;
      prompt-padding = 10;
      result-spacing = 20;
      corner-radius = 10;
      anchor = "top";
      padding-top = 2;
      width = "99%";
      clip-to-padding = "true";
      margin-top = "1%";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
