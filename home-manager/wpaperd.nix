{ pkgs, lib, ... }:
{
  services.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = ../hosts/auto/wallpaper;
	apply-shadow = true;
      };
    };
  };
}
