{ pkgs, ... }:
{
  programs.yt-dlp= {
    enable = true;
    settings = {
      format = "bv[height<=?1080][vcodec^=av01]+ba/bv[height<=?1080][vcodec^=vp9]+ba/bv[height<=?1080][vcodec^=hev1]+ba/bv[height<=?1080][vcodec^=avc1]+ba";
      cookies-from-browser = "firefox";
    };
  };
}


