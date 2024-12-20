{ pkgs, inputs, desktop, username, ... }:
{
  imports = [
    (./. + "/${desktop}")
    (../users + "/${username}")
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
    kontact
    libreoffice-qt-fresh
    mattermost-desktop
    musicpod
    pamixer
    pavucontrol
    signal-desktop
    sops
    spotify
    texlive.combined.scheme-full
    thunderbird
    vlc
    wl-clipboard
    xdg-utils
    xorg.xlsclients
    xournal
    zoom
    zotero
  ];

  fonts.fontconfig.enable = true;
}
