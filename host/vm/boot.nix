{ pkgs, lib, ... }:
{
  boot = {
    #enable secure boot
    bootspec.enable = true; 
    #disable systemd boot
    loader.systemd-boot.enable = lib.mkForce false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

  };
}

