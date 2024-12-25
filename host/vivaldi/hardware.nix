{ inputs, lib, pkgs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    inputs.nixos-hardware.nixosModules.framework-13-7040-amd
    ../common/hardware/bluetooth.nix

    (import ./disks.nix { inherit lib; })
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
#  fileSystems."/".device = "/dev/disk/by-uuid/25b62ea9-9cc2-40b7-ba12-6ece9ff080aa";

  # Add this test to confirm the file is being imported
  assertions = [
    {
      assertion = true;
      message = "host/vm/hardware.nix is loaded successfully.";
    }
  ];
  environment.systemPackages = [
    pkgs.linuxKernel.packages.linux_zen.framework-laptop-kmod
  ];
}

