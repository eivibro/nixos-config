{ pkgs, ... }:
{
  programs.yt-dlp= {
    enable = true;
    settings = {
      format-sort = "vcodec:h264";
      format = "bv[height<=?1080]+ba";
    };
  };
}


