{ pkgs, ... }:
{
  basePackages = with pkgs; [
    borgbackup
    bottom
    curl
    file
    git
    killall
    less
    ripgrep
    rsync
    tree
    unzip
    vim
    wget
  ];
}

