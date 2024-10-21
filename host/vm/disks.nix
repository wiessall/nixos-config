{
  lib
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
      data /dev/disk/by-partlabel/data /etc/data.keyfile
    '';
  };


  disko.devices = {
    disk = {
      sda = {
        device = buitlins.elemAt disks 0;
	type = "disk";
	content = {
	  type = "gpt";
	  partitiions = {
	    ESP = {
	      start = "0%";
	      end = "512MiB";
	      type = "EF00";
	      content = {
	        type = "filesystem";
		format = "vfat";
		mountpoint = "/boot";
	      };
	    };
	    # Luks encrypted data partition/subvolumes
	    luks = {
	      start = "512MiB";
	      end = "100%";
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
		    "@home" = {
		      mountpoint = "/home";
		      mountOptions = defaultBtrfsOpts;
		    };
		    "@var" = {
		      mountpoint = "/var";
		      mountOptions = defaultBtrfsOpts;
		    };
		    "@snapshots" = {
		      mountpoint = "/.snapshots";
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
}
