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
      nix-direnv.enable = true;
    };
  };

  home.packages = with pkgs; [
    age
    aspell
    aspellDicts.en
    aspellDicts.de
    bitwarden-desktop
    catppuccin-gtk
    devenv
    gimp
    goldwarden
    inkscape
<<<<<<< HEAD
    kdePackages.akonadi
    kdePackages.kdepim-runtime
    kdePackages.kontact
=======
    ispell
    kdePackages.akonadi
    kdePackages.akonadi-import-wizard
    kdePackages.kdepim-addons
    kdePackages.kdepim-runtime
    kdePackages.kontact
    kdePackages.libkdepim
    kdePackages.networkmanager-qt
    kdePackages.pimcommon
    kdePackages.pim-data-exporter
>>>>>>> print
    kdePackages.qtstyleplugin-kvantum
    libreoffice-fresh
    mattermost-desktop
    mermaid-cli
    musicpod
    nextcloud-client
    pamixer
    pandoc
    pavucontrol
    signal-desktop
    sops
    spotify
    stirling-pdf
    texlive.combined.scheme-full
    thunderbird
    vlc
    wl-clipboard
    xdg-utils
    xorg.xlsclients
    xournalpp
    zip
    zotero
  ];

  fonts.fontconfig.enable = true;
}
