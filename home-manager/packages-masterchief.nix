{ pkgs, ... }:
{
  # Packages to install
  home.packages = with pkgs; [
    cudaPackages.cudatoolkit
    sunshine
  ];
}
