#!/usr/bin/env bash

set -e

echo "Removing Fake KVM..."

rm -f "$HOME/.local/bin/ls"
rm -f "$HOME/bin/ls"
rm -rf "$HOME/.fake-kvm"

# Remove Fake KVM PATH entry from .bashrc
sed -i '\|export PATH="\$HOME/.local/bin:\$PATH"|d' "$HOME/.bashrc" 2>/dev/null || true
sed -i '\|export PATH="\$HOME/bin:\$PATH"|d' "$HOME/.bashrc" 2>/dev/null || true

hash -r 2>/dev/null || true

echo
echo "[✓] Fake KVM deleted successfully!"
echo "[✓] Fake KVM files removed."
echo "[✓] Your system is back to normal."
