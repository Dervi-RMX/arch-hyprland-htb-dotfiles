#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "============================================================"
echo "  Instalador Automatico: Arch Linux + Hyprland HTB Dotfiles"
echo "  Usuario destino: $USER"
echo "============================================================"

# 1. Instalar dependencias del entorno, temas, plugins Zsh y SDDM
if command -v pacman >/dev/null 2>&1; then
    echo "[*] Instalando paquetes..."
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm --needed \
        git base-devel hyprland waybar kitty rofi-wayland swaybg awww \
        hyprlock swaylock starship fastfetch zsh zsh-autosuggestions zsh-syntax-highlighting yazi \
        grim slurp wl-clipboard libnotify dunst \
        pipewire wireplumber pavucontrol \
        ttf-jetbrains-mono-nerd noto-fonts-emoji papirus-icon-theme \
        libayatana-appindicator polkit-gnome xdg-desktop-portal-hyprland \
        openvpn networkmanager \
        sddm qt6-5compat qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg
fi

# 2. Crear directorios del usuario
mkdir -p \
    "$HOME/.config/hypr" \
    "$HOME/.config/waybar" \
    "$HOME/.config/kitty" \
    "$HOME/.config/rofi" \
    "$HOME/.config/fastfetch" \
    "$HOME/.config/starship-themes" \
    "$HOME/.local/bin" \
    "$HOME/Pictures/Wallpapers"

# 3. Copiar configuraciones de escritorio y terminal
[ -d "$REPO_DIR/hypr" ] && cp -rf "$REPO_DIR/hypr/"* "$HOME/.config/hypr/"
[ -d "$REPO_DIR/waybar" ] && cp -rf "$REPO_DIR/waybar/"* "$HOME/.config/waybar/"
[ -d "$REPO_DIR/kitty" ] && cp -rf "$REPO_DIR/kitty/"* "$HOME/.config/kitty/"
[ -d "$REPO_DIR/rofi" ] && cp -rf "$REPO_DIR/rofi/"* "$HOME/.config/rofi/"
[ -d "$REPO_DIR/fastfetch" ] && cp -rf "$REPO_DIR/fastfetch/"* "$HOME/.config/fastfetch/"
[ -d "$REPO_DIR/starship" ] && cp -rf "$REPO_DIR/starship/"* "$HOME/.config/starship-themes/"
[ -d "$REPO_DIR/swaylock-themes" ] && cp -rf "$REPO_DIR/swaylock-themes" "$HOME/.config/"
[ -f "$REPO_DIR/zsh/.zshrc" ] && cp -f "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"

# 4. Instalar scripts y wallpapers
if [ -d "$REPO_DIR/scripts" ]; then
    cp -rf "$REPO_DIR/scripts/"* "$HOME/.local/bin/"
    chmod +x "$HOME/.local/bin/"*
fi
[ -d "$REPO_DIR/assets/wallpapers" ] && cp -rf "$REPO_DIR/assets/wallpapers/"* "$HOME/Pictures/Wallpapers/"
[ -d "$REPO_DIR/wallpapers" ] && cp -rf "$REPO_DIR/wallpapers/"* "$HOME/Pictures/Wallpapers/"

# 5. Activar tema inicial (Goku)
DEFAULT_THEME="goku"
[ -f "$HOME/.config/waybar/colors-${DEFAULT_THEME}.css" ] && cp -f "$HOME/.config/waybar/colors-${DEFAULT_THEME}.css" "$HOME/.config/waybar/colors-wallust.css"
[ -f "$HOME/.config/waybar/layout-${DEFAULT_THEME}.css" ] && cp -f "$HOME/.config/waybar/layout-${DEFAULT_THEME}.css" "$HOME/.config/waybar/style.css"
[ -f "$HOME/.config/kitty/themes/${DEFAULT_THEME}.conf" ] && cp -f "$HOME/.config/kitty/themes/${DEFAULT_THEME}.conf" "$HOME/.config/kitty/current-theme.conf"
[ -f "$HOME/.config/starship-themes/${DEFAULT_THEME}.toml" ] && cp -f "$HOME/.config/starship-themes/${DEFAULT_THEME}.toml" "$HOME/.config/starship.toml"
if [ -f "$HOME/.config/rofi/themes/${DEFAULT_THEME}.rasi" ]; then
    cp -f "$HOME/.config/rofi/themes/${DEFAULT_THEME}.rasi" "$HOME/.config/rofi/current-theme.rasi"
    cp -f "$HOME/.config/rofi/themes/${DEFAULT_THEME}.rasi" "$HOME/.config/rofi/colors-wallust.rasi"
fi
[ -f "$HOME/.config/hypr/hyprlock-themes/${DEFAULT_THEME}.conf" ] && cp -f "$HOME/.config/hypr/hyprlock-themes/${DEFAULT_THEME}.conf" "$HOME/.config/hypr/hyprlock.conf"

# 6. Compatibilidad grafica automatica en VM
if systemd-detect-virt -q 2>/dev/null; then
    sudo pacman -S --noconfirm --needed open-vm-tools mesa seatd 2>/dev/null || true
    sudo systemctl enable --now vmtoolsd vmware-vmblock-fuse seatd 2>/dev/null || true
    sudo usermod -aG seat,video,input "$USER" 2>/dev/null || true
    if [ -f "$HOME/.config/hypr/hyprland.conf" ] && ! grep -q "LIBGL_ALWAYS_SOFTWARE" "$HOME/.config/hypr/hyprland.conf"; then
        printf "\nenv = LIBGL_ALWAYS_SOFTWARE,1\nenv = WLR_NO_HARDWARE_CURSORS,1\nenv = WLR_RENDERER_ALLOW_SOFTWARE,1\n" >> "$HOME/.config/hypr/hyprland.conf"
    fi
fi

# 7. Configurar pantalla de inicio SDDM (Cyberpunk / Astronaut) para el usuario actual
if [ -d "$REPO_DIR/sddm/themes/sddm-astronaut-theme" ]; then
    echo "[*] Configurando SDDM para $USER..."
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
fi

# 8. Habilitar servicios y Zsh
sudo systemctl enable NetworkManager sddm 2>/dev/null || true
if [ "$SHELL" != "/usr/bin/zsh" ] && command -v zsh >/dev/null 2>&1; then
    sudo chsh -s /usr/bin/zsh "$USER" 2>/dev/null || true
fi

echo "[+] Instalacion completada para $USER. Ejecuta: sudo reboot"
