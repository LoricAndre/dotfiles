local M = {}

local opts = require("opts")
local mod_key = opts.mod
local tag_names = {}
for i, tag in pairs(opts.tags) do
    local name = tag.name or tostring(i)
    table.insert(tag_names, name)
end

M.setup = function(Pinnacle)
    local Tag = Pinnacle.tag
    local Input = Pinnacle.input

    local key = Input.key

    Pinnacle.output.connect_for_all(function(output)
        -- Set tags
        local tags = Tag.add(output, tag_names)
        tags[1]:switch_to()
        -- keybinds
        Input.keybind({ mod_key, "shift" }, "=", function()
            output:increase_scale(0.1)
        end, {
            group = "Output",
            description = "Increase output scale"
        })
        Input.keybind({ mod_key }, "-", function()
            output:decrease_scale(0.1)
        end, {
            group = "Output",
            description = "Decrease output scale"
        })
        Input.keybind({ mod_key }, "=", function()
            output:set_scale(1)
        end, {
            group = "Output",
            description = "Reset output scale"
        })

        Input.keybind({ mod_key }, key.left, function()
            require("utils").get_output_on("left")
        end, {
            group = "Output",
            description = "Reset output scale"
        })
    end)
end

return M
