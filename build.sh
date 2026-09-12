#!/usr/bin/env bash
# ==============================================================================
# AdvikOS ISO Build Script (Arch Linux / archiso)
# ==============================================================================
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORK_DIR="/tmp/advikos-work"
OUT_DIR="${SCRIPT_DIR}/out"

echo "========================================================"
echo "          Building AdvikOS (Arch Linux Base)            "
echo "========================================================"

# Enable multilib on host if not already enabled
if ! grep -q "^\[multilib\]" /etc/pacman.conf; then
    echo ">> Enabling [multilib] repository on host..."
    cat << 'EOF' >> /etc/pacman.conf

[multilib]
Include = /etc/pacman.d/mirrorlist
EOF
fi

# Ensure keyring is initialized
echo ">> Initializing pacman keys..."
pacman-key --init
pacman-key --populate archlinux

# Install archiso dependencies
echo ">> Installing archiso and build tools..."
pacman -Sy --noconfirm archlinux-keyring || true
pacman -Syu --needed --noconfirm archiso dos2unix

# Sanitize all script line endings (CRLF -> LF)
echo ">> Sanitizing line endings..."
find "${SCRIPT_DIR}" -type f -exec dos2unix -q {} + 2>/dev/null || true

# Clean previous work directory
echo ">> Cleaning old build files..."
rm -rf "${WORK_DIR}"
mkdir -p "${OUT_DIR}"

# Build the bootable ISO using mkarchiso
echo ">> Building AdvikOS ISO..."
mkarchiso -v -w "${WORK_DIR}" -o "${OUT_DIR}" "${SCRIPT_DIR}"

echo "========================================================"
echo "  Build Complete! Your AdvikOS ISO is located in:       "
echo "  ${OUT_DIR}                                            "
echo "========================================================"
ls -lh "${OUT_DIR}"
