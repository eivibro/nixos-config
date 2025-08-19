{ pkgs, ... }:
{
  imports = [
    ./standard.nix
  ];

  programs.mpv = {
    config = {
      geometry = "0%:0%";
      autofit-larger = "14%x14%";
      ytdl-format="bv[height<=?1080]+ba/b[height<=?1080]";
    };
  };
}


