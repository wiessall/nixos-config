{ pkgs, ... }:
{
  basePackages = with pkgs; [
    btm
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

