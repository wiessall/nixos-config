{
  hostname,
  pkgs,
  lib,
  username,
  ...
}:
{
  imports = [
    
    ./hardware.nix
    ../services/openssh.nix
    ../services/mysql.nix
  ];

  networking = {
    hostName = hostname;
    useDHCP = lib.mkDefault true;
    firewall = rec {
      # For KDE Konnect
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };

  environment.systemPackages = (import ./packages.nix { inherit pkgs; }).basePackages;

  programs = {
    zsh.enable = true;
  };

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };

  # Create dirs for home-manager
  systemd.tmpfiles.rules = [ "d /nix/var/nix/profiles/per-user/${username} 0755 ${username} root" ];
}
