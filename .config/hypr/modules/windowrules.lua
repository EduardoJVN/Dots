hl.window_rule({
    name = "pavucontrol-floating-setup",
    match = {
        class = "^(org\\.pulseaudio\\.pavucontrol)$"
    },
    float = true,
    size = { "600", "400" },
    move = { "monitor_w * 0.65", "monitor_h * 0.05" } -- Usando variables del monitor local si querés afinar el %
})