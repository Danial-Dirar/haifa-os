# Haifa OS — Package Policy

## Repos (in priority order)

1. `haifaos` — Our own packages (branding, meta packages, config)
2. `cachyos` / `cachyos-extra` — Performance kernel, Calamares, gaming tools
3. `multilib` — 32-bit libs required by Steam and Wine
4. `core` / `extra` — Standard Arch Linux packages

## What goes in the `haifaos` repo

Only packages that are unique to Haifa OS:
- `haifaos-branding` — os-release, motd, logo, wallpaper
- `haifaos-sddm-theme` — custom SDDM login screen
- `haifaos-grub-theme` — custom GRUB boot theme
- `haifaos-kde-settings` — default KDE config (fonts, dark mode, etc.)
- `haifaos-meta-gaming` — meta package pulling in Steam, Lutris, Gamemode, etc.
- `haifaos-meta-base` — meta package for base system

We do NOT re-package anything that is already in Arch, CachyOS, or AUR.

## What we pull from CachyOS

- `linux-cachyos` — BORE-scheduled performance kernel
- `calamares` + Calamares configs
- `gamescope` (if not in Arch extra)
- Any other performance-patched packages

## AUR

We do not ship AUR packages in the ISO by default. AUR access is available
post-install via `paru` or `yay`. Exceptions may be made for packages that
have no repo alternative (documented case by case).

## Inclusion criteria for the live ISO

A package is included in `packages.x86_64` only if it meets one of:
- Required for the live session to function (kernel, DE, networking)
- Part of the Haifa OS default app set (see default-apps.md)
- A hardware driver needed for the ISO to boot on real hardware
- A recovery/rescue tool that is useful from the live environment

## Exclusion criteria

- Packages that duplicate functionality of another included package
- Cloud/VM-only tools (cloud-init excluded; open-vm-tools kept for ISO testing)
- Old/deprecated networking tools (wpa_supplicant kept for compatibility;
  wireless_tools, wvdial removed)
