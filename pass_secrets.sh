temp=$(mktemp -d nixos-anywhere-temp.XXXXXXX)

# ssh-host keys
install -d -m755 "$temp/etc/ssh"
install -d -m755 "$temp/home/tristan/.config/sops/age"
cat ./tmp/etc/ssh/ssh_host_ed25519_key > "$temp/etc/ssh/ssh_host_ed25519_key"
cat ./tmp/etc/ssh/ssh_host_ed25519_key.pub > "$temp/etc/ssh/ssh_host_ed25519_key.pub"
cat /home/tristan/.config/sops/age/keys.txt > "$temp/home/tristan/.config/sops/age/keys.txt"
chmod 600 "$temp/etc/ssh/ssh_host_ed25519_key"
chmod 600 "$temp/home/tristan/.config/sops/age/keys.txt"
chown tristan:users "$temp/home/tristan/.config/sops/age/keys.txt"



nix run github:nix-community/nixos-anywhere -- --disk-encryption-keys /tmp/disk-1.key /tmp/disk-1.key --flake /home/tristan/nixos-config#vivaldi --extra-files "$temp" --ssh-port 22 --debug root@192.168.1.145

