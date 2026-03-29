{ config, pkgs, ... }:
{
  boot.kernel.sysctl = { 
    "net.ipv4.ip_forward" = 1; 
    "net.ipv4.conf.wan0.rp_filter" = 1;
    "net.ipv4.conf.br-lan.rp_filter" = 2;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.rp_filter" = 0;
    "net.ipv4.conf.wan0.send_redirects" = 0;
    "net.ipv4.conf.wan0.accept_redirects" = 0;
    "net.ipv4.conf.wan0.accept_source_route" = 0;
    "net.ipv4.tcp_syncookies" = 1;     # SYN flood protection
    "net.ipv4.icmp_echo_ignore_broadcasts" = 1;
    "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
    "net.ipv4.conf.wan0.log_martians" = 1;
    "net.ipv4.tcp_tw_reuse" = 1;
    "net.ipv4.tcp_fin_timeout" = 15;
  };

  networking = {
    enableIPv6 = false;
    useNetworkd = true;
    useDHCP = false;
    nameservers = [ "127.0.0.1" ];
    nat.enable = false;
    firewall.enable = false;
    nftables = {
      enable = true;
      flushRuleset = true;
      checkRuleset = true;  # Set to false until syntax is 100% confirmed working
      tables = {
        filter = {
          family = "inet";
          content = ''
            chain input {
              type filter hook input priority filter; policy drop;

              iifname "wan0" ip saddr {
                0.0.0.0/8, 10.0.0.0/8, 127.0.0.0/8, 169.254.0.0/16,
                172.16.0.0/12, 192.168.0.0/16, 224.0.0.0/4, 240.0.0.0/4,
                255.255.255.255/32
              } log prefix "SPOOF-INP: " drop comment "anti-spoofing"

              iifname "wan0" udp dport 51434 accept comment "WireGuard from Internet"
	      iifname "wan0" udp dport 51435 accept comment "WireGuard roadwarrior from Internet"

              iifname "wg0" accept comment "WireGuard tunnel to m920q host"
	      iifname "wg1" accept comment "WireGuard roadwarrior to m920q host"

              iif "lo" accept
              ct state established,related accept
              iifname { "br-lan", "lan0", "lan1", "lan2", "lan3" } accept comment "LAN to router"

              iifname "wan0" ct state new meter ipv4-wan-new { ip saddr limit rate 10/second burst 25 packets } accept comment "rate-limit new connections from Internet"
              iifname "wan0" ct state new log prefix "RATE-LIMIT-EXCEED: " flags all drop comment "log & drop excess new WAN connections"

              iifname "wan0" log prefix "DROP-WAN-UNWANTED: " drop comment "log & drop all other WAN input"
            }

            chain forward {
              type filter hook forward priority filter; policy drop;

              ct state established,related accept
              iifname "br-lan" oifname { "wan0", "wg0" } accept
              iifname "wg0" oifname "br-lan" accept
	      iifname "wg0" oifname "wg1" accept comment "site-to-site to roadwarrior"
	      iifname "wg1" oifname "wan0" accept comment "roadwarrior to WAN"
	      iifname "wg1" oifname "br-lan" accept comment "roadwarrior to LAN"
	      iifname "wg1" oifname "wg0"  accept comment "roadwarrior to site-to-site tunnel"
            }
          '';
        };

        nat = {
          family = "ip";
          content = ''
            chain postrouting {
              type nat hook postrouting priority srcnat; policy accept;
              ip saddr 192.168.70.0/24 oifname "wan0" masquerade comment "NAT LAN clients to WAN"
	      ip saddr 10.201.0.0/24 oifname "wan0" masquerade comment "NAT roadwarrior clients to WAN"
            }
          '';
        };
      };
    };
  };
  systemd.network = {
    wait-online.enable = false;

    links = {
      "10-wan" = {
        matchConfig.MACAddress = "00:e2:59:02:7b:89";
	linkConfig.Name = "wan0";
      };
      "10-lan0" = {
        matchConfig.MACAddress = "00:e2:59:02:7b:88";
	linkConfig.Name = "lan0";
      };
      "10-lan1" = {
        matchConfig.MACAddress = "00:e2:59:02:7b:87";
	linkConfig.Name = "lan1";
      };
      "10-lan2" = {
        matchConfig.MACAddress = "00:e2:59:02:7b:86";
	linkConfig.Name = "lan2";
      };
      "10-lan3" = {
        matchConfig.MACAddress = "8c:16:45:b4:6b:60";
	linkConfig.Name = "lan3";
      };
    };

    netdevs = {
      "br-lan" = {
        netdevConfig = {
          Name = "br-lan";
          Kind = "bridge";
        };
      };

      "wg0" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "wg0";
        };
        wireguardConfig = {
          PrivateKeyFile = config.sops.secrets."wireguard/tunnel/haakonsvei".path;
          ListenPort = 51434;
        };
        wireguardPeers = [
          {
            PublicKey = "tLNNGNbIwqyMaHLGSGrB7/XfRiuFTW7YyXIzQt3hAzE=";
            AllowedIPs = [ "192.168.41.0/24" "10.200.0.1/32" ];
            Endpoint = "wireguard.brox.tech:51434";
	    PersistentKeepalive = 25;
          }
	];
      };

      "wg1" = {
        netdevConfig = {
          Kind = "wireguard";
          Name = "wg1";
        };
        wireguardConfig = {
          PrivateKeyFile = config.sops.secrets."wireguard/external-haakonsvei/interface".path;
          ListenPort = 51435;  # different port from wg0
        };
        wireguardPeers = [
          {
            PublicKey = "+tuTjpk6mA0CAwft6a9XJxpDQpka28FprVlRW0NEqQ8=";
            AllowedIPs = [ "10.201.0.2/32" ];  
          }
        ];
      };
    };

    networks = {
      "10-lan-port0" = {
        matchConfig.Name = "lan0";
        networkConfig = {
          Bridge = "br-lan";
        };
      };
      "10-lan-port1" = {
        matchConfig.Name = "lan1";
        networkConfig = {
          Bridge = "br-lan";
        };
      };
      "10-lan-port2" = {
        matchConfig.Name = "lan2";
        networkConfig = {
          Bridge = "br-lan";
        };
      };
      "10-lan-port3" = {
        matchConfig.Name = "lan3";
        networkConfig = {
          Bridge = "br-lan";
        };
      };

      "20-br-lan" = {
        matchConfig.Name = "br-lan";
        address = [
          "192.168.70.1/24"
        ];
        networkConfig = {
          ConfigureWithoutCarrier = true;
        };
      };

      "30-wan" = {
        matchConfig.Name = "wan0";
        networkConfig = {
          DHCP = "ipv4";
	  #ConfigureWithoutCarrier = true;
        };
        dhcpV4Config = {
          UseDNS = false;
        };
      };

      "wg0" = {
        matchConfig.Name = "wg0";
        address = [
          "10.200.0.2/24"
        ];
	
        routes = [
          {
            Destination = "192.168.41.0/24";
          }
        ];
      };
      "wg1" = {
        matchConfig.Name = "wg1";
        address = [ "10.201.0.1/24" ];  # router's tunnel IP
      };
    };
  };
  services.dnsmasq = {
    enable = true;
    settings = {
      log-queries = true; 
      interface = [ "br-lan" ];
      bind-interfaces = true;
      listen-address = [ "127.0.0.1" "192.168.70.1" ];
      dhcp-range = [
        "192.168.70.100,192.168.70.200,12h"
      ];
      local-service = true;
      server = [
        "1.1.1.1"
        "8.8.8.8"
      ];
      domain-needed = true;
      bogus-priv = true;
      all-servers = true;
    };
  };

  environment.systemPackages = with pkgs; [
    tcpdump
    iproute2
    dig
    nftables
    net-tools
  ];

  services.prometheus = {
    enable = true;
    port = 9090;
    exporters = {
      node = {
        enable = true;
        port = 9100;
        enabledCollectors = [ "systemd" "nftables" ];
      };
      wireguard = {
        enable = true;
        port = 9586;
      };
    };
    scrapeConfigs = [
      {
        job_name = "m920q";
        static_configs = [{ targets = [ "localhost:9100" ]; }];
      }
      {
        job_name = "wireguard";
        static_configs = [{ targets = [ "localhost:9586" ]; }];
      }
    ];
  };
  services.grafana = {
    enable = true;
    settings.server = {
      http_addr = "192.168.70.1";
      http_port = 3000;
    };
    settings = {
      security.secret_key = "$__file{/run/secrets/grafana/secretKey}";
    };
    provision = {
      enable = true;
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          url = "http://localhost:9090";
          isDefault = true;
        }
      ];
    };
  };
}
