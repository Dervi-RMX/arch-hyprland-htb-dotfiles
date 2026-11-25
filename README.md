# PROMPT COMPLETO — README PROFESIONAL DE SHINOBI-HYPR

Actúa como un **desarrollador senior de Arch Linux, especialista en Hyprland, Linux customization, automatización, documentación técnica y diseño de repositorios profesionales en GitHub**.

Quiero que trabajes directamente en el repositorio que tengo abierto y crees o actualices su archivo `README.md`.

El proyecto se llama **SHINOBI-HYPR**.

Tu objetivo es crear un README profesional, moderno, visualmente atractivo, completo y bien organizado, que explique claramente qué es el proyecto, qué herramientas utiliza, qué funcionalidades ofrece y cómo cualquier usuario puede instalarlo y utilizarlo.

---

## 1. Identidad del proyecto

**Nombre:** SHINOBI-HYPR

**Descripción principal:**

SHINOBI-HYPR es un entorno personalizado basado en Arch Linux y Hyprland, diseñado para combinar productividad, automatización, personalización visual y herramientas orientadas a la ciberseguridad.

No es solamente una configuración visual. Es un ecosistema integrado que reúne herramientas, scripts, paneles, automatizaciones y configuraciones para ofrecer una experiencia Linux completa.

**Tecnologías principales:**
- Arch Linux
- Hyprland
- Wayland
- Eww
- Waybar
- Wallust
- Kitty
- Rofi
- Zsh
- Starship
- Fastfetch
- SwayNC
- Wlogout
- Spicetify
- SDDM

---

## 2. Diseño visual del README

Quiero una presentación profesional con estética tecnológica y temática SHINOBI.

Utiliza:
- Encabezados claros y jerarquizados.
- Emojis moderados para identificar secciones.
- Insignias de tecnologías.
- Tablas organizadas.
- Bloques de código correctamente formateados.
- Imágenes de demostración.
- Separadores entre secciones.
- Enlaces funcionales.
- Una presentación visual coherente.

El README debe verse bien tanto en GitHub como en dispositivos móviles.

No utilices párrafos excesivamente largos ni repitas información innecesariamente.

**Importante:**
- No incluyas insignias de Open Source.
- No menciones que el proyecto es de código abierto.
- No agregues secciones de Contribuciones.
- No agregues secciones de Créditos.
- No inventes funcionalidades que no existan en el repositorio.

---

## 3. Encabezado principal

Utiliza una presentación similar a esta:

# 🥷 SHINOBI-HYPR

### ARCH LINUX · HYPRLAND · CYBERSECURITY ENVIRONMENT

Un ecosistema personalizado de Arch Linux diseñado para productividad, automatización, personalización y ciberseguridad.

Incluye insignias para:
- Arch Linux
- Hyprland
- Wayland
- Eww Dashboard
- Hack The Box

Utiliza las imágenes existentes del proyecto:

- `assets/preview2.png`
- `assets/preview3.png`

No inventes rutas de imágenes. Comprueba que existan antes de utilizarlas.

---

## 4. Descripción del proyecto

Explica que SHINOBI-HYPR reúne un entorno de escritorio personalizado con diferentes componentes integrados.

Describe sus objetivos:

- Ofrecer una experiencia visual moderna.
- Facilitar el trabajo diario en Linux.
- Integrar herramientas de productividad.
- Automatizar tareas frecuentes.
- Facilitar el uso de herramientas de ciberseguridad.
- Proporcionar información del sistema en tiempo real.
- Permitir cambiar la apariencia mediante diferentes temas.

Deja claro que el proyecto está orientado tanto al uso diario como al aprendizaje y práctica de ciberseguridad.

---

## 5. Características principales

Organiza las funcionalidades en una tabla o lista visual.

Incluye únicamente las características que realmente existan en el proyecto:

### Entorno de escritorio
- Hyprland como compositor Wayland.
- Configuración personalizada de ventanas.
- Atajos de teclado.
- Gestión de espacios de trabajo.
- Integración con aplicaciones del sistema.

### Shinobi Dashboard
- Panel desarrollado con Eww.
- Información del sistema.
- Reloj y calendario.
- Monitorización de CPU y RAM.
- Controles multimedia.
- Integración con MPRIS.
- Secciones Dashboard, Media, Performance y Weather.
- Cierre automático al hacer clic fuera del panel.

### Waybar Dual
- Barra horizontal superior.
- Barra lateral vertical.
- Información del sistema.
- Estado de conexión VPN.
- Dirección IP local.
- Objetivo activo de Hack The Box.

### Personalización visual
- Seis temas visuales.
- Wallpapers personalizados.
- Colores dinámicos mediante Wallust.
- Sincronización de colores entre aplicaciones.
- Cursores Bibata y Capitaine.

### Herramientas adicionales
- Kitty.
- Rofi.
- SwayNC.
- Wlogout.
- Zsh.
- Starship.
- Fastfetch.
- Spicetify.
- Spotify.
- SDDM.
- Swaylock.
- Scripts personalizados.

