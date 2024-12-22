{ pkgs, lib, ... }:
{
  boot = {
#    loader.systemd-boot.enable = true;
    kernelPackages = pkgs.linuxPackages_latest;
    loader.efi.canTouchEfiVariables = true;
#    loader.systemd-boot.device = "/dev/sda/sda1";

     initrd.systemd.enable = true;
    #enable secure boot
    bootspec.enable = true; 
    #disable systemd boot
    loader.systemd-boot.enable = lib.mkForce false;

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

## Impermanence
#    initrd.systemd.services.rollback = {
#    description = "Rollback BTRFS root subvolume to a pristine state";
#    wantedBy = [
#      "initrd.target"
#    ];
#    after = [
#      # LUKS/TPM process
#      "systemd-cryptsetup@cryptroot.service"
#    ];
#    before = [
#      "sysroot.mount"
#    ];
#    unitConfig.DefaultDependencies = "no";
#    serviceConfig.Type = "oneshot";
#    script = ''
#mkdir -p /btrfs_tmp
#
## Mount the Btrfs filesystem
#
#if ! grep -qs " /btrfs_tmp " /proc/mounts; then
#    mount /dev/mapper/cryptroot /btrfs_tmp || {
#        echo "Failed to mount /dev/mapper/cryptroot" >&2
#        exit 1
#    }
#fi
#
## Check if the root subvolume exists; create if it doesn't
#if ! btrfs subvolume show /btrfs_tmp/root >/dev/null 2>&1; then
#    echo "Root subvolume does not exist; creating initial root subvolume."
#    btrfs subvolume create /btrfs_tmp/root || {
#        echo "Failed to create root subvolume" >&2
#        exit 1
#    }
#fi
#
## Rotate and clean up old roots
#if btrfs subvolume show /btrfs_tmp/root >/dev/null 2>&1; then
#    mkdir -p /btrfs_tmp/old_roots
#    timestamp=$(date "+%Y-%m-%d_%H:%M:%S")
#    mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
#fi
#
## Delete old subvolumes older than 30 days
#delete_subvolume_recursively() {
#    local path="$1"
#    if [[ -d "$path" ]]; then
#        IFS=$'\n'
#        for subvol in $(btrfs subvolume list -o "$path" | cut -f 9- -d ' '); do
#            delete_subvolume_recursively "/btrfs_tmp/$subvol"
#        done
#        btrfs subvolume delete "$path" || true
#    fi
#}
#
#find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30 -exec delete_subvolume_recursively {} \;
#
## Create a fresh root subvolume
#btrfs subvolume create /btrfs_tmp/root || {
#    echo "Failed to create new root subvolume" >&2
#    exit 1
#}
#
#umount /btrfs_tmp
#
#    '';
#    };
  };
}

