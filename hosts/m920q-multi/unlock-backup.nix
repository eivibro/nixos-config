{ config, pkgs, ... }:
let
  btrbkCmd = pkgs.writeShellScript "btrbk-cmd" ''
    case "$SSH_ORIGINAL_COMMAND" in
      unlock)
        /run/wrappers/bin/sudo ${pkgs.systemd}/bin/systemctl start backup-media-unlock
        ;;
      lock)
        /run/wrappers/bin/sudo ${pkgs.systemd}/bin/systemctl stop backup-media-unlock
        ;;
      *)
        echo "Unknown command: $SSH_ORIGINAL_COMMAND"
        exit 1
        ;;
    esac
  '';
in
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
	${pkgs.util-linux}/bin/mount /dev/mapper/crypted-media /mnt/backup-documents/
	${pkgs.util-linux}/bin/mount /dev/mapper/crypted-media /mnt/laptop/pictures/
      '';
      ExecStop = pkgs.writeShellScript "backup-media-lock" ''
        ${pkgs.util-linux}/bin/umount /mnt/backup-media
        ${pkgs.util-linux}/bin/umount /mnt/backup-documents
        ${pkgs.util-linux}/bin/umount /mnt/laptop/pictures
        ${pkgs.cryptsetup}/bin/cryptsetup close crypted-media
      '';
    };
  };

  users.groups.btrbk = {};
  users.users.btrbk = {
    isSystemUser = true;
    group = "btrbk";
    shell = pkgs.bash;
    openssh.authorizedKeys.keys = [
      ''command="${btrbkCmd}",no-port-forwarding,no-X11-forwarding,no-agent-forwarding ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE47s9CUtd3+YxUJvm2Ty5m6BUxpooB0unD9u53uEYUM backup@x1-carbon''
    ];
  };

  security.sudo.extraRules = [
    {
      users = [ "btrbk" ];
      commands = [
        {
          command = "${pkgs.systemd}/bin/systemctl start backup-media-unlock";
          options = [ "NOPASSWD" ];
        }
        {
          command = "${pkgs.systemd}/bin/systemctl stop backup-media-unlock";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
