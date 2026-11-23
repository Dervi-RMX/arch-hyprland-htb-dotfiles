#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[*] Creando directorios en ~/.config y ~/.local/bin..."
mkdir -p ~/.config/{hypr/configs,hypr/conf,hypr/hyprlock-themes,waybar/scripts,kitty/themes,rofi/themes,starship-themes,swaylock-themes,swaylock,fastfetch}
mkdir -p ~/.local/bin ~/Pictures/Wallpapers ~/.zsh

echo "[*] Sincronizando configuraciones portables..."
cp -rf "$DOTFILES_DIR/hypr/"* ~/.config/hypr/
cp -rf "$DOTFILES_DIR/waybar/"* ~/.config/waybar/
chmod +x ~/.config/waybar/scripts/*.sh 2>/dev/null || true

cp -f "$DOTFILES_DIR/kitty/kitty.conf" ~/.config/kitty/
cp -f "$DOTFILES_DIR/kitty/current-theme.conf" ~/.config/kitty/ 2>/dev/null || true
cp -f "$DOTFILES_DIR/kitty/themes/"*.conf ~/.config/kitty/themes/

cp -f "$DOTFILES_DIR/rofi/config.rasi" ~/.config/rofi/ 2>/dev/null || true
cp -f "$DOTFILES_DIR/rofi/current-theme.rasi" ~/.config/rofi/ 2>/dev/null || true
cp -f "$DOTFILES_DIR/rofi/colors-wallust.rasi" ~/.config/rofi/ 2>/dev/null || true
cp -f "$DOTFILES_DIR/rofi/themes/"*.rasi ~/.config/rofi/themes/

cp -f "$DOTFILES_DIR/starship/"*.toml ~/.config/starship-themes/
cp -f "$DOTFILES_DIR/starship/starship.toml" ~/.config/starship.toml

cp -f "$DOTFILES_DIR/swaylock-themes/"*.conf ~/.config/swaylock-themes/
cp -f "$DOTFILES_DIR/swaylock-themes/king.conf" ~/.config/swaylock/config

cp -rf "$DOTFILES_DIR/fastfetch/"* ~/.config/fastfetch/ 2>/dev/null || true
cp -f "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc 2>/dev/null || true
cp -f "$DOTFILES_DIR/zsh/htb-functions.zsh" ~/.zsh/htb-functions.zsh 2>/dev/null || true

# Deteccion automatica de VMware para renderizado estable en Kitty y Hyprlock
if command -v systemd-detect-virt >/dev/null 2>&1 && [ "$(systemd-detect-virt 2>/dev/null)" = "vmware" ]; then
command -v awww >/dev/null 2>&1 || sudo pacman -S --noconfirm --needed awww 2>/dev/null || true
sudo pacman -S --noconfirm --needed zsh-autosuggestions zsh-syntax-highlighting 2>/dev/null || true
    echo "[*] Entorno VMware detectado: activando compatibilidad grafica (LIBGL_ALWAYS_SOFTWARE=1)..."
    grep -q "LIBGL_ALWAYS_SOFTWARE" ~/.config/hypr/hyprland.conf || sed -i '1i env = LIBGL_ALWAYS_SOFTWARE,1\nenv = WLR_NO_HARDWARE_CURSORS,1' ~/.config/hypr/hyprland.conf
fi

echo "[*] Instalando scripts y wallpapers..."
cp -f "$DOTFILES_DIR/scripts/"* ~/.local/bin/
chmod +x ~/.local/bin/*
cp -f "$DOTFILES_DIR/assets/wallpapers/"* ~/Pictures/Wallpapers/ 2>/dev/null || true

# Configurar Spotify (Wayland flags + tema TUI text sincronizado)
cp -f "$DOTFILES_DIR/spotify/spotify-flags.conf" ~/.config/spotify-flags.conf 2>/dev/null || true
if [ -d "$DOTFILES_DIR/spicetify/Themes/text" ]; then
    mkdir -p ~/.config/spicetify/Themes ~/.config/spicetify/Extensions
    cp -rf "$DOTFILES_DIR/spicetify/Themes/text" ~/.config/spicetify/Themes/
    cp -rf "$DOTFILES_DIR/spicetify/Extensions/"* ~/.config/spicetify/Extensions/ 2>/dev/null || true
    if command -v spicetify >/dev/null 2>&1; then
        spicetify config current_theme text color_scheme King extensions tui-visualizer.js >/dev/null 2>&1 || true
        spicetify backup apply >/dev/null 2>&1 || true
    fi
fi

echo "[+] Entorno instalado. Usa Super + W para elegir tema (King, Minato, Zenitsu, Demon, Kimetsu, Goku) y Super + Shift + L para bloquear."

# --- Configurar SDDM automáticamente para el usuario actual ---
if [ -d "$REPO_DIR/sddm/themes/sddm-astronaut-theme" ]; then
    echo "[*] Instalando y configurando pantalla de inicio SDDM para $USER..."
    sudo pacman -S --noconfirm --needed sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg 2>/dev/null || true

    sudo mkdir -p /usr/share/sddm/themes /etc/sddm.conf.d /usr/share/fonts/sddm-astronaut
    sudo rm -rf /usr/share/sddm/themes/sddm-astronaut-theme
    sudo cp -rf "$REPO_DIR/sddm/themes/sddm-astronaut-theme" /usr/share/sddm/themes/

    if [ -d "/usr/share/sddm/themes/sddm-astronaut-theme/Fonts" ]; then
        sudo cp -rf /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/sddm-astronaut/ 2>/dev/null || true
        sudo fc-cache -f >/dev/null 2>&1 || true
    fi

    sudo rm -f /etc/sddm.conf /etc/sddm.conf.d/*.conf
    printf "[Theme]\nCurrent=sddm-astronaut-theme\n" | sudo tee /etc/sddm.conf >/dev/null
    printf "[Theme]\nCurrent=sddm-astronaut-theme\n" | sudo tee /etc/sddm.conf.d/theme.conf >/dev/null

    sudo find /usr/share/sddm/themes/sddm-astronaut-theme -maxdepth 2 -name "*.conf" -exec sed -i "s/^User=.*/User=$USER/g" {} + 2>/dev/null || true
    sudo systemctl enable sddm 2>/dev/null || true
fi
