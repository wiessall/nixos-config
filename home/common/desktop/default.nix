{ pkgs, desktop, ... }:
{
  imports = [
    (./. + "/${desktop}")
  ];

  programs = {
    firefox.enable = true;
  };

  home.packages = with pkgs; [
    bitwarden-desktop #new
    gimp
    inkscape
    libreoffice-qt-fresh
    mattermost-desktop
    pamixer
    pavucontrol
    signal-desktop
    thunderbird
    xdg-utils
    xorg.xlsclients
  ];

  fonts.fontconfig.enable = true;
}
