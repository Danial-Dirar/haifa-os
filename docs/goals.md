# Haifa OS — Goals

## Vision

Haifa OS is an Arch-based Linux distribution that makes gaming and daily use
feel as polished and effortless as a macOS experience, without sacrificing the
power and flexibility of Arch Linux.

## Target Audience

- **Gamers** who want performance out of the box without manual tuning
- **Apple users** switching to Linux who expect things to "just work"
- **Power users** who want Arch's rolling-release model with less setup friction

## Core Goals

### 1. Gaming-first performance
- Ship `linux-cachyos` (BORE scheduler) as the default kernel
- Pre-install Steam, Lutris, Gamemode, MangoHud, Gamescope, Wine
- Enable multilib and 32-bit GPU drivers by default
- Apply `gamemode` tweaks automatically when a game is detected

### 2. Polished out-of-the-box experience
- Calamares GUI installer — no terminal needed to install
- KDE Plasma as the primary desktop (with GNOME and Hyprland options)
- Sane font rendering, emoji support, and CJK fonts pre-installed
- NetworkManager for seamless Wi-Fi, including Apple hardware support

### 3. CachyOS compatibility
- Track CachyOS repos (`cachyos`, `cachyos-extra`) to receive upstream
  performance packages, kernel updates, and the Calamares installer
- Pull upstream changes with minimal diff so updates stay easy to merge

### 4. Haifa OS identity
- Custom branding: logo, wallpaper, GRUB/SDDM theme
- `haifaos-branding` package for OS identity files
- Own pacman repo (`haifaos`) for distribution-specific packages

## Non-Goals

- We do not ship a custom kernel — we use `linux-cachyos` from CachyOS
- We do not maintain our own AUR helper — `yay` or `paru` will be recommended
- We do not replace pacman — we extend it with curated repos
