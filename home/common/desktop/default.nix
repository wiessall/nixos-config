{ pkgs, desktop, ... }:
{
  imports = [
    (./. + "/${desktop}")

    ../dev

    ./alacritty.nix
  ];

  programs = {
    firefox = {
      enable = true;
      languagePacks = [ "de" "en-US" ];
      policies = {
        DisableTelemetry = true;
        DisableFirefoxStudies = true;
	EnableTrackingProtection = {
	  Value = true;
	  Cryptomining = true;
	  Fingerprinting = true;
	};
      };
      extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
	bitwarden
	i-dont-care-about-cookies
        ublock-origin
	tridactyl
      ];
    };
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
