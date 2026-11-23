 <div align="center">

# ⚡ SHINOBI-HYPR
### ARCH LINUX • HYPRLAND • PENTESTING EDITION

**A dynamic, customizable and automated Linux desktop environment built for cybersecurity professionals, penetration testers and Linux enthusiasts.**

Powered by Arch Linux, Hyprland, Waybar, Wallust, Kitty, Zsh and Starship.

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=for-the-badge&logo=wayland&logoColor=black)
![Waybar](https://img.shields.io/badge/Waybar-Dynamic_UI-FF3E3E?style=for-the-badge)
![Zsh](https://img.shields.io/badge/Zsh-Shell-89E051?style=for-the-badge&logo=zsh&logoColor=black)
![Starship](https://img.shields.io/badge/Starship-Prompt-DD0B78?style=for-the-badge&logo=starship&logoColor=white)

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Keybindings](#-keyboard-shortcuts) • [Structure](#-project-structure)

</div>

---

## 🥷 About SHINOBI-HYPR

**SHINOBI-HYPR** is a personalized Arch Linux desktop environment built around Hyprland and Wayland.

The project combines aesthetics, performance, automation and productivity in a unified desktop experience.

Designed with cybersecurity workflows in mind, it includes Hack The Box integration, dynamic VPN monitoring, target management and a customizable interface.

The objective is simple:

**Build a desktop environment that looks unique, works efficiently and supports real cybersecurity workflows.**

## ✨ Features

### 🎨 Dynamic Theme System

Six customizable visual environments with synchronized appearance across supported applications.

- Dynamic wallpaper switching.
- Wallust color generation.
- Waybar theme synchronization.
- Kitty terminal customization.
- Dynamic cursor selection.
- Spicetify integration.

**Theme selector:** `Super + W`

### 🛡️ Cybersecurity Integration

Designed for Hack The Box and penetration testing laboratories.

- HTB VPN monitoring through `tun0`.
- VPN IP display in Waybar.
- Active target monitoring.
- Target clipboard integration.
- Custom Zsh commands.
- Interactive keyboard shortcuts cheatsheet.

### ⚡ Automated Installation

The installation script orchestrates the deployment of the environment.

- Hyprland.
- Waybar.
- Kitty.
- Rofi.
- Zsh.
- Starship.
- SDDM.
- Custom icons and cursors.
- Swaylock themes.
- Spotify and Spicetify integration.

### 💻 Virtualization

Designed for Arch Linux installations on physical machines and compatible virtualized environments.

- VMware.
- VirtualBox.

Graphics support depends on the host system, hypervisor and guest configuration.

---

## 🖼️ Screenshots

<div align="center">

### Environment 01 — Minato / Flash

![SHINOBI-HYPR Environment 01](assets/preview2.png)

### Environment 02 — Spotify / Terminal

![SHINOBI-HYPR Environment 02](assets/preview3.png)

</div>

---

## 🚀 Installation

### Requirements

- Arch Linux.
- Internet connection.
- Wayland-compatible graphics.
- User account with `sudo` privileges.

### 1. Clone SHINOBI-HYPR

```bash
git clone https://github.com/Dervi-RMX/shinobi-hypr.git
```

### 2. Enter the directory

```bash
cd shinobi-hypr
```

### 3. Make the installer executable

```bash
chmod +x install.sh
```

### 4. Execute the installer

```bash
./install.sh
```

> **Important:** Review `install.sh` before execution. It may install packages and modify system configurations, including display manager and desktop settings. Back up existing configurations first.

---

## 🎯 Pentesting Workflow

### HTB Target Management

SHINOBI-HYPR includes custom Zsh functions for managing active targets.

| Command | Description |
|---|---|
| `settarget <IP>` | Set active target IP. |
| `settarget <IP> <Name>` | Set target IP and machine name. |
| `set target <IP> <Name>` | Alternative target command. |
| `cleartarget` | Clear active target. |

### Examples

```bash
settarget 10.10.11.25 Forest
```

```bash
settarget 10.10.11.25
```

```bash
cleartarget
```

Target information is stored in:

```bash
~/.cache/htb_target
```

### VPN Monitoring

The Waybar VPN module monitors the `tun0` interface.

Check the interface:

```bash
ip addr show tun0
```

Check routes:

```bash
ip route
```

---

## ⌨️ Keyboard Shortcuts

| Shortcut | Action |
|---|---|
| `Super + W` | Open dynamic theme selector. |
| `Super + H` | Open interactive cheatsheet. |
| `F1` | Open keyboard shortcuts cheatsheet. |
| `Super + Shift + R` | Reload desktop components. |
| `Super + Q` | Close active window. |
| `Super + Return` | Open Kitty terminal. |
| `Super + Space` | Open Rofi. |
| `Super + D` | Open Firefox. |
| `Super + E` | Open file manager. |
| `Super + [1-5]` | Switch workspace. |
| `Super + Shift + [1-9]` | Move active window to another workspace. |
| `Super + V` | Toggle floating mode. |
| `Super + Arrow Keys` | Change window focus. |
| `Super + Shift + S` | Take screenshot. |
| `Print` | Take screenshot. |

*Actual bindings depend on the installed Hyprland configuration.*

---

## 📸 Screenshot System

SHINOBI-HYPR includes a custom screenshot script for Wayland.

### Capture selected area

```bash
screenshot
```

### Capture full screen

```bash
screenshot full
```

Images are saved automatically in:

```bash
~/Pictures/
```

### Dependencies

```bash
sudo pacman -S grim slurp wl-clipboard
```

---

## 🎵 Spotify & Spicetify

The project includes Spotify integration and Spicetify customization.

- Automated Spotify installation.
- Custom themes.
- Visual synchronization with the desktop environment.
- Wayland-oriented launch configuration.

---

## 🧰 Technologies

| Component | Purpose |
|---|---|
| Arch Linux | Base operating system. |
| Hyprland | Wayland compositor. |
| Waybar | Status bar. |
| Wallust | Dynamic color generation. |
| Kitty | Terminal emulator. |
| Rofi | Application launcher. |
| Zsh | Interactive shell. |
| Starship | Custom prompt. |
| SDDM | Display manager. |
| Spicetify | Spotify customization. |
| Grim | Screenshot utility. |
| Slurp | Region selection. |
| wl-clipboard | Clipboard management. |

---

## 📁 Project Structure

```text
shinobi-hypr/
│
├── assets/              # Screenshots and visual resources
│
├── fastfetch/           # System information configuration
│
├── hypr/                # Hyprland configuration
│
├── icons/               # Custom icons and cursor themes
│
├── kitty/               # Terminal configuration and themes
│
├── rofi/                # Application launcher and theme selector
│
├── scripts/             # Custom automation and utility scripts
│
├── sddm/                # Display manager themes and configuration
│
├── spicetify/           # Spotify customization
│
├── spotify/             # Spotify integration
│
├── starship/            # Starship prompt configuration
│
├── swaylock-themes/     # Screen lock themes
│
├── waybar/              # Waybar configuration and modules
│
├── zsh/                 # Zsh configuration and HTB functions
│
├── .gitignore           # Git exclusion rules
│
├── install.sh           # Automated installation
│
└── README.md            # Project documentation
```

---

## 🔧 Customization

Every component is organized into its own directory.

Customize:

- Hyprland keybindings and window behavior.
- Waybar modules and appearance.
- Kitty terminal colors.
- Rofi menus and themes.
- Zsh aliases and functions.
- Starship prompt.
- Wallpapers and dynamic environments.
- Cursor and lock-screen themes.

SHINOBI-HYPR is designed to be modular and customizable.

---

## 🔄 Updating

Update your local copy:

```bash
cd ~/shinobi-hypr

git pull origin main
```

---

## 🤝 Contributions

Contributions, suggestions and improvements are welcome.

1. Fork the repository.
2. Create a branch.
3. Implement your changes.
4. Submit a Pull Request.

---

## 👨‍💻 Author

<div align="center">

### Dervi-RMX

**Linux Enthusiast • Cybersecurity • Pentesting**

Building, experimenting and learning through technology.

[GitHub Profile](https://github.com/Dervi-RMX)

[SHINOBI-HYPR Repository](https://github.com/Dervi-RMX/shinobi-hypr)

</div>

---

<div align="center">

### 🥷 SHINOBI-HYPR

**CUSTOMIZE YOUR ENVIRONMENT. MASTER YOUR WORKFLOW.**

*Built with Arch Linux. Powered by Hyprland.*

</div>
