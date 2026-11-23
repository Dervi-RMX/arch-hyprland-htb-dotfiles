---
tags: [archlinux, hyprland, waybar, starship, hackthebox, rice]
date: 2026-11-18
---

# Arch Linux + Hyprland + Waybar (Pentesting & HTB Edition)

Entorno de escritorio sobre **Arch Linux** y **Hyprland**, configurado con **Wallust**, prompt Powerline en **Starship** y módulos dinámicos en **Waybar** para monitoreo de VPN (`tun0`) y objetivos de **Hack The Box** (`settarget`).

## Estructura
- `starship/starship.toml`: Prompt Powerline en bloques oscuros con glifos Nerd Font.
- `waybar/config.jsonc` y `waybar/style.css`: Cápsulas flotantes translúcidas adaptadas a `colors-wallust.css`.
- `waybar/scripts/htb-vpn.sh`: Detecta IP de `tun0` y copia al portapapeles con clic.
- `waybar/scripts/htb-target.sh`: Muestra el objetivo activo de `~/.cache/htb_target` y copia IP con clic.
- `zsh/htb-functions.zsh`: Comandos `settarget <IP> [Nombre]`, `set target <IP> [Nombre]` y `cleartarget`.

## Instalación
```bash
git clone https://github.com/TU_USUARIO/shinobi-hypr.git
cd shinobi-hypr
./install.sh
```

### Atajos adicionales
| Atajo | Acción |
| :--- | :--- |
| `Super + Shift + [1-9]` | Mover la ventana activa al escritorio (workspace) correspondiente y enfocarlo |
