 <div align="center">

# ⚡ SHINOBI-HYPR

### Arch Linux · Hyprland · Pentesting Environment

**Un entorno de escritorio personalizado para Linux, diseñado para productividad, personalización y ciberseguridad.**

[![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/WM-Hyprland-58E1FF?style=for-the-badge&logo=wayland&logoColor=black)](https://hypr.land/)
[![Shell](https://img.shields.io/badge/Shell-Zsh-89E051?style=for-the-badge&logo=gnubash&logoColor=black)](https://www.zsh.org/)
[![HTB](https://img.shields.io/badge/Focus-Hack%20The%20Box-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=black)](https://www.hackthebox.com/)

<br>

**Minimalista. Personalizable. Preparado para trabajar.**

</div>

---

## 📸 Preview

<div align="center">

### SHINOBI-HYPR Desktop

<img src="assets/preview2.png" width="100%" alt="SHINOBI-HYPR Desktop Preview">

<br><br>

### More Details

<img src="assets/preview3.png" width="100%" alt="SHINOBI-HYPR Desktop Preview 2">

</div>

---

## 🧭 Contenido

- [✨ Características](#-características)
- [🎨 Sistema de temas](#-sistema-de-temas)
- [🛠️ Componentes](#️-componentes)
- [⚔️ Herramientas HTB](#️-herramientas-htb)
- [⌨️ Atajos de teclado](#️-atajos-de-teclado)
- [📷 Capturas de pantalla](#-capturas-de-pantalla)
- [🚀 Instalación](#-instalación)
- [📁 Estructura](#-estructura-del-proyecto)
- [⚙️ Personalización](#️-personalización)
- [🔄 Actualización](#-actualización)
- [🤝 Contribuciones](#-contribuciones)

---

## ✨ Características

SHINOBI-HYPR reúne diferentes herramientas y configuraciones para crear un entorno de escritorio moderno sobre Arch Linux.

| Característica | Descripción |
|---|---|
| 🪟 Hyprland | Gestor de ventanas dinámico para Wayland |
| 🎨 Temas | Seis temas dinámicos personalizables |
| 📊 Waybar | Panel con información del sistema |
| 🖥️ Kitty | Terminal personalizada |
| 🚀 Rofi | Lanzador de aplicaciones |
| 🐚 Zsh | Shell con funciones personalizadas |
| ⭐ Starship | Prompt moderno para terminal |
| 🎯 HTB Target | Visualización del objetivo de laboratorio |
| 🔐 VPN | Indicador de conexión HTB mediante `tun0` |
| 📸 Screenshot | Herramienta personalizada para capturas |

---

## 🎨 Sistema de temas

Personaliza la apariencia del escritorio mediante seis temas dinámicos.

<details>
<summary><strong>🎭 Ver información de los temas</strong></summary>

- Diferentes combinaciones de colores.
- Personalización de terminal y panel.
- Cambio de apariencia mediante el selector de temas.
- Integración con Wallust cuando esté configurado.

**Atajo:** `Super + W`

</details>

---

## 🛠️ Componentes

| Componente | Función |
|---|---|
| Arch Linux | Sistema operativo |
| Hyprland | Window Manager |
| Waybar | Barra de estado |
| Kitty | Terminal |
| Rofi | Application launcher |
| Wallust | Generación de colores |
| Zsh | Shell |
| Starship | Prompt |
| Swaylock | Bloqueo de pantalla |
| SDDM | Gestor de inicio de sesión |
| Spicetify | Personalización de Spotify |

---

## ⚔️ Herramientas HTB

El entorno incluye funciones para facilitar el trabajo en laboratorios de **Hack The Box**.

### 🎯 Gestión de objetivos

Establece la IP del objetivo:

```bash
settarget 10.10.11.100
```

También puedes asignarle un nombre:

```bash
settarget 10.10.11.100 MACHINE
```

Consulta el objetivo utilizando:

```bash
settarget
```

Limpia el objetivo actual:

```bash
cleartarget
```

El objetivo se almacena en:

```text
~/.cache/htb_target
```

### 🔐 Indicador VPN

El entorno contempla la visualización de la interfaz `tun0` en Waybar para identificar el estado de conexión con la VPN de HTB.

---

## ⌨️ Atajos de teclado

| Atajo | Acción |
|---|---|
| `Super + Return` | Abrir Kitty |
| `Super + Space` | Abrir Rofi |
| `Super + D` | Abrir Firefox |
| `Super + E` | Abrir administrador de archivos |
| `Super + Q` | Cerrar ventana |
| `Super + V` | Alternar ventana flotante |
| `Super + W` | Selector de temas |
| `Super + H` | Cheatsheet |
| `Super + Shift + R` | Recargar configuración |
| `Super + 1–5` | Cambiar de workspace |
| `Super + Shift + 1–9` | Mover ventana de workspace |
| `Super + Arrow` | Cambiar el foco |
| `Print` | Captura de pantalla |

> Los atajos pueden variar según la configuración activa de Hyprland.

---

## 📷 Capturas de pantalla

El proyecto incluye un script personalizado para realizar capturas.

```bash
screenshot
```

Captura de pantalla completa:

```bash
screenshot full
```

Las imágenes se guardan en:

```text
~/Pictures
```

El funcionamiento del portapapeles requiere `wl-clipboard`.

---

## 🚀 Instalación

### 1. Clonar el repositorio

```bash
git clone https://github.com/Dervi-RMX/shinobi-hypr.git
```

### 2. Entrar al proyecto

```bash
cd shinobi-hypr
```

### 3. Revisar el instalador

Antes de ejecutar cualquier instalación, revisa el contenido de:

```bash
less install.sh
```

### 4. Instalar

Si ya verificaste el instalador y sus dependencias:

```bash
chmod +x install.sh
./install.sh
```

> ⚠️ **Importante:** Este proyecto modifica configuraciones del entorno. Realiza una copia de seguridad de tus archivos antes de instalarlo. Comprueba las dependencias y opciones del instalador para evitar sobrescribir configuraciones existentes.

---

## 📁 Estructura del proyecto

```text
shinobi-hypr/
│
├── assets/             # Capturas y recursos gráficos
├── fastfetch/          # Configuración de Fastfetch
├── hypr/               # Configuración de Hyprland
├── icons/              # Iconos
├── kitty/              # Configuración de Kitty
├── rofi/               # Temas y configuración de Rofi
├── scripts/            # Scripts personalizados
├── sddm/               # Temas de inicio de sesión
├── spicetify/          # Configuración de Spicetify
├── spotify/            # Recursos de Spotify
├── starship/           # Configuración de Starship
├── swaylock-themes/    # Temas de bloqueo
├── waybar/             # Configuración de Waybar
├── zsh/                # Configuración de Zsh
│
├── .gitignore
├── README.md
└── install.sh
```

---

## ⚙️ Personalización

Puedes adaptar el entorno a tus preferencias modificando las configuraciones de cada componente.

- **Hyprland:** ventanas, animaciones y atajos.
- **Waybar:** módulos, indicadores y apariencia.
- **Kitty:** colores, fuentes y terminal.
- **Rofi:** lanzador y temas.
- **Zsh:** alias y funciones.
- **Starship:** apariencia del prompt.

---

## 🔄 Actualización

Para obtener los últimos cambios:

```bash
cd shinobi-hypr
git pull origin main
```

Revisa los cambios antes de reemplazar configuraciones locales.

---

## 🤝 Contribuciones

¿Tienes ideas para mejorar SHINOBI-HYPR?

Las contribuciones son bienvenidas. Puedes:

1. Crear un fork del repositorio.
2. Crear una nueva rama.
3. Implementar tus mejoras.
4. Enviar un Pull Request.

---

<div align="center">

## ⚡ SHINOBI-HYPR

**Built for Linux. Configured for productivity.**

<sub>Arch Linux · Hyprland · Cybersecurity · HTB</sub>

<br>

[![GitHub](https://img.shields.io/badge/GitHub-Dervi--RMX-181717?style=for-the-badge&logo=github)](https://github.com/Dervi-RMX)
[![Repository](https://img.shields.io/badge/Repository-SHINOBI--HYPR-7B2CBF?style=for-the-badge&logo=github)](https://github.com/Dervi-RMX/shinobi-hypr)

</div>
