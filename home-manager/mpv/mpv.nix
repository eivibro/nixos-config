{ pkgs, ... }:
{
  imports = [
    ./standard.nix
  ];

  programs.mpv = {
    config = {
      geometry = "0%:0%";
      autofit-larger = "14%x14%";
      ytdl-raw-options="format-sort=vcodec:h264";
    };
  };
}


