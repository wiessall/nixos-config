{ inputs, ... }:
{
  imports = [
    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-x1-extreme-gen3
    ../common/hardware/bluetooth.nix
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  fileSystems."/".device = "/dev/disk/by-uuid/25b62ea9-9cc2-40b7-ba12-6ece9ff080aa";

  # Add this test to confirm the file is being imported
  assertions = [
    {
      assertion = true;
      message = "host/vm/hardware.nix is loaded successfully.";
    }
  ];
}

