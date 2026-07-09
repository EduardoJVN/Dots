----------------
----  MISC  ----
----------------

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