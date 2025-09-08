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
    kdePackages.akonadi
    kdePackages.kdepim-runtime
    kdePackages.kontact
    kdePackages.qtstyleplugin-kvantum
    libreoffice-qt-fresh
    mattermost-desktop
    musicpod
    nextcloud-client
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