---

## 6. Sistema de temas

Crea una sección dedicada a explicar el sistema de personalización.

El proyecto incluye seis temas visuales:

- King
- Minato
- Zenitsu
- Demon
- Kimetsu
- Goku

Explica que los temas permiten personalizar la apariencia del entorno y que Wallust ayuda a sincronizar los colores entre los componentes compatibles.

Incluye el atajo:

`Super + W`

Este atajo permite abrir el selector de temas.

No inventes nombres adicionales ni funcionalidades de cambio automático que no estén implementadas.

---

## 7. Shinobi Dashboard

Crea una sección completa dedicada al Dashboard.

Explica que utiliza Eww y que centraliza diferentes elementos del sistema.

Incluye sus apartados:

| Apartado | Función |
|---|---|
| Dashboard | Información general |
| Media | Controles multimedia |
| Performance | Rendimiento del sistema |
| Weather | Información meteorológica |

Incluye:
- Reloj.
- Calendario.
- CPU.
- RAM.
- Controles de audio.
- Integración MPRIS.
- Cierre al hacer clic fuera.

Atajos:

- `Super + Z`
- `Alt + Z`
- Clic en el icono de Arch.

Comprueba que estos atajos estén presentes en la configuración antes de documentarlos como definitivos.

---

## 8. Waybar Dual

Explica que el entorno cuenta con dos presentaciones de Waybar:

- Horizontal.
- Vertical.

Incluye el atajo:

`Super + B`

Documenta los indicadores disponibles:

- Información del sistema.
- Estado de VPN.
- Dirección IP local.
- Objetivo activo de Hack The Box.

---

## 9. Integración con Hack The Box

Esta sección es especialmente importante.

Explica que SHINOBI-HYPR incorpora funciones para facilitar el trabajo durante laboratorios de pentesting y máquinas de Hack The Box.

Documenta los comandos disponibles, verificándolos en los scripts reales del repositorio.

Ejemplos de uso:

```bash
settarget 10.10.11.100
```

```bash
settarget 10.10.11.100 MACHINE
```

```bash
settarget
```

```bash
cleartarget
```

Explica que permiten gestionar el objetivo activo y mostrar información relacionada con la máquina en los componentes compatibles del entorno.

Documenta también cómo consultar la interfaz VPN:

```bash
ip addr show tun0
```

```bash
ip -br addr
```

No afirmes que el proyecto establece conexiones VPN automáticamente si no existe esa funcionalidad.

---

## 10. Ecosistema tecnológico

Crea una tabla con las herramientas utilizadas y su función.

Incluye:

| Herramienta | Función |
|---|---|
| Arch Linux | Sistema operativo |
| Hyprland | Compositor Wayland |
| Eww | Dashboard |
| Waybar | Panel del sistema |
| Wallust | Colores dinámicos |
| Kitty | Terminal |
| Rofi | Lanzador de aplicaciones |
| SwayNC | Notificaciones |
| Wlogout | Menú de salida |
| Zsh | Shell |
| Starship | Prompt |
| Fastfetch | Información del sistema |
| SDDM | Gestor de inicio de sesión |
| Swaylock | Bloqueo de pantalla |
| Spicetify | Personalización de Spotify |
| Spotify | Reproductor multimedia |
| Bibata / Capitaine | Cursores |

---

## 11. Atajos de teclado

Crea una tabla organizada de atajos.

Incluye los siguientes:

| Atajo | Acción |
|---|---|
| Super + Z | Abrir Dashboard |
| Alt + Z | Abrir Dashboard alternativo |
| Super + B | Cambiar Waybar |
| Super + W | Selector de temas |
| Super + Return | Abrir Kitty |
| Super + E | Abrir Yazi |
| Super + Q | Cerrar ventana |
| Super + L | Bloquear pantalla |
| Super + Shift + S | Captura de pantalla |
| Super + 1–9 | Cambiar espacio de trabajo |

Comprueba cada atajo en la configuración real de Hyprland.

Si alguno no coincide, documenta el valor real encontrado en los archivos.

---

## 12. Requisitos de instalación

Documenta los requisitos:

- Arch Linux.
- Conexión a Internet.
- Usuario normal con permisos sudo.
- Git.
- Curl.

Aclara que el proyecto está diseñado principalmente para Arch Linux y que no se garantiza compatibilidad con otras distribuciones.

---

## 13. Instalación

Crea una guía paso a paso que sea fácil de seguir.

### Instalación rápida

