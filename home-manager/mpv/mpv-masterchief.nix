{ pkgs, ... }:
{
  imports = [
    ./standard.nix
  ];

  programs.mpv = {
   # package = pkgs.wrapMpv (pkgs.mpv-unwrapped.override { vapoursynthSupport = true; }) {
   #   youtubeSupport = true; };
    config = {
      geometry = "0%:0%";
      autofit-larger = "20%";
      ytdl-format="bv[height<=?1440]+ba/b[heigh<=?1440]";
    };
  };
}


