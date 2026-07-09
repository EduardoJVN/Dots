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


-- Parámetros críticos para el driver propietario de NVIDIA
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")


hl.config({
    misc = {
        -- VRR desactivado por variaciones de brillo en escritorio
        vrr = 2,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    },
    opengl = {
        nvidia_anti_flicker = true,
    },
    cursor = {
        no_hardware_cursors = true,
    }
})