--------------------------------------------------------------------------------
-- Hardware, Monitores y Entorno GPU (NVIDIA)
--------------------------------------------------------------------------------

-- Configuración del monitor Ultrawide ASUS 34" a 165Hz

------------------
---- MONITORS ----
------------------
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "DP-1",
    mode     = "3440x1440@165",
    position = "0x0",
    scale    = "1",
    bitdepth = 10
})

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- hl.env("XCURSOR_SIZE", "24")
-- hl.env("HYPRCURSOR_SIZE", "24")


-- Toolkit Backend Variables
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("CLUTTER_BACKEND", "wayland")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Qt Variables
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
-- hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- NVIDIA Specifications
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
-- hl.env("__GL_VRR_ALLOWED", 0) 


hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
        vrr = 0, --   ontrols the VRR (Adaptive Sync) of your monitors. 0 - off, 1 - on, 2 - fullscreen only, 3 - fullscreen with video or game content type [0/1/2/3]
        mouse_move_enables_dpms = true,
        key_press_enables_dpms =  true
    },
    opengl = {
        nvidia_anti_flicker = true -- Esto maneja el desgarro de pantalla y sincronización con NVIDIA
    },
    cursor = {
        no_hardware_cursors = true --   Soluciona problemas de parpadeo del puntero comunes con drivers de NVIDIA
    }
})