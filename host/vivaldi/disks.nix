{
  lib,
  disks ? [
    "/dev/sda"
  ],
  ...
}:
let
  cryptroot = "cryptroot";
  defaultBtrfsOpts = [
    "defaults"
    "compress=zstd:1"
    "ssd"
    "noatime"
    "nodiratime"
  ];
in
{
  boot.initrd.luks.devices.${cryptroot} = {
    allowDiscards = true;
    preLVM = true;
  };

  environment.etc = {
    "crypttab".text = ''
      cryptroot /dev/disk/by-partlabel/main /etc/data.keyfile
    '';
  };


  disko.devices = {
    disk = {
      main = {
        device = builtins.elemAt disks 0;
	type = "disk";
	content = {
	  type = "gpt";
	  partitions = {
	    ESP = {
	      size = "512M";
	      type = "EF00";
	      content = {
	        type = "filesystem";
		format = "vfat";
		mountpoint = "/boot";
    mountOptions = [ "defaults" ];
	      };
	    };
	    # Luks encrypted data partition/subvolumes
	    luks = {
	      size = "100%";
	      content = {
	        type = "luks";
		name = "${cryptroot}";

		settings = {
		  allowDiscards = true;
		};

		content = {
		  type = "btrfs";
		  # Override existing partition
		  extraArgs = [ "-f" ];
		  subvolumes = {
		    "@" = {
		      mountpoint = "/";
		      mountOptions = defaultBtrfsOpts;
		    };
		    "@nix" = {
		      mountpoint = "/nix";
		      mountOptions = defaultBtrfsOpts;
		    };
	            "@persistent" = {
		      mountpoint = "/persistent";
		      mountOptions = defaultBtrfsOpts;
	            };
		  };
		};
       	      };
       	    };
          };
        };
      };
    };
  };
  fileSystems."/persistent".neededForBoot = true;
}
