{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      nativeMessagingHosts = [
        pkgs.gnome-browser-connector
	pkgs.tridactyl-native
      ];
    };
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
	settings = {
          "browser.startup.homepage" = "https://duckduckgo.com";
	  "gfx.font_rendering.fontconfig.max_generic_substitutions" = 127;
	};
	extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; 
	[ 
	  ublock-origin 
	  bitwarden
	  privacy-badger
	  clearurls
	  decentraleyes
	  duckduckgo-privacy-essentials
	  sponsorblock
	  unpaywall
	  h264ify
	  tridactyl
	];
	bookmarks = [
	  {
	    name = "Home assistant intents";
	    url = "https://github.com/home-assistant/intents/tree/main/tests/en";
	  }
	  {
	    name = "Nix dev resources";
	    url = "https://github.com/mikeroyal/NixOS-Guide#NixOS-developer-resources";
	  }
	  {
	    name = "Getting Inputs to Modules in Flakes";
	    url = "https://blog.nobbz.dev/2022-12-12-getting-inputs-to-modules-in-a-flake/";
	  }
	  {
	    name = "Lading plass 47";
	    url = "https://lading.fjordkraft.no";
	  }
	  {
	    name = "NixOS options";
	    url = "https://mynixos.com/";
	  }
	  {
	    name = "Network manager to Nix";
	    url = "https://github.com/Janik-Haag/nm2nix";
	  }
	  {
	    name = "Binaries in Nix";
	    url = "https://unix.stackexchange.com/questions/522822/different-methods-to-run-a-non-nixos-executable-on-nixos/522823#522823";
	  }
        ];
      };
    };
  };
}
