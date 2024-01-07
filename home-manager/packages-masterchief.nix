{ pkgs, ... }:
{
  # Packages to install
  home.packages = with pkgs; [
    yuzu-mainline
    sunshine
    element-desktop
  ];
}
