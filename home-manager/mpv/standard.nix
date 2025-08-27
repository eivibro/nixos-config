{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.sponsorblock ];
    config = {
      hwdec = "auto-safe";
      vo = "gpu-next";
      profile = "gpu-hq";
      gpu-api= "vulkan";
    };
  };
}


