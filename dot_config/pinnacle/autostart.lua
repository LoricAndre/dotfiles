local opts = require("opts")
return {
    setup = function (Pinnacle)
        local spawn = Pinnacle.process.spawn
        local spawn_once = Pinnacle.process.spawn_once
        spawn_once(opts.bar)
        spawn_once("kanshi")
        spawn_once("nm-applet")
        spawn_once("udiskie")
        spawn_once("pacwall")
        spawn_once("kidex")
        -- spawn_once("dunst")
        -- spawn_once("tailscale-systray")
        spawn_once("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    end
}
