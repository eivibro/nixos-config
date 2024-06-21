{ pkgs, lib, ... }:
{
  home.pointerCursor = lib.mkForce {
    package = pkgs.catppuccin-cursors.frappeTeal;
    name = "Catppuccin-Frappe-Teal-Cursors";
    gtk.enable = true;
#    size = lib.mkForce 24;
    size = 24;
    x11 = {
      enable = true;
      defaultCursor = "Catppuccin-Frappe-Teal-Cursors";
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;

    #theme = {
    #  name = "Adwaita-dark";
    #  package = pkgs.gnome-themes-extra;
    #};
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}
