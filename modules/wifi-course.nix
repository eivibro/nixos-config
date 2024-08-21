{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;
    ensureProfiles = {
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
      };
    };
  };
}
