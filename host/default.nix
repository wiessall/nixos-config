{
  config,
  inputs,
  pkgs,
  desktop,
  hostname,
  lib,
  username,
  stateVersion,
  ...
}:


{
  imports = [
    (./. + "/${hostname}/boot.nix")
    (./. + "/${hostname}/hardware.nix")

    ./common/base
    ./common/users
    ./common/users/${username}
  ]
  # Include extra if exists for specified host
  ++ lib.optional (builtins.pathExists (./. + "/${hostname}/extra.nix")) ./${hostname}/extra.nix
  ++ lib.optional (builtins.pathExists (./. + "/${hostname}/battery.nix")) ./${hostname}/battery.nix
  # Include desktop config if a desktop is defined
  ++ lib.optional (builtins.isString desktop) ./common/desktop;

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      joypixels.acceptLicense = true;
    };
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
    };
  };

  system = {
    inherit stateVersion;
  };
}

