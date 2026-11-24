-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- NEKOROSHELL / ARCH-SHELL MODULAR CONFIG (HYPRLAND LUA) --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

local terminal    = "kitty -1"
local fileManager = "kitty -e yazi"
local browser     = "/usr/bin/firefox"
local menu        = "rofi -show drun"
local mainMod     = "SUPER"

hl.monitor({ output = "Virtual-1", mode = "1920x1080@60", position = "0x0", scale = 1 })

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("LIBGL_ALWAYS_SOFTWARE", "1")

hl.on("hyprland.start", function()
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaync")
end)

hl.config({
    general = {
        gaps_in  = 6,
        gaps_out = 10,
        border_size = 2,
        col = {
            active_border   = { colors = { "rgba(c084fcff)", "rgba(f43f5eff)", "rgba(6366f1ff)" }, angle = 45 },
            inactive_border = "rgba(312e81aa)",
        },
        resize_on_border = true,
        allow_tearing    = false,
        layout           = "dwindle",
    },
    decoration = {
        rounding       = 16,
        rounding_power = 2,
        active_opacity   = 0.82,
        inactive_opacity = 0.76,
        shadow = {
            enabled      = true,
            range        = 10,
            render_power = 3,
            color        = 0xee09090b,
        },
        blur = {
            enabled  = true,
            size     = 4,
            passes   = 1,
            vibrancy = 0.25,
        },
    },
    animations = { enabled = true },
    dwindle    = { preserve_split = true },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
    },
    input = {
        kb_layout    = "us",
        follow_mouse = 1,
        sensitivity  = 0,
    },
})

hl.curve("overshot",       { type = "bezier", points = { {0.05, 0.9},  {0.1, 1.08}  } })
hl.curve("smoothOut",      { type = "bezier", points = { {0.36, 0},    {0.66, -0.56} } })
hl.curve("fluent",         { type = "bezier", points = { {0.22, 1},    {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0.0, 0.0},   {1.0, 1.0}   } })

hl.animation({ leaf = "global",      enabled = true, speed = 10,  bezier = "default" })
hl.animation({ leaf = "border",      enabled = true, speed = 8.0, bezier = "fluent" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 35,  bezier = "linear", style = "loop" })
hl.animation({ leaf = "windows",     enabled = true, speed = 5.0, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsIn",   enabled = true, speed = 4.5, bezier = "overshot", style = "popin 55%" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 4.2, bezier = "smoothOut", style = "popin 55%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 4.8, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "layersIn",    enabled = true, speed = 4.0, bezier = "overshot", style = "fade" })
hl.animation({ leaf = "layersOut",   enabled = true, speed = 3.5, bezier = "fluent", style = "fade" })
hl.animation({ leaf = "fade",        enabled = true, speed = 4.5, bezier = "fluent" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 4.5, bezier = "fluent", style = "slidefade 25%" })



-- Reglas flotantes para Kitty y Firefox (1820x990 centrado)
hl.window_rule({ match = { class = "^(firefox)$" }, opacity = "0.96 0.92" })

-- Permitir mover/redimensionar ventanas con Super + Clic y con Ctrl + Clic
hl.bind("CTRL + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind("CTRL + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Cursor único dentro de VMware (evita doble puntero con Windows)
hl.config({
    cursor = {
        no_hardware_cursors = true,
    }
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + M",      hl.dsp.exec_cmd("~/.local/bin/toggle-spotify"))
hl.bind(mainMod .. " + S",      hl.dsp.exec_cmd("~/.local/bin/toggle-spotify"))
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SPACE",  hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + H",         hl.dsp.exec_cmd("~/.local/bin/cheatsheet"))
hl.bind(mainMod .. " + F1",        hl.dsp.exec_cmd("~/.local/bin/cheatsheet"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.local/bin/reload-all"))
hl.bind(mainMod .. " + W",      hl.dsp.exec_cmd("~/.local/bin/wallpaper-picker"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.local/bin/shinobi-lock"))
hl.bind(mainMod .. " + U",         hl.dsp.exec_cmd(os.getenv("HOME") .. "/.local/bin/shinobi-lock"))
hl.bind(mainMod .. " + N",      hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J",      hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd('grim -g "$(slurp)" - | wl-copy'))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })

-- Atajos adicionales de productividad y capturas
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.resize({ x = -30, y = 0 }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 30, y = 0 }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.resize({ x = 0, y = -30 }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.resize({ x = 0, y = 30 }))
hl.bind("SHIFT + Print",              hl.dsp.exec_cmd("mkdir -p ~/Pictures/Screenshots && grim ~/Pictures/Screenshots/shot-$(date +%Y%m%d-%H%M%S).png && notify-send \"Captura\" \"Guardada en ~/Pictures/Screenshots\""))

-- Mover / intercambiar ventanas de puesto
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.swap({ direction = "down" }))



