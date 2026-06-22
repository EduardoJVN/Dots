local wezterm = require("wezterm")
local config = wezterm.config_builder() -- Generador de configuración moderno

-- =============================================================================
-- 1. TIPOGRAFÍA Y FUENTES
-- =============================================================================
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 14.0

-- =============================================================================
-- 2. ESTÉTICA Y RENDERIZADO VISUAL
-- =============================================================================
config.window_background_opacity = 0.50          -- 50% Transparente (Aprovecha el blur de Hyprland)
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 } -- Pequeño colchón interno para el código
config.initial_cols = 150
config.initial_rows = 40
config.window_decorations = "NONE"               -- Elimina barras de título nativas

-- =============================================================================
-- 3. RENDIMIENTO EXTREMO (Aprovechamiento de Hardware)
-- =============================================================================
config.max_fps = 240                             -- Sincroniza sobre el techo de tus 165Hz
config.term = "wezterm"
config.enable_kitty_graphics = true              -- Soporte nativo para previsualizar imágenes en terminal
config.animation_fps = 120                       -- Suavizado de transiciones del cursor

-- =============================================================================
-- 4. CURSOR (Estilo Minimalista/Desarrollo)
-- =============================================================================
config.default_cursor_style = "SteadyBar"        -- Barra fina vertical, ideal para picar código
config.cursor_blink_rate = 500

-- =============================================================================
-- 5. PALETA DE COLORES (Estilo Gentleman Modificado)
-- =============================================================================
config.colors = {
    foreground = "#f3f6f9",
    background = "#06080f",                     -- Negro profundo
    cursor_bg = "#e0c15a",                       -- Dorado Jarvis
    cursor_fg = "#06080f",
    selection_bg = "#263356",                    -- Contraste de selección azulado
    ansi = { "#06080f", "#cb7c94", "#b7cc85", "#ffe066", "#7fb4ca", "#ff8dd7", "#7aa89f", "#f3f6f9" },
    brights = { "#8a8fa3", "#de8fa8", "#d1e8a9", "#fff7b1", "#a3d4d5", "#ffaeea", "#7fb4ca", "#f3f6f9" },
}

-- =============================================================================
-- 6. INTERFACES DE ENTRADA Y SHORTCUTS (Multiplexor de Paneles)
-- =============================================================================
config.use_dead_keys = true                      -- Mantiene el soporte nativo para acentos en español

config.keys = {
  -- Dividir panel horizontalmente (Lado a lado) con ALT + H
  { key = 'h', mods = 'ALT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  
  -- Dividir panel verticalmente (Arriba y abajo) con ALT + V
  { key = 'v', mods = 'ALT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
  
  -- Cerrar el panel enfocado con ALT + W (Pide confirmación si hay procesos activos)
  { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true } },

  -- Moverse entre paneles usando ALT + Flechas Direccionales
  { key = 'LeftArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },

  -- Opcional (Comentado): Moverse entre paneles usando la fila Vim (ALT + H,J,K,L)
  -- Descómentalo si querés unificar la transición con las teclas de Hyprland
  -- { key = 'h', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  -- { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  -- { key = 'k', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  -- { key = 'j', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
}

-- =============================================================================
-- 7. PESTAÑAS (Desactivadas para maximalizar el espacio de código limpio)
-- =============================================================================
config.enable_tab_bar = false

return config