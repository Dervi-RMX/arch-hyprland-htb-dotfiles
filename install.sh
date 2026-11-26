#!/usr/bin/env bash

REPO_URL="https://github.com/Dervi-RMX/shinobi-hypr.git"
REPO_DIR="$HOME/shinobi-hypr"

echo "============================================================"
echo "  Instalador Automatico Zero-Touch: Shinobi-Hypr"
echo "  Usuario destino: $USER"
echo "============================================================"

# 1. Clonar o actualizar el repositorio si se ejecuta via curl | bash
if [ ! -d "$REPO_DIR/.git" ]; then
    sudo pacman -Sy --needed --noconfirm git base-devel
    git clone "$REPO_URL" "$REPO_DIR"
else
    git -C "$REPO_DIR" fetch origin && git -C "$REPO_DIR" reset --hard origin/main
fi

# 2. Instalar paquetes oficiales sin abortar si alguno ya tiene variante instalada (ej. swaylock-effects)
PKGS=(
    git base-devel hyprland waybar wlogout playerctl pavucontrol kitty rofi
    swaybg awww hyprlock starship fastfetch zsh zsh-autosuggestions
    zsh-syntax-highlighting yazi grim slurp wl-clipboard libnotify dunst
    pipewire pipewire-pulse wireplumber ttf-jetbrains-mono-nerd
    noto-fonts-emoji papirus-icon-theme libayatana-appindicator
    polkit-gnome xdg-desktop-portal-hyprland openvpn networkmanager
    firefox zram-generator spotify-launcher xdg-utils unzip sddm qt6-5compat qt6-svg qt6-virtualkeyboard
    qt6-multimedia-ffmpeg python python-pillow python-requests jq curl wget
)

echo "[*] Instalando dependencias base del sistema..."
sudo pacman -Sy --needed --noconfirm "${PKGS[@]}" 2>/dev/null || {
    for pkg in "${PKGS[@]}"; do
        sudo pacman -S --needed --noconfirm "$pkg" >/dev/null 2>&1 || true
    done
}

# 3. Asegurar gestor AUR (yay) si no existe en un Arch limpio
AUR_HELPER=""
if command -v yay >/dev/null 2>&1; then
    AUR_HELPER="yay"
elif command -v paru >/dev/null 2>&1; then
    AUR_HELPER="paru"
else
    echo "[*] Compilando yay para paquetes AUR..."
    TMP_YAY=$(mktemp -d)
    git clone https://aur.archlinux.org/yay-bin.git "$TMP_YAY/yay-bin"
    (cd "$TMP_YAY/yay-bin" && makepkg -si --noconfirm)
    rm -rf "$TMP_YAY"
    AUR_HELPER="yay"
fi

# 4. Instalar automaticamente Eww, Wallust y Visual Studio Code
echo "[*] Instalando Eww, Wallust y Visual Studio Code..."
command -v eww >/dev/null 2>&1 || $AUR_HELPER -S --needed --noconfirm eww || true
if ! command -v wallust >/dev/null 2>&1; then
    $AUR_HELPER -S --needed --noconfirm wallust || $AUR_HELPER -S --needed --noconfirm wallust-git || true
fi
command -v code >/dev/null 2>&1 || $AUR_HELPER -S --needed --noconfirm visual-studio-code-bin || true

# 5. Desplegar todas las configuraciones y scripts
echo "[*] Desplegando configuraciones de Hyprland, Waybar, Eww, Wlogout y VS Code..."
mkdir -p "$HOME/.config/hypr" "$HOME/.config/waybar" "$HOME/.config/eww" \
         "$HOME/.config/wlogout" "$HOME/.config/Code/User" "$HOME/.local/bin" "$HOME/Wallpapers"