Incluye el siguiente comando:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Dervi-RMX/shinobi-hypr/main/install.sh)
```

### Instalación manual

```bash
sudo pacman -S --needed git curl
```

```bash
git clone https://github.com/Dervi-RMX/shinobi-hypr.git
```

```bash
cd shinobi-hypr
```

Antes de ejecutar el instalador, recomienda inspeccionarlo:

```bash
less install.sh
```

Validar su sintaxis:

```bash
bash -n install.sh
```

Dar permisos y ejecutar:

```bash
chmod +x install.sh
./install.sh
```

Finalmente, reiniciar el equipo si el instalador lo requiere.

### Advertencias importantes

Incluye recomendaciones:

- Realizar una copia de seguridad de las configuraciones actuales.
- Revisar los paquetes que instalará el script.
- Comprobar los cambios relacionados con SDDM y Zsh.
- Ejecutar el instalador desde un usuario normal con permisos sudo.
- No ejecutar el instalador como root.
- Revisar cualquier modificación antes de sobrescribir configuraciones existentes.

No afirmes que la instalación es completamente reversible o libre de riesgos si no está implementado.

---

## 14. Estructura del repositorio

Inspecciona el repositorio y documenta su estructura real.

Como referencia, contempla directorios como:

```text
shinobi-hypr/
├── assets/
├── eww/
├── fastfetch/
├── hypr/
├── icons/
├── kitty/
├── rofi/
├── scripts/
├── sddm/
├── spicetify/
├── spotify/
├── starship/
├── swaylock-themes/
├── swaync/
├── waybar/
├── wlogout/
├── zsh/
├── .gitignore
├── README.md
└── install.sh
```

Comprueba los nombres reales y no agregues carpetas que no existan.

Añade una breve explicación de la función de cada directorio.

---

## 15. Personalización

Incluye una sección explicando dónde se pueden modificar los principales componentes.

Por ejemplo:

- Configuración de Hyprland.
- Configuración de Waybar.
- Configuración de Eww.
- Configuración de Kitty.
- Configuración de Rofi.
- Configuración de Zsh.
- Temas visuales.
- Wallpapers.
- Iconos y cursores.
- Scripts.

Utiliza las rutas reales del repositorio.

---

## 16. Solución de problemas

Crea una sección práctica con problemas frecuentes y comandos para diagnosticarlos.

### Hyprland

```bash
pacman -Q hyprland
```

### SDDM

```bash
systemctl status sddm
```

### Waybar

```bash
waybar
```

### Eww

```bash
command -v eww
```

```bash
pgrep -a eww
```

### VPN

```bash
ip -br addr
```

### Portapapeles

```bash
sudo pacman -S --needed wl-clipboard
```

### Capturas de pantalla

```bash
sudo pacman -S --needed grim slurp
```

Explica brevemente para qué sirve cada comprobación o instalación.

---

## 17. Actualización del entorno

Incluye una sección para actualizar el repositorio:

```bash
cd ~/shinobi-hypr
git pull origin main
```

Aclara que descargar cambios del repositorio no significa que todas las configuraciones locales se actualicen automáticamente.

Recomienda revisar los cambios antes de sobrescribir configuraciones existentes o volver a ejecutar el instalador.

---

## 18. Cierre visual

El README debe finalizar con un bloque centrado, elegante y coherente con la identidad del proyecto.

Utiliza:

# 🥷 SHINOBI-HYPR

### BUILT FOR LINUX. CONFIGURED FOR PRODUCTIVITY.

**ARCH LINUX · HYPRLAND · AUTOMATION · CYBERSECURITY**

Incluye insignias para:

- GitHub del desarrollador: `https://github.com/Dervi-RMX`
- Repositorio: `https://github.com/Dervi-RMX/shinobi-hypr`

Termina con:

**Made with passion for Linux and cybersecurity.**

No agregues ninguna sección después de este bloque.

---

## 19. Reglas obligatorias de trabajo

Antes de escribir el README:

1. Inspecciona el repositorio completo.
2. Comprueba los directorios y archivos existentes.
3. Revisa el instalador `install.sh`.
4. Comprueba los comandos personalizados.
5. Verifica los atajos de Hyprland.
6. Comprueba las imágenes disponibles.
7. No inventes funciones, comandos ni rutas.
8. No elimines archivos ni modifiques configuraciones del sistema.
9. No alteres el funcionamiento del proyecto.
10. Trabaja únicamente en la documentación solicitada.

Si encuentras diferencias entre esta descripción y el código real, utiliza la información del código real.

## 20. Resultado esperado

Quiero un `README.md` completo, profesional y listo para publicarse en GitHub.

Debe permitir que una persona que nunca ha utilizado SHINOBI-HYPR pueda:

- Entender qué es el proyecto.
- Conocer sus funcionalidades.
- Identificar las herramientas utilizadas.
- Comprender los atajos.
- Instalar el entorno.
- Personalizarlo.
- Utilizar sus funciones de Hack The Box.
- Solucionar problemas básicos.
- Actualizar su instalación.

**No entregues un README básico o resumido. Quiero documentación completa, bien estructurada y visualmente atractiva.**

**RESTRICCIONES FINALES:**

- No incluir sección de Contribuciones.
- No incluir sección de Créditos.
- No incluir insignias Open Source.
- No mencionar código abierto.
- No inventar características.
- No dejar secciones vacías.
- No repetir información.
- No modificar archivos fuera de `README.md`.

Al terminar, muestra el contenido final del README y un resumen breve de los cambios realizados.
