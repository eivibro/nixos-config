{ inputs, pkgs, ... }:
{
  programs.vscode = {
    package = pkgs.vscodium;
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        #asvetliakov.vscode-neovim
        arrterian.nix-env-selector
      ];
      userSettings = {
        #"extensions.experimental.affinity" = {
        #  "asvetliakov.vscode-neovim" = 1;
        #};
        "workbench.startupEditor" = "none";
      };
    };
  };
}
