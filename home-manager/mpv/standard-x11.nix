{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.sponsorblock ];
    config = {
      hwdec = "auto-safe";
      vo = "x11";
    };
  };
}


