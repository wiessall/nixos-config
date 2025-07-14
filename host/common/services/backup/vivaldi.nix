{ config, pkgs, ... }:
{

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
    paths = "/home/tristan/test";
    exclude = [
#      "**/Downloads"
#      "**/.cache"
#      "/var/tmp"
    ];
    user = "root";
    repo = "root@100.103.126.11:/mnt/borg2/borg_repos/TEST";
#    doInit = false;
#    persistentTimer = true;
#    inhibitsSleep = true;
    environment = {
      ARCHIVE = "/mnt/borg2/borg_repos/TEST";
    };
    startAt = "*-*-* 12:00:00";
  };
}
