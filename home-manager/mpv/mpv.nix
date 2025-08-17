{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.sponsorblock ];
    config = {
      geometry = "0%:0%";
      autofit-larger = "14%x14%";
      hwdec = "auto-safe";
      vo = "gpu";
      profile = "gpu-hq";
      gpu-context = "wayland";
      ytdl-raw-options="format-sort=vcodec:h264";
      ytdl-format="bv[height<=?1080]+ba";
    };
  };
}


