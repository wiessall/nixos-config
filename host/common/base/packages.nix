{ pkgs, ... }:
{
  basePackages = with pkgs; [
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