[ -d "$REPO_DIR/hypr" ] && cp -rf "$REPO_DIR/hypr/"* "$HOME/.config/hypr/"
[ -d "$REPO_DIR/waybar" ] && cp -rf "$REPO_DIR/waybar/"* "$HOME/.config/waybar/"
[ -d "$REPO_DIR/eww" ] && cp -rf "$REPO_DIR/eww/"* "$HOME/.config/eww/"
[ -d "$REPO_DIR/wlogout" ] && cp -rf "$REPO_DIR/wlogout/"* "$HOME/.config/wlogout/"
[ -d "$REPO_DIR/scripts" ] && cp -rf "$REPO_DIR/scripts/"* "$HOME/.local/bin/"
[ -d "$REPO_DIR/wallpapers" ] && cp -rf "$REPO_DIR/wallpapers/"* "$HOME/Wallpapers/"
[ -f "$REPO_DIR/vscode/settings.json" ] && cp -f "$REPO_DIR/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
[ -f "$REPO_DIR/vscode/code-flags.conf" ] && cp -f "$REPO_DIR/vscode/code-flags.conf" "$HOME/.config/code-flags.conf"

find "$HOME/.config/waybar" "$HOME/.config/eww" "$HOME/.config/hypr" "$HOME/.config/wlogout" -type f -exec sed -i "s|\\\$HOME|$HOME|g" {} +
chmod +x "$HOME/.local/bin/"*
find "$HOME/.config/eww" -type f \( -name "*.sh" -o -name "*.py" -o -path "*/scripts/*" \) -exec chmod +x {} + 2>/dev/null || true
eww kill >/dev/null 2>&1 || true
nohup eww daemon >/dev/null 2>&1 & disown
sudo ln -sf "$HOME/.local/bin/spotify" /usr/local/bin/spotify
mkdir -p "$HOME/.local/share/applications"
for f in spotify.desktop spotify-launcher.desktop; do
  printf "[Desktop Entry]\nName=Spotify\nExec=%s/.local/bin/spotify %%U\nIcon=spotify\nType=Application\nCategories=AudioVideo;Music;\n" "$HOME" > "$HOME/.local/share/applications/$f"
done


# 6. Configurar extensiones y paleta de colores inicial de VS Code, Dashboard y Wlogout
if command -v code >/dev/null 2>&1; then
    code --install-extension PKief.material-icon-theme --force >/dev/null 2>&1 || true
fi

FIRST_WALL=$(find "$HOME/Wallpapers" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) 2>/dev/null | head -n 1)
if [ -n "$FIRST_WALL" ] && command -v wallust >/dev/null 2>&1; then
    wallust run "$FIRST_WALL" -s >/dev/null 2>&1 || true
fi

[ -x "$HOME/.local/bin/shinobi-dashboard-toggle" ] && "$HOME/.local/bin/shinobi-dashboard-toggle" --sync-only >/dev/null 2>&1 || true
[ -x "$HOME/.local/bin/shinobi-vscode-sync" ] && "$HOME/.local/bin/shinobi-vscode-sync" >/dev/null 2>&1 || true

# 7. Recargar Hyprland y Waybar en segundo plano sin bloquear la terminal
if [ -n "$WAYLAND_DISPLAY" ]; then
    
if systemd-detect-virt -q 2>/dev/null; then
    grep -q "vm-performance.conf" "$HOME/.config/hypr/hyprland.conf" || echo "source = ~/.config/hypr/vm-performance.conf" >> "$HOME/.config/hypr/hyprland.conf"
fi
    
printf "[zram0]\nzram-size = ram / 2\ncompression-algorithm = zstd\nswap-priority = 100\n" | sudo tee /etc/systemd/zram-generator.conf >/dev/null
printf "vm.swappiness=100\nvm.vfs_cache_pressure=50\nvm.page-cluster=0\n" | sudo tee /etc/sysctl.d/99-shinobi-fast.conf >/dev/null
sudo systemctl daemon-reload && sudo systemctl start /dev/zram0 2>/dev/null || true
sudo sysctl --system >/dev/null 2>&1 || true
hyprctl reload >/dev/null 2>&1 || true
    killall waybar >/dev/null 2>&1 || true
    nohup waybar >/dev/null 2>&1 &
    disown
fi

echo "============================================================"
echo "  Instalacion completa de Shinobi-Hypr (Zero-Touch listo)"
echo "============================================================"
