local opts = require("opts")
-- neovim users be like
require("pinnacle").setup(function(Pinnacle)
    local Input = Pinnacle.input
    local Process = Pinnacle.process
    local Output = Pinnacle.output
    local Tag = Pinnacle.tag
    local Window = Pinnacle.window
    local Layout = Pinnacle.layout
    local Util = Pinnacle.util
    local Snowcap = Pinnacle.snowcap

    require("keybinds").setup(Pinnacle)
    require("outputs").setup(Pinnacle)


    -- If you want to declare output locations as well, you can use `Output.setup_locs`.
    -- This will additionally allow you to recalculate output locations on signals like
    -- output connect, disconnect, and resize.
    --
    -- Read the admittedly scuffed docs for more.

    local layout_manager = Layout.new_cycling_manager({
        Layout.builtins.master_stack(),
        -- Layout.builtins.master_stack({ master_side = "right" }),
        -- Layout.builtins.master_stack({ master_side = "top" }),
        -- Layout.builtins.master_stack({ master_side = "bottom" }),
        Layout.builtins.dwindle(),
        -- Layout.builtins.spiral(),
        -- Layout.builtins.corner(),
        -- Layout.builtins.corner({ corner_loc = "top_right" }),
        -- Layout.builtins.corner({ corner_loc = "bottom_left" }),
        -- Layout.builtins.corner({ corner_loc = "bottom_right" }),
        -- Layout.builtins.fair(),
        -- Layout.builtins.fair({ direction = "horizontal" }),
    })

    Layout.set_manager(layout_manager)

    Input.set_libinput_settings(opts.libinput)

    Window.connect_signal({
        pointer_enter = function(window)
            window:set_focused(true)
        end,
    })

    Window.add_window_rule({
        cond = {
            all = {},
        },
        rule = {
            decoration_mode = "client_side",
        },
    })

    for k, v in pairs(opts.env) do
        Process.set_env(k, v)
    end

    print("Switching to tag " .. (opts.tags[1].name or "1"))
    Tag.get(opts.tags[1].name or "1"):switch_to()

    print("Running autostarts")
    require("autostart").setup(Pinnacle)
end)
