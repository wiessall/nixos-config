{ pkgs, ... }:
{
  programs = {
    git = {
      enable = true;
      userEmail = "tristan.wiessalla@posteo.de";
      userName = "Tristan Wiessalla";
    };
  };
}

