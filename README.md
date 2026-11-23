 <div align="center">

# ⚡ ARCH LINUX + HYPRLAND
### PENTESTING & HTB EDITION

**A complete, dynamic and customizable Linux environment built for cybersecurity, penetration testing and everyday productivity.**

A personalized Arch Linux desktop powered by Hyprland, Waybar, Wallust, Kitty, Zsh and Starship, featuring dynamic themes, Hack The Box integration and automated installation.

<br/>

![Arch Linux](https://img.shields.io/badge/Arch_Linux-1793D1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-58E1FF?style=for-the-badge&logo=wayland&logoColor=black)
![Waybar](https://img.shields.io/badge/Waybar-Dynamic_UI-FF3E3E?style=for-the-badge)
![Zsh](https://img.shields.io/badge/Zsh-Shell-89E051?style=for-the-badge&logo=zsh&logoColor=black)
![Starship](https://img.shields.io/badge/Starship-Prompt-DD0B78?style=for-the-badge&logo=starship&logoColor=white)

[Features](#-features) • [Screenshots](#-screenshots) • [Installation](#-installation) • [Keybindings](#-keyboard-shortcuts) • [Commands](#-pentesting-workflow) • [Structure](#-project-structure)

</div>

---

## 🖥️ Overview

This repository contains my personal Arch Linux + Hyprland configuration, designed to create a powerful, modern and visually consistent desktop environment.

The main goal is to combine **performance, customization, automation and cybersecurity productivity** in a single environment.

The setup includes:

- Dynamic desktop themes and wallpapers.
- Automatic color synchronization.
- Custom Waybar modules.
- Hack The Box VPN monitoring.
- Active target monitoring.
- Custom Zsh functions.
- Starship Powerline prompt.
- Custom Kitty terminal.
- Interactive Rofi menus.
- Spotify and Spicetify integration.
- Custom cursors and lock-screen themes.
- Automated installation.

## ✨ Features

### 🎨 Dynamic Theme System

Switch between six different visual environments using the interactive theme selector.

Each environment synchronizes its visual configuration across supported applications.

- Wallpaper switching.
- Waybar color synchronization.
- Kitty terminal themes.
- Cursor themes.
- Spicetify customization.
- Wallust-based color generation.

**Theme switching:** `Super + W`

### 🛡️ Cybersecurity & HTB Integration

Designed to make penetration testing workflows more convenient.

**Waybar includes:**

- VPN interface monitoring (`tun0`).
- Current VPN IP display.
- Active HTB target display.
- Target clipboard integration.
- Dynamic status indicators.

### ⚡ Automated Environment

The installation script automates the deployment of the desktop environment and its configurations.

Includes:

- Hyprland configuration.
- Waybar setup.
- Zsh configuration.
- Kitty terminal.
- Rofi menus.
- Starship prompt.
- SDDM configuration.
- Custom icons and cursors.
- Spotify and Spicetify integration.

### 💻 Virtual Machine Support

The project is intended to support physical installations and virtualized environments such as:

- VMware.
- VirtualBox.

Graphics performance and compatibility may depend on the hypervisor, guest drivers and hardware configuration.

---

## 🖼️ Screenshots

<div align="center">

### Environment 01 — Minato / Flash

![Environment 01](assets/preview2.png)

### Environment 02 — Spotify / Terminal

![Environment 02](assets/preview3.png)

</div>

---

## 🚀 Installation

### Requirements

- Arch Linux.
- Internet connection.
- Working Wayland-compatible graphics.
- Sufficient disk space.
- A user account with `sudo` privileges.

### 1. Clone the repository

```bash
git clone https://github.com/Dervi-RMX/arch-hyprland-htb-dotfiles.git
```

### 2. Enter the project directory

```bash
cd arch-hyprland-htb-dotfiles
```

### 3. Make the installer executable

```bash
chmod +x install.sh
```

### 4. Run the installer

```bash
./install.sh
```

> **Important:** Review the installation script before running it. The installer may modify system configurations, install packages and configure the display manager. Back up existing configurations first.

---

## 🎯 Pentesting Workflow

### HTB Target Management

The environment includes custom Zsh functions to manage the active target.

| Command | Description |
|---|---|
| `settarget <IP>` | Set the active target IP. |
| `settarget <IP> <Name>` | Set target IP and machine name. |
| `set target <IP> <Name>` | Alternative target command. |
| `cleartarget` | Clear the active target. |

### Examples

Set an active target:

```bash
settarget 10.10.11.25 Forest
```

Set a target without a name:

```bash
settarget 10.10.11.25
```

Clear the active target:

```bash
cleartarget
```

The target information is stored in:

```bash
~/.cache/htb_target
```

### VPN Monitoring

The Waybar VPN module monitors the `tun0` interface and displays its current IP address when available.

Check the VPN interface manually:

```bash
ip addr show tun0
```

Check the routing table:

```bash
ip route
```

---

## ⌨️ Keyboard Shortcuts

The following shortcuts are part of the documented environment configuration. Individual bindings may depend on the installed Hyprland configuration.

| Shortcut | Action |
|---|---|
| `Super + W` | Open dynamic theme selector. |
| `Super + H` | Open interactive cheatsheet. |
| `F1` | Open keyboard shortcuts cheatsheet. |
| `Super + Shift + R` | Reload desktop components. |
| `Super + Q` | Close active window. |
| `Super + Return` | Open Kitty terminal. |
| `Super + Space` | Open Rofi application launcher. |
| `Super + D` | Open Firefox. |
| `Super + E` | Open file manager. |
| `Super + [1-5]` | Switch workspace. |
| `Super + Shift + [1-9]` | Move active window to another workspace. |
| `Super + V` | Toggle floating window mode. |
| `Super + Arrow Keys` | Change window focus. |
| `Super + Shift + S` | Take a screenshot. |
| `Print` | Take a screenshot. |

---

## 📸 Screenshot System

The repository includes a custom screenshot script designed for Wayland.

### Capture a selected area

```bash
screenshot
```

### Capture the entire screen

```bash
screenshot full
```

Screenshots are stored in:

```bash
~/Pictures/
```

Clipboard integration is provided through `wl-clipboard`.

### Dependencies

```bash
sudo pacman -S grim slurp wl-clipboard
```

---

## 🎵 Spotify & Spicetify

The environment includes Spotify integration with Spicetify for additional visual customization.

Features include:

- Spotify installation automation.
- Custom visual themes.
- Integration with the dynamic environment.
- Wayland-oriented launch configuration.

Spotify and Spicetify availability may depend on package sources and upstream updates.

---

## 🧰 Technologies & Components

| Component | Purpose |
|---|---|
| Arch Linux | Base operating system. |
| Hyprland | Wayland compositor. |
| Waybar | Custom status bar. |
| Wallust | Dynamic color generation. |
| Kitty | Terminal emulator. |
| Rofi | Application launcher and menus. |
| Zsh | Interactive shell. |
| Starship | Custom Powerline prompt. |
| Spicetify | Spotify customization. |
| SDDM | Display manager. |
| Grim | Screenshot utility. |
| Slurp | Screen region selection. |
| wl-clipboard | Clipboard integration. |

---

## 📁 Project Structure

```text
arch-hyprland-htb-dotfiles/
│
├── assets/              # Environment screenshots and visual assets
│
├── fastfetch/           # System information configuration
│
├── hypr/                # Hyprland configuration and keybindings
│
├── icons/               # Custom icons and cursor themes
│
├── kitty/               # Terminal configuration and themes
│
├── rofi/                # Application launcher and theme selector
│
├── scripts/             # Custom automation and utility scripts
│
├── sddm/                # Display manager configuration and themes
│
├── spicetify/           # Spotify customization configuration
│
├── spotify/             # Spotify integration and installation
│
├── starship/            # Custom Starship prompt
│
├── swaylock-themes/     # Screen locking themes
│
├── waybar/              # Waybar configuration, CSS and modules
│
├── zsh/                 # Zsh configuration and HTB functions
│
├── .gitignore           # Git exclusion rules
│
├── install.sh           # Automated installation script
│
└── README.md            # Project documentation
```

---

## 🔧 Customization

All configurations are organized into individual directories.

You can modify:

- Hyprland keybindings and window behavior.
- Waybar modules and appearance.
- Kitty terminal colors and settings.
- Rofi menus and themes.
- Zsh aliases and functions.
- Starship prompt appearance.
- Wallpapers and dynamic themes.

The goal is to keep the environment modular, maintainable and easy to customize.

---

## 🔄 Updating

To update your local repository:

```bash
cd ~/arch-hyprland-htb-dotfiles

git pull origin main
```

Review configuration changes before replacing your existing setup.

---

## 🤝 Contributions

Suggestions, improvements and contributions are welcome.

If you want to contribute:

1. Fork the repository.
2. Create a new branch.
3. Implement your changes.
4. Submit a Pull Request.

---

## 👨‍💻 Author

<div align="center">

### Dervi-RMX

**Linux Enthusiast | Cybersecurity | Pentesting | Arch Linux**

Building, experimenting and learning through technology.

[GitHub Profile](https://github.com/Dervi-RMX)

[Project Repository](https://github.com/Dervi-RMX/arch-hyprland-htb-dotfiles)

</div>

---

<div align="center">

**⚡ CUSTOMIZE YOUR ENVIRONMENT. MASTER YOUR WORKFLOW.**

*Built with Arch Linux, powered by Hyprland.*

</div>
