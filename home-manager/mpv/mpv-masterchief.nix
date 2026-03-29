{ pkgs, ... }:
{
  #imports = [
  #  ./standard.nix
  #];

  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.sponsorblock ];
    config = {
      geometry = "0%:0%";
      autofit-larger = "20%";
      #ytdl-format="bv[height<=?1440]+ba/b[heigh<=?1440]";
      vo = "gpu-next";
      gpu-api = "vulkan";
      hwdec = "nvdec-copy";
      hwdec-codecs = "h264,hevc,vp8,vp9";
    };
  };
}


