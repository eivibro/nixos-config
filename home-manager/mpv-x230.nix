{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.sponsorblock ];
   # package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override { vapoursynthSupport = true; }) {
   #   youtubeSupport = true; };
    config = {
      geometry = "0%:0%";
      autofit-larger = "30%x30%";
      hwdec = "auto";
      ytdl-raw-options="format-sort=vcodec:h264";
      ytdl-format="bv[height<=?720]+ba";
    };
  };
}


