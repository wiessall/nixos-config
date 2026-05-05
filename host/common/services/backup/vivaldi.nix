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
    paths = [
      "/home"
      "/etc"
      "/var"
      "/root"
    ];
    exclude = [
      "**/.cache"
      "**/.direnv"
      "**/node_modules"
      "**/result"
      "**/__pycache__"
      "**/*.pyc"
      "**/.npm"
      "**/.npm-global"
      "**/.cargo"
      "**/.rustup"
      "**/target"
      "/home/tristan/micromamba"
      "/home/tristan/Android"
      "/home/tristan/VirtualBox VMs"
      "/home/tristan/nix/*/result"
      "/home/tristan/scikit_learn_data"
      "/home/tristan/Downloads"
      "/home/tristan/Zotero/cache"
      "/home/tristan/Zotero/translators"
      "/home/tristan/customFiles"
      "/home/tristan/pipeline"
      "/home/tristan/logs"
      "/home/tristan/omero/tmp"
      "/var/lib/flatpak/repo/tmp"
      "/var/lib/docker"
      "/var/lib/containerd"
      "/var/cache"
      "/var/tmp"
      "/var/run"
    ];
    user = "root";
    repo = "root@valentini:/mnt/borg1/borg_repos/vivaldi";
#    doInit = false;
#    persistentTimer = true;
#    inhibitsSleep = true;
    environment = {
      ARCHIVE = "/mnt/borg1/borg_repos/vivaldi";
    };
    startAt = "*-*-* 10:00:00";
  };
}
