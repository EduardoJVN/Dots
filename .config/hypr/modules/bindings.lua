--------------------------------------------------------------------------------
-- Atajos de Teclado (Keybinds)
--------------------------------------------------------------------------------

-- Usamos las variables globales definidas en applications.lua
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

--- 🔊 CONTROL DE HARDWARE (Multimedia y Capturas) ---
-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.0 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })


-- Capturas de pantalla rápidas vía Hyprshot --
hl.bind("PRINT" , hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind("SHIFT + PRINT" , hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind("CTRL + PRINT" , hl.dsp.exec_cmd("hyprshot -m window"))

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

local mod = MAIN_MOD

-- --- 🚀 LANZADORES DE APLICACIONES ---
hl.bind(MAIN_MOD .. " + RETURN" , hl.dsp.exec_cmd(TERMINAL))
hl.bind(MAIN_MOD .. " + E" , hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(MAIN_MOD .. " + SPACE" , hl.dsp.exec_cmd(MENU))
hl.bind(MAIN_MOD .. " + R" , hl.dsp.exec_cmd("rofi -show run"))
hl.bind(MAIN_MOD .. " + TAB" , hl.dsp.exec_cmd("rofi -show window"))
hl.bind(MAIN_MOD .. " + W + TAB" , hl.dsp.exec_cmd("rofi -show window"))


-- Apagar pantalla por software
hl.bind(MAIN_MOD .. " + ESCAPE" , hl.dsp.exec_cmd("sleep 1 && hyprctl dispatch dpms off"))


--- 🛠️ GESTIÓN DE VENTANAS Y SESIÓN ---
local closeWindowBind = hl.bind(MAIN_MOD .. " + Q", hl.dsp.window.kill())
hl.bind(MAIN_MOD .. " + M" , hl.dsp.exec_cmd("hyprlock"))
hl.bind(MAIN_MOD .. " + X" , hl.dsp.exec_cmd("hyprlock"))
hl.bind(MAIN_MOD .. " + F" , hl.dsp.window.fullscreen())
hl.bind(MAIN_MOD .. " + V",  hl.dsp.window.float({ action = "toggle" }))
-- hl.bind(MAIN_MOD .. " + V" , hl.dsp.window.centerwindow())


--- 📋 GESTOR DEL PORTAPAPELES (CLIPHIST) ---
hl.bind(MAIN_MOD .. " + P" , hl.dsp.exec_cmd('cliphist list | rofi -dmenu -p "Portapapeles" | cliphist decode | wl-copy'))
hl.bind(MAIN_MOD .. " + SHIFT + P" , hl.dsp.exec_cmd('cliphist wipe && notify-send "Portapapeles" "Historial purgado por seguridad"'))

--- 🎯 NAVEGACIÓN Y FOCO ---
hl.bind(MAIN_MOD .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(MAIN_MOD .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(MAIN_MOD .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(MAIN_MOD .. " + down",  hl.dsp.focus({ direction = "down" }))

--- 📦 ORGANIZACIÓN DE VENTANAS ---
-- hl.bind(MAIN_MOD .. " + SHIFT + left",  hl.dsp.window.move({direction = " + left"}))
-- hl.bind(MAIN_MOD .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
-- hl.bind(MAIN_MOD .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
-- hl.bind(MAIN_MOD .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))



