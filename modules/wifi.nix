{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
      environmentFiles = [ 
        /run/secrets/wifi/laptop
	];
      profiles = {
        LKgjest = {
          connection = {
            id = "LKgjest";
            uuid = "d2341184-1dbd-4fab-ae38-a6b2c9afb841";
            type = "wifi";
            interface-name = "wlp3s0";
          };
          wifi = {
            mode = "infrastructure";
            ssid = "LKgjest";
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
        vaifai = {
          connection = {
            id = "vaifai";
            uuid = "d96adcb5-9c2e-4f6d-8280-1736e181479b";
            type = "wifi";
            interface-name = "wlp3s0";
          };
          wifi = {
            mode = "infrastructure";
            ssid = "vaifai";
          };
          wifi-security = {
            auth-alg = "open";
            key-mgmt = "wpa-psk";
            psk = "$PSK_BROR_WIFI";
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
        STRONG_Extender1600_A7P6 = {
          connection = {
            id = "STRONG_Extender1600_A7P6";
            uuid = "43cb171d-47eb-47a3-8c9a-98df783a9100";
            type = "wifi";
            interface-name = "wlp3s0";
            timestamp = "1690146263";
          };
          wifi = {
            mode = "infrastructure";
            ssid = "STRONG_Extender1600_A7P6";
          };
          wifi-security = {
            auth-alg = "open";
            key-mgmt = "wpa-psk";
            psk = "$PSK_HAAKONSVEI_WIFI";
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
        Berglivegen10 = {
          connection = {
            id = "Berglivegen10";
            uuid = "8d9740d3-3d47-4341-b5e4-0f3c59b7a7a0";
            type = "wifi";
            interface-name = "wlp3s0";
            timestamp = "1688760609";
          };
          wifi = {
            mode = "infrastructure";
            ssid = "Berglivegen10";
          };
          wifi-security = {
            auth-alg = "open";
            key-mgmt = "wpa-psk";
            psk = "$PSK_BERGLIVEGEN";
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
