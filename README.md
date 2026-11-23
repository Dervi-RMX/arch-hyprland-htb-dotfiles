 <div align="center">

# ⚡ Arch Linux + Hyprland — Pentesting & HTB Edition

**Entorno plug-and-play sobre Arch Linux y Wayland con tematización dinámica por entorno, módulos tácticos para Hack The Box / TryHackMe y compatibilidad automática con PC física y VMware.**

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=for-the-badge&logo=wayland&logoColor=black)
![Waybar](https://img.shields.io/badge/Waybar-Dynamic_UI-FF3E3E?style=for-the-badge)
![Shell](https://img.shields.io/badge/Zsh_+_Starship-89E051?style=for-the-badge&logo=gnu-bash&logoColor=black)

</div>

---

## 🖼️ Vista Previa de Entornos (`Super + W`)

El selector interactivo **`Super + W`** adapta automáticamente Wallpaper, Waybar, Kitty, cursores y Spicetify al instante y sin interrupciones.

| 🟡 Entorno Minato / Flash | 🎵 Spotify TUI & Terminal |
| :---: | :---: |
| ![Entorno 1](assets/preview2.png) | ![Entorno 2](assets/preview3.png) |

---

## 🚀 Instalación Automática (Plug & Play)

Clona el repositorio y ejecuta el instalador. Configura paquetes, SDDM, Waybar, Zsh, Kitty, cursores, atajos universales y Spotify + Spicetify automáticamente.

```bash
git clone https://github.com/Dervi-RMX/arch-hyprland-htb-dotfiles.git

cd arch-hyprland-htb-dotfiles

chmod +x install.sh

./install.sh
```

> **Soporte para máquinas virtuales (VMware / VirtualBox):** El instalador detecta automáticamente si corre en una máquina virtual, amplía `RuntimeDirectorySize=1G` y ajusta el renderizado gráfico sin requerir pasos manuales.

## 🎯 Comandos Tácticos de Pentesting (Zsh + Waybar)

Integrados en la barra superior (**Waybar**) con copia directa al portapapeles al hacer clic.

| Comando / Acción | Descripción |
|---|---|
| `settarget <IP> [Nombre]` | Fija la máquina objetivo activa en Waybar (`~/.cache/htb_target`). |
| `cleartarget` | Limpia el objetivo activo de la barra. |
| *Clic en módulo VPN* | Detecta automáticamente la IP de `tun0` y la copia al portapapeles. |
| *Clic en módulo Target* | Copia la IP de la máquina objetivo activa al portapapeles. |

### Ejemplos de uso

```bash
# Establecer una máquina objetivo
settarget 10.10.11.25 Forest

# Establecer una IP sin nombre
settarget 10.10.11.25

# Limpiar el objetivo activo
cleartarget
```

## ⌨️ Atajos de Teclado Principales

Presiona **`Super + H`** o **`F1`** en cualquier momento para abrir el **Cheatsheet interactivo** en pantalla.

| Categoría | Atajo | Acción |
|---|---|---|
| **Sistema** | `Super + W` | Cambiar Wallpaper y sincronizar la paleta completa del entorno. |
| **Sistema** | `Super + H` / `F1` | Abrir Cheatsheet interactivo de atajos. |
| **Sistema** | `Super + Shift + R` | Recargar entorno (Waybar + Kitty). |
| **Sistema** | `Super + Q` | Cerrar ventana activa. |
| **Aplicaciones** | `Super + Return` | Abrir terminal Kitty. |
| **Aplicaciones** | `Super + Space` | Lanzador de aplicaciones (Rofi). |
| **Aplicaciones** | `Super + D` | Abrir navegador web (Firefox). |
| **Aplicaciones** | `Super + E` | Abrir explorador de archivos. |
| **Ventanas** | `Super + [1-5]` | Cambiar al escritorio (workspace) correspondiente. |
| **Ventanas** | `Super + Shift + [1-9]` | Mover ventana activa al escritorio correspondiente. |
| **Ventanas** | `Super + V` | Alternar ventana flotante / mosaico. |
| **Ventanas** | `Super + Flechas` | Mover foco entre ventanas. |
| **Capturas** | `Super + Shift + S` / `Print` | Captura de área (guarda en `~/Pictures` y copia al portapapeles). |

## 📸 Sistema de Capturas de Pantalla

El proyecto incluye un script personalizado llamado `screenshot`, compatible con Wayland y Hyprland.

### Captura de pantalla completa

```bash
screenshot full
```

### Captura de un área seleccionada

```bash
screenshot
```

Las capturas se guardan automáticamente en:

```bash
~/Pictures/
```

Además, las imágenes se copian al portapapeles para poder pegarlas directamente en otras aplicaciones.

### Dependencias

```bash
sudo pacman -S grim slurp wl-clipboard
```

## 🎨 Personalización del Entorno

El entorno está diseñado para ofrecer una experiencia visual consistente y dinámica.

Sus principales componentes son:

- **Hyprland:** gestor de ventanas dinámico para Wayland.
- **Waybar:** barra superior con módulos personalizados.
- **Kitty:** terminal con configuración y temas dinámicos.
- **Rofi:** lanzador de aplicaciones y selector de entornos.
- **Starship:** prompt personalizado para Zsh.
- **Spicetify:** personalización visual de Spotify.
- **Zsh:** shell con funciones y aliases para pentesting.

## 🛠️ Herramientas y Tecnologías

| Tecnología | Función |
|---|---|
| Arch Linux | Sistema operativo base. |
| Hyprland | Gestor de ventanas Wayland. |
| Waybar | Barra de estado personalizada. |
| Kitty | Emulador de terminal. |
| Rofi | Lanzador y selector interactivo. |
| Zsh | Shell principal. |
| Starship | Prompt personalizado. |
| Spicetify | Personalización de Spotify. |
| Grim | Capturas de pantalla. |
| Slurp | Selección de regiones de pantalla. |
| wl-clipboard | Administración del portapapeles. |

## 📁 Estructura del Repositorio

```text
arch-hyprland-htb-dotfiles/
│
├── assets/          # Capturas de pantalla de los entornos
│
├── hypr/            # Configuración de Hyprland y keybinds universales
│
├── waybar/          # Cápsulas dinámicas, estilos CSS y scripts VPN / Target
│
├── kitty/           # Terminal con temas dinámicos y tipografía Nerd Font
│
├── rofi/            # Menú lanzador y selector de entornos
│
├── spicetify/       # Tema y configuración de Spotify
│
├── starship/        # Prompt Powerline personalizado
│
├── zsh/             # Aliases y funciones settarget / cleartarget
│
├── scripts/         # wallpaper-picker, screenshot y cheatsheet interactivo
│
└── install.sh       # Orquestador automático de instalación
```

## 💻 Compatibilidad

- Arch Linux.
- Wayland.
- Hyprland.
- Equipos físicos.
- VMware.
- VirtualBox (según compatibilidad gráfica y configuración).

## 🔄 Actualizar el Repositorio

Si ya tienes el proyecto instalado y quieres obtener los últimos cambios:

```bash
cd ~/arch-hyprland-htb-dotfiles

git pull origin main
```

## 📤 Contribuciones

Las contribuciones, mejoras y sugerencias son bienvenidas.

Si deseas colaborar:

1. Haz un Fork del repositorio.
2. Crea una rama para tus cambios.
3. Realiza tus modificaciones.
4. Envía un Pull Request.

## 👨‍💻 Autor

**Dervi-RMX**

Arch Linux • Hyprland • Cybersecurity • Pentesting • Hack The Box

GitHub: [@Dervi-RMX](https://github.com/Dervi-RMX)

Repositorio: [arch-hyprland-htb-dotfiles](https://github.com/Dervi-RMX/arch-hyprland-htb-dotfiles)

---

<div align="center">

**⚡ Built for Linux enthusiasts, cybersecurity learners and penetration testers.**

*Customize your environment. Master your workflow. Keep learning.*

</div>
