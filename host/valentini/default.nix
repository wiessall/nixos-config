{
  hostname,
  pkgs,
  lib,
  username,
  ...
}:
{
  imports = [
    ./common/base
    ./common/services/openssh.nix
    ./locale.nix
    ./sops.nix
  ];
}
