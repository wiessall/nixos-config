_: {

  # In order to mount the backup to restore files, perform the following:
  #
  #    mkdir backup
  #    sudo borg-job-borgbase mount z2sqv4mw@z2sqv4mw.repo.borgbase.com:repo ./backup
  # 
  # Then copy out the files you need using normal Linux commands. Once complete, unmount
  # with:
  #
  #    borg-job-borgbase umount backup
  services.borgbackup.jobs."vivaldi" = {
    paths = [ "/home" "/etc" "/root" "/var" ];
    exclude = [
      "**/Downloads"
      "**/.cache"
      "/var/tmp"
    ];
    repo = "ssh://${config.sops.secrets."borg/vivaldi/user".path}@valentini/mnt/borg1/borg";
    startAt = "*-*-* 12:00:00";
  };
}
