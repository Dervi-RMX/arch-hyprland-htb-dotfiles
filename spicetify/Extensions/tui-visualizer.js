(function tuiCharacterVisualizer() {
    const BAR_COUNT = 22;
    let wrapper = null;
    let mascotEl = null;
    let eqBars = [];
    let targetHeights = new Array(BAR_COUNT).fill(22);
    let currentHeights = new Array(BAR_COUNT).fill(22);
    let frameTick = 0;

    // Rastreo real del tiempo de reproduccion en el DOM (0:48 / 3:18)
    let lastTimeText = "";
    let lastTimeChangeMs = 0;

    const DANCE_FRAMES = [
        [
            "     .-----.     ",
            "  =[  o _ o  ]=  ",
            "    /|_____|\\    ",
            "   / |=====| \\   ",
            "     /     \\     "
        ],
        [
            "    \\.-----./    ",
            "  =[  ^ ‿ ^  ]=  ",
            "   \\ |_____| /   ",
            "    \\|=====|/    ",
            "    _/     \\_    "
        ],
        [
            "     .-----.     ",
            "  =[  ▀ _ ▀  ]=  ",
            "  ---|_____|---  ",
            "     |=====|     ",
            "     |     |     "
        ],
        [
            "    /.-----.\\    ",
            "  =[  ◕ ‿ ◕  ]=  ",
            "    /|_____|\\    ",
            "   / |=====| \\   ",
            "    _/     \\_    "
        ]
    ];

    const IDLE_FRAME = [
        "     .-----.     ",
        "  =[  - _ -  ]=  ",
        "    /|_____|\\    ",
        "     |=====|     ",
        "     |     |     "
    ];

    function detectThemeTag() {
        const accent = getComputedStyle(document.documentElement)
            .getPropertyValue("--spice-accent")
            .trim()
            .toLowerCase();
        if (accent.includes("38bdf8")) return "KING // VIBE";
        if (accent.includes("ef4444")) return "DEMON // RAGE";
        if (accent.includes("14b8a6") || accent.includes("2dd4bf")) return "KIMETSU // FLOW";
        if (accent.includes("f59e0b")) return "ZENITSU // THUNDER";
        return "MINATO // FLASH";
    }

    function detectPlaybackActive() {
        const now = performance.now();

        // 1. Revisar APIs de Spicetify si estan disponibles
        const p = (typeof Spicetify !== "undefined" && Spicetify.Player) || window.Spicetify?.Player;
        if (p) {
            if (typeof p.isPlaying === "function" && p.isPlaying()) return true;
            if (p.data && p.data.isPaused === false) return true;
        }

        // 2. Revisar si el reloj de reproduccion (ej. "0:48") esta avanzando en pantalla
        const timeEl = document.querySelector('[data-testid="playback-position"]');
        if (timeEl) {
            const txt = timeEl.textContent.trim();
            if (txt && txt !== lastTimeText) {
                lastTimeText = txt;
                lastTimeChangeMs = now;
            }
            if (now - lastTimeChangeMs < 1500) {
                return true;
            }
        }

        return false;
    }

    function injectStyles() {
        if (document.getElementById("tui-mascot-style")) return;
        const style = document.createElement("style");
        style.id = "tui-mascot-style";
        style.textContent = `
            #tui-mascot-box {
                position: fixed !important;
                left: 18px !important;
                bottom: 112px !important;
                width: 245px !important;
                padding: 16px 10px 10px 10px !important;
                border: 1.5px solid var(--spice-border-active, var(--spice-accent, #facc15)) !important;
                background: rgba(5, 8, 15, 0.92) !important;
                box-shadow: 0 0 14px rgba(var(--spice-rgb-accent, 250, 204, 21), 0.35) !important;
                display: flex !important;
                flex-direction: column !important;
                align-items: center !important;
                justify-content: center !important;
                box-sizing: border-box !important;
                z-index: 999999 !important;
                pointer-events: none !important;
                overflow: hidden !important;
                transition: transform 0.06s ease, box-shadow 0.12s ease, border-color 0.25s ease !important;
            }
            #tui-mascot-box.bass-hit {
                transform: scale(1.04) translateY(-3px) !important;
                box-shadow: 0 0 24px var(--spice-accent, #facc15) !important;
                border-color: var(--spice-accent, #facc15) !important;
            }
            #tui-mascot-header {
                position: absolute !important;
                top: 4px !important;
                left: 8px !important;
                font-family: 'JetBrainsMono Nerd Font', monospace !important;
                font-size: 10px !important;
                font-weight: 800 !important;
                letter-spacing: 0.8px !important;
                color: var(--spice-accent, #facc15) !important;
                text-transform: uppercase !important;
            }
            #tui-mascot-art {
                margin: 6px 0 8px 0 !important;
                font-family: 'JetBrainsMono Nerd Font', monospace !important;
                font-size: 13px !important;
                line-height: 1.18 !important;
                font-weight: 900 !important;
                color: var(--spice-text, #ffffff) !important;
                text-shadow: 0 0 8px var(--spice-accent, #facc15) !important;
                white-space: pre !important;
                text-align: center !important;
                transition: color 0.2s ease !important;
            }
            #tui-mascot-box.bass-hit #tui-mascot-art {
                color: var(--spice-accent, #facc15) !important;
            }
            #tui-mascot-eq {
                display: flex !important;
                align-items: flex-end !important;
                justify-content: space-between !important;
                gap: 2.5px !important;
                width: 100% !important;
                height: 34px !important;
                padding-top: 5px !important;
                border-top: 1px dashed var(--spice-border-inactive, #555) !important;
            }
            .tui-eq-bar {
                flex: 1 !important;
                min-height: 4px !important;
                height: 18%;
                background: linear-gradient(to top, var(--spice-border-active, #facc15), var(--spice-accent, #ffffff)) !important;
                transition: height 0.04s linear, background 0.25s ease !important;
            }
        `;
        document.head.appendChild(style);
    }

    function mountMascot() {
        if (!document.body) {
            setTimeout(mountMascot, 200);
            return;
        }
        if (document.getElementById("tui-mascot-box")) return;

        wrapper = document.createElement("div");
        wrapper.id = "tui-mascot-box";

        const header = document.createElement("div");
        header.id = "tui-mascot-header";
        header.textContent = detectThemeTag();

        mascotEl = document.createElement("pre");
        mascotEl.id = "tui-mascot-art";
        mascotEl.textContent = IDLE_FRAME.join("\n");

        const eqContainer = document.createElement("div");
        eqContainer.id = "tui-mascot-eq";

        eqBars = [];
        for (let i = 0; i < BAR_COUNT; i++) {
            const bar = document.createElement("div");
            bar.className = "tui-eq-bar";
            eqContainer.appendChild(bar);
            eqBars.push(bar);
        }

        wrapper.appendChild(header);
        wrapper.appendChild(mascotEl);
        wrapper.appendChild(eqContainer);
        document.body.appendChild(wrapper);
    }

    function hookAudioData() {
        const p = (typeof Spicetify !== "undefined" && Spicetify.Player) || window.Spicetify?.Player;
        if (p?.addOnAudioData) {
            p.addOnAudioData((data) => {
                const seg = data?.segments?.[0];
                if (seg && Array.isArray(seg.pitches)) {
                    const loudness = Math.max(0.25, Math.min(1, (seg.loudness_max + 40) / 40));
                    for (let i = 0; i < BAR_COUNT; i++) {
                        const pitchVal = seg.pitches[i % seg.pitches.length] || 0.35;
                        const wave = Math.sin(((i + 1) / (BAR_COUNT + 1)) * Math.PI);
                        targetHeights[i] = Math.max(18, Math.min(100, (pitchVal * 0.75 + loudness * 0.65) * wave * 130));
                    }
                }
            });
        } else {
            setTimeout(hookAudioData, 500);
        }
    }

    function renderLoop() {
        if (!document.getElementById("tui-mascot-box")) {
            mountMascot();
        }

        // Encajar exactamente dentro del panel izquierdo sin salirse ni tapar "Playing"
        if (wrapper) {
            const nav = document.querySelector(".Root__nav-bar");
            const navW = nav ? nav.getBoundingClientRect().width : 275;
            const boxW = Math.max(185, Math.min(255, Math.floor(navW - 22)));
            wrapper.style.width = `${boxW}px`;
            wrapper.style.left = "18px";
            wrapper.style.bottom = "112px";
        }

        const isPlaying = detectPlaybackActive();
        const now = performance.now();
        const t = now * 0.014;
        let bassSum = 0;

        for (let i = 0; i < BAR_COUNT; i++) {
            if (isPlaying) {
                const pulse = (Math.sin(t + i * 0.7) + 1) * 28 + (Math.cos(t * 2.1 - i * 0.5) + 1) * 24;
                const goal = Math.max(targetHeights[i] * 0.9, pulse);
                currentHeights[i] += (goal - currentHeights[i]) * 0.45;
                targetHeights[i] *= 0.86;
            } else {
                currentHeights[i] += (14 - currentHeights[i]) * 0.2;
            }

            if (i < 5) bassSum += currentHeights[i];
            if (eqBars[i]) {
                eqBars[i].style.height = `${Math.round(currentHeights[i])}%`;
            }
        }

        if (wrapper && mascotEl) {
            const header = document.getElementById("tui-mascot-header");
            if (header) header.textContent = detectThemeTag();

            if (isPlaying) {
                const isBassHit = (bassSum / 5) > 52;
                if (isBassHit) {
                    wrapper.classList.add("bass-hit");
                } else {
                    wrapper.classList.remove("bass-hit");
                }

                const speedDiv = isBassHit ? 120 : 190;
                const idx = Math.floor(now / speedDiv) % DANCE_FRAMES.length;
                if (idx !== frameTick) {
                    frameTick = idx;
                    mascotEl.textContent = DANCE_FRAMES[idx].join("\n");
                }
            } else {
                wrapper.classList.remove("bass-hit");
                mascotEl.textContent = IDLE_FRAME.join("\n");
            }
        }

        requestAnimationFrame(renderLoop);
    }

    injectStyles();
    mountMascot();
    hookAudioData();
    renderLoop();
})();


