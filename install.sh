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
        pipewire pipewire-pulse wireplumber pavucontrol \
        ttf-jetbrains-mono-nerd noto-fonts-emoji papirus-icon-theme \
        libayatana-appindicator polkit-gnome xdg-desktop-portal-hyprland \
        openvpn networkmanager firefox xdg-utils unzip \
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

# 6. Compatibilidad grafica y optimizacion automatica de fluidez en VM
if systemd-detect-virt -q 2>/dev/null; then
    echo "[*] Maquina virtual detectada: optimizando rendimiento grafico..."
    sudo pacman -S --noconfirm --needed open-vm-tools mesa seatd 2>/dev/null || true
    sudo systemctl enable --now vmtoolsd vmware-vmblock-fuse seatd 2>/dev/null || true
    sudo usermod -aG seat,video,input "$USER" 2>/dev/null || true
    if [ -f "$HOME/.config/hypr/hyprland.conf" ] && ! grep -q "Optimizacion automatica VM" "$HOME/.config/hypr/hyprland.conf"; then
        cat << 'VMEOF' >> "$HOME/.config/hypr/hyprland.conf"

# --- Optimizacion automatica VM (fluidez y bajo consumo de CPU) ---
env = WLR_NO_HARDWARE_CURSORS,1
env = WLR_RENDERER_ALLOW_SOFTWARE,1
misc:vfr = true
VMEOF
        # Usar renderizado por CPU solo si no hay aceleracion 3D por hardware
        if [ ! -e /dev/dri/renderD128 ]; then
            echo "env = LIBGL_ALWAYS_SOFTWARE,1" >> "$HOME/.config/hypr/hyprland.conf"
        fi
    fi
fi

# 7. Configurar pantalla de inicio SDDM (Cyberpunk / Astronaut) para el usuario actual
echo "[*] Configurando SDDM para $USER..."
sudo mkdir -p /usr/share/sddm/themes /etc/sddm.conf.d /usr/share/fonts/sddm-astronaut

if [ -f "$REPO_DIR/sddm/themes/sddm-astronaut-theme/Main.qml" ]; then
    sudo rm -rf /usr/share/sddm/themes/sddm-astronaut-theme
    sudo cp -rf "$REPO_DIR/sddm/themes/sddm-astronaut-theme" /usr/share/sddm/themes/
elif [ ! -f "/usr/share/sddm/themes/sddm-astronaut-theme/Main.qml" ]; then
    sudo git clone --depth=1 https://github.com/Keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme
    sudo rm -rf /usr/share/sddm/themes/sddm-astronaut-theme/.git
fi

if [ -d "/usr/share/sddm/themes/sddm-astronaut-theme/Fonts" ]; then
    sudo cp -rf /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/sddm-astronaut/ 2>/dev/null || true
    sudo fc-cache -f >/dev/null 2>&1 || true
fi

sudo rm -f /etc/sddm.conf /etc/sddm.conf.d/*.conf
printf "[Theme]\nCurrent=sddm-astronaut-theme\n" | sudo tee /etc/sddm.conf >/dev/null
printf "[Theme]\nCurrent=sddm-astronaut-theme\n" | sudo tee /etc/sddm.conf.d/theme.conf >/dev/null
sudo find /usr/share/sddm/themes/sddm-astronaut-theme -maxdepth 2 -name "*.conf" -exec sed -i "s/^User=.*/User=$USER/g" {} + 2>/dev/null || true

# 8. Habilitar servicios y Zsh
sudo systemctl enable NetworkManager sddm 2>/dev/null || true
if [ "$SHELL" != "/usr/bin/zsh" ] && command -v zsh >/dev/null 2>&1; then
    sudo chsh -s /usr/bin/zsh "$USER" 2>/dev/null || true
fi

echo "[+] Instalacion completada para $USER. Ejecuta: sudo reboot"

