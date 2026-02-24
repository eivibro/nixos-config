{ pkgs, ... }:
{
  programs.yt-dlp= {
    enable = true;
    settings = {
      format = "bv[height<=?1440][vcodec^=vp9]+ba/bv[height<=?1440][vcodec^=hev1]+ba/bv[height<=?1440][vcodec^=avc1]+ba";
      cookies-from-browser = "firefox";
    };
  };
}


