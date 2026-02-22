{
  disko.devices = {
    disk = {
      os = {
        type = "disk";
	#device = "/dev/disk/by-id/nvme-WDC_PC_SN730_SDBQNTY-256G-1001-200903805081_1";
	device = "/dev/nvme1n1";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [
                  "defaults"
                ];
              };
            };
            root = {
              size = "100%";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                subvolumes = {
                  "@rootfs" = {
                    mountpoint = "/";
                    mountOptions = [ "compress=zstd:3" "noatime" ];
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = [ "compress=zstd:3" "noatime" ];
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "compress=zstd:3" "noatime" ];
                  };
                  "@swap" = {
                    mountpoint = "/.swapvol";
                    swap.swapfile.size = "16G";
                    mountOptions = [ "noatime" ];
                  };
                };
              };
            };
          };
        };
      };
      documents= {
        type = "disk";
	device = "/dev/disk/by-id/nvme-SAMSUNG_MZVLB256HAHQ-000L7_S41GNY0K708627_1";
        content = {
          type = "gpt";
          partitions = {
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted-documents";
	        initrdUnlock = false;
                passwordFile = "/tmp/secret.key";
		settings = {
		  allowDiscards = true;
		};
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "@backup" = {
                      mountpoint = "/mnt/backup-documents";
                      mountOptions = [ "nofail" "compress=zstd:3" "noatime" ];
                    };
                  };
                };
              };
            };
          };
        };
      };
      media = {
        type = "disk";
	device = "/dev/disk/by-id/nvme-Corsair_MP600_ELITE_AA4HB442003AQO_1";
        content = {
          type = "gpt";
          partitions = {
            luks = {
              size = "100%";
              content = {
                type = "luks";
                name = "crypted-media";
	        initrdUnlock = false;
                passwordFile = "/tmp/secret.key";
		settings = {
		  allowDiscards = true;
		};
                content = {
                  type = "btrfs";
                  extraArgs = [ "-f" ];
                  subvolumes = {
                    "@backup" = {
                      mountpoint = "/mnt/backup-media";
                      mountOptions = [ "nofail" "compress=zstd:3" "noatime" ];
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}
