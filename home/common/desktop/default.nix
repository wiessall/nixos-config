{ pkgs, desktop, ... }:
{
  imports = [
    (./. + "/${desktop}")
  ];

  programs = {
    firefox.enable = true;
  };

  home.packages = with pkgs; [
#    bitwarden-desktop
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
