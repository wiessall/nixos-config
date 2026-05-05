{
  config,
  hostname,
  pkgs,
  lib,
  self,
  ...
}:
{
  imports = lib.optional (builtins.pathExists (./. + "/${hostname}.nix")) ./${hostname}.nix;

  #
  systemd.services."wake-valentini" = {
    description = "Wake valentini via WoL and wait for SSH";
    before = [ "borgbackup-job-vivaldi.service" ];
    requiredBy = [ "borgbackup-job-vivaldi.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "wake-valentini" ''
        ${pkgs.wakeonlan}/bin/wakeonlan -i 192.168.1.255 90:1b:0e:d9:05:a2
        # Wait for SSH to come up
        for i in $(seq 1 60); do
          ${pkgs.openssh}/bin/ssh -o ConnectTimeout=5 root@valentini true 2>/dev/null && exit 0
          sleep 5
        done
        echo "Valentini did not come up in time"
        exit 1
      '';
    };
  };
  # See individual host config files for backup/restore instructions.
  services.borgbackup.jobs."vivaldi" = {
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat ${config.sops.secrets."borg/vivaldi/pw".path}";
    };
    compression = "zstd,3";
  };
}
