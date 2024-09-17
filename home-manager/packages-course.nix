{ pkgs, ... }:
{
  home.packages = with pkgs; [
    anki
    appimage-run
    brightnessctl
    grimblast
    htop
    hunspell
    hunspellDicts.nb-no
    libreoffice-qt
    nmap
    p7zip
    powertop
    tmux
    unrar
    unzip
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
