{ config, pkgs, ... }
{
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
        #mount /mnt/backup-media/desktop/documents
        #mount /mnt/backup-media/desktop/pictures
        #mount /mnt/backup-media/laptop/documents
        #mount /mnt/backup-media/laptop/pictures
      '';
      ExecStop = pkgs.writeShellScript "backup-media-lock" ''
        #umount /mnt/backup-media/desktop/documents
        #umount /mnt/backup-media/desktop/pictures
        #umount /mnt/backup-media/laptop/documents
        #umount /mnt/backup-media/laptop/pictures
        ${pkgs.cryptsetup}/bin/cryptsetup close crypted-media
      '';
    };
  };
}
