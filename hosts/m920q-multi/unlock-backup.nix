{ config, pkgs, ... }:
{
  sops = {
    secrets."backup/luksPassword" = {};
  };
  systemd.services.backup-media-unlock = {
    description = "Unlock and mount backup media drive";
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = pkgs.writeShellScript "backup-media-unlock" ''
        ${pkgs.cryptsetup}/bin/cryptsetup open \
          /dev/disk/by-uuid/26bd9737-ebc5-41ac-a0ba-a51b8781ce5b \
          crypted-media \
          --key-file ${config.sops.secrets."backup/luksPassword".path}
	${pkgs.util-linux}/bin/mount /dev/mapper/crypted-media /mnt/backup-media/
      '';
      ExecStop = pkgs.writeShellScript "backup-media-lock" ''
        ${pkgs.util-linux}/bin/umount /mnt/backup-media
        ${pkgs.cryptsetup}/bin/cryptsetup close crypted-media
      '';
    };
  };
}
