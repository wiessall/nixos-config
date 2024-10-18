{ config, pkgs, ... }:

{
  home.username = "tristan";
  home.homeDirectory = "/home/tristan";
  programs.zsh.enable = true;

  home.packages = with pkgs; [
    firefox
    neovim
  ];

  services = {
    mpd.enable = true;
  };
}

