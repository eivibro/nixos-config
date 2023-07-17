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
      ytdl-format="bestvideo[height<=?1080][vcodec!=?vp9]+bestaudio/best";

    };
  };
}


