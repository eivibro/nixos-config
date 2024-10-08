{ config, pkgs, ... }:

{
  stylix = {
    enable = true;
    image = ../hosts/auto/wallpaper-course;
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 16;
    opacity.desktop = 0.9;
    polarity = "light";
  };
}
