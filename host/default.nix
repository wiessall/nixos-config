{
  config,
  hostname,
  lib,
  username,
  stateVersion,
  ...
}:

{
  imports = [
    ./common/base
    ./common/users/${username}
  ];

  nixpkgs.config.allowUnfree = true;

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

