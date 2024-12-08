{ pkgs, lib, ... }:
{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
  };
}
