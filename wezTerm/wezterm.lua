local wezterm = require("wezterm")
local config = wezterm.config_builder() -- Usamos el builder moderno

-- 1. FONT (Descomenta esto después de instalar la Nerd Font)
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 14.0

-- 2. WINDOW & ESTHETICS (Optimizado para KDE Plasma)
config.window_background_opacity = 0.50
config.macos_window_background_blur = 30 -- En KDE con Wayland esto ayuda al desenfoque
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.initial_cols = 150
config.initial_rows = 40
config.window_decorations = "NONE"
-- config.start_as = "Normal"
-- config.window_decorations = "RESIZE" -- Look ultra limpio sin barra de título

-- 3. PERFORMANCE (Aprovechando tu GPU/CPU)
config.max_fps = 240
config.term = "wezterm"
config.enable_kitty_graphics = true
config.animation_fps = 120 -- Animaciones fluidas para el cursor

-- 4. CURSOR (Estilo Jarvis)
config.default_cursor_style = "SteadyBar" -- Una barra fina es más moderna para desarrollo web
config.cursor_blink_rate = 500

-- 5. COLORES (Manteniendo tu estilo Gentleman pero con retoques)
config.colors = {
    foreground = "#f3f6f9",
    background = "#06080f", -- Negro profundo
    cursor_bg = "#e0c15a",
    cursor_fg = "#06080f",
    selection_bg = "#263356",
    ansi = { "#06080f", "#cb7c94", "#b7cc85", "#ffe066", "#7fb4ca", "#ff8dd7", "#7aa89f", "#f3f6f9" },
    brights = { "#8a8fa3", "#de8fa8", "#d1e8a9", "#fff7b1", "#a3d4d5", "#ffaeea", "#7fb4ca", "#f3f6f9" },
}

-- 6. INPUT
config.use_dead_keys = true

config.keys = {
  -- Dividir horizontalmente (una al lado de la otra) con ALT + h
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Dividir verticalmente (una arriba y otra abajo) con ALT + v
  {
    key = 'v',
    mods = 'ALT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Cerrar el panel actual con ALT + w
  {
    key = 'w',
    mods = 'ALT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Moverse entre paneles usando ALT + flechas
  { key = 'LeftArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
}


-- Función para formatear la barra de estado
wezterm.on('update-status', function(window, pane)
  -- Formateamos la hora y fecha
  local date = wezterm.strftime('%H:%M  %d-%b')

  -- Construimos la barra con segmentos de colores
  window:set_right_status(wezterm.format({
    -- Segmento 1: Usuario/PC (Color Cian de tu tema)
    { Foreground = { Color = '#7aa89f' } },
    { Text = '   ' .. wezterm.hostname() .. '  ' },
    
    -- Segmento 2: Fecha (Color Amarillo de tu tema)
    { Foreground = { Color = '#e0c15a' } },
    { Text = '  󰃭  ' .. date .. '  ' },

    -- Segmento 3: Indica si el Bloq Mayús está activo (Útil para programar)
    { Foreground = { Color = '#cb7c94' } },
    { Text = '  ' .. (window:get_dimensions().is_full_screen and '󰊓 ' or '') .. ' ' },
  }
))
end)

-- Forzamos a que la barra esté siempre visible, aunque haya una sola pestaña
config.hide_tab_bar_if_only_one_tab = false

-- La ponemos abajo para que se sienta como tmux
config.tab_bar_at_bottom = false

-- Usamos la barra simple (retro) que es mucho más personalizable
config.use_fancy_tab_bar = false

-- muestra el tab
config.show_tabs_in_tab_bar = false

config.enable_tab_bar = false

return config
