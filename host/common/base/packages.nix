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
    sed
    tree
    unzip
    vim
    wget
  ];
}

