{ pkgs, lib, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
#    loader.systemd-boot.device = "/dev/sda/sda1";

     initrd.systemd.enable = true;
    #enable secure boot
    bootspec.enable = true; 
    #disable systemd boot
#    loader.systemd-boot.enable = lib.mkForce false;

    lanzaboote = {
      enable = false;
      pkiBundle = "/etc/secureboot";
    };

   fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/0D6B-888D";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };


  };
}

