{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      environmentFiles = [ 
        /run/secrets/wifi/pixelb
	/run/secrets/wifi/eivind
	];
      profiles = {
        PixelB = {
          connection = {
            id = "PixelB";
            uuid = "d34a0501-09ef-42f0-9839-41837b9d7eac";
	    type = "wifi";
            interface-name = "wlp3s0";
            timestamp = "1701719616";
          };
          wifi = {
            mode = "infrastructure";
            ssid = "PixelB";
          };
          wifi-security = {
            auth-alg = "open";
            key-mgmt = "wpa-psk";
            psk = "$PSK_PHONE";
          };
          ipv4 = {
            method = "auto";
          };
          ipv6 = {
            addr-gen-mode = "default";
            method = "auto";
          };
          proxy = {
          };
        };  
        Eivind = {
          connection = {
            id = "Eivind";
            uuid = "86ca8dce-af15-4ac8-b5f6-63b7c9b52ba4";
            type = "wifi";
            interface-name = "wlp3s0";
            timestamp = "1701719593";
          };
          wifi = {
            mode = "infrastructure";
            ssid = "Eivind";
          };
          wifi-security = {
            auth-alg = "open";
            key-mgmt = "wpa-psk";
            psk = "$PSK_EIVIND";
          };
          ipv4 = {
            method = "auto";
          };
          ipv6 = {
            addr-gen-mode = "default";
            method = "auto";
          };
          proxy = {
          };
        };
      };
    };
  };
}
