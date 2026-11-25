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
        git base-devel hyprland waybar playerctl pavucontrol kitty rofi-wayland swaybg awww \
        hyprlock  starship fastfetch zsh zsh-autosuggestions zsh-syntax-highlighting yazi \
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
[ -d "$REPO_DIR/-themes" ] && cp -rf "$REPO_DIR/-themes" "$HOME/.config/"
[ -f "$REPO_DIR/zsh/.zshrc" ] && cp -f "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"

# 4. Instalar scripts y wallpapers
if [ -d "$REPO_DIR/scripts" ]; then
    cp -rf "$REPO_DIR/scripts/"* "$HOME/.local/bin/"
mkdir -p "$HOME/.config/Code/User"
cp -f "$REPO_DIR/vscode/settings.json" "$HOME/.config/Code/User/settings.json"
cp -f "$REPO_DIR/vscode/code-flags.conf" "$HOME/.config/code-flags.conf"
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

# Instalar configuracion visual de notificaciones (dunst / swaync)
if [ -d "$REPO_DIR/dunst" ]; then
    mkdir -p "$HOME/.config/dunst"
    cp -rf "$REPO_DIR/dunst/"* "$HOME/.config/dunst/"
fi
if [ -d "$REPO_DIR/swaync" ]; then
    mkdir -p "$HOME/.config/swaync"
    cp -rf "$REPO_DIR/swaync/"* "$HOME/.config/swaync/"
fi
# Instalar -effects para pantalla de bloqueo dinamica
# --- SHINOBI-LOCK DYNAMIC SCREEN LOCK ---
echo "[*] Configurando pantalla de bloqueo dinamica (shinobi-lock)..."

# 1. Instalar -effects reemplazando  base sin bloqueo interactivo
if ! pacman -Qi -effects >/dev/null 2>&1; then
    if pacman -Qi  >/dev/null 2>&1; then
        sudo pacman -Rdd --noconfirm  2>/dev/null || true
    fi
    if command -v yay >/dev/null 2>&1; then
        yay -S --noconfirm --answerdiff None --answerclean None -effects
    elif command -v paru >/dev/null 2>&1; then
        paru -S --noconfirm -effects
    fi
fi

# 2. Copiar ejecutable shinobi-lock y configuracion hyprland.lua
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.local/bin" "$HOME/.config/hypr"
if [ -f "$SCRIPT_DIR/scripts/shinobi-lock" ]; then
    cp -f "$SCRIPT_DIR/scripts/shinobi-lock" "$HOME/.local/bin/shinobi-lock"
    chmod +x "$HOME/.local/bin/shinobi-lock"
fi
if [ -f "$SCRIPT_DIR/hypr/hyprland.lua" ]; then
    cp -f "$SCRIPT_DIR/hypr/hyprland.lua" "$HOME/.config/hypr/hyprland.lua"
fi
# --- WLOGOUT SESSION MENU ---
echo "[*] Instalando y configurando menu de sesion wlogout..."

# 1. Instalar wlogout desde repositorios oficiales o AUR
if ! command -v wlogout >/dev/null 2>&1; then
    if sudo pacman -S --noconfirm wlogout 2>/dev/null; then
        true
    elif command -v yay >/dev/null 2>&1; then
        yay -S --noconfirm --answerdiff None --answerclean None wlogout
    elif command -v paru >/dev/null 2>&1; then
        paru -S --noconfirm wlogout
    fi
fi

# 2. Copiar layout y estilo dinamico de wlogout al perfil del usuario
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.config/wlogout"
if [ -d "$SCRIPT_DIR/wlogout" ]; then
    cp -rf "$SCRIPT_DIR/wlogout/"* "$HOME/.config/wlogout/"
fi
# Generar iconos dinamicos de wlogout segun entorno
sudo pacman -S --noconfirm --needed python-pillow 2>/dev/null || true
if [ -f "$SCRIPT_DIR/scripts/shinobi-wlogout-icons" ]; then
    cp -f "$SCRIPT_DIR/scripts/shinobi-wlogout-icons" "$HOME/.local/bin/shinobi-wlogout-icons"
    chmod +x "$HOME/.local/bin/shinobi-wlogout-icons"
    "$HOME/.local/bin/shinobi-wlogout-icons" 2>/dev/null || true
fi
# --- SPICETIFY HAZY GLASS THEME ---
echo "[*] Configurando tema transparente Hazy para Spotify (Spicetify)..."
if command -v spicetify >/dev/null 2>&1; then
    rm -rf /tmp/Hazy "$HOME/.config/spicetify/Themes/Hazy"
    if git clone --depth=1 https://github.com/Astromations/Hazy.git /tmp/Hazy 2>/dev/null; then
        mkdir -p "$HOME/.config/spicetify/Themes/Hazy"
        cp -rf /tmp/Hazy/* "$HOME/.config/spicetify/Themes/Hazy/"
        rm -rf /tmp/Hazy
        spicetify config current_theme Hazy color_scheme dark inject_css 1 replace_colors 1 overwrite_assets 1 inject_theme_js 1 >/dev/null 2>&1 || true
        spicetify apply >/dev/null 2>&1 || true
    fi
fi
cp -f "$SCRIPT_DIR/scripts/shinobi-bar-toggle" "$SCRIPT_DIR/scripts/wallpaper-picker" "$HOME/.local/bin/" 2>/dev/null && chmod +x "$HOME/.local/bin/shinobi-bar-toggle" "$HOME/.local/bin/wallpaper-picker"
mkdir -p "$HOME/.cache" && [ ! -f "$HOME/.cache/shinobi-bar-mode" ] && echo "left" > "$HOME/.cache/shinobi-bar-mode"
cp -f "$SCRIPT_DIR/waybar/config-vertical.jsonc" "$SCRIPT_DIR/waybar/style-vertical.css" "$HOME/.config/waybar/" 2>/dev/null || true

# --- SHINOBI ZERO-TOUCH DASHBOARD & VERTICAL BAR ---
if ! command -v eww >/dev/null 2>&1; then
    if ! command -v yay >/dev/null 2>&1 && ! command -v paru >/dev/null 2>&1; then
        TMP_YAY=$(mktemp -d)
        git clone https://aur.archlinux.org/yay-bin.git "$TMP_YAY/yay-bin" && (cd "$TMP_YAY/yay-bin" && makepkg -si --noconfirm)
        rm -rf "$TMP_YAY"
    fi
    if command -v yay >/dev/null 2>&1; then
        yay -S --needed --noconfirm eww
    elif command -v paru >/dev/null 2>&1; then
        paru -S --needed --noconfirm eww
    fi
fi

mkdir -p "$HOME/.config/waybar" "$HOME/.config/eww" "$HOME/.local/bin" "$HOME/.cache"
cp -rf "${REPO_DIR:-$SCRIPT_DIR}/waybar/"* "$HOME/.config/waybar/" 2>/dev/null || true
cp -rf "${REPO_DIR:-$SCRIPT_DIR}/eww/"* "$HOME/.config/eww/" 2>/dev/null || true
cp -f "${REPO_DIR:-$SCRIPT_DIR}/scripts/"* "$HOME/.local/bin/" 2>/dev/null || true
chmod +x "$HOME/.local/bin/"*
[ ! -f "$HOME/.cache/shinobi-bar-mode" ] && echo "left" > "$HOME/.cache/shinobi-bar-mode"
"$HOME/.local/bin/shinobi-dashboard-toggle" --sync-only 2>/dev/null || true
"$HOME/.local/bin/shinobi-vscode-sync" 2>/dev/null || true
