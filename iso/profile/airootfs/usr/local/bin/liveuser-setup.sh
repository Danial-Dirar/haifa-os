#!/usr/bin/env bash
set -euo pipefail

[[ $(id -u liveuser 2>/dev/null) ]] && exit 0

useradd -m \
    -G wheel,audio,video,network,storage,optical,games,users \
    -s /bin/bash \
    -c "Live User" \
    liveuser

passwd -d liveuser

HOME=/home/liveuser

mkdir -p "${HOME}/.config" "${HOME}/Desktop"

# Disable screen lock in live session
cat > "${HOME}/.config/kscreenlockerrc" << 'EOF'
[Daemon]
Autolock=false
LockOnResume=false
EOF

# Skip plasma welcome / first-run wizard
cat > "${HOME}/.config/plasma-welcomerc" << 'EOF'
[General]
ShouldShowOnStart=false
EOF

# Desktop shortcut to launch Calamares installer
cat > "${HOME}/Desktop/install-haifaos.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=Install Haifa OS
Comment=Launch the Haifa OS installer
Exec=sudo -E calamares
Icon=system-software-install
Terminal=false
Categories=System;
EOF
chmod +x "${HOME}/Desktop/install-haifaos.desktop"

chown -R liveuser:liveuser "${HOME}"
