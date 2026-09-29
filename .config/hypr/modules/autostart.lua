-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function () 
  hl.exec_cmd("waybar & swaync & hypridle") -- Execute waybar, hyprpaper, firefox
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
  -- Daemons de escucha para el portapapeles de forma segura
  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")
  hl.exec_cmd("awww-daemon & sleep 0.2 && awww img /home/eduardo/wallpapers/wallpaper5.jpg &")
  hl.exec_cmd("dbus-update-activation-environment") --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
end)