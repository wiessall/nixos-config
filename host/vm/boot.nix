{ pkgs, lib, ... }:
{
  boot = {
#    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
#    loader.systemd-boot.device = "/dev/sda/sda1";

     initrd.systemd.enable = true;
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

