{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox.override {
      cfg = { enableTridactylNative = true; };
    };
    #nativeMessagingHosts = pkgs.tridactyl-native;
    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
	settings = {
          "browser.startup.homepage" = "https://duckduckgo.com";
	  "gfx.font_rendering.fontconfig.max_generic_substitutions" = 127;
	};
	extensions = with pkgs.nur.repos.rycee.firefox-addons; 
	[ 
	  ublock-origin 
	  #bypass-paywalls-clean
	  bitwarden
	  privacy-badger
	  clearurls
	  decentraleyes
	  duckduckgo-privacy-essentials
	  sponsorblock
	  unpaywall
	  #demodal
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
];
      };
    };
  };
}
