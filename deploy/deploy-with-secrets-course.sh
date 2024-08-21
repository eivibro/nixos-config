#!/usr/bin/env bash
# Create a temporary directory
temp=$(mktemp -d)

# What, by who and where
host=../.#elev
deployer=eivbro
ip=10.28.84.30

# Function to cleanup temporary directory on exit
cleanup() {
  rm -rf "$temp"
}
trap cleanup EXIT

# Create the directory where sshd expects to find the host keys
install -d -m755 "$temp/root/.ssh"
install -d -m755 "$temp/etc/secrets/initrd"

# Decrypt your private key from the password store and copy it to the temporary directory
cat /home/$deployer/.ssh/school > "$temp/root/.ssh/ssh_host_ed25519_key"
cat /home/$deployer/.ssh/school > "$temp/etc/secrets/initrd/ssh_host_ed25519_key"
cat /home/$deployer/.ssh/school.pub > "$temp/etc/secrets/initrd/ssh_host_ed25519_key.pub"

# Set the correct permissions so sshd will accept the key
chmod 600 "$temp/root/.ssh/ssh_host_ed25519_key"
chmod 600 "$temp/etc/secrets/initrd/ssh_host_ed25519_key"
chmod 644 "$temp/etc/secrets/initrd/ssh_host_ed25519_key.pub"

# Install NixOS to the host system with our secrets
nix run github:nix-community/nixos-anywhere -- --disk-encryption-keys /tmp/secret.key /tmp/secret.key --extra-files "$temp" --flake $host root@$ip
