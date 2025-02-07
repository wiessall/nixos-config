{ inputs, lib, pkgs, ... }:
{
  imports = [
    inputs.disko.nixosModules.disko
    ../common/hardware/bluetooth.nix

    (import ./disks.nix { inherit lib; })
  ];

  nixpkgs.hostPlatform = "x86_64-linux";

  # Add this test to confirm the file is being imported
  assertions = [
    {
      assertion = true;
      message = "host/valentini/hardware.nix is loaded successfully.";
    }
  ];
  environment.systemPackages = [
  ];
}

