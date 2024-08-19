return {
    mod = "super",
    terminal = "kitty",
    bar = "ags",
    lock = "hyprlock",
    runner = "anyrun",
    browser = "firefox-nightly",
    tags = {
        { key = "&" },
        { key = "é" },
        { key = '"' },
        { key = "'" },
        { key = "(" },
        { key = "-" },
        { key = "è" },
        { key = "_" },
        { key = "ç" },
        { key = "à" },
    },
    libinput = {
        tap = true,
        natural_scroll = true,
        click_method = "click_finger"
    },
    env = {
        XCURSOR_SIZE = "24",
        QT_QPA_PLATFORMTHEME = "qt5ct",
        GTK_THEME = "Adwaita:dark",
        GTK2_RC_FILES = "/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc",
        QT_STYLE_OVERRIDE = "kvantum",
        MOZ_ENABLE_WAYLAND = "1",
        HYPRCURSOR_THEME = "catppuccin-mocha-lavender",
    }
}