(function enforceAllPlayButtons() {
    function patchButtons() {
        const buttons = document.querySelectorAll('[data-testid="play-button"], [data-testid="control-button-playpause"]');
        buttons.forEach((btn) => {
            // Ignorar botones pequenos dentro de filas de canciones
            if (btn.closest('.main-trackList-trackListRow')) return;

            const isBottomBar = Boolean(btn.closest('.Root__now-playing-bar') || btn.matches('[data-testid="control-button-playpause"]'));
            const label = (btn.getAttribute("aria-label") || "").toLowerCase();
            const isPausedState = label.includes("pause") || label.includes("pausar");
            const symbol = isPausedState ? "⏸" : "▶";

            const size = isBottomBar ? "28px" : "42px";
            const fontSize = isBottomBar ? "13px" : "18px";
            const border = isBottomBar ? "1.5px solid var(--spice-text, #ffffff)" : "2px solid var(--spice-text, #ffffff)";

            btn.style.setProperty("background", "var(--spice-accent, #facc15)", "important");
            btn.style.setProperty("background-color", "var(--spice-accent, #facc15)", "important");
            btn.style.setProperty("color", "var(--spice-main, #0a0a0a)", "important");
            btn.style.setProperty("border", border, "important");
            btn.style.setProperty("border-radius", "0px", "important");
            btn.style.setProperty("width", size, "important");
            btn.style.setProperty("height", size, "important");
            btn.style.setProperty("min-width", size, "important");
            btn.style.setProperty("min-height", size, "important");
            btn.style.setProperty("margin", "0 6px", "important");
            btn.style.setProperty("display", "inline-flex", "important");
            btn.style.setProperty("align-items", "center", "important");
            btn.style.setProperty("justify-content", "center", "important");
            btn.style.setProperty("vertical-align", "middle", "important");
            btn.style.setProperty("opacity", "1", "important");
            btn.style.setProperty("visibility", "visible", "important");

            let badge = btn.querySelector(".tui-play-glyph");
            if (!badge) {
                btn.querySelectorAll("span, svg").forEach((el) => {
                    el.style.setProperty("display", "none", "important");
                });
                badge = document.createElement("span");
                badge.className = "tui-play-glyph";
                badge.style.setProperty("font-family", "'JetBrainsMono Nerd Font', monospace", "important");
                badge.style.setProperty("font-weight", "900", "important");
                badge.style.setProperty("line-height", "1", "important");
                badge.style.setProperty("color", "var(--spice-main, #0a0a0a)", "important");
                badge.style.setProperty("pointer-events", "none", "important");
                btn.appendChild(badge);
            }
            badge.style.setProperty("font-size", fontSize, "important");
            if (badge.textContent !== symbol) {
                badge.textContent = symbol;
            }
        });
    }

    setInterval(patchButtons, 250);
    patchButtons();
})();
