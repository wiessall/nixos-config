{
  lib,
  pkgs,
  desktop,
  ...
}:
{

  services = {
    flatpak = {
      enable = false;
      remotes = {
        "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
        "flathub-beta" = "https://dl.flathub.org/beta-repo/flathub-beta.flatpakrepo";
      };
      packages = [
        "flathub:app/com.github.k4zmu2a.spacecadetpinball//stable"
        "flathub:app/us.zoom.Zoom.desktop//stable"
        "flathub:app/org.kde.kigo.desktop//stable"
        "flathub:app/io.github.Qalculate//stable"
        "flathub:app/app.drey.Dialect//stable"
        "flathub:app/com.rtosta.zapzap//stable"
        "flathub:app/org.gnome.Snapshot//stable"
        "flathub:app/org.kde.kmahjongg//stable"
        "flathub:app/org.kde.kpat//stable"
        "flathub:app/org.gnome.Maps//stable"
        "flathub:app/app.organicmaps.desktop//stable"
        "flathub:app/org.chromium.Chromium//stable"
      ];
    };
  };
}
