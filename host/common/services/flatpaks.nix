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
    };
  };

}
