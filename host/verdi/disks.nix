{
  lib,
  ...
}:
{
 fileSystems."/" =
    { device = "/dev/disk/by-uuid/5a87eead-e96c-420f-b4ab-688a3244998b";
      fsType = "ext4";
    };

  boot.initrd = {
    luks.devices.root = {
     device = "/dev/disk/by-uuid/b247989b-7d66-4e2e-83d8-bd8c625d2c81";
     allowDiscards = true;
     preLVM = true;
    };
  };

}
