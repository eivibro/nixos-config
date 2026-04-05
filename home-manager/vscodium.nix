{ inputs, pkgs, ... }:
{
  programs.vscode = {
    package = pkgs.vscodium;
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        #ms-python.python
        #asvetliakov.vscode-neovim
        #arrterian.nix-env-selector
	continue.continue
      ];
      userSettings = {
        #"extensions.experimental.affinity" = {
        #  "asvetliakov.vscode-neovim" = 1;
        #};
        "workbench.startupEditor" = "none";
      };
    };
  };
home.file.".continue/config.json".text = ''
{
  "models": [
    {
      "title": "⚡ Fast Autocomplete",
      "provider": "openai",
      "model": "fast-auto",
      "apiBase": "http://127.0.0.1:4000/v1",
      "apiKey": "dummy"
    },
    {
      "title": "💬 General Chat",
      "provider": "openai",
      "model": "chat-auto",
      "apiBase": "http://127.0.0.1:4000/v1",
      "apiKey": "dummy"
    },
    {
      "title": "💻 Coding (Auto Chain)",
      "provider": "openai",
      "model": "coding-auto",
      "apiBase": "http://127.0.0.1:4000/v1",
      "apiKey": "dummy"
    }
  ],

  "defaultModel": "💬 General Chat",

  "tabAutocompleteModel": {
    "title": "⚡ Fast Autocomplete",
    "provider": "openai",
    "model": "fast-auto",
    "apiBase": "http://127.0.0.1:4000/v1",
    "apiKey": "dummy"
  }
}
'';
}
