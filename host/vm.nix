{ config, pkgs, ... }:

{
  imports = [
    ./common/desktop/plasma.nix  # Plasma desktop environment
  ];

#  imports = [ <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix> ];

  # Basic settings
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";

  fileSystems."/".device = "/dev/disk/by-uuid/25b62ea9-9cc2-40b7-ba12-6ece9ff080aa";

  # Enable Flakes support
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Basic packages
  environment.systemPackages = with pkgs; [
    vim
    wget
  ];

  # Example service
  services.openssh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}

