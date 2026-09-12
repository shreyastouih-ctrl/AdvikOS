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

# Check if archiso is installed
if ! command -v mkarchiso &> /dev/null; then
    echo ">> Installing archiso dependencies..."
    sudo pacman -Syu --needed --noconfirm archiso
fi

# Clean previous work directory
echo ">> Cleaning old build files..."
sudo rm -rf "${WORK_DIR}"
mkdir -p "${OUT_DIR}"

# Build the ISO using mkarchiso
echo ">> Building AdvikOS ISO..."
sudo mkarchiso -v -w "${WORK_DIR}" -o "${OUT_DIR}" "${SCRIPT_DIR}"

echo "========================================================"
echo "  Build Complete! Your AdvikOS ISO is located in:       "
echo "  ${OUT_DIR}                                            "
echo "========================================================"
ls -lh "${OUT_DIR}"
