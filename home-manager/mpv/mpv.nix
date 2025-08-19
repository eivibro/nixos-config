{ pkgs, ... }:
{
  imports = [
    ./standard.nix
  ];

  programs.mpv = {
    config = {
      geometry = "0%:0%";
      autofit-larger = "14%x14%";
      ytdl-format="bv[height<=?1080][vcodec^=av01]+ba/bv[height<=?1080][vcodec^=vp9]+ba/bv[height<=?1080][vcodec^=hev1]+ba/bv[height<=?1080][vcodec^=avc1]+ba";
    };
  };
}


