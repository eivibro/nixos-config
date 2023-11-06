{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.sponsorblock ];
   # package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override { vapoursynthSupport = true; }) {
   #   youtubeSupport = true; };
    config = {
      autofit-larger = "20%";
      hwdec = "auto";
      ytdl-raw-options="format-sort=vcodec:h264";
      ytdl-format="bv[height<=?1440]+ba";
    };
  };
}


