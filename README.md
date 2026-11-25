
<div align="center">

# 🥷 SHINOBI-HYPR

### ARCH LINUX · HYPRLAND · CYBERSECURITY ENVIRONMENT

**Un ecosistema Linux personalizado, automatizado y diseñado para productividad, personalización y ciberseguridad.**

<br>

[![Arch Linux](https://img.shields.io/badge/ARCH_LINUX-1793D1?style=for-the-badge&logo=archlinux&logoColor=white)](https://archlinux.org/)
[![Hyprland](https://img.shields.io/badge/HYPRLAND-58E1FF?style=for-the-badge&logo=wayland&logoColor=black)](https://hypr.land/)
[![Wayland](https://img.shields.io/badge/WAYLAND-FFBC00?style=for-the-badge&logo=wayland&logoColor=black)](https://wayland.freedesktop.org/)
[![Eww](https://img.shields.io/badge/EWW-Dashboard-F97316?style=for-the-badge)](https://github.com/elkowar/eww)
[![Hack The Box](https://img.shields.io/badge/HACK_THE_BOX-9FEF00?style=for-the-badge&logo=hackthebox&logoColor=black)](https://www.hackthebox.com/)

<br>

**MINIMAL. DINÁMICO. PERSONALIZABLE.**

[Características](#-características) · [Temas](#-sistema-de-temas) · [Instalación](#-instalación) · [Atajos](#-atajos-de-teclado)

</div>

---

# 📸 Vista previa

<div align="center">

### SHINOBI-HYPR Desktop

<img src="assets/preview2.png" width="100%" alt="SHINOBI-HYPR Desktop">

<br><br>

### Alternative Desktop View

<img src="assets/preview3.png" width="100%" alt="SHINOBI-HYPR Alternative Desktop">

</div>

---

# 🧭 Tabla de contenidos

- [Características](#-características)
- [Sistema de temas](#-sistema-de-temas)
- [Shinobi Dashboard](#-shinobi-dashboard)
- [Waybar Dual](#-waybar-dual)
- [Wallust](#-wallust--sincronización-de-colores)
- [Integración Hack The Box](#-integración-hack-the-box)
- [Ecosistema de herramientas](#-ecosistema-de-herramientas)
- [Atajos de teclado](#-atajos-de-teclado)
- [Instalación](#-instalación)
- [Estructura del proyecto](#-estructura-del-proyecto)
- [Personalización](#-personalización)
- [Solución de problemas](#-solución-de-problemas)
- [Actualización](#-actualización)
- [Créditos](#-créditos)

---

# ✨ Características

SHINOBI-HYPR es un entorno de escritorio personalizado para Arch Linux que reúne herramientas, configuraciones, automatizaciones y componentes visuales en una experiencia integrada.

Su diseño está orientado tanto al uso diario como a entornos de aprendizaje y práctica de ciberseguridad.

| Característica | Descripción |
|---|---|
| 🪟 Hyprland | Gestor de ventanas dinámico para Wayland |
| 🥷 Shinobi Dashboard | Panel interactivo desarrollado con Eww |
| 📊 Waybar Dual | Barra superior y lateral intercambiables |
| 🌈 Wallust | Sincronización automática de colores |
| 🎨 Dynamic Themes | Sistema de seis temas visuales |
| ⚔️ HTB Integration | Indicadores y utilidades para Hack The Box |
| 🖥️ Kitty | Terminal personalizada |
| 🚀 Rofi | Lanzador de aplicaciones |
| 🔔 SwayNC | Centro de notificaciones |
| 🔌 Wlogout | Menú de apagado personalizado |
| 🐚 Zsh | Shell con funciones personalizadas |
| ⭐ Starship | Prompt personalizado |
| 🖼️ Fastfetch | Información visual del sistema |
| 🎧 Spicetify | Personalización de Spotify |
| 🔒 SDDM | Pantalla de inicio personalizada |
| 🖱️ Custom Cursors | Cursores Bibata y Capitaine |
| 📸 Screenshot | Herramientas de captura de pantalla |

---

# 🎨 Sistema de temas

SHINOBI-HYPR incorpora seis temas visuales que permiten transformar la apariencia del entorno.

Cada tema cuenta con una identidad visual propia y forma parte de un sistema de personalización que integra diferentes componentes del escritorio.

### Características

- Seis temas visuales.
- Personalización de terminales.
- Configuración de paneles.
- Integración con fondos de pantalla.
- Sincronización cromática.
- Personalización de cursores.
- Adaptación visual de diferentes componentes.

### Selector de temas

Utiliza el siguiente atajo:

```bash
Super + W
```

Desde el selector puedes acceder a los fondos de pantalla y opciones de personalización disponibles.

---

# 🥷 Shinobi Dashboard

Uno de los componentes principales de SHINOBI-HYPR es **Shinobi Dashboard**, un panel interactivo desarrollado con Eww.

Está diseñado para proporcionar acceso rápido a información y controles del sistema.

### Secciones principales

| Sección | Funcionalidad |
|---|---|
| Dashboard | Panel principal |
| Media | Controles multimedia |
| Performance | Métricas de rendimiento |
| Weather | Información meteorológica |

### Funcionalidades

- Reloj vertical.
- Calendario.
- Información de CPU.
- Información de RAM.
- Controles de audio.
- Integración con reproductores MPRIS.
- Cierre automático al hacer clic fuera del panel.

### Abrir y cerrar Dashboard

| Atajo | Acción |
|---|---|
| `Super + Z` | Abrir o cerrar |
| `Alt + Z` | Abrir o cerrar |
| Clic en icono de Arch | Abrir o cerrar |

---

# 📊 Waybar Dual

SHINOBI-HYPR incorpora dos distribuciones de Waybar para adaptar el escritorio a diferentes preferencias.

### Barra superior horizontal

Diseñada para proporcionar información del sistema en una distribución tradicional.

### Barra lateral vertical

Una alternativa visual que aprovecha el espacio vertical de la pantalla.

### Integraciones

- Indicadores del sistema.
- Estado de conexión VPN.
- Dirección IP local.
- Objetivo activo de Hack The Box.
- Información y controles personalizados.

### Cambiar entre barras

```bash
Super + B
```

---

# 🌈 Wallust — Sincronización de colores

Wallust permite generar una paleta de colores a partir del fondo de pantalla y utilizarla para personalizar diferentes componentes del escritorio.

El objetivo es mantener una apariencia visual coherente en todo el entorno.

### Componentes integrados

- Waybar.
- Shinobi Dashboard.
- Kitty.
- Rofi.
- SwayNC.
- Wlogout.
- Cursores.

Al cambiar el fondo de pantalla, los scripts de sincronización correspondientes permiten actualizar la apariencia de los componentes compatibles.

---

# ⚔️ Integración Hack The Box

SHINOBI-HYPR incorpora funcionalidades orientadas a facilitar el trabajo en laboratorios de Hack The Box.

Su integración permite visualizar información relevante del entorno de laboratorio directamente desde el escritorio.

### 🎯 Gestión de objetivos

Establecer la dirección IP de un objetivo:

```bash
settarget 10.10.11.100
```

Asignar un nombre al objetivo:

```bash
settarget 10.10.11.100 MACHINE
```

Consultar el objetivo actual:

```bash
settarget
```

Limpiar el objetivo:

```bash
cleartarget
```

### 🔐 Indicador VPN

El entorno contempla un indicador para la conexión VPN mediante la interfaz `tun0`.

Comprobar la interfaz:

```bash
ip addr show tun0
```

Consultar las interfaces disponibles:

```bash
ip -br addr
```

### Información del laboratorio

La integración está orientada a facilitar la visualización de:

- Estado de conexión VPN.
- Dirección IP local.
- Objetivo activo.
- Información del laboratorio.

---

# 🛠️ Ecosistema de herramientas

SHINOBI-HYPR reúne diferentes herramientas para construir una experiencia de escritorio completa.

| Herramienta | Función |
|---|---|
| Arch Linux | Sistema operativo |
| Hyprland | Gestor de ventanas |
| Eww | Dashboard interactivo |
| Waybar | Panel del escritorio |
| Wallust | Generación de colores |
| Kitty | Terminal |
| Rofi | Lanzador de aplicaciones |
| SwayNC | Centro de notificaciones |
| Wlogout | Menú de sesión |
| Zsh | Shell |
| Starship | Prompt |
| Fastfetch | Información del sistema |
| SDDM | Gestor de inicio de sesión |
| Swaylock | Bloqueo de pantalla |
| Spicetify | Personalización de Spotify |
| Spotify | Reproductor de música |
| Bibata / Capitaine | Cursores |

---

# ⌨️ Atajos de teclado

Los siguientes atajos corresponden a las configuraciones del entorno.

| Atajo | Acción |
|---|---|
| `Super + Z` | Abrir o cerrar Shinobi Dashboard |
| `Alt + Z` | Abrir o cerrar Shinobi Dashboard |
| `Clic en icono Arch` | Abrir o cerrar Dashboard |
| `Super + B` | Alternar Waybar vertical y horizontal |
| `Super + W` | Selector de wallpapers y temas |
| `Super + Return` | Abrir Kitty |
| `Super + E` | Abrir Yazi en terminal |
| `Super + Q` | Cerrar ventana activa |
| `Super + L` | Bloquear pantalla con shinobi-lock |
| `Super + Shift + S` | Captura de pantalla |
| `Super + 1–9` | Cambiar de espacio de trabajo |

> Algunos atajos y funciones pueden depender de los componentes instalados y de la configuración activa.

---

# 🚀 Instalación

SHINOBI-HYPR incluye un instalador automático para facilitar el despliegue del entorno.

## Requisitos

- Arch Linux.
- Conexión a Internet.
- Usuario con permisos `sudo`.
- Git.
- Curl.
- Una instalación funcional de Arch Linux.

## Instalación automática

Abre una terminal y ejecuta:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Dervi-RMX/shinobi-hypr/main/install.sh)
```

El comando descarga y ejecuta el instalador directamente desde GitHub.

## Instalación manual

Si prefieres descargar el proyecto y revisar sus archivos antes de instalarlo:

### 1. Instalar dependencias básicas

```bash
sudo pacman -S --needed git curl
```

### 2. Clonar el repositorio

```bash
git clone https://github.com/Dervi-RMX/shinobi-hypr.git
```

### 3. Entrar al directorio

```bash
cd shinobi-hypr
```

### 4. Revisar el instalador

```bash
less install.sh
```

### 5. Comprobar la sintaxis

```bash
bash -n install.sh
```

### 6. Ejecutar el instalador

```bash
chmod +x install.sh
./install.sh
```

### 7. Reiniciar el sistema cuando finalice

```bash
sudo reboot
```

## ⚠️ Advertencias importantes

Antes de instalar:

- Revisa el contenido de `install.sh`.
- Realiza una copia de seguridad de tus configuraciones actuales.
- Comprueba los paquetes que se instalarán.
- Verifica los servicios que se habilitarán.
- Comprueba las modificaciones que se realizarán en SDDM y Zsh.

El instalador puede modificar configuraciones existentes, instalar paquetes, habilitar servicios y cambiar componentes del entorno.

**No ejecutes el instalador como root directamente.** Utiliza tu usuario normal y permite que el script solicite permisos `sudo` cuando los necesite.

La instalación está diseñada para Arch Linux y no se garantiza su funcionamiento en otras distribuciones.

---

# 📁 Estructura del proyecto

```text
shinobi-hypr/
│
├── assets/              # Capturas y recursos gráficos
├── eww/                 # Shinobi Dashboard
├── fastfetch/           # Configuración de Fastfetch
├── hypr/                # Configuración de Hyprland
├── icons/               # Iconos y cursores
├── kitty/               # Configuración de Kitty
├── rofi/                # Temas y configuración de Rofi
├── scripts/             # Scripts y automatizaciones
├── sddm/                # Tema del gestor de inicio
├── spicetify/           # Configuración de Spicetify
├── spotify/             # Configuración de Spotify
├── starship/            # Configuración de Starship
├── swaylock-themes/     # Temas de bloqueo
├── swaync/              # Centro de notificaciones
├── waybar/              # Barra superior y lateral
├── wlogout/             # Menú de apagado
├── zsh/                 # Configuración de Zsh
│
├── .gitignore
├── README.md
└── install.sh
```

---

# ⚙️ Personalización

SHINOBI-HYPR permite modificar diferentes componentes para adaptar el entorno a tus preferencias.

| Directorio | Personalización |
|---|---|
| `hypr/` | Ventanas, animaciones y atajos |
| `eww/` | Dashboard y widgets |
| `waybar/` | Barras, módulos y estilos |
| `scripts/` | Automatizaciones y utilidades |
| `kitty/` | Terminal y colores |
| `rofi/` | Lanzadores y temas |
| `swaync/` | Notificaciones |
| `wlogout/` | Menú de sesión |
| `zsh/` | Alias y funciones |
| `starship/` | Prompt |
| `fastfetch/` | Información del sistema |
| `icons/` | Iconos y cursores |
| `spicetify/` | Personalización de Spotify |

---

# 🔧 Solución de problemas

## Hyprland no aparece en SDDM

Comprueba si está instalado:

```bash
pacman -Q hyprland
```

Comprueba el servicio:

```bash
systemctl status sddm
```

## Waybar no inicia

Ejecuta Waybar desde una terminal para observar posibles errores:

```bash
waybar
```

## Shinobi Dashboard no aparece

Comprueba que Eww esté instalado:

```bash
command -v eww
```

Comprueba los procesos:

```bash
pgrep -a eww
```

## No aparece la VPN de Hack The Box

Comprueba las interfaces:

```bash
ip -br addr
```

Si `tun0` no aparece, revisa la conexión OpenVPN.

## No funciona el portapapeles

Instala el paquete necesario:

```bash
sudo pacman -S --needed wl-clipboard
```

## No funciona la captura de pantalla

Comprueba las dependencias:

```bash
sudo pacman -S --needed grim slurp
```

---

# 🔄 Actualización

Para obtener los últimos cambios del repositorio:

```bash
cd ~/shinobi-hypr
git pull origin main
```

La actualización del repositorio no aplica automáticamente todas las configuraciones.

Revisa los cambios antes de reemplazar archivos locales o volver a ejecutar el instalador.

---

# 🧩 Créditos

SHINOBI-HYPR integra tecnologías y herramientas desarrolladas por diferentes proyectos.

Agradecimientos a sus respectivos desarrolladores y comunidades:

- [Arch Linux](https://archlinux.org/)
- [Hyprland](https://hypr.land/)
- [Waybar](https://github.com/Alexays/Waybar)
- [Eww](https://github.com/elkowar/eww)
- [Wallust](https://codeberg.org/explosion-mental/wallust)
- [Rofi](https://github.com/davatorium/rofi)
- [Kitty](https://sw.kovidgoyal.net/kitty/)
- [Starship](https://starship.rs/)
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch)

---

<div align="center">

# 🥷 SHINOBI-HYPR

### BUILT FOR LINUX. CONFIGURED FOR PRODUCTIVITY.

**ARCH LINUX · HYPRLAND · AUTOMATION · CYBERSECURITY**

<br>

[![GitHub](https://img.shields.io/badge/GitHub-Dervi--RMX-181717?style=for-the-badge&logo=github)](https://github.com/Dervi-RMX)

[![Project](https://img.shields.io/badge/PROJECT-SHINOBI--HYPR-7B2CBF?style=for-the-badge&logo=github)](https://github.com/Dervi-RMX/shinobi-hypr)

<br>

**Made with passion for Linux and cybersecurity.**

</div>