# 9. Activar servidor de audio PipeWire y volumen inicial automatico (70%)
echo "[*] Habilitando audio PipeWire y volumen automatico..."
systemctl --user enable --now pipewire pipewire-pulse wireplumber 2>/dev/null || true
if command -v wpctl >/dev/null 2>&1; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ 0 2>/dev/null || true
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.70 2>/dev/null || true
fi

# 10. Configurar navegador predeterminado (Firefox)
if command -v firefox >/dev/null 2>&1; then
    xdg-settings set default-web-browser firefox.desktop 2>/dev/null || true
fi

# 11. Instalar temas de cursores dinamicos por entorno (Bibata / Capitaine)
if [ -d "$REPO_DIR/icons" ] && [ "$(ls -A "$REPO_DIR/icons" 2>/dev/null)" ]; then
    echo "[*] Instalando temas de cursores..."
    mkdir -p "$HOME/.icons"
    cp -rf "$REPO_DIR/icons/"* "$HOME/.icons/"
    sudo cp -rf "$REPO_DIR/icons/"* /usr/share/icons/ 2>/dev/null || true
    printf "[Icon Theme]\nInherits=Bibata-Modern-Amber\n" > "$HOME/.icons/default/index.theme" 2>/dev/null || mkdir -p "$HOME/.icons/default" && printf "[Icon Theme]\nInherits=Bibata-Modern-Amber\n" > "$HOME/.icons/default/index.theme"
fi

# 12. Instalar Spotify (AUR / /opt/spotify) y aplicar tema personalizado de Spicetify
echo "[*] Instalando Spotify y configurando Spicetify..."
if ! command -v spotify >/dev/null 2>&1; then
    if command -v yay >/dev/null 2>&1; then
        yay -S --noconfirm --needed --answerclean None --answerdiff None spotify
    elif command -v paru >/dev/null 2>&1; then
        paru -S --noconfirm --needed --skipreview spotify
    else
        sudo pacman -S --noconfirm --needed base-devel git
        rm -rf /tmp/yay-bin
        git clone --depth=1 https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
        (cd /tmp/yay-bin && makepkg -si --noconfirm)
        rm -rf /tmp/yay-bin
        yay -S --noconfirm --needed --answerclean None --answerdiff None spotify
    fi
fi

export PATH="$HOME/.spicetify:$PATH"
if ! command -v spicetify >/dev/null 2>&1; then
    printf 'n\n' | curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
fi

if [ -d "$REPO_DIR/spicetify" ]; then
    mkdir -p "$HOME/.config/spicetify"
    cp -rf "$REPO_DIR/spicetify/"* "$HOME/.config/spicetify/"
    sed -i "s|__USER_HOME__|$HOME|g" "$HOME/.config/spicetify/config-xpui.ini" 2>/dev/null || true
fi

if [ -d "$REPO_DIR/spotify" ]; then
    mkdir -p "$HOME/.local/share/applications" "$HOME/.config"
    [ -f "$REPO_DIR/spotify/spotify.desktop" ] && cp -f "$REPO_DIR/spotify/spotify.desktop" "$HOME/.local/share/applications/spotify.desktop"
    [ -f "$REPO_DIR/spotify/spotify-flags.conf" ] && cp -f "$REPO_DIR/spotify/spotify-flags.conf" "$HOME/.config/spotify-flags.conf"
    update-desktop-database "$HOME/.local/share/applications" 2>/dev/null || true
fi

if [ -d /opt/spotify ] && command -v spicetify >/dev/null 2>&1; then
    sudo chmod a+wr /opt/spotify
    sudo chmod a+wr /opt/spotify/Apps -R
    mkdir -p "$HOME/.config/spotify"
    if [ ! -s "$HOME/.config/spotify/prefs" ]; then
        SPOT_VER=$(/opt/spotify/spotify --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n1)
        printf 'app.last-launched-version="%s"\n' "${SPOT_VER:-1.2.50.335}" > "$HOME/.config/spotify/prefs"
    fi
    spicetify config spotify_path /opt/spotify/
    spicetify config prefs_path "$HOME/.config/spotify/prefs"
    spicetify backup apply || spicetify apply
fi
