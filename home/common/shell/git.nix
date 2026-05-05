{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      settings.user.email = "tristan.wiessalla@posteo.de";
      settings.user.name = "Tristan Wiessalla";
    };
  };
}

