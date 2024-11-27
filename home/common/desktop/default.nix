{ pkgs, inputs, desktop, ... }:
{
  imports = [
    (./. + "/${desktop}")

    ../dev

    ./firefox.nix
    ./alacritty.nix
    ./emacs.nix
  ];

  programs = {
    direnv = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
#    bitwarden-desktop
    age
    catppuccin-gtk
    devenv
    gimp
    inkscape
    kdePackages.qtstyleplugin-kvantum
    libreoffice-qt-fresh
    mattermost-desktop
    musicpod
    pamixer
    pavucontrol
    signal-desktop
    spotify
    thunderbird
    vlc
    xdg-utils
    xorg.xlsclients
    zoom
    zotero
  ];

  fonts.fontconfig.enable = true;
}
