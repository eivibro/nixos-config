{ pkgs, lib, ... }:
{
  programs.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = "../hosts/auto/wallpaper.jpg";
	apply-shadow = true;
      };
    };
  };
}
