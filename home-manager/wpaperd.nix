{ pkgs, lib, ... }:
{
  programs.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        #path = "/home/eivbro/nixos-config/hosts/auto/wallpaper.jpg";
        path = ../hosts/auto/wallpaper.png;
	apply-shadow = true;
      };
    };
  };
}
