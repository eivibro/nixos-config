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
      };
    };
  };
}
