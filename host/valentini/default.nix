{
  hostname,
  pkgs,
  lib,
  username,
  ...
}:
{
  imports = [
	
    ./boot.nix
    ./hardware.nix
    ../common/base
    ../common/services/openssh.nix
    ./locale.nix
    ./sops.nix
  ];
}
