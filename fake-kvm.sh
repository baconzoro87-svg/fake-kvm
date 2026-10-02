#!/usr/bin/env bash

set -e

echo "╔══════════════════════════════════════╗"
echo "║          FAKE KVM INSTALLER          ║"
echo "║              v1.0.0                  ║"
echo "╚══════════════════════════════════════╝"
echo

INSTALL_DIR="$HOME/.fake-kvm"
BIN_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR" "$BIN_DIR"

cat > "$BIN_DIR/ls" <<'EOF'
#!/usr/bin/env bash

if [ "$1" = "/dev/kvm" ]; then
    echo "/dev/kvm"
else
    /usr/bin/ls "$@"
fi
EOF

chmod +x "$BIN_DIR/ls"

cat > "$INSTALL_DIR/fake-kvm.sh" <<'EOF'
#!/usr/bin/env bash
echo "/dev/kvm"
EOF

chmod +x "$INSTALL_DIR/fake-kvm.sh"

grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' "$HOME/.bashrc" 2>/dev/null || \
echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"

export PATH="$HOME/.local/bin:$PATH"
hash -r 2>/dev/null || true

echo
echo "[✓] Fake KVM installed successfully!"
echo "[✓] Testing: ls /dev/kvm"
echo
ls /dev/kvm
echo
echo "[✓] Done!"
