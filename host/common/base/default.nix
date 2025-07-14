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
  environment.sessionVariables = {
    # Electron / Chromium: Ozone-Wayland support
    NIXOS_OZONE_WL              = "1";     # native Wayland instead of XWayland :contentReference[oaicite:0]{index=0}
    # (later Electron versions also honour this)
    ELECTRON_OZONE_PLATFORM_HINT = "wayland";  
    ELECTRON_ENABLE_WAYLAND      = "1";     # same deal as passing --enable-features=UseOzonePlatform --ozone-platform=wayland :contentReference[oaicite:1]{index=1}

    # GTK apps
    GDK_BACKEND                  = "wayland";
    # Qt apps
    QT_QPA_PLATFORM             = "wayland";

    # Firefox, for completeness
    MOZ_ENABLE_WAYLAND          = "1";
  };
}
