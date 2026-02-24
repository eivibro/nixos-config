{ pkgs, ... }:
{
  imports = [
    ./standard-x11.nix
  ];

  programs.mpv = {
    config = {
      geometry = "0%:0%";
      autofit-larger = "14%x14%";
      ytdl-format="bv[height<=?1440][vcodec^=vp9]+ba/bv[height<=?1440][vcodec^=hev1]+ba/bv[height<=?1440][vcodec^=avc1]+ba";
    };
  };
}


