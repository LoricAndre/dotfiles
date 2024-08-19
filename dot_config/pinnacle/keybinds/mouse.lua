local opts = require "opts"
return {
    setup = function(Pinnacle)
        local Input = Pinnacle.input
        local Window = Pinnacle.window
        local mod_key = opts.mod

        Input.mousebind({ mod_key }, "btn_left", "press", function()
            Window.begin_move("btn_left")
        end)

        Input.mousebind({ mod_key }, "btn_right", "press", function()
            Window.begin_resize("btn_right")
        end)
    end
}
