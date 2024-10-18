{ pkgs, ... }:
{
  basePackages = with pkgs; [
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

