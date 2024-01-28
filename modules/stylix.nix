{ config, pkgs, ... }:

{
  stylix = {
    image = ../hosts/auto/wallpaper.jpg;
    polarity = "dark";
    targets.nixvim.enable = true;
  };
}
