local M = {}

local opts = require("opts")


M.setup = function(Pinnacle)
    local Input = Pinnacle.input
    local Process = Pinnacle.process
    local Window = Pinnacle.window
    local Snowcap = Pinnacle.snowcap
    local key = Input.key

    local terminal = opts.terminal

    ---@type Modifier
    local mod_key = opts.mod
    -- Change the mod key to "alt" when running as a nested window
    if Pinnacle.backend() == "window" then
        mod_key = "alt"
    end

    if Snowcap then
        Input.keybind({ mod_key }, "s", function()
            Snowcap.integration.keybind_overlay():show()
        end, {
            group = "Compositor",
            description = "Show the keybind overlay",
        })
    end

    Input.keybind({ mod_key, "shift" }, "q", function()
        if Snowcap then
            Snowcap.integration.quit_prompt():show()
        else
            Pinnacle.quit()
        end
    end, {
        group = "Compositor",
        description = "Quit Pinnacle",
    })

    Input.keybind({ mod_key, "ctrl" }, "r", function()
        Pinnacle.reload_config()
    end, {
        group = "Compositor",
        description = "Reload the config",
    })

    Input.keybind({ mod_key }, "q", function()
        local focused = Window.get_focused()
        if focused then
            focused:close()
        end
    end, {
        group = "Window",
        description = "Close the focused window",
    })

    Input.keybind({ mod_key }, key.Return, function()
        Process.spawn(terminal)
    end, {
        group = "Process",
        description = "Spawn `" .. terminal .. "`",
    })

    Input.keybind({ mod_key }, "b", function()
        Process.spawn(opts.browser)
    end, {
        group = "Process",
        description = "Spawn `" .. opts.runner .. "`",
    })

    Input.keybind({ mod_key }, "d", function()
        Process.spawn(opts.runner)
    end, {
        group = "Process",
        description = "Spawn `" .. opts.runner .. "`",
    })

    Input.keybind({ "ctrl", "alt" }, "l", function()
        Process.spawn(opts.lock)
    end, {
        group = "Process",
        description = "Lock screen using `" .. opts.lock .. "`",
    })

    Input.keybind({ mod_key, "ctrl" }, key.space, function()
        local focused = Window.get_focused()
        if focused then
            focused:toggle_floating()
            focused:raise()
        end
    end, {
        group = "Window",
        description = "Toggle floating on the focused window",
    })

    -- mod_key + f = Toggle fullscreen
    Input.keybind({ mod_key }, "f", function()
        local focused = Window.get_focused()
        if focused then
            focused:toggle_fullscreen()
            focused:raise()
        end
    end, {
        group = "Window",
        description = "Toggle fullscreen on the focused window",
    })

    -- mod_key + m = Toggle maximized
    Input.keybind({ mod_key }, "z", function()
        local focused = Window.get_focused()
        if focused then
            focused:toggle_maximized()
            focused:raise()
        end
    end, {
        group = "Window",
        description = "Toggle maximized on the focused window",
    })

    local dirs = {
        right = "m",
        left  = "j",
        up    = "l",
        down  = "k"
    }
    for dir, dir_key in pairs(dirs) do
        Input.keybind({ mod_key }, dir_key, function()
            local win_on_dir = require("utils").get_window_on(Pinnacle, dir)
            if win_on_dir then
                win_on_dir:set_focused(true)
            end
        end, {
            group = "Tag",
            description = "Focus window on " .. dir
        })
    end

    require("keybinds.mouse").setup(Pinnacle)
    require("keybinds.tags").setup(Pinnacle)
end

return M
