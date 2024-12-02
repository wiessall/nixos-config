{ pkgs, inputs, desktop, ... }:
{
  imports = [
    (./. + "/${desktop}")
    (./users + "/${user}")
    ./firefox.nix
    ./alacritty.nix
  ];

  programs = {
    direnv = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    age
    bitwarden-desktop
    catppuccin-gtk
    devenv
    gimp
    goldwarden
    inkscape
    kdePackages.qtstyleplugin-kvantum
    libreoffice-qt-fresh
    mattermost-desktop
    musicpod
    pamixer
    pavucontrol
    signal-desktop
    sops
    spotify
    thunderbird
    vlc
    wl-clipboard
    xdg-utils
    xorg.xlsclients
    zoom
    zotero
  ];

  fonts.fontconfig.enable = true;
}
