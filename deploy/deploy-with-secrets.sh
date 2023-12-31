#!/usr/bin/env bash

# Create a temporary directory
temp=$(mktemp -d)

# Function to cleanup temporary directory on exit
cleanup() {
  rm -rf "$temp"
}
trap cleanup EXIT

# Create the directory where sshd expects to find the host keys
install -d -m755 "$temp/root/.ssh"

# Decrypt your private key from the password store and copy it to the temporary directory
cat /home/eivbro/.ssh/ssh-secret > "$temp/root/.ssh/ssh_host_ed25519_key"
cat /home/eivbro/.ssh/initrd_host_ed25519_key > "$temp/root/.ssh/initrd_host_ed25519_key"

# Set the correct permissions so sshd will accept the key
chmod 600 "$temp/root/.ssh/ssh_host_ed25519_key"
chmod 600 "$temp/root/.ssh/initrd_host_ed25519_key"

# Install NixOS to the host system with our secrets
nix run github:nix-community/nixos-anywhere -- --disk-encryption-keys /tmp/secret.key /tmp/secret.key --extra-files "$temp" --flake '../.#auto' root@192.168.44.3 > log.txt