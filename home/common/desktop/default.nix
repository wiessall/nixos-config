{ pkgs, inputs, desktop, username, ... }:
{
  imports = [
    (./. + "/${desktop}")
    (../users + "/${username}")
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
    kdePackages.discover
    gimp
    inkscape
    ispell
    kdePackages.akonadi
    kdePackages.akonadi-calendar
    kdePackages.akonadi-import-wizard
    kdePackages.kaccounts-providers # online accounts
    kdePackages.kaccounts-integration  # online accounts
    kdePackages.kdepim-addons
    kdePackages.kdepim-runtime
    kdePackages.kontact
    kdePackages.libkdepim
    kdePackages.networkmanager-qt
    kdePackages.pimcommon
    kdePackages.pim-data-exporter
    kdePackages.qtstyleplugin-kvantum
    kdePackages.qtwebengine  # online accounts
    libreoffice-fresh
#    libsForQt5.signond
#    libsForQt5.qoauth
    mattermost-desktop
    mermaid-cli
    musicpod
    pamixer
    pandoc
    pavucontrol
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
