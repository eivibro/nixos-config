{ inputs, pkgs, config, ... }:
{
  programs.vscode = {
    package = pkgs.vscodium;
    enable = true;
    mutableExtensionsDir = false;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        ms-python.python
        ms-python.black-formatter
        asvetliakov.vscode-neovim
	continue.continue
	mkhl.direnv
      ];

      userSettings = {
        "extensions.experimental.affinity" = {
          "asvetliakov.vscode-neovim" = 1;
        };
        "vscode-neovim.neovimExecutablePaths.linux" = "${pkgs.neovim}/bin/nvim";

        "workbench.startupEditor" = "none";

        # Python
        "python.defaultInterpreterPath" = "python3";
        "[python]" = {
          "editor.defaultFormatter" = "ms-python.black-formatter";
          "editor.formatOnSave" = true;
        };

        # Let Continue handle AI completions, disable built-in inline suggestions
        # so they don't fight each other
        "editor.inlineSuggest.enabled" = true;
        "python.analysis.typeCheckingMode" = "basic";
      };
    };
  };

  # Secure Continue.dev configuration using config.yaml (preferred format)
  sops.templates."continue-config.yaml" = {
    content = ''
      name: My Local Config
      version: 1.0.0
      schema: v1

      models:
        - name: fast-autocomplete
          provider: openai
          model: fast-auto
          apiBase: http://192.168.44.10:4000/v1
          apiKey: ${config.sops.placeholder."litellm/litellm_master_key"}
          roles:
            - autocomplete

        - name: general-chat
          provider: openai
          model: chat-auto
          apiBase: http://192.168.44.10:4000/v1
          apiKey: ${config.sops.placeholder."litellm/litellm_master_key"}
          roles:
            - chat

        - name: coding
          provider: openai
          model: coding-auto
          apiBase: http://192.168.44.10:4000/v1
          apiKey: ${config.sops.placeholder."litellm/litellm_master_key"}
          roles:
            - edit
            - apply

      defaultModel: general-chat

      # Explicitly define autocomplete model (this helps Continue recognize it)
      tabAutocompleteModel: fast-autocomplete

      # Autocomplete-specific settings
      tabAutocompleteOptions:
        disableInFiles: false
        debounce: 100
        maxTokens: 80
        temperature: 0.2
    '';
  };

  # Reliable activation hook — creates symlink to the correct location
  home.activation.continueConfig = config.lib.dag.entryAfter ["writeBoundary"] ''
    mkdir -p ${config.home.homeDirectory}/.continue
    ln -sf ${config.sops.templates."continue-config.yaml".path} ${config.home.homeDirectory}/.continue/config.yaml
  '';
}
