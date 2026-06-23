# Haifa OS — Release Process

## Prerequisites

Install build dependencies on your Arch/CachyOS machine:

```bash
sudo pacman -S archiso git
```

Add CachyOS keyring (required to pull `linux-cachyos` and other CachyOS packages):

```bash
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-keyring-3-1-any.pkg.tar.zst'
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-mirrorlist-18-1-any.pkg.tar.zst'
sudo pacman -U 'https://mirror.cachyos.org/repo/x86_64/cachyos/cachyos-v3-mirrorlist-18-1-any.pkg.tar.zst'
```

## Build the ISO

```bash
cd /path/to/haifa-os
sudo bash scripts/build-iso.sh
```

Output will be in `out/`.

## Build custom packages

```bash
sudo bash scripts/build-packages.sh
```

Packages are placed in `repo/x86_64/` and must be added to the repo index:

```bash
sudo bash scripts/repo-add.sh
```

## Versioning

Haifa OS follows a date-based versioning scheme: `YYYY.MM.DD`

ISO file name format: `haifaos-YYYY.MM.DD-x86_64.iso`

## Release checklist

- [ ] All packages build cleanly
- [ ] `haifaos-branding` version bumped
- [ ] ISO boots in QEMU (BIOS and UEFI)
- [ ] Calamares completes a test install
- [ ] KDE Plasma, GNOME, and Hyprland profiles tested
- [ ] Steam launches on the installed system
- [ ] GPU drivers detected correctly (AMD + Intel tested)
- [ ] `fastfetch` shows correct OS name and kernel

## Testing with QEMU

```bash
# UEFI
qemu-system-x86_64 \
  -enable-kvm \
  -m 4G \
  -bios /usr/share/ovmf/x64/OVMF.fd \
  -cdrom out/haifaos-*.iso \
  -boot d

# BIOS
qemu-system-x86_64 \
  -enable-kvm \
  -m 4G \
  -cdrom out/haifaos-*.iso \
  -boot d
```
