#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE_DIR="${REPO_ROOT}/iso/profile"
OUT_DIR="${REPO_ROOT}/out"
WORK_DIR="/tmp/haifaos-build"

if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (or with sudo)." >&2
    exit 1
fi

if ! command -v mkarchiso &>/dev/null; then
    echo "archiso is not installed. Run: sudo pacman -S archiso" >&2
    exit 1
fi

mkdir -p "${OUT_DIR}"
rm -rf "${WORK_DIR}"

echo "==> Building Haifa OS ISO..."
echo "    Profile : ${PROFILE_DIR}"
echo "    Output  : ${OUT_DIR}"
echo ""

mkarchiso \
    -v \
    -w "${WORK_DIR}" \
    -o "${OUT_DIR}" \
    "${PROFILE_DIR}"

echo ""
echo "==> Done. ISO written to ${OUT_DIR}/"
ls -lh "${OUT_DIR}/"*.iso 2>/dev/null || true
